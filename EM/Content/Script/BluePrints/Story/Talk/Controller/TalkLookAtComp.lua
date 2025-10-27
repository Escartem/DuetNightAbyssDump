local TalkLookAtComp_C = {}

function TalkLookAtComp_C.New()
  local Obj = setmetatable({}, {__index = TalkLookAtComp_C})
  return Obj
end

function TalkLookAtComp_C:PlayDialogue(DialogueData, TalkTaskData, TalkTask, DialogueWaitQueue)
end

return TalkLookAtComp_C
