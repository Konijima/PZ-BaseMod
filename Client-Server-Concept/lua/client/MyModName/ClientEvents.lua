--- Load Client
local Client = require 'MyModName/Client';

for _, eventName in ipairs(Client.Config.ClientEvents) do
    LuaEventManager.AddEvent(eventName);
end
