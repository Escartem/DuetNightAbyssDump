local MiscUtils = require("Utils.MiscUtils")
local EMGlobalLuaTable = {}

function EMGlobalLuaTable.TriggerBattleEvent(Battle, EventName, ...)
  Battle:TriggerLuaBattleEvent(EventName, ...)
end

function EMGlobalLuaTable.TriggerEventManager(EventName, ...)
  EventManager:FireEvent(EventName, ...)
end

function EMGlobalLuaTable.RemoveEvent(EventName, Object)
  EventManager:RemoveEvent(EventName, Object)
end

function EMGlobalLuaTable.TriggerDungeonComponentFun(GameMode, EventName, ...)
  if GameMode and EventName then
    GameMode:TriggerDungeonComponentFun(EventName, ...)
  end
end

function EMGlobalLuaTable.SkillUtilsSplitEval(Desc)
  local SkillUtils = require("Utils.SkillUtils")
  return SkillUtils.SplitEval(Desc, "$")
end

function EMGlobalLuaTable.GetTaskTargetPointPos()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local TaskIndicator = UIManager:GetUIObj("TaskIndicator")
  if IsValid(TaskIndicator) and TaskIndicator.TargetPointPos ~= nil then
    return TaskIndicator.TargetPointPos
  end
  return UE4.FVector(0, 0, 0)
end

function EMGlobalLuaTable.GetTransEPhysicalSurface(PhysicalSurface)
  return MiscUtils.TransEPhysicalSurface(PhysicalSurface)
end

function EMGlobalLuaTable.ShowRougeLikeError(Text)
  local BP_RougeLikeManager_C = require("BluePrints.GameMode.BP_RougeLikeManager_C")
  BP_RougeLikeManager_C:ShowRougeLikeError(Text)
end

function EMGlobalLuaTable.MakeTempFlexibleMap(FlexibleShowHideTags)
  local NewFlexibleMap = {}
  local FNpcArrayNum = FlexibleShowHideTags:Num()
  for FNpcArray, IsHide in pairs(FlexibleShowHideTags) do
    local NewFlexibleMapElement = {}
    NewFlexibleMapElement.NpcArray = FNpcArray
    NewFlexibleMapElement.IsHide = IsHide
    NewFlexibleMap[FNpcArrayNum] = NewFlexibleMapElement
    FNpcArrayNum = FNpcArrayNum - 1
  end
  return NewFlexibleMap
end

function EMGlobalLuaTable.CustomNpcFlexibShow(FlexibleShowHideTags)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return true
  end
  local TempFlexibleMap = EMGlobalLuaTable.MakeTempFlexibleMap(FlexibleShowHideTags)
  for i = 1, FlexibleShowHideTags:Num() do
    local TargetQuestId = TempFlexibleMap[i].NpcArray.Quest.QuestId
    local TargetQuestState = TempFlexibleMap[i].NpcArray.Quest.MyQuestState
    local TargetTalkTriggerId = TempFlexibleMap[i].NpcArray.ImpressionTalk.TalkTriggerId
    local TalkState = TempFlexibleMap[i].NpcArray.ImpressionTalk.TalkQuestState
    local FlexibleQuestChainId = TempFlexibleMap[i].NpcArray.QuestChain.QuestChainId
    local FlexibleQuestChainState = TempFlexibleMap[i].NpcArray.QuestChain.QuestChainState
    if 0 == TempFlexibleMap[i].NpcArray.EditableStructType then
      local QuestChainId = tonumber(string.sub(TargetQuestId, 1, 6))
      local QuestStateType = {Doing = 1, Success = 2}
      if not Avatar.QuestChains[QuestChainId] then
      else
        local QuestChains = Avatar.QuestChains[QuestChainId]
        if TargetQuestState == QuestStateType.Doing and QuestChains.DoingQuestId == TargetQuestId then
          return TempFlexibleMap[i].IsHide
        else
          if TargetQuestState == QuestStateType.Success and QuestChains:CheckQuestIdComplete(TargetQuestId) then
            return TempFlexibleMap[i].IsHide
          else
          end
        end
      end
    elseif 1 == TempFlexibleMap[i].NpcArray.EditableStructType then
      local TalkStateType = {
        Compelete = 0,
        UnCompelete = 1,
        CheckSuccess = 2,
        CheckFail = 3
      }
      if TalkState == TalkStateType.Compelete then
        if Avatar:IsStorylineComplete(TargetTalkTriggerId) then
          return TempFlexibleMap[i].IsHide
        end
      elseif TalkState == TalkStateType.UnCompelete then
        if Avatar:IsStorylineUnComplete(TargetTalkTriggerId) then
          return TempFlexibleMap[i].IsHide
        end
      elseif TalkState == TalkStateType.CheckSuccess then
        if Avatar:IsStorylineSuccess(TargetTalkTriggerId) then
          return TempFlexibleMap[i].IsHide
        end
      else
        if TalkState == TalkStateType.CheckFail and Avatar:IsStorylineFailure(TargetTalkTriggerId) then
          return TempFlexibleMap[i].IsHide
        else
        end
      end
    elseif 2 == TempFlexibleMap[i].NpcArray.EditableStructType then
      local QuestChainStateType = {Doing = 1, Success = 2}
      if not Avatar.QuestChains[FlexibleQuestChainId] then
      else
        local TargetQuestChain = Avatar.QuestChains[FlexibleQuestChainId]
        if FlexibleQuestChainState == QuestChainStateType.Doing and TargetQuestChain:IsDoing() then
          return TempFlexibleMap[i].IsHide
        else
          if FlexibleQuestChainState == QuestChainStateType.Success and TargetQuestChain:IsFinish() then
            return TempFlexibleMap[i].IsHide
          else
          end
        end
      end
    end
  end
  return true
end

function EMGlobalLuaTable.CustomNpcAtmosShow(AtmosphereTagArray)
  if 0 == AtmosphereTagArray:Num() then
    return true
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local SuitData = Avatar.Suits:GetSuitBase(CommonConst.SuitType.PlayerCharacterSuit)
    if SuitData and SuitData:GetSubSuitBase(CommonConst.PlayerCharacterSuit.NpcHideShowTag) then
      local SubSuitData = SuitData:GetSubSuitBase(CommonConst.PlayerCharacterSuit.NpcHideShowTag)
      for Tag, Value in pairs(SubSuitData) do
        if AtmosphereTagArray:Contains(Tag) and true == Value then
          return false
        end
      end
    end
  end
  return true
end

return EMGlobalLuaTable
