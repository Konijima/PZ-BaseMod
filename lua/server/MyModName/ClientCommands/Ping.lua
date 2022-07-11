--- Load Server
local Server = require 'MyModName/Server';

---Handle receiving Ping command from a client
---@param player IsoPlayer
---@param args table
function Server.Commands.Ping(player, args)
    Server.Log("Received Ping from " .. player:getUsername() .. "!");

    Server.Modules.Test.SendPong(player);
end
