require("UnLua")
local WBP_NPC_Impression_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_NPC_Impression_C:Initialize(Initializer)
  self.bIsEnabled_Impression = false
end

function WBP_NPC_Impression_C:Init(ParentHeadWidget)
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_NPC_Impression_C:OnEnabled()
  if self.bIsEnabled_Impression then
    return
  end
  self.bIsEnabled_Impression = true
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_NPC_Impression_C:OnDisabled()
  if not self.bIsEnabled_Impression then
    return
  end
  self.bIsEnabled_Impression = false
  if not self:IsAnimationPlaying(self.Out) then
    self:StopAllAnimations()
    self:PlayAnimation(self.Out)
  end
end

function WBP_NPC_Impression_C:OnOutAnimationFinished()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_NPC_Impression_C:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    self:OnOutAnimationFinished()
  end
end

return WBP_NPC_Impression_C
