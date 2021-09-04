--[[
  _____                ____           _        _      _   
 | ____|__ _ ___ _   _|  _ \ ___  ___| |_ _ __(_) ___| |_ 
 |  _| / _` / __| | | | |_) / _ \/ __| __| '__| |/ __| __|
 | |__| (_| \__ \ |_| |  _ <  __/\__ \ |_| |  | | (__| |_ 
 |_____\__,_|___/\__, |_| \_\___||___/\__|_|  |_|\___|\__|
                 |___/                                    
                               
]]

EasyRestrict = EasyRestrict or {}
EasyRestrict.Config = EasyRestrict.Config or {}

-- The message shown by the player when trying to join ther server under restricted mode
EasyRestrict.Config.kickMessage = "The server is under restricted mode, please try again later !"

-- The usergroups that are allowed to use the addon
EasyRestrict.Config.allowedGroups = {
  ["superadmin"] = true,
  ["admin"] = true,
  ["operator"] = true
}

