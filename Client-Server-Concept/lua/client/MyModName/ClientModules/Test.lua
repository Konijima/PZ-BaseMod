--- Load Client
local Client = require 'MyModName/Client';

---@class TestClientModule
local TestClientModule = {};

---Send Ping to the server
function TestClientModule.SendPing()
    Client.SendCommand("Ping");
end

---Queue TemplateAction to a local player
---@param player IsoPlayer
function TestClientModule.QueueTemplateAction(player)
    if not instanceof(player, "IsoPlayer") or player:isDead() or not player:isLocalPlayer() then return; end

    local timedAction = Client.TimedActions.TemplateAction:new(player);
    ISTimedActionQueue.add(timedAction);
end

--- Set the module
Server.Modules.Test = TestClientModule;
