local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local BaseDialogueData_C = {}

function BaseDialogueData_C.New(TalkTask, DialogueId)
  local Obj = {}
  local DialogueData = DataMgr.Dialogue[DialogueId]
  if not DialogueData then
    local Message = "DialogueId\229\156\168Dialogue\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168" .. [[

DialogueId:]] .. DialogueId
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "DialogueId\228\184\141\229\173\152\229\156\168", Message)
    return
  end
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  Obj.Scripts = DialogueData.Scripts
  Obj.DialogueId = DialogueId
  Obj.TalkActorData = TalkContext:GetTalkActorData(TalkTask, DialogueData.SpeakNpcId)
  Obj.TalkActorName = GText(DialogueData.SpeakNpcName)
  Obj.TalkActorId = DialogueData.SpeakNpcId
  Obj.Content = TalkUtils:DialogueIdToContent(DialogueId) or " "
  Obj.bHasTalkActionData = (DialogueData.TalkActionId or DialogueData.TurnTo) and true or false
  Obj.AudioGUID = DialogueData.GUID
  Obj.VoiceName = DialogueData.VoiceName
  Obj.DisableMouth = DialogueData.DisableMouth
  Obj.Duration = DialogueData.Duration or 1
  Obj.LookAtType = DialogueData.DefaultLookAt
  Obj.DialoguePanelType = DialogueData.DialoguePanelType
  Obj.HeadIconType = DialogueData.HeadIconType
  Obj.GuideFacialId = DialogueData.GuideFacialId
  Obj.CameraBlendCurve = DialogueData.CameraBlendCurve
  return Obj
end

return BaseDialogueData_C
