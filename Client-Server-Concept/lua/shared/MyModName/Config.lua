---@class Config
local Config = {

    ModName = "MyModName",
    ModVersion = "1.0.0",

    --- Define custom events to add on the client
    ClientEvents = {
        "OnModDataInitialized",     -- [ isNewGame:boolean ]
        "OnNewPlayerCreated",       -- [ player:IsoPlayer ]
        "OnPlayerSpawned",          -- [ player:IsoPlayer ]
        "OnPlayerDied",             -- [ player:IsoPlayer ]
    },

    --- Define custom events to add on the server
    ServerEvents = {
        "OnModDataInitialized",     -- [ isNewGame:boolean ]
        "OnPlayerConnected",        -- [ player:IsoPlayer ]
        "OnPlayerDied",             -- [ player:IsoPlayer ]
        "OnPlayerDisconnected",     -- [ player:IsoPlayer ]
    },

};

print("Initializing " .. Config.ModName .. " version " .. Config.ModVersion);

return Config;
