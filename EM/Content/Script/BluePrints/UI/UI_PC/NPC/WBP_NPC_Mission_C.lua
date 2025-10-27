require("UnLua")
local WBP_NPC_Mission_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_NPC_Mission_C:Initialize(Initializer)
  self.ParentHeadWidget = nil
  self.bIsEnabled_Mission = false
  self.bIsActive_Mission = false
  self.bCanActive_Mission = false
end

function WBP_NPC_Mission_C:Construct()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_NPC_Mission_C:OnEnabled()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if self.bIsEnabled_Mission then
    return
  end
  if self.ParentHeadWidget and self.ParentHeadWidget.AttachedWidgetComponent then
    self.ParentHeadWidget.AttachedWidgetComponent:SetUniformWidgetHideTag(true, "Mission")
  end
  self.bIsEnabled_Mission = true
end

function WBP_NPC_Mission_C:OnDisabled()
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if not self.bIsEnabled_Mission then
    return
  end
  if self.ParentHeadWidget and self.ParentHeadWidget.AttachedWidgetComponent then
    self.ParentHeadWidget.AttachedWidgetComponent:SetUniformWidgetHideTag(false, "Mission")
  end
  self.bIsEnabled_Mission = false
end

function WBP_NPC_Mission_C:OnActive()
end

function WBP_NPC_Mission_C:OnDeactive()
end

return WBP_NPC_Mission_C
