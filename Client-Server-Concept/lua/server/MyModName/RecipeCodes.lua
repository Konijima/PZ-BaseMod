-- Functions paramaters and return value

-- GetItemTypes     (scriptItems)
-- OnCanPerform     (recipe, playerObj, item) return boolean
-- OnCreate         (items, result, playerObj)
-- OnGiveXP         (recipe, ingredients, result, playerObj)
-- OnTest           (item) return boolean

---------------------------------------------------------------------------------

--- Rename MyModName with your own mod name
MyModName_RecipeCodes = MyModName_RecipeCodes or {};
MyModName_RecipeCodes.GetItemTypes = MyModName_RecipeCodes.GetItemTypes or {};
MyModName_RecipeCodes.OnCanPerform = MyModName_RecipeCodes.OnCanPerform or {};
MyModName_RecipeCodes.OnCreate = MyModName_RecipeCodes.OnCreate or {};
MyModName_RecipeCodes.OnGiveXP = MyModName_RecipeCodes.OnGiveXP or {};
MyModName_RecipeCodes.OnTest = MyModName_RecipeCodes.OnTest or {};

---------------------------------------------------------------------------------

--- Define your recipe functions here


