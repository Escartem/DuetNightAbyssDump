local BP_Group_DimensionIcon_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function BP_Group_DimensionIcon_C:Init(ImpressionType, PlayerValue)
  self.Group_NumAnchor:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local ImpressionText = GText("Impression_Name_" .. ImpressionType)
  self.Text_Title:SetText(ImpressionText)
  self.Text_Num:SetText(tostring(PlayerValue))
end

function BP_Group_DimensionIcon_C:SetIcon(IconTexture)
  self.Image_IconNormal:SetBrushFromTexture(IconTexture)
  self.Image_IconGetUp:SetBrushFromTexture(IconTexture)
end

function BP_Group_DimensionIcon_C:PlayAddAnim()
  self:PlayAnimation(self.Point_Add)
  AudioManager(self):PlayUISound(self, "event:/ui/common/image_choose_five_dimension_add", nil, nil)
end

return BP_Group_DimensionIcon_C
