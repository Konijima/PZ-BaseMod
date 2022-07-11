---@class Config
local Config = {

    ModName = "MyModName",
    ModVersion = "1.0.0",

    --- Define custom events to add on the client
    ClientEvents = {
        --- triggered when the mod Global ModData is done initializing
        "OnModDataInitialized",     -- [ isNewGame:boolean ]

        --- 
        "OnPlayerSpawned",          -- [ player:IsoPlayer, isNewCharacter:boolean ]

        --- 
        "OnPlayerDied",             -- [ player:IsoPlayer ]
    },

    --- Define custom events to add on the server
    ServerEvents = {
        --- triggered when the mod Global ModData is done initializing
        "OnModDataInitialized",     -- [ isNewGame:boolean ]

        --- 
        "OnPlayerConnected",        -- [ player:IsoPlayer, isNewPlayer:boolean ]

        --- 
        "OnPlayerDisconnected",     -- [ player:IsoPlayer ]

        --- 
        "OnPlayerSpawned",          -- [ player:IsoPlayer, isNewCharacter:boolean ]

        --- 
        "OnPlayerDied",             -- [ player:IsoPlayer ]
    },

};

print("Initializing " .. Config.ModName .. " version " .. Config.ModVersion);

return Config;
