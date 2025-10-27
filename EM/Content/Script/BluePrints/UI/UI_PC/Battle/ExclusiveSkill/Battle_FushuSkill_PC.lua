require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")
local FUSHU_BATTLE_CHAR_UI_ID = 14
local ALLOW_MAX_SUMMONER_COUNT = 3

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.OwnerPlayer = nil
  self.BattleSkillHelpInfo = {}
  self.MaxSummonerCount = 2
  self.AllSummonerInfo = {}
end

function M:OnLoaded(PlayerCharacter, SpecialUIInfo)
  self.Super.OnLoaded(self, PlayerCharacter, SpecialUIInfo)
  self:InitPanelInfo(PlayerCharacter)
  self:InitListenEvent()
  self:RefreshNode(SpecialUIInfo, PlayerCharacter)
end

function M:InitPanelInfo(PlayerCharacter)
  self.List_Fushu:ClearListItems()
  self.ProgressPercentMinCache = self.ProgressPercentMin
  self.ProgressPercentMaxCache = self.ProgressPercentMax
  local Grade = PlayerCharacter:GetAttr("GradeLevel") or 0
  local CharUIInfo = DataMgr.BattleCharUI[FUSHU_BATTLE_CHAR_UI_ID][Grade]
  if CharUIInfo.Params and CharUIInfo.Params.MaxSummonerCount then
    self.MaxSummonerCount = CharUIInfo.Params.MaxSummonerCount
  end
  local ClassPath = UIUtils.GetCommonItemContentClass()
  for i = 1, self.MaxSummonerCount do
    local Content = NewObject(ClassPath)
    Content.Percent = self:GetPercentValue(0.0)
    if i > self.MaxSummonerCount then
      Content.Hide = true
    end
    self.List_Fushu:AddItem(Content)
  end
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
  for i = 1, ALLOW_MAX_SUMMONER_COUNT do
    if i <= self.MaxSummonerCount then
      local Item = self.List_Fushu:GetItemAt(i - 1)
      if Item then
        if Item.SelfWidget then
          Item.SelfWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        end
        self:SetSummonerItem(i, false)
      end
    else
      local Item = self.List_Fushu:GetItemAt(i - 1)
      if Item and Item.SelfWiget then
        Item.SelfWiget:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
  end
end

function M:OnSummonerAdd(Entity, MaxLifeTime)
  if nil ~= Entity and Entity.UnitId == self.BattleSkillHelpInfo.UnitId then
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
    local Item = self.List_Fushu:GetItemAt(Index - 1)
    if Item.SelfWidget then
      Item.SelfWidget:SetPercent(self:GetPercentValue(LifeTime / SummonerInfo.MaxLifeTime))
      Item.SelfWidget:SetRemainTime(LifeTime)
      Item.SelfWidget:ShowRemainTime()
    end
  elseif IsDirty then
    local Item = self.List_Fushu:GetItemAt(Index - 1)
    if Item.SelfWidget then
      Item.SelfWidget:SetPercent(self:GetPercentValue(0.0))
      Item.SelfWidget:HideRemainTime()
    end
    self:SetEffectItem(Index, false)
  end
end

function M:SetEffectItem(Index, bActive)
  local EffectItem = self.List_Fushu:GetItemAt(Index - 1)
  if bActive then
    if EffectItem.SelfWidget then
      EffectItem.SelfWidget:PlayActiveAnimation()
    end
  elseif EffectItem.SelfWidget then
    EffectItem.SelfWidget:PlayInActiveAnimation()
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
      local CharUIInfo = DataMgr.BattleCharUI[FUSHU_BATTLE_CHAR_UI_ID][CurrentGradeLevel]
      local ClassPath = UIUtils.GetCommonItemContentClass()
      for i = self.MaxSummonerCount, CharUIInfo.Params.MaxSummonerCount do
        local Content = NewObject(ClassPath)
        Content.Percent = self:GetPercentValue(0.0)
        self.List_Fushu:AddItem(Content)
      end
      self:RefreshNode(CharUIInfo.Params, self.OwnerPlayer)
    end
  end
end

return M
