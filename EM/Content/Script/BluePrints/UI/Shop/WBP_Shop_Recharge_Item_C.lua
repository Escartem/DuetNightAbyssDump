require("UnLua")
local EMCache = require("EMCache.EMCache")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local TimeUtils = require("Utils.TimeUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Text_DoubleTitle:SetText(GText("UI_Shop_Bonus"))
  self.Text_MoreTitle:SetText(GText("UI_Shop_More"))
  self.Text_PriceSign:SetText(GText(ShopUtils:GetCurrencyType()))
  self.Btn_Click.OnClicked:Clear()
  self.Btn_Click.OnClicked:Add(self, self.BtnOnClicked)
end

function M:SetRechargeItemCost(ShopItemData, Cost, Count)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.ShopItemId = ShopItemData.ItemId
  local bFisrtBonus = Avatar:CheckIsFirstBonus(self.ShopItemId)
  self.Text_PriceNum:SetText(Cost)
  self.Text_StoneNum:SetText(Count)
  self.Text_StoneNum_Reflection:SetText(Count)
  self.Group_Double:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_More:SetVisibility(ESlateVisibility.Collapsed)
  if bFisrtBonus then
    local DoubleCount = DataMgr.FirstBonusNum[self.ShopItemId].FirstBonusNum
    self.Group_Double:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_DoubleNum:SetText("+" .. DoubleCount)
  else
    local AdditionalCount = DataMgr.FirstBonusNum[self.ShopItemId].BonusNum
    if AdditionalCount and 0 ~= AdditionalCount then
      self.Group_More:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Text_MoreNum:SetText("+" .. AdditionalCount)
    end
  end
  self.Cost = Cost
  local ItemId = ShopItemData.TypeId
  local ItemType = ShopItemData.ItemType
  assert(DataMgr[ItemType][ItemId], "\230\156\170\230\137\190\229\136\176\229\149\134\229\147\129\228\191\161\230\129\175", ItemType, ItemId)
  self.Text_StoneName:SetText(GText(ItemUtils.GetItemName(ItemId, ItemType)))
end

function M:BtnOnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large_crystal", nil, nil)
  if ShopUtils:GetSDKRegisterRegionCode() == "JP" then
    local CommonDialog = UIManager(self):ShowCommonPopupUI(100233, {
      ShopItemId = self.ShopItemId,
      Tips = {
        [1] = self.Cost .. "\229\134\134"
      },
      RightCallbackObj = self,
      RightCallbackFunction = function(Obj)
        self:Charge()
      end,
      ForbiddenRightCallbackObj = self
    }, self)
  elseif ShopUtils:GetSDKRegisterRegionCode() == "TW" or ShopUtils:GetSDKRegisterRegionCode() == "MO" or ShopUtils:GetSDKRegisterRegionCode() == "HK" then
    local PickUpCache = EMCache:Get("RechargeHint", true) or {}
    if not PickUpCache.TMH then
      local CommonDialog = UIManager(self):ShowCommonPopupUI(100236, {
        ShopItemId = self.ShopItemId,
        RightCallbackObj = self,
        RightCallbackFunction = function(Obj, Data)
          if Data.SelectHint.IsSelected then
            PickUpCache.TMH = Data.SelectHint.IsSelected
            EMCache:Set("RechargeHint", PickUpCache, true)
          end
          self:Charge()
        end,
        ForbiddenRightCallbackObj = self
      }, self)
    else
      self:Charge()
    end
  else
    self:Charge()
  end
end

function M:Charge()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if not HeroUSDKSubsystem():IsHeroSDKEnable() then
    local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
    GMFunctionLibrary.ExecConsoleCommand(self:GetGameInstance(), "sgm pgi " .. DataMgr.ShopItem2PayGoods[self.ShopItemId])
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large_crystal", "RechargeItemClick", nil)
  Avatar:RequestPay(DataMgr.ShopItem2PayGoods[self.ShopItemId], function(ret, OrderId, CallbackUrl)
    if not ErrorCode:Check(ret) then
      return
    end
    local PaymentParameters = FHeroUPaymentParameters()
    PaymentParameters.goodsId = DataMgr.ShopItem2PayGoods[self.ShopItemId]
    PaymentParameters.cpOrder = OrderId
    PaymentParameters.callbackUrl = CallbackUrl
    local GameRoleInfo = HeroUSDKUtils.GenHeroHDCGameRoleInfo()
    HeroUSDKSubsystem():HeroSDKPay(PaymentParameters, GameRoleInfo)
    local TrackInfo = {}
    TrackInfo.product_id = DataMgr.ShopItem2PayGoods[self.ShopItemId]
    if self.ShopItemId then
      TrackInfo.item_id = self.ShopItemId
      TrackInfo.product_type = DataMgr.ShopItem[self.ShopItemId].ItemType
    end
    TrackInfo.game_order_id = OrderId
    TrackInfo.order_create_time = TimeUtils.NowTime()
    HeroUSDKSubsystem(self):UploadTrackLog_Lua("charge_client", TrackInfo)
  end)
end

return M
