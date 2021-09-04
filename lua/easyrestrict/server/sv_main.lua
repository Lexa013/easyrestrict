--[[   
  _____                ____           _        _      _   
 | ____|__ _ ___ _   _|  _ \ ___  ___| |_ _ __(_) ___| |_ 
 |  _| / _` / __| | | | |_) / _ \/ __| __| '__| |/ __| __|
 | |__| (_| \__ \ |_| |  _ <  __/\__ \ |_| |  | | (__| |_ 
 |_____\__,_|___/\__, |_| \_\___||___/\__|_|  |_|\___|\__|
                 |___/                                    
]]

print("Er_add should be loaded")

concommand.Add("er_add", function(ply, cmd, args)
  	if ply:IsValid() then ply:ChatPrint( 'This command is only allowed from server console !' ) return end

	if(#args < 2) then
		print("Syntax: er_add <string:identifier> <ulong:steamid64>")
		return 
	end

	ER.AddPlayerToWhitelist(args[1], args[2], os.time())
	print(args[2].. " successfully added to the whitelist with the identifier: " ..args[1])
end)
