--- Load Client
local Client = require 'MyModName/Client';

--- Added events will be stored in this ArrayList
local addedEvents = ArrayList.new();

--- Function that initialize the events found in the config
local function internalInitEvent(eventName)
    if not addedEvents:contains(eventName) then
        LuaEventManager.AddEvent(Client.Config.ModName .. "Client" .. eventName);
        addedEvents:add(eventName);
        Client.Log("Created custom client event " .. eventName);
    end
end

--- Core event
internalInitEvent("OnModDataInitialized");

--- Add the config client events
for _, eventName in ipairs(Client.Config.ClientEvents) do
    internalInitEvent(eventName);
end

---Add an event callback
---@param eventName string
---@param callback function
function Client.AddEvent(eventName, callback)
    if addedEvents:contains(eventName) then
        Events[Client.Config.ModName .. "Client" .. eventName].Add(callback);
    end
end

---Remove an event callback
---@param eventName string
---@param callback function
function Client.RemoveEvent(eventName, callback)
    if addedEvents:contains(eventName) then
        Events[Client.Config.ModName .. "Client" .. eventName].Remove(callback);
    end
end

---Trigger an event
---@param eventName string
---@vararg arguments
function Client.TriggerEvent(eventName, ...)
    if addedEvents:contains(eventName) then
        triggerEvent(Client.Config.ModName .. "Client" .. eventName, ...);
    end
end
