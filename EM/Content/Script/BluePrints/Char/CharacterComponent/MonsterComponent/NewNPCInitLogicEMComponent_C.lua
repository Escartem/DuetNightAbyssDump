require("UnLua")
local EffectResults = require("BluePrints.Combat.BattleLogic.EffectResults")
local M = Class({
  "BluePrints.Common.TimerMgr"
})

function M:TriggerSTLPostStaticCreatorEvent(Mode, Actor)
  Mode:TriggerSTLEvent("STLPostStaticCreatorEvent", Actor)
end

function M:PreInit_Lua(UnitType, UnitId)
  self.Owner.Data = DataMgr[UnitType][UnitId]
  if not self.Owner.BornInfo then
    self.Owner.BornInfo = EffectResults.Result()
  end
end

function M:CacheBornInfo()
  if not self.Owner.BornInfo then
    self.Owner.BornInfo = EffectResults.Result()
  end
end

function M:GetData(UnitType, UnitId)
  self.Owner.Data = DataMgr[UnitType][UnitId]
end

function M:PrepareWaitInitTags_Lua()
  if self.Owner:IsNeedHideInTalk() then
    EventManager:AddEvent(EventID.TalkEnableMonsterSpawn, self, self.OnTalkEnableMonsterSpawn)
    self:SetWaitInitTag(true, Const.CharWaitInitTag.HideInTalk)
  end
  if self.Owner.LoadingAssetState == ENpcLoadingAssetState.EBodyMesh then
    self:SetWaitInitTag(true, "NpcMeshLoading")
  end
end

function M:SyncServerBornInfo()
  self.Owner.ServerBornInfo = self.Owner.BornInfo:ToEffectStruct()
end

function M:CallBPReceiveBeginAndCharacterReady()
  self.Owner.Overridden.ReceiveBeginPlay(self.Owner)
  self.Owner.Overridden.OnCharacterReady(self.Owner)
end

function M:OnPostInitSucc()
  if self.Owner.OnPostInitSucc then
    self.Owner:OnPostInitSucc()
  end
end

function M:ClientInteractiveStateRecover()
  if self.Owner.ClientInteractiveStateRecover then
    self.Owner:ClientInteractiveStateRecover(Info)
  end
end

function M:InitInteractiveState(WorldRegionEid)
  if self.Owner.InitInteractiveState then
    self.Owner:InitInteractiveState(WorldRegionEid)
  end
end

function M:CheckIsActiveFlexibleDestory(Object)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local TempFlexibleMap = {}
  local FNpcArrayNum = Object.FlexibleActiveInactive:Num()
  for FNpcActiveArray, IsActive in pairs(Object.FlexibleActiveInactive) do
    local NewFlexibleMapElement = {}
    NewFlexibleMapElement.NpcActiveArray = FNpcActiveArray
    NewFlexibleMapElement.IsActive = IsActive
    TempFlexibleMap[FNpcArrayNum] = NewFlexibleMapElement
    FNpcArrayNum = FNpcArrayNum - 1
  end
  if IsEmptyTable(TempFlexibleMap) then
    return false
  end
  for i = 1, Object.FlexibleActiveInactive:Num() do
    local IsActive = TempFlexibleMap[i].IsActive
    if IsActive then
    else
      local TargetQuestId = TempFlexibleMap[i].NpcActiveArray.Quest.QuestId
      local TargetQuestState = TempFlexibleMap[i].NpcActiveArray.Quest.MyQuestState
      local TargetTalkTriggerId = TempFlexibleMap[i].NpcActiveArray.ImpressionTalk.TalkTriggerId
      local TalkState = TempFlexibleMap[i].NpcActiveArray.ImpressionTalk.TalkQuestState
      local FlexibleQuestChainId = TempFlexibleMap[i].NpcActiveArray.QuestChain.QuestChainId
      local FlexibleQuestChainState = TempFlexibleMap[i].NpcActiveArray.QuestChain.QuestChainState
      if 0 == TempFlexibleMap[i].NpcActiveArray.EditableStructType then
        local QuestChainId = tonumber(string.sub(TargetQuestId, 1, 6))
        local QuestStateType = {Doing = 1, Success = 2}
        if not Avatar.QuestChains[QuestChainId] then
          DebugPrint("QuestChain is unexist:", QuestChainId)
        else
          local QuestChains = Avatar.QuestChains[QuestChainId]
          if TargetQuestState == QuestStateType.Doing and QuestChains.DoingQuestId == TargetQuestId then
            return true
          elseif TargetQuestState == QuestStateType.Success and QuestChains:CheckQuestIdComplete(TargetQuestId) then
            return true
          else
            DebugPrint("QuestChain state is error:", QuestChainId)
          end
        end
      elseif 1 == TempFlexibleMap[i].NpcActiveArray.EditableStructType then
        local TalkStateType = {
          Compelete = 0,
          UnCompelete = 1,
          CheckSuccess = 2,
          CheckFail = 3
        }
        if TalkState == TalkStateType.Compelete then
          if Avatar:IsStorylineComplete(TargetTalkTriggerId) then
            return true
          end
        elseif TalkState == TalkStateType.UnCompelete then
          if Avatar:IsStorylineUnComplete(TargetTalkTriggerId) then
            return true
          end
        elseif TalkState == TalkStateType.CheckSuccess then
          if Avatar:IsStorylineSuccess(TargetTalkTriggerId) then
            return true
          end
        else
          if TalkState == TalkStateType.CheckFail and Avatar:IsStorylineFailure(TargetTalkTriggerId) then
            return true
          else
          end
        end
      elseif 2 == TempFlexibleMap[i].NpcActiveArray.EditableStructType then
        local QuestChainStateType = {Doing = 1, Success = 2}
        if not Avatar.QuestChains[FlexibleQuestChainId] then
          DebugPrint("QuestChain is unexist:", FlexibleQuestChainId)
        elseif FlexibleQuestChainState == QuestChainStateType.Doing and Avatar:IsQuestChainDoing(FlexibleQuestChainId) then
          return true
        elseif FlexibleQuestChainState == QuestChainStateType.Success and Avatar:IsQuestChainFinished(FlexibleQuestChainId) then
          return true
        else
          DebugPrint("QuestChain state is error:", FlexibleQuestChainId)
        end
      end
    end
  end
  return false
end

function M:TrySetRandomPetShowOrHideState(RandomCreatorId, WorldRegionEid)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local OwnerUnitId = self.Owner.UnitId
  local IsCarryRarity = false
  if DataMgr.Pet[OwnerUnitId] and DataMgr.Pet[OwnerUnitId].Rarity >= DataMgr.GlobalConstant.PetRareLevel.ConstantValue then
    IsCarryRarity = true
  end
  local AvatarTryMaxPetRegionId = Avatar.TryMaxPetRegionId
  local CurrentRegionId = Avatar:GetSubRegionId2RegionId()
  if 0 == Avatar.TryMaxPetRegionId then
    if GameState.RegionRandomPetLimitedDailyCount <= 0 and IsCarryRarity then
      self.Owner:SetActorHideTag("RandomDailyLimit", true)
      self.Owner:SetActorNoCollisionTag(true, "RandomDailyLimit")
    else
      self.Owner:SetActorHideTag("RandomDailyLimit", false)
      self.Owner:SetActorNoCollisionTag(false, "RandomDailyLimit")
    end
  elseif CurrentRegionId == AvatarTryMaxPetRegionId then
    self.Owner:SetActorHideTag("RandomDailyLimit", false)
    self.Owner:SetActorNoCollisionTag(false, "RandomDailyLimit")
  end
end

return M
