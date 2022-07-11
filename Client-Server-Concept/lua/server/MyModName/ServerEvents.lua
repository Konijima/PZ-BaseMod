--- Load Server
local Server = require 'MyModName/Server';

local addedEvents = ArrayList.new();

for _, eventName in ipairs(Server.Config.ServerEvents) do
    if not addedEvents:contains(eventName) then
        LuaEventManager.AddEvent(Server.Config.ModName .. "Server" .. eventName);
        addedEvents:add(eventName);
    end
end

---@param eventName string
---@param callback function
function Server.AddEvent(eventName, callback)
    if addedEvents:contains(eventName) then
        Events[Server.Config.ModName .. "Server" .. eventName].Add(callback);
    end
end

---@param eventName string
---@param callback function
function Server.RemoveEvent(eventName, callback)
    if addedEvents:contains(eventName) then
        Events[Server.Config.ModName .. "Server" .. eventName].Remove(callback);
    end
end

---@param eventName string
---@vararg arguments
function Server.TriggerEvent(eventName, ...)
    if addedEvents:contains(eventName) then
        triggerEvent(Server.Config.ModName .. "Server" .. eventName, ...);
    end
end
