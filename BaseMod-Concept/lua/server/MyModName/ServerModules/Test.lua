--- Load Server
local Server = require 'MyModName/Server';

---@class ServerModuleTest
local ServerModuleTest = {};

---Send Pong to the server
---@param _player IsoPlayer
function ServerModuleTest.SendPong(_player)
    Server.SendCommand("Pong", {}, _player);
end

--- Add the module to the server object
Server.Modules.Test = ServerModuleTest;
