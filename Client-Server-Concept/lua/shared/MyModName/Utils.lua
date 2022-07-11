local json = require("MyModName/Libraries/Json");

---@class Utils
local Utils = {};

---Get a player object from a username
---@param username string
---@return IsoPlayer
function Utils.GetPlayerFromUsername(username)
    if isServer() then
        local players = getOnlinePlayers();
        for i = 0, players:size() - 1 do
            local player = players:get(i);
            if player:getUsername() == username then
                return player;
            end
        end
    end
    return getPlayerFromUsername(username);
end

---Write a string to a file
---@param filename string
---@param str string
function Utils.WriteFile(filename, str)
    local writer = getFileWriter(fileName, true, false);
    if writer then
        writer:write(str);
        writer:close();
    end
end

---Read a string from a file
---@param filename string
---@return string
function Utils.ReadFile(filename)
    local str = "";
    local reader = getFileReader(filename, false);
    if reader then
        while true do
            local line = reader:readLine()
            if line == nil then
                reader:close()
                break
            end
            str = str .. line;
        end
    end
    return str;
end

---Write a table to a file
---@param filename string
---@param tbl table
function Utils.WriteTable(filename, tbl)
    local str = Utils.TableToJson(tbl);
    Utils.WriteFile(filename, str);
end

---Read a table from a file
---@param filename string
---@return table
function Utils.ReadTable(filename)
    local str = Utils.ReadFile(filename);
    local tbl = Utils.JsonToTable(str);
    return tbl;
end

---Encode a table to a json string
---@param data table
---@return string
function Utils.TableToJson(data)
    return json.Encode(data);
end

---Decode a json string to a table
---@param str string
---@return table
function Utils.JsonToTable(str)
    return json.Decode(str);
end

return Utils;
