local TalkAudioData_C = {}

function TalkAudioData_C.New(ChapterId, GUID)
  local Obj = setmetatable({}, {})
  Obj.ChapterId = ChapterId
  Obj.GUID = GUID
  return Obj
end

return TalkAudioData_C
