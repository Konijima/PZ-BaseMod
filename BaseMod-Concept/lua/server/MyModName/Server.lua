--- Load Config
local Config = require "MyModName/Config";

--- Load Utils
local Utils = require "MyModName/Utils";

---@class ModServer
local ModServer = {
    Config = Config,    -- Reference to the mod Config class
    Utils = Utils,      -- Reference to the mod Utils class
    Data = {},          -- Global ModData will be stored in this
    Modules = {},       -- Server modules will be stored in this
    Commands = {},      -- Client command handlers will be stored in this
};

---Log data prefixed with the mod name
---@param str string
function ModServer.Log(str)
    print(ModServer.Config.ModName .. ": " .. tostring(str));
end

---Send data to one or all clients
---@param command string
---@param data table
---@param _player IsoPlayer
function ModServer.SendCommand(command, data, _player)
    if not data then data = {}; end 
    if type(data) ~= "table" then error("Invalid 'data' parameter type, can only send 'nil' or 'table' to client(s)."); end

    if instanceof(_player, "IsoPlayer") then
        sendServerCommand(_player, ModServer.Config.ModName, command, data);
    elseif _player == nil then
        sendServerCommand(ModServer.Config.ModName, command, data);
    else
        error("Invalid '_player' parameter type.")
    end
end

--- Handle received client commands
local function receiveServerCommand(module, command, player, args)
    if module ~= ModServer.Config.ModName then return; end

    if type(ModServer.Commands[command]) == "function" then
        ModServer.Commands[command](player, args);
    end
end
Events.OnServerCommand.Add(receiveServerCommand);

return ModServer;
