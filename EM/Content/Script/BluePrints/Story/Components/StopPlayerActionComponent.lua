local FStopPlayerActionComponent = {}

function FStopPlayerActionComponent:New(Player)
  local Obj = setmetatable({}, {__index = FStopPlayerActionComponent})
  Obj.InteractiveTag = "Interactive"
  Obj.Player = Player
  return Obj
end

function FStopPlayerActionComponent:Execute()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode and GameMode.SetPlayerCharacterForceIdle then
    DebugPrint("StopPlayerAction Execute")
    if not self.Player:IsDead() then
      GameMode:SetPlayerCharacterForceIdle(self.Player)
      self.Player:SetCharacterTag(self.InteractiveTag)
    end
  end
end

function FStopPlayerActionComponent:Resume()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode and GameMode.SetPlayerCharacterForceIdle then
    DebugPrint("StopPlayerAction Resume")
    if not self.Player:IsDead() then
      GameMode:SetPlayerCharacterForceIdle(self.Player)
    end
  end
end

return FStopPlayerActionComponent
