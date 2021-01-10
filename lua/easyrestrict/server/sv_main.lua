--[[   
  _____                ____           _        _      _   
 | ____|__ _ ___ _   _|  _ \ ___  ___| |_ _ __(_) ___| |_ 
 |  _| / _` / __| | | | |_) / _ \/ __| __| '__| |/ __| __|
 | |__| (_| \__ \ |_| |  _ <  __/\__ \ |_| |  | | (__| |_ 
 |_____\__,_|___/\__, |_| \_\___||___/\__|_|  |_|\___|\__|
                 |___/                                    
]]

CAMI.RegisterPrivilege( {Name= "er use", MinAccess= "superadmin", "operator", "administrator", "admin", Description="If player can open EasyRestrict menu." })

concommand.Add("er_add", function(ply, cmd, args)
  if ply:IsValid() then ply:SendLua("print( 'This command is only allowed from server console !' )") return end
      ER.AddPlayerToWhitelist(args[1], args[2], os.time())
end)
