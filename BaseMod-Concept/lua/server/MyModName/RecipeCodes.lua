-- Functions        parameters and return value

-- GetItemTypes     (scriptItems)
-- OnCanPerform     (recipe, playerObj, item) return boolean
-- OnCreate         (items, result, playerObj)
-- OnGiveXP         (recipe, ingredients, result, playerObj)
-- OnTest           (item) return boolean

---------------------------------------------------------------------------------

--- Rename MyModName with your own mod name
local recipeCode = MyModName_RecipeCodes or {};
recipeCode.GetItemTypes = recipeCode.GetItemTypes or {};
recipeCode.OnCanPerform = recipeCode.OnCanPerform or {};
recipeCode.OnCreate = recipeCode.OnCreate or {};
recipeCode.OnGiveXP = recipeCode.OnGiveXP or {};
recipeCode.OnTest = recipeCode.OnTest or {};
MyModName_RecipeCodes = recipeCode;

---------------------------------------------------------------------------------

--- Define your recipe functions here

--- Example:

function RecipeCode.OnCreate.MakeBaseballBat(items, result, playerObj)
    playerObj:getInventory():AddItem(result:getFullType()); --- add one more
end

--[[ Usage in recipe txt script:

recipe Make Baseball Bat {
    ...
    OnCreate:MyModName_RecipeCodes.OnCreate.MakeBaseballBat
    ...
}
]]
