local M = {}
local PlayTypes = {
  Play = "Play",
  Pause = "Pause",
  Resume = "Resume",
  Stop = "Stop"
}
local SoundPrioritys = {
  Level = "Level",
  StoryCustom = "StoryCustom",
  Invite = "Invite"
}
local SoundTypeMap = {
  SOUND_BGM = 0,
  SOUND_NOISE = 1,
  SOUND_SNAPSHOT = 2
}

function M:CreateNode(Flow, TalkTask, Params)
  local SoundPriority = Params.SoundPriority or SoundPrioritys.Level
  local SoundUnitKey = Params.SoundUnitKey or ""
  local EventPath = Params.EventPath or ""
  local Key = Params.Key or ""
  local Value = Params.Value or 0
  local RelatedRegionId = Params.RelatedRegionId or {}
  local ClientRelatedRegionId = Params.ClientRelatedRegionId or {}
  local bStoreToServer = Params.bStoreToServer or true
  local SoundType = SoundTypeMap[Params.SoundType]
  local PlayType = Params.PlayType
  local RelateRegionIdArray = {}
  if type(RelatedRegionId) == "table" then
    for _, Id in pairs(RelatedRegionId) do
      table.insert(RelateRegionIdArray, Id)
    end
  elseif 0 ~= RelatedRegionId then
    RelateRegionIdArray = {RelatedRegionId}
  end
  local ClientRelatedRegionIdArray = {}
  for _, Id in pairs(ClientRelatedRegionId) do
    table.insert(ClientRelatedRegionIdArray, Id)
  end
  local AudioNode = Flow:CreateNode(UEFNode_Delegate)
  AudioNode.DebugLog = string.format("PlayOrStopBGM EventPath: %s", EventPath)
  self.AudioManager = AudioManager(AudioNode)
  AudioNode.OnSkip:Add(AudioNode, function(Node)
    Node:Finish({
      Node.FinishPin
    })
  end)
  AudioNode.OnStart:Add(AudioNode, function(Node)
    if not SoundType then
      DebugPrint("Error: TalkDSL PlayOrStopBGM Func SoundType is Empty!")
      Node:Finish({
        Node.FinishPin
      })
      return
    end
    if PlayType == PlayTypes.Play then
      self:PlayBGM(SoundPriority, SoundType, EventPath, Key, Value, RelateRegionIdArray, ClientRelatedRegionIdArray, bStoreToServer, SoundUnitKey)
    elseif PlayType == PlayTypes.Pause then
      self:PauseBGM(SoundType)
    elseif PlayType == PlayTypes.Resume then
      self:ResumeBGM(SoundType)
    elseif PlayType == PlayTypes.Stop then
      self:StopBGM(SoundPriority, SoundType, SoundUnitKey)
    else
      DebugPrint("Error: TalkDSL PlayOrStopBGM Func PlayType is Wrong!", PlayType)
    end
    Node:Finish({
      Node.FinishPin
    })
  end)
  return AudioNode
end

function M:PlayBGM(SoundPriority, SoundType, EventPath, Key, Value, RelatedRegionId, ClientRelatedRegionId, bStoreToServer, SoundUnitKey)
  local Event
  if string.find(EventPath, "/Game/Asset/") then
    Event = UE4.LoadObject(EventPath)
  else
    Event = UFMODBlueprintStatics.FindEventByName(EventPath)
  end
  if SoundPriority == SoundPrioritys.Level then
    self:PlayLevelBGM(SoundType, Event, Key, Value, RelatedRegionId, ClientRelatedRegionId, bStoreToServer)
  elseif SoundPriority == SoundPrioritys.StoryCustom then
    self:PlayStoryCustomBGM(SoundType, Event, Key, Value, RelatedRegionId, ClientRelatedRegionId, bStoreToServer, SoundUnitKey)
  elseif SoundPriority == SoundPrioritys.Invite then
    self:PlayInviteBGM(SoundType, Event, Key, Value, RelatedRegionId, ClientRelatedRegionId, bStoreToServer)
  else
    DebugPrint("Error: TalkDSL PlayOrStopBGM Func Play. SoundPriority is Wrong!", SoundPriority)
  end
end

function M:PlayLevelBGM(SoundType, Event, Key, Value, RelatedRegionId, ClientRelatedRegionId, bStoreToServer)
  self.AudioManager:StoreLastSTLBGM(SoundType)
  self.AudioManager:PlayLevelSound(SoundType, Event, RelatedRegionId, ClientRelatedRegionId, Key, Value, false, bStoreToServer)
end

function M:PlayInviteBGM(SoundType, Event, Key, Value, RelatedRegionId, ClientRelatedRegionId, bStoreToServer)
  self.AudioManager:PlayInviteBGM(SoundType, Event, Key, Value, RelatedRegionId, ClientRelatedRegionId)
end

function M:PlayStoryCustomBGM(SoundType, Event, Key, Value, RelatedRegionId, ClientRelatedRegionId, bStoreToServer, SoundUnitKey)
  if "" == SoundUnitKey then
    DebugPrint("Error: TalkDSL PlayOrStopBGM Func Stop. SoundPriority is StoryCustom but SoundUnitKey is Empty!")
    return
  end
  self.AudioManager:PlayStoryCustomBGM(SoundType, Event, SoundUnitKey, Key, Value, RelatedRegionId, ClientRelatedRegionId)
end

function M:PauseBGM(SoundType)
  self.AudioManager:SetSceneSoundPause(SoundType, true)
end

function M:StopBGM(SoundPriority, SoundType, SoundUnitKey)
  if SoundPriority == SoundPrioritys.Level then
    self:StopLevelBGM(SoundType)
  elseif SoundPriority == SoundPrioritys.StoryCustom then
    self:StopStoryCustomBGM(SoundType, SoundUnitKey)
  elseif SoundPriority == SoundPrioritys.Invite then
    self:StopInviteBGM(SoundType)
  else
    DebugPrint("Error: TalkDSL PlayOrStopBGM Func Play. SoundPriority is Wrong!", SoundPriority)
  end
end

function M:StopLevelBGM(SoundType)
  self.AudioManager:StoreLastSTLBGM(SoundType)
  self.AudioManager:StopLevelSound(SoundType)
end

function M:StopInviteBGM(SoundType)
  self.AudioManager:StopInviteBGM(SoundType)
end

function M:StopStoryCustomBGM(SoundType, SoundUnitKey)
  if "" == SoundUnitKey then
    DebugPrint("Error: TalkDSL PlayOrStopBGM Func Stop. SoundPriority is StoryCustom but SoundUnitKey is Empty!")
    return
  end
  self.AudioManager:StopStoryCustomBGM(SoundType, SoundUnitKey)
end

function M:ResumeBGM(SoundType)
  self.AudioManager:SetSceneSoundPause(SoundType, false)
end

return M
