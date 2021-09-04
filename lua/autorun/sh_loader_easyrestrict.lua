--[[   
  _____                ____           _        _      _   
 | ____|__ _ ___ _   _|  _ \ ___  ___| |_ _ __(_) ___| |_ 
 |  _| / _` / __| | | | |_) / _ \/ __| __| '__| |/ __| __|
 | |__| (_| \__ \ |_| |  _ <  __/\__ \ |_| |  | | (__| |_ 
 |_____\__,_|___/\__, |_| \_\___||___/\__|_|  |_|\___|\__|
                 |___/                                    
]]     
         
-- Shared Files to Server & CLient                

if SERVER then

-- Send Shared/Client Files to the client
    AddCSLuaFile("easyrestrict/sh_config_easyrestrict.lua")
    AddCSLuaFile("easyrestrict/client/cl_main.lua")
    AddCSLuaFile("easyrestrict/sh_convar.lua")

--Server Files
    include("easyrestrict/sh_config_easyrestrict.lua")
    include("easyrestrict/server/sv_main.lua")
    include("easyrestrict/server/sv_function.lua")
    include("easyrestrict/server/sv_hook.lua")
    include("easyrestrict/server/sv_networking.lua")
    include("easyrestrict/sh_convar.lua")
else
    include("easyrestrict/sh_config_easyrestrict.lua")
    include("easyrestrict/client/cl_main.lua")
    include("easyrestrict/sh_convar.lua")
end




