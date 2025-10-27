require("UnLua")
local BP_HollowComponent = Class()

function BP_HollowComponent:HandleOnBeginOverlap(OtherActor)
  if URuntimeCommonFunctionLibrary.ObjIsChildOf(OtherActor, ABreakableItem) and not OtherActor.EnbaleHollow and OtherActor.InitSuccess then
    OtherActor:OnDead()
    OtherActor:SetHollowAttribute()
  end
end

return BP_HollowComponent
