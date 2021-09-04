--[[   
  _____                ____           _        _      _   
 | ____|__ _ ___ _   _|  _ \ ___  ___| |_ _ __(_) ___| |_ 
 |  _| / _` / __| | | | |_) / _ \/ __| __| '__| |/ __| __|
 | |__| (_| \__ \ |_| |  _ <  __/\__ \ |_| |  | | (__| |_ 
 |_____\__,_|___/\__, |_| \_\___||___/\__|_|  |_|\___|\__|
                 |___/                                    
]]

local basewithd, baseheight = ScrW() * 0.32, ScrH() * 0.45

local function openFrame(len)
    -- Base frame
    local frame = vgui.Create("DFrame")
    frame:SetSize(basewithd, baseheight)
    frame:SetMinimumSize(ScrW() * 0.20, ScrH() * 0.15)
    frame:SetDraggable(true)
    frame:SetSizable(true)
    frame:SetScreenLock(true)
    frame:MakePopup()
    frame:SetTitle("Easy Restrict")
    frame:Center()

    local check_status = frame:Add("DCheckBoxLabel")
    check_status:SetPos(frame:GetWide() - 205, 6)
    check_status:SetText("Restrict Status")
    check_status:SetValue(GetConVar("er_restrict"):GetBool())
    check_status.OnChange = function(_, bVal)
        net.Start("EasyRestrict::toggleStatus")
        net.WriteBool(bVal)
        net.SendToServer()
    end
    -- Tabs 
    local sheet_main = frame:Add("DPropertySheet")
    sheet_main:Dock(FILL)

    local db_values = util.JSONToTable(util.Decompress(net.ReadData(len)))
    -- List 
    local list_whitelists = sheet_main:Add("DListView")
    list_whitelists:Dock(FILL)
    list_whitelists:AddColumn("Name", 1)
    list_whitelists:AddColumn("SteamID", 2)
    list_whitelists:AddColumn("Date", 3)
    list_whitelists.OnRowRightClick = function(self, lineid, line)
        local options = DermaMenu(line)
        local RmvWithIcon = options:AddOption("Remove", function() 
            net.Start("EasyRestrict::removeEntry")
            net.WriteString(line:GetValue(2))
            net.SendToServer()
            self:RemoveLine(lineid) 
        end)
        RmvWithIcon:SetIcon("icon16/user_delete.png")
        options:Open()
    end

    for _, v in ipairs(db_values) do
        list_whitelists:AddLine(v.name, v.steamid, os.date( "%d/%m/%Y - %H:%M:%S" , v.date ))
    end
    
    -- Adding the lsit to the tabs
    sheet_main:AddSheet("Whitelists", list_whitelists, "icon16/user_go.png")

    
    local button_addwhitelist = sheet_main:Add("DButton")
    button_addwhitelist:Dock(BOTTOM)
    button_addwhitelist:SetText("Add someone to the whitelist")
    button_addwhitelist.DoClick = function()
        -- Disable the button to prevent opening multiples frames
        button_addwhitelist:SetEnabled(false)

        local values = {}
        -- Add an entry panel
        local panel_askvalues = vgui.Create("DFrame")
        panel_askvalues:SetSize(ScrW() * 0.160, ScrH() * 0.160)
        panel_askvalues:SetTitle("Add an entry")
        panel_askvalues:MakePopup()
        panel_askvalues:Center()

        frame.OnClose = function() -- Remove the frame when removing the base frame
            panel_askvalues:Remove()
        end
        
        panel_askvalues.OnRemove = function()
            table.Empty(values)
            if not button_addwhitelist:IsValid() then return end -- prevent nil value 
            button_addwhitelist:SetEnabled(true)
        end

        -- Text "Name"
        local label_name = panel_askvalues:Add("DLabel")
        label_name:SetPos(10, 25)
        label_name:SetText("Name")
        -- identifier input
        local entry_name = panel_askvalues:Add("DTextEntry")
        entry_name:SetPos(10, 50)
        entry_name:SetSize(panel_askvalues:GetWide() - 20, 25)
        entry_name:SetPlaceholderText("Gabe")
        entry_name.OnChange = function(self)
            values.name = self:GetValue()
        end
        -- text "SteamID64"
        local label_steamid = panel_askvalues:Add("DLabel")
        label_steamid:SetPos(10, 80)
        label_steamid:SetText("SteamID64")
        -- steamid64 input
        local entry_steamid = panel_askvalues:Add("DTextEntry")
        entry_steamid:SetPos(10, 105)
        entry_steamid:SetSize(panel_askvalues:GetWide() - 20, 25)
        entry_steamid:SetPlaceholderText("76561197960287930")
        entry_steamid.OnChange = function(self)
            values.steamid = self:GetValue()
        end
        -- Add entry validate button
        local button_validateentry = panel_askvalues:Add("DButton")
        button_validateentry:Dock(BOTTOM)
        button_validateentry:SetText("Add entry")
        button_validateentry.DoClick = function()
            values.date = os.time()
            net.Start("EasyRestrict::addEntry")
            local compressed = util.Compress(util.TableToJSON(values))
            net.WriteData(compressed, #compressed)
            net.SendToServer()
            list_whitelists:AddLine(values.name, values.steamid, os.date( "%d/%m/%Y - %H:%M:%S" , values.date ))
            panel_askvalues:Remove()
        end
    end 

    

end

net.Receive("EasyRestrict::openMenu", openFrame)

-- Please do not remove theses line