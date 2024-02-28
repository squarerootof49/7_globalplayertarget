
--[[

 ____                       _        ____ _       _           _ 
/ ___|  _____   _____ _ __ ( )___   / ___| | ___ | |__   __ _| |
\___ \ / _ \ \ / / _ \ '_ \|// __| | |  _| |/ _ \| '_ \ / _` | |
 ___) |  __/\ V /  __/ | | | \__ \ | |_| | | (_) | |_) | (_| | |
|____/ \___| \_/ \___|_| |_| |___/__\____|_|\___/|_.__/ \__,_|_|
|  _ \| | __ _ _   _  ___ _ __  |_   _|_ _ _ __ __ _  ___| |_   
| |_) | |/ _` | | | |/ _ \ '__|   | |/ _` | '__/ _` |/ _ \ __|  
|  __/| | (_| | |_| |  __/ |      | | (_| | | | (_| |  __/ |_   
|_|   |_|\__,_|\__, |\___|_|      |_|\__,_|_|  \__, |\___|\__|  
               |___/                           |___/            

--]]

--For support: azazel98x on Discord
--Supporto: azazel98x su Discord

local inv = exports.ox_inventory


lib.callback.register("sn_globalPlayerTarget:searchPlayer", function(source, target)
	--Saving source for tick safety, unsure how this works. Can i just use source all over?
	local playerID = source

	--Gets distance
	local playerPos = GetEntityCoords(GetPlayerPed(playerID))
	local targetPos = GetEntityCoords(GetPlayerPed(target))
	local distance = #(playerPos - targetPos)

	--Held weapon check
	if not inv:GetCurrentWeapon(playerID) then
		TriggerClientEvent("sn_globalPlayerTarget:notify", playerID, Locale[Config.locale]['searchPlayerNotifTitle'], Locale[Config.locale]['searchPlayerNoGun'], 'error', 5000)
		return false
	end

	--Distance check
	if distance > Config.searchPlayerDistance then
		TriggerClientEvent("sn_globalPlayerTarget:notify", playerID, Locale[Config.locale]['searchPlayerNotifTitle'], Locale[Config.locale]['searchPlayerTooFar'], 'error', 5000)
		return false
	end

	--Progbar trigger
	local progbarSuccess = lib.callback.await('sn_globalPlayerTarget:progbar', source, Config.timeToSearch, Locale[Config.Locale]['searchPlayerProgbarLabel'], 'anim@gangops@facility@servers@bodysearch@', 'player_search')

	if progbarSuccess then 
		inv:forceOpenInventory(playerID, 'player', target)
		return true
	end
end)