require("UnLua")
local M = Class("BluePrints.Common.Triggers.BP_AOITriggerBox_C")

function M:AuthorityInitInfo(Info)
  print(_G.LogTag, "LXZ SpawnTriggerBox AuthorityInitInfo", self:GetName())
  M.Super.AuthorityInitInfo(self, Info)
  self.PathPoint = Info:FindObjectParams("TriggerCreator")
  local GameState = UGameplayStatics.GetGameState(self)
  if GameState then
    GameState.StopTrollyBoxLocation:AddUnique(self:K2_GetActorLocation())
  end
end

function M:GetUnitRealType()
  return "AOITriggerBox"
end

function M:CollisionBeginOverlap(Component, OtherActor)
  if not OtherActor.IsCombatItemBase or not OtherActor:IsCombatItemBase("Trolly") then
    if OtherActor.IsCombatItemBase then
      print(_G.LogTag, "LXZ CollisionBeginOverlap", OtherActor:IsCombatItemBase("Trolly"))
    end
    return
  end
  OtherActor:TriggerBoxStop()
  local Index
  for i, Point in pairs(OtherActor.Spline.PointMap) do
    if Point == self.PathPoint then
      Index = i
      break
    end
  end
  if nil ~= Index then
    local TempDis = OtherActor.Spline.Spline:GetDistanceAlongSplineAtSplinePoint(Index - 1)
    local Dis = TempDis - OtherActor.Distance
    OtherActor.CurrentAccelerationValue = -1 * OtherActor.Speed * OtherActor.Speed / 2 / Dis
  end
  M.Super.CollisionBeginOverlap(self, Component, OtherActor)
end

function M:OnEMActorDestroy(DestroyReason)
  self.Overridden.OnEMActorDestroy(self, DestroyReason)
  print(_G.LogTag, "LXZ OnEMActorDestroy", DestroyReason)
end

return M
