--- Load Client
local Client = require 'MyModName/Client';

local addedEvents = ArrayList.new();

for _, eventName in ipairs(Client.Config.ClientEvents) do
    if not addedEvents:contains(eventName) then
        LuaEventManager.AddEvent(Client.Config.ModName .. "Client" .. eventName);
        addedEvents:add(eventName);
    end
end

---@param eventName string
---@param callback function
function Client.AddEvent(eventName, callback)
    if addedEvents:contains(eventName) then
        Events[Client.Config.ModName .. "Client" .. eventName].Add(callback);
    end
end

---@param eventName string
---@param callback function
function Client.RemoveEvent(eventName, callback)
    if addedEvents:contains(eventName) then
        Events[Client.Config.ModName .. "Client" .. eventName].Remove(callback);
    end
end

---@param eventName string
---@vararg arguments
function Client.TriggerEvent(eventName, ...)
    if addedEvents:contains(eventName) then
        triggerEvent(Client.Config.ModName .. "Client" .. eventName, ...);
    end
end
