-- Ensure client is loaded first
require 'MyModName/Client';

--- Handle initialization of Global ModData on client
local function initGlobalModData(isNewGame)

    --- ServerData: Data that must be up-to-date by the server
    if isClient() and ModData.exists("ServerData") then ModData.remove("ServerData"); end
    MyModName.Data.ServerData = ModData.getOrCreate("ServerData");

    --- ClientData: Data that is never sync or sent to the server
    MyModName.Data.ClientData = ModData.getOrCreate("ClientData");
    
end
Events.OnInitGlobalModData.Add(initGlobalModData);

--- Handle receiving of Global ModData on client
local function receiveGlobalModData(name, data)
    if MyModName.Data[name] and type(data) == "table" then
        if #data > 0 then
            -- if the received data is an array table
            for _, value in ipairs(data) do
                table.insert(MyModName.Data[name], value);
            end
        else
            -- if the received data is a key/value table
            for key, value in pairs(data) do
                MyModName.Data[name][key] = value;
            end
        end
    end
end
Events.OnReceiveGlobalModData.Add(receiveGlobalModData);
