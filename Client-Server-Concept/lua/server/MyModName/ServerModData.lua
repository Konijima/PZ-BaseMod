--- Load Server
local Server = require 'MyModName/Server';

---Initialize Global ModData that we need on the server
---@param modDataName string
local function initModDataTable(modDataName)
    if Server.Data[modDataName] then return; end -- prevent multiple initialization
    Server.Data[modDataName] = ModData.getOrCreate(modDataName);
end

--- Handle initialization of Global ModData on server
local function initGlobalModData(isNewGame)

    initModDataTable("WorldData");
    initModDataTable("PlayerData");

    Server.TriggerEvent("OnModDataInitialized", isNewGame);

end
Events.OnInitGlobalModData.Add(initGlobalModData);
