require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OpenDetailWidget(ItemType, ItemId, Placement)
  self.Content = {
    ItemType = ItemType,
    ItemId = ItemId,
    MenuPlacement = Placement or EMenuPlacement.MenuPlacement_MenuRight,
    UIName = "WalnutChoice"
  }
  self.UIName = "WalnutChoice"
  self.ItemDetail_MenuAnchor.ParentWidget = self
  self.ItemDetail_MenuAnchor:OpenItemDetailsWidget(false, self.Content)
  self.ItemDetail_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
end

function M:IsMenuOpen()
  return self.ItemDetail_MenuAnchor.ItemDetailsMenuAnchor:IsOpen()
end

function M:OnMenuOpenChanged()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self.MainUI.State = 2
    self.MainUI:UpdateCommonKeys("A", GText("UI_Controller_CheckDetails"), "B", GText("UI_Tips_Close"))
    if self.MainUI.Btn_No and self.MainUI.Btn_Yes then
      self.MainUI.Btn_No:SetGamePadVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.MainUI.Btn_Yes:SetGamePadVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

return M
