--- Load Client
local Client = require 'MyModName/Client';

function Client.Commands.Pong()
    Client.Log("Received Pong!");
end
