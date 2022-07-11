--- Load Config
local Config = require "MyModName/Config";

--- Load Utils
local Utils = require "MyModName/Utils";

---@class Server
local Server = {
    Config = Config,
    Utils = Utils,
    Data = {},      -- Global ModData will be stored in this
    Modules = {},   -- Server modules will be stored in this
    Commands = {},  -- Client command handlers will be stored in this
};

---Log data prefixed with the mod name
---@param str string
function Server.Log(str)
    print(Server.Config.ModName .. ": " .. tostring(str));
end

---Send data to one or all clients
---@param command string
---@param data table
---@param _player IsoPlayer
function Server.SendCommand(command, data, _player)
    if not data then data = {}; end 
    if type(data) ~= "table" then error("Invalid 'data' parameter type, can only send 'nil' or 'table' to client(s)."); end

    if instanceof(_player, "IsoPlayer") then
        sendServerCommand(_player, Server.Config.ModName, command, data);
    elseif _player == nil then
        sendServerCommand(Server.Config.ModName, command, data);
    else
        error("Invalid '_player' parameter type.")
    end
end

--- Handle received client commands
local function receiveServerCommand(module, command, player, args)
    if module ~= Server.Config.ModName then return; end

    if type(Server.Commands[command]) == "function" then
        Server.Commands[command](player, args);
    end
end
Events.OnServerCommand.Add(receiveServerCommand);

return Server;
