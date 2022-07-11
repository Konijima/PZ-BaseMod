--- Load Config
local Config = require "MyModName/Config";

--- Load Utils
local Utils = require "MyModName/Utils";

--- This is the main client entry file
--- Create our global client object
--- Optional, set as global so that other mods can access it and make modifications
local Client = {
    Config = Config,
    Utils = Utils,
    Data = {},      -- Global ModData will be stored in this
    Modules = {},   -- Client modules will be stored in this
    Commands = {},  -- Server command handlers will be stored in this
};

--- Method to send data to server
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
