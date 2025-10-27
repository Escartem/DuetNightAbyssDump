require("UnLua")
local WBP_TakeAimMiniItem_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_TakeAimMiniItem_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.Index = nil
  self.IsIn = true
  self.WeaponType = nil
  self.TargetActor = nil
end

function WBP_TakeAimMiniItem_C:Init(index, TargetActor)
  self.Index = index
  self.TargetActor = TargetActor
  self:UpdateFilterShootingTargetToPos(FVector2D(0, 0))
  self.Aim_Node:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if not self:IsAnimationPlaying(self.Funnel_Aim_in) and self.IsIn then
    self:PlayAnimation(self.Funnel_Aim_in, 0, 1)
  end
  self.IsIn = false
end

function WBP_TakeAimMiniItem_C:ReShow(index, TargetActor)
  self.Index = index
  self.TargetActor = TargetActor
  if not self:IsAnimationPlaying(self.Funnel_Aim_in) and self.IsIn then
    self:PlayAnimation(self.Funnel_Aim_in, 0, 1)
  end
  self.IsIn = false
  self:Show()
end

function WBP_TakeAimMiniItem_C:HideAim()
  self.IsIn = true
  self:Hide()
end

function WBP_TakeAimMiniItem_C:GetFilterShootingTargetCurPos()
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Aim_Node)
  if nil ~= CanvasSlot then
    return CanvasSlot:GetPosition()
  end
  return FVector2D(0, 0)
end

function WBP_TakeAimMiniItem_C:UpdateFilterShootingTargetToPos(TargetPos)
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Aim_Node)
  if nil ~= CanvasSlot then
    CanvasSlot:SetPosition(TargetPos)
  end
end

return WBP_TakeAimMiniItem_C
