-- Functions        parameters and return value

-- GetItemTypes     (scriptItems)
-- OnCanPerform     (recipe, playerObj, item) return boolean
-- OnCreate         (items, result, playerObj)
-- OnGiveXP         (recipe, ingredients, result, playerObj)
-- OnTest           (item) return boolean

---------------------------------------------------------------------------------

--- Preparing the tables
local t = MyModName_RecipeCodes or {};
t.GetItemTypes = t.GetItemTypes or {};
t.OnCanPerform = t.OnCanPerform or {};
t.OnCreate = t.OnCreate or {};
t.OnGiveXP = t.OnGiveXP or {};
t.OnTest = t.OnTest or {};
MyModName_RecipeCodes = t;

---------------------------------------------------------------------------------

--- Define your recipe functions here

--- Example:
function MyModName_RecipeCodes.OnCreate.MakeBaseballBat(items, result, playerObj)
    playerObj:getInventory():AddItem(result:getFullType()); --- add one more
end

--[[ Usage in recipe txt script:

    recipe Make Baseball Bat {
        ...
        OnCreate:MyModName_RecipeCodes.OnCreate.MakeBaseballBat
        ...
    }
    
]]
