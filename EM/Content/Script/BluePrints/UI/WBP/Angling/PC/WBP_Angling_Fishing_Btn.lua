require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(RootPage, bAutoPet)
  self.RootPage = RootPage
  self.bAutoPet = bAutoPet
  self.KeyText:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Space"}
    }
  })
  self.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
  self.Btn_Angling.OnClicked:Add(self, self.OnClickButton)
  self.Btn_Angling.OnHovered:Add(self, self.OnHoverButton)
  self.Btn_Angling.OnUnhovered:Add(self, self.OnUnhoverButton)
  self.Btn_Angling.OnPressed:Add(self, self.OnPressButton)
  self.Btn_Angling.OnReleased:Add(self, self.OnReleaseButton)
  self.ButtonHover = false
  self.ButtonPress = false
  if not self.RootPage.DeviceInPc then
    self.WidgetSwitcher_Key:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.bAutoPet then
    self.Switcher:SetActiveWidgetIndex(2)
  else
    self.Switcher:SetActiveWidgetIndex(1)
  end
end

function M:OnClickButton()
  if self.bForbidden then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, "UI_Fishing_Toast_NoFishingLure")
    return
  end
  self.RootPage:OnClickAnglingButton()
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/fish_btn_click", nil, nil)
end

function M:OnHoverButton()
  self.ButtonHover = true
  self:PlayAnimation(self.Hover)
end

function M:OnUnhoverButton()
  self.ButtonHover = false
  if not self.ButtonPress then
    self:PlayAnimation(self.UnHover)
    self:PlayAnimation(self.Normal)
  end
end

function M:OnPressButton()
  if self.ButtonPress then
    return
  end
  self.ButtonPress = true
  self:PlayAnimation(self.Press)
  self.RootPage:OnSpaceDown()
end

function M:OnReleaseButton(bFromKey)
  if not self.ButtonPress then
    return
  end
  self.ButtonPress = false
  print(_G.LogTag, "LXZ OnReleaseButton", self.ButtonHover, bFromKey)
  if self.ButtonHover or bFromKey then
    self:PlayAnimation(self.Click)
  else
    self:PlayAnimation(self.Normal)
  end
  self.RootPage:OnSpaceUp()
end

function M:SwitchWaitStart(bForbidden)
  print(_G.LogTag, "LXZ SwitchWaitStart", bForbidden, self.bForbidden)
  if not bForbidden then
    self.Btn_Angling:SetVisibility(ESlateVisibility.Visible)
    if self.bForbidden or self.bForbidden == nil then
      self:PlayAnimation(self.Normal)
    end
    self.bForbidden = false
  elseif bForbidden then
    if not self.bForbidden then
      self:PlayAnimation(self.Forbidden)
    end
    self.bForbidden = true
  end
  if self.bAutoPet then
    self.Switcher:SetActiveWidgetIndex(2)
  else
    self.Switcher:SetActiveWidgetIndex(1)
  end
end

function M:SwitchWaitFishing()
  self.Btn_Angling:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Switcher:SetActiveWidgetIndex(0)
end

function M:SwitchWaitStartFishing()
  self.Btn_Angling:SetVisibility(ESlateVisibility.Visible)
  self:PlayAnimation(self.Remind, 0, 0)
end

function M:SwitchFishing()
  self.Btn_Angling:SetVisibility(ESlateVisibility.Visible)
  self:StopAnimation(self.Remind)
end

function M:SwitchEndFishing()
  self.Btn_Angling:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:StopAnimation(self.Remind)
  self:PlayAnimation(self.Normal)
end

function M:PlayRemindSound()
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/fish_bite", nil, nil)
end

return M
