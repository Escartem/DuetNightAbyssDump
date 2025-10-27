local FSoundEffectComponent = {}

function FSoundEffectComponent:New()
  local Obj = setmetatable({}, {__index = FSoundEffectComponent})
  return Obj
end

function FSoundEffectComponent:Execute()
  AudioManager(self.TalkContext):PlayUISound(nil, "event:/snapshot/ui/filter_talk_stage", "Talk_Stage_Snapshot", nil)
end

function FSoundEffectComponent:Resume()
  AudioManager(self.TalkContext):SetEventSoundParam(nil, "Talk_Stage_Snapshot", {ToEnd = 1})
end

return FSoundEffectComponent
