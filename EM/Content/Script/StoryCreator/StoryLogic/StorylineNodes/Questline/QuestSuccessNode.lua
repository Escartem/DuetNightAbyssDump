local QuestSuccessNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
QuestSuccessNode.IsSuccessNode = true

function QuestSuccessNode:OnQuestlineFinish()
  DebugPrint("----------------------------------------------------------QuestSuccessNode:OnQuestlineFinish", self:ToString())
  GWorld.UploadQuestChainData = true
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local Avatar = GWorld:GetAvatar()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not Avatar then
    DebugPrint("Avatar Is nil")
  end
  if not GameMode then
    DebugPrint("GameMode Is nil")
  end
  if self.QuestChainId > 0 and self.QuestId > 0 and Avatar and GameMode and not TaskUtils:CheckSpecialTaskDoing() then
    local RegionUpdateDatas = GameMode:GetRegionQuestChainUpdateData(self.QuestChainId)
    local RegionQuestCommonUpdateDatas = GameMode:GetRegionQuestCommonUpdateData(self.QuestId)
    GameMode:UpdateQuestRegionDatas(self.QuestChainId, RegionUpdateDatas)
    self:SaveSTLBGM()
    self:SaveAuCondition()
    local Location = PlayerCharacter:GetSafeLocation()
    if Location == FVector(0, 0, 0) then
      local LastRegionLocation = Avatar.LastRegionData:GetLocation()
      if LastRegionLocation and next(LastRegionLocation) then
        Location = FVector(LastRegionLocation.X, LastRegionLocation.Y, LastRegionLocation.Z)
      end
    end
    local Rotation = PlayerCharacter.CurrentRotation
    local QuestCoordinate = {
      LastRegionId = PlayerCharacter:GetRegionId(Location),
      Location = {
        X = Location.X,
        Y = Location.Y,
        Z = Location.Z
      },
      Rotation = {
        Pitch = Rotation.Pitch,
        Yaw = Rotation.Yaw,
        Roll = Rotation.Roll
      }
    }
    local STLExportInfo = DataMgr.STLExportQuestChain[self.QuestChainId]
    local IsPreQuest = false
    if STLExportInfo and STLExportInfo.Quests[self.QuestId] ~= nil and STLExportInfo.Quests[self.QuestId].IsPreQuest then
      IsPreQuest = STLExportInfo.Quests[self.QuestId].IsPreQuest
    end
    if IsPreQuest then
      local ServerParamTable = {}
      ServerParamTable.QuestChainId = self.QuestChainId
      ServerParamTable.QuestId = self.QuestId
      ServerParamTable.TriggerType = CommonConst.QuestState.Success
      ServerParamTable.TargetId = nil
      ServerParamTable.TargetCount = nil
      ServerParamTable.STLData = self.Context.STLData
      ServerParamTable.RegionQuestDatas = RegionUpdateDatas
      ServerParamTable.NextId = nil
      ServerParamTable.QuestCoordinate = QuestCoordinate
      ServerParamTable.QuestCommonDatas = RegionQuestCommonUpdateDatas
      Avatar:HandleQuestChainDoing_QuestComplete(ServerParamTable)
    else
      Avatar:CompleteQuestSuccess(self.QuestChainId, self.QuestId, nil, nil, nil, self.Context.STLData, RegionUpdateDatas, self.PortName, QuestCoordinate, RegionQuestCommonUpdateDatas)
    end
    AudioManager(GWorld.GameInstance):ClearSTLBGM()
    local TaskInfo = {
      TaskChainId = self.QuestChainId,
      TaskId = self.QuestId,
      IsChainLastTask = self.bIsEndQuest,
      IsChapterEnd = self.bIsEndChapter
    }
    Avatar:DoRefreshTaskItemUIInfo("Delete", TaskInfo)
  end
  if TaskUtils:CheckSpecialTaskDoing() and self.QuestData.QuestDescription ~= "" and "" ~= self.QuestData.QuestDeatil then
    TaskUtils:UpdateSpecialTaskInfo("DeleteSpecialTaskInfo", nil)
  end
  local TalkTriggerId = self:GetPayload("TalkTriggerId")
  local TalkTrigger = DataMgr.TalkTrigger[TalkTriggerId]
  if TalkTrigger then
    EventManager:FireEvent(EventID.OnTalkTriggerComplete, TalkTriggerId)
    if TalkTrigger.Type == "Impression" then
      Avatar:SetTalkTriggerComplete_New(TalkTriggerId)
    end
  end
  PlayerCharacter:SavePlayerSkillUsedTimes()
  GWorld.UploadQuestChainData = false
  return
end

function QuestSuccessNode:SaveSTLBGM()
  local EventName, Key, Value
  local NeedStore = false
  local RelatedRegionId = 0
  EventName, Key, Value, RelatedRegionId, NeedStore = AudioManager(GWorld.GameInstance):GetCurPlaySTLBGM(0)
  RelatedRegionId = RelatedRegionId:ToTable()
  if true == NeedStore then
    DebugPrint("HYY BGM Store", EventName, Key, Value)
    PrintTable(RelatedRegionId)
    self.Context:SaveSuitUpdateData("UpdateSuitKey2Value", CommonConst.SuitType.PlayerCharacterSuit, CommonConst.PlayerCharacterSuit.BGM, 0, EventName, Key, Value, RelatedRegionId)
  else
    DebugPrint("HYY BGM Clear")
    self.Context:SaveSuitUpdateData("UpdateSuitKey2Value", CommonConst.SuitType.PlayerCharacterSuit, CommonConst.PlayerCharacterSuit.BGM, 0, nil)
  end
  EventName = nil
  Key = nil
  Value = nil
  NeedStore = false
  EventName, Key, Value, RelatedRegionId, NeedStore = AudioManager(GWorld.GameInstance):GetCurPlaySTLBGM(1)
  RelatedRegionId = RelatedRegionId:ToTable()
  if true == NeedStore then
    DebugPrint("HYY Noise Store", EventName, Key, Value, RelatedRegionId)
    self.Context:SaveSuitUpdateData("UpdateSuitKey2Value", CommonConst.SuitType.PlayerCharacterSuit, CommonConst.PlayerCharacterSuit.BGM, 1, EventName, Key, Value, RelatedRegionId)
  else
    DebugPrint("HYY Noise Clear")
    self.Context:SaveSuitUpdateData("UpdateSuitKey2Value", CommonConst.SuitType.PlayerCharacterSuit, CommonConst.PlayerCharacterSuit.BGM, 1, nil)
  end
  EventName = nil
  Key = nil
  Value = nil
  NeedStore = false
  EventName, Key, Value, RelatedRegionId, NeedStore = AudioManager(GWorld.GameInstance):GetCurPlaySTLBGM(2)
  RelatedRegionId = RelatedRegionId:ToTable()
  if true == NeedStore then
    DebugPrint("HYY SnapShot Store", EventName, Key, Value, RelatedRegionId)
    self.Context:SaveSuitUpdateData("UpdateSuitKey2Value", CommonConst.SuitType.PlayerCharacterSuit, CommonConst.PlayerCharacterSuit.BGM, 2, EventName, Key, Value, RelatedRegionId)
  else
    DebugPrint("HYY SnapShot Clear")
    self.Context:SaveSuitUpdateData("UpdateSuitKey2Value", CommonConst.SuitType.PlayerCharacterSuit, CommonConst.PlayerCharacterSuit.BGM, 2, nil)
  end
end

function QuestSuccessNode:SaveAuCondition()
  local NeedStore = false
  local SavedAuCondition
  SavedAuCondition, NeedStore = AudioManager(GWorld.GameInstance):SaveAuCondition()
  if true == NeedStore then
    SavedAuCondition = SavedAuCondition:ToTable()
    DebugPrint("Store AuCondition")
    self.Context:SaveSuitUpdateData("UpdateSuitKey2Table", CommonConst.SuitType.PlayerCharacterSuit, CommonConst.PlayerCharacterSuit.BGMParams, "BGMParams", SavedAuCondition)
  else
    self.Context:SaveSuitUpdateData("UpdateSuitKey2Table", CommonConst.SuitType.PlayerCharacterSuit, CommonConst.PlayerCharacterSuit.BGMParams, "BGMParams", nil)
  end
end

return QuestSuccessNode
