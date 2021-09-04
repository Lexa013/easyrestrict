--[[   
  _____                ____           _        _      _   
 | ____|__ _ ___ _   _|  _ \ ___  ___| |_ _ __(_) ___| |_ 
 |  _| / _` / __| | | | |_) / _ \/ __| __| '__| |/ __| __|
 | |__| (_| \__ \ |_| |  _ <  __/\__ \ |_| |  | | (__| |_ 
 |_____\__,_|___/\__, |_| \_\___||___/\__|_|  |_|\___|\__|
                 |___/                                    
]]

util.AddNetworkString("EasyRestrict::openMenu")
util.AddNetworkString("EasyRestrict::addEntry")
util.AddNetworkString("EasyRestrict::removeEntry")
util.AddNetworkString("EasyRestrict::toggleStatus")

net.Receive("EasyRestrict::addEntry", function(len, ply)
    if not ER.PlayerHaveAccess(ply) then return end
    local table = util.JSONToTable(util.Decompress(net.ReadData(len)))
    ER.AddPlayerToWhitelist(table.name, table.steamid, table.date)
end)

net.Receive("EasyRestrict::removeEntry", function(len, ply)
    if not ER.PlayerHaveAccess(ply) then return end
    local steamid = net.ReadString()
    ER.RemovePlayerFromWhitelist(steamid)
end)

net.Receive("EasyRestrict::toggleStatus", function(len, ply)
    if not ER.PlayerHaveAccess(ply) then return end
    local bool = net.ReadBool()
    local convar = GetConVar("er_restrict")
    convar:SetBool(bool)  
end)

