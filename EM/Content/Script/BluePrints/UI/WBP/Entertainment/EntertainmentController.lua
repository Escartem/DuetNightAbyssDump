local M = Class("BluePrints.Common.MVC.Controller")
local Model = require("BluePrints.UI.WBP.Entertainment.EntertainmentModel")

function M:Init()
  M.Super.Init(self)
  self:AddTimer(0.1, function()
    Model:TryListenEvent()
  end)
end

function M:Destory()
  M.Super.Destory(self)
end

function M:GetModel()
  return Model
end

function M:GetEventName()
  return "Entertainment"
end

return M
