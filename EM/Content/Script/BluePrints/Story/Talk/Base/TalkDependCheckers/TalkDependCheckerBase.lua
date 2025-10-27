require("UnLua")
local TalkDependCheckerBase = Class()

function TalkDependCheckerBase:Init()
  self.bEnabled = false
end

function TalkDependCheckerBase:Enable(Task, TaskData)
  if not self:IsSelfValid() then
    return
  end
  self.bEnabled = true
  self:OnEnabled(Task, TaskData)
end

function TalkDependCheckerBase:Disable(Task)
  if not self:IsSelfValid() then
    return
  end
  self.bEnabled = false
  self:OnDisabled(Task)
end

function TalkDependCheckerBase:IsSelfHasEnabled()
  return self.bEnabled
end

function TalkDependCheckerBase:OnEnabled()
end

function TalkDependCheckerBase:OnDisabled()
end

function TalkDependCheckerBase:IsCheckerCompletedInternal(Task, TaskData)
  DebugPrint("@@@ error \232\175\183\229\174\158\231\142\176\230\173\164TalkChecker IsCheckerCompletedInternal")
end

function TalkDependCheckerBase:Clear()
  DebugPrint("@@@ error \232\175\183\229\174\158\231\142\176\230\173\164TalkChecker Clear")
end

function TalkDependCheckerBase:IsCheckerCompleted(Task, TaskData)
  if not self:IsSelfValid() then
    return true
  end
  return self:IsCheckerCompletedInternal(Task, TaskData)
end

function TalkDependCheckerBase:BindCompletedCallback(Callback)
  self.OnCompletedDelegate = Callback
end

function TalkDependCheckerBase:IsSelfActive()
  return self.bEnabled
end

function TalkDependCheckerBase:IsSelfValid()
  DebugPrint("@@@ TalkChecker IsSelfValid")
  return true
end

function TalkDependCheckerBase:IsSelfAutoEnabled()
  return false
end

return TalkDependCheckerBase
