require("UnLua")
local M = Class()

function M:ReceiveBeginPlay()
  self.OnComponentBeginOverlap:Add(self, self.CollisionBeginOverlap)
  self.OnComponentEndOverlap:Add(self, self.CollisionEndOverlap)
end

function M:CollisionBeginOverlap(Component, OtherActor)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode or not GameMode:GetDungeonComponent() then
    return
  end
  GameMode:GetDungeonComponent():AddPlayerInFogNum()
  if not self.bOpen then
    return
  end
  if not OtherActor.IsPlayer or not OtherActor:IsPlayer() then
    return
  end
  GameMode:GetDungeonComponent():PlayerInSafe()
end

function M:CollisionEndOverlap(Component, OtherActor)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode or not GameMode:GetDungeonComponent() then
    return
  end
  GameMode:GetDungeonComponent():SubPlayerInFogNum()
  if not self.bOpen then
    return
  end
  if not OtherActor.IsPlayer or not OtherActor:IsPlayer() then
    return
  end
  GameMode:GetDungeonComponent():PlayerOutSafe()
end

return M
