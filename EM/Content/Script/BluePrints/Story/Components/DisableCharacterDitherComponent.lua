local FDisableCharacterDitherComponent = {}

function FDisableCharacterDitherComponent:New(TalkContext)
  local DisableCharacterDitherComponent = setmetatable({}, {__index = FDisableCharacterDitherComponent})
  DisableCharacterDitherComponent.TalkContext = TalkContext
  DisableCharacterDitherComponent.TalkCameraManager = TalkContext.TalkCameraManager
  return DisableCharacterDitherComponent
end

function FDisableCharacterDitherComponent:Execute()
  DebugPrint("FDisableCharacterDitherComponent:Execute")
  self.TalkCameraManager:SwitchEnablePlayerDither(false)
  self.TalkCameraManager:SwitchEnableTalkPawnDither(false)
end

function FDisableCharacterDitherComponent:Resume()
  DebugPrint("FDisableCharacterDitherComponent:Resume")
  self.TalkCameraManager:SwitchEnablePlayerDither(true)
  self.TalkCameraManager:SwitchEnableTalkPawnDither(false)
end

return FDisableCharacterDitherComponent
