require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.btn_close.AudioEventPath = "event:/ui/common/click_btn_return"
  self.btn_return.AudioEventPath = "event:/ui/common/click_btn_return"
end

function M:Init(BtnType, Reciver, ReciverFunc, ...)
  self.Reciver = Reciver
  self.ReciverFunc = ReciverFunc
  self.Params = {
    ...
  }
  if "Close" == BtnType then
    self.WidgetSwitcher_Close:SetActiveWidgetIndex(0)
  else
    self.WidgetSwitcher_Close:SetActiveWidgetIndex(1)
  end
  self:UnbindAllFromAnimationFinished(self.Click)
  self:BindToAnimationFinished(self.Click, {
    self,
    self.OnClickAnimationFinish
  })
end

function M:OnClickClose()
  self:PlayAnimation(self.Click)
end

function M:OnClickAnimationFinish()
  if self.Reciver and self.ReciverFunc then
    if self.Params then
      self.ReciverFunc(self.Reciver, table.unpack(self.Params))
    else
      self.ReciverFunc(self.Reciver)
    end
  end
end

function M:OnClickBack()
  if self.Reciver and self.ReciverFunc then
    if self.Params then
      self.ReciverFunc(self.Reciver, table.unpack(self.Params))
    else
      self.ReciverFunc(self.Reciver)
    end
  end
end

function M:PlayInAnim()
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
  return self.In:GetEndTime()
end

function M:PlayOutAnim()
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
  return self.Out:GetEndTime()
end

return M
