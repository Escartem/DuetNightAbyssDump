local PlayOrStopBGMNode = Class("StoryCreator.StoryLogic.StorylineNodes.Questline.QuestNode")

function PlayOrStopBGMNode:Init()
  self.SoundStateType = 0
  self.SoundPriority = 0
  self.SoundType = 0
  self.SoundUnitKey = ""
  self.SoundPath = ""
  self.ParamKey = ""
  self.ParamValue = 0
  self.RelatedRegionId = {}
  self.ClientRelatedRegionId = {}
  self.bStoreToServer = true
end

function PlayOrStopBGMNode:Start(Context)
  DebugPrint("-----------------------------------PlayOrStopBGMNode-----------------------------------")
  DebugPrint(self.SoundStateType, self.SoundPriority, self.SoundType, self.SoundUnitKey, self.SoundPath, self.ParamKey, self.ParamValue, self.RelatedRegionId, self.bStoreToServer)
  PrintTable(self.RelatedRegionId, 3)
  PrintTable(self.ClientRelatedRegionId, 3)
  self.Context = Context
  local GameInstance = GWorld.GameInstance
  if 0 == self.SoundStateType then
    local Event
    if string.find(self.SoundPath, "/Game/Asset/") then
      Event = UE4.LoadObject(self.SoundPath)
    else
      Event = UFMODBlueprintStatics.FindEventByName(self.SoundPath)
    end
    if not Event then
      DebugPrint("Error: PlayOrStopBGMNode EventPath is Wrong!", self.EventPath)
      self:FinishAction()
      return
    end
    local RelatedRegionIdArray = {}
    for _, Id in pairs(self.RelatedRegionId) do
      table.insert(RelatedRegionIdArray, Id)
    end
    local ClientRelatedRegionIdArray = {}
    for _, Id in pairs(self.ClientRelatedRegionId) do
      table.insert(ClientRelatedRegionIdArray, Id)
    end
    if 0 == self.SoundPriority then
      AudioManager(GameInstance):StoreLastSTLBGM(self.SoundType)
      AudioManager(GameInstance):PlayLevelSound(self.SoundType, Event, RelatedRegionIdArray, ClientRelatedRegionIdArray, self.ParamKey, self.ParamValue, false, self.bStoreToServer)
    elseif 1 == self.SoundPriority then
      AudioManager(GameInstance):PlayInviteBGM(self.SoundType, Event, self.ParamKey, self.ParamValue, RelatedRegionIdArray, ClientRelatedRegionIdArray)
    elseif 2 == self.SoundPriority then
      if self.SoundUnitKey == "" then
        DebugPrint("Error: PlayOrStopBGMNode Play. SoundPriority is StoryCustom but SoundUnitKey is Empty!")
        self:FinishAction()
        return
      end
      AudioManager(GameInstance):PlayStoryCustomBGM(self.SoundType, Event, self.SoundUnitKey, self.ParamKey, self.ParamValue, RelatedRegionIdArray, ClientRelatedRegionIdArray)
    end
  elseif 3 == self.SoundStateType then
    if 0 == self.SoundPriority then
      AudioManager(GameInstance):StoreLastSTLBGM(self.SoundType)
      AudioManager(GameInstance):StopLevelSound(self.SoundType)
    elseif 1 == self.SoundPriority then
      AudioManager(GameInstance):StopInviteBGM(self.SoundType)
    elseif 2 == self.SoundPriority then
      if self.SoundUnitKey == "" then
        DebugPrint("Error: PlayOrStopBGMNode Stop. SoundPriority is StoryCustom but SoundUnitKey is Empty!")
        self:FinishAction()
        return
      end
      AudioManager(GameInstance):StopStoryCustomBGM(self.SoundType, self.SoundUnitKey)
    end
  elseif 1 == self.SoundStateType then
    AudioManager(GameInstance):SetSceneSoundPause(self.SoundType, true)
  elseif 2 == self.SoundStateType then
    AudioManager(GameInstance):SetSceneSoundPause(self.SoundType, false)
  end
  self:FinishAction()
end

function PlayOrStopBGMNode:FinishAction()
  self:Finish()
end

return PlayOrStopBGMNode
