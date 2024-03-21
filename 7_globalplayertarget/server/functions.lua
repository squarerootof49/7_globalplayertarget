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

--Function to check wether or not player is holding a weapon
function IsHoldingWeapon(playerID)
    --Gets player ped
    local ped = GetPlayerPed(playerID)

    --Gets weapon data & selected weapon
    local weaponData = inv:GetCurrentWeapon(playerID)
    local selectedWeapon = GetSelectedPedWeapon(ped)


    --Conflict + unarmed check
    if not weaponData or selectedWeapon == joaat("WEAPON_UNARMED") or selectedWeapon ~= joaat(weaponData.name) then
        --Debug print
        if Config.debug then
            print("Player unarmed.")
        end
        return
    end

    --Debug print
    if Config.debug then
        print("Held weapon: "..weaponData.name)
    end
	return weaponData
end

--Function to calculate and check distance
function DistanceCheck(playerID, target)
    --Gets and calculates distance
    local playerPos = GetEntityCoords(GetPlayerPed(playerID))
	local targetPos = GetEntityCoords(GetPlayerPed(target))
    local distance = #(playerPos - targetPos)

    --Debug print
    if Config.debug then
        print("Distanza: "..distance)
    end

	return distance > Config.searchPlayerDistance
end