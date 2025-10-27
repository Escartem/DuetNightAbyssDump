local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local LookAtDescription = Params.LookAtDescription
  local bIsRoot = Params.Root
  local TalkTaskData = TalkTask.TalkTaskData
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  local LookAtNode = Flow:CreateNode(UEFNode_Delegate)
  LookAtNode.DebugLog = string.format("LookAt LookAtDescription: %s", LookAtDescription)
  local HasCallback = false
  local LookActor
  LookAtNode.OnStart:Add(LookAtNode, function(Node)
    local function FinishCallback()
      if HasCallback then
        return
      end
      if not IsValid(Node) then
        return
      end
      HasCallback = true
      Node:Finish({
        Node.FinishPin
      })
    end
    
    LookActor = TalkContext.TalkActionManager:LookAtReady(TalkTaskData, TalkTask, LookAtDescription, bIsRoot, FinishCallback)
    TalkContext.TalkTimerManager:AddTimer(Node, 4, false, nil, nil, FinishCallback)
  end)
  LookAtNode.OnSkip:Add(LookAtNode, function(Node)
    TalkContext.TalkActionManager:LookAtFinishImmediate(TalkTaskData, TalkTask, LookAtDescription, bIsRoot)
    HasCallback = true
    Node:Finish({
      Node.FinishPin
    })
  end)
  LookAtNode.OnPause:Add(LookAtNode, function(Node)
    if LookActor then
      LookActor.Mesh:SetComponentTickEnabled(false)
    end
    TalkContext.TalkTimerManager:PauseTimer(Node)
  end)
  LookAtNode.OnResume:Add(LookAtNode, function(Node)
    if LookActor then
      LookActor.Mesh:SetComponentTickEnabled(true)
    end
    TalkContext.TalkTimerManager:UnPauseTimer(Node)
  end)
  return LookAtNode
end

return M
