require("UnLua")
local M = Class("BluePrints.Common.Triggers.BP_AOITriggerBox_C")

function M:CollisionBeginOverlap(Component, OtherActor)
  if not OtherActor.IsPlayer or not OtherActor:IsPlayer() then
    return
  end
  local OverlappingItems = OtherActor.CapsuleComponent:GetOverlappingActors()
  for i = 1, OverlappingItems:Length() do
    if OverlappingItems[i].IsFushuItem and OverlappingItems[i]:IsFushuItem() and OverlappingItems[i].IsActive then
      return
    end
  end
  if OtherActor.DongguoLandNum == nil then
    OtherActor.DongguoLandNum = 0
  end
  OtherActor.DongguoLandNum = OtherActor.DongguoLandNum + 1
  OtherActor:SetBool("Baiheng_Mijing_Dot", true)
  M.Super.CollisionBeginOverlap(self, Component, OtherActor)
end

function M:CollisionEndOverlap(Component, OtherActor)
  if not OtherActor.IsPlayer or not OtherActor:IsPlayer() then
    return
  end
  local OverlappingItems = OtherActor.CapsuleComponent:GetOverlappingActors()
  for i = 1, OverlappingItems:Length() do
    if OverlappingItems[i].IsFushuItem and OverlappingItems[i]:IsFushuItem() and OverlappingItems[i].IsActive then
      return
    end
  end
  if OtherActor.DongguoLandNum and OtherActor.DongguoLandNum > 0 then
    OtherActor.DongguoLandNum = OtherActor.DongguoLandNum - 1
  end
  if OtherActor.DongguoLandNum > 0 then
    return
  end
  OtherActor:SetBool("Baiheng_Mijing_Dot", false)
  M.Super.CollisionEndOverlap(self, Component, OtherActor)
end

return M
