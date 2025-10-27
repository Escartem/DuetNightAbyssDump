require("UnLua")
local EMCache = require("EMCache.EMCache")
local NormalRewardReddotName = "JJGameTask_Normal_Reddot"
local NormalTaskNewReddotName = "JJGameTask_Normal_New"
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
local TaskType = {
  Daily = {1, 2},
  Cycle = 3,
  Achievement = 4
}

function M:Construct()
  self.MidTermConst = DataMgr.MidTermGoalConstant
  self.Text_TaskScoreTodayTitle:SetText(GText("UI_Event_MidTerm_PointView"))
  self.Text_NeedScore:SetText(GText("UI_Event_MidTerm_NoPoint"))
  self.Text_NextDay:SetText(GText("UI_Event_MidTerm_Prize"))
  self.Text_GetBigReward:SetText(GText("UI_Event_MidTerm_GetPrize"))
  self.Text_TaskScoreToday_Total:SetText(self.MidTermConst.MaxPrizePoint.ConstantValue)
  self.Text_NextDay:SetText(GText("UI_Event_MidTerm_Prize"))
  self.Text_NeedScore:SetText(GText("UI_Event_MidTerm_NoPoint"))
  self.Text_BottomOneClickTitle:SetText(GText("UI_Event_MidTerm_Overflow"))
  self.Text_Empty:SetText(GText("UI_Event_MidTerm_End"))
  self.Btn_OneClickGet.Text_GetReward:SetText(GText("UI_CTL_ClaimALL"))
  self.Btn_OneClickGet.Btn_GetReward.OnClicked:Add(self, self.GetAllTaskScores)
  self.Btn_GetBigReward.OnClicked:Add(self, self.GetBigReward)
  self.TaskScroll:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.CurFocusTask = nil
  self:InitListenEvent()
  self:RefreshBaseInfo()
  self.Key_GetBigReward:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  })
  self.Btn_OneClickGet.Key_GetReward:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  self.Key_Title:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
end

function M:Destruct()
  self.Btn_GetBigReward.OnClicked:Clear()
  self.Btn_OneClickGet.Btn_GetReward.OnClicked:Clear()
  self:UnbindFromAnimationFinished(self.Percent, {
    self,
    function()
      self:PlayAnimation(self.Percent_VX)
    end
  })
end

function M:Init(Params)
  self.Params = Params
  self.Owner = Params.Owner
  self.EventDay = Params.EventDay
  self.EventEndTime = Params.EventEndTime
  self._Avatar = GWorld:GetAvatar()
  self.MidTermTask = self._Avatar.MidTermTasks
  self.MidTermTasksRecord = self._Avatar.MidTermTasksRecord
  self.MidTermAchvProgressRewarded = self._Avatar.MidTermAchvProgressRewarded
  self.MidTermScores = self._Avatar.MidTermScores
  self.MidTermScoresRewards = self._Avatar.MidTermScoresRewards
  self.MidTermGoalEventId = self.MidTermConst.MidTermGoalEventId.ConstantValue
  self.RewardEndTime = DataMgr.EventMain[self.MidTermGoalEventId].RewardEndTime
  if CommonUtils.Size(self.MidTermScoresRewards) > 0 then
    self.Group_Score:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Group_Progress:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:TryIncreaceNormalRewardReddot("ScoresRewards")
    if TimeUtils.NowTime() > self.EventEndTime then
      self.Text_BigRewardTitle:SetText(GText("UI_Event_MidTerm_Settled_End"))
    else
      self.Text_BigRewardTitle:SetText(GText("UI_Event_MidTerm_Settled"))
    end
    self.YesterdayRewardGot = false
    self:InitYesterdayRewardList()
    self.Btn_OneClickGet.Btn_GetReward:SetForbidden(true)
    self.Btn_OneClickGet.Key_GetReward:SetForbidKey(true)
    self:PlayAnimation(self.VX_Reminder)
  else
    self.Group_Score:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Group_Progress:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_BigRewardTitle:SetText(GText("UI_Event_MidTerm_NormalPreview"))
    self.YesterdayRewardGot = true
    self.Btn_OneClickGet.Btn_GetReward:SetForbidden(false)
    self.Btn_OneClickGet.Key_GetReward:SetForbidKey(false)
  end
  self:UpdateTaskScoreToday(self.MidTermScores)
  self:InitTaskList()
  self:PlayAnimation(self.In)
  if TimeUtils.NowTime() > self.EventEndTime then
    self:TryClearNormalTaskRewardReddot()
    self.WS_Right:SetActiveWidgetIndex(1)
    if self.YesterdayRewardGot or TimeUtils.NowTime() > self.RewardEndTime then
      self:TryClearNormalRewardReddot()
      self.WS_Btn:SetActiveWidgetIndex(1)
      self.Text_NeedScore:SetText(GText("UI_Event_MidTerm_PrizeEnd"))
      for _, Item in pairs(self.List_BigReward:GetListItems()) do
        Item.bShadow = true
        Item.BonusType = nil
      end
      self.List_BigReward:RegenerateAllEntries()
    end
  end
  self:SetFocus()
end

function M:TryIncreaceNormalRewardReddot(Key)
  local CacheKey = NormalRewardReddotName .. Key
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(NormalRewardReddotName)
  if CacheData and nil == CacheData[CacheKey] then
    CacheData[CacheKey] = true
    ReddotManager.IncreaseLeafNodeCount(NormalRewardReddotName)
  end
end

function M:TrySubNormalRewardReddot(Key)
  local CacheKey = NormalRewardReddotName .. Key
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(NormalRewardReddotName)
  if CacheData and CacheData[CacheKey] then
    CacheData[CacheKey] = nil
    ReddotManager.DecreaseLeafNodeCount(NormalRewardReddotName)
  end
end

function M:TryClearNormalRewardReddot()
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(NormalRewardReddotName)
  if CacheData then
    for key, _ in pairs(CacheData) do
      CacheData[key] = nil
    end
  end
  ReddotManager.ClearLeafNodeCount(NormalRewardReddotName)
end

function M:TryClearNormalTaskRewardReddot()
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(NormalRewardReddotName)
  if CacheData then
    for TaskId, Task in pairs(self._Avatar.MidTermTasks) do
      local TaskData = DataMgr.MidTermTask[Task.UniqueID]
      if not TaskData then
        Utils.ScreenPrint("MidTermTask\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168UniqueID\228\184\186" .. Task.UniqueID .. "\231\154\132\228\187\187\229\138\161\239\188\140\232\175\183\230\163\128\230\159\165\233\133\141\231\189\174")
      elseif TaskData.TaskType ~= TaskType.Achievement then
        local TaskCacheKey = NormalRewardReddotName .. Task.UniqueID
        if CacheData[TaskCacheKey] then
          CacheData[TaskCacheKey] = nil
          ReddotManager.DecreaseLeafNodeCount(NormalRewardReddotName)
        end
      end
    end
  end
end

function M:TrySubNormalTaskNewReddot(TaskId)
  local CacheKey = TaskId
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(NormalTaskNewReddotName)
  if CacheData and CacheData[CacheKey] then
    CacheData[CacheKey] = false
    ReddotManager.DecreaseLeafNodeCount(NormalTaskNewReddotName)
  end
end

function M:UpdateTaskScoreToday(MidTermScores)
  local MidTermScores = self._Avatar.MidTermScores
  self.Text_TaskScoreToday:SetText(MidTermScores)
  if IsValid(self.Owner.Owner) then
    self.Owner.Owner.Text_TaskScoreToday:SetText(MidTermScores)
  end
  local MaxPrizePoint = self.MidTermConst.MaxPrizePoint.ConstantValue
  local previousScore = (self.previousProgressPercent or 0) * MaxPrizePoint
  local shouldPlayToMax = false
  if MaxPrizePoint > previousScore and MidTermScores > MaxPrizePoint then
    shouldPlayToMax = true
  end
  if MidTermScores <= MaxPrizePoint or shouldPlayToMax then
    if not self.previousProgressPercent then
      self.previousProgressPercent = 0
    end
    local targetScore = shouldPlayToMax and MaxPrizePoint or MidTermScores
    local progressPercent = targetScore / MaxPrizePoint
    progressPercent = math.max(0, math.min(1, progressPercent))
    local startTime = self.previousProgressPercent * self.Percent:GetEndTime()
    local animationTime = progressPercent * self.Percent:GetEndTime()
    if 0 == animationTime then
      animationTime = 0.001
    end
    if startTime >= animationTime then
      startTime = animationTime - 0.001
    end
    self:PlayAnimationTimeRange(self.Percent, startTime, animationTime)
    if shouldPlayToMax then
      self:BindToAnimationFinished(self.Percent, {
        self,
        function()
          self:PlayAnimation(self.Percent_VX)
          self.previousProgressPercent = 1.0
          self:AddTimer(0.1, function()
            self:UpdateTaskScoreToday(MidTermScores)
          end)
        end
      })
    else
      self:BindToAnimationFinished(self.Percent, {
        self,
        function()
          self:PlayAnimation(self.Percent_VX)
        end
      })
    end
    if not shouldPlayToMax then
      self.previousProgressPercent = progressPercent
    end
  end
  if self.YesterdayRewardGot then
    self:UpdateRewardList(MidTermScores)
  end
  self:UpdateBtnState(MidTermScores)
end

function M:InitTaskList()
  self:UpdateNormalTaskList()
  self:UpdateCycleTaskList()
  self:UpdateOneClickBtnState()
end

function M:UpdateNormalTaskList()
  local NormalTaskConfig = {
    Name = "UI_Event_MidTerm_DailyTask",
    TaskType = TaskType.Daily,
    YesterdayRewardGot = self.YesterdayRewardGot,
    Owner = self
  }
  self.NormalItem:Init(NormalTaskConfig)
end

function M:UpdateCycleTaskList()
  local CycleTaskConfig = {
    Name = "UI_Event_MidTerm_RepeatTask",
    MidTermTasksRecord = self.MidTermTasksRecord,
    TaskType = TaskType.Cycle,
    YesterdayRewardGot = self.YesterdayRewardGot,
    Owner = self
  }
  self.CycleItem:Init(CycleTaskConfig)
end

function M:InitYesterdayRewardList()
  self.List_BigReward:ClearListItems()
  for RewardId, Count in pairs(self.MidTermScoresRewards) do
    local RewardConfig = DataMgr.Reward[RewardId]
    for j, ResourceId in ipairs(RewardConfig.Id) do
      local ResourceConfig = DataMgr.Resource[ResourceId]
      local RewardIcon = ItemUtils.GetItemIconPath(ResourceId, CommonConst.ItemType.Resource)
      local RewardContent = self:NewItemContent(RewardConfig.Type[1], ResourceId, RewardIcon, ResourceConfig.Rarity or 1, RewardConfig.Count[j][1] * Count)
      self.List_BigReward:AddItem(RewardContent)
    end
  end
end

function M:UpdateRewardList(TaskScoreToday)
  self.List_BigReward:ClearListItems()
  local RewardContentList = {}
  if TaskScoreToday <= self.MidTermConst.MaxPrizePoint.ConstantValue then
    local RewardId = self.MidTermConst.BaseRewardId.ConstantValue
    local Ratio = TaskScoreToday / self.MidTermConst.MaxPrizePoint.ConstantValue
    local RewardConfig = DataMgr.Reward[RewardId]
    for j, ResourceId in ipairs(RewardConfig.Id) do
      local ResourceConfig = DataMgr.Resource[ResourceId]
      local RewardIcon = ItemUtils.GetItemIconPath(ResourceId, CommonConst.ItemType.Resource)
      local RewardContent = self:NewItemContent(RewardConfig.Type[1], ResourceId, RewardIcon, ResourceConfig.Rarity or 1, RewardConfig.Count[j][1] * Ratio)
      table.insert(RewardContentList, RewardContent)
    end
  else
    local MaxPrizePoint = self.MidTermConst.MaxPrizePoint.ConstantValue
    local OverflowScore = TaskScoreToday - MaxPrizePoint
    local OverflowRatio = OverflowScore / MaxPrizePoint
    local OFRewardId = self.MidTermConst.OFRewardId.ConstantValue
    local OFRewardConfig = DataMgr.Reward[OFRewardId]
    for j, ResourceId in ipairs(OFRewardConfig.Id) do
      local ResourceConfig = DataMgr.Resource[ResourceId]
      local RewardIcon = ItemUtils.GetItemIconPath(ResourceId, CommonConst.ItemType.Resource)
      local RewardContent = self:NewItemContent(OFRewardConfig.Type[1], ResourceId, RewardIcon, ResourceConfig.Rarity or 1, OFRewardConfig.Count[j][1] * OverflowRatio)
      RewardContent.BonusType = 1
      table.insert(RewardContentList, RewardContent)
    end
    local BaseRewardId = self.MidTermConst.BaseRewardId.ConstantValue
    local BaseRewardConfig = DataMgr.Reward[BaseRewardId]
    for j, ResourceId in ipairs(BaseRewardConfig.Id) do
      local ResourceConfig = DataMgr.Resource[ResourceId]
      local RewardIcon = ItemUtils.GetItemIconPath(ResourceId, CommonConst.ItemType.Resource)
      local RewardContent = self:NewItemContent(BaseRewardConfig.Type[1], ResourceId, RewardIcon, ResourceConfig.Rarity or 1, BaseRewardConfig.Count[j][1])
      table.insert(RewardContentList, RewardContent)
    end
  end
  for _, ItemContent in ipairs(RewardContentList) do
    self.List_BigReward:AddItem(ItemContent)
  end
end

function M:UpdateBtnState(TaskScoreToday)
  if not self.YesterdayRewardGot then
    self.WS_Btn:SetActiveWidgetIndex(0)
    return
  end
  if 0 == TaskScoreToday then
    self.WS_Btn:SetActiveWidgetIndex(1)
  elseif self.NeedTorrow then
    self.WS_Btn:SetActiveWidgetIndex(2)
  else
    self.WS_Btn:SetActiveWidgetIndex(3)
  end
end

function M:UpdateOneClickBtnState()
  local canReceive = false
  
  local function checkTaskItemCanReceive(TaskItem)
    if not (TaskItem and TaskItem.TaskProp) or not TaskItem.TaskConfig then
      return false
    end
    local taskProp = TaskItem.TaskProp
    local taskType = TaskItem.TaskConfig.TaskType
    if type(TaskType.Daily) == "table" and (taskType == TaskType.Daily[1] or taskType == TaskType.Daily[2]) then
      return taskProp.Progress >= taskProp.Target and not taskProp.RewardsGot
    end
    if taskType == TaskType.Cycle then
      local record = self._Avatar and self._Avatar.MidTermTasksRecord and self._Avatar.MidTermTasksRecord[taskProp.UniqueID]
      return record and record.FinishCount and record.FinishCount > 0
    end
    return false
  end
  
  if self.NormalItem and self.NormalItem.TaskContentList then
    for _, TaskItem in pairs(self.NormalItem.TaskContentList) do
      if checkTaskItemCanReceive(TaskItem) then
        canReceive = true
        break
      end
    end
  end
  if not canReceive and self.CycleItem and self.CycleItem.TaskContentList then
    for _, TaskItem in pairs(self.CycleItem.TaskContentList) do
      if checkTaskItemCanReceive(TaskItem) then
        canReceive = true
        break
      end
    end
  end
  if canReceive then
    if self.YesterdayRewardGot then
      self.Btn_OneClickGet.Btn_GetReward:SetForbidden(false)
      self.Btn_OneClickGet.Key_GetReward:SetForbidKey(false)
    end
    if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
      self.Owner.Com_Tab:UpdateBottomKeyInfo({
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "SpaceBar",
              ClickCallback = self.GetAllTaskScores,
              Owner = self
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "Y",
              ClickCallback = self.GetAllTaskScores
            }
          },
          Desc = GText("UI_CTL_ClaimALL"),
          bLongPress = false
        },
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Escape",
              ClickCallback = self.CloseSelf,
              Owner = self
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              ClickCallback = self.CloseSelf
            }
          },
          Desc = GText("UI_BACK"),
          bLongPress = false
        }
      })
    end
  else
    self.Btn_OneClickGet.Btn_GetReward:SetForbidden(true)
    self.Btn_OneClickGet.Key_GetReward:SetForbidKey(true)
    if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
      self.Owner.Com_Tab:UpdateBottomKeyInfo({
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Escape",
              ClickCallback = self.CloseSelf,
              Owner = self
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              ClickCallback = self.CloseSelf
            }
          },
          Desc = GText("UI_BACK"),
          bLongPress = false
        }
      })
    end
  end
end

function M:GetBigReward()
  AudioManager(self):PlayUISound(self, "event:/ui/activity/wenmingboyi_all_btn_click", nil, nil)
  
  local function Cb(ErrCode, Ret)
    DebugPrint("GetBigReward", ErrorCode:Name(ErrCode))
    if ErrCode == ErrorCode.RET_SUCCESS then
      self.YesterdayRewardGot = true
      self:UpdateTaskScoreToday(self._Avatar.MidTermScores)
      self:TrySubNormalRewardReddot("ScoresRewards")
      UIManager(GWorld.GameInstance):LoadUI(UIConst.LoadInConfig, "GetItemPage", nil, nil, nil, nil, Ret, self.OnGetItemPageClosed, self)
    else
      local ErrorCodeData = DataMgr.ErrorCode[ErrCode]
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText(ErrorCodeData.ErrorCodeContent))
    end
    self.Owner:BlockAllUIInput(false)
  end
  
  self.Owner:BlockAllUIInput(true)
  self._Avatar:MidTermGetScoresRewards(Cb)
end

function M:OnGetItemPageClosed()
  local FocusedTask = self.CurFocusTask or self.NormalItem.List_Task:GetItemAt(0) or self.CycleItem.List_Task:GetItemAt(0)
  if FocusedTask.TaskType == TaskType.Cycle then
    self.CycleItem.List_Task:BP_NavigateToItem(FocusedTask)
  else
    self.NormalItem.List_Task:BP_NavigateToItem(FocusedTask)
  end
  self.Group_Score:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Group_Progress:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:InitTaskList()
  if TimeUtils.NowTime() > self.EventEndTime then
    self:TryClearNormalRewardReddot()
    self.WS_Btn:SetActiveWidgetIndex(1)
    self.Text_NeedScore:SetText(GText("UI_Event_MidTerm_PrizeEnd"))
    for _, Item in pairs(self.List_BigReward:GetListItems()) do
      Item.bShadow = true
      Item.BonusType = nil
    end
    self.List_BigReward:RegenerateAllEntries()
  end
end

function M:GetAllTaskScores()
  if self.Btn_OneClickGet.Btn_GetReward:GetForbidden() then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/activity/wenmingboyi_all_btn_click", nil, nil)
  
  local function Cb(ErrCode, Ret)
    DebugPrint("GetAllTaskScores", ErrorCode:Name(ErrCode))
    if ErrCode == ErrorCode.RET_SUCCESS then
      self:UpdateNormalTaskList()
      self:UpdateCycleTaskList()
      self:UpdateTaskScoreToday(self._Avatar.MidTermScores)
      self:UpdateOneClickBtnState()
      self:TryClearNormalTaskRewardReddot()
      self:PlayAnimation(self.Up)
      AudioManager(self):PlayUISound(self, "event:/ui/activity/wenmingboyi_jiaojiao_score_add", nil, nil)
    end
    self.Owner:BlockAllUIInput(false)
  end
  
  self.Owner:BlockAllUIInput(true)
  self._Avatar:MidTermGetAllNormalScores(Cb)
end

function M:NewItemContent(ItemType, ItemId, Icon, Rarity, Count, Quantity, OpenFunction)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.ItemType = ItemType
  Obj.ItemId = ItemId
  Obj.UnitId = ItemId
  Obj.Rarity = Rarity
  Obj.Icon = Icon
  Obj.IsShowDetails = true
  Obj.OnMenuOpenChangedEvents = {Obj = self, Callback = OpenFunction}
  Obj.UIName = "ActivityJJGameNormalTask"
  Obj.Count = Count
  return Obj
end

function M:OnAchvFinished(TaskId)
  if self.NormalItem and self.NormalItem.OnAchvFinished then
    self.NormalItem:OnAchvFinished(TaskId)
  end
  if self.CycleItem and self.CycleItem.OnAchvFinished then
    self.CycleItem:OnAchvFinished(TaskId)
  end
  self:UpdateOneClickBtnState()
  self:TryIncreaceNormalRewardReddot(TaskId)
end

function M:OnMidTermTaskProgressChange(TaskId, Progress)
  if self.NormalItem and self.NormalItem.OnMidTermTaskProgressChange then
    self.NormalItem:OnMidTermTaskProgressChange(TaskId, Progress)
  end
  if self.CycleItem and self.CycleItem.OnMidTermTaskProgressChange then
    self.CycleItem:OnMidTermTaskProgressChange(TaskId, Progress)
  end
  self:UpdateOneClickBtnState()
end

function M:OnTaskGet(Item)
  Item.Content.CanGet = false
  if Item.Content.TaskType == TaskType.Cycle then
    Item.WS_Btn:SetActiveWidgetIndex(1)
    Item:UpdateInfinityNum(self._Avatar.MidTermTasksRecord[Item.TaskId].FinishCount)
  else
    Item.WS_Btn:SetActiveWidgetIndex(3)
    Item:PlayAnimation(Item.In_Got)
  end
  local currentScore = self._Avatar.MidTermScores
  self:UpdateTaskScoreToday(currentScore)
  self:UpdateOneClickBtnState()
  self:TrySubNormalRewardReddot(Item.TaskProp.UniqueID)
  self:TrySubNormalTaskNewReddot(Item.TaskProp.UniqueID)
  Item.New:SetVisibility(UIConst.VisibilityOp.Hidden)
  self:AddTimer(0.1, function()
    AudioManager(self):PlayUISound(self, "event:/ui/activity/wenmingboyi_jiaojiao_score_add", nil, nil)
    self:PlayAnimation(self.Up)
  end)
end

function M:InitListenEvent()
  local PlayerController = self:GetOwningPlayer()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
  self:InitNavigationRules()
end

function M:RefreshBaseInfo()
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurGamepadName = CurGamepadName
  local IsUseGamepad = CurInputDevice == ECommonInputType.Gamepad
  if IsUseGamepad then
    self.Key_GetBigReward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_OneClickGet.Key_GetReward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_Title:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_GetBigReward:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_OneClickGet.Key_GetReward:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Title:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.CurInputDevice = CurInputDevice
end

function M:InitNavigationRules()
  self.NormalItem:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.NormalItem:SetNavigationRuleExplicit(EUINavigation.Down, self.CycleItem)
  self.CycleItem:SetNavigationRuleExplicit(EUINavigation.Up, self.NormalItem)
  self.CycleItem:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.CycleItem:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.List_BigReward:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.List_BigReward:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
end

function M:BP_GetDesiredFocusTarget()
  if self.CurFocusTask ~= nil then
    return self.CurFocusTask.SelfWidget
  elseif self.NormalItem.List_Task:GetItemAt(0) then
    return self.NormalItem.List_Task:GetItemAt(0).SelfWidget
  elseif self.CycleItem.List_Task:GetItemAt(0) then
    return self.CycleItem.List_Task:GetItemAt(0).SelfWidget
  else
    return nil
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = true
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  elseif "Escape" == InKeyName then
    IsEventHandled = false
  elseif "Q" == InKeyName then
    IsEventHandled = false
  elseif "E" == InKeyName then
    IsEventHandled = false
  elseif "SpaceBar" == InKeyName then
    self:GetAllTaskScores()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = true
  if "Gamepad_LeftThumbstick" == InKeyName then
    self.List_BigReward:SetFocus()
    self.IsFocusBigReward = true
  elseif InKeyName == Const.GamepadFaceButtonUp then
    self:GetAllTaskScores()
  elseif InKeyName == Const.GamepadFaceButtonLeft then
    IsEventHandled = false
    self:GetBigReward()
  elseif InKeyName == Const.GamepadFaceButtonRight then
    if self.IsFocusBigReward then
      local FocusedTask = self.CurFocusTask or self.NormalItem.List_Task:GetItemAt(0) or self.CycleItem.List_Task:GetItemAt(0)
      if not FocusedTask then
        return
      end
      if FocusedTask.TaskType == TaskType.Cycle then
        self.CycleItem.List_Task:BP_NavigateToItem(FocusedTask)
      else
        self.NormalItem.List_Task:BP_NavigateToItem(FocusedTask)
      end
    else
      IsEventHandled = false
    end
  elseif InKeyName == Const.GamepadLeftShoulder then
    IsEventHandled = false
  elseif InKeyName == Const.GamepadRightShoulder then
    IsEventHandled = false
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
end

return M
