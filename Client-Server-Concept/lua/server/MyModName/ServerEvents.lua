--- Load Server
local Server = require 'MyModName/Server';

for _, eventName in ipairs(Server.Config.ServerEvents) do
    LuaEventManager.AddEvent(eventName);
end
