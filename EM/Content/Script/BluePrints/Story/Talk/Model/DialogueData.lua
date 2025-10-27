local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local DefaultAllowClickTime = 1
local DialogueDataBase_C = {}

function DialogueDataBase_C.New(TalkTask, DialogueId, DialogueData, TalkContext)
  TalkContext = GWorld.GameInstance:GetTalkContext()
  local Obj = {}
  Obj.Scripts = DialogueData.Scripts
  Obj.FinalCameraInfo = DialogueData.FinalCamera
  Obj.CameraBlendCurve = DialogueData.CameraBlendCurve
  Obj.DialogueId = DialogueId
  Obj.TalkActorData = TalkContext:GetTalkActorData(TalkTask, DialogueData.SpeakNpcId)
  Obj.TalkActorName = GText(DialogueData.SpeakNpcName)
  Obj.TalkActorId = DialogueData.SpeakNpcId
  Obj.Content = TalkUtils:DialogueIdToContent(DialogueId) or " "
  Obj.AudioGUID = DialogueData.GUID
  Obj.VoiceName = DialogueData.VoiceName
  Obj.DisableMouth = DialogueData.DisableMouth
  Obj.Duration = DialogueData.Duration or 1
  Obj.LookAtType = DialogueData.DefaultLookAt
  Obj.DialoguePanelType = DialogueData.DialoguePanelType
  Obj.ShowStoryContent = TalkUtils:TryResolveStoryPanel(DialogueData.DialoguePanelType)
  Obj.HeadIconType = DialogueData.HeadIconType
  Obj.GuideFacialId = DialogueData.GuideFacialId
  Obj.ExStoryInfo = DialogueData.ExStoryInfo
  return Obj
end

local SimpleDialogueData_C = {}

function SimpleDialogueData_C.New(TalkTask, DialogueId, TalkContext)
  local DialogueData = DataMgr.Dialogue[DialogueId]
  if not DialogueData then
    local Message = "DialogueId\229\156\168Dialogue\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168" .. [[

DialogueId:]] .. tostring(DialogueId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "DialogueId\228\184\141\229\173\152\229\156\168", Message)
    return
  end
  local Obj = DialogueDataBase_C.New(TalkTask, DialogueId, DialogueData, TalkContext)
  Obj.CameraInfo = DialogueData.Camera
  Obj.FinalCameraInfo = DialogueData.FinalCamera
  Obj.ToFinalCameraBlendTime = DialogueData.ToFinalCameraBlendTime or 0
  Obj.CameraTransform = DialogueData.CameraTransform
  Obj.CameraBlendTime = DialogueData.BlendTime or 0
  Obj.DialogueGraphPath = DialogueData.GraphPath
  Obj.AnimPath = DialogueData.AnimPath
  Obj.GuidemanConfigId = DialogueData.GuidemanConfigId
  Obj.GuidemanExpressionId = DialogueData.GuidemanFacialId
  Obj.GuidemanActionId = DialogueData.GuidemanActionId
  Obj.bIsBlack = 1 == DialogueData.IsBlack and true or false
  Obj.AllowClickTime = DefaultAllowClickTime
  if DialogueData.bNotRecall ~= nil then
    Obj.bNotRecall = 1 == DialogueData.bNotRecall
  end
  if TalkTask.DialogueFlowGraphComponent then
    TalkTask.DialogueFlowGraphComponent:InitSimpleDialogueData(Obj)
  end
  return Obj
end

local CinematicDialogueData_C = {}

function CinematicDialogueData_C.New(TalkTask, DialogueId, TalkContext)
  local DialogueData = DataMgr.Dialogue[DialogueId]
  assert(DialogueData, "Can't find dialogue data from dialogue id: " .. DialogueId)
  local Obj = DialogueDataBase_C.New(TalkTask, DialogueId, DialogueData, TalkContext)
  local WildcardSubsystem = UWildcardGameInstanceSubsystem.GetSubsystem(GWorld.GameInstance)
  if not WildcardSubsystem then
    DebugPrint("Error: Can't find WildcardSubsystem, create CinematicDialogueData_C failed.")
    return Obj
  end
  Obj.Subtitle = WildcardSubsystem:ReplaceWildcard(DialogueData.Subtitle)
  return Obj
end

return {
  DialogueDataBase_C = DialogueDataBase_C,
  SimpleDialogueData_C = SimpleDialogueData_C,
  CinematicDialogueData_C = CinematicDialogueData_C
}
