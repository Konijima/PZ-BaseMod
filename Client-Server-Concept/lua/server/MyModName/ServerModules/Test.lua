--- Load Server
local Server = require 'MyModName/Server';

---@class TestServerModule
local TestServerModule = {};

---Send Pong to the server
function TestServerModule.SendPong()
    Server.SendCommand("Pong");
end

--- Set the module
Server.Modules.Test = TestServerModule;
