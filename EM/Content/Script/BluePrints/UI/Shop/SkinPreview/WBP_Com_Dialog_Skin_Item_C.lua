require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
end

function M:OnListItemObjectSet(Content)
  self:InitSkinItemInfo(Content)
end

function M:InitSkinItemInfo(Content)
  self.Com_Item_Icon:Init({
    Id = Content.ItemId,
    ItemType = Content.ItemType,
    Rarity = Content.Rarity or 1,
    Icon = Content.Icon,
    IsShowDetails = true,
    IsCantItemSelection = true,
    MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
    HandleMouseDown = true,
    bCustomStype = true,
    bDisableCommonClick = true
  })
  self.Text_Item_Name:SetTexT(GText(Content.Name))
  self.Text_Item_Num:SetText("1")
end

function M:RefreshOpInfoByInputDevice()
  if self:HasAnyUserFocus() then
    self.Com_Item_Icon:SetFocus()
  end
end

function M:OnMouseButtonDown(MyGeometry, InMouseEvent)
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  return UWidgetBlueprintLibrary.Unhandled()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.Com_Item_Icon:SetFocus()
  return UWidgetBlueprintLibrary.Handled()
end

return M
