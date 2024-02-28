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

--Implement your own notification system or use exports/events from your current notification system. Below is provided an example with okokNotify
RegisterNetEvent("sn_globalPlayerTarget:notify", function(notifTitle, notifMsg, notifType, notifDuration)

    --Defaults to ox lib if Config.useCustomNotification is set to false
    if not Config.useCustomNotification then
        if type == 'info' then type = 'inform' end
        lib.notify({
            title = notifTitle,
            description = notifMsg,
            type = notifType,
            duration = notifDuration,
        })
        return
    end

	exports['okokNotify']:Alert(notifTitle, notifMsg, notifDuration, notifType, true) --okokNotify example
end)

lib.callback.register("sn_globalPlayerTarget:progbar", function(progbarDuration, progbarLabel, progbarAnimDict, progbarAnim)

    --Defaults to ox lib if Config.useCustomProgbar is set to false
    if not Config.useCustomProgbar then
        if lib.progressBar({
            duration = progbarDuration,
            label = progbarLabel,
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = progbarAnimDict,
                clip = progbarAnim,
            }
        }) then
            return true
        else
            return false
        end
    else
        --Implement custom progbar here. Should return true/false depending if progbar finishes or not.
    end
end)

--Function to check wether or not entity is playing handsup animation
function IsRaisingHands(entity)
	return IsEntityPlayingAnim(entity, Config.raiseHandsDict, Config.raiseHandsAnim, 1)
end