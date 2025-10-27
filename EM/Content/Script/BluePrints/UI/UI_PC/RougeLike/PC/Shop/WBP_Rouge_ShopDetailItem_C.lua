require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  local Avatar = GWorld:GetAvatar()
  local TokenId = Avatar and Avatar:GetCurrentRougeLikeTokenId() or 0
  local TokenData = DataMgr.Resource[TokenId]
  self.Btn_Buy.Common_Item_Icon:Init({
    Id = TokenId,
    Icon = TokenData and LoadObject(TokenData.Icon),
    ItemType = "Resource",
    UIName = "RougeShop",
    IsShowDetails = true,
    MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight
  })
  self.Btn_Buy.Btn_Click.OnClicked:Add(self, self.RougePurchase)
  self.Btn_Buy.Btn_Click.OnHovered:Add(self, self.OnPurchaseHovered)
  self.Btn_DetailDesc.OnClicked:Add(self, self.OnCheckDetails)
  self.Key_SuitSign:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = DataMgr.KeyboardText[UIConst.GamePadKey.LeftThumb].KeyText
      }
    }
  })
  self.Text_SuitUnlockTitle:SetText(GText("RLBlessingGroup_Active"))
  self:InitListenEvent()
  self:AddInputMethodChangedListen()
  local CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  local CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  self:OnUpdateUIStyleByInputTypeChange(CurInputDeviceType, CurGamepadName)
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnRougeInfoUpdate, self, self.OnRougeInfoUpdate)
end

function M:UpdateDetails(Type, ItemId, ShopId, Price, IsSoldOut, IsCanLevelUp)
  self.RougeLikeManager = GWorld.RougeLikeManager
  assert(self.RougeLikeManager, "RougeLikeManager\230\156\170\230\137\190\229\136\176")
  local ItemData = DataMgr["RougeLike" .. Type][ItemId]
  assert(ItemData, "\232\130\137\233\184\189\229\149\134\229\159\142\230\156\170\230\137\190\229\136\176\232\175\165\229\149\134\229\147\129\228\191\161\230\129\175: Type:" .. Type .. " Id:" .. ItemId)
  self.Type = Type
  self.ItemId = ItemId
  self.ShopId = ShopId
  self.Price = Price
  self.IsSoldOut = IsSoldOut
  self.Btn_Buy.Parent = self
  self.IsCanLevelUp = IsCanLevelUp
  self.PurchaseFailRes = 0
  self.Text_Title:SetText(GText(ItemData.Name))
  self.Rarity = ItemData[Type .. "Rarity"]
  self:SetIcon(ItemData.Icon)
  self:SetRarity(self.Rarity)
  local BuffIconPath = ItemData.TypeIcon
  self.ExplanationId = ItemData.ExplanationId
  if self.Type == "Blessing" then
    self.Group_Buff:SetVisibility(ESlateVisibility.Visible)
    self:SetBuffType(BuffIconPath)
  else
    self.Group_Buff:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.ExplanationId then
    self.CanShowExplanation = true
  else
    self.CanShowExplanation = false
  end
  self:CanPurchase(self.Price)
  self:SetDesc()
  self:SetSuit()
  local RougeLikeShop = UIManager(self):GetUIObj("RougeShop")
  assert(RougeLikeShop, "\232\130\137\233\184\189\229\149\134\229\159\142\228\184\141\229\173\152\229\156\168")
  EMUIAnimationSubsystem:EMPlayAnimation(RougeLikeShop, RougeLikeShop.Switch)
end

function M:SetRarity(Rarity)
  local BgRarityTexture, TitleRarityTexture
  if 1 == Rarity then
    BgRarityTexture = self.DetailBG_Blue
    TitleRarityTexture = self.TitleQuality_Blue
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Blue)
  elseif 2 == Rarity then
    BgRarityTexture = self.DetailBG_Purple
    TitleRarityTexture = self.TitleQuality_Purple
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Purple)
  elseif 3 == Rarity then
    BgRarityTexture = self.DetailBG_Yellow
    TitleRarityTexture = self.TitleQuality_Yellow
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Yellow)
  else
    DebugPrint("ZDX_\232\130\137\233\184\189\229\149\134\229\159\142\229\149\134\229\147\129\231\168\128\230\156\137\229\186\166\233\148\153\232\175\175")
    return
  end
  self.Image_ShopItemType:SetBrushFromTexture(BgRarityTexture)
  self.Image_TitleQuality:SetBrushFromTexture(TitleRarityTexture)
end

function M:SetIcon(IconPath)
  if not IconPath then
    return
  end
  if self.Type == "Blessing" then
    self.WS_Item:SetActiveWidgetIndex(0)
    if 1 == self.Rarity then
      self.WBP_Rouge_BlessIcon:PlayAnimation(self.WBP_Rouge_BlessIcon.Blue)
    elseif 2 == self.Rarity then
      self.WBP_Rouge_BlessIcon:PlayAnimation(self.WBP_Rouge_BlessIcon.Purple)
    elseif 3 == self.Rarity then
      self.WBP_Rouge_BlessIcon:PlayAnimation(self.WBP_Rouge_BlessIcon.Yellow)
    end
    local IconDynaMaterial = self.WBP_Rouge_BlessIcon.Image_Icon:GetDynamicMaterial()
    if IsValid(IconDynaMaterial) then
      IconDynaMaterial:SetTextureParameterValue("MainTex", LoadObject(IconPath))
    end
  elseif self.Type == "Treasure" then
    self.WS_Item:SetActiveWidgetIndex(1)
    self.Image_TreasureIcon:SetBrushResourceObject(LoadObject(IconPath))
  end
end

function M:SetBuffType(IconPath)
  if not IconPath then
    return
  end
  self.Image_BuffType:SetVisibility(ESlateVisibility.Visible)
  self.Image_BuffType:SetBrushResourceObject(LoadObject(IconPath))
end

function M:SetDesc()
  local ItemDesc
  if self.Type == "Blessing" then
    local Level = self.RougeLikeManager:GetBlessingLevel(self.ItemId)
    if self.IsSoldOut and Level > 0 then
      Level = Level - 1
    end
    if self.IsCanLevelUp and not self.IsSoldOut then
      if 0 == Level and not self.IsSoldOut then
        DebugPrint("ZDX_\232\130\137\233\184\189\229\149\134\229\159\142\231\165\157\231\166\143\231\173\137\231\186\167\233\148\153\232\175\175:" .. self.ItemId)
      else
        ItemDesc = UIUtils.GenRougeBlessingDesc(self.ItemId, Level - 1, Level)
      end
    else
      ItemDesc = UIUtils.GenRougeBlessingDesc(self.ItemId, Level)
    end
    self.GroupId = DataMgr.RougeLikeBlessing[self.ItemId].BlessingGroup
    assert(self.GroupId, "\230\156\170\230\137\190\229\136\176\231\165\157\231\166\143\229\175\185\229\186\148\229\165\151\232\163\133Id\239\188\154" .. self.GroupId)
    local GroupData = DataMgr.BlessingGroup[self.GroupId]
    assert(GroupData, "\230\156\170\230\137\190\229\136\176\229\165\151\232\163\133\230\149\176\230\141\174\239\188\154" .. self.GroupId)
  elseif self.Type == "Treasure" then
    ItemDesc = UIUtils.GenRougeTreasureDesc(self.ItemId)
    self.GroupId = DataMgr.RougeLikeTreasure[self.ItemId].TreasureGroup
  end
  if self.ExplanationId ~= nil and #self.ExplanationId > 0 then
    ItemDesc = UIUtils.GenRougeCombatTermDesc(ItemDesc, self.ExplanationId)
  end
  self.Text_DetailDesc:SetText(GText(ItemDesc))
  self:SetBtnInfo(self.IsCanLevelUp)
end

function M:SetBtnInfo(bUpgrade)
  self.Btn_Buy.Text_BtnTitle:SetText(bUpgrade and GText("UI_RougeLike_Blessing_CanUpgrade") or GText("UI_SHOP_PURCHASE"))
  if 0 ~= self.PurchaseFailRes then
    self.Btn_Buy:PlayAnimation(self.Btn_Buy.Forbidden)
    self.Btn_Buy.Btn_Click:SetIsEnabled(false)
  else
    self.Btn_Buy.Btn_Click:SetIsEnabled(true)
    self.Btn_Buy:PlayAnimation(self.Btn_Buy.Normal)
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CurrentCount = Avatar:GetCurrentRougeLikeToken()
  if CurrentCount < self.Price then
    self.Btn_Buy.Text_Reset:SetText("<Warning>" .. self.Price .. "</>")
  else
    self.Btn_Buy.Text_Reset:SetText(self.Price)
  end
end

function M:SetSuit()
  self.bShowTreasureSuit = false
  self.ShowSuitActive = false
  self.Rouge_SuitSign:SetVisibility(ESlateVisibility.Collapsed)
  self.VB_Suite:SetVisibility(ESlateVisibility.Collapsed)
  if self.IsSoldOut then
    self.Group_Buy:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Group_Buy:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if self.IsCanLevelUp then
    return
  end
  if self.Type == "Blessing" and not self.IsSoldOut then
    local BlessingGroup = self.RougeLikeManager.BlessingGroup
    local Count = BlessingGroup:FindRef(self.GroupId) or 0
    local Level = RougeUtils:GetGroupLevel(self.GroupId, Count)
    local IsActive = RougeUtils:GetGroupIsActive(self.GroupId, Count + 1)
    self.Btn_DetailDesc:SetNavigationRuleExplicit(EUINavigation.Down, self.SuitDetail_SubItem)
    if IsActive then
      self.VB_Suite:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.WS_SubItem:SetActiveWidgetIndex(0)
      self.ShowSuitActive = true
      local SuitData = RougeUtils:GenSuitDetail(self.GroupId, Level, true)
      self.SuitDetail_SubItem:InitUIInfo(SuitData)
    end
  elseif self.Type == "Treasure" and DataMgr.TreasureGroup[self.GroupId] then
    self.bShowTreasureSuit = true
    self.Rouge_SuitSign:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local TreasureCount = UIUtils.GetRealCurrentTreasureGroupNum(self.ItemId)
    local TotalTreasureCount = UIUtils.GetTreasureGroupNum(self.ItemId)
    if not self.IsSoldOut then
      TreasureCount = TreasureCount + 1
    end
    if TreasureCount == TotalTreasureCount then
      self.ShowSuitActive = true
      self.Btn_DetailDesc:SetNavigationRuleExplicit(EUINavigation.Down, self.SuitDetail_TreasureSubItem)
      self.WS_SubItem:SetActiveWidgetIndex(1)
      self.VB_Suite:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.SuitDetail_TreasureSubItem.Text_SuitDesc:SetText(GText(DataMgr.TreasureGroup[self.GroupId].GroupEffectDesc))
      self.SuitDetail_TreasureSubItem:PlayAnimation(self.SuitDetail_TreasureSubItem.In)
    end
    self.Rouge_SuitSign:InitSuitSign(self.ItemId, self.GroupId, TreasureCount, not self.IsSoldOut)
  end
  self:ShowGamePadBtn()
end

function M:ShowGamePadBtn()
  if self.bShowTreasureSuit and UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Key_SuitSign:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Key_SuitSign:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:CanPurchase(Price)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local RougeLikeManager = GWorld.RougeLikeManager
  self.ShopItemList = RougeLikeManager.Shop:FindRef(self.ShopId)["Shop" .. self.Type]
  if not self.ShopItemList then
    DebugPrint("ZDX: RougeShopItemList is nil")
  end
  if 0 == self.ShopItemList:FindRef(self.ItemId) then
    self.PurchaseFailRes = 1
  end
  local PriceCount = Avatar:GetCurrentRougeLikeToken()
  if Price > PriceCount then
    self.PurchaseFailRes = 2
  end
end

function M:OnRougeInfoUpdate()
  local RougeLikeShop = UIManager(self):GetUIObj("RougeShop")
  if RougeLikeShop then
    RougeLikeShop:BlockAllUIInput(false)
    RougeLikeShop:UpdateShopDetail()
  end
end

function M:RougePurchase()
  if not self.Btn_buy.Btn_Click:GetIsEnabled() then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  
  local function PurchaseCallback(Ret, NewAwardInfo)
    local NewLevel = NewAwardInfo and NewAwardInfo.Level or 0
    local RougeLikeShop = UIManager(self):GetUIObj("RougeShop")
    if RougeLikeShop then
      RougeLikeShop:BlockAllUIInput(false)
      RougeLikeShop:UpdateShopDetail()
    end
  end
  
  local RougeShop = UIManager(self):GetUIObj("RougeShop")
  RougeShop:BlockAllUIInput(true)
  local EventSoundPath = "event:/ui/roguelike/btn_black_mid_click"
  AudioManager(self):PlayUISound(self, EventSoundPath, nil, nil)
  if self.IsCanLevelUp then
    Avatar:UpgradeAward(self.Type, self.ItemId, self.ShopId, PurchaseCallback)
  else
    Avatar:RougeShopPurchase(self.ShopId, self.Type, self.ItemId, PurchaseCallback)
  end
end

function M:OnPurchaseHovered()
  self.Btn_Buy:PlayAnimation(self.Btn_Buy.Hover)
  local EventSoundPath = "event:/ui/roguelike/btn_black_hover"
  AudioManager(self):PlayUISound(self, EventSoundPath, nil, nil)
end

function M:OnCheckDetails()
  local RougeShopItemData = DataMgr["RougeLike" .. self.Type][self.ItemId]
  if RougeShopItemData.ExplanationId then
    UIManager(self):LoadUINew("Rouge_Definition", RougeShopItemData.ExplanationId)
    self.Parent:ChangeBottomGamePadInfo(false)
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    self:ShowGamePadBtn()
  else
    self.Key_SuitSign:SetVisibility(ESlateVisibility.Collapsed)
  end
end

return M
