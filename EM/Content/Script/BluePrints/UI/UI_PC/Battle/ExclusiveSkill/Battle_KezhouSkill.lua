local M = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")
local MELEE_STATE = {
  WEAK = 0,
  NORMAL = 1,
  HIGHLIGHT = 2
}
local RANGED_STATE = {
  WEAK = 0,
  NORMAL = 1,
  HIGHLIGHT = 2
}
local MELEE_STATE_ANIM = {
  [MELEE_STATE.NORMAL] = "Melee_Normal",
  [MELEE_STATE.HIGHLIGHT] = "Melee_Highlight",
  [MELEE_STATE.WEAK] = "Melee_LowLight"
}
local RANGED_STATE_ANIM = {
  [RANGED_STATE.NORMAL] = "Ranged_Normal",
  [RANGED_STATE.HIGHLIGHT] = "Ranged_Highlight",
  [RANGED_STATE.WEAK] = "Ranged_LowLight"
}

function M:OnLoaded(OwnerPlayer, Params)
  DebugPrint("gmy@Battle_XierSkill M:OnLoaded", Params.RangedBuffId, Params.MeleeBuffId)
  self.Owner = OwnerPlayer
  self.RangedBuffId = Params.RangedBuffId
  self.MeleeBuffId = Params.MeleeBuffId
  self.MeleeWeakBuffId = Params.MeleeWeakBuffId
  self:K2_SetBuffsOwner(OwnerPlayer)
  self:RegisterOnBuffsChangedDelegate()
  self:InitBuffConfig()
  self:InitBuffLayer()
end

function M:InitBuffConfig()
  self.MaxMeleeBuffLayer = DataMgr.Buff[self.MeleeBuffId].MaxLayer or 1
  self.MaxRangedBuffLayer = DataMgr.Buff[self.RangedBuffId].MaxLayer or 1
  self.MeleeState = MELEE_STATE.NORMAL
  self.RangedState = MELEE_STATE.NORMAL
end

function M:ReceiveOnBuffsChanged()
  local Buffs = self.Owner.BuffManager.Buffs
  self:OnBuffsChanged(Buffs)
end

function M:OnBuffsChanged(Buffs)
  if not IsValid(self.Owner) then
    return
  end
  local MeleeBuffLayer = 0
  local RangedBuffLayer = 0
  local bInMeleeWeakState = false
  local MeleeBuff = Battle(self):FindBuffById(self.Owner, self.MeleeBuffId, 0, false)
  if IsValid(MeleeBuff) then
    MeleeBuffLayer = MeleeBuff:GetLayerNum()
  end
  local RangedBuff = Battle(self):FindBuffById(self.Owner, self.RangedBuffId, 0, false)
  if IsValid(RangedBuff) then
    RangedBuffLayer = RangedBuff:GetLayerNum()
  end
  local MeleeWeakBuff = Battle(self):FindBuffById(self.Owner, self.MeleeWeakBuffId, 0, false)
  if IsValid(MeleeWeakBuff) then
    bInMeleeWeakState = true
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  end
  DebugPrint("gmy@Battle_KezhouSkill M:OnBuffsChanged", bInMeleeWeakState, MeleeBuffLayer, RangedBuffLayer)
  local MeleeState = MELEE_STATE.NORMAL
  if bInMeleeWeakState then
    MeleeState = MELEE_STATE.WEAK
  elseif MeleeBuffLayer == self.MaxMeleeBuffLayer then
    MeleeState = MELEE_STATE.HIGHLIGHT
  end
  self:SetMeleeState(MeleeState)
  local RangedState = RANGED_STATE.NORMAL
  if bInMeleeWeakState then
    if RangedBuffLayer == self.MaxRangedBuffLayer then
      RangedState = RANGED_STATE.HIGHLIGHT
    end
  else
    RangedState = RANGED_STATE.WEAK
  end
  self:SetRangedState(RangedState)
  self:UpdateBuffLayer(MeleeBuffLayer, RangedBuffLayer)
end

function M:SetMeleeState(State)
  if State ~= self.MeleeState then
    DebugPrint("gmy@Battle_KezhouSkill M:SetMeleeState", State)
    if State == MELEE_STATE.HIGHLIGHT then
      AudioManager(self):PlayUISound(self, "event:/ui/common/kezhou_passive_show", nil, nil)
    end
    local AnimName = MELEE_STATE_ANIM[State]
    if AnimName then
      self:StopAllAnimations()
      self:PlayAnimation(self[AnimName])
    end
    self.MeleeState = State
  end
end

function M:SetRangedState(State)
  if State ~= self.RangedState then
    DebugPrint("gmy@Battle_KezhouSkill M:SetRangedState", State, RANGED_STATE_ANIM[State], self[RANGED_STATE_ANIM[State]])
    if State == RANGED_STATE.HIGHLIGHT then
      AudioManager(self):PlayUISound(self, "event:/ui/common/kezhou_passive_show", nil, nil)
    end
    local AnimName = RANGED_STATE_ANIM[State]
    if AnimName then
      self:StopAllAnimations()
      self:PlayAnimation(self[AnimName])
    end
    self.RangedState = State
  end
end

function M:UpdateBuffLayer(MeleeBuffLayer, RangedBuffLayer)
  self.Progress_Melee:SetPercent(MeleeBuffLayer / self.MaxMeleeBuffLayer)
  self.Progress_Ranged:SetPercent(RangedBuffLayer / self.MaxRangedBuffLayer)
  self.Num_Melee:SetText(string.format("%.0f", MeleeBuffLayer))
  self.Num_Ranged:SetText(string.format("%.0f", RangedBuffLayer))
end

function M:InitBuffLayer()
  self:ReceiveOnBuffsChanged()
end

return M
