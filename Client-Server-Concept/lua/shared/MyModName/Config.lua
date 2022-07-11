---@class Config
local Config = {

    ModName = "MyModName",
    ModVersion = "1.0.0",
    ModInfo = {
        Author = "Konijima",
        Discord = "Konijima#9279",
        --- Add custom info to print in the console log
    };

    --- Define Global ModData tables to create on the client
    --- if true, it will always be requested/overwritten by the server
    --- if false, it will only be local
    ClientModData = {
        WorldData = true, -- request from server
        PlayerData = false, -- local only
    },

    --- Define Global ModData tables to create on the server
    ServerModData = {
        "WorldData",
        "PlayerData",
    },

    --- Define custom events to add on the client
    ClientEvents = {
        --- Triggered when the mod Global ModData is done initializing
        --- [ isNewGame:boolean ]
        "OnModDataInitialized",
    },

    --- Define custom events to add on the server
    ServerEvents = {
        --- Triggered when the mod Global ModData is done initializing
        --- [ isNewGame:boolean ]
        "OnModDataInitialized",
    },

};

print("--------------------------------------------------------------------")
print("Initializing " .. Config.ModName .. " version " .. Config.ModVersion);
for k, v in pairs(Config.ModInfo) do
    print(k .. ": " .. v); --- print each mod info to the console log
end
print("--------------------------------------------------------------------")

return Config;
