require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")

function M:Construct()
  self.Base:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.ProgressMaterial = self.Progress:GetDynamicMaterial()
end

function M:OnLoaded(OwnerPlayer, Params)
  self.Super.OnLoaded(self)
  self.BuffIcons = {}
  for i = 1, 4 do
    self.BuffIcons[i] = self["Num_" .. i]
    self.BuffIcons[i].Text_Num:SetText(i)
  end
  self.BuffState = {
    Layer = 0,
    LastTime = -1,
    IsCountDown = false
  }
  self:InitBuffParam(OwnerPlayer, Params)
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.In)
end

function M:InitBuffParam(OwnerPlayer, Params)
  self.Owner = OwnerPlayer
  self.BuffId = Params.BuffId
  self:K2_SetBuffsOwner(OwnerPlayer)
  self:RegisterOnBuffsChangedDelegate()
end

function M:ReceiveOnBuffsChanged()
  local Buffs = self.Owner.BuffManager.Buffs
  self:OnBuffsChanged(Buffs)
end

function M:OnBuffsChanged(Buffs)
  local NewBuffState = {
    Layer = 0,
    LastTime = -1,
    IsCountDown = false
  }
  local BaonuBuff
  for _, Buff in pairs(Buffs) do
    if Buff.BuffId == self.BuffId then
      NewBuffState.Layer = Buff.Layer
      NewBuffState.LastTime = Buff.LastTime
      NewBuffState.IsCountDown = Buff.LastTime >= 0
      BaonuBuff = Buff
      break
    end
  end
  self:LightBuffIcon(NewBuffState)
  self:SwitchBuffIconState(NewBuffState, BaonuBuff)
  self.BuffState = NewBuffState
end

function M:LightBuffIcon(NewBuffState)
  if self.BuffState.Layer == NewBuffState.Layer then
    return
  end
  local Interval = NewBuffState.Layer - self.BuffState.Layer
  if Interval > 0 then
    if 0 ~= self.BuffState.Layer then
      EMUIAnimationSubsystem:EMPlayAnimation(self.BuffIcons[self.BuffState.Layer], self.BuffIcons[self.BuffState.Layer].Max, EUMGSequencePlayMode.Reverse)
    end
    for i = self.BuffState.Layer + 1, NewBuffState.Layer do
      local ChangeBuffIcon = self.BuffIcons[i]
      EMUIAnimationSubsystem:EMPlayAnimation(ChangeBuffIcon, ChangeBuffIcon.Switch)
    end
    EMUIAnimationSubsystem:EMPlayAnimation(self.BuffIcons[NewBuffState.Layer], self.BuffIcons[NewBuffState.Layer].Max)
  else
    EMUIAnimationSubsystem:EMPlayAnimation(self.BuffIcons[self.BuffState.Layer], self.BuffIcons[self.BuffState.Layer].Max, EUMGSequencePlayMode.Reverse)
    for i = self.BuffState.Layer, NewBuffState.Layer + 1, -1 do
      EMUIAnimationSubsystem:EMPlayAnimation(self.BuffIcons[i], self.BuffIcons[i].Switch, EUMGSequencePlayMode.Reverse)
    end
    if 0 ~= NewBuffState.Layer then
      EMUIAnimationSubsystem:EMPlayAnimation(self.BuffIcons[NewBuffState.Layer], self.BuffIcons[NewBuffState.Layer].Max)
    end
  end
end

function M:SwitchBuffIconState(NewBuffState, BaonuBuff)
  self.BaonuBuff = BaonuBuff
  self.LastTime = NewBuffState.LastTime
  self.Num.Text_Num:SetText(NewBuffState.Layer)
  if self.BuffState.IsCountDown == NewBuffState.IsCountDown then
    return
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Switch_Out)
  EMUIAnimationSubsystem:EMPlayAnimation(self.Num, self.Num.Switch)
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Switch_Out then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Switch_In)
    self.WB_Num:SetVisibility(self.BuffState.IsCountDown and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Base:SetVisibility(not self.BuffState.IsCountDown and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
    self.VX:SetVisibility(not self.BuffState.IsCountDown and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_Time:SetVisibility(not self.BuffState.IsCountDown and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.BaonuBuff then
      local BuffLeftTime = self.BaonuBuff:GetLeftTime()
      self.Text_Time:SetText(string.format("%.1fs", BuffLeftTime))
    end
  elseif InAnimation == self.Switch_In then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Switch_Loop, EUMGSequencePlayMode.Forward, true)
  end
end

function M:Tick(MyGeometry, InDeltaTime)
  if not self.BuffState.IsCountDown or not self.BaonuBuff then
    return
  end
  local BuffLeftTime = self.BaonuBuff:GetLeftTime()
  if BuffLeftTime <= 0 then
    return
  end
  self.Text_Time:SetText(string.format("%.1fs", BuffLeftTime))
  local LeftTime = BuffLeftTime - InDeltaTime
  local Percent = LeftTime / self.LastTime
  self.ProgressMaterial:SetScalarParameterValue("Percent", Percent)
end

function M:Destruct()
  self:ReceiveOnBuffsChanged()
  self.WB_Num:SetVisibility(self.BuffState.IsCountDown and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Base:SetVisibility(not self.BuffState.IsCountDown and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
  self.VX:SetVisibility(not self.BuffState.IsCountDown and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Text_Time:SetVisibility(not self.BuffState.IsCountDown and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
end

return M
