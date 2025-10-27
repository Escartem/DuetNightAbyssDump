local ConditionUtils = {}

function ConditionUtils.CheckCondition(Avatar, ConditionIds, bShowFailed)
  if not Avatar then
    DebugPrint("CheckCondition bug Avatar is nil")
    return false
  end
  if not ConditionIds then
    return true
  end
  bShowFailed = bShowFailed or false
  if type(ConditionIds) ~= "table" then
    ConditionIds = {ConditionIds}
  end
  for i = 1, #ConditionIds do
    local ConditionId = ConditionIds[i]
    if not ConditionUtils.CheckConditionInternal(Avatar, ConditionId) then
      ConditionUtils:CheckShowFailed(ConditionId, false, bShowFailed)
      return false
    end
  end
  return true
end

function ConditionUtils.CheckConditionInternal(Avatar, ConditionId, ConditionCheckId)
  local ConditionInfo = DataMgr.Condition[ConditionId]
  if not ConditionInfo then
    return false
  end
  
  local function CheckResult(ret)
    if ConditionInfo.IsNot then
      return not ret
    else
      return ret
    end
  end
  
  local Logic = string.lower(ConditionInfo.ConditionLogic)
  if "and" == Logic then
    for Condition, List in pairs(ConditionInfo.ConditionMap) do
      for i = 1, #List do
        if not ConditionUtils["Judge" .. Condition](Avatar, List[i], ConditionCheckId) then
          return CheckResult(false)
        end
      end
    end
    return CheckResult(true)
  elseif "or" == Logic then
    for Condition, List in pairs(ConditionInfo.ConditionMap) do
      for i = 1, #List do
        if ConditionUtils["Judge" .. Condition](Avatar, List[i], ConditionCheckId) then
          return CheckResult(true)
        end
      end
    end
    return CheckResult(false)
  else
    error("UnExpected ConditionLogic: " .. Logic)
  end
  return CheckResult(false)
end

function ConditionUtils.ServerCheckCondition(Avatar, ConditionId, Callback, bShowFailed)
  assert(not GWorld:IsSkynetServer() and not IsDedicatedServer(GWorld.GameInstance), "ServerCheckCondition \233\157\158Server/DedicatedServer \230\142\165\229\143\163")
  Avatar:ServerCheckCondition(ConditionId, Callback, bShowFailed)
end

function ConditionUtils:CheckShowFailed(ConditionId, Result, bShowFailed)
  if not bShowFailed then
    return
  end
  if Result then
    return
  end
  local UIManger = GWorld.GameInstance:GetGameUIManager()
  local ShowText = DataMgr.Condition[ConditionId].ConditionText
  if not ShowText then
    UIManger:ShowUITip(UIConst.Tip_CommonToast, "Unconfigured ConditionText " .. tostring(ConditionId))
  else
    UIManger:ShowUITip(UIConst.Tip_CommonToast, GText(ShowText))
  end
end

function ConditionUtils:JudgePlayerLevelMin(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    return Params <= self.Level
  end
  return false
end

function ConditionUtils:JudgePlayerLevelMax(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    return Params >= self.Level
  end
  return false
end

function ConditionUtils:JudgeQuestChain(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    return self.QuestChains[Params] and self.QuestChains[Params]:IsFinish() and true or false
  end
  return false
end

function ConditionUtils:JudgeVarEqual(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    return self.StoryVariable[Params[1]] ~= nil and self.StoryVariable[Params[1]] == Params[2]
  end
  return false
end

function ConditionUtils:JudgeQuest(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    local QuestChainId = tonumber(string.sub(tostring(Params), 1, 6))
    local QuestChain = self.QuestChains[QuestChainId]
    return QuestChain and QuestChain.CompleteQuestId:HasValue(Params) and true or false
  end
  return false
end

function ConditionUtils:JudgeImpression(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    local TalkTriggerId, StorylineState = Params[1], Params[2]
    if 1 == StorylineState and AvatarUtils:IsStorylineComplete(self, TalkTriggerId) or 2 == StorylineState and AvatarUtils:IsStorylineSuccess(self, TalkTriggerId) or 3 == StorylineState and AvatarUtils:IsStorylineFailure(self, TalkTriggerId) then
      return true
    end
  end
  return false
end

function ConditionUtils:JudgeHaveResource(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    local ResourceId, ResourceCount = Params[1], Params[2]
    local Count = self.Resources:QueryResourceCount(ResourceId)
    return ResourceCount <= Count
  end
  return false
end

function ConditionUtils:JudgeMechanismState(Params, ConditionCheckId)
  if GWorld:IsSkynetServer() then
    ConditionUtils.CallDedicatedServerCondition(self, "MechanismState", Params, ConditionCheckId)
    return true
  else
    local StaticId, ManualItemId, StateId = tonumber(Params[1]), tonumber(Params[2]), tonumber(Params[3])
    local GameState = UGameplayStatics.GetGameState(GWorld.GameInstance)
    if 0 == StaticId and 0 ~= ManualItemId then
      return GameState.ManualMechanismStateIdMap:Find(ManualItemId) == StateId
    elseif 0 == ManualItemId and 0 ~= StaticId then
      return GameState.MechanismStateIdMap:Find(StaticId) == StateId
    end
    return true
  end
end

function ConditionUtils:JudgeAvatarStatus(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    local AvatarStatus, Condition = Params[1], Params[2]
    local Status = CommonConst.AvatarStatus[AvatarStatus]
    local InStatus = false
    if Status then
      if GWorld:IsSkynetServer() then
        InStatus = self:InStatus(Status)
      else
        InStatus = self:InStatus(nil, Status)
      end
    end
    if "T" == Condition then
      return InStatus
    elseif "F" == Condition then
      return not InStatus
    end
  end
  return false
end

function ConditionUtils:JudgeSubRegionType(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    return self:CheckSubRegionType(nil, Params)
  end
  return false
end

function ConditionUtils:JudgeDungeonComplete(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    local DungeonId, Relation, Counts = Params[1], Params[2], Params[3]
    local Dungeon = self.Dungeons[DungeonId]
    if not Dungeon then
      if Relation < 0 or 0 == Relation and 0 == Counts then
        return true
      else
        return false
      end
    end
    local PassCount = Dungeon.PassCount
    return Relation > 0 and Counts <= PassCount or Relation < 0 and Counts >= PassCount or 0 == Relation and PassCount == Counts
  end
  return false
end

function ConditionUtils:JudgePhaseQuestEnd(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    local EventId, PhaseId = Params[1], Params[2]
    local QuestIds = DataMgr.QuestPhaseMap[EventId][PhaseId]
    local ExcelToProp = {
      CommonQuestDetail = "StarterQuests",
      ModGuideQuest = "ModGuideQuests"
    }
    local TargetCounters = self[ExcelToProp[DataMgr.EventMain[EventId].SubExcel]]
    for _, QuestId in pairs(QuestIds) do
      local TargetCounter = TargetCounters[QuestId]
      if not TargetCounter then
        return false
      end
      if TargetCounter:IsComplete() == false or false == TargetCounter.RewardsGot then
        return false
      end
    end
    return true
  end
  return false
end

function ConditionUtils:JudgeDailyLoginEnd(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    local EventId = Params[1]
    local DailyLogin = self.DailyLogin[EventId]
    local DailyLoginExcel = DataMgr.DailyLogin[EventId]
    if not DailyLogin or not DailyLoginExcel then
      return false
    end
    if CommonUtils.Size(DailyLogin.RewardsRecord) >= DailyLoginExcel.LoginDuration then
      return true
    end
    return false
  end
  return false
end

function ConditionUtils:JudgeConstantBool(Params)
  Params = string.lower(Params)
  return "t" == Params or "true" == Params
end

function ConditionUtils:JudgeTestClientCon(Params, ConditionCheckId)
  if GWorld:IsSkynetServer() then
    ConditionUtils.CallClientCondition(self, "TestClientCon", Params, ConditionCheckId)
    return true
  elseif IsDedicatedServer(GWorld.GameInstance) then
    return false
  else
    print(_G.LogTag, "JudgeTestClientCon")
    return true
  end
end

function ConditionUtils:JudgeInStoryMode(Params, ConditionCheckId)
  local bIsInStoryMode = false
  if "T" == Params then
    bIsInStoryMode = true
  end
  if GWorld:IsSkynetServer() then
    ConditionUtils.CallClientCondition(self, "InStoryMode", Params, ConditionCheckId)
    return true
  elseif IsDedicatedServer(GWorld.GameInstance) then
    return false
  else
    local Controller = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
    if nil == Controller then
      return false
    end
    local PlayerController = Controller:Cast(UE4.ASinglePlayerController)
    if nil == PlayerController then
      return false
    end
    return PlayerController:GetStoryModeState() == bIsInStoryMode
  end
end

function ConditionUtils:JudgeInDungeon(Params)
  if GWorld:IsSkynetServer() then
    local DungeonComponentBase = require("src.components.dungeon_components.DungeonComponentBase")
    return self:IsInDungeon() and DungeonComponentBase:GetUniqueDungeonId() == Params
  elseif not IsDedicatedServer(GWorld.GameInstance) then
    return self:IsInDungeon() and GWorld.GameInstance:GetCurrentDungeonId() == Params
  else
    local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    return GameMode:IsInDungeon() and GameMode.DungeonId == Params
  end
end

function ConditionUtils:JudgeInHardBossDifficulty(Params)
  if GWorld:IsSkynetServer() then
    return self:IsInHardBoss() and self.CurrentHardBossInfo and self.CurrentHardBossInfo.DifficultyId == Params
  elseif not IsDedicatedServer(GWorld.GameInstance) then
    return self:IsInHardBoss() and self.HardBossInfo and self.HardBossInfo.DifficultyId == Params
  end
  return false
end

function ConditionUtils:JudgeCharEquipRarityLevelModCount(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    local Rarity, ModLevel, Count = Params[1], Params[2], Params[3]
    for _, Char in pairs(self.Chars) do
      local ModCount = 0
      local ModSuit = AvatarUtils:GetTargetModSuit(Char, Char.ModSuitIndex)
      for ModSlotId, ModSlotEid in pairs(ModSuit) do
        local Mod = self.Mods[ModSlotEid]
        if Mod and Rarity <= Mod.Rarity and ModLevel <= Mod.Level then
          ModCount = ModCount + 1
          if Count <= ModCount then
            return true
          end
        end
      end
    end
  end
  return false
end

function ConditionUtils:JudgeCurrentCharId(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    local CurrentChar = self.Chars[self.CurrentChar]
    return CurrentChar.CharId == Params
  end
  return false
end

function ConditionUtils:JudgeOwnCharIdAndLevel(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    local CharId, CharLevel = Params[1], Params[2]
    for _, CharInfo in pairs(self.Chars) do
      if CharInfo.CharId == CharId and CharLevel <= CharInfo.Level then
        return true
      end
    end
  end
  return false
end

function ConditionUtils:JudgeDynamicEventCompleteTimes(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    local DynamicEventId, Times = Params[1], Params[2]
    if self.DynamicQuests[DynamicEventId] and Times <= self.DynamicQuests[DynamicEventId].AlreadyCompleteTimes then
      return true
    end
  end
  return false
end

function ConditionUtils:JudgeExploreGroup(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    for ExploreId, Info in pairs(self.Explores) do
      if ExploreId == Params and Info:IsComplete() then
        return true
      end
    end
  end
  return false
end

function ConditionUtils:JudgeImprShopUnlock(Params)
  local TargetRegionId = Params[1]
  local ImpressionType = Params[2]
  local TargetValue = Params[3]
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    local CurrentImpression = self.Impressions:GetImpression(TargetRegionId)
    if not CurrentImpression then
      return false
    end
    if "Any" == ImpressionType then
      return TargetValue <= CurrentImpression:GetImpressionValueByType(CommonConst.ImpressionType.Benefit) or TargetValue <= CurrentImpression:GetImpressionValueByType(CommonConst.ImpressionType.Morality) or TargetValue <= CurrentImpression:GetImpressionValueByType(CommonConst.ImpressionType.Wisdom) or TargetValue <= CurrentImpression:GetImpressionValueByType(CommonConst.ImpressionType.Empathy) or TargetValue <= CurrentImpression:GetImpressionValueByType(CommonConst.ImpressionType.Chaos)
    elseif "All" == ImpressionType then
      return TargetValue <= CurrentImpression:GetImpressionValueByType(CommonConst.ImpressionType.Benefit) and TargetValue <= CurrentImpression:GetImpressionValueByType(CommonConst.ImpressionType.Morality) and TargetValue <= CurrentImpression:GetImpressionValueByType(CommonConst.ImpressionType.Wisdom) and TargetValue <= CurrentImpression:GetImpressionValueByType(CommonConst.ImpressionType.Empathy) and TargetValue <= CurrentImpression:GetImpressionValueByType(CommonConst.ImpressionType.Chaos)
    else
      local CurrentValue = CurrentImpression:GetImpressionValueByType(ImpressionType)
      if TargetValue <= CurrentValue then
        return true
      end
    end
  end
  return false
end

function ConditionUtils:JudgeRougeLikePreAward(Params)
  if not GWorld:IsSkynetServer() then
    return false
  end
  local AwardType = Params[1]
  local AwardId = Params[2]
  local SeasonId = self:GetCurrentRougeLikeSeason()
  local RougeLike = self.RougeLike:GetSeason(SeasonId)
  if not RougeLike then
    return false
  end
  local AwardList = RougeLike[AwardType .. "s"]
  return AwardList[AwardId]
end

function ConditionUtils:JudgeRougeLikeGroupMin(Params)
  if not GWorld:IsSkynetServer() then
    return false
  end
  local AwardType = Params[1]
  local GroupId = Params[2]
  local Count = Params[3]
  local SeasonId = self:GetCurrentRougeLikeSeason()
  local RougeLike = self.RougeLike:GetSeason(SeasonId)
  if not RougeLike then
    return false
  end
  local AwardList = RougeLike[AwardType .. "s"]
  local RealCount = 0
  for AwardId, _ in pairs(AwardList) do
    if DataMgr["RougeLike" .. AwardType][AwardId][AwardType .. "Group"] == GroupId then
      RealCount = RealCount + 1
    end
    if Count <= RealCount then
      return true
    end
  end
  return false
end

function ConditionUtils:JudgeRougeLikeGroupMax(Params)
  if not GWorld:IsSkynetServer() then
    return false
  end
  local AwardType = Params[1]
  local GroupId = Params[2]
  local Count = Params[3]
  local SeasonId = self:GetCurrentRougeLikeSeason()
  local RougeLike = self.RougeLike:GetSeason(SeasonId)
  if not RougeLike then
    return false
  end
  local AwardList = RougeLike[AwardType .. "s"]
  local RealCount = 0
  for AwardId, _ in pairs(AwardList) do
    if DataMgr["RougeLike" .. AwardType][AwardId][AwardType .. "Group"] == GroupId then
      RealCount = RealCount + 1
    end
    if Count <= RealCount then
      return false
    end
  end
  return true
end

function ConditionUtils:JudgeRougeLikeDifficulty(Params)
  if not GWorld:IsSkynetServer() then
    return false
  end
  local DifficultyId = Params[1]
  local Logic = Params[2]
  
  local function CheckResult(bOriginResult)
    if "T" == Logic then
      return bOriginResult
    else
      return not bOriginResult
    end
  end
  
  local SeasonId = self:GetCurrentRougeLikeSeason()
  local RougeLike = self.RougeLike:GetSeason(SeasonId)
  if not RougeLike then
    return CheckResult(false)
  end
  return CheckResult(RougeLike.DifficultyId == DifficultyId)
end

function ConditionUtils:JudgeRougeLikePassRoom(Params)
  if not GWorld:IsSkynetServer() then
    return false
  end
  local PassRoom = Params
  local SeasonId = self:GetCurrentRougeLikeSeason()
  local RougeLike = self.RougeLike:GetSeason(SeasonId)
  if not RougeLike then
    return false
  end
  return PassRoom <= RougeLike.PassRooms:Length()
end

function ConditionUtils:JudgeDialogueHasRead(DialogueId)
  if not GWorld:IsSkynetServer() and IsDedicatedServer(GWorld.GameInstance) then
    return false
  end
  if self.CompletedDialogues[DialogueId] then
    return true
  else
    return false
  end
end

function ConditionUtils:JudgeEquipPetId(PetUnitId)
  if not GWorld:IsSkynetServer() and IsDedicatedServer(GWorld.GameInstance) then
    return false
  end
  if 0 == self.CurrentPet then
    return false
  end
  if -1 == PetUnitId then
    return true
  end
  local Pet = self.Pets[self.CurrentPet]
  if Pet and Pet.PetId == PetUnitId then
    return true
  end
  return false
end

function ConditionUtils:JudgeConditionalRewardEventEnd(EventId)
  if not GWorld:IsSkynetServer() and IsDedicatedServer(GWorld.GameInstance) then
    return false
  end
  if self.ClaimActivityConditionRewardRecord[EventId] then
    return true
  else
    return false
  end
end

function ConditionUtils:JudgeDualTerminalLogin(DeviceType)
  if not GWorld:IsSkynetServer() and IsDedicatedServer(GWorld.GameInstance) then
    return false
  end
  if not self.SdkDeviceId[DeviceType] then
    DebugPrint("JudgeConditionalDualTerminalLogin", DeviceType)
    return false
  end
  DebugPrint("JudgeConditionalDualTerminalLogin true", DeviceType)
  return true
end

local function IsGameServerOrClient()
  if not GWorld:IsSkynetServer() and IsDedicatedServer(GWorld.GameInstance) then
    return false
  end
  return true
end

function ConditionUtils:JudgePlayerLvEventEnd(EventId)
  if not IsGameServerOrClient() then
    return false
  end
  local AllComplete = true
  for k, v in pairs(DataMgr.PlayerLvEvent[EventId]) do
    if self.ActivityPlayerLvRewardsGot:HasElement(EventId, k) == false then
      AllComplete = false
      break
    end
  end
  return AllComplete
end

function ConditionUtils:JudgeHardBossComplete(Params)
  local DifficultyId, Times = Params[1], Params[2]
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    return Times <= self.HardBoss:GetPassCount(DifficultyId)
  end
  return false
end

function ConditionUtils:JudgeDungeonType(Params)
  local DungeonType = Params
  if GWorld:IsSkynetServer() then
    local DungeonComponentBase = require("src.components.dungeon_components.DungeonComponentBase")
    if not DungeonComponentBase:IsDungeonRunning() then
      return false
    end
    local CurDungeonType = DungeonComponentBase:GetDungeonType()
    return CurDungeonType == DungeonType
  else
    if not WorldTravelSubsystem():IsDungeonWorld() then
      return false
    end
    local CurDungeonType = WorldTravelSubsystem():GetCurrentDungeonType()
    return CurDungeonType == DungeonType
  end
end

function ConditionUtils:JudgeRougeLikeManual(Params)
  local ManualType, ManualId, ConditionLogic = Params[1], Params[2], Params[3]
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    local bUnLocked = self.RougeLike:IsManualUnlocked(ManualType, ManualId)
    if "T" == ConditionLogic then
      return bUnLocked
    else
      return not bUnLocked
    end
  end
  return false
end

function ConditionUtils:JudgeRougeLikeComplete(Params)
  local DifficultyId = Params
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    return self.RougeLike.PassCount:Get(DifficultyId, 0) > 0
  end
  return false
end

function ConditionUtils:JudgePlayerInBattlePass(Params)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local BattlePassVersion = Avatar.BattlePassVersion
    return 0 ~= BattlePassVersion
  end
  return false
end

function ConditionUtils:JudgeTeleportIsUnlock(Params, ConditionCheckId)
  local TargetData = DataMgr.TeleportPoint[Params]
  if not (TargetData and TargetData.StaticId) or not TargetData.TeleportPointSubRegion then
    return false
  end
  if GWorld:IsSkynetServer() then
    ConditionUtils.CallClientCondition(self, "TeleportIsUnlock", Params, ConditionCheckId)
    return true
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode then
    local RegionDataMgrSubSystem = GameMode:GetRegionDataMgrSubSystem()
    if RegionDataMgrSubSystem then
      local TmpFullRegionStoreDatas = GameMode:GetRegionDataMgrSubSystem().DataLibrary:GetFullRegionStoreDatas()
      if TmpFullRegionStoreDatas then
        for _, RegionBaseData in pairs(TmpFullRegionStoreDatas) do
          if TargetData.StaticId == RegionBaseData.CreatorId and TargetData.TeleportPointSubRegion == RegionBaseData.SubRegionId then
            return RegionBaseData.State and RegionBaseData.State.OpenState or false
          end
        end
      end
    end
  end
  return false
end

function ConditionUtils:JudgeLoginDay(Params)
  local Day = Params
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    return Day <= self.TotalLoginDays
  end
  return false
end

function ConditionUtils:JudgeRougeLikePreRoom(Params)
  if not GWorld:IsSkynetServer() then
    return false
  end
  local RoomId = Params
  local SeasonId = self:GetCurrentRougeLikeSeason()
  local RougeLike = self.RougeLike:GetSeason(SeasonId)
  if not RougeLike then
    return false
  end
  return CommonUtils.HasValue(RougeLike.PassRooms, RoomId)
end

function ConditionUtils:JudgeTimeArrived(Params)
  local TimeStr = Params
  local year, month, day, hour, min, sec = TimeStr:match("(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)")
  year = tonumber(year)
  month = tonumber(month)
  day = tonumber(day)
  hour = tonumber(hour)
  min = tonumber(min)
  sec = tonumber(sec)
  local timestamp = TimeUtils.DataToTimestampForArea(year, month, day, hour, min, sec, "China")
  local now = TimeUtils.NowTime()
  return timestamp <= now
end

function ConditionUtils:JudgeHaveResourceSType(Params)
  local ResourceSType = Params[1]
  local Count = Params[2]
  if GWorld:IsSkynetServer() then
    local HaveCount = self:GetResourceSTypeCount(ResourceSType)
    return Count <= HaveCount
  elseif not IsDedicatedServer(GWorld.GameInstance) then
    local HaveCount = 0
    for _, Resource in pairs(self.Resources) do
      if Resource.ResourceSType == ResourceSType then
        HaveCount = HaveCount + Resource.Count
      end
    end
    return Count <= HaveCount
  end
  return false
end

function ConditionUtils:JudgeFollowCommunityComplete(Params)
  if GWorld:IsSkynetServer() or not IsDedicatedServer(GWorld.GameInstance) then
    local DevServerList = require("BluePrints.UI.GameLogin.DevServerList")
    if not DevServerList[self.Hostnum] then
      return false
    end
    local ServerName = DevServerList[self.Hostnum].area
    local ServerData = DataMgr.FollowCommunityEvent[ServerName]
    if not ServerData then
      return false
    end
    for _, CommunityId in ipairs(ServerData.CommunityList) do
      if not self.Community:IsRewardGot(CommunityId) then
        return false
      end
    end
    return true
  end
  return false
end

function ConditionUtils:PackParams(ConditionName, Params)
  local ResultStr = ConditionName .. ","
  if type(Params) == "table" then
    for i = 1, #Params do
      if i == #Params then
        ResultStr = ResultStr .. tostring(Params[i])
      else
        ResultStr = ResultStr .. tostring(Params[i]) .. ","
      end
    end
  else
    ResultStr = ResultStr .. tostring(Params)
  end
  return ResultStr
end

function ConditionUtils:UnpackParams(ParamStr)
  local t = CommonUtils.Split(ParamStr, ",")
  local Params = {}
  local t_len = #t
  if 2 == t_len then
    Params = t[2]
  else
    for i = 2, #t do
      Params[i - 1] = t[i]
    end
  end
  return t[1], Params
end

function ConditionUtils:GetConditionContent(ConditionId)
  local Condition = DataMgr.Condition[ConditionId]
  if not Condition then
    return {}
  end
  return Condition.ConditionMap
end

function ConditionUtils:GetConditionLogic(ConditionId)
  local Condition = DataMgr.Condition[ConditionId]
  if not Condition then
    return nil
  end
  return Condition.ConditionLogic
end

function ConditionUtils:CallDedicatedServerCondition(ConditionName, Params, ConditionCheckId)
  if not ConditionCheckId then
    return
  end
  self:CallClientMethod("CheckDedicatedServerCondition", ConditionCheckId, ConditionUtils:PackParams(ConditionName, Params))
end

function ConditionUtils:CallClientCondition(ConditionName, Params, ConditionCheckId)
  if not ConditionCheckId then
    return
  end
  self:CallClientMethod("CheckClientCondition", ConditionCheckId, ConditionUtils:PackParams(ConditionName, Params))
end

return ConditionUtils
