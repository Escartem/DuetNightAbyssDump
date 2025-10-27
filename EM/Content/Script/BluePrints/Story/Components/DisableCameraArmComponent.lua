local FDisableCameraArmComponent = {}

function FDisableCameraArmComponent:New(Player)
  local DisableCharacterDitherComponent = setmetatable({}, {__index = FDisableCameraArmComponent})
  DisableCharacterDitherComponent.Player = Player
  return DisableCharacterDitherComponent
end

function FDisableCameraArmComponent:Execute()
  DebugPrint("FDisableCameraArmComponent:Execute PreState", self.PreState)
  self.PreState = self.Player.CharSpringArmComponent.bArmCollision
  self.Player.CharSpringArmComponent.bArmCollision = false
end

function FDisableCameraArmComponent:Resume()
  DebugPrint("FDisableCameraArmComponent:Resume PreState NowState", self.PreState, self.Player.CharSpringArmComponent.bArmCollision)
  self.Player.CharSpringArmComponent.bArmCollision = self.PreState
end

return FDisableCameraArmComponent
