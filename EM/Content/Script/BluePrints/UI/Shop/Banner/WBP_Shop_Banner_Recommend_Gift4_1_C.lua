require("UnLua")
local M = Class({
  "BluePrints.UI.Shop.Banner.WBP_Shop_Banner_Base_C"
})

function M:Construct()
  M.Super.Construct(self)
  local BannerTab = self:GetBannerTabData("WBP_Shop_Recommend_Gift4_1")
  if not BannerTab then
    return
  end
  self.BannerTab = BannerTab
  local SkinRarity
  if self.BannerTab.PreviewId[1] then
    local SkinInfo = DataMgr.Skin[self.BannerTab.PreviewId[1]]
    if SkinInfo then
      SkinRarity = SkinInfo.Rarity
    end
  end
  if self.WBP_Shop_Recommend_Common_TItle_C_0 and self.WBP_Shop_Recommend_Common_TItle_C_0.Text_MainTitle and SkinRarity then
    local SkinNameFonts = {
      nil,
      nil,
      "Font_Blue",
      "Font_Purple",
      "Font_Gold",
      "Font_Red"
    }
    if SkinNameFonts[SkinRarity] and self.WBP_Shop_Recommend_Common_TItle_C_0[SkinNameFonts[SkinRarity]] then
      self.WBP_Shop_Recommend_Common_TItle_C_0.Text_MainTitle:SetFont(self.WBP_Shop_Recommend_Common_TItle_C_0[SkinNameFonts[SkinRarity]])
    end
  end
  if self.WBP_Shop_Recommend_Common_TItle_C_0 and self.WBP_Shop_Recommend_Common_TItle_C_0.Text_MainTitle then
    self.WBP_Shop_Recommend_Common_TItle_C_0.Text_MainTitle:SetText(GText(BannerTab.Text1))
  end
  if self.Text_ActivityDesc_White then
    self.Text_ActivityDesc_White:SetText(GText("UI_Weapon_Preview"))
  end
  self.ItemId = BannerTab.ItemId
  if self.ItemId and DataMgr.ShopItem[self.ItemId] then
    self.ShopItemData = setmetatable({}, {
      __index = DataMgr.ShopItem[self.ItemId]
    })
  end
  self.PreviewId = BannerTab.PreviewId
  self.Btn_Pay.Btn_Buy.OnClicked:Add(self, self.OnGoToInterface)
  self.Btn_Pay.Btn_Buy.OnHovered:Add(self, self.OnGoToHovered)
  if self.Btn_Qa then
    self.Btn_Qa.Button_Area.OnClicked:Add(self, self.GoToPreview)
  end
  self.Text_RewardTitle:SetText(GText("UI_Banner_Pack_All"))
  self:InitTime()
  self:InitReward()
  self:UpdateBuyBtn()
  self.Key_RewardTitle:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
  self.Btn_Pay.Key_ControllerBuy:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
  local bIsGamepad = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
  self:UpdateGamePadKeyInfo(bIsGamepad)
end

function M:OnGoToInterface()
  AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_btn_click_normal", nil, nil)
  if self.bForbidden then
    UIManager(self):ShowError(ErrorCode.RET_SHOPITEM_REMAIN_PURCHASE_TIMES_EQUAL_ZERO, 1.0, "CommonToastMain")
    return
  end
  if 1 == self.ShopItemData.Bg then
    UIManager(self):LoadUINew("PayGiftPopup_Yellow", self.ShopItemData, self)
  elseif 2 == self.ShopItemData.Bg then
    UIManager(self):LoadUINew("PayGiftPopup_Purple", self.ShopItemData, self)
  else
    UIManager(self):LoadUINew("PayGiftPopup_Purple", self.ShopItemData, self)
  end
end

function M:UpdateBuyBtn()
  local Count = ShopUtils:GetShopItemPurchaseLimit(self.ItemId)
  local ShowBonus = DataMgr.ShopItem[self.ItemId].ShowBonus
  local NowTime = TimeUtils.NowTime()
  if self.Btn_Pay and self.Btn_Pay.Btn_Buy then
    self.Btn_Pay.Group_BuyNum:SetVisibility(ESlateVisibility.Collapsed)
    self.Btn_Pay.WS_Detail:SetActiveWidgetIndex(0)
    self.Btn_Pay.Text_PriceMoneySymbol:SetText(GText(ShopUtils:GetCurrencyType()))
    local PriceType = DataMgr.PayGoods[self.BannerTab.GoodsId]
    local Price = PriceType[ShopUtils:GetCurrencyPrice()]
    self.Btn_Pay.Text_PriceMoneyNum:SetText(Price)
  end
  if ShowBonus and Count > 0 then
    self.Btn_Pay.Group_More:SetVisibility(ESlateVisibility.Visibie)
    self.Btn_Pay.Text_MoreNum:SetText("+" .. ShowBonus)
  else
    self.Btn_Pay.Group_More:SetVisibility(ESlateVisibility.Collapsed)
  end
  if Count > 0 then
    self.Btn_Pay.Group_BuyNum:SetVisibility(ESlateVisibility.Visibie)
    self.Btn_Pay.WS_Detail:SetVisibility(ESlateVisibility.Visibie)
    self.Btn_Pay.Text_BuyNum:SetText(GText("UI_Banner_Remain_Buy") .. Count)
    self.Btn_Pay.Text_BtnBuy:SetText(GText("UI_SHOP_PURCHASE"))
    self.Btn_Pay.Btn_Buy:SetForbidden(false)
    self.Btn_Pay:PlayAnimation(self.Btn_Pay.Btn_Normal)
    self.bForbidden = false
  else
    self.Btn_Pay.Group_BuyNum:SetVisibility(ESlateVisibility.Collapsed)
    self.Btn_Pay.Text_BtnBuy:SetText(GText("UI_SHOP_SOLDOUT"))
    self.Btn_Pay.Btn_Buy:SetForbidden(true)
    self.Btn_Pay:PlayAnimation(self.Btn_Pay.Btn_Foridden)
    self.Btn_Pay.WS_Detail:SetVisibility(ESlateVisibility.Collapsed)
    self.bForbidden = true
  end
end

function M:Destruct()
end

function M:InitTime()
  self.EndTime = self.BannerTab and self.BannerTab.EndTime
  if self.EndTime then
    self.HB_Time:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.RefreshTimer = self:AddTimer(1, function()
      self:NotifyTimeTick()
    end, true, 0, "Shop_Recommend_Gift4_1", true)
    self:NotifyTimeTick()
  else
    self.HB_Time:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:NotifyTimeTick()
  if not self.EndTime then
    return
  end
  local NowTime = TimeUtils.NowTime()
  if NowTime >= self.EndTime then
    self.Activity_Time:SetForeverTimeText(GText("UI_GameEvent_EventTimeRemain"))
    self:RemoveTimer("Shop_Recommend_Gift4_1")
    return
  end
  local RemainTimeDict, _ = UIUtils.GetLeftTimeStrStyle2(self.EndTime)
  self.Activity_Time:SetTimeText(GText("UI_Mail_Date_Remain"), RemainTimeDict)
end

function M:GoToPreview()
  UIManager(self):LoadUINew("ArmoryDetail", {
    IsPreviewMode = true,
    PreviewWeaponIds = self.PreviewId,
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    bNoEndCamera = true
  })
end

function M:InitBannerPage(BannerId, Owner)
  if BannerId then
    self.BannerId = BannerId
  end
  self.Owner = Owner
  self:PlayInAnimation()
  self:AdjustGroupDetail()
  AudioManager(self):PlayUISound(self, "event:/ui/common/shop_recommend_gift_1", nil, nil)
end

function M:InitReward()
  local TypeId = DataMgr.ShopItem[self.ItemId].TypeId
  local Rewards = DataMgr.Reward[TypeId]
  if Rewards then
    self.RewardList = {}
    local RewardIds = Rewards.Id
    local RewardCounts = Rewards.Count
    local RewardTypes = Rewards.Type
    for i = 1, #RewardIds do
      local ItemId = RewardIds[i]
      local Count = RewardUtils:GetCount(RewardCounts[i])
      local Icon = ItemUtils.GetItemIcon(ItemId, RewardTypes[i])
      local Rarity = ItemUtils.GetItemRarity(ItemId, RewardTypes[i])
      local ItemType = RewardTypes[i]
      local RewardContent = {
        Id = ItemId,
        Type = ItemType,
        ItemCount = Count,
        Icon = Icon,
        Rarity = Rarity
      }
      table.insert(self.RewardList, RewardContent)
    end
    self.List_Reward:ClearListItems()
    for _, ItemInfo in pairs(self.RewardList) do
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.Id = ItemInfo.Id
      Content.Icon = ItemUtils.GetItemIconPath(ItemInfo.Id, ItemInfo.Type)
      Content.ParentWidget = self
      Content.ItemType = ItemInfo.Type
      Content.Count = ItemInfo.ItemCount
      Content.Rarity = ItemInfo.Rarity or 1
      Content.IsShowDetails = true
      
      function Content.AfterInitCallback(Widget)
        Widget:BindEvents(self, {
          OnMenuOpenChanged = self.OnRewardMenuOpenChanged
        })
      end
      
      self.List_Reward:AddItem(Content)
    end
  end
end

function M:OnRewardMenuOpenChanged(bIsOpen)
  local bGamePad = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
  if bIsOpen and bGamePad then
    self.Owner.Common_Tab:UpdateBottomKeyInfo({})
  elseif not bIsOpen and bGamePad then
    self.Owner:UpdateCommonTabInfoByReward()
  end
end

function M:PlayInAnimation()
  if self:IsInAnimationPlaying() then
    return
  end
  if self.In then
    self:PlayAnimation(self.In)
  end
end

function M:IsInAnimationPlaying()
  if self:IsAnimationPlaying(self.In) or self:IsAnimationPlaying(self.Out) then
    return true
  end
  return false
end

function M:PlayOutAnimation()
  if self:IsInAnimationPlaying() then
    return
  end
  if self.Out then
    self:PlayAnimation(self.Out)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  else
    IsEventHandled = self:OnPCKeyDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    self:OnGoToInterface()
    IsEventHandled = true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    self:GoToPreview()
    IsEventHandled = true
  elseif InKeyName == UIConst.GamePadKey.LeftThumb then
    self.List_Reward:SetFocus()
    self.Owner:UpdateCommonTabInfoByReward()
    self:ShowOrHideGamePadKey(ESlateVisibility.Collapsed)
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight and (self.List_Reward:HasFocusedDescendants() or self.List_Reward:HasAnyUserFocus()) then
    self.Owner.List_Recommend:SetFocus()
    self.Owner:UpdateCommonTabInfo()
    self:ShowOrHideGamePadKey(ESlateVisibility.SelfHitTestInvisible)
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:OnPCKeyDown(InKeyName)
  if "SpaceBar" == InKeyName then
    self:OnGoToInterface()
    return true
  end
  return false
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  local bGamePad = CurInputDevice == ECommonInputType.Gamepad
  self:UpdateGamePadKeyInfo(bGamePad)
end

function M:UpdateGamePadKeyInfo(bGamePad)
  if bGamePad then
    if self.Btn_Pay and self.Btn_Pay.Key_ControllerBuy then
      self.Btn_Pay.Key_ControllerBuy:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    if self.Key_RewardTitle then
      self.Key_RewardTitle:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  else
    if self.Btn_Pay and self.Btn_Pay.Key_ControllerBuy then
      self.Btn_Pay.Key_ControllerBuy:SetVisibility(ESlateVisibility.Collapsed)
    end
    if self.Key_RewardTitle then
      self.Key_RewardTitle:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function M:ShowOrHideGamePadKey(ESlateVisibility)
  if self.Btn_Pay and self.Btn_Pay.Key_ControllerBuy then
    self.Btn_Pay.Key_ControllerBuy:SetVisibility(ESlateVisibility)
  end
  if self.Key_RewardTitle then
    self.Key_RewardTitle:SetVisibility(ESlateVisibility)
  end
  if self.Owner and self.Owner.ShopTab.Key_Left then
    self.Owner.ShopTab.Key_Left:SetVisibility(ESlateVisibility)
  end
  if self.Owner and self.Owner.ShopTab.Key_Right then
    self.Owner.ShopTab.Key_Right:SetVisibility(ESlateVisibility)
  end
  if self.Owner and self.Owner.Common_Tab and self.Owner.Common_Tab.WBP_Com_Tab_ResourceBar and self.Owner.Common_Tab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad then
    self.Owner.Common_Tab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(ESlateVisibility)
  end
end

return M
