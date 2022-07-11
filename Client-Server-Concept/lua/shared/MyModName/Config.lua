---@class Config
local Config = {

    ModName = "MyModName",
    ModVersion = "1.0.0",

    --- Define custom events to add on the client
    ClientEvents = {

        --- Triggered when the mod Global ModData is done initializing
        --- [ isNewGame:boolean ]
        "OnModDataInitialized",

        --- Triggered when a player has spawned and re-spawned
        --- [ player:IsoPlayer, isNewCharacter:boolean ]
        "OnPlayerSpawned",

        --- Triggered when a player has died
        --- [ player:IsoPlayer ]
        "OnPlayerDied",

    },

    --- Define custom events to add on the server
    ServerEvents = {

        --- Triggered when the mod Global ModData is done initializing
        --- [ isNewGame:boolean ]
        "OnModDataInitialized",

        --- Triggered when a player has connected and exist in the world
        --- [ player:IsoPlayer, isNewPlayer:boolean ]
        "OnPlayerConnected",

        --- Triggered when a player has disconnected
        --- [ player:IsoPlayer ]
        "OnPlayerDisconnected",

        --- Triggered when a player has spawned and re-spawned
        --- [ player:IsoPlayer, isNewCharacter:boolean ]
        "OnPlayerSpawned",

        --- Triggered when a player has died
        --- [ player:IsoPlayer ]
        "OnPlayerDied",

    },

};

print("Initializing " .. Config.ModName .. " version " .. Config.ModVersion);

return Config;
