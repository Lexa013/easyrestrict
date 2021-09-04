--[[   
  _____                ____           _        _      _   
 | ____|__ _ ___ _   _|  _ \ ___  ___| |_ _ __(_) ___| |_ 
 |  _| / _` / __| | | | |_) / _ \/ __| __| '__| |/ __| __|
 | |__| (_| \__ \ |_| |  _ <  __/\__ \ |_| |  | | (__| |_ 
 |_____\__,_|___/\__, |_| \_\___||___/\__|_|  |_|\___|\__|
                 |___/                                    
]]


hook.Add("PlayerSay", "EasyRestrict::OpenCommand", function(ply, text)
  if string.lower( text ) ~= "/restrict" then return end

      if ER.PlayerHaveAccess(ply) then
        local compressed = util.Compress(util.TableToJSON(ER.GetDatabase()))

        net.Start("EasyRestrict::OpenMenu")
        ply:ChatPrint("Retrieving authorized players...")
        net.WriteData(compressed, #compressed)
        net.Send(ply)
      else
        ply:ChatPrint("Access denied !")
      end

  return ""
end)

hook.Add("CheckPassword", "EasyRestrict::CheckPassword", function(steamid, ip)
  if not GetConVar("er_restrict"):GetBool() then return end
  local found = nil
  for _, v in ipairs(ER.GetDatabase()) do
    if v.steamid == steamid then
      found = v
      break
    end
  end
  
  if not found then return false, EasyRestrict.Config.kickMessage end
end)

hook.Add("PlayerInitialSpawn", "EasyRestrict::Credits", function(ply)
  ply:SendLua("print( 'This server is using EasyRestrict created by Lexa (github.com/Lexa013/easyrestrict)' )")
end)


