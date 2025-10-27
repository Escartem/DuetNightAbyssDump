local EMonitorNodeFinishType = require("StoryCreator.StoryLogic.StorylineUtils").EMonitorNodeFinishType
local MonitorBuffStatusNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function MonitorBuffStatusNode:Init()
  self.MonitoredBuffIds = {}
  self.ImmediateResponce = false
  self.BuffsChangedDelegateHandles = {}
  
  function self.BuffsChangedDelegate()
    self:OnBuffChanged()
  end
end

function MonitorBuffStatusNode:Start(Context, InportName)
  self.Context = Context
  self.InPortName = InPortName
  if "Stop" == InportName then
    self:Stop()
  elseif "UnListen" == InportName then
    self:StopListen()
  else
    self:Execute(function(ReturnValue)
      self:Finish(nil ~= ReturnValue and tostring(ReturnValue) or nil)
    end)
  end
end

function MonitorBuffStatusNode:Execute(Callback)
  self.ExecuteCallback = Callback
  if next(self.MonitoredBuffIds) ~= nil then
    self:StartListen()
  end
end

function MonitorBuffStatusNode:RegisterBuffChangedDelegate()
  for _, BuffId in pairs(self.MonitoredBuffIds) do
    self.ListenTarget.BuffManager:BP_BindOnBuffAdded(BuffId, self.BuffsChangedDelegate)
    self.ListenTarget.BuffManager:BP_BindOnBuffRemoved(BuffId, self.BuffsChangedDelegate)
    self.ListenTarget.BuffManager:BP_BindOnBuffRefreshed(BuffId, self.BuffsChangedDelegate)
    table.insert(self.BuffsChangedDelegateHandles, BuffId)
  end
end

function MonitorBuffStatusNode:UnregisterBuffChangedDelegate()
  for _, BuffId in pairs(self.BuffsChangedDelegateHandles) do
    self.ListenTarget.BuffManager:BP_UnbindOnBuffAdded(BuffId, self.BuffsChangedDelegate)
    self.ListenTarget.BuffManager:BP_UnbindOnBuffRemoved(BuffId, self.BuffsChangedDelegate)
    self.ListenTarget.BuffManager:BP_UnbindOnBuffRefreshed(BuffId, self.BuffsChangedDelegate)
  end
  self.BuffsChangedDelegateHandles = {}
end

function MonitorBuffStatusNode:StartListen()
  self.MonitorNodeFinishType = EMonitorNodeFinishType.Unchanged
  local GameInstance = GWorld.GameInstance
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  self.ListenTarget = PlayerCharacter
  self:RegisterBuffChangedDelegate()
end

function MonitorBuffStatusNode:StopListen()
  if self.ExecuteCallback then
    local OutPortName = self:CalOutPortName(self.MonitorNodeFinishType)
    DebugPrint("lhr@ MonitorBuffStatus StopListen TriggerCallback:", OutPortName)
    self.ExecuteCallback(OutPortName)
    self.ExecuteCallback = nil
  else
    self:Clear()
  end
end

function MonitorBuffStatusNode:OnBuffChanged()
  self.MonitorNodeFinishType = EMonitorNodeFinishType.Changed
  if self.ImmediateResponce then
    if not self.RespondTimer then
      self.RespondTimer = GWorld.GameInstance:AddTimer(0.1, function()
        self:StopListen()
      end)
    end
  elseif not self.RespondTimer then
    self.RespondTimer = GWorld.GameInstance:AddTimer(0.1, function()
      self:UnregisterBuffChangedDelegate()
    end)
  end
end

function MonitorBuffStatusNode:CalOutPortName(MonitorNodeFinishType)
  local OutPortName = "Unchanged"
  if not MonitorBuffStatusNode then
    return OutPortName
  end
  if MonitorNodeFinishType == EMonitorNodeFinishType.Changed then
    OutPortName = "Changed"
  elseif MonitorNodeFinishType == EMonitorNodeFinishType.Unchanged then
    OutPortName = "Unchanged"
  end
  return OutPortName
end

function MonitorBuffStatusNode:Stop()
  self.ExecuteCallback = nil
  self:Clear()
end

function MonitorBuffStatusNode:Clear()
  self:UnregisterBuffChangedDelegate()
  GWorld.GameInstance:RemoveTimer(self.RespondTimer)
  self.RespondTimer = nil
end

return MonitorBuffStatusNode
