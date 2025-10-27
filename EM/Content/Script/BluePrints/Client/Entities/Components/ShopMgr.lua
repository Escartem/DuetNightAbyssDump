local Component = {}
local TimeUtils = require("Utils.TimeUtils")

function Component:CheckShopItemHasRequire(ShopItemId)
  local Require = DataMgr.ShopItem[ShopItemId].Require
  if Require then
    local RequireItem = self.ShopItems[Require]
    if RequireItem then
      if RequireItem:IsCanBeChased() then
        return true
      end
    else
      return true
    end
  end
  return false
end

function Component:CheckShopItemHasRexclusionGroup(ShopItemId)
  local RexclusionGroup = DataMgr.ShopItem[ShopItemId].RexclusionGroup
  if RexclusionGroup then
    for index, RexclusionGroupId in pairs(RexclusionGroup) do
      local ExclusionItemList = DataMgr.RexclusionGroup2ShopItem[RexclusionGroupId]
      for index, ExclusionItemId in pairs(ExclusionItemList) do
        local ExclusionItem = self.ShopItems[ExclusionItemId]
        if ExclusionItemId ~= ShopItemId and ExclusionItem and ExclusionItem.AlreadyPurchaseTimes > 0 then
          return true
        end
      end
    end
  end
  return false
end

function Component:CheckShopItemUnique(ShopItemId)
  local ItemType = DataMgr.ShopItem[ShopItemId].ItemType
  local ItemId = DataMgr.ShopItem[ShopItemId].TypeId
  if "Reward" ~= ItemType then
    local TypeInfo = DataMgr.RewardType[ItemType]
    if not TypeInfo then
      return true
    end
    if TypeInfo.UniqueType then
      local CheckFuncName = "Check" .. ItemType .. "Enough"
      local CheckMethod = self[CheckFuncName]
      if not CheckMethod then
        return true
      end
      if CheckMethod(self, {
        [ItemId] = 1
      }) then
        return true
      end
    end
  end
  return false
end

function Component:CheckIsEffective(ShopItemId)
  local ShopItemData = DataMgr.ShopItem[ShopItemId]
  local CurTime = TimeUtils.NowTime()
  local StartTime = ShopItemData.StartTime
  local EndTime = ShopItemData.EndTime
  if StartTime and CurTime >= StartTime then
    if EndTime and CurTime > EndTime then
      return false
    end
    return true
  end
  return false
end

function Component:GetShopItemAlreadyPurchaseTimes(ShopItemId)
  if not ShopItemId then
    return 0
  end
  local ShopItem = self.ShopItems[ShopItemId]
  if ShopItem then
    return ShopItem.AlreadyPurchaseTimes
  end
  return 0
end

function Component:CheckIsFirstBonus(ShopItemId)
  if not DataMgr.FirstBonusNum[ShopItemId] then
    return false
  end
  if self:GetShopItemAlreadyPurchaseTimes(ShopItemId) > 0 then
    return false
  end
  return true
end

function Component:CheckShopItemCanPurchase(ShopItemId, Count)
  local ShopItem = self.ShopItems[ShopItemId]
  local ShopItemData = DataMgr.ShopItem[ShopItemId]
  local ShopItemCount = Count or 1
  if not ShopItemData then
    return false
  end
  if ShopItemData.UnlockLevel and ShopItemData.UnlockLevel > self.Level then
    return false
  end
  if not self:CheckIsEffective(ShopItemId) then
    return false
  end
  if self:CheckShopItemHasRequire(ShopItemId) then
    return false
  end
  if self:CheckShopItemHasRexclusionGroup(ShopItemId) then
    return false
  end
  if self:CheckShopItemUnique(ShopItemId) then
    return false
  end
  if ShopItem then
    if not ShopItem:IsCanBeChased() then
      return false
    end
    if ShopItem:IsPurchaseLimit() and ShopItemCount > ShopItem.RemainPurchaseTimes then
      return false
    end
  end
  return true
end

function Component:PurchaseShopItem(ShopItemId, Count, NotShow, PurchaseCallback)
  if DataMgr.ShopItem2PayGoods[ShopItemId] then
    self.logger.info("PurchaseShopItem is Paygood", ShopItemId, Count)
    local ShopMain = UIManager(GWorld.GameInstance):GetUIObj("ShopMain")
    if ShopMain then
      ShopMain:BlockAllUIInput(false)
    end
    local CommonShopActivity = UIManager(GWorld.GameInstance):GetUIObj("ShopActivity")
    if CommonShopActivity then
      CommonShopActivity:BlockAllUIInput(false)
    end
    return
  end
  self.logger.info("PurchaseShopItem", ShopItemId, Count)
  local bFreeBefore, ReddotNodeName
  local ItemConf = DataMgr.ShopItem[ShopItemId]
  if ItemConf and ItemConf.SubTabId then
    ReddotNodeName = DataMgr.ShopTabSub[ItemConf.SubTabId].ReddotNode
    if ReddotNodeName then
      bFreeBefore = ShopUtils:IsFree(ShopItemId)
    end
  end
  
  local function Callback(Ret, PackRewards)
    EventManager:FireEvent(EventID.OnPurchaseShopItem, Ret, ShopItemId, Count)
    local ShopMain = UIManager(GWorld.GameInstance):GetUIObj("ShopMain")
    if ShopMain then
      ShopMain:BlockAllUIInput(false)
    end
    local CommonShopActivity = UIManager(GWorld.GameInstance):GetUIObj("ShopActivity")
    if CommonShopActivity then
      CommonShopActivity:BlockAllUIInput(false)
    end
    local SkinPreview = UIManager(GWorld.GameInstance):GetUIObj("SkinPreview")
    if SkinPreview then
      SkinPreview:BlockAllUIInput(false)
    end
    self.logger.info("PurchaseShopItem callback", Ret, ShopItemId, Count, PackRewards)
    if Ret == ErrorCode.RET_SUCCESS then
      local ShopItemData = DataMgr.ShopItem[ShopItemId]
      if not NotShow then
        UIManager(GWorld.GameInstance):UnLoadUI("ShopItemSingle")
        UIManager(GWorld.GameInstance):UnLoadUI("ShopItemPackage")
        UIUtils.ShowGetItemPageAndOpenBagIfNeeded(ShopItemData.ItemType, ShopItemData.TypeId, ShopItemData.TypeNum * Count, PackRewards, ShopItemData.IsSpPopup, nil, nil)
      end
      EventManager:FireEvent(EventID.OnPurchaseShopItemSuccess, Ret, ShopItemData.TypeId, Count, PackRewards)
    else
      UIManager(GWorld.GameInstance):ShowError(Ret, 1.0, "CommonToastMain")
    end
    if ShopMain then
      ShopMain:RefreshSubTabData(ShopMain.CurSubTabMap, true, true)
    end
    if CommonShopActivity then
      CommonShopActivity:RefreshSubTabData(CommonShopActivity.CurSubTabMap, true, true)
    end
    local ActivityShop = UIManager(GWorld.GameInstance):GetUIObj("ActivityShop")
    if ActivityShop then
      ActivityShop:UpdateShopDetail(ActivityShop.CurSubTabMap)
    end
    if SkinPreview then
      SkinPreview:RefreshPurchaseState()
    end
    if ReddotNodeName then
      local bFree = ShopUtils:IsFree(ShopItemId)
      if false == bFree and true == bFreeBefore then
        ReddotManager.DecreaseLeafNodeCount(ReddotNodeName, 1, {ShopItemId = ShopItemId})
      end
    end
    if PurchaseCallback then
      PurchaseCallback()
    end
  end
  
  self:CallServer("PurchaseShopItem", Callback, ShopItemId, Count)
end

function Component:OnRefreshShop(ServerTime)
  self.logger.info("--OnRefreshShop--", TimeUtils.TimeToStr(ServerTime))
  local TimeOffset = ServerTime - TimeUtils.NowTime()
  if TimeOffset > 0 then
    TimeUtils.SetTimeOffset(TimeOffset)
  end
  local ShopMain = UIManager(GWorld.GameInstance):GetUIObj("ShopMain")
  if ShopMain then
    ShopMain:RefreshSubTabData(ShopMain.CurSubTabMap, true, true)
  end
  for SubTabId, ShopTabConf in pairs(DataMgr.ShopTabSub) do
    local NodeName = ShopTabConf.ReddotNode
    if NodeName then
      local Node = ReddotManager.GetTreeNode(NodeName)
      if Node and Node.RefreshCacheDetail then
        local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(NodeName)
        local DeltaCount = Node:RefreshCacheDetail({Detail = CacheDetail})
        if DeltaCount > 0 then
          ReddotManager.IncreaseLeafNodeCount(NodeName, DeltaCount)
        elseif DeltaCount < 0 then
          ReddotManager.DecreaseLeafNodeCount(NodeName, -DeltaCount)
        end
      end
    end
  end
end

function Component:PurchaseShopItemUseCoin1(ShopItemId, Count, InCallBack)
  self.logger.info("PurchaseShopItemUseCoin1 Begin", ShopItemId, Count)
  
  local function Callback(Ret, PackRewards)
    self.logger.info("PurchaseShopItemUseCoin1 callback", Ret, ShopItemId, Count, PackRewards)
    if InCallBack then
      InCallBack(Ret, ShopItemId, Count, PackRewards)
    end
  end
  
  self:CallServer("PurchaseShopItemUseCoin1", Callback, ShopItemId, Count)
end

function Component:CheckShopItemEnhanceRedDot(ShopItemId)
  if not self:CheckIsEffective(ShopItemId) then
    return false
  end
  if not ShopItemId then
    return false
  end
  local ShopItemData = DataMgr.ShopItem[ShopItemId]
  if not ShopItemData then
    return false
  end
  if not ShopItemData.EnhanceRedDot then
    return false
  end
  local ShopItem = self.ShopItems[ShopItemId]
  if not ShopItem then
    return true
  end
  if ShopItem.EnhanceRedDotCleaned then
    return false
  end
  return true
end

function Component:CleanShopItemEnhanceRedDot(ShopItemId, InCallback)
  self.logger.info("CleanShopItemEnhanceRedDot Begin", ShopItemId)
  
  local function Callback(Ret)
    self.logger.info("CleanShopItemEnhanceRedDot callback", Ret, ShopItemId)
    local ShopItemConf = DataMgr.ShopItem[ShopItemId]
    if ShopItemConf and ShopItemConf.SubTabId then
      local ReddotNodeName = DataMgr.ShopTabSub[ShopItemConf.SubTabId].ReddotNode
      if ReddotNodeName then
        ReddotManager.DecreaseLeafNodeCount(ReddotNodeName, 1, {ShopItemId = ShopItemId})
      end
    end
    if InCallback then
      InCallback()
    end
  end
  
  self:CallServer("CleanShopItemEnhanceRedDot", Callback, ShopItemId)
end

function Component:CheckShopItemSoldOutDisplay(ShopItemId)
  if not ShopItemId then
    return false
  end
  local ShopItemData = DataMgr.ShopItem[ShopItemId]
  if not ShopItemData then
    return false
  end
  local ShopItem = self.ShopItems[ShopItemId]
  if not ShopItem then
    return false
  end
  if 0 ~= ShopItem.RemainPurchaseTimes or not self:CheckIsEffective(ShopItemId) then
    return false
  end
  if ShopItemData.RefreshTime ~= nil then
    return true
  else
    return ShopItemData.PurchaseLimit > 0 and ShopItemData.SoldOutDisplay == true
  end
end

return Component
