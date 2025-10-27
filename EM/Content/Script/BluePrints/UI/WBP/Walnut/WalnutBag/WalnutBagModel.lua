local WalnutBagCommon = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagCommon")
local TimeUtils = require("Utils.TimeUtils")
local M = Class("BluePrints.Common.MVC.Model")

function M:Init()
  M.Super.Init(self)
  self._WalnutList = nil
  self._Avatar = nil
  self:GetAvatar()
  self:InitWalnutBagReddotNode()
end

function M:Destory()
  M.Super.Destory(self)
end

function M:GetAllWalnutDict(TypeId, KeyWords, IsShowNotHave)
  self._WalnutList = {}
  local WalnutDataTable = DataMgr.Walnut
  for ItemId, WalnutConfigData in pairs(WalnutDataTable) do
    if 0 == TypeId or TypeId == WalnutConfigData.WalnutType then
      local WalnutCount = self:GetWalnutCountById(ItemId)
      local IsSearchConditionMet = true
      if KeyWords then
        local SearchList = self:GetSearchConditionList(WalnutConfigData)
        IsSearchConditionMet = CommonUtils.CheckFuzzySearchWithSinglePhase(SearchList, KeyWords, false)
      end
      if IsSearchConditionMet then
        if IsShowNotHave then
          if WalnutCount <= 0 then
            table.insert(self._WalnutList, {
              Id = ItemId,
              Rarity = WalnutConfigData.Rarity,
              Count = WalnutCount
            })
          end
        else
          table.insert(self._WalnutList, {
            Id = ItemId,
            Rarity = WalnutConfigData.Rarity,
            Count = WalnutCount
          })
        end
      end
    end
  end
  return self._WalnutList
end

function M:GetSearchConditionList(WalnutConfigData)
  local SearchList = {
    GText(WalnutConfigData.Name)
  }
  for i = 1, WalnutBagCommon.MaxRewardCount do
    local RewardId = WalnutConfigData.Id[i]
    local RewardType = WalnutConfigData.Type[i]
    local RewardDataTable = DataMgr[RewardType]
    if RewardDataTable then
      local RewardConfigData = RewardDataTable[RewardId]
      if RewardConfigData then
        local Name
        if "Draft" == RewardType then
          local ProductType = RewardConfigData.ProductType
          local ProductId = RewardConfigData.ProductId
          local ProductData = DataMgr[ProductType][ProductId]
          Name = ProductData.Name or ProductData[ProductType .. "Name"]
        else
          Name = RewardConfigData.Name or RewardConfigData[RewardType .. "Name"]
        end
        if Name then
          table.insert(SearchList, GText(Name))
        end
      else
        DebugPrint("WalnutBag GetSearchConditionList Error, not find item in DataTable, RewardId is", RewardId)
      end
    else
      DebugPrint("WalnutBag GetSearchConditionList Error, DataTable is nil, RewardInfo is", RewardType, RewardId)
    end
  end
  local AccessKey = WalnutConfigData.AccessKey or {}
  for index, value in ipairs(AccessKey) do
    local AccesssDataTable = DataMgr.Access[value]
    if AccesssDataTable then
      local AccesssName = GText(AccesssDataTable.AccessText)
      table.insert(SearchList, AccesssName)
    end
  end
  return SearchList
end

function M:GetHaveWalnutDict()
  return self:GetAvatar().Walnuts.WalnutBag
end

function M:GetDungeonNextRefreshTime()
  local LastRefreshTime = self:GetAvatar().Walnuts.WalnutLastRefreshTime
  if nil == LastRefreshTime then
    LastRefreshTime = TimeUtils.NowTime()
  end
  return LastRefreshTime + DataMgr.GlobalConstant.WalnutRefreshCD.ConstantValue * 60 * 60
end

function M:GetWalnutCountById(ItemId)
  if self:GetAvatar().Walnuts.WalnutBag == nil then
    return 0
  end
  return self:GetAvatar().Walnuts.WalnutBag[ItemId] or 0
end

function M:CheckIsNeedShowNewDot(ItemId)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(WalnutBagCommon.ReddotName)
  if nil ~= CacheDetail[ItemId] and CacheDetail[ItemId].IsRead == false then
    return true
  end
  return false
end

function M:GetAllNewItemsId()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(WalnutBagCommon.ReddotName)
  local ResultList = {}
  for ItemId, ItemInfo in pairs(CacheDetail) do
    if ItemInfo.IsRead == false then
      local WalnutConfigData = DataMgr.Walnut[ItemId]
      if nil ~= WalnutConfigData then
        if nil == ResultList[WalnutConfigData.WalnutType] then
          ResultList[WalnutConfigData.WalnutType] = {ItemId}
        else
          table.insert(ResultList[WalnutConfigData.WalnutType], ItemId)
        end
      end
    end
  end
  return ResultList
end

function M:GetWalnutConsumeRecordById(ItemId)
  if self:GetAvatar().Walnuts.ConsumeRecord == nil then
    return 0
  end
  return self:GetAvatar().Walnuts.ConsumeRecord[ItemId] or 0
end

function M:InitWalnutBagReddotNode()
  local Node = ReddotManager.GetTreeNode(WalnutBagCommon.ReddotName)
  Node = Node or ReddotManager.AddNode(WalnutBagCommon.ReddotName, nil, 1)
  ReddotManager.ClearLeafNodeCount(WalnutBagCommon.ReddotName)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(WalnutBagCommon.ReddotName)
  local PlayerAvatar = self:GetAvatar()
  if PlayerAvatar and PlayerAvatar.Walnuts.WalnutBag then
    local WalnutBagServerData = PlayerAvatar.Walnuts.WalnutBag
    for ItemId, Count in pairs(WalnutBagServerData) do
      if Count > 0 and nil == CacheDetail[ItemId] then
        CacheDetail[ItemId] = {IsRead = false}
        ReddotManager.IncreaseLeafNodeCount(WalnutBagCommon.ReddotName)
      end
    end
  end
end

function M:AddReddotCount(ItemId)
  if nil == ItemId then
    return
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(WalnutBagCommon.ReddotName)
  if nil == CacheDetail[ItemId] then
    CacheDetail[ItemId] = {IsRead = false}
    ReddotManager.IncreaseLeafNodeCount(WalnutBagCommon.ReddotName)
  end
end

function M:RemoveReddotCount(ItemId)
  if nil == ItemId then
    return
  end
  local ReddotNode = ReddotManager.GetTreeNode(WalnutBagCommon.ReddotName)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(WalnutBagCommon.ReddotName)
  if nil ~= CacheDetail[ItemId] then
    CacheDetail[ItemId].IsRead = true
    if ReddotNode.Count > 0 then
      ReddotManager.DecreaseLeafNodeCount(WalnutBagCommon.ReddotName)
    end
  end
end

function M:ClearReddotCount()
  local ReddotNode = ReddotManager.GetTreeNode(WalnutBagCommon.ReddotName)
  if 0 == ReddotNode.Count then
    return
  end
  if not ReddotNode then
    return
  end
  ReddotNode.Count = 1
  ReddotManager.DecreaseLeafNodeCount(WalnutBagCommon.ReddotName)
end

function M:GetWalnutStuffData(StuffServerData, ParentWidget, ClickCallback)
  local Avatar = self:GetAvatar()
  if nil == Avatar then
    return
  end
  local WalnutInfo = DataMgr.Walnut[StuffServerData.Id]
  if not WalnutInfo.ResourceToCoinType or not WalnutInfo.ResourceValue then
    return false
  end
  local StuffConfig = {}
  StuffConfig.Uuid = tostring(StuffServerData.Id)
  StuffConfig.StuffId = StuffServerData.Id
  StuffConfig.StuffCount = StuffServerData.Count
  StuffConfig.StuffType = "Walnut"
  StuffConfig.StuffName = WalnutInfo.Name
  StuffConfig.StuffIcon = WalnutInfo.Icon
  StuffConfig.CoinId = WalnutInfo.ResourceToCoinType
  StuffConfig.Price = WalnutInfo.ResourceValue
  StuffConfig.ClickCallback = ClickCallback or "ClickStuffIcon"
  StuffConfig.NeedRedPoint = false
  StuffConfig.LockType = 0
  StuffConfig.Rarity = DataMgr.Walnut[StuffServerData.Id].Rarity or 1
  StuffConfig.ParentWidget = ParentWidget
  return StuffConfig
end

function M:CreateBagItemContent(Content)
  if nil == Content then
    return
  end
  local StuffObj = NewObject(UIUtils.GetCommonItemContentClass())
  StuffObj.Uuid = Content.Uuid
  StuffObj.Type = Content.StuffType
  StuffObj.GridIndex = Content.GridIndex
  StuffObj.StuffId = Content.StuffId
  StuffObj.UnitId = Content.StuffId
  StuffObj.ItemType = Content.StuffType
  StuffObj.StuffType = Content.StuffType
  StuffObj.Count = Content.StuffCount
  StuffObj.Icon = Content.StuffIcon
  StuffObj.StuffName = Content.StuffName
  StuffObj.ClickCallback = Content.ClickCallback
  StuffObj.NeedRedPoint = Content.NeedRedPoint
  StuffObj.IsSelect = Content.IsSelect
  StuffObj.LockType = Content.LockType
  StuffObj.Rarity = Content.Rarity
  StuffObj.Price = Content.Price
  StuffObj.CoinId = Content.CoinId
  StuffObj.StateTagInfo = Content.StateTagInfo
  StuffObj.bDisableCommonClick = Content.bDisableCommonClick
  local StuffObjType = StuffObj.Type
  if Content.ParentWidget then
    StuffObj.ParentWidget = Content.ParentWidget
  end
  return StuffObj
end

return M
