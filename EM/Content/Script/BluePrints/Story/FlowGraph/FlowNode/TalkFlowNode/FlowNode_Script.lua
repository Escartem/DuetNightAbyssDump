local M = Class("BluePrints.Story.FlowGraph.FlowNode.TalkFlowNode.FlowNode_TalkNodeBase")
local WaitTask = {}
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

function WaitTask.New(OnStart, OnStop, OnFinish)
  local Obj = setmetatable({}, {__index = WaitTask})
  Obj.OnStart = OnStart
  Obj.OnStop = OnStop
  Obj.OnFinish = OnFinish
  return Obj
end

function WaitTask:RunTask()
  local function Finish()
    self:FinishTask()
  end
  
  if self.OnStart then
    self.OnStart(Finish)
  else
    Finish()
  end
end

function WaitTask:FinishTask()
  self.OnFinish()
  setmetatable(self, nil)
end

function WaitTask:StopTask()
  if self.OnStop then
    self.OnStop()
  end
  self:FinishTask()
end

local WaitTaskQueue = {}

function WaitTaskQueue.New(OnAllFinish)
  local Obj = setmetatable({}, {__index = WaitTaskQueue})
  Obj.TaskQueue = {}
  Obj.OnAllFinish = OnAllFinish
  return Obj
end

function WaitTaskQueue:OnTaskFinish(Task)
  self.TaskQueue[Task] = nil
  self:TryFinish()
end

function WaitTaskQueue:TryFinish()
  if next(self.TaskQueue) == nil then
    local OnAllFinish = self.OnAllFinish
    self.OnAllFinish = nil
    if OnAllFinish then
      OnAllFinish()
    end
  end
end

function WaitTaskQueue:AddTask(Guid, KeyName, OnStart, OnStop, OnFinish)
  local Task
  
  local function StartWrapper(Finish)
    DebugPrint("FlowNode_Script: ", Guid, " ", KeyName, " Start")
    if OnStart then
      OnStart(Finish)
    else
      Finish()
    end
  end
  
  Task = WaitTask.New(StartWrapper, OnStop, function()
    DebugPrint("FlowNode_Script: ", Guid, " ", KeyName, " Finished")
    if OnFinish then
      OnFinish()
    end
    self:OnTaskFinish(Task)
  end)
  self.TaskQueue[Task] = true
end

function WaitTaskQueue:TryRun()
  local TaskCopy = {}
  for Task, _ in pairs(self.TaskQueue) do
    TaskCopy[Task] = true
  end
  for Task, _ in pairs(TaskCopy) do
    Task:RunTask()
  end
end

function WaitTaskQueue:TryStop()
  local TaskCopy = {}
  for Task, _ in pairs(self.TaskQueue) do
    TaskCopy[Task] = true
  end
  for Task, _ in pairs(TaskCopy) do
    Task:StopTask()
  end
end

function WaitTaskQueue:SetEmptyOnFinish()
  self.OnAllFinish = nil
end

function M:Init_Lua()
  self.TaskQueue = WaitTaskQueue.New(function()
    self:ExecuteSelfDefaultEnd()
  end)
end

function M:RunTask_Lua()
  self.TaskQueue:TryRun()
end

function M:Stop()
  self:ExecuteSelfDefaultEnd()
end

function M:K2_Cleanup()
  self.TaskQueue:SetEmptyOnFinish()
  self.TaskQueue:TryStop()
  self.TaskQueue = nil
end

function M:QuestEventMonsterOrNpc(AI, UnitId, MessageContent)
  if IsValid(AI) and tonumber(UnitId) == tonumber(AI.UnitId) then
    local BB = AI:GetOwnBlackBoardComponent()
    if BB then
      BB:SetValueAsString("QuestEvent", MessageContent)
    else
      DebugPrint("ERROR:AI.UnitId:" .. AI.UnitId .. ", AI:GetName " .. AI:GetName() .. " BehaviorTree Is nil")
    end
  end
end

function M:SendMessage_GameMode(Index, MessageType, MessageContent)
  local Guid = self:GetGuidString()
  self.TaskQueue:AddTask(Guid, "SendMessage_GameMode", function(OnFinish)
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if not IsValid(GameMode) then
      OnFinish()
      return
    end
    GameMode:PostCustomEvent(MessageContent)
    OnFinish()
  end, function()
  end)
end

function M:SendMessage_BehaviorTree(Index, MessageType, MessageContent, UnitId)
  local Guid = self:GetGuidString()
  self.TaskQueue:AddTask(Guid, "SendMessage_BehaviorTree", function(OnFinish)
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    for _, Monster in pairs(GameState.MonsterMap) do
      self:QuestEventMonsterOrNpc(Monster)
    end
    for _, Npc in pairs(GameState.NpcMap) do
      self:QuestEventMonsterOrNpc(Npc, UnitId, MessageContent)
    end
    OnFinish()
  end, function()
  end)
end

function M:SetTag(Index, TagName, Value)
  local Guid = self:GetGuidString()
  self.TaskQueue:AddTask(Guid, "SetTag", function(OnFinish)
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      OnFinish()
      return
    end
    Avatar:SetTalkTag(TagName, Value)
    OnFinish()
  end, function()
  end)
end

function M:UnSetTag(Index, TagName)
  local Guid = self:GetGuidString()
  self.TaskQueue:AddTask(Guid, "UnSetTag", function(OnFinish)
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      OnFinish()
      return
    end
    Avatar:UnSetTalkTag(TagName)
    OnFinish()
  end, function()
  end)
end

function M:PlayOrStopBGM(Params)
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
  self.AudioManager = AudioManager(self)
  local Guid = self:GetGuidString()
  self.TaskQueue:AddTask(Guid, "PlayOrStopBGM", function(OnFinish)
    if not SoundType then
      DebugPrint("Error: FlowNodeScript PlayOrStopBGM Func SoundType is Empty!")
      return OnFinish()
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
      DebugPrint("Error: FlowNodeScript PlayOrStopBGM Func PlayType is Wrong!", PlayType)
    end
    OnFinish()
  end, function()
  end)
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

function M:PlayorOrStopSound(Params)
  local EventPath = Params.EventPath
  local TargetPointName = Params.TargetPointName
  local EventKey = Params.EventKey
  local PlayAs2D = Params.PlayAs2D
  local bIsStop = Params.bIsStop
  local Guid = self:GetGuidString()
  self.TaskQueue:AddTask(Guid, "PlayorOrStopSound", function(OnFinish)
    local TargetPoint
    if TargetPointName then
      local GameState = UE4.UGameplayStatics.GetGameState(self)
      TargetPoint = GameState:GetTargetPoint(TargetPointName)
    end
    if bIsStop then
      AudioManager(self):StopSound(TargetPoint, EventKey)
    else
      AudioManager(self):PlayNormalSound(TargetPoint, nil, EventPath, EventKey, PlayAs2D)
    end
    OnFinish()
  end, function()
  end)
end

function M:ShowPicture(Params)
  local PictureId = Params.PictureId
  local FadeInTime = Params.FadeInTime or 0
  local FadeOutTime = Params.FadeOutTime or 0
  local Duration = Params.Duration or 0
  local TalkTask = self:TryGetTalkTask()
  local DurationHandle
  local Guid = self:GetGuidString()
  
  local function OnFinish()
    if DurationHandle then
      UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(self, DurationHandle)
      DurationHandle = nil
    end
    TalkTask.TalkTaskData.UI:TryHideLastDialoguePic()
  end
  
  self.TaskQueue:AddTask(Guid, "ShowPicture", function(Finish)
    TalkTask.TalkTaskData.UI:ShowPicture(PictureId, FadeInTime, FadeOutTime, Duration)
    if TalkTask then
      local DelaySeconds = FadeInTime + Duration + FadeOutTime
      if DelaySeconds <= 0 then
        Finish()
      else
        DurationHandle = UKismetSystemLibrary.K2_SetTimerDelegate({
          self,
          function()
            Finish()
          end
        }, DelaySeconds, false)
      end
    end
  end, function()
    OnFinish()
  end, OnFinish)
end

function M:PostProcess(MaterialInstance)
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  if not IsValid(TalkContext) then
    local Message = string.format("PostProcess create failed: TalkContext not found, DialogueId: %d", Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local Guid = self:GetGuidString()
  self.TaskQueue:AddTask(Guid, "PostProcess", function(OnFinish)
    TalkContext.TalkCameraManager:SetPostProcess(MaterialInstance)
    OnFinish()
  end)
end

function M:SetStoryVar(Index, VarName, VarValue)
  local Guid = self:GetGuidString()
  local TalkTask = self:TryGetTalkTask()
  local TalkTaskData = TalkTask.TalkTaskData
  local QuestChainId = TalkTaskData.QuestChainId
  self.TaskQueue:AddTask(Guid, "SetStoryVar", function(OnFinish)
    if not VarName or "" == VarName then
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "SetStoryVar\232\132\154\230\156\172\229\135\186\233\148\153", "\230\178\161\230\156\137\229\161\171\229\134\153VarName, GUID:" .. Guid .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165.")
      return OnFinish()
    end
    local VarInfo = DataMgr.StoryVariable[VarName]
    if not VarInfo then
      local _Str = "\229\143\152\233\135\143:[" .. tostring(VarName) .. "]\233\156\128\232\166\129\231\142\176\229\156\168StoryVariable.xlsx\228\184\173\229\133\136\229\163\176\230\152\142"
      if QuestChainId and 0 ~= QuestChainId then
        _Str = _Str .. ",QuestChainId:[" .. tostring(QuestChainId) .. "]"
      end
      _Str = _Str .. ",GUID:" .. tostring(Guid) .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165."
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "SetVar\232\132\154\230\156\172\229\135\186\233\148\153", _Str)
      return OnFinish()
    end
    if VarInfo.QuestChainId and VarInfo.QuestChainId ~= QuestChainId then
      local _Str = "\229\143\152\233\135\143:[" .. tostring(VarName) .. "]\228\184\141\232\131\189\229\156\168QuestChain:[" .. tostring(QuestChainId) .. "]\228\184\173\228\189\191\231\148\168\239\188\129\232\161\168\233\135\140\229\161\171\233\135\140\229\174\131\229\143\170\230\148\175\230\140\129\229\156\168QuestChain:[" .. tostring(VarInfo.QuestChainId) .. "]\228\184\173\228\189\191\231\148\168\239\188\129"
      _Str = _Str .. ",GUID:" .. tostring(Guid) .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165."
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "SetVar\232\132\154\230\156\172\233\148\153\232\175\175", _Str)
      return OnFinish()
    end
    local StorySubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UStorySubsystem:StaticClass())
    StorySubsystem:SetInt(VarName, VarValue)
    OnFinish()
  end, function()
  end)
end

function M:CanSkip()
  return false
end

return M
