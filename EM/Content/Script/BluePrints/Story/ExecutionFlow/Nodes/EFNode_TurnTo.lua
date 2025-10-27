local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local TurnToDescription = Params.TurnToDescription
  local MontageName = Params.AnimationId
  local TalkTaskData = TalkTask.TalkTaskData
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  local TurnToNode = Flow:CreateNode(UEFNode_Delegate)
  TurnToNode.DebugLog = string.format("TurnTo TurnToDescription: %s", TurnToDescription)
  local HasCallback = false
  local TurnActor, TargetYaw, LookAtedActor
  TurnToNode.OnStart:Add(TurnToNode, function(Node)
    local function FinishCallback()
      if HasCallback then
        return
      end
      if not IsValid(Node) then
        return
      end
      TalkContext.TalkTimerManager:ClearTimer(Node)
      HasCallback = true
      Node:Finish({
        Node.FinishPin
      })
    end
    
    TurnActor, TargetYaw, LookAtedActor = TalkContext.TalkActionManager:RotateToReady(TalkContext, TalkTask, TalkTaskData, TurnToDescription, MontageName, {Func = FinishCallback})
    TalkContext.TalkTimerManager:AddTimer(Node, 4, false, nil, nil, FinishCallback)
  end)
  TurnToNode.OnSkip:Add(TurnToNode, function(Node)
    TalkContext.TalkTimerManager:ClearTimer(Node)
    TalkContext.TalkActionManager:FinishRotateTo(TurnActor, TargetYaw, LookAtedActor)
    HasCallback = true
    Node:Finish({
      Node.FinishPin
    })
  end)
  TurnToNode.OnPause:Add(TurnToNode, function(Node)
    if TurnActor then
      TurnActor.Mesh:SetComponentTickEnabled(false)
    end
    TalkContext.TalkTimerManager:PauseTimer(Node)
  end)
  TurnToNode.OnResume:Add(TurnToNode, function(Node)
    if TurnActor then
      TurnActor.Mesh:SetComponentTickEnabled(true)
    end
    TalkContext.TalkTimerManager:UnPauseTimer(Node)
  end)
  return TurnToNode
end

return M
