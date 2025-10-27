local WalnutBagModel = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagModel")
local WalnutBagCommon = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagCommon")
local M = Class("BluePrints.Common.MVC.Controller")

function M:Init()
  M.Super.Init(self)
end

function M:Destory()
  M.Super.Destory(self)
end

function M:GetModel()
  return WalnutBagModel
end

function M:GetEventName()
  return EventID.WalnutBagControllerEvent
end

function M:OpenView(WorldContex, SelectTabType, SelectItemId)
  return M.Super.OpenView(self, WorldContex, WalnutBagCommon.UIName, SelectTabType, SelectItemId)
end

function M:GetView(WorldContex)
  return M.Super.GetView(self, WorldContex, WalnutBagCommon.UIName)
end

return M
