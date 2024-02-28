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


local isSearching, searchEntity

exports.ox_target:addGlobalPlayer({
    {
        name = 'ox_target:searchPlayer',
        icon = 'fa-solid fa-hand',
        label = Locale[Config.locale]['searchPlayerLabel'],
        distance = Config.targetDistance,
        onSelect = function(data)

            --Entity carryover for handsdown thread 
            searchEntity = data.entity

            --ServerID of player search's target player, for server checks
		    local searchTarget = GetPlayerServerId(NetworkGetPlayerIndexFromPed(searchEntity))

            --Hash of player's weapon, for server checks
			local weaponHash = cache.weapon --TODO: check weapon on the server to avoid script kids opening an inventory with no weapon (weirdge but ok)

            --Handsup check
			if not IsRaisingHands(searchEntity) then 
				TriggerEvent("sn_globalPlayerTarget:notify", Locale[Config.locale]['searchPlayerNotifTitle'], Locale[Config.locale]['searchPlayerNoHandsup'], 'error', 5000)
				return
			end

            --Effective target player search, with cb to avoid permanent inventory closing
			lib.callback("sn_globalPlayerTarget:searchPlayer", false, function(cb)
                isSearching = cb
            end, searchTarget)
        end
    },
    {
        name = 'ox_target:searchPlayer',
        icon = 'fa-solid fa-hands-bound',
        label = Locale[Config.locale]['tieHandsLabel'],
        distance = Config.targetDistance,
        onSelect = function(data)

        end
    },
})

--Target handsdown thread
CreateThread(function()
    while true do
        --Statebag to check if inventory is open or not
        local invOpen = LocalPlayer.state.invOpen

        --Multiple checks to ensure maximum closeInventory security
        if isSearching and not IsRaisingHands(searchEntity) and invOpen then
                exports.ox_inventory:closeInventory()
                isSearching = false
        end
    Wait(500)
    end
end)
