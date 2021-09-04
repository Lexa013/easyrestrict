--[[   
  _____                ____           _        _      _   
 | ____|__ _ ___ _   _|  _ \ ___  ___| |_ _ __(_) ___| |_ 
 |  _| / _` / __| | | | |_) / _ \/ __| __| '__| |/ __| __|
 | |__| (_| \__ \ |_| |  _ <  __/\__ \ |_| |  | | (__| |_ 
 |_____\__,_|___/\__, |_| \_\___||___/\__|_|  |_|\___|\__|
                 |___/                                    
]]

ER = ER or {}

function ER.AddPlayerToWhitelist(name, steamid, date)
  sql.Query("CREATE TABLE IF NOT EXISTS easyrestrict(name VARCHAR, steamid INTEGER, date INTEGER);\n\
            INSERT INTO easyrestrict(name, steamid, date) VALUES("..sql.SQLStr(name).." , "..sql.SQLStr(steamid).." , "..sql.SQLStr(date)..");")
end

function ER.RemovePlayerFromWhitelist(steamid)
  sql.Query("CREATE TABLE IF NOT EXISTS easyrestrict(name VARCHAR, steamid INTEGER, date VARCHAR);\n\
            DELETE FROM easyrestrict WHERE `steamid` = "..sql.SQLStr(steamid)..";")
end

function ER.GetDatabase()
  return sql.Query("CREATE TABLE IF NOT EXISTS easyrestrict(name VARCHAR, steamid INTEGER, date VARCHAR);\n\
          SELECT name, steamid, date FROM easyrestrict;") or {}
end

function ER.PlayerHaveAccess(ply)
  return EasyRestrict.Config.allowedGroups[ply:GetUserGroup()]
end
