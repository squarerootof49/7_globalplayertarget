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

Locale = {
        ['it'] = {
                --Generali
                ['playerNoHandsup'] = 'Il giocatore non ha le mani alzate!',
                ['playerNoGun'] = 'Devi avere un\'arma in mano!',
                ['playerTooFar'] = 'Il giocatore è troppo lontano!',

                --Perquisire
                ['searchPlayerLabel'] = 'Perquisici',
                ['searchPlayerNotifTitle'] = 'Perquisici giocatore',
                ['searchPlayerProgbarLabel'] = 'Perquisendo giocatore...',

                --Legare (INUTILIZZATO, IN VIA DI SVILUPPO)
                ['tieHandsLabel'] = 'Lega mani',
                ['tieHandsNotifTitle'] = 'Lega mani giocatore',
                ['tieHandsTooFar'] = 'Il giocatore è troppo lontano!',
                ['tieHandsNoItem'] = 'Devi avere delle fascette!',
                ['tieHandsProgbarLabel'] = 'Legando mani al giocatore...',
        },
        
        ['en'] = {
                --General
                ['playerNoHandsup'] = 'Player isn\'t raising their hands!',
                ['playerNoGun'] = 'You need to hold a weapon!',
                ['playerTooFar'] = 'Player is too far!',


                --Search player
                ['searchPlayerLabel'] = 'Search player',
                ['searchPlayerNotifTitle'] = 'Search player',
                ['searchPlayerProgbarLabel'] = 'Searching player...',

                --Tie hands (UNUSED, WIP)
                ['tieHandsLabel'] = 'Tie hands',
                ['tieHandsNotifTitle'] = 'Tie player\'s hands',
                ['tieHandsTooFar'] = 'Player is too far!',
                ['tieHandsNoItem'] = 'You don\'t have any zipties!',
                ['tieHandsProgbarLabel'] = 'Tying player\'s hands...',
        }
}