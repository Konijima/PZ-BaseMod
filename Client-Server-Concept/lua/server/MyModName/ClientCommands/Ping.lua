--- Load Server
local Server = require 'MyModName/Server';

function Server.Commands.Ping(player)
    Server.Log("Received Ping from " .. player:getUsername() .. "!");

    Server.Modules.Test.SendPong(player);
end
