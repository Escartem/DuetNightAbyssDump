local FBaseDialogueData = require("BluePrints.Story.Talk.Model.DialogueData.BaseDialogueData")
local FRougeLikeDialogueData = {}

function FRougeLikeDialogueData.New(TalkTask, DialogueId)
  local Obj = FBaseDialogueData.New(TalkTask, DialogueId)
  return Obj
end

return FRougeLikeDialogueData
