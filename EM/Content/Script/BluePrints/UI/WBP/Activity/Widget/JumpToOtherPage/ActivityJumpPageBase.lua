require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local M = Class()

function M:GetPageName()
  return DataMgr.EventTab[self.ParentTabId].EventTabName
end

function M:GetActivityId()
  return self.CurActivityId
end

function M:GetParentTabId()
  return self.ParentTabId
end

function M:GetPageConfigData()
  return DataMgr.EventPortal[self.CurActivityId]
end

function M:ResetVariable()
  self.FocusWidgetName = nil
end

function M:InitPage(ActivityId, ParentTabId, AllActivityId, ParentWidget)
  self.CurActivityId = ActivityId
  self.ParentTabId = ParentTabId
  self.ParentWidget = ParentWidget
  local PlayerAvatar = GWorld:GetAvatar()
  if nil == PlayerAvatar then
    return
  end
  local ActivityConfigData = DataMgr.EventMain[self.CurActivityId]
  self.ActivityEndTime = ActivityConfigData.EventEndTime and ActivityConfigData.EventEndTime or ActivityConfigData.PermanenEventTime
  self.RewardEndTime = ActivityConfigData.RewardEndTime
  local PageConfigData = DataMgr.EventPortal[self.CurActivityId]
  self.FinishCondition = ActivityConfigData.EventEndCondition
  self:RefreshPageStaticView(ActivityConfigData, PageConfigData, self.ViewInfoBtnClick, self.GoToShopClick, self.GoToTargetPageClick, self.OnStuffDetailOpenChanged, self.GoToTaskClick, self.GoToMoreClick)
  self:RefreshPageDynamicView()
  self.IsComplete = false
  local Avatar = GWorld:GetAvatar()
  if Avatar and self.FinishCondition then
    self.IsComplete = ConditionUtils.CheckCondition(Avatar, self.FinishCondition)
  end
  self:InitTimeInfo()
end

function M:CleanSelf(bIsRemoveSelf)
  self:RemoveTimer("RefreshLeftTime")
  if bIsRemoveSelf then
    self:RemoveFromParent()
  end
end

function M:InitTimeInfo()
  if (self.ActivityEndTime ~= nil or nil ~= self.RewardEndTime or self.IsComplete) and self.Activity_Time then
    local bCheckNextDayFiveStamp = true
    ActivityUtils.RefreshLeftTime(self, self.Activity_Time, bCheckNextDayFiveStamp)
    self:AddTimer(1.0, ActivityUtils.RefreshLeftTime, true, 0, "RefreshLeftTime", true, self.Activity_Time, bCheckNextDayFiveStamp)
  else
    ActivityUtils.SetLeftTimeView(self.Activity_Time, true)
  end
end

function M:ViewInfoBtnClick()
  local ActivityConfigData = DataMgr.EventMain[self.CurActivityId]
  if not ActivityConfigData.EventRule then
    DebugPrint("ViewInfoBtn Click, EventRule is nil, EventId is", self.CurActivityId)
    return
  end
  local Params = {
    LongText = GText(ActivityConfigData.EventRule),
    ShowBKeyClose = true
  }
  UIManager(self):ShowCommonPopupUI(100192, Params, self)
end

function M:GoToTargetPageClick()
  local PageConfigData = DataMgr.EventPortal[self.CurActivityId]
  if PageConfigData.JumpUIId then
    PageJumpUtils:JumpToTargetPageByJumpId(PageConfigData.JumpUIId, false, false, true)
  else
    local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
    if ActivityMain then
      local JumpPageBG = ActivityMain.WidgetBGAnchor:GetChildAt(0)
      if JumpPageBG then
        JumpPageBG:FocusUI()
      end
    end
  end
end

function M:GoToShopClick()
  local PageConfigData = DataMgr.EventPortal[self.CurActivityId]
  if not PageConfigData.EventShop then
    return
  end
  PageJumpUtils:JumpToTargetPageByJumpId(PageConfigData.EventShop)
end

function M:GoToTaskClick()
  local Params = self:MakeRewardData()
  UIManager(self):ShowCommonPopupUI(100258, Params)
end

function M:MakeRewardData()
  local Avatar = GWorld:GetAvatar()
  local TheaterData = Avatar.TheaterActivity[self.CurActivityId]
  local Params = {}
  Params.ConfigData = {}
  Params.ConfigData.TabInfo = {}
  Params.ConfigData.Items = {}
  Params.ConfigData.HasTab = true
  Params.ConfigData.Datas = {}
  local TheaterTaskData = DataMgr.TheaterTask
  local TabTypes = {
    GText("TheaterOnline_Task_Daily"),
    GText("TheaterOnline_Task_Total")
  }
  local TabNum = {}
  for i = 1, #TabTypes do
    local TabItem = {}
    TabItem.Index = i
    TabItem.Type = i
    TabItem.Title = GText(TabTypes[i])
    TabItem.IsShowIcon = true
    TabItem.ReddotName = "TheaterEventReward"
    table.insert(Params.ConfigData.TabInfo, TabItem)
    local RewardData = {}
    RewardData.ShowIcon = false
    RewardData.NowNum = 1
    RewardData.NumMax = 2
    RewardData.ReceiveAllCallBack = self.GetAllRewards
    RewardData.ReceiveAllParam = {
      DataModel = self.DataModel
    }
    RewardData.Type = TabTypes[i]
    RewardData.Text_Total = string.format(GText("UI_ModGuideBook_Task_Collecting"))
    RewardData.ReceiveButtonText = GText("UI_Archive_CollectionClaimAll")
    RewardData.Items = {}
    Params.ConfigData.Datas[i] = RewardData
    TabNum[i] = {NowNum = 0, NumMax = 0}
  end
  for TaskId, TaskInfo in pairs(TheaterData.Tasks) do
    local TaskData = TheaterTaskData[TaskId]
    local Item = {}
    Item.ItemId = TaskId
    local CurrentNum = TaskInfo.Progress
    Item.CanReceive = CurrentNum >= TaskInfo.Target
    Item.Type = TaskData.IsDaily and 1 or 2
    Item.RewardsGot = TaskInfo.RewardsGot
    Item.ReddotName = "TheaterEventReward"
    Item.NotreachText = GText("UI_Archive_CollectionInProgress")
    Item.Hint = string.format(GText("UI_Archive_CollectionTarget"), TaskInfo.Target)
    Item.Num = TaskInfo.Target
    Item.ReceiveCallBack = self.GetReward
    Item.ReceiveParm = {
      DataModel = self.DataModel
    }
    local Rewards = {}
    local RewardItemId = TaskData.RewardId
    local RewardInfo = DataMgr.Reward[RewardItemId]
    if RewardInfo then
      local Ids = RewardInfo.Id or {}
      local RewardCount = RewardInfo.Count or {}
      local TableName = RewardInfo.Type or {}
      for i = 1, #Ids do
        local ItemId = Ids[i]
        local Count = RewardUtils:GetCount(RewardCount[i])
        local Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
        local ItemType = TableName[i]
        local RewardContent = {
          ItemType = ItemType,
          ItemId = ItemId,
          Count = Count,
          Rarity = Rarity
        }
        table.insert(Rewards, RewardContent)
      end
    end
    Item.Rewards = Rewards
    table.insert(Params.ConfigData.Datas[Item.Type].Items, Item)
    TabNum[Item.Type].NowNum = TabNum[Item.Type].NowNum + (Item.CanReceive and 1 or 0)
    TabNum[Item.Type].NumMax = TabNum[Item.Type].NumMax + 1
  end
  for i = 1, #TabTypes do
    Params.ConfigData.Datas[i].NowNum = TabNum[i].NowNum
    Params.ConfigData.Datas[i].NumMax = TabNum[i].NumMax
  end
  Params.ConfigData.Type = Params.ConfigData.TabInfo[1].Type
  return Params
end

function M:GoToMoreClick()
  local Params = {
    DataMap = {
      Tabs = {}
    }
  }
  local Tabs = {
    [1] = {
      Text = GText("TheaterOnline_Game_Name"),
      TabId = 1
    },
    [2] = {
      Text = GText("TheaterOnline_Game_Interactor"),
      TabId = 2
    }
  }
  Params.TabConfigData = {
    PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self),
    LeftKey = "A",
    RightKey = "D",
    Tabs = Tabs,
    SoundFunc = function()
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
    end
  }
  local TabTypes = {
    "\228\189\142\231\186\167\229\165\150\229\138\177",
    "\233\171\152\231\186\167\229\165\150\229\138\177"
  }
  local DataMap = {}
  for i = 1, #TabTypes do
    local RewardId = DataMgr.TheaterConstant["Reward" .. i].ConstantValue
    local RewardInfo = DataMgr.Reward[RewardId]
    if RewardInfo then
      local Ids = RewardInfo.Id
      local RewardCount = RewardInfo.Count
      local TableName = RewardInfo.Type
      local RewardList = {}
      for j = 1, #Ids do
        local ItemData = {}
        ItemData.ItemId = Ids[j]
        ItemData.Count = RewardUtils:GetCount(RewardCount[j])
        ItemData.Icon = ItemUtils.GetItemIconPath(ItemData.ItemId, TableName[j])
        ItemData.Rarity = ItemUtils.GetItemRarity(ItemData.ItemId, TableName[j])
        ItemData.ItemType = TableName[j]
        table.insert(RewardList, ItemData)
      end
      if not DataMap[TabTypes[i]] then
        DataMap[TabTypes[i]] = {}
      end
      DataMap[TabTypes[i]] = RewardList
    end
  end
  Params.DataMap.Tabs[1] = DataMap
  local TheaterDonateStepData = DataMgr.TheaterDonateStep[self.CurActivityId]
  DataMap = {}
  for i = 1, #TheaterDonateStepData do
    local RewardId = TheaterDonateStepData[i].RewardViewId
    local RewardInfo = DataMgr.Reward[RewardId]
    if RewardInfo then
      local Ids = RewardInfo.Id
      local RewardCount = RewardInfo.Count
      local TableName = RewardInfo.Type
      local RewardList = {}
      for j = 1, #Ids do
        local ItemData = {}
        ItemData.ItemId = Ids[j]
        ItemData.Count = RewardUtils:GetCount(RewardCount[j])
        ItemData.Icon = ItemUtils.GetItemIconPath(ItemData.ItemId, TableName[j])
        ItemData.Rarity = ItemUtils.GetItemRarity(ItemData.ItemId, TableName[j])
        ItemData.ItemType = TableName[j]
        table.insert(RewardList, ItemData)
      end
      local TabType = string.format(GText("TheaterOnline_Donate_Step"), i)
      if not DataMap[TabType] then
        DataMap[TabType] = {}
      end
      DataMap[TabType] = RewardList
    end
  end
  Params.DataMap.Tabs[2] = DataMap
  UIManager(self):ShowCommonPopupUI(100257, Params)
end

return M
