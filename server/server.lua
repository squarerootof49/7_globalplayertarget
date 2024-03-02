
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

--Checks cb
lib.callback.register("sn_globalPlayerTarget:runChecks", function(source, target)
	--Saving source for tick safety, unsure how this works. Can i just use source all over?
	local playerID = source

	--Held weapon check
	if not IsHoldingWeapon(playerID) then
		TriggerClientEvent("sn_globalPlayerTarget:notify", playerID, Locale[Config.locale]['searchPlayerNotifTitle'], Locale[Config.locale]['playerNoGun'], 'error', 5000)
		return false
	end

	--Distance check
	if DistanceCheck(playerID, target) then
		TriggerClientEvent("sn_globalPlayerTarget:notify", playerID, Locale[Config.locale]['searchPlayerNotifTitle'], Locale[Config.locale]['playerTooFar'], 'error', 5000)
		return false
	end

	return true
end)

--Search player event
RegisterNetEvent("sn_globalPlayerTarget:searchPlayer", function(target)
	--Saving source for tick safety, unsure how this works. Can i just use source all over?
	local playerID = source

	--Player search
	inv:forceOpenInventory(playerID, 'player', target)
end)

--Tie hands event
RegisterNetEvent("sn_globalPlayerTarget:tieHands", function(target)
	--Saving source for tick safety, unsure how this works. Can i just use source all over?
	local playerID = source

	--Player search
	inv:forceOpenInventory(playerID, 'player', target)
end)

