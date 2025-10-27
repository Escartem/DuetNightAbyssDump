local MonthCardController = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardController")
local Component = {}

function Component:MonthlyCardRequestPay(RequestCallback)
  local function callback(Ret, OrderId, RedirectCallbackUrl, GoodsId)
    if RequestCallback then
      RequestCallback(Ret, OrderId, RedirectCallbackUrl, GoodsId)
    end
  end
  
  self:CallServer("MonthlyCardRequestPay", callback)
end

function Component:MonthlyCardBuySuccessNotify(TotalReward)
  if not TotalReward then
    return
  end
  MonthCardController:DisplayPurchaseRewards(nil, TotalReward)
end

function Component:BuyMonthlyCard()
  local function callback(ret, TotalReward)
    self.logger.debug("BuyMonthlyCard callback ret = ", ret)
    
    PrintTable(TotalReward, 3)
    MonthCardController:DisplayPurchaseRewards(nil, TotalReward)
    MonthCardController:OnRefresh()
  end
  
  self:CallServer("BuyMonthlyCard", callback)
end

function Component:OnGetMonthlyCardDailyReward(DailyReward)
  PrintTable(DailyReward, 3)
  MonthCardController:DisplayMonthCardPop(DailyReward)
end

function Component:OnGetMonthlyCardUniqueReward(UniqueReward)
  PrintTable(UniqueReward, 3)
  MonthCardController:DisplayPurchaseRewards(nil, {UniqueReward = UniqueReward})
end

function Component:OnGetMonthlyCardByResource(MonthlyCardId, TotalReward)
  self.logger.debug("OnGetMonthlyCardByResource MonthlyCardId = ", MonthlyCardId)
  PrintTable(TotalReward, 3)
  MonthCardController:DisplayPurchaseRewards(MonthlyCardId, TotalReward)
end

function Component:EnterWorld()
  MonthCardController:Init()
end

function Component:LeaveWorld()
  MonthCardController:Destory()
end

function Component:GetMonthlyCardNumForRebate()
  local count = 0
  for k, CardInfo in pairs(self.MonthlyCards) do
    count = count + CardInfo.BuyTime:Length()
  end
  return count
end

return Component
