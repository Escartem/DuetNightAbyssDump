require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:InitCheckItem(Level, ChargeFund)
  self.Level = Level
  self.ChargeFund = ChargeFund
  self["InitNumInfo" .. Level](self)
end

function M:InitNumInfo1()
  self.WS:SetActiveWidgetIndex(0)
  local StageMaxFund = self:GetStateMaxFundByLevel()
  self.Text_ValueNum:SetText(StageMaxFund)
  if StageMaxFund < self.ChargeFund then
    self:PlayAnimation(self.Finish)
  else
    self:PlayAnimation(self.Normal)
  end
end

function M:InitNumInfo2()
  self.WS:SetActiveWidgetIndex(0)
  local StageMaxFund = self:GetStateMaxFundByLevel()
  self.Text_ValueNum:SetText(StageMaxFund)
  if StageMaxFund < self.ChargeFund then
    self:PlayAnimation(self.Finish)
  else
    self:PlayAnimation(self.Normal)
  end
end

function M:InitNumInfo3()
  self.WS:SetActiveWidgetIndex(1)
  self:PlayAnimation(self.Normal)
end

function M:GetStateMaxFundByLevel()
  if 1 == self.Level then
    return DataMgr.FeeRefund[1].PayLevel2
  elseif 2 == self.Level then
    return DataMgr.FeeRefund[1].PayLevel3
  elseif 3 == self.Level then
    return DataMgr.FeeRefund[1].ProgressMax
  end
  return -1
end

return M
