local FEnableCharacterDitherComponent = {}

function FEnableCharacterDitherComponent:New(TalkContext)
  local EnableCharacterDitherComponent = setmetatable({}, {__index = FEnableCharacterDitherComponent})
  EnableCharacterDitherComponent.TalkContext = TalkContext
  EnableCharacterDitherComponent.TalkCameraManager = TalkContext.TalkCameraManager
  return EnableCharacterDitherComponent
end

function FEnableCharacterDitherComponent:Execute()
  DebugPrint("FEnableCharacterDitherComponent:Execute")
  self.TalkCameraManager:SwitchEnablePlayerDither(false)
  self.TalkCameraManager:SwitchForceEnablePlayerFashionComponentDither(true)
  self.TalkCameraManager:SwitchEnableTalkPawnDither(true)
end

function FEnableCharacterDitherComponent:Resume()
  DebugPrint("FEnableCharacterDitherComponent:Resume")
  self.TalkCameraManager:SwitchEnablePlayerDither(true)
  self.TalkCameraManager:SwitchEnableTalkPawnDither(false)
  self.TalkCameraManager:SwitchForceEnablePlayerFashionComponentDither(false)
end

return FEnableCharacterDitherComponent
