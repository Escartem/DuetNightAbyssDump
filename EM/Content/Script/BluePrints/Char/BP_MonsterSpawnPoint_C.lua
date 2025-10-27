require("UnLua")
local BP_MonsterSpawnPoint_C = Class()

function BP_MonsterSpawnPoint_C:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState:AddMonsterSpawnPointInfo(self)
end

return BP_MonsterSpawnPoint_C
