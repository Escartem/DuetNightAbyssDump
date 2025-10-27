local M = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")

function M:Construct()
  self:InitListenEvent()
  self.Progress_Tuosi:SetPercent(0)
end

function M:Destruct()
end

function M:OnLoaded(OwnerPlayer, Params)
  DebugPrint("gmy@Battle_TuosiSkill M:OnLoaded", OwnerPlayer, Params)
  self.OwnerPlayer = OwnerPlayer
  self.FireBuffId = Params.FireBuffId
  self.SSp = OwnerPlayer:GetAttr("SecondSp")
  self.MaxSSp = OwnerPlayer:GetAttr("MaxSecondSp")
  self:UpdateSSp()
  self:InitBuffParam(OwnerPlayer, Params)
  local FireBuff = Battle(self):FindBuffById(self.OwnerPlayer, self.FireBuffId, 0, false)
  local bOnFire = not not FireBuff
  self:SetOnFire(bOnFire)
end

function M:InitBuffParam(PlayerCharacter, Params)
  DebugPrint("gmy@Battle_TuosiSkill_PC M:InitBuffParam", PlayerCharacter)
  self.Owner = PlayerCharacter
  self:K2_SetBuffsOwner(PlayerCharacter)
  self:RegisterOnBuffsChangedDelegate()
end

function M:ReceiveOnBuffsChanged()
  local Buffs = self.Owner.BuffManager.Buffs
  self:OnBuffsChanged(Buffs)
end

function M:OnBuffsChanged(Buffs)
  local bOnFire = false
  for _, Buff in pairs(Buffs) do
    if Buff.BuffId and Buff.BuffId == self.FireBuffId then
      bOnFire = true
    end
  end
  DebugPrint("gmy@Battle_TuosiSkill_PC M:OnBuffsChanged", bOnFire)
  self:SetOnFire(bOnFire)
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.UpdateMainPlayerSecondSp, self, self.OnUpdateSSp)
  self:AddDispatcher(EventID.UpdateMainPlayerMaxSecondSp, self, self.OnUpdateMaxSSp)
end

function M:OnUpdateSSp(SSp, OwnerActor)
  if OwnerActor == self.OwnerPlayer then
    self.SSp = SSp
    self:UpdateSSp()
  end
end

function M:OnUpdateMaxSSp(MaxSSp, OwnerActor)
  if OwnerActor == self.OwnerPlayer then
    self.MaxSSp = MaxSSp
    self:UpdateSSp()
  end
end

function M:UpdateSSp()
  DebugPrint("gmy@Battle_TuosiSkill M:UpdateSSp", self.SSp, self.MaxSSp)
  if self.SSp and self.MaxSSp then
    local SSpText = string.format("%.0f/%.0f", self.SSp, self.MaxSSp)
    self.Num_Tuosi:SetText(SSpText)
    local SSpPercent = self.SSp / self.MaxSSp
    self.Progress_Tuosi:SetPercent(SSpPercent)
  end
end

function M:SetOnFire(bOnFire)
  if bOnFire then
    self.VX_Fire:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.VX_Fire:SetVisibility(ESlateVisibility.Collapsed)
  end
end

return M
