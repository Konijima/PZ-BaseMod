--- Load Config
local Config = require "MyModName/Config";

--- Load Utils
local Utils = require "MyModName/Utils";

---@class Client
local Client = {
    Config = Config,    -- Reference to the mod Config class
    Utils = Utils,      -- Reference to the mod Utils class
    Data = {},          -- Global ModData will be stored in this
    Modules = {},       -- Client modules will be stored in this
    Commands = {},      -- Server command handlers will be stored in this
    TimedActions = {},  -- TimedActions stored in this
    UI = {},            -- UI components stored in this
};

---Define global variable for debugging
---Can access the object in the console window
if isDebugEnabled() then
    MyModName = Client;
end

---Log data prefixed with the mod name
---@param str string
function Client.Log(str)
    print(Client.Config.ModName .. ": " .. tostring(str));
end

---Send data to the server
---@param command string
---@param data table
function Client.SendCommand(command, data)
    if not data then data = {}; end 
    if type(data) ~= "table" then error("Invalid 'data' parameter type, can only send 'nil' or 'table' to server."); end

    sendClientCommand(Client.Config.ModName, command, data);
end

--- Handle received server commands
local function receiveServerCommand(module, command, args)
    if module ~= Client.Config.ModName then return; end

    if type(Client.Commands[command]) == "function" then
        Client.Commands[command](args);
    end
end
Events.OnServerCommand.Add(receiveServerCommand);


return Client;
