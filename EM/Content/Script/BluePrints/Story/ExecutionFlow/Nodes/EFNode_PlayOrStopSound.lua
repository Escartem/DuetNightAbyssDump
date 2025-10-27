local M = {}

function M:CreatePlayNormalSoundNode(Flow, TalkTask, Params)
  local EventPath = Params.EventPath
  local TargetPointName = Params.TargetPointName
  local EventKey = Params.EventKey
  local PlayAs2D = Params.PlayAs2D
  local PlayNormalSoundNode = Flow:CreateNode(UEFNode_Delegate)
  PlayNormalSoundNode.DebugLog = string.format("PlayNormalSound EventPath: %s, TargetPointName: %s, EventKey: %s, PlayAs2D: %s", EventPath, TargetPointName, EventKey, PlayAs2D)
  local TargetPoint
  if TargetPointName then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    TargetPoint = GameState:GetTargetPoint(TargetPointName)
  end
  PlayNormalSoundNode.OnStart:Add(PlayNormalSoundNode, function(Node)
    AudioManager(Node):PlayNormalSound(TargetPoint, nil, EventPath, EventKey, PlayAs2D)
    Node:Finish({
      Node.FinishPin
    })
  end)
  PlayNormalSoundNode.OnSkip:Add(PlayNormalSoundNode, function(Node)
    Node:Finish({
      Node.FinishPin
    })
  end)
  return PlayNormalSoundNode
end

function M:CreateStopNormalSoundNode(Flow, TalkTask, Params)
  local TargetPointName = Params.TargetPointName
  local EventKey = Params.EventKey
  local StopNormalSoundNode = Flow:CreateNode(UEFNode_Delegate)
  local TargetPoint
  if TargetPointName then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    TargetPoint = GameState:GetTargetPoint(TargetPointName)
  end
  StopNormalSoundNode.OnStart:Add(StopNormalSoundNode, function(Node)
    AudioManager(Node):StopSound(TargetPoint, EventKey)
    Node:Finish({
      Node.FinishPin
    })
  end)
  StopNormalSoundNode.OnSkip:Add(StopNormalSoundNode, function(Node)
    Node:Finish({
      Node.FinishPin
    })
  end)
  return StopNormalSoundNode
end

return M
