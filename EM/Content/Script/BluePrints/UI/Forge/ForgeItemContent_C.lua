require("UnLua")
local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local ForgeItemContent = Class()
ForgeItemContent.Id = nil
ForgeItemContent.Count = nil
ForgeItemContent.StartTime = nil
ForgeItemContent.TotalTime = nil
ForgeItemContent.State = 0
ForgeItemContent.ProductCount = nil
ForgeItemContent.ProductNum = nil
ForgeItemContent.ResourcesNeed = {}
ForgeItemContent.CanProduce = false
ForgeItemContent.IsEmptyWidget = false
return ForgeItemContent
