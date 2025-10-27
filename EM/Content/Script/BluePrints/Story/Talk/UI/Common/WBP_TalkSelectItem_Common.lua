require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
local FirstInitTime = 0.25

function M:Init(InSelectUI, InItem, OptionIdx, ListIdx)
  self.SelectUI = InSelectUI
  self.Item = InItem
  self.OutAnimFinishedInfo = nil
  self.OptionIdx = OptionIdx
  self.ListIdx = ListIdx
  self:InitPlatform()
  self:InitKey()
  self:InitText()
  self:SwitchPlayInAnimation(InItem)
  self:BindAnimationEvents()
  self:AddTimer(FirstInitTime, function()
    self:BindMouseTriggerEvents()
  end, false, 0, "BindMouseTriggerEvents", true)
end

function M:InitText()
  self.Text_Talk:SetText(self.Item.OptionTopic)
end

function M:InitPlatform()
  local Platform = CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance)
  self.bInMobile = "Mobile" == Platform
end

function M:InitKey()
  self.Key_Talk:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "F"}
    }
  })
  self.Key_Talk_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
  if self.bInMobile then
    self.Key:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Key:SetVisibility(ESlateVisibility.Hidden)
  end
end

function M:ShowKey(bShow)
  if self.bInMobile then
    return
  end
  if bShow then
    self.Key:SetVisibility(ESlateVisibility.Visible)
  else
    self.Key:SetVisibility(ESlateVisibility.Hidden)
  end
end

function M:BindMouseTriggerEvents()
  self.Button_Area.OnClicked:Add(self, self.OnItemClicked)
  self.Button_Area.OnHovered:Add(self, self.OnItemHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnItemUnhovered)
  self.Button_Area.OnPressed:Add(self, self.OnItemPressed)
  self.Button_Area.OnReleased:Add(self, self.OnItemReleased)
end

function M:UnBindAllEvents()
  self.Button_Area.OnClicked:Clear()
  self.Button_Area.OnHovered:Clear()
  self.Button_Area.OnUnhovered:Clear()
  self.Button_Area.OnPressed:Clear()
  self.Button_Area.OnReleased:Clear()
end

function M:Clear()
  self:UnBindAllEvents()
  self:StopListeningForInputAction("TalkOption", EInputEvent.IE_Pressed)
  self:CleanTimer()
end

function M:SwitchPlayInAnimation(InItem)
  if InItem.bIsSelected then
    self.bIsSelected = true
    self:PlayAnimation(self.Read)
  else
    self:PlayAnimation(self.In)
  end
end

function M:BindAnimationEvents()
  self:BindToAnimationFinished(self.Click, {
    self,
    self.OnClickAnimationFinished
  })
end

function M:OnClickAnimationFinished()
  if self.bIsSelected then
    return
  end
  self.SelectUI:OnItemClicked(self.OptionIdx)
end

function M:OnItemClicked()
  DebugPrint("OnItemClicked", self)
  if self.bIsSelected then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", "", nil)
    self:StopAllAnimations()
    self:PlayAnimation(self.Read_Click)
    local TalkContext = GWorld.GameInstance:GetTalkContext()
    TalkContext:TalkShowUITip("CommonToastMain", "Impression_UI_Read")
  else
    self:StopListeningForInputAction("TalkOption", EInputEvent.IE_Pressed)
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", "", nil)
    self:StopAllAnimations()
    self:PlayAnimation(self.Click)
    self:UnBindAllEvents()
    self.SelectUI:OnItemClickStart()
  end
end

function M:OnItemHovered()
  DebugPrint("OnItemHovered", self)
  self.SelectUI:SelectNewItem(self.ListIdx)
end

function M:OnItemUnhovered()
  DebugPrint("OnItemUnhovered", self)
  if self.bInMobile then
    return
  end
  if self.ListIdx == self.SelectUI.CurrentSelectItemIdx then
    self:PlayAnimationReverse(self.Hover)
    self:StopAnimation(self.Hover)
  else
    self:PlayAnimation(self.UnHover)
  end
end

function M:OnItemPressed()
  DebugPrint("OnItemPressed", self)
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnItemReleased()
  DebugPrint("OnItemReleased", self)
  if self.bInMobile then
    self:PlayAnimation(self.Normal)
  end
end

function M:OnSelectItem(bIsDefault)
  DebugPrint("OnSelectItem", self, bIsDefault)
  if bIsDefault then
    self:AddTimer(FirstInitTime, function()
      self:ListenForInputAction("TalkOption", EInputEvent.IE_Pressed, false, {
        self,
        self.OnItemClicked
      })
    end, false, 0, "OnSelectItem", true)
  else
    self:ListenForInputAction("TalkOption", EInputEvent.IE_Pressed, false, {
      self,
      self.OnItemClicked
    })
  end
  if not self.bInMobile then
    self:PlayAnimation(self.Hover)
  end
  self:ShowKey(true)
end

function M:OnUnselectItem()
  DebugPrint("OnUnselectItem", self)
  self:StopListeningForInputAction("TalkOption", EInputEvent.IE_Pressed)
  self:RemoveTimer("OnSelectItem", true)
  if not self.bInMobile then
    self:PlayAnimation(self.UnHover)
  end
  self:ShowKey(false)
end

function M:UpdateKeyImg(IsGamePad)
  if IsGamePad then
    self.WidgetSwitcher_Key:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_Key:SetActiveWidgetIndex(0)
  end
end

return M
