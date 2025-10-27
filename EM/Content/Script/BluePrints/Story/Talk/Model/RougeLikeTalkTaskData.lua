local FTalkTaskDataBase = require("BluePrints.Story.Talk.Model.TalkTaskDataBase")
local FRougeLikeTalkTaskData = {}

function FRougeLikeTalkTaskData.New(TalkNodeData)
  local TalkTypeData = DataMgr.TalkType[TalkNodeData.TalkType]
  local ExtraParams = TalkTypeData.ExtraParams or {}
  DebugPrintTable(TalkNodeData)
  local Obj = FTalkTaskDataBase.New(TalkNodeData)
  Obj.bBlendDialogueCamera = ExtraParams.bBlendDialogueCamera
  Obj.bSkipToOption = TalkNodeData.SkipToOption
  return Obj
end

return FRougeLikeTalkTaskData
