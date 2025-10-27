local M = {}
local DefaultPath = "Blueprint'/Game/AssetDesign/Camera/CameraShake/Story/"

function M:CreateNode(Flow, TalkTask, Params)
  local ShakeClassPath = Params.Path
  if not ShakeClassPath then
    local FileName = Params.FileName
    if not FileName then
      local Message = string.format("CameraShake\232\132\154\230\156\172\230\137\167\232\161\140\229\164\177\232\180\165: \230\156\170\229\161\171\229\134\153Path\230\136\150FileName, DialogueId: %d", Flow.DialogueId)
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
      return
    end
    ShakeClassPath = DefaultPath .. FileName .. "." .. FileName .. "'"
  end
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  local ShakeClass = LoadClass(ShakeClassPath)
  if nil == ShakeClass then
    local Message = string.format("CameraShake create failed: ShakeClass not found, ShakeClassPath: %d, DialogueId: %d", ShakeClassPath, Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local PlayerCameraManager = UE4.UGameplayStatics.GetPlayerCameraManager(GWorld.GameInstance, 0)
  if nil == PlayerCameraManager then
    local Message = string.format("CameraShake create failed: PlayerCameraManager not found, DialogueId: %d", Flow.DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local CameraShakeNode = Flow:CreateNode(UEFNode_Delegate)
  CameraShakeNode.DebugLog = string.format("CameraShake ShakeClassPath: %s", ShakeClassPath)
  local HasCallback = false
  local CameraShakeInst
  CameraShakeNode.OnStart:Add(CameraShakeNode, function(Node)
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
    
    CameraShakeInst = PlayerCameraManager:StartCameraShake(ShakeClass)
    TalkContext.TalkTimerManager:AddTimer(Node, CameraShakeInst.OscillationDuration, false, nil, nil, FinishCallback)
  end)
  CameraShakeNode.OnSkip:Add(CameraShakeNode, function(Node)
    TalkContext.TalkTimerManager:ClearTimer(Node)
    PlayerCameraManager:StopCameraShake(CameraShakeInst)
    HasCallback = true
    Node:Finish({
      Node.FinishPin
    })
  end)
  CameraShakeNode.OnPause:Add(CameraShakeNode, function(Node)
    TalkTask:PauseCamera(true)
    TalkContext.TalkTimerManager:PauseTimer(Node)
  end)
  CameraShakeNode.OnResume:Add(CameraShakeNode, function(Node)
    TalkTask:PauseCamera(false)
    TalkContext.TalkTimerManager:UnPauseTimer(Node)
  end)
  return CameraShakeNode
end

return M
