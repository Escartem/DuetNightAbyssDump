require("UnLua")
local RougeConst = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.RougeConst")
local M = Class("BluePrints.UI.Shop.WBP_Shop_Item_Base_C")

function M:Construct()
  self.bHover = false
  self.Text_SoldOut:SetText(GText("UI_SHOP_SOLDOUT"))
  self.Button_Item.OnHovered:Add(self, self.OnBtnHovered)
  self.Button_Item.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Button_Item.OnPressed:Add(self, self.OnBtnPressed)
  self.Button_Item.OnClicked:Add(self, self.OnBtnClicked)
end

function M:Destruct()
  self:ClearListenEvent()
end

function M:OnListItemObjectSet(Content)
  self:StopAllAnimations()
  self:ResetItem()
  self.Content = Content
  self.Content.SelfWidget = self
  self.ItemId = Content.ItemId
  if not self.ItemId or 0 == not self.ItemId then
    self.Com_Item_Shop:Init(self.Content)
    self:InitEmptyItem()
    return
  end
  self.ShopId = Content.ShopId
  self.ItemType = Content.ShopItemType
  local ItemData = DataMgr["RougeLike" .. self.ItemType][self.ItemId]
  local Name = ItemData.Name
  self.Text_Name:SetText(GText(Name))
  local BuffIconPath = ItemData.TypeIcon
  if self.ItemType == "Blessing" then
    self.Group_Buff:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:SetBuffType(BuffIconPath)
  else
    self.Group_Buff:SetVisibility(ESlateVisibility.Collapsed)
  end
  local ItemContent = {}
  ItemContent.ShopItemId = self.Content.ItemId
  ItemContent.Icon = ItemData.Icon
  ItemContent.Rarity = ItemData[self.ItemType .. "Rarity"] + 2
  self.Com_Item_Shop:Init(ItemContent)
  self.IsSoldOut = Content.IsSoldOut
  if self.IsSoldOut then
    self.Panel_SoldOut:SetVisibility(ESlateVisibility.Visible)
  else
    self.Panel_SoldOut:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.IsCanLevelUp = false
  self:SetIsCanLevelUp()
  self.Discount = Content.Discount
  local Prices = ItemData.ShopPrices
  self:SetPrice(math.floor(Prices * self.Discount))
  self.RealPrices = math.floor(Prices * self.Discount)
  if Content.IsSelect then
    self:SetSelect()
  else
    self:SetUnSelect()
  end
  self:InitListenEvent()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if Avatar.RougeLike:IsManualUnlocked(CommonConst.RougeLikeManualType[self.ItemType], self.ItemId) then
    self.Group_ArchiveSign:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Group_ArchiveSign:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:InitListenEvent()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  local IsGamePad = CurInputDevice == ECommonInputType.Gamepad
  if IsGamePad then
  end
  self.CurInputDeviceType = CurInputDevice
end

function M:SetIsCanLevelUp()
  self.Group_CanUpgrade:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if self.ItemType == "Blessing" then
    local RougeLikeManager = GWorld.RougeLikeManager
    if not self.IsSoldOut then
      for Id, Count in pairs(RougeLikeManager.Blessings) do
        if Id == self.ItemId then
          self.IsCanLevelUp = true
          self.Group_CanUpgrade:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        end
      end
    end
  end
end

function M:SetBuffType(IconPath)
  if not IconPath then
    return
  end
  self.Image_BuffType:SetVisibility(ESlateVisibility.Visible)
  self.Image_BuffType:SetBrushResourceObject(LoadObject(IconPath))
end

function M:SetPrice(Prices)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.Img_Currency:SetBrushResourceObject(ItemUtils.GetItemIcon(Avatar:GetCurrentRougeLikeTokenId(), "Resource"))
  self.Text_Price:SetText(Prices)
  local CurrentCount = Avatar:GetCurrentRougeLikeToken()
  if Prices > CurrentCount then
    self.Text_Price:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DA2A4A"))
  else
    self.Text_Price:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFF"))
  end
  self.Text_Undiscounted_Price:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:ResetItem()
  self.Com_Item_Shop:PlayAnimation(self.Com_Item_Shop.Normal)
  self.Group_Item:SetVisibility(ESlateVisibility.Visible)
  self.Panel_SoldOut:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:SetSelect()
  self.Com_Item_Shop:PlayAnimation(self.Com_Item_Shop.Click)
  EventManager:FireEvent(EventID.OnRougeShopItemSelect, self.Content, self.ItemType, self.ItemId, self.ShopId, self.RealPrices, self.IsSoldOut, self.IsCanLevelUp)
  self.Content.IsSelect = true
end

function M:SetUnSelect()
  self.Com_Item_Shop:StopAllAnimations()
  self.Com_Item_Shop:PlayAnimation(self.Com_Item_Shop.Normal)
  self.Content.IsSelect = false
end

function M:OnBtnHovered()
  if self.Content.IsSelect then
    return
  end
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:SetSelect()
  else
    self.Com_Item_Shop:StopAllAnimations()
    self.Com_Item_Shop:PlayAnimation(self.Com_Item_Shop.Hover)
  end
end

function M:OnBtnUnhovered()
  if self.Content.IsSelect then
    return
  end
  self.Com_Item_Shop:StopAllAnimations()
  self.Com_Item_Shop:PlayAnimation(self.Com_Item_Shop.UnHover)
end

function M:OnBtnPressed()
  if self.Content.IsSelect then
    return
  end
  self.Com_Item_Shop:PlayAnimation(self.Com_Item_Shop.Press)
end

function M:OnBtnClicked()
  if self.Content.IsSelect then
    return
  end
  self.Content.IsSelect = true
  EventManager:FireEvent(EventID.OnRougeShopItemSelect, self.Content, self.ItemType, self.ItemId, self.ShopId, self.RealPrices, self.IsSoldOut, self.IsCanLevelUp)
  self.Com_Item_Shop:PlayAnimation(self.Com_Item_Shop.Click)
end

function M:OnAnimationFinished(Anim)
  if Anim == self.UnHover then
  end
end

return M
