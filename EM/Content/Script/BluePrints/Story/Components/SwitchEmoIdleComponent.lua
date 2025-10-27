local FSwitchEmoIdleComponent = {}

function FSwitchEmoIdleComponent:New(Player)
  local DisableCharacterDitherComponent = setmetatable({}, {__index = FSwitchEmoIdleComponent})
  DisableCharacterDitherComponent.Player = Player
  return DisableCharacterDitherComponent
end

function FSwitchEmoIdleComponent:Execute()
  DebugPrint("FSwitchEmoIdleComponent:Execute")
  self.Player:SetEmoIdleEnabled(false)
  self.Player:PlayOrStopEmoIdleMontage(true)
end

function FSwitchEmoIdleComponent:Resume()
  DebugPrint("FSwitchEmoIdleComponent:Resume")
  self.Player:SetEmoIdleEnabled(true)
  self.Player:PlayOrStopEmoIdleMontage(false)
end

return FSwitchEmoIdleComponent
