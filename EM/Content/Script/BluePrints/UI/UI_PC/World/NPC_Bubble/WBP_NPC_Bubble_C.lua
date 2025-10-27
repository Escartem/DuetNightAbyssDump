require("UnLua")
require("DataMgr")
local WBP_NPC_Bubble_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_NPC_Bubble_C:Initialize(Initializer)
  self.ParentHeadWidget = nil
  self.bIsEnabled_Bubble = false
end

function WBP_NPC_Bubble_C:Init(ParentHeadWidget)
  self:SetVisibility(ESlateVisibility.Collapsed)
  self.ParentHeadWidget = ParentHeadWidget
end

function WBP_NPC_Bubble_C:OnEnabled(Content, Style)
  if not self.ParentHeadWidget then
    return
  end
  if self.bIsEnabled_Bubble then
    return
  end
  self.bIsEnabled_Bubble = true
  self:StopAllAnimations()
  self.BubbleContent = Content
  self.Main_Text:SetText(Content)
  self:SwitchStyle(Style)
  self.Panle_Main:SetRenderOpacity(0)
  self:PlayAnimation(self.In)
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function WBP_NPC_Bubble_C:SwitchStyle(style)
  self:SwitchEnableEmoBubble(false)
  if style and string.lower(style) == "excitedbubble" then
    self:SwitchEnableEmoBubble(true)
  end
end

function WBP_NPC_Bubble_C:SwitchEnableEmoBubble(bEnable)
  if bEnable then
    self.Group_Emo:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Image_Normal:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Group_Emo:SetVisibility(ESlateVisibility.Collapsed)
    self.Image_Normal:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_NPC_Bubble_C:OnDisabled()
  if not self.bIsEnabled_Bubble then
    return
  end
  self.bIsEnabled_Bubble = false
  self:StopAllAnimations()
  self:PlayAnimation(self.Out)
end

function WBP_NPC_Bubble_C:OnInAnimationFinished()
  self:PlayAnimation(self.Loop, 0, 0)
end

function WBP_NPC_Bubble_C:OnAnimationFinished(InAnimation)
  if InAnimation == self.In then
    self:OnInAnimationFinished()
  elseif InAnimation == self.Out then
    self:OnOutAnimationFinished()
  end
end

function WBP_NPC_Bubble_C:OnOutAnimationFinished()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

return WBP_NPC_Bubble_C
