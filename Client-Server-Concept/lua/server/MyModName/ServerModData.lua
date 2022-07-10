-- Ensure server is loaded first
require 'MyModName/Server';

--- Handle initialization of Global ModData on server
local function initGlobalModData(isNewGame)

    --- ServerData: Data that is stored on server and is persistant
    --- Will be requested by client on connection.
    MyModNameServer.Data.ServerData = ModData.getOrCreate("ServerData");

end
Events.OnInitGlobalModData.Add(initGlobalModData);
