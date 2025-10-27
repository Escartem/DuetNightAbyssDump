require("UnLua")
local ETalkDependency = require("BluePrints.Story.Talk.Base.ETalkDependency")
local FGameUnpausedChecker = require("BluePrints.Story.Talk.Base.TalkDependCheckers.GamePauseChecker")
local FTalkActorAvailableChecker = require("BluePrints.Story.Talk.Base.TalkDependCheckers.TalkActorAvailableChecker")
local FTalkDependencyComponent = {}

function FTalkDependencyComponent.New()
  local TalkDependencyComponent = setmetatable({}, {__index = FTalkDependencyComponent})
  TalkDependencyComponent.WorkingDetectionTask = {}
  TalkDependencyComponent:CreateCheckers()
  return TalkDependencyComponent
end

function FTalkDependencyComponent:Clear()
  self:ClearCheckers()
  self.WorkingDetectionTask = {}
end

function FTalkDependencyComponent:CreateCheckers()
  self.Checkers = {}
  self.Checkers[ETalkDependency.GameUnpaused] = FGameUnpausedChecker
  self.Checkers[ETalkDependency.TalkActorAvailable] = FTalkActorAvailableChecker
  for _, Checker in pairs(self.Checkers) do
    Checker:Init()
    Checker:BindCompletedCallback(function()
      self:OnCheckerCompleted()
    end)
  end
end

function FTalkDependencyComponent:ClearCheckers()
  for _, Checker in pairs(self.Checkers) do
    Checker:Clear()
  end
end

function FTalkDependencyComponent:AddDependencies(Task)
  Task.Dependencies = Task.Dependencies or {}
  for _, Depend in pairs(Task:GetDependencies()) do
    table.insert(Task.Dependencies, Depend)
  end
end

function FTalkDependencyComponent:CheckDependValid(Target)
  for k, v in pairs(ETalkDependency) do
    if v == Target then
      return
    end
  end
  error("\228\184\186Task\230\183\187\229\138\160\228\190\157\232\181\150\230\151\182\239\188\140 Task\231\154\132\228\190\157\232\181\150\228\184\141\229\156\168ETalkDependency\228\184\173,\228\190\157\232\181\150\228\184\186:" .. Target)
end

function FTalkDependencyComponent:CheckDependenciesComplete(TalkTask, TaskData)
  local bRes = true
  local UncompleteDepends = {}
  for _, Depend in pairs(TalkTask.Dependencies) do
    local Checker = self.Checkers[Depend]
    if not Checker:IsCheckerCompleted(TalkTask, TaskData) then
      table.insert(UncompleteDepends, Depend)
      bRes = false
    end
  end
  if not bRes then
    DebugPrint("@@@ \230\156\170\229\174\140\230\136\144\231\154\132\228\190\157\232\181\150\239\188\154", TalkTask)
    DebugPrintTable(UncompleteDepends)
  end
  return bRes
end

function FTalkDependencyComponent:EnableDependencyDetection(Task, TaskData, CallbackObj, CallbackFunc)
  DebugPrint("@@@ EnableDependencyDetection", Task)
  self:RecordDetection(Task, TaskData, Task.Dependencies, CallbackObj, CallbackFunc)
  for _, Depend in pairs(Task.Dependencies) do
    self:EnableDetection_Internal(Depend, Task, TaskData)
  end
end

function FTalkDependencyComponent:DisableDependencyDetection(Task)
  DebugPrint("@@@ DisableDependencyDetection", Task)
  for _, Depend in pairs(Task.Dependencies) do
    self:DisableDetection_Internal(Depend, Task)
  end
  self:UnrecordDetection(Task)
end

function FTalkDependencyComponent:RecordDetection(Task, TaskData, Dependencies, CallbackObj, CallbackFunc)
  self.WorkingDetectionTask[Task] = {
    Task = Task,
    TaskData = TaskData,
    Dependencies = Dependencies,
    CallbackObj = CallbackObj,
    CallbackFunc = CallbackFunc
  }
end

function FTalkDependencyComponent:UnrecordDetection(Task)
  self.WorkingDetectionTask[Task] = nil
end

function FTalkDependencyComponent:EnableDetection_Internal(DependType, Task, TaskData)
  local Checker = self.Checkers[DependType]
  Checker:Enable(Task, TaskData)
end

function FTalkDependencyComponent:DisableDetection_Internal(DependType, Task)
  local Checker = self.Checkers[DependType]
  Checker:Disable(Task)
end

function FTalkDependencyComponent:OnCheckerCompleted()
  for _, Info in pairs(self.WorkingDetectionTask) do
    if self:CheckDependenciesComplete(Info.Task, Info.TaskData) then
      Info.CallbackFunc(Info.CallbackObj, Info.Task)
    end
  end
end

function FTalkDependencyComponent:OnInterrupt(TalkTask)
  self:DisableDependencyDetection(TalkTask)
end

function FTalkDependencyComponent:OnPaused(TalkTask)
  self:DisableDependencyDetection(TalkTask)
end

function FTalkDependencyComponent:OnPauseResumed(TalkTask)
end

return FTalkDependencyComponent
