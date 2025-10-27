local Component = {}
local HeroUSDKUtils = require("Utils.HeroUSDKUtils")

function Component:RequestPay(GoodsId, Callback)
  print(_G.LogTag, "RequestPay", GoodsId)
  self:CallServer("RequestPay", Callback, GoodsId)
end

function Component:OnPayFinished(Result, GoodsId, OrderId, ShopItems)
  print(_G.LogTag, "OnPayFinished", Result, GoodsId, OrderId, ShopItems)
  self:NotifyPayFinish(OrderId, Result, GoodsId, ShopItems)
  EventManager:FireEvent(EventID.OnRechargeFinished, Result, GoodsId, ShopItems)
  local EMHeroUSDKSubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UEMHeroUSDKSubsystem:StaticClass())
  local Parameters = TMap("", "")
  local GameRoleInfo = HeroUSDKUtils.GenHeroHDCGameRoleInfo()
  Parameters:Add("content_id", tostring(DataMgr.PayGoods[GoodsId].ItemId))
  Parameters:Add("currency", "USD")
  Parameters:Add("revenue", tostring(DataMgr.PayGoods[GoodsId].PriceUSD))
  Parameters:Add("user_id", tostring(GameRoleInfo.roleId))
  Parameters:Add("order_id", tostring(OrderId))
  Parameters:Add("item_id", tostring(GoodsId))
  Parameters:Add("server_id", tostring(GameRoleInfo.serverId))
  EMHeroUSDKSubsystem:MSDKSendPurchaseWithOrderIdWithChannel(OrderId, DataMgr.PayGoods[GoodsId].PriceUSD, "USD", Parameters)
end

function Component:ListenPayFinish(OrderId, EventFunc)
  if not OrderId then
    return
  end
  if not EventFunc then
    return
  end
  if not self.WaitPayDict then
    self.WaitPayDict = {}
  end
  self.WaitPayDict[OrderId] = EventFunc
end

function Component:UnListenPayFinish(OrderId)
  if not OrderId then
    return
  end
  if not self.WaitPayDict then
    return
  end
  self.WaitPayDict[OrderId] = nil
end

function Component:NotifyPayFinish(OrderId, Result, GoodsId, ShopItems)
  if not self.WaitPayDict then
    return
  end
  if not OrderId then
    return
  end
  local EventFunc = self.WaitPayDict[OrderId]
  self.WaitPayDict[OrderId] = nil
  if EventFunc then
    EventFunc(Result, OrderId, GoodsId, ShopItems)
  end
end

function Component:LeaveWorld()
  self.WaitPayDict = nil
end

return Component
