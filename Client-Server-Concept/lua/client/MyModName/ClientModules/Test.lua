--- Load Client
local Client = require 'MyModName/Client';

---@class ClientModuleTest
local ClientModuleTest = {};

---Send Ping to the server
function ClientModuleTest.SendPing()
    Client.SendCommand("Ping");
end

---Queue TemplateAction to a local player
---@param player IsoPlayer
function ClientModuleTest.QueueTemplateAction(player)
    if not instanceof(player, "IsoPlayer") or player:isDead() or not player:isLocalPlayer() then return; end

    local timedAction = Client.TimedActions.DoSomething:new(player);
    ISTimedActionQueue.add(timedAction);
end

--- Add the module to the client Modules object
Client.Modules.Test = ClientModuleTest;
