require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  M.Super.Construct(self)
  self.Item_Left.Panel_Main:SetRenderOpacity(0)
  self.Item_Right.Panel_Main:SetRenderOpacity(0)
  local PanelMainSizeX, SizeXTextPlayDesc, WrapAtTextPlayDesc
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    PanelMainSizeX = self.Item_Left.SizeX_PanelMain_M
    SizeXTextPlayDesc = self.Item_Left.SizeX_TextPlayDesc_M
    WrapAtTextPlayDesc = self.Item_Right.WrapAt_TextPlayDesc_M
  else
    PanelMainSizeX = self.Item_Left.SizeX_PanelMain_P
    SizeXTextPlayDesc = self.Item_Left.SizeX_TextPlayDesc_P
    WrapAtTextPlayDesc = self.Item_Right.WrapAt_TextPlayDesc_P
  end
  if PanelMainSizeX then
    self.Item_Left.Panel_Main.Slot:SetSize(FVector2D(PanelMainSizeX, self.Item_Left.Panel_Main.Slot:GetSize().Y))
    self.Item_Right.Panel_Main.Slot:SetSize(FVector2D(PanelMainSizeX, self.Item_Right.Panel_Main.Slot:GetSize().Y))
  end
  if SizeXTextPlayDesc then
    self.Item_Left.Text_PlayDesc.Slot:SetSize(FVector2D(SizeXTextPlayDesc, self.Item_Left.Text_PlayDesc.Slot:GetSize().Y))
  end
  if WrapAtTextPlayDesc then
    self.Item_Right.Text_PlayDesc:SetWrapTextAt(WrapAtTextPlayDesc)
  end
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.ChapterId_L = Content.ChapterId_L
  self.ChapterId_R = Content.ChapterId_R
  self.Parent = Content.Parent
  self.Item_Left:InitItemContent(self.ChapterId_L, self.Parent)
  self.Item_Left.ChapterId = self.ChapterId_L
  if self.ChapterId_R then
    self.Item_Right:SetVisibility(ESlateVisibility.Visible)
    self:AddTimer(self.IntervalTime, function()
      self.Item_Right:InitItemContent(self.ChapterId_R, self.Parent)
      self.Item_Right.ChapterId = self.ChapterId_R
    end, false, 0, nil, true)
  else
    self.Item_Right:SetVisibility(ESlateVisibility.Collapsed)
  end
end

return M
