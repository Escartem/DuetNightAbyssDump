require("UnLua")
local M = Class("BluePrints.UI.Dungeon.WBP_DungeonUIBase_C")

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.RemainingTime = nil
  self.TurnRedTime = -1
  self.BGDefaultColor = FLinearColor(0.0, 0.0, 0.0, 0.8)
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.ShowDungeonUI, self, self.ShowDungeonUI)
  self:AddDispatcher(EventID.CloseDungeonUI, self, self.CloseDungeonUI)
end

function M:InitTempleTimeUIOnShowDownTime()
  local TimeStr = self:GetTimeStr(math.floor(self.RemainingTime))
  self.Text_TempleTimeTitle:SetText(GText("UI_DUNGEON_DES_RESCUE_5"))
  self.Text_Time:SetText(TimeStr)
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function M:InitTempleDelayTimeUI(Title, Time)
  self.RemainingTime = Time
  local TimeStr = self:GetTimeStr(math.floor(self.RemainingTime))
  self.Text_TempleTimeTitle:SetText(GText(Title))
  self.Text_Time:SetText(TimeStr)
  self:AddTimer(1, self.UpdateRemainingTimeInTemple, true, 0, "TempleDelayTimer", false)
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Warning_In)
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  AudioManager(self):PlayUISound(self, "event:/ui/common/shenmiao_countdown_appear", nil, nil)
end

function M:ShowDungeonUI()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Warning_In)
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Text_Time:SetColorAndOpacity(self.NormalColor)
  self.AlreadyClose = false
end

function M:CloseDungeonUI()
  if self.AlreadyClose then
    return
  end
  self.AlreadyClose = true
  local OutAnim = self.Out
  self:RemoveTimer("RefreshDistanceTimer")
  self:RemoveTimer("TempleDelayTimer")
  if OutAnim then
    EMUIAnimationSubsystem:EMPlayAnimation(self, OutAnim)
  else
    self:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:UpdateRemainingTimeInTemple()
  self.RemainingTime = self.RemainingTime - 1
  if self.RemainingTime >= 0 then
    local TimeStr = self:GetTimeStr(math.floor(self.RemainingTime))
    self.Text_Time:SetText(TimeStr)
    AudioManager(self):PlayUISound(self, "event:/ui/common/countdown_warning_short_reverb", nil, nil)
  else
    self:RemoveTimer("TempleDelayTimer")
    if not self.AlreadyClose then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Out)
    end
  end
end

return M
