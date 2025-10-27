require("UnLua")
local BP_Patrol_C = Class()

function BP_Patrol_C:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  for i = 1, self.ChildPatrolActors:Length() do
    local ChildPatrolActor = self.ChildPatrolActors:GetRef(i)
    if IsValid(ChildPatrolActor) then
      self.ChildPatrolLocs:Add(ChildPatrolActor:K2_GetActorLocation())
    end
  end
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState:AddPatrolInfo(self)
end

return BP_Patrol_C
