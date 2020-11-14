--[[   
  _____                ____           _        _      _   
 | ____|__ _ ___ _   _|  _ \ ___  ___| |_ _ __(_) ___| |_ 
 |  _| / _` / __| | | | |_) / _ \/ __| __| '__| |/ __| __|
 | |__| (_| \__ \ |_| |  _ <  __/\__ \ |_| |  | | (__| |_ 
 |_____\__,_|___/\__, |_| \_\___||___/\__|_|  |_|\___|\__|
                 |___/                                    
]]


hook.Add("PlayerSay", "EasyRestrict::OpenCommand", function(ply, text)
  if string.lower( text ) != "/restrict" then return end
  CAMI.PlayerHasAccess(ply, "er use", function( hasaccess )
      if hasaccess then
        net.Start("EasyRestrict::OpenMenu")
        local compressed = util.Compress(util.TableToJSON(ER.GetDatabase()))
        ply:ChatPrint("Retrieving authorized players...")
        net.WriteData(compressed, #compressed)
        net.Send(ply)
      else
        ply:ChatPrint("You don't have access to this permission")
      end
  end)
  return ""
end)

hook.Add("CheckPassword", "EasyRestrict::CheckPassword", function(steamid, ip)
  if not GetConVar("er_restrict"):GetBool() then return end
  if not table.HasValue(ER.GetDatabase(), steamid) then
    return false, EasyRestrict.Config.kickMessage
  end
end)

hook.Add("PlayerInitialSpawn", "EasyRestrict::Credits", function(ply)

end)


