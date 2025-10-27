local MonthCardModel = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardModel")
local MonthCardCommon = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardCommon")
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")
local RewardBox = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local TimeUtils = require("Utils.TimeUtils")
local M = Class("BluePrints.Common.MVC.Controller")

function M:Init()
  M.Super.Init(self)
  self.RefreshTimer = nil
  self.WaitPayTag = false
  self.PurchaseOrder = 0
  EventManager:AddEvent(EventID.OnDailyRefresh, self, self.OnRefresh)
end

function M:Destory()
  M.Super.Destory(self)
  self.RefreshTimer = nil
  self.WaitPayTag = false
  EventManager:RemoveEvent(EventID.OnDailyRefresh, self)
end

function M:GetModel()
  return MonthCardModel
end

function M:GetEventName()
  return EventID.MonthCardControllerEvent
end

function M:OpenView(WorldContex, Param)
  return M.Super.OpenView(self, WorldContex, MonthCardCommon.UIName, Param)
end

function M:GetView(WorldContex)
  return M.Super.GetView(self, WorldContex, MonthCardCommon.UIName)
end

function M:MakeCacheData()
  local MonthCard = MonthCardModel:GetNowMonthCard()
  self.TimerCacheData = {
    MonthCardId = MonthCard and MonthCard.CardId,
    bIsPurChased = MonthCardModel:IsMonthCardPurchased(),
    bCanPurchase = MonthCardModel:IsMonthCardCanPurchase()
  }
end

function M:OnShopMonthCardOpen()
  if self.RefreshTimer then
    self:StopTimer(self.RefreshTimer)
  end
  self:MakeCacheData()
  self.RefreshTimer = self:AddTimer(1, function()
    self:TryRefreshShopMonthCard()
  end, true, nil, nil, true)
end

function M:OnRefresh()
  self:NotifyEvent(MonthCardCommon.EventId.MonthCardRefresh)
  self:NotifyEvent(MonthCardCommon.EventId.PurchasedRefresh)
  self:NotifyEvent(MonthCardCommon.EventId.PurchaseStateRefresh)
end

function M:TryRefreshShopMonthCard()
  self:NotifyEvent(MonthCardCommon.EventId.TimeTick)
end

function M:OnShopMonthCardClose()
  if self.RefreshTimer then
    self:StopTimer(self.RefreshTimer)
    self.RefreshTimer = nil
  end
end

function M:TryPurchaseMonthCard()
  if self.WaitPayTag then
    return
  end
  local MonthCard = MonthCardModel:GetNowMonthCard()
  local PayGoods = MonthCard and MonthCard.GoodsId
  if not PayGoods then
    return
  end
  local Avatar = MonthCardModel:GetAvatar()
  if not Avatar then
    return
  end
  self.WaitPayTag = true
  self.PurchaseOrder = self.PurchaseOrder + 1
  local PurchaseOrder = self.PurchaseOrder
  self:AddTimer(10, function()
    self:FinishPurchase(PurchaseOrder)
  end)
  DebugPrint("MonthCard TryPurchaseMonthCard", MonthCard.CardID, PayGoods, "PurchaseOrder: ", PurchaseOrder)
  Avatar:MonthlyCardRequestPay(function(ret, OrderId, CallbackUrl, GoodsId)
    DebugPrint("MonthCard RequestPay", MonthCard.CardID, GoodsId, ret, OrderId, "PurchaseOrder: ", PurchaseOrder)
    if not ErrorCode:Check(ret) then
      self:FinishPurchase(PurchaseOrder)
      return
    end
    if PurchaseOrder ~= self.PurchaseOrder then
      return
    end
    local PaymentParameters = FHeroUPaymentParameters()
    PaymentParameters.goodsId = GoodsId
    PaymentParameters.cpOrder = OrderId
    PaymentParameters.callbackUrl = CallbackUrl
    local GameRoleInfo = HeroUSDKUtils.GenHeroHDCGameRoleInfo()
    DebugPrint("MonthCard HeroUSDKSubsystem():HeroSDKPay", MonthCard.CardID, PayGoods, GameRoleInfo, OrderId, "PurchaseOrder: ", PurchaseOrder)
    HeroUSDKSubsystem():HeroSDKPay(PaymentParameters, GameRoleInfo)
    local TrackInfo = {}
    TrackInfo.product_id = GoodsId
    TrackInfo.product_type = "MonthlyCard"
    TrackInfo.game_order_id = OrderId
    TrackInfo.order_create_time = TimeUtils.NowTime()
    HeroUSDKSubsystem():UploadTrackLog_Lua("charge_client", TrackInfo)
    DebugPrint("MonthCard Avatar:ListenPayFinish", MonthCard.CardID, PayGoods, GameRoleInfo, OrderId)
    Avatar:ListenPayFinish(OrderId, function(Result, OrderId, GoodsId, ShopItems)
      self:FinishPurchase(PurchaseOrder)
      DebugPrint("MonthCard OnPayFinish", MonthCard.CardID, PayGoods, GameRoleInfo, OrderId, GoodsId, Result, "PurchaseOrder: ", PurchaseOrder)
      if Result ~= ErrorCode.RET_SUCCESS then
        return
      end
      self:OnRefresh()
    end)
  end)
end

function M:FinishPurchase(PurchaseOrder)
  if PurchaseOrder ~= self.PurchaseOrder then
    return
  end
  self.WaitPayTag = false
end

function M:DisplayForbiddenTip()
  self:ShowToast(MonthCardCommon.TextToastCannotPurchase)
end

local function MergeReward(MergeReward, TotalReward)
  local RewardCount = 0
  if not MergeReward then
    return RewardCount
  end
  local RewardType = DataMgr.RewardType
  for ItemType, _ in pairs(RewardType) do
    local ItemKey = ItemType .. "s"
    local Rewards = MergeReward[ItemKey]
    if Rewards then
      local ItemList = TotalReward[ItemKey] or {}
      TotalReward[ItemKey] = ItemList
      for ItemId, ItemCount in pairs(Rewards) do
        local count = 0
        if type(ItemCount) == "table" then
          count = RewardBox:GetCount(ItemCount)
        end
        if type(ItemCount) == "number" then
          count = ItemCount
        end
        if not ItemList[ItemId] then
          ItemList[ItemId] = count
        else
          ItemList[ItemId] = ItemList[ItemId] + count
        end
        RewardCount = RewardCount + count
      end
    end
  end
  return RewardCount
end

function M:DisplayPurchaseRewards(MonthlyCardId, TotalReward)
  if not TotalReward then
    return
  end
  local BuyReward = TotalReward.BuyReward
  local DailyReward = TotalReward.DailyReward
  local UniqueReward = TotalReward.UniqueReward
  local Rewards = {}
  local Count = 0
  DebugPrint(BuyReward)
  if BuyReward then
    Count = Count + MergeReward(BuyReward, Rewards)
  end
  if DailyReward then
    Count = Count + MergeReward(DailyReward, Rewards)
  end
  if UniqueReward then
    Count = Count + MergeReward(UniqueReward, Rewards)
  end
  if Count <= 0 then
    return
  end
  UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, nil, self)
end

function M:DisplayMonthCardPop(DailyReward, ...)
  if not DailyReward then
    return
  end
  local GameInstance = GWorld.GameInstance
  if GameInstance then
    local LoadingUI = GameInstance:GetLoadingUI()
    local LoginMainPage = UIManager(GameInstance):GetUIObj("LoginMainPage")
    DebugPrint("DisplayMonthCardPop", LoadingUI)
    if LoadingUI or LoginMainPage then
      MonthCardModel:SetDailyRewardCache(DailyReward)
      return
    end
  end
  self:TryDisplayMonthCardPop(DailyReward)
end

function M:TryDisplayMonthCardPop(DailyReward)
  DailyReward = DailyReward or MonthCardModel.DailyRewardCache
  if not DailyReward then
    return
  end
  local Reward
  local RewardType = DataMgr.RewardType
  for ItemType, _ in pairs(RewardType) do
    local ItemKey = ItemType .. "s"
    local RewardInfo = DailyReward[ItemKey]
    if RewardInfo then
      for ItemId, ItemCount in pairs(RewardInfo) do
        local count = 0
        if type(ItemCount) == "table" then
          count = RewardBox:GetCount(ItemCount)
        end
        if type(ItemCount) == "number" then
          count = ItemCount
        end
        if count > 0 then
          Reward = {
            ItemType = ItemType,
            ItemId = ItemId,
            Count = count
          }
          break
        end
      end
      if Reward then
        break
      end
    end
  end
  self:GetUIMgr():LoadUINew("MonthCardPop", Reward)
  MonthCardModel:ClearDailyRewardCache()
end

_G.MonthCardController = M
return M
