---@class Config
local Config = {

    ModName = "MyModName",
    ModVersion = "1.0.0",

    --- Define which custom event to add in the client
    ClientEvents = {

    },

    --- Define which custom event to add in the server
    ServerEvents = {
        
    },

};

print("Initializing " .. Config.ModName .. " version " .. Config.ModVersion);

return Config;
