require("UnLua")
require("DataMgr")
local WBP_NPC_Bubble_Reward_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_NPC_Bubble_Reward_C:Initialize(Initializer)
  self.ParentHeadWidget = nil
  self.bIsEnabled_Bubble = false
end

function WBP_NPC_Bubble_Reward_C:Init(ParentHeadWidget)
  self:SetVisibility(ESlateVisibility.Collapsed)
  self.ParentHeadWidget = ParentHeadWidget
end

function WBP_NPC_Bubble_Reward_C:OnEnabled()
  if not self.ParentHeadWidget then
    return
  end
  if self.bIsEnabled_Bubble then
    return
  end
  self.bIsEnabled_Bubble = true
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_NPC_Bubble_Reward_C:SwitchEnableEmoBubble(bEnable)
  if bEnable then
    self.Group_Emo:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Image_Normal:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Group_Emo:SetVisibility(ESlateVisibility.Collapsed)
    self.Image_Normal:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_NPC_Bubble_Reward_C:OnDisabled()
  if not self.bIsEnabled_Bubble then
    return
  end
  self.bIsEnabled_Bubble = false
  self:StopAllAnimations()
  self:PlayAnimation(self.Out)
end

function WBP_NPC_Bubble_Reward_C:OnInAnimationFinished()
  self:PlayAnimation(self.Loop, 0, 0)
end

function WBP_NPC_Bubble_Reward_C:OnAnimationFinished(InAnimation)
  if InAnimation == self.In then
    self:OnInAnimationFinished()
  elseif InAnimation == self.Out then
    self:OnOutAnimationFinished()
  end
end

function WBP_NPC_Bubble_Reward_C:OnOutAnimationFinished()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

return WBP_NPC_Bubble_Reward_C
