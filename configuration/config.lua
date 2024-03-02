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

Config = {}

Config.debug = true                                 --Prints some stuff on the server for debug purposes.

--General configuration
Config.locale = 'en'                                --Language. Current options: 'en' | 'it'
Config.useCustomNotification = false                 --Wether (false) or not (true) to use ox_lib's notifications. If true, check functions.lua in the client folder.
Config.targetDistance = 2                           --Distance at which the target menu is visible. You might wanna change this.

--Player search configuration
Config.timeToSearch = 3 * 1000                      --Time (in seconds) it takes to open a player's inventory when searching them. Only change the single-digit number.
Config.raiseHandsDict = 'random@mugging3'           --The animation dictionary for the handsup animation your animation script uses. If unsure, contact your animation script's developer.
Config.raiseHandsAnim = 'handsup_standing_base'     --The animation for the handsup animation your animation script uses. If unsure, contact your animation script's developer.
Config.searchPlayerDistance = 1                     --Distance at which players are able to search other players. You most likely won't need to change this.

--Player tie/untie hands configuration [WIP - UNUSED]
Config.timeToTie = 2 * 1000                         --Time (in seconds) it takes to tie a player's hands. Only change the single-digit number.
Config.timeToUntie = 1 * 1000                      --Time (in seconds) it takes to untie a player's hands. Only change the single-digit number.
Config.ziptieItemName = 'ziptie'                    --Your ox_inventory ziptie item name. If you installed the items following the installation i provided, there's no need to change this.
Config.wirecutItemName = 'wirecutters'              --Your ox_inventory wirecutters item name. If you installed the items following the installation i provided, there's no need to change this.
Config.ziptieSkillcheck = false                     --Wether (true) or not (false) to allow the target to try to escape when their hands are being tied
