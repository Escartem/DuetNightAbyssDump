local BaseDialogueData_C = require("BluePrints.Story.Talk.Model.DialogueData.BaseDialogueData")
local GuideDialogueData_C = {}

function GuideDialogueData_C.New(TalkTask, DialogueId)
  local DialogueData = DataMgr.Dialogue[DialogueId]
  if not DialogueData then
    local Message = "DialogueId\229\156\168Dialogue\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168" .. [[

DialogueId:]] .. DialogueId
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "DialogueId\228\184\141\229\173\152\229\156\168", Message)
    return
  end
  local Obj = BaseDialogueData_C.New(TalkTask, DialogueId)
  Obj.CameraInfo = DialogueData.Camera
  Obj.Duration = DialogueData.Duration or 3.5
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
  return Obj
end

return GuideDialogueData_C
