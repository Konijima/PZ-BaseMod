-- Functions        parameters and return value

-- GetItemTypes     (scriptItems)
-- OnCanPerform     (recipe, playerObj, item) return boolean
-- OnCreate         (items, result, playerObj)
-- OnGiveXP         (recipe, ingredients, result, playerObj)
-- OnTest           (item) return boolean

---------------------------------------------------------------------------------

--- Preparing the tables
MyModName_RecipeCodes = {
    GetItemTypes = {},
    OnCanPerform = {},
    OnCreate = {},
    OnGiveXP = {},
    OnTest = {},
}

---------------------------------------------------------------------------------

--- Define your recipe functions here

function MyModName_RecipeCodes.OnCreate.GiveExtraItem(items, result, playerObj)
    playerObj:getInventory():AddItem(result:getFullType());
end
