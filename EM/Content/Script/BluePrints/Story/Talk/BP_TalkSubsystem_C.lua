require("UnLua")
local BP_TalkSubsystem = Class({
  "BluePrints.Common.TimerMgr"
})
local ETalkType = require("BluePrints.Story.Talk.Base.ETalkType")
local ETaskState = require("BluePrints.Story.Talk.Base.ETaskState")
local ETaskCheckResult = require("BluePrints.Story.Talk.Base.ETaskCheckResult")
local ETalkInterruptType = require("BluePrints.Story.Talk.Base.ETalkInterruptType")
local FTalkDependComponent = Class("BluePrints.Story.Talk.Base.TalkDependencyComponent")
local FTalkTaskDataProcesser = Class("BluePrints.Story.Talk.Base.TalkTaskDataProcesser")
local FTalkInterruptComponent = Class("BluePrints.Story.Talk.Base.TalkInterruptComponent")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local GamePauseAffectTalkTypes = {
  ETalkType.Guide,
  ETalkType.ForgingGuide,
  ETalkType.HintGuide,
  ETalkType.Bubble,
  ETalkType.Boss
}
local DeathAffectTalkTypes = {
  ETalkType.Guide,
  ETalkType.HintGuide,
  ETalkType.QueueGuide,
  ETalkType.ForgingGuide,
  ETalkType.UnimportGuide
}

function BP_TalkSubsystem:PlayTalk(TalkConfigKey, TalkAction, AudioAttachActor)
  if not TalkConfigKey or not TalkAction then
    return false
  end
  
  local function TalkEndCallback()
    if IsValid(TalkAction) and TalkAction.OnPlayTalkEnd then
      TalkAction.OnPlayTalkEnd:Broadcast()
    end
  end
  
  DebugPrint("TS:PlayTalk", TalkConfigKey, TalkAction)
  local TalkData = self:GetRegisteredTalkData(TalkConfigKey)
  if TalkData then
    TalkData.AudioAttachActor = AudioAttachActor
    return self:RegisterTalkTask(TalkConfigKey, TalkEndCallback)
  end
  local TalkTriggerInfo = DataMgr.TalkTrigger[TalkConfigKey]
  if not TalkTriggerInfo then
    local TalkContext = GWorld.GameInstance:GetTalkContext()
    TalkContext:StartTalk(nil, TalkConfigKey .. ".story", TalkConfigKey, nil, nil, {Func = TalkEndCallback, Obj = TalkAction}, nil)
    return true
  end
  if TalkTriggerInfo.StoryLinePath then
    local TalkContext = GWorld.GameInstance:GetTalkContext()
    if TalkContext then
      TalkContext:StartTalk(TalkConfigKey, nil, nil, nil, nil, {Func = TalkEndCallback, Obj = TalkAction})
      return true
    end
  else
    local RawData = {
      AudioAttachActor = AudioAttachActor,
      TalkType = TalkTriggerInfo.TalkType,
      FirstDialogueId = TalkTriggerInfo.DialogueId,
      BlendInTime = 0.5,
      BlendOutTime = 0.5
    }
    local Key = self:RegisterTalkData(RawData)
    return self:RegisterTalkTask(Key, TalkEndCallback)
  end
  return false
end

function BP_TalkSubsystem:ForceInterruptTalk(TalkTask)
  DebugPrint("@@@ ForceInterruptTalk \232\176\131\231\148\168\229\188\186\229\136\182\228\184\173\230\150\173\229\175\185\232\175\157\230\142\165\229\143\163", TalkTask)
  if not self:CheckTalkCanBeInterrupted(TalkTask) then
    DebugPrint("@@@ \229\175\185\232\175\157\230\151\160\230\179\149\232\162\171\230\137\147\230\150\173", TalkTask)
    return
  end
  self:OnTaskInterrupted(TalkTask)
end

function BP_TalkSubsystem:ForceInterruptTalkTaskData(CheckFunc)
  DebugPrint("@@@ ForceInterruptTalkTaskData \232\176\131\231\148\168\229\188\186\229\136\182\228\184\173\230\150\173\229\175\185\232\175\157\230\142\165\229\143\163", CheckFunc)
  local Tasks = self:GetAllTasks()
  local CopyTasks = {}
  for _, Task in pairs(Tasks) do
    CopyTasks[_] = Task
  end
  for _, Task in pairs(CopyTasks) do
    local TaskData = self:GetTaskDataFromTalkTask(Task)
    if TaskData and CheckFunc(TaskData) then
      self:ForceInterruptTalk(Task)
    end
  end
end

function BP_TalkSubsystem:ForceInterruptAllTalks()
  DebugPrint("@@@ ForceInterruptAllTalks \232\176\131\231\148\168\229\188\186\229\136\182\228\184\173\230\150\173\230\137\128\230\156\137\229\175\185\232\175\157\230\142\165\229\143\163")
  self:ForceInterruptTalkTaskData(function(TalkTaskData)
    return true
  end)
end

function BP_TalkSubsystem:InterruptAllLightTask()
  local LightTaskMap = {
    AudioOnly = true,
    Boss = true,
    Bubble = true,
    ForgingGuide = true,
    Guide = true,
    HintGuide = true,
    QueueGuide = true,
    UnimportGuide = true
  }
  self:ForceInterruptTalkTaskData(function(TalkTaskData)
    return LightTaskMap[TalkTaskData.TalkType]
  end)
end

function BP_TalkSubsystem:ForcePauseTalk(TalkTask, Pauser)
  DebugPrint("@@@ \232\176\131\231\148\168\229\188\186\229\136\182\230\154\130\229\129\156\229\175\185\232\175\157\230\142\165\229\143\163", TalkTask, Pauser)
  self:OnTaskPaused(Pauser, TalkTask)
end

function BP_TalkSubsystem:TryResumePauseTalk(Pauser)
  DebugPrint("@@@ \229\176\157\232\175\149\230\129\162\229\164\141\232\162\171\230\154\130\229\129\156\231\154\132Talk", Pauser)
  self:OnTaskResumePaused(Pauser)
end

function BP_TalkSubsystem:TryAdvanceTaskQueue()
  DebugPrint("@@@ TS:TryAdvanceTaskQueue \229\176\157\232\175\149\230\142\168\229\138\168\233\152\159\229\136\151\228\184\173\231\154\132\228\184\139\228\184\128\228\184\170TalkTask")
  local NextTask
  for _, Type in pairs(ETalkType) do
    local TQ = self:GetTasksQueue(ETaskState.Queue, Type)
    for _, Task in pairs(TQ) do
      NextTask = Task
      break
    end
    if NextTask then
      break
    end
  end
  if NextTask then
    DebugPrint("@@@ TS:TryAdvanceTaskQueue \228\184\139\228\184\128\228\184\170TalkTask\229\173\152\229\156\168\239\188\140\229\176\157\232\175\149Working", NextTask)
    self:TryWorkingTask(NextTask)
  end
end

function BP_TalkSubsystem:RegisterTalkData(TalkData)
  if not self.bInitialized_Lua then
    return
  end
  self.RegisteredDataKey = self.RegisteredDataKey + 1
  local Key = self.RegisteredDataKey
  self.RegisteredDatas[Key] = TalkData
  DebugPrint("@@@ \230\179\168\229\134\140\228\187\187\229\138\161\230\149\176\230\141\174", TalkData, Key)
  return Key
end

function BP_TalkSubsystem:UnregisterTalkData(Key)
  DebugPrint("@@@ \230\179\168\233\148\128\228\187\187\229\138\161\230\149\176\230\141\174", Key, self.bInitialized_Lua)
  if not self.bInitialized_Lua or not Key then
    return
  end
  self.RegisteredDatas[Key] = nil
end

function BP_TalkSubsystem:IsGameUIHidden()
  if self.GameUIHiddenTags and next(self.GameUIHiddenTags) then
    return true
  else
    return false
  end
end

function BP_TalkSubsystem:ForceSetStorySkipable(bSet)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar.bForceSetStorySkipable = bSet
  end
end

function BP_TalkSubsystem:GetForceStorySkipable()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    return Avatar.bForceSetStorySkipable
  else
    return false
  end
end

function BP_TalkSubsystem:ExceptionInterruptTaskBySTL(Key)
  if not Key then
    return
  end
  local TalkTask = self.TalkTasks[Key]
  if not TalkTask then
    return
  end
  DebugPrint("TS:ExceptionInterruptTaskBySTL", TalkTask, Key)
  TalkTask:OnExceptionInterruptedBySTL()
  if TalkTask:GetBasicTalkType() ~= ETalkType.Guide then
    self:MoveTaskState(TalkTask, ETaskState.Finished)
    self:ClearRefs(TalkTask)
  end
  self:TryFireLeaveStoryEvent()
end

function BP_TalkSubsystem:GetAllWorkingTaskDebugLogs()
  local Tasks = self:GetAllTasks()
  local Res = {}
  for _, Task in pairs(Tasks) do
    if Task:GetState() == ETaskState.Working then
      table.insert(Res, Task:GetDebugMetaInfo())
    end
  end
  return Res
end

function BP_TalkSubsystem:InitializeLua()
  DebugPrint("@@@ TalkSubsystem InitializeLua")
  self.TalkDependencyComponent = FTalkDependComponent:New(self)
  self.TalkTaskDataProcesser = FTalkTaskDataProcesser:New()
  self.TalkInterruptComponent = FTalkInterruptComponent:New()
  self.TalkTasks = {}
  self.TalkTaskDatas = {}
  self.TaskKeys = {}
  self.PausedTasks = {}
  self.RegisteredDatas = {}
  self.RegisteredDataKey = 0
  self:InitializeTaskTables()
  self.InvitateNpcId = nil
  self.RegisterInvitateNpc = {}
  self.bInitialized_Lua = true
  EventManager:AddEvent(EventID.OnChangeAspectAndFOV, self, self.OnPlayerWindowChanged)
  EventManager:AddEvent(EventID.UpdateSignBoardNpc, self, self.OnUpdateSignBoardNpc)
  EventManager:AddEvent(EventID.CharRecover, self, self.OnPlayerRecover)
  EventManager:AddEvent(EventID.CharDie, self, self.OnPlayerDead)
end

function BP_TalkSubsystem:DeinitializeLua()
  DebugPrint("@@@ TalkSubsystem DeinitializeLua")
  EventManager:RemoveEvent(EventID.OnChangeAspectAndFOV, self)
  EventManager:RemoveEvent(EventID.UpdateSignBoardNpc, self)
  EventManager:RemoveEvent(EventID.CharRecover, self)
  EventManager:RemoveEvent(EventID.CharDie, self)
  if self.bInitialized_Lua then
    self:Clear()
    self.bInitialized_Lua = false
  end
end

function BP_TalkSubsystem:Clear()
  DebugPrint("@@@ TalkSubsystem Clear")
  self:CleanTimer()
  self:ClearAllTalks()
  self.TalkTaskDatas = {}
  self.PausedTasks = {}
  self.RegisteredDatas = {}
  self.TalkDependencyComponent:Clear()
  self.TalkTaskDataProcesser:Clear()
  self.TalkInterruptComponent:Clear()
  self.InvitateNpcId = nil
  self.RegisterInvitateNpc = nil
end

function BP_TalkSubsystem:ClearAllTalks()
  DebugPrint("@@@ ClearAllTalks \232\176\131\231\148\168\229\188\186\229\136\182\230\184\133\231\144\134\230\137\128\230\156\137\229\175\185\232\175\157\230\142\165\229\143\163")
  local Tasks = self:GetAllTasks()
  for _, Task in pairs(Tasks) do
    Task:Clear()
  end
  self.TalkTasks = {}
end

function BP_TalkSubsystem:InitializeTaskTables()
  for _, Type in pairs(ETalkType) do
    for _, State in pairs(ETaskState) do
      self[State .. "TasksOf" .. Type] = {}
    end
  end
end

function BP_TalkSubsystem:BindGameModeDelegates()
  DebugPrint("@@@ BP_TalkSubsystem:BindDelegates")
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode and GameMode.OnGamePauseChanged then
    GameMode.OnGamePauseChanged:Add(self, self.OnGamePauseChanged)
  else
    DebugPrint("@@@ \230\151\160GameMode/OnGamePauseChanged", GameMode)
  end
end

function BP_TalkSubsystem:UnbindGameModeDelegates()
  DebugPrint("@@@ BP_TalkSubsystem:UnbindDelegates")
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode and GameMode.OnGamePauseChanged then
    GameMode.OnGamePauseChanged:Remove(self, self.OnGamePauseChanged)
  end
end

function BP_TalkSubsystem:OnEMGameModeBeginPlay()
  DebugPrint("@@@ BP_TalkSubsystem OnEMGameModeBeginPlay")
  self:BindGameModeDelegates()
end

function BP_TalkSubsystem:OnEMGameModeEndPlay()
  DebugPrint("@@@ BP_TalkSubsystem OnEMGameModeEndPlay")
  self:UnbindGameModeDelegates()
end

function BP_TalkSubsystem:RegisterTalkTask(Key, OnTalkEndCallback)
  DebugPrint("@@@ \230\179\168\229\134\140\229\175\185\232\175\157\228\187\187\229\138\161", Key, self.bInitialized_Lua)
  if not self.bInitialized_Lua then
    return false
  end
  local TalkTask, TalkTaskData = self:CreateTalkTaskData(Key)
  TalkTask.OnTalkEndCallback = OnTalkEndCallback
  local CheckRes = self:CheckCanRegisterTask(TalkTask, TalkTaskData)
  if CheckRes ~= ETaskCheckResult.Succeed then
    self:OnCannotRegisterTask(CheckRes)
    return false
  end
  self:CompositeTalkTask(TalkTask)
  self:RecordTalkTaskAndData(TalkTask, TalkTaskData, Key)
  self:MoveTaskState(TalkTask, ETaskState.Default)
  self:TryWorkingTask(TalkTask)
  return true
end

function BP_TalkSubsystem:TryWorkingTask(TalkTask)
  local TaskData = self.TalkTaskDatas[TalkTask]
  if not TaskData then
    self:ClearRefs(TalkTask)
    return
  end
  DebugPrint("@@@ TS:\229\176\157\232\175\149\229\144\175\229\138\168Talk", TalkTask, TaskData.TalkNodeName)
  if TalkTask:IsWorking() then
    DebugPrint("@@@ TS:Talk\229\183\178\229\156\168\229\183\165\228\189\156\228\184\173", TalkTask, TaskData.TalkNodeName)
    return
  end
  if self:IsTaskShouldQueue(TalkTask, TaskData) then
    DebugPrint("@@@ TS:Task\233\156\128\230\142\146\233\152\159\239\188\140\229\183\178\229\138\160\229\133\165\233\152\159\229\136\151\228\184\173", TalkTask, TaskData.TalkNodeName)
    self:OnTaskQueued(TalkTask)
    return
  end
  local bRes = self.TalkDependencyComponent:CheckDependenciesComplete(TalkTask, TaskData)
  if not bRes then
    DebugPrint("@@@ Talk\228\190\157\232\181\150\230\163\128\230\159\165\230\156\170\233\128\154\232\191\135", TalkTask)
    self:MoveTaskState(TalkTask, ETaskState.WaitingDependency)
    self.TalkDependencyComponent:EnableDependencyDetection(TalkTask, TaskData, self, self.OnDependencyComplete)
    return
  end
  self:WorkingTaskInternal(TalkTask)
end

function BP_TalkSubsystem:WorkingTaskInternal(TalkTask)
  DebugPrint("@@@ WorkingTaskInternal", TalkTask)
  self:ProcessTalkInterruptEvents(TalkTask)
  self:OnTaskWorking(TalkTask)
  local TalkTaskData = self.TalkTaskDatas[TalkTask]
  TalkTask:StartWorking(TalkTaskData, {
    self,
    self.OnTaskFinished
  })
end

function BP_TalkSubsystem:ProcessTalkInterruptEvents(TalkTask)
  DebugPrint("@@@ \229\164\132\231\144\134TalkTask\231\154\132Interrupt\229\133\179\231\179\187", TalkTask)
  self:TasksInterruptedByTask(TalkTask)
  self:TasksPausedByTask(TalkTask)
end

function BP_TalkSubsystem:TasksInterruptedByTask(InstigatorTask)
  DebugPrint("@@@ \229\176\157\232\175\149\230\137\147\230\150\173\229\133\182\228\187\150\229\175\185\232\175\157", InstigatorTask)
  self:PreClearInterruptedTasks(InstigatorTask)
  local TalkType = InstigatorTask:GetTalkType()
  local InterruptTypes = self.TalkInterruptComponent:GetSpecificInterruptTypes(TalkType, ETalkInterruptType.Interrupt)
  for _, Type in pairs(InterruptTypes) do
    self:InterruptTaskQueue(ETaskState.Working, Type)
    self:InterruptTaskQueue(ETaskState.Paused, Type)
    self:InterruptTaskQueue(ETaskState.WaitingDependency, Type)
  end
end

function BP_TalkSubsystem:TasksPausedByTask(InstigatorTask)
  DebugPrint("@@@ \229\176\157\232\175\149\230\154\130\229\129\156\229\133\182\228\187\150\229\175\185\232\175\157", InstigatorTask)
  local TalkType = InstigatorTask:GetTalkType()
  local InterruptTypes = self.TalkInterruptComponent:GetSpecificInterruptTypes(TalkType, ETalkInterruptType.Pause)
  for _, Type in pairs(InterruptTypes) do
    self:PauseTaskQueue(InstigatorTask, ETaskState.Working, Type)
    self:PauseTaskQueue(InstigatorTask, ETaskState.WaitingDependency, Type)
  end
end

function BP_TalkSubsystem:OnCannotRegisterTask(Reason)
  DebugPrint("@@@ \230\179\168\229\134\140\228\187\187\229\138\161\229\164\177\232\180\165:", Reason)
end

function BP_TalkSubsystem:OnDependencyComplete(TalkTask)
  DebugPrint("@@@ Talk\228\190\157\232\181\150\229\174\140\230\136\144", TalkTask)
  local TaskData = self:GetTaskDataFromTalkTask(TalkTask)
  self.TalkDependencyComponent:DisableDependencyDetection(TalkTask, TaskData)
  self:MoveTaskState(TalkTask, ETaskState.DependencyCompleted)
  self:TryWorkingTask(TalkTask)
end

function BP_TalkSubsystem:OnDependencyInterrupted(TalkTask)
  self.TalkDependencyComponent:OnInterrupt(TalkTask)
end

function BP_TalkSubsystem:OnDependencyPaused(TalkTask)
  self.TalkDependencyComponent:OnPaused(TalkTask)
end

function BP_TalkSubsystem:OnTaskWorking(TalkTask)
  DebugPrint("@@@ Talk\229\188\128\229\167\139\229\183\165\228\189\156", TalkTask)
  self:MoveTaskState(TalkTask, ETaskState.Working)
  self:TryFireEnterStoryEvent(TalkTask)
end

function BP_TalkSubsystem:OnTaskFinished(TalkTask, TaskFinishType, OptionIndex)
  DebugPrint("@@@ TalkTask\230\137\167\232\161\140\231\187\147\230\157\159", TalkTask)
  self:MoveTaskState(TalkTask, ETaskState.Finished)
  self:OnTaskFinishedInternal(TalkTask, TaskFinishType, OptionIndex)
end

function BP_TalkSubsystem:OnTaskFinishedInternal(TalkTask, TaskFinishType, OptionIndex)
  DebugPrint("@@@ TS:OnTaskFinishedInternal", TalkTask, TaskFinishType, OptionIndex)
  self:TryResumePauseTalk(TalkTask)
  self:ClearRefs(TalkTask)
  self:TryFireLeaveStoryEvent()
  if TalkTask.OnTalkEndCallback then
    TalkTask.OnTalkEndCallback(TaskFinishType, OptionIndex)
  end
  self:TryAdvanceTaskQueue()
end

function BP_TalkSubsystem:OnTaskQueued(Task)
  DebugPrint("@@@ TS:OnTaskQueued", Task)
  self:MoveTaskState(Task, ETaskState.Queue)
end

function BP_TalkSubsystem:OnTaskInterrupted(Task)
  DebugPrint("@@@ TS:OnTaskInterrupted", Task)
  self:OnDifferentStateTaskInterrupted(Task)
  self:MoveTaskState(Task, ETaskState.Interrupted)
  self:ClearRefs(Task)
  if Task.OnTalkEndCallback then
    Task.OnTalkEndCallback()
  end
  self:TryFireLeaveStoryEvent()
end

function BP_TalkSubsystem:OnTaskPaused(Pauser, Task)
  DebugPrint("@@@ OnTaskPaused", Task)
  self:RecordPausedTasks(Pauser, Task)
  self:OnDifferentStateTaskPaused(Task)
  self:MoveTaskState(Task, ETaskState.Paused)
end

function BP_TalkSubsystem:OnTaskResumePaused(Pauser)
  DebugPrint("@@@ TS:OnTaskResumePaused", Pauser)
  local Tasks = self:GetPausedTasks(Pauser) or {}
  self:RemovePausedTasks(Pauser)
  for _, Task in pairs(Tasks) do
    self:OnDifferentLastStateTaskPauseResumed(Task)
  end
end

function BP_TalkSubsystem:OnDifferentStateTaskInterrupted(Task)
  local State = Task:GetState()
  DebugPrint("@@@ OnDifferentStateTaskInterrupted", Task, State)
  if State == ETaskState.Working then
    Task:OnInterrupted()
  elseif State == ETaskState.WaitingDependency then
    self:OnDependencyInterrupted(Task)
  elseif State == ETaskState.Paused then
    Task:OnInterrupted()
  else
    DebugPrint("@@@ \230\151\160\230\179\149\230\137\147\230\150\173\233\153\164Working\229\146\140WaitingDependency\228\187\165\229\164\150\231\138\182\230\128\129\231\154\132\229\175\185\232\175\157", State, Task)
    return
  end
end

function BP_TalkSubsystem:OnDifferentStateTaskPaused(Task)
  DebugPrint("@@@ TS:OnDifferentStateTaskPaused", Task:GetState())
  local State = Task:GetState()
  if State == ETaskState.Working then
    Task:OnPaused()
  elseif State == ETaskState.WaitingDependency then
    self:OnDependencyPaused(Task)
  else
    DebugPrint("@@@ \230\151\160\230\179\149\230\154\130\229\129\156\233\153\164Working\229\146\140WaitingDependency\228\187\165\229\164\150\231\138\182\230\128\129\231\154\132\229\175\185\232\175\157", State, Task)
    return
  end
end

function BP_TalkSubsystem:OnDifferentLastStateTaskPauseResumed(Task)
  DebugPrint("@@@ TS:OnDifferentLastStateTaskPauseResumed", Task)
  local State = Task:GetState()
  if State ~= ETaskState.Paused then
    DebugPrint("@@@ \230\151\160\230\179\149\230\129\162\229\164\141\230\154\130\229\129\156\233\153\164Paused\228\187\165\229\164\150\231\138\182\230\128\129\231\154\132\229\175\185\232\175\157", State, Task)
    return
  end
  local LastState = Task:GetLastState()
  if LastState == ETaskState.Working then
    self:MoveTaskState(Task, ETaskState.Working)
    Task:OnPauseResumed()
  elseif LastState == ETaskState.WaitingDependency then
    self:MoveTaskState(Task, ETaskState.Default)
    self:TryWorkingTask(Task)
  else
    DebugPrint("@@@ \230\151\160\230\179\149\230\129\162\229\164\141\230\154\130\229\129\156\229\142\159\231\138\182\230\128\129\228\184\186Working\229\146\140WaitingDependency\228\187\165\229\164\150\231\154\132\229\175\185\232\175\157", LastState, Task)
    self:ClearRefs(Task)
    return
  end
end

local GameModePauser = "GameModePause"

function BP_TalkSubsystem:OnGamePauseChanged()
  DebugPrint("@@@ TalkSubsystem:OnGamePauseChanged")
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not GameMode or not GameMode.OnGamePauseChanged then
    return
  end
  local bPaused = GameMode:IsGamePaused()
  if bPaused then
    for _, Type in pairs(GamePauseAffectTalkTypes) do
      self:PauseTaskQueue(GameModePauser, ETaskState.Working, Type)
      self:PauseTaskQueue(GameModePauser, ETaskState.WaitingDependency, Type)
    end
  else
    self:TryResumePauseTalk(GameModePauser)
  end
end

local DeathPauser = "DeathPause"

function BP_TalkSubsystem:OnPlayerDead()
  for _, Type in pairs(DeathAffectTalkTypes) do
    self:PauseTaskQueue(DeathPauser, ETaskState.Working, Type)
    self:PauseTaskQueue(DeathPauser, ETaskState.WaitingDependency, Type)
  end
end

function BP_TalkSubsystem:OnPlayerRecover()
  self:TryResumePauseTalk(DeathPauser)
end

function BP_TalkSubsystem:GetTasksQueue(State, Type)
  self:CheckType(Type)
  return self[State .. "TasksOf" .. Type]
end

function BP_TalkSubsystem:GetRegisteredTalkData(Key)
  local Data = self.RegisteredDatas[Key]
  return Data
end

function BP_TalkSubsystem:GetTaskDataFromTalkTask(TalkTask)
  if not TalkTask then
    return
  end
  local TaskData = self.TalkTaskDatas[TalkTask]
  if not TaskData then
    return
  end
  return TaskData
end

function BP_TalkSubsystem:GetPausedTasks(Pauser)
  return self.PausedTasks[Pauser]
end

function BP_TalkSubsystem:GetAllTasks()
  return self.TalkTasks
end

function BP_TalkSubsystem:RemovePausedTasks(Pauser, bRecursive)
  DebugPrint("@@@ \230\184\133\233\153\164\232\162\171\230\154\130\229\129\156\231\154\132TalkTask", Pauser, bRecursive)
  local Tasks = self:GetPausedTasks(Pauser)
  if not Tasks then
    return
  end
  if bRecursive then
    for _, Task in pairs(Tasks) do
      self:RemovePausedTasks(Task, bRecursive)
    end
  end
  self.PausedTasks[Pauser] = nil
end

function BP_TalkSubsystem:CheckType(Type)
  local bValid = Type and nil ~= ETalkType[Type]
  if not bValid then
    error("\229\176\157\232\175\149\232\174\191\233\151\174\233\157\158ETalkType\228\184\173\231\154\132Type\239\188\140\229\133\183\228\189\147\228\184\186" .. Type)
    return
  end
  return true
end

function BP_TalkSubsystem:CheckTalkCanBeInterrupted(TalkTask)
  local State = TalkTask:GetState()
  if State == ETaskState.Interrupted or State == ETaskState.Finished then
    return false
  end
  return true
end

function BP_TalkSubsystem:IsTaskShouldQueue(TalkTask, TaskData)
  local TalkType = TalkTask:GetTalkType()
  local QueueTaskTypes = self.TalkInterruptComponent:GetSpecificInterruptTypes(TalkType, ETalkInterruptType.Queue)
  for _, Type in pairs(QueueTaskTypes) do
    local TQ = self:GetTasksQueue(ETaskState.Working, Type)
    if not IsEmptyTable(TQ) then
      return true
    end
  end
  return false
end

function BP_TalkSubsystem:TryFireEnterStoryEvent(TalkTask)
  if not self.bInImmersiveTalk then
    self.bInImmersiveTalk = self:CheckInImmersiveTalk()
    DebugPrint("TS:TryFireEnterStoryEvent", self.bInImmersiveTalk)
    if self.bInImmersiveTalk then
      local TalkTaskData = self.TalkTaskDatas[TalkTask]
      EventManager:FireEvent(EventID.EnterImmersiveTalk, TalkTaskData and TalkTaskData.TalkTriggerId)
      if self.OnStoryBegin then
        self.OnStoryBegin:Broadcast()
      end
    end
  end
  if GWorld.GameInstance then
    DebugPrint("TS: \229\188\128TalkContext Tick")
    GWorld.GameInstance.bTalkContextTickable = true
  end
end

function BP_TalkSubsystem:TryFireLeaveStoryEvent()
  if self.bInImmersiveTalk then
    self.bInImmersiveTalk = self:CheckInImmersiveTalk()
    DebugPrint("TS:TryFireLeaveStoryEvent", self.bInImmersiveTalk)
    if not self.bInImmersiveTalk then
      EventManager:FireEvent(EventID.LeaveImmersiveTalk)
      if self.OnStoryEnd then
        self.OnStoryEnd:Broadcast()
      end
    end
  end
  TalkUtils:RemovePlayerInvincible()
  if IsEmptyTable(self.TalkTasks) and GWorld.GameInstance then
    DebugPrint("TS: \229\129\156TalkContext Tick")
    GWorld.GameInstance.bTalkContextTickable = false
  end
end

local ImmersiveTalkTypes = {
  ETalkType.Black,
  ETalkType.BlackISS,
  ETalkType.Cinematic,
  ETalkType.Show,
  ETalkType.FaultBlack,
  ETalkType.FixSimple,
  ETalkType.FreeSimple,
  ETalkType.Simple,
  ETalkType.Impression,
  ETalkType.QuestImpression
}

function BP_TalkSubsystem:CheckInImmersiveTalk()
  local bRes = false
  local ExistType
  for _, Type in pairs(ImmersiveTalkTypes) do
    local Queue = self:GetTasksQueue(ETaskState.Working, Type)
    if not IsEmptyTable(Queue) then
      bRes = true
      ExistType = Type
      break
    end
  end
  DebugPrint("TS:CheckInImmersiveTalk \230\163\128\230\181\139\230\152\175\229\144\166\229\164\132\228\186\142\230\178\137\230\181\184\229\188\143\229\137\167\230\131\133\228\184\173:", bRes, ExistType)
  return bRes
end

function BP_TalkSubsystem:CheckCanRegisterTask(TalkTask, TalkTaskData)
  if self:CheckBlockedByOthers(TalkTask:GetTalkType()) then
    return ETaskCheckResult.BlockedByOtherTask
  end
  return ETaskCheckResult.Succeed
end

function BP_TalkSubsystem:CheckTalkDataValid(TalkTaskData)
  return true
end

function BP_TalkSubsystem:CheckBlockedByOthers(TalkType)
  DebugPrint("@@@ CheckBlockedByOthers", TalkType)
  local BlockingTypes = self.TalkInterruptComponent:GetSpecificInterruptTypes(TalkType, ETalkInterruptType.Blocked)
  for _, Type in pairs(BlockingTypes) do
    DebugPrint("@@@ CheckBlockedBy", Type)
    local Queue = self:GetTasksQueue(ETaskState.Working, Type)
    if not IsEmptyTable(Queue) then
      DebugPrint("@@@ " .. TalkType .. "\228\187\187\229\138\161\232\162\171\230\173\163\229\156\168\232\191\144\232\161\140\228\184\173\231\154\132" .. Type .. "\228\187\187\229\138\161\233\152\187\229\161\158")
      return true
    end
  end
  return false
end

function BP_TalkSubsystem:RecordTalkTaskAndData(TalkTask, TalkTaskData, Key)
  DebugPrint("@@@ RecordTalkTaskAndData", TalkTask)
  if TalkTask and Key then
    self.TaskKeys[TalkTask] = Key
    self.TalkTasks[Key] = TalkTask
    self.TalkTaskDatas[TalkTask] = TalkTaskData
  end
end

function BP_TalkSubsystem:UnrecordTalkTask(TalkTask)
  if not TalkTask then
    return
  end
  DebugPrint("@@@ UnrecordTalkTaskAndData", TalkTask)
  local Key = self.TaskKeys[TalkTask]
  if Key then
    self.TalkTasks[Key] = nil
    self.TalkTaskDatas[TalkTask] = nil
    self.TaskKeys[TalkTask] = nil
  end
end

function BP_TalkSubsystem:CompositeTalkTask(Task)
  self.TalkDependencyComponent:AddDependencies(Task)
end

function BP_TalkSubsystem:MoveTaskState(Task, NewState)
  local CurrentState = Task:GetState()
  if CurrentState == NewState then
    return
  end
  self:OnTaskExitState(Task)
  Task:SetState(NewState)
  self:OnTaskEnterState(Task)
  DebugPrint("@@@ TS: \231\167\187\229\138\168TaskState " .. CurrentState .. " -> " .. NewState, Task)
end

function BP_TalkSubsystem:OnTaskEnterState(Task)
  local State = Task:GetState()
  local Type = Task:GetTalkType()
  local Queue = self:GetTasksQueue(State, Type)
  Queue[Task] = Task
  if Task:IsGameUIHidden() then
    self.GameUIHiddenTags = self.GameUIHiddenTags or {}
    self.GameUIHiddenTags[Task] = true
  end
end

function BP_TalkSubsystem:OnTaskExitState(Task)
  local State = Task:GetState()
  local Type = Task:GetTalkType()
  local Queue = self:GetTasksQueue(State, Type)
  Queue[Task] = nil
  if Task:IsGameUIHidden() then
    self.GameUIHiddenTags = self.GameUIHiddenTags or {}
    self.GameUIHiddenTags[Task] = nil
  end
end

function BP_TalkSubsystem:CreateTalkTaskData(Key)
  local RawTalkData = self:GetRegisteredTalkData(Key)
  local TalkTask, TalkTaskData = self.TalkTaskDataProcesser:ProcessRawTalkData(RawTalkData)
  return TalkTask, TalkTaskData
end

function BP_TalkSubsystem:ClearRefs(TalkTask)
  DebugPrint("@@@ TS:ClearRefs", TalkTask)
  self:MoveTaskState(TalkTask, ETaskState.Finished)
  self:UnrecordTalkTask(TalkTask)
  self:ClearInvalidTaskQueues()
end

function BP_TalkSubsystem:ClearInvalidTaskQueues()
  for _, Type in pairs(ETalkType) do
    self:ClearTaskQueue(ETaskState.Finished, Type)
    self:ClearTaskQueue(ETaskState.Interrupted, Type)
  end
end

function BP_TalkSubsystem:ClearTaskQueue(State, Type)
  self[State .. "TasksOf" .. Type] = {}
end

function BP_TalkSubsystem:InterruptTaskQueue(State, Type)
  local TQ = self:GetTasksQueue(State, Type)
  local tmpTQ = {}
  for _, Task in pairs(TQ) do
    tmpTQ[_] = Task
  end
  for _, Task in pairs(tmpTQ) do
    DebugPrint("@@@ InterruptTaskQueue", Task, State, Type)
    self:ForceInterruptTalk(Task)
  end
end

function BP_TalkSubsystem:PauseTaskQueue(PauserTask, State, Type)
  DebugPrint("@@@ \230\154\130\229\129\156TalkTask\233\152\159\229\136\151", PauserTask, State, Type)
  local TQ = self:GetTasksQueue(State, Type)
  local tmpTQ = {}
  for _, Task in pairs(TQ) do
    tmpTQ[_] = Task
  end
  for _, Task in pairs(tmpTQ) do
    DebugPrint("@@@ PauseTaskQueue", Task, State, Type)
    self:ForcePauseTalk(Task, PauserTask)
  end
end

function BP_TalkSubsystem:RecordPausedTasks(Pauser, PauseTask)
  DebugPrint("@@@ \232\174\176\229\189\149\232\162\171\230\154\130\229\129\156\231\154\132TalkTask", Pauser, PauseTask)
  self.PausedTasks[Pauser] = self.PausedTasks[Pauser] or {}
  table.insert(self.PausedTasks[Pauser], PauseTask)
end

function BP_TalkSubsystem:PreClearInterruptedTasks(InstigatorTask)
  local TalkType = InstigatorTask:GetTalkType()
  local InterruptTypes = self.TalkInterruptComponent:GetSpecificInterruptTypes(TalkType, ETalkInterruptType.Interrupt)
  for _, Type in pairs(InterruptTypes) do
    local TQ = self:GetTasksQueue(ETaskState.Working, Type)
    for _, Task in pairs(TQ) do
      self:RemovePausedTasks(Task, true)
    end
  end
end

function BP_TalkSubsystem:PlayUIAnimationSequenceEvent(UIName, AnimationName, QuestChainId, bCloseUI)
  DebugPrint("BP_TalkSubsystem:PlayUIAnimationSequenceEvent", UIName, AnimationName, bCloseUI)
  local UI = UIManager(self):GetUIObj(UIName)
  UI = UI or UIManager(self):LoadUINew(UIName, QuestChainId)
  if not UI or not UI[AnimationName] then
    return
  end
  UI:PlayAnimation(UI[AnimationName])
  if bCloseUI then
    self:AddTimer(UI[AnimationName]:GetEndTime(), function()
      UIManager(self):UnLoadUINew(UIName)
    end)
  end
end

function BP_TalkSubsystem:ScreenCaptureForUISequenceEvent(UIName, WidgetName, MaterialParamName)
  local UI = UIManager(self):GetUIObj(UIName)
  if not UI or not UI[WidgetName] then
    return
  end
  local Material = UI[WidgetName]:GetDynamicMaterial()
  if not Material then
    return
  end
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  local RenderTexture = UKismetRenderingLibrary.CreateRenderTarget2D(self)
  local Size = UWidgetLayoutLibrary.GetViewportSize(self)
  URuntimeCommonFunctionLibrary.RenderTarget2DResize(RenderTexture, Size.X, Size.Y)
  local SceneCaptureComponent = NewObject(USceneCaptureComponent2D, Player)
  SceneCaptureComponent:K2_AttachToComponent(Player.CharCameraComponent)
  SceneCaptureComponent:K2_SetRelativeTransform(FTransform(), false, nil, false)
  URuntimeCommonFunctionLibrary.RegisterComponent(SceneCaptureComponent)
  SceneCaptureComponent.FOVAngle = Player.CharCameraComponent.FieldOfView
  SceneCaptureComponent.TextureTarget = RenderTexture
  SceneCaptureComponent.CaptureSource = ESceneCaptureSource.SCS_FinalColorHDR
  SceneCaptureComponent:SetComponentTickEnabled(false)
  SceneCaptureComponent.bCaptureEveryFrame = false
  SceneCaptureComponent.bCaptureOnMovement = false
  for _, Name in pairs(MaterialParamName:ToTable()) do
    Material:SetTextureParameterValue(Name, RenderTexture)
  end
  SceneCaptureComponent:CaptureScene()
  SceneCaptureComponent:K2_DestroyComponent(SceneCaptureComponent)
end

function BP_TalkSubsystem:OnPlayerWindowChanged(...)
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  if TalkContext then
    TalkContext:OnPlayerWindowChanged(...)
  end
end

function BP_TalkSubsystem:CheckCanTriggerInvitateBubbleTalk(NpcId)
  if NpcId == self.InvitateNpcId then
    return true
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar or not Avatar:CheckSignBoardNpcDailyTalkIsLimit(NpcId) then
    return false
  end
  return true
end

function BP_TalkSubsystem:TryTriggerInvitateBubbleTalk(NpcId, OnSuccess, OnFailed)
  if not self:CheckCanTriggerInvitateBubbleTalk(NpcId) then
    return false
  end
  local TimerData = self.RegisterInvitateNpc[NpcId]
  if TimerData then
    return false
  end
  TimerData = {
    OnSuccess = OnSuccess,
    OnFailed = OnFailed,
    Timer = nil
  }
  if not self.InvitateBubbleTime then
    self.InvitateBubbleTime = DataMgr.GlobalConstant.InvitateBubbleWaitTime.ConstantValue
  end
  self.RegisterInvitateNpc[NpcId] = TimerData
  TimerData.Timer = self:AddTimer(self.InvitateBubbleTime, function()
    self.RegisterInvitateNpc[NpcId] = nil
    self:RealTriggerInvitateBubbleTalk(NpcId, OnSuccess, OnFailed)
  end)
  return true
end

function BP_TalkSubsystem:RealTriggerInvitateBubbleTalk(NpcId, OnSuccess, OnFailed)
  local Avatar = GWorld:GetAvatar()
  if not self:CheckCanTriggerInvitateBubbleTalk(NpcId) or self.InvitateNpcId then
    OnFailed()
    return
  end
  self.InvitateNpcId = NpcId
  Avatar:TriggerAddSignBoardNpcDailyTalk(NpcId, function(bSuccess)
    if bSuccess then
      OnSuccess()
    else
      OnFailed()
    end
  end)
end

function BP_TalkSubsystem:TryEndInvitateBubbleTalk(NpcId)
  local TimerData = self.RegisterInvitateNpc[NpcId]
  if TimerData then
    self:RemoveTimer(TimerData.Timer)
    self.RegisterInvitateNpc[NpcId] = nil
  end
  if self.InvitateNpcId == NpcId then
    self.InvitateNpcId = nil
  end
end

function BP_TalkSubsystem:OnUpdateSignBoardNpc(Ret, SignBoard, ChangeNpcId)
  if Ret ~= ErrorCode.RET_SUCCESS then
    return
  end
  for NpcId, TimerData in pairs(self.RegisterInvitateNpc) do
    self:TryEndInvitateBubbleTalk(NpcId)
    self:TryTriggerInvitateBubbleTalk(NpcId, TimerData.OnSuccess, TimerData.OnFailed)
  end
end

function BP_TalkSubsystem:GetNpcPlayDialogueCallback(NpcId)
  local NpcData = DataMgr.Npc[NpcId]
  if not NpcData then
    return nil
  end
  if NpcData.NpcType == "Show" then
    return {
      Func = function(Obj, DialogueId)
        local Avatar = GWorld:GetAvatar()
        if not Avatar then
          return
        end
        if Avatar:CheckSignBoardNpcTalkIsRecord(NpcId, DialogueId) then
          return
        end
        if not Avatar:CheckSignBoardNpcTalkValid(NpcId, DialogueId) then
          return
        end
        Avatar:TriggerRecordSignBoardNpcTalk(NpcId, DialogueId)
      end
    }
  end
end

return BP_TalkSubsystem
