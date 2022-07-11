--- Load Client
local Client = require 'MyModName/Client';

---Initialize Server Global ModData that we need to sync with the server
---@param modDataName string
local function initServerModDataTable(modDataName)
    if Client.Data[modDataName] then return; end -- prevent multiple initialization
    if isClient() and ModData.exists(modDataName) then ModData.remove(modDataName); end
    Client.Data[modDataName] = ModData.getOrCreate(modDataName);
    ModData.request(modDataName);
end

---Initialize local Global ModData that we need only on the client
---@param modDataName string
local function initLocalModDataTable(modDataName)
    if Client.Data[modDataName] then return; end -- prevent multiple initialization
    Client.Data[modDataName] = ModData.getOrCreate(modDataName);
end

--- Handle initialization of Global ModData on client
local function initGlobalModData(isNewGame)

    for modDataName, isSync in pairs(Client.Config.ClientModData) do
        local name = Client.Config.ModName .. "." .. modDataName;
        if isSync then
            initServerModDataTable(name);
        else
            initLocalModDataTable(name);
        end
    end

    Client.TriggerEvent("OnModDataInitialized", isNewGame);
    
end
Events.OnInitGlobalModData.Add(initGlobalModData);

--- Handle receiving of Global ModData on client
local function receiveGlobalModData(modDataName, data)
    local name = Client.Config.ModName .. "." .. modDataName;
    if Client.Data[name] and type(data) == "table" then
        if #data > 0 then
            -- if the received data is an array table
            for _, value in ipairs(data) do
                table.insert(Client.Data[name], value);
            end
        else
            -- if the received data is a key/value table
            for key, value in pairs(data) do
                Client.Data[name][key] = value;
            end
        end
    end
end
Events.OnReceiveGlobalModData.Add(receiveGlobalModData);
