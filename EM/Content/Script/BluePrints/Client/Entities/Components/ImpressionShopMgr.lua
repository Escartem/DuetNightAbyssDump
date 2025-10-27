local Component = {}

function Component:PurchaseImpressionShopItem(ClientDelegate, ImpressionShopId, DiceNum)
  if not ImpressionShopId then
    Utils.ScreenPrint("\229\141\176\232\177\161\229\149\134\229\147\129Id\228\184\186\231\169\186\239\188\140\232\175\183\230\163\128\230\159\165\228\187\163\231\160\129\233\128\187\232\190\145")
  end
  
  local function Callback(Ret, IsCheckSuccess, rand1, rand2, PurchaseRewards)
    self.logger.debug("ZJT_ PurchaseImpressionShopItem ", Ret, IsCheckSuccess, rand1, rand2, PurchaseRewards)
    if ClientDelegate and ClientDelegate[1] and ClientDelegate[2] then
      ClientDelegate[2](ClientDelegate[1], Ret, IsCheckSuccess, rand1, rand2, PurchaseRewards)
    end
  end
  
  self:CallServer("PurchaseImpressionShopItem", Callback, ImpressionShopId, DiceNum)
end

function Component:UnlockImpressionShopItem(UnlockShopIds)
  DebugPrint("ZJT_ 111111 UnlockImpressionShopItem ", UnlockShopIds)
  PrintTable({UnlockShopIds = UnlockShopIds}, 10)
end

return Component
