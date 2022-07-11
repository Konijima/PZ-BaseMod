--- Load Client
local Client = require 'MyModName/Client';

---@class TestClientModule
local TestClientModule = {};

---Send Ping to the server
function TestClientModule.SendPing()
    Client.SendCommand("Ping");
end

--- Set the module
Server.Modules.Test = TestClientModule;
