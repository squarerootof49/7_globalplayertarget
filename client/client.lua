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

exports.ox_target:addGlobalPlayer({
    {
        name = 'ox_target:searchPlayer',
        icon = 'fa-solid fa-hand',
        label = Locale[Config.locale]['searchPlayerLabel'],
        distance = Config.targetDistance,
        onSelect = function(data)

            --Player search's target player entity for checks 
            local searchEntity = data.entity

            --ServerID of player search's target player, for server checks
		    local searchTarget = GetPlayerServerId(NetworkGetPlayerIndexFromPed(searchEntity))

            --Handsup check
			if not IsRaisingHands(searchEntity) then 
				TriggerEvent("7_globalPlayerTarget:notify", Locale[Config.locale]['searchPlayerNotifTitle'], Locale[Config.locale]['playerNoHandsup'], 'error', 5000)
				return
			end

            --Run checks
            local checks = lib.callback.await("7_globalPlayerTarget:runChecks", false, searchTarget)

            --Store our state
            local isSearching = checks

            --If we didn't pass the checks, don't search
            if not isSearching then
                return
            end

            --Disarm the player
            TriggerEvent('ox_inventory:disarm', cache.playerId, true)

            if lib.progressBar({
                duration = Config.timeToSearch,
                label = Locale[Config.locale]['searchPlayerProgbarLabel'],
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                    sprint = true,
                    combat = true,
                },
                anim = {
                    dict = 'anim@gangops@facility@servers@bodysearch@',
                    clip = 'player_search',
                }
            }) then
                --Effective target player search
                TriggerServerEvent("7_globalPlayerTarget:searchPlayer", searchTarget)
            else
                return
            end

            --Thread to close inventory if target puts their hands down
            CreateThread(function()
                while isSearching do
                    --Statebag to check if inventory is open or not
                    local invOpen = LocalPlayer.state.invOpen

                    --Close searcher inventory if target isn't raising hands. Checks with invOpen to ensure some security
                    if not IsRaisingHands(searchEntity) and invOpen then
                        inv:closeInventory()
                        isSearching = false
                    end
                Wait(500)
                end
            end)
        end
    },
    {
        -- WIP
        name = 'ox_target:tieHands',
        icon = 'fa-solid fa-hands-bound',
        label = Locale[Config.locale]['tieHandsLabel'],
        distance = Config.targetDistance,
        onSelect = function(data)
            --Hand tie's target player entity for checks 
            local tieEntity = data.entity

            --ServerID of hand tie's target player, for server checks
		    local tieTarget = GetPlayerServerId(NetworkGetPlayerIndexFromPed(tieEntity))

            --Handsup check
			if not IsRaisingHands(tieEntity) then 
				TriggerEvent("7_globalPlayerTarget:notify", Locale[Config.locale]['tieHandsNotifTitle'], Locale[Config.locale]['playerNoHandsup'], 'error', 5000)
				return
			end

            --Run checks
            local checks = lib.callback.await("7_globalPlayerTarget:runChecks", false, tieTarget)

            --If we didn't pass the checks, don't tie
            if not checks then
                return
            end

            if lib.progressBar({
                duration = Config.timeToTie,
                label = Locale[Config.locale]['tieHandsProgbarLabel'],
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                    sprint = true,
                    combat = true,
                },
                anim = {
                    dict = 'anim@gangops@facility@servers@bodysearch@',
                    clip = 'player_search',
                }
            }) then
                --Effective target player tieHands
                
            else
                return
            end
        end
    },
})


