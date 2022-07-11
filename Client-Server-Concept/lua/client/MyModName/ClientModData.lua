-- Ensure client is loaded first
local Client = require 'MyModName/Client';

--- Handle initialization of Global ModData on client
local function initGlobalModData(isNewGame)

    --- ServerData : Example Data that must be requested/received from the server
    --- We delete it on the client (not singleplayer) and we request the latest from the server
    if isClient() and ModData.exists("ServerData") then ModData.remove("ServerData"); end
    Client.Data.ServerData = ModData.getOrCreate("ServerData");
    ModData.request("ServerData");

    --- ClientData : Example Data that is local to this client
    Client.Data.ClientData = ModData.getOrCreate("ClientData");
    
end
Events.OnInitGlobalModData.Add(initGlobalModData);

--- Handle receiving of Global ModData on client
local function receiveGlobalModData(name, data)
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
