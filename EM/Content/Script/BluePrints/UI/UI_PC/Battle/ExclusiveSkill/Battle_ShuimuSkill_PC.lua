require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")
local SHUIMU_BATTLE_CHAR_UI_ID = 1
local ALLOW_MAX_SUMMONER_COUNT = 5

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.OwnerPlayer = nil
  self.BattleSkillHelpInfo = {}
  self.MaxSummonerCount = nil
  self.AllSummonerInfo = {}
  self.SummonBarList = {}
  self.SummonerGlowList = {}
  self.EffectList = {}
  self.TextList = {}
end

function M:OnLoaded(PlayerCharacter, SpecialUIInfo)
  self.Super.OnLoaded(self, PlayerCharacter, SpecialUIInfo)
  self:InitPanelInfo()
  self:RefreshNode(SpecialUIInfo, PlayerCharacter)
  self:InitListenEvent()
end

function M:InitPanelInfo()
  for i = 1, ALLOW_MAX_SUMMONER_COUNT do
    self.EffectList[i] = self[string.format("Battle_ShuimuSkill_Effect_PC_%d", i)]
  end
  self.ProgressPercentMinCache = self.ProgressPercentMin
  self.ProgressPercentMaxCache = self.ProgressPercentMax
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnCharCallSummoner, self, self.OnSummonerAdd)
  self:AddDispatcher(EventID.OnCharGradeLevelUp, self, self.OnCharGradeLevelUp)
end

function M:RefreshNode(Params, OwnerPlayer)
  self.OwnerPlayer = OwnerPlayer
  if not IsValid(self.OwnerPlayer) or not Params then
    return
  end
  self.BattleSkillHelpInfo = Params
  self.MaxSummonerCount = Params.MaxSummonerCount
  self.SummonerId = Params.SummonerId
  for i = 1, ALLOW_MAX_SUMMONER_COUNT do
    if i <= self.MaxSummonerCount then
      self["Summoner_" .. tostring(i)]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self:SetSummonerItem(i, false)
    else
      self["Summoner_" .. tostring(i)]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function M:OnSummonerAdd(Entity, MaxLifeTime)
  if self:IsMainPlayerSummon(Entity, self.OwnerPlayer, self.SummonerId) then
    if nil ~= Entity and Entity.UnitId == self.SummonerId then
      local MinTimeIndex = 1
      local MinTime = math.huge
      local LivingCount = 0
      for Index, SummonerInfo in ipairs(self.AllSummonerInfo) do
        if self:IsSummonerLiving(SummonerInfo.Entity) then
          local LifeTime = UE4.UBattleFunctionLibrary.GetSummonRemainingLifeTime(SummonerInfo.Entity)
          if MinTime > LifeTime then
            MinTime = LifeTime
            MinTimeIndex = Index
          end
          LivingCount = LivingCount + 1
        else
          MinTimeIndex = Index
          break
        end
      end
      local AddIndex = LivingCount + 1
      if LivingCount >= self.MaxSummonerCount then
        AddIndex = MinTimeIndex
      end
      self.AllSummonerInfo[AddIndex] = {Entity = Entity, MaxLifeTime = MaxLifeTime}
      self:SetEffectItem(AddIndex, true)
    end
    if not self:IsExistTimer("RefreshAllSummonerInfo") then
      self:AddTimer(0.1, self.RefreshAllSummonerInfo, true, 0, "RefreshAllSummonerInfo")
    end
  end
end

function M:RefreshAllSummonerInfo()
  local ValidSummonerCount = 0
  for i, SummonerInfo in ipairs(self.AllSummonerInfo) do
    if i > self.MaxSummonerCount then
      return
    end
    if self:IsSummonerLiving(SummonerInfo.Entity) then
      ValidSummonerCount = ValidSummonerCount + 1
      self:SetSummonerItem(i, true, SummonerInfo)
    else
      self:SetSummonerItem(i, false)
      SummonerInfo.Entity = nil
    end
  end
  local NowSummonerCount = #self.AllSummonerInfo
  if NowSummonerCount < self.MaxSummonerCount then
    for i = NowSummonerCount + 1, self.MaxSummonerCount do
      self:SetSummonerItem(i, false)
    end
  end
  if ValidSummonerCount <= 0 then
    self:RemoveTimer("RefreshAllSummonerInfo")
  end
end

function M:SetSummonerItem(Index, bVisibility, SummonerInfo)
  self.VisibleStatus = self.VisibleStatus or {}
  local OldVisibility = self.VisibleStatus[Index]
  self.VisibleStatus[Index] = bVisibility
  local IsDirty = OldVisibility ~= bVisibility
  if bVisibility then
    local LifeTime = UE4.UBattleFunctionLibrary.GetSummonRemainingLifeTime(SummonerInfo.Entity)
    local PercentValue = LifeTime / SummonerInfo.MaxLifeTime
    local UIPercent = self:GetPercentValue(PercentValue)
    self.EffectList[Index].Summoner_Bar_1:SetPercent(self:GetPercentValue(UIPercent))
    self.EffectList[Index].Summoner_Glow_1:SetPercent(self:GetPercentValue(UIPercent))
    local TimeString = string.format("%.0fs", LifeTime)
    self.EffectList[Index].Text_Time:SetText(TimeString)
  elseif IsDirty then
    self.EffectList[Index].Summoner_Bar_1:SetPercent(self:GetPercentValue(0.0))
    self.EffectList[Index].Summoner_Glow_1:SetPercent(self:GetPercentValue(0.0))
    self.EffectList[Index].Text_Time:SetText("")
    self:SetEffectItem(Index, false)
  end
end

function M:SetEffectItem(Index, bActive)
  local EffectItem = self.EffectList[Index]
  if bActive then
    EffectItem:PlayAnimation(EffectItem.To_Active)
  else
    EffectItem:PlayAnimation(EffectItem.To_Inactive)
  end
end

function M:GetPercentValue(RealPercent)
  local res = UKismetMathLibrary.MapRangeClamped(RealPercent, 0.0, 1.0, self.ProgressPercentMinCache, self.ProgressPercentMaxCache)
  if 0 == res then
    return self.ProgressPercentMinCache
  end
  return res
end

function M:IsSummonerLiving(Entity)
  return Entity and IsValid(Entity) and UE4.UBattleFunctionLibrary.GetSummonRemainingLifeTime(Entity) > 0
end

function M:OnCharGradeLevelUp(Ret, CharUuid, CurrentGradeLevel)
  if Ret == ErrorCode.RET_SUCCESS then
    CurrentGradeLevel = CurrentGradeLevel + 1
    local Avatar = GWorld:GetAvatar()
    if CharUuid == Avatar.CurrentChar then
      local CharUIInfo = DataMgr.BattleCharUI[SHUIMU_BATTLE_CHAR_UI_ID][CurrentGradeLevel]
      self:RefreshNode(CharUIInfo.Params, self.OwnerPlayer)
    end
  end
end

return M
