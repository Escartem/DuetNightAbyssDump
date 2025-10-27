local BP_HiddenTrollyWall_C = Class({
  "BluePrints/Item/AirWall/BP_TrollyWall_C"
})

function BP_HiddenTrollyWall_C:OnNormalDead()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.RaplacePathMap:Add(self.CurrentPathIndex, self.ReplacePathIndex)
end

function BP_HiddenTrollyWall_C:OnNormalDamage()
end

function BP_HiddenTrollyWall_C:ReceiveBeginPlay()
  self:CreateRealWall()
end

return BP_HiddenTrollyWall_C
