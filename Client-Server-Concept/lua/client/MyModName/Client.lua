--- Ensure that the mod config is loaded
require "MyModName/Config";

--- Ensure that the mod utils is loaded
require "MyModName/Utils";

--- This is the main client entry file
--- Create our global client object
--- Optional, set as global so that other mods can access it and make modifications
MyModName = {
    Data = {},      -- Global ModData will be stored in this
    Modules = {},   -- Client modules will be stored in this
    Commands = {},  -- Server command handlers will be stored in this
};

--- Method to send data to server
function MyModName.Methods.SendCommand(command, data)
    if not data then data = {}; end 
    if type(data) ~= "table" then error("Invalid 'data' parameter type, can only send 'nil' or 'table' to server."); end

    sendClientCommand(MyModNameConfig.ModName, command, data);
end

--- Handle received server commands
local function receiveServerCommand(module, command, args)
    if module ~= MyModNameConfig.ModName then return; end

    if type(MyModName.Commands[command]) == "function" then
        MyModName.Commands[command](args);
    end
end
Events.OnServerCommand.Add(receiveServerCommand);
