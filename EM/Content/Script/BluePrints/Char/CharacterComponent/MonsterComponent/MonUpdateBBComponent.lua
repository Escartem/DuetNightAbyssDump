require("UnLua")
local Component = Class()

function Component:InitCaptureBBInfo(GameMode)
  local Owner = self.Owner
  if not Owner then
    return
  end
  local EscapeLoc = GameMode:GetDungeonComponent().EscapeLoc
  GameMode:GetDungeonComponent().CaptureMonster = Owner
  if GameMode:GetDungeonComponent().PostEventCaptureTargetSpawnEnable then
    GameMode:GetDungeonComponent().PostEventCaptureTargetSpawnEnable = false
    GameMode:PostCustomEvent("CaptureTargetSpawn")
  end
  if not EscapeLoc then
    return
  end
  Owner:GetOwnBlackBoardComponent():SetValueAsVector("EscapeLoc", EscapeLoc)
end

function Component:GetNextLevelIsLoaded(MonserCharacter, LevelLoader, EscapeLoc)
  if not MonserCharacter or not LevelLoader then
    return
  end
  local NextLevelEnable = false
  local OutDoorLoc
  OutDoorLoc, NextLevelEnable = LevelLoader:GetNextLevelIsLoaded(MonserCharacter, EscapeLoc)
  self.NextLevelEnable = NextLevelEnable
  return OutDoorLoc
end

return Component
