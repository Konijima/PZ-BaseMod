---@class Config
local Config = {

    ModName = "MyModName",
    ModVersion = "1.0.0",

    --- Define which custom event to add in the client
    ClientEvents = {
        "OnModDataInitialized",

        "OnNewPlayerCreated",
        "OnPlayerSpawned",
        "OnPlayerDied",
    },

    --- Define which custom event to add in the server
    ServerEvents = {
        "OnModDataInitialized",

        "OnNewPlayerConnected",
        "OnPlayerConnected",
        "OnPlayerDied",
        "OnPlayerDisconnected",
    },

};

print("Initializing " .. Config.ModName .. " version " .. Config.ModVersion);

return Config;
