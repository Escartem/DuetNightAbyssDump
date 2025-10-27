local ActivityFortRewardModel = {}
ActivityFortRewardModel.CurEventId = DataMgr.PaotaiEventConstant.PaotaiGameEventId.ConstantValue

function ActivityFortRewardModel:OpenReward(Widget, Type)
  self:SetRewardParams(Type)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  UIManager:ShowCommonPopupUI(100213, self.Params, Widget)
end

function ActivityFortRewardModel:SetRewardParams(Type)
  self.Params = {}
  local ConfigData = {
    HasTab = true,
    ReddotName = "PaotaiEventReward",
    TabInfo = {},
    Datas = {}
  }
  if Type then
    ConfigData.Type = Type
  end
  local PaotaiMiniGameInfo = DataMgr.PaotaiMiniGame
  self.LevelsInfo = {}
  for _, Info in pairs(PaotaiMiniGameInfo) do
    if self.CurEventId == Info.EventId then
      table.insert(self.LevelsInfo, Info)
    end
  end
  table.sort(self.LevelsInfo, function(A, B)
    return A.Id < B.Id
  end)
  local Avatar = GWorld:GetAvatar()
  local PaotaiGame = Avatar.PaotaiGame
  local PaotaiGameEventInfo
  if PaotaiGame then
    PaotaiGameEventInfo = PaotaiGame[self.CurEventId]
  end
  for TabIndex, Info in ipairs(self.LevelsInfo) do
    local TableItem = {}
    TableItem.Title = Info.DungeonName
    TableItem.Type = Info.DungeonId
    TableItem.ReddotName = "PaotaiEventReward"
    TableItem.IsShowIcon = false
    table.insert(ConfigData.TabInfo, TableItem)
    local SumNum = #Info.Reward
    local PaotaiGameLevelInfo
    if PaotaiGameEventInfo then
      PaotaiGameLevelInfo = PaotaiGameEventInfo[Info.DungeonId]
    end
    local MaxScore = 0
    local RewardsGotInfo
    if PaotaiGameLevelInfo and PaotaiGameLevelInfo.MaxScore then
      MaxScore = PaotaiGameLevelInfo.MaxScore
    end
    if PaotaiGameLevelInfo then
      RewardsGotInfo = PaotaiGameLevelInfo:GetRewardsGotInfo()
    end
    local Data = {
      Items = {}
    }
    local CurrentNum = 0
    for i = 1, SumNum do
      local Item = {}
      Item.Score = Info.Level[i]
      Item.Index = i
      Item.Type = Info.DungeonId
      Item.CanReceive = false
      Item.RewardsGot = false
      if MaxScore < Item.Score then
        Item.InProgress = true
      else
        CurrentNum = CurrentNum + 1
        Item.InProgress = false
        if RewardsGotInfo then
          if RewardsGotInfo[Item.Score] then
            Item.CanReceive = false
            Item.RewardsGot = true
          else
            Item.CanReceive = true
            Item.RewardsGot = false
          end
        end
      end
      Item.NotreachText = GText("UI_EventReward_NotAchieved")
      Item.Hint = string.format(GText(Info.LeveDes[i]), Item.Score)
      Item.ReceiveCallBack = self.GetRewards
      Item.ReceiveParm = {RewardModel = self}
      Item.Rewards = {}
      local RewardId = Info.Reward[i]
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
    end
    Data.ShowIcon = false
    Data.ShowSourceNum = true
    Data.Text_Total = GText("UI_EventReward_Achieved")
    Data.NowNum = CurrentNum
    Data.NumMax = SumNum
    Data.ReceiveButtonText = GText("UI_BattlePass_ClaimAll")
    Data.ReceiveAllCallBack = self.GetAllRewards
    Data.ReceiveAllParam = {
      RewardModel = self,
      Type = Info.DungeonId
    }
    ConfigData.Datas[Info.DungeonId] = Data
  end
  self.Params.ConfigData = ConfigData
  self.Params.Title = GText("Event_RewardTitle_103007")
end

function ActivityFortRewardModel.GetRewards(RewardItem, Content)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Ret, Rewards)
      local PaotaiGame = Avatar.PaotaiGame
      
      local PaotaiGameEventInfo
      if PaotaiGame then
        PaotaiGameEventInfo = PaotaiGame[Content.ConfigData.ReceiveParm.RewardModel.CurEventId]
      end
      local PaotaiGameLevelInfo
      if PaotaiGameEventInfo then
        PaotaiGameLevelInfo = PaotaiGameEventInfo[Content.ConfigData.Type]
      end
      local MaxScore = 0
      local RewardsGotInfo
      if PaotaiGameLevelInfo and PaotaiGameLevelInfo.MaxScore then
        MaxScore = PaotaiGameLevelInfo.MaxScore
      end
      if PaotaiGameLevelInfo then
        RewardsGotInfo = PaotaiGameLevelInfo:GetRewardsGotInfo()
      end
      Content.ConfigData.CanReceive = false
      Content.ConfigData.RewardsGot = false
      if MaxScore < Content.ConfigData.Score then
        Content.ConfigData.InProgress = true
      else
        Content.ConfigData.InProgress = false
        if RewardsGotInfo then
          if RewardsGotInfo[Content.ConfigData.Score] then
            Content.ConfigData.CanReceive = false
            Content.ConfigData.RewardsGot = true
          else
            Content.ConfigData.CanReceive = true
            Content.ConfigData.RewardsGot = false
          end
        end
      end
      Content.SelfWidget:RefreshBtn(0 == Ret)
      Content.Owner:RefreshButton(Content.ConfigData.ReceiveParm.RewardModel:CheckHaveRewardToGet(Content.ConfigData.Type))
      if not ErrorCode:Check(Ret) then
        return
      end
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, function()
        RewardItem:SetFocus()
      end, RewardItem)
    end
    
    Avatar:PaotaiGetScoreReward(Content.ConfigData.Type, Content.ConfigData.Index, Callback)
  end
end

function ActivityFortRewardModel:CheckHaveRewardToGet(Type)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local PaotaiGame = Avatar.PaotaiGame
    local PaotaiGameEventInfo
    if PaotaiGame then
      PaotaiGameEventInfo = PaotaiGame[self.CurEventId]
    end
    local PaotaiGameLevelInfo
    if PaotaiGameEventInfo then
      PaotaiGameLevelInfo = PaotaiGameEventInfo[Type]
    end
    local MaxScore = 0
    local RewardsGotInfo
    if PaotaiGameLevelInfo and PaotaiGameLevelInfo.MaxScore then
      MaxScore = PaotaiGameLevelInfo.MaxScore
    end
    if PaotaiGameLevelInfo then
      RewardsGotInfo = PaotaiGameLevelInfo:GetRewardsGotInfo()
    end
    if RewardsGotInfo then
      local LevelInfo = DataMgr.PaotaiMiniGame[Type].Level
      for Index, Score in pairs(LevelInfo) do
        if not RewardsGotInfo[Score] and Score <= MaxScore then
          return true
        end
      end
    end
    return false
  end
end

function ActivityFortRewardModel:GetAllRewards(ReceiveAllParm)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Ret, Rewards)
      for i = 0, ReceiveAllParm.SelfWidget.List_Item:GetNumItems() - 1 do
        local Content = ReceiveAllParm.SelfWidget.List_Item:GetItemAt(i)
        
        local PaotaiGame = Avatar.PaotaiGame
        local PaotaiGameEventInfo
        if PaotaiGame then
          PaotaiGameEventInfo = PaotaiGame[Content.ConfigData.ReceiveParm.RewardModel.CurEventId]
        end
        local PaotaiGameLevelInfo
        if PaotaiGameEventInfo then
          PaotaiGameLevelInfo = PaotaiGameEventInfo[Content.ConfigData.Type]
        end
        local MaxScore = 0
        local RewardsGotInfo
        if PaotaiGameLevelInfo and PaotaiGameLevelInfo.MaxScore then
          MaxScore = PaotaiGameLevelInfo.MaxScore
        end
        if PaotaiGameLevelInfo then
          RewardsGotInfo = PaotaiGameLevelInfo:GetRewardsGotInfo()
        end
        Content.ConfigData.CanReceive = false
        Content.ConfigData.RewardsGot = false
        if MaxScore < Content.ConfigData.Score then
          Content.ConfigData.InProgress = true
        else
          Content.ConfigData.InProgress = false
          if RewardsGotInfo then
            if RewardsGotInfo[Content.ConfigData.Score] then
              Content.ConfigData.CanReceive = false
              Content.ConfigData.RewardsGot = true
            else
              Content.ConfigData.CanReceive = true
              Content.ConfigData.RewardsGot = false
            end
          end
        end
        if Content.SelfWidget then
          Content.SelfWidget:RefreshBtn(0 == Ret)
        end
      end
      ReceiveAllParm.SelfWidget:RefreshButton(ReceiveAllParm.RewardModel:CheckHaveRewardToGet(ReceiveAllParm.Type))
      if not ErrorCode:Check(Ret) then
        return
      end
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, function()
        ReceiveAllParm.SelfWidget:SetFocus()
      end, ReceiveAllParm.SelfWidget)
    end
    
    Avatar:PaotaiGetAllScoreReward(ReceiveAllParm.Type, Callback)
  end
end

return ActivityFortRewardModel
