require("UnLua")
local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local WBP_ForgeMaterialWidget_C = Class()

function WBP_ForgeMaterialWidget_C:UpdateView(ResId, ResNum)
  self.ResHaveNum = ResNum.Have
  self.ResRequiredNum = ResNum.Required
  local ResourceData = DataMgr.Resource[ResId]
  local ResourceIcon = LoadObject(ResourceData.Icon)
  self.Text_MaterialName:SetText(GText(ResourceData.ResourceName))
  self.Img_Material:SetBrushResourceObject(ResourceIcon)
  self.Text_Held:SetText(ResNum.Have)
  self.Text_Required:SetText(ResNum.Required)
  if self:IsMaterialEnough() then
    self.Text_Held:SetColorAndOpacity(self.Color_Normal)
    self.Img_Ok:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Img_Material:SetBrushTintColor(self.Color_Normal)
  else
    self.Text_Held:SetColorAndOpacity(self.Color_Red)
    self.Img_Ok:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Img_Material:SetBrushTintColor(self.TintColor_Dark)
  end
  self:SetHovered(false)
end

function WBP_ForgeMaterialWidget_C:SetHovered(IsHovered)
  self.IsHovered = IsHovered
  if IsHovered then
    self.Text_Held:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Text_Slash:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Text_Required:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Text_MaterialName:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.Text_MaterialName:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if self:IsMaterialEnough() then
      self.Text_Held:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Text_Slash:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Text_Required:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Img_Ok:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Text_Held:SetVisibility(UE4.ESlateVisibility.Visible)
      self.Text_Slash:SetVisibility(UE4.ESlateVisibility.Visible)
      self.Text_Required:SetVisibility(UE4.ESlateVisibility.Visible)
    end
  end
end

function WBP_ForgeMaterialWidget_C:IsMaterialEnough()
  if not self.ResHaveNum or not self.ResRequiredNum then
    return false
  end
  return self.ResHaveNum >= self.ResRequiredNum
end

return WBP_ForgeMaterialWidget_C
