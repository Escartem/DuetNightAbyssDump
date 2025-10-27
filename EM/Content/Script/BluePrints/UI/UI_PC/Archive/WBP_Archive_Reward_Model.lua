local NumberModel = require("BluePrints.UI.UI_PC.Archive.WBP_Archive_Number_Model")
local ArchiveRewardModel = {}
ArchiveRewardModel.ArchiveType2Name = {
  [1001] = "Character",
  [1002] = "Melee",
  [1003] = "Ranged",
  [1004] = "Resource",
  [1005] = "Read",
  [1006] = "Enemy"
}

function ArchiveRewardModel:OpenReward(Widget, Type)
  self:SetRewardParams(Type)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  UIManager:ShowCommonPopupUI(100213, self.Params, Widget)
end

function ArchiveRewardModel:SetRewardParams(Type)
  self.Params = {}
  local ConfigData = {
    HasTab = true,
    ReddotName = "ArchiveReward",
    TabInfo = {},
    Datas = {}
  }
  if Type then
    ConfigData.Type = Type
  end
  local SortedArchiveInfo = {}
  for _, Data in pairs(DataMgr.ArchiveInfo) do
    table.insert(SortedArchiveInfo, Data)
  end
  table.sort(SortedArchiveInfo, function(a, b)
    return a.ArchiveType < b.ArchiveType
  end)
  for TabIndex, ArchiveInfo in ipairs(SortedArchiveInfo) do
    local TableItem = {}
    TableItem.Title = ArchiveInfo.ArchiveTitle
    TableItem.Type = ArchiveInfo.ArchiveType
    TableItem.ReddotName = "ArchiveReward"
    if ArchiveInfo.RewardTabIconPath then
      TableItem.ShowIcon = true
      TableItem.IconPath = ArchiveInfo.RewardTabIconPath
    end
    table.insert(ConfigData.TabInfo, TableItem)
    local SumNum = NumberModel["Get" .. self.ArchiveType2Name[ArchiveInfo.ArchiveType] .. "SumNumber"](NumberModel)
    local Step = ArchiveInfo.ArchiveStep
    local Index = 1
    local Avatar = GWorld:GetAvatar()
    local Archive = Avatar.Archives[ArchiveInfo.ArchiveType]
    local CurrentNum = NumberModel:GetCurrentNumber(ArchiveInfo.ArchiveType)
    local Data = {
      Items = {}
    }
    while SumNum >= Index * Step do
      local Item = {}
      Item.Nums = Index * Step
      Item.Type = ArchiveInfo.ArchiveType
      Item.CanReceive = false
      Item.RewardsGot = false
      if CurrentNum < Item.Nums then
        Item.InProgress = true
      else
        Item.InProgress = false
        if Archive.ArchiveRewardGot[Item.Nums] then
          Item.CanReceive = false
          Item.RewardsGot = true
        else
          Item.CanReceive = true
          Item.RewardsGot = false
        end
      end
      Item.NotreachText = GText("UI_Archive_CollectionInProgress")
      Item.Hint = string.format(GText("UI_Archive_CollectionTarget"), Item.Nums)
      Item.ReceiveCallBack = self.GetRewards
      Item.ReceiveParm = {ArchiveMain = self}
      Item.Rewards = {}
      local RewardId = ArchiveInfo.RewardId
      local Rewards = {RewardId}
      local IsGot = not Item.CanReceive
      for _, RewardId in pairs(Rewards) do
        local RewardInfo = DataMgr.Reward[RewardId]
        if RewardInfo then
          local Ids = RewardInfo.Id or {}
          local RewardCount = RewardInfo.Count or {}
          local TableName = RewardInfo.Type or {}
          for i = 1, #Ids do
            local Content = NewObject(UIUtils.GetCommonItemContentClass())
            local ItemId = Ids[i]
            Content.IsShowDetails = true
            Content.Id = ItemId
            Content.ItemId = ItemId
            Content.Count = RewardUtils:GetCount(RewardCount[i])
            Content.Icon = ItemUtils.GetItemIconPath(ItemId, TableName[i])
            Content.Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
            Content.ItemType = TableName[i]
            Content.bHasGot = IsGot
            table.insert(Item.Rewards, Content)
          end
        end
      end
      table.insert(Data.Items, Item)
      Index = Index + 1
    end
    Data.ShowIcon = false
    Data.ShowSourceNum = true
    Data.Text_Total = GText("UI_ArchiveCollectionReward")
    Data.NowNum = CurrentNum
    Data.NumMax = SumNum
    Data.ReceiveButtonText = GText("UI_Archive_CollectionClaimAll")
    Data.ReceiveAllCallBack = self.GetAllRewards
    Data.ReceiveAllParam = {
      ArchiveMain = self,
      Type = ArchiveInfo.ArchiveType
    }
    ConfigData.Datas[ArchiveInfo.ArchiveType] = Data
  end
  self.Params.ConfigData = ConfigData
  self.Params.Title = GText("UI_ArchiveCollectionReward")
end

function ArchiveRewardModel.GetRewards(RewardItem, Content)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Ret, Rewards)
      local Archive = Avatar.Archives[Content.ConfigData.Type]
      
      local CurrentNum = NumberModel:GetCurrentNumber(Content.ConfigData.Type)
      Content.ConfigData.CanReceive = false
      Content.ConfigData.RewardsGot = false
      if CurrentNum < Content.ConfigData.Nums then
        Content.ConfigData.InProgress = true
      else
        Content.ConfigData.InProgress = false
        if Archive.ArchiveRewardGot[Content.ConfigData.Nums] then
          Content.ConfigData.CanReceive = false
          Content.ConfigData.RewardsGot = true
        else
          Content.ConfigData.CanReceive = true
          Content.ConfigData.RewardsGot = false
        end
      end
      Content.SelfWidget:RefreshBtn(0 == Ret)
      Content.Owner:RefreshButton(Content.ConfigData.ReceiveParm.ArchiveMain:CheckHaveRewardToGet(Content.ConfigData.Type))
      Content.ConfigData.ReceiveParm.ArchiveMain:RefreshReddotInfo(Content.ConfigData.Type, Content.ConfigData.Nums)
      if not ErrorCode:Check(Ret) then
        return
      end
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, function()
        RewardItem:SetFocus()
      end, RewardItem)
    end
    
    Avatar:GetArchiveReward(Callback, Content.ConfigData.Type, Content.ConfigData.Nums)
  end
end

function ArchiveRewardModel:CheckHaveRewardToGet(Type)
  local ArchiveInfo = DataMgr.ArchiveInfo[Type]
  local SumNum = NumberModel["Get" .. self.ArchiveType2Name[Type] .. "SumNumber"](NumberModel)
  local Step = ArchiveInfo.ArchiveStep
  local Index = 1
  local Avatar = GWorld:GetAvatar()
  local Archive = Avatar.Archives[ArchiveInfo.ArchiveType]
  local CurrentNum = NumberModel:GetCurrentNumber(ArchiveInfo.ArchiveType)
  while SumNum >= Index * Step do
    local Nums = Index * Step
    if CurrentNum < Nums then
      break
    end
    if not Archive.ArchiveRewardGot[Nums] then
      return true
    end
    Index = Index + 1
  end
  return false
end

function ArchiveRewardModel:RefreshReddotInfo(Type, Num)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("ArchiveReward")
  if CacheDetail[Type] and CacheDetail[Type][Num] then
    CacheDetail[Type][Num] = nil
    if nil == next(CacheDetail[Type]) then
      CacheDetail[Type] = nil
    end
    ReddotManager.DecreaseLeafNodeCount("ArchiveReward")
  end
end

function ArchiveRewardModel:GetAllRewards(ReceiveAllParm)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Ret, Rewards)
      for i = 0, ReceiveAllParm.SelfWidget.List_Item:GetNumItems() - 1 do
        local Content = ReceiveAllParm.SelfWidget.List_Item:GetItemAt(i)
        
        local Archive = Avatar.Archives[Content.ConfigData.Type]
        local CurrentNum = NumberModel:GetCurrentNumber(Content.ConfigData.Type)
        Content.ConfigData.CanReceive = false
        Content.ConfigData.RewardsGot = false
        if CurrentNum < Content.ConfigData.Nums then
          Content.ConfigData.InProgress = true
        else
          Content.ConfigData.InProgress = false
          if Archive.ArchiveRewardGot[Content.ConfigData.Nums] then
            Content.ConfigData.CanReceive = false
            Content.ConfigData.RewardsGot = true
          else
            Content.ConfigData.CanReceive = true
            Content.ConfigData.RewardsGot = false
          end
        end
        if Content.SelfWidget then
          Content.SelfWidget:RefreshBtn(0 == Ret)
        end
        Content.ConfigData.ReceiveParm.ArchiveMain:RefreshReddotInfo(Content.ConfigData.Type, Content.ConfigData.Nums)
      end
      ReceiveAllParm.SelfWidget:RefreshButton(ReceiveAllParm.ArchiveMain:CheckHaveRewardToGet(ReceiveAllParm.Type))
      if not ErrorCode:Check(Ret) then
        return
      end
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, function()
        ReceiveAllParm.SelfWidget:SetFocus()
      end, ReceiveAllParm.SelfWidget)
    end
    
    Avatar:GetAllArchiveReward(Callback, ReceiveAllParm.Type)
  end
end

return ArchiveRewardModel
