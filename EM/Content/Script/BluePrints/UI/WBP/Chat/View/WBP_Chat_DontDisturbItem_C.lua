require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Initialize()
  self.ChannelId = 1
  self.EnableNotDisturb = false
  self.EnableNormalHoverAnimation = true
end

function M:Construct()
  self.Btn_Click.OnClicked:Clear()
  self.Btn_Click.OnHovered:Clear()
  self.Btn_Click.OnUnhovered:Clear()
  self.Btn_Disturb.Button_Area.OnClicked:Clear()
  self.Btn_DontDisturb.Button_Area.OnClicked:Clear()
  self.Btn_Click.OnClicked:Add(self, self.OnDisturbItemClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnUnhovered)
  self.Btn_Disturb.Button_Area.OnClicked:Add(self, self.OnDisturbClicked)
  self.Btn_DontDisturb.Button_Area.OnClicked:Add(self, self.OnDisturbClicked)
end

function M:OnListItemObjectSet(Content)
  self.Text_ChatChannelName:SetText(Content.ChannelName)
  self.Image_ChatChannel:SetBrushFromTexture(Content.ChannelIcon)
  self.EnableNotDisturb = Content.Enable
  if self.EnableNotDisturb then
    self.WS_Btn:SetActiveWidgetIndex(1)
  else
    self.WS_Btn:SetActiveWidgetIndex(0)
  end
  self.ChannelId = Content.ChannelId
  if Content.ClickCallback then
    self:SetClickCallback(Content.ClickCallback, Content.ClickCallbackObj)
  end
  Content.UI = self
  if self.ChannelId == nil then
    self.WS_Item:SetActiveWidgetIndex(1)
  end
end

function M:SetClickCallback(Callback, CallbackObj)
  self.OnDisturbClickedCallBack = Callback
  self.OnDisturbClickedCallBackObj = CallbackObj
end

function M:OnDisturbItemClicked()
  self:PlayDisturbClicked()
  UIUtils.PlayCommonBtnSe(self)
  self:OnDisturbClicked()
end

function M:PlayDisturbClicked()
  if self.EnableNotDisturb then
    self.Btn_Disturb:PlayAnimation(self.Btn_Disturb.Click)
  else
    self.Btn_DontDisturb:PlayAnimation(self.Btn_DontDisturb.Click)
  end
end

function M:OnDisturbClicked()
  self.EnableNotDisturb = not self.EnableNotDisturb
  if self.EnableNotDisturb then
    self.WS_Btn:SetActiveWidgetIndex(1)
  else
    self.WS_Btn:SetActiveWidgetIndex(0)
  end
  if self.OnDisturbClickedCallBack then
    self.OnDisturbClickedCallBack(self.OnDisturbClickedCallBackObj)
  end
end

function M:SetEnableHover(bIsEnable)
  self.EnableNormalHoverAnimation = bIsEnable
end

function M:OnHovered()
  if not self.EnableNormalHoverAnimation then
    return
  end
  self:PlayAnimation(self.Hover)
end

function M:OnUnhovered()
  if not self.EnableNormalHoverAnimation then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.UnHover)
end

return M
