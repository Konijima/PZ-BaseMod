require "MyModName/Config";

--- This is the main server entry file
--- Create our global server object
--- Optional, set as global so that other mods can access it and make modifications
MyModNameServer = {
    Data = {},      -- Global ModData will be stored in this
    Modules = {},   -- Server modules will be stored in this
    Commands = {},  -- Client command handlers will be stored in this
};

--- Method to send data to client
--- 'player' parameter is optional, if 'nil' it will send to all connected clients
function MyModNameServer.Methods.SendCommand(command, data, player)
    if not data then data = {}; end 
    if type(data) ~= "table" then error("Invalid 'data' parameter type, can only send 'nil' or 'table' to client(s)."); end

    if instanceof(player, "IsoPlayer") then
        sendServerCommand(player, MyModNameConfig.ModName, command, data);
    elseif player == nil then
        sendServerCommand(MyModNameConfig.ModName, command, data);
    else
        error("Invalid 'player' parameter type.")
    end
end

--- Handle received client commands
local function receiveServerCommand(module, command, player, args)
    if module ~= MyModNameConfig.ModName then return; end

    if type(MyModNameServer.Commands[command]) == "function" then
        MyModNameServer.Commands[command](player, args);
    end
end
Events.OnServerCommand.Add(receiveServerCommand);
