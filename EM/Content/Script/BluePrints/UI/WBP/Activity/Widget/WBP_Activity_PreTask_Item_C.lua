require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  self.Content = Content
  Content.SelfWidget = self
  self.BtnName = Content.BtnName
  self.ParentWidget = Content.ParentWidget
  self.OnClickedParams = Content.OnClickedParams
  self.Text_ItemTitle:SetText(GText(Content.DisplayText))
  self.IsShowLock = Content.IsShowLock
  self.IsForbidClick = Content.IsForbidClick
  self.IsShowFinish = Content.IsShowFinish
  self:UpdateLockDisplay()
  self:UpdateClickAbility()
end

function M:UpdateLockDisplay()
  if self.IsShowFinish then
    self:PlayAnimation(self.State_Done)
  elseif self.IsShowLock then
    self:PlayAnimation(self.State_Lock)
  else
    self:PlayAnimation(self.State_Normal)
  end
end

function M:UpdateClickAbility()
  self.Btn_Click:SetForbidden(self.IsForbidClick)
end

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnClickedBtn)
end

function M:OnClickedBtn()
  if self.IsForbidClick then
    return
  end
  if not self.OnClickedParams then
    return
  end
  if self.OnClickedParams.Params then
    self.OnClickedParams.Callback(self.OnClickedParams.Obj, table.unpack(self.OnClickedParams.Params))
  else
    self.OnClickedParams.Callback(self.OnClickedParams.Obj)
  end
end

return M
