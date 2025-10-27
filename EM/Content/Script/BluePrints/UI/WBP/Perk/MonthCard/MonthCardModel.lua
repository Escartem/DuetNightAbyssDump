local TimeUtils = require("Utils.TimeUtils")
local MonthCardCommon = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardCommon")
local M = Class("BluePrints.Common.MVC.Model")

function M:Init()
  M.Super.Init(self)
  self._Avatar = nil
  self:GetAvatar()
  self.NowMonthCardId = nil
end

function M:IsMonthCardPurchased()
  local Avatar = self:GetAvatar()
  if Avatar then
    return Avatar.MonthlyCardExpireTime > TimeUtils.NowTime()
  else
    return false
  end
end

function M:IsMonthCardCanPurchase()
  local Avatar = self:GetAvatar()
  local MonthCardHoldMax = DataMgr.GlobalConstant.MonthlyCardHoldMax
  MonthCardHoldMax = MonthCardHoldMax and MonthCardHoldMax.ConstantValue or 0
  if Avatar then
    local NowTime = TimeUtils.NowTime()
    local LastTime = Avatar.MonthlyCardExpireTime - NowTime
    return MonthCardHoldMax >= math.ceil(LastTime / CommonConst.DayTime) + CommonConst.MonthlyCardValidDay
  else
    return false
  end
end

function M:GetMonthCardLeftDays()
  local Avatar = self:GetAvatar()
  if Avatar then
    return Avatar.MonthlyCardExpireTime
  else
    return false
  end
end

function M:GetMonthCardLeftTimes()
  local Avatar = self:GetAvatar()
  if Avatar then
    local NowTime = TimeUtils.NowTime()
    local LastTime = Avatar.MonthlyCardExpireTime - NowTime
    return math.floor(LastTime / CommonConst.DayTime)
  else
    return 0
  end
end

function M:GetMonthCardCanPurchaseTime()
  local MonthCard = self:GetNowMonthCard()
  if MonthCard then
    return MonthCard.EndTime
  else
    return 0
  end
end

function M:GetRewardHeadIconInfo()
  local MonthCard = self:GetNowMonthCard()
  if MonthCard then
    return self:GetRewardInfo(MonthCard.UniqueReward)
  else
    return nil
  end
end

function M:GetRewardItem()
  local MonthCard = self:GetNowMonthCard()
  if MonthCard then
    return self:GetRewardInfo(MonthCard.BuyReward)
  else
    return nil
  end
end

function M:GetRewardEveryDayItem()
  local MonthCard = self:GetNowMonthCard()
  if MonthCard then
    return self:GetRewardInfo(MonthCard.DailyReward)
  else
    return nil
  end
end

function M:GetMonthCardPrice()
  local MonthCard = self:GetNowMonthCard()
  if MonthCard then
    local Goods = DataMgr.PayGoods[MonthCard.GoodsId]
    local PriceType = ShopUtils:GetCurrencyPrice()
    local Price = Goods[PriceType]
    return Price or 0
  else
    return 30
  end
end

function M:GetPriceSymbol()
  local CurrencySymbol = ShopUtils:GetCurrencyType()
  return CurrencySymbol
end

function M:GetNowMonthCard()
  local Avatar = self:GetAvatar()
  if not Avatar then
    return nil
  end
  local MonthlyCards = DataMgr.MonthlyCard
  local NowMonthCard = MonthlyCards[Avatar.NowMonthCardId]
  local Time = TimeUtils.NowTime()
  if NowMonthCard and Time >= NowMonthCard.BeginTime and Time < NowMonthCard.EndTime then
    return NowMonthCard
  else
    local CurrentCard
    for k, v in pairs(MonthlyCards) do
      if Time >= v.BeginTime and Time < v.EndTime then
        CurrentCard = v
        self.NowMonthCardId = CurrentCard.CardId
        break
      end
    end
    return CurrentCard
  end
  return nil
end

function M:GetRewardInfo(RewardId)
  local Reward = DataMgr.Reward[RewardId]
  if not Reward then
    return
  end
  local RewardTypes = Reward.Type
  local RewardType = RewardTypes and RewardTypes[1]
  if not RewardType then
    return
  end
  local RewardItemIds = Reward.Id
  local RewardItemIdId = RewardItemIds and RewardItemIds[1]
  if not RewardId then
    return
  end
  local RewardCounts = Reward.Count
  local RewardCount = RewardCounts and RewardCounts[1]
  if not RewardCount then
    return
  end
  return {
    ItemType = RewardType,
    ItemId = RewardItemIdId,
    Count = RewardCount[1]
  }
end

function M:Destory()
  M.Super.Destory(self)
end

function M:SetDailyRewardCache(DailyReward)
  self.DailyRewardCache = DailyReward
end

function M:ClearDailyRewardCache()
  self.DailyRewardCache = nil
end

return M
