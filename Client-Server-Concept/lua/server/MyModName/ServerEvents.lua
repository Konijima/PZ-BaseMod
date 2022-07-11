--- Load Server
local Server = require 'MyModName/Server';

--- Added events will be stored in this ArrayList
local addedEvents = ArrayList.new();

--- Add the config server events
for _, eventName in ipairs(Server.Config.ServerEvents) do
    if not addedEvents:contains(eventName) then
        LuaEventManager.AddEvent(Server.Config.ModName .. "Server" .. eventName);
        addedEvents:add(eventName);
    end
end

---Add an event callback
---@param eventName string
---@param callback function
function Server.AddEvent(eventName, callback)
    if addedEvents:contains(eventName) then
        Events[Server.Config.ModName .. "Server" .. eventName].Add(callback);
    end
end

---Remove an event callback
---@param eventName string
---@param callback function
function Server.RemoveEvent(eventName, callback)
    if addedEvents:contains(eventName) then
        Events[Server.Config.ModName .. "Server" .. eventName].Remove(callback);
    end
end

---Trigger an event
---@param eventName string
---@vararg arguments
function Server.TriggerEvent(eventName, ...)
    if addedEvents:contains(eventName) then
        triggerEvent(Server.Config.ModName .. "Server" .. eventName, ...);
    end
end
