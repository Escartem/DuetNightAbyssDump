local BP_CarHornInteractiveComponent_C = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")

function BP_CarHornInteractiveComponent_C:ReceiveBeginPlay()
  self.Super.ReceiveBeginPlay(self)
  self.Owner = self:GetOwner()
  self:InitCommonUIConfirmID(100016)
end

function BP_CarHornInteractiveComponent_C:IsCanInteractive(PlayerActor)
  self.Owner = self:GetOwner()
  if not self.Owner then
    return
  end
  local Components = TArray(USceneComponent)
  local Root = self.Owner:K2_GetRootComponent()
  Root:GetChildrenComponents(true, Components)
  for i = 1, Components:Length() do
    local Component = Components:GetRef(i)
    if Component.IsUsed then
      return true
    end
  end
  return false
end

function BP_CarHornInteractiveComponent_C:StartInteractive()
  if not self.Owner then
    self.Owner = self:GetOwner()
  end
  self.Owner:PlayHornSound()
end

function BP_CarHornInteractiveComponent_C:BtnPressed(PlayerActor)
  if self:IsLocked() then
    return
  end
  self:StartInteractive()
end

return BP_CarHornInteractiveComponent_C
