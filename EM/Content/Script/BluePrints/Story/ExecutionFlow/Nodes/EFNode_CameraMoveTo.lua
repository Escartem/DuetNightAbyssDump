local ECameraBlendFunc = {
  linear = 0,
  easeInQuad = 1,
  easeOutQuad = 2,
  easeInOutQuad = 3
}
local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local TargetPosition = Params.TargetPosition
  local Duration = Params.duration or 0
  local CurveName = Params.Blend
  local PlayerController = UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if CurveName and nil == ECameraBlendFunc[CurveName] then
    local Message = string.format("CameraMoveTo create failed: invalid curve name: %s, DialogueId: %d", CurveName, Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  if not IsValid(TalkContext) then
    local Message = string.format("CameraMoveTo create failed: TalkContext not found, DialogueId: %d", Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local CameraMoveToNode = Flow:CreateNode(UEFNode_Delegate)
  CameraMoveToNode.DebugLog = string.format("CameraMoveTo TargetPosition: %s, Duration: %s, CurveName: %s", TargetPosition, Duration, CurveName)
  CameraMoveToNode.OnStart:Add(CameraMoveToNode, function(Node)
    if TalkTask.TalkTaskData.CameraType == "PlayerCamera" or TalkTask.TalkTaskData.CameraType == "FreeCamera" then
      local Message = string.format("CameraMoveTo create failed, camera type can't is %s, DialogueId: %s", TalkTask.TalkTaskData.CameraType, Flow.DialogueId)
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    else
      TalkContext.TalkCameraManager:_StartCameraBreathe_FinalCameraConfig(nil, TargetPosition, Duration, TalkTask.TalkTaskData.TalkStage, CurveName)
    end
    Node:Finish({
      Node.FinishPin
    })
  end)
  CameraMoveToNode.OnSkip:Add(CameraMoveToNode, function(Node)
    TalkContext.TalkCameraManager:ClearCameraBreatheCallback()
    Node:Finish({
      Node.FinishPin
    })
  end)
  local CacheControllerPausedParam = PlayerController.bShouldPerformFullTickWhenPaused
  CameraMoveToNode.OnPause:Add(CameraMoveToNode, function(Node)
    PlayerController.bShouldPerformFullTickWhenPaused = false
    UGameplayStatics.SetGamePaused(GWorld.GameInstance, true)
    TalkContext.TalkCameraManager:PauseCameraBreathe(true)
  end)
  CameraMoveToNode.OnResume:Add(CameraMoveToNode, function(Node)
    PlayerController.bShouldPerformFullTickWhenPaused = CacheControllerPausedParam
    UGameplayStatics.SetGamePaused(GWorld.GameInstance, false)
    TalkContext.TalkCameraManager:PauseCameraBreathe(false)
  end)
  return CameraMoveToNode
end

return M
