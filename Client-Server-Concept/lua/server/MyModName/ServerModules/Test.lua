--- Load Server
local Server = require 'MyModName/Server';

---@class TestServerModule
local TestServerModule = {};

---Send Pong to the server
---@param _player IsoPlayer
function TestServerModule.SendPong(_player)
    Server.SendCommand("Pong", {}, _player);
end

--- Set the module
Server.Modules.Test = TestServerModule;
