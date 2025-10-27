require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(RootPage, FishingSpotId)
  self.RootPage = RootPage
  self.Btn_Quit.OnClicked:Add(self, self.OnClickQuit)
  self.Btn_Angling.OnClicked:Add(self, self.OnClickAngling)
  if self.RootPage.RootPage.DeviceInPc then
    self.Com_Key_Esc:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "Esc"}
      }
    })
    self.Key_Esc_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      }
    })
    self.KeyText_E:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "E"}
      }
    })
    self.Key_E_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      }
    })
  else
    self.Com_Key_Esc:SetVisibility(ESlateVisibility.Collapsed)
    self.KeyText_E:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Text_Tips:SetText(GText("UI_Fishing_SmallToBigChance"))
  self.FishingSmallToBigDuration = DataMgr.GlobalConstant.FishingSmallToBigDuration.ConstantValue
end

function M:OnCanSpecialFishing()
  self.CountTime = self.FishingSmallToBigDuration
  self.Text_Time:SetText(self.CountTime)
  self.bFailed = false
  self:PlayAnimation(self.In)
  if self.RootPage.DeviceInPc then
    self.RootPage.WidgetSwitcher_MP:SetVisibility(ESlateVisibility.Collapsed)
  end
  self:AddTimer(1, self.CountDown, true, 0, "SpecialFishing")
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/fish_one_more_start", nil, nil)
end

function M:CountDown()
  self:PlayAnimation(self.Countdown)
  self.CountTime = self.CountTime - 1
  self.Text_Time:SetText(self.CountTime)
  if self.CountTime <= 0 then
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/fish_one_more_count_down_last", nil, nil)
    self:SwitchWaitStart()
  else
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/fish_one_more_count_down", nil, nil)
  end
end

function M:SwitchWaitStart()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:RemoveTimer("SpecialFishing")
  self.bFailed = true
  self:PlayAnimation(self.Out)
end

function M:SwitchWaitFishing()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:RemoveTimer("SpecialFishing")
  self.bFailed = false
  self:PlayAnimation(self.Out)
end

function M:OnClickQuit()
  self:SwitchWaitStart(true)
end

function M:OnClickAngling()
  self:SwitchWaitFishing()
end

function M:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.MouseAndKeyboard and self.RootPage.RootPage.DeviceInPc then
    self.WidgetSwitcher_E:SetActiveWidgetIndex(0)
    self.WidgetSwitcher_Esc:SetActiveWidgetIndex(0)
  elseif CurInputDevice == ECommonInputType.Gamepad and self.RootPage.RootPage.DeviceInPc then
    self.WidgetSwitcher_E:SetActiveWidgetIndex(1)
    self.WidgetSwitcher_Esc:SetActiveWidgetIndex(1)
  elseif CurInputDevice == ECommonInputType.Touch then
  end
end

function M:BP_GetDesiredFocusTarget()
  return self.RootPage
end

return M
