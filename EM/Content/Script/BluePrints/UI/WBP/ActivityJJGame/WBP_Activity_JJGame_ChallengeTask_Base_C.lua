require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
local ChallengeRewardReddotName = "JJGameTask_Challenge_Reddot"
local ChallengeTaskNewReddotName = "JJGameTask_Challenge_New"
local TaskType = {
  Daily = {1, 2},
  Cycle = 3,
  Achievement = 4
}

function M:Construct()
  self.MidTermConst = DataMgr.MidTermGoalConstant
  self.AchievementRewardPoint = self.MidTermConst.AchievementRewardPoint.ConstantValue
  self.MidTermGoalEventId = self.MidTermConst.MidTermGoalEventId.ConstantValue
  self.AchievementPrize = DataMgr.AchievementPrize
  self.Text_Empty:SetText(GText("UI_Event_MidTerm_End"))
  self.Text_TaskScoreTodayTitle:SetText(GText("UI_Event_MidTerm_ChallengePoint"))
  self.Text_TaskScoreToday_Total:SetText(self.MidTermConst.MaxPrizePoint.ConstantValue)
  self.Text_TaskScoreToday_Total:SetText(50)
  self.Btn_OneClickGet.Text_GetReward:SetText(GText("UI_CTL_ClaimALL"))
  self.Btn_OneClickGet.Btn_GetReward.OnClicked:Add(self, self.GetAllTaskScores)
  self.Btn_Score.OnClicked:Add(self, function()
    AudioManager(self):PlayUISound(self, "event:/ui/activity/wenmingboyi_challenge_btn_click", nil, nil)
    local Params = {
      Count = self.Count,
      Index = self.Index,
      ActivityId = self.MidTermGoalEventId,
      BackFocusWidget = self.List_Challenge,
      OnCloseCallbackFunction = function()
        self.List_Challenge:SetFocus()
      end
    }
    UIManager(self):ShowCommonPopupUI(100101, Params, self)
  end)
  self._Avatar = GWorld:GetAvatar()
  self:InitListenEvent()
  self:RefreshBaseInfo()
  self.List_Challenge:SetScrollBarVisibility(UIConst.VisibilityOp.Hidden)
  self.List_Challenge:SetControlScrollbarInside(true)
  self.CurFocusTask = nil
end

function M:Destruct()
  if self.HasNewTask then
    self:TryClearChallengeTaskNewReddot()
  end
  self.Btn_OneClickGet.Btn_GetReward.OnClicked:Clear()
end

function M:Init(Params)
  self.Params = Params
  self.Owner = Params.Owner
  self.EventDay = Params.EventDay
  self._Avatar = GWorld:GetAvatar()
  self.MidTermTask = self._Avatar.MidTermTasks
  self.MidTermAchvProgressRewarded = self._Avatar.MidTermAchvProgressRewarded
  self.EventEndTime = Params.EventEndTime
  self:InitTaskList()
  self:InitChallengeScoreItem()
  self.ChallengeTaskScore = self:CalChallengeTaskScore()
  self:UpdateChallengeTaskScore(self.ChallengeTaskScore)
  self:PlayAnimation(self.In)
  if Params.RemainDays ~= false then
    self.Text_BottomOneClickTitle:SetText(string.format(GText("UI_Event_MidTerm_NewChallenge"), Params.RemainDays, Params.RemainHours))
  else
    self.Text_BottomOneClickTitle:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if TimeUtils.NowTime() > self.EventEndTime then
    self:ClearChallengeReddot()
    self.WS_Right:SetActiveWidgetIndex(1)
  end
  if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
    self.Key_TitleScore:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "X"}
      }
    })
  end
  self.Btn_OneClickGet.Key_GetReward:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  self:SetFocus()
end

function M:CalChallengeTaskScore()
  local completedTaskCount = 0
  for _, taskItem in pairs(self.ChallengeTaskList) do
    if taskItem.TaskProp.RewardsGot then
      completedTaskCount = completedTaskCount + 1
    end
  end
  return completedTaskCount * self.AchievementRewardPoint
end

function M:UpdateChallengeTaskScore(TaskScoreToday)
  self.Text_TaskScoreToday:SetText(TaskScoreToday)
  self:UpdateChallengeScoreItem(TaskScoreToday)
end

function M:InitTaskList()
  self:UpdateChallengeTaskList()
  self:UpdateOneClickBtnState()
end

function M:UpdateChallengeTaskList()
  self.List_Challenge:ClearListItems()
  self.ChallengeTaskList = {}
  local SortedTaskList = self:SortTaskList(self._Avatar.MidTermTasks)
  for i, Task in pairs(SortedTaskList) do
    local TaskData = DataMgr.MidTermTask[Task.UniqueID]
    if not TaskData then
      print("TaskData is nil, Task.UniqueID = ", Task.UniqueID)
      Utils.ScreenPrint("MidTermTask\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168UniqueID\228\184\186" .. Task.UniqueID .. "\231\154\132\228\187\187\229\138\161\239\188\140\232\175\183\230\163\128\230\159\165\233\133\141\231\189\174")
    elseif TaskData.EnableDay > self.EventDay then
    else
      local TaskItem
      if TaskData.TaskType == TaskType.Achievement then
        TaskItem = self:NewItemContent(TaskData.TaskType, TaskData.TaskId, self.MidTermConst.AchievementRewardPoint.ConstantValue, TaskData.TaskDes)
      end
      if TaskItem then
        TaskItem.TaskProp = Task
        TaskItem.TaskConfig = TaskData
        self.List_Challenge:AddItem(TaskItem)
        table.insert(self.ChallengeTaskList, TaskItem)
      end
    end
  end
  self.List_Challenge:RequestPlayEntriesAnim()
  self.List_Challenge:SetFocus()
  self:TryIncreaceChallengeTaskNewReddot()
end

function M:SortTaskList(TaskList)
  local UncompletedTasks = {}
  local CompletedTasks = {}
  for k, v in pairs(TaskList) do
    local taskKey = tonumber(k)
    if v.RewardsGot then
      table.insert(CompletedTasks, {key = taskKey, value = v})
    else
      table.insert(UncompletedTasks, {key = taskKey, value = v})
    end
  end
  table.sort(UncompletedTasks, function(a, b)
    return a.key < b.key
  end)
  table.sort(CompletedTasks, function(a, b)
    return a.key < b.key
  end)
  local result = {}
  for _, pair in ipairs(UncompletedTasks) do
    table.insert(result, pair.value)
  end
  for _, pair in ipairs(CompletedTasks) do
    table.insert(result, pair.value)
  end
  return result
end

function M:TryIncreaceChallengeTaskNewReddot()
  for _, TaskItem in pairs(self.ChallengeTaskList) do
    local CacheKey = TaskItem.TaskProp.UniqueID
    local CacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeTaskNewReddotName)
    if CacheData and nil == CacheData[CacheKey] then
      CacheData[CacheKey] = true
      ReddotManager.IncreaseLeafNodeCount(ChallengeTaskNewReddotName)
    end
    if CacheData and true == CacheData[CacheKey] then
      self.HasNewTask = true
    end
  end
end

function M:TryClearChallengeTaskNewReddot()
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeTaskNewReddotName)
  if CacheData then
    for key, _ in pairs(CacheData) do
      CacheData[key] = false
    end
  end
  ReddotManager.ClearLeafNodeCount(ChallengeTaskNewReddotName)
  self.HasNewTask = false
end

function M:InitChallengeScoreItem()
  for Count, RewardId in pairs(self.AchievementPrize) do
    local Index = math.floor(Count / 10)
    local Params = {
      Owner = self,
      Count = Count,
      Index = Index,
      RewardId = RewardId,
      CanGet = self.MidTermAchvProgressRewarded[Count] and true or false,
      IsReceived = 1 == self.MidTermAchvProgressRewarded[Count],
      CacheKey = "ChallengeScoreItem" .. Count
    }
    self["ChallengeScoreItem_" .. Index]:Init(Params)
  end
end

function M:TryIncreaceChallengeRewardReddot(Count)
  local CacheKey = "ChallengeScoreItem" .. Count
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeRewardReddotName)
  if CacheData and nil == CacheData[CacheKey] then
    CacheData[CacheKey] = true
    ReddotManager.IncreaseLeafNodeCount(ChallengeRewardReddotName)
  end
end

function M:TrySubChallengeRewardReddot(Target)
  local CacheKey = "ChallengeScoreItem" .. Target
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeRewardReddotName)
  if CacheData and CacheData[CacheKey] then
    CacheData[CacheKey] = nil
    ReddotManager.DecreaseLeafNodeCount(ChallengeRewardReddotName)
  end
end

function M:TryIncreaceChallengeTaskRewardReddot(TaskId)
  local CacheKey = ChallengeRewardReddotName .. TaskId
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeRewardReddotName)
  if CacheData and nil == CacheData[CacheKey] then
    CacheData[CacheKey] = true
    ReddotManager.IncreaseLeafNodeCount(ChallengeRewardReddotName)
  end
end

function M:TrySubChallengeTaskRewardReddot(TaskId)
  local CacheKey = ChallengeRewardReddotName .. TaskId
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeRewardReddotName)
  if CacheData and CacheData[CacheKey] then
    CacheData[CacheKey] = nil
    ReddotManager.DecreaseLeafNodeCount(ChallengeRewardReddotName)
  end
end

function M:TrySubChallengeTaskNewReddot(TaskId)
  local CacheKey = TaskId
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeTaskNewReddotName)
  if CacheData and CacheData[CacheKey] then
    CacheData[CacheKey] = false
    ReddotManager.DecreaseLeafNodeCount(ChallengeTaskNewReddotName)
  end
end

function M:UpdateChallengeScoreItem(TaskScoreToday)
  local RewardCanGet = false
  for Count, RewardId in pairs(self.AchievementPrize) do
    local Index = math.floor(Count / 10)
    local Item = self["ChallengeScoreItem_" .. Index]
    if Count <= TaskScoreToday then
      if 1 == self._Avatar.MidTermAchvProgressRewarded[Count] then
        Item:StopAnimation(Item.Reward)
        Item:PlayAnimation(Item.Recived)
      else
        Item:StopAnimation(Item.Forbidden)
        Item:PlayAnimation(Item.In_Reward)
        Item:PlayAnimation(Item.Reward, 0, 0)
        Item.CanGet = true
        RewardCanGet = true
        self:TryIncreaceChallengeRewardReddot(Count)
      end
    else
      Item:PlayAnimation(Item.Forbidden)
    end
  end
  self.RewardCanGet = RewardCanGet
  if self.RewardCanGet then
    if self.CurInputDevice == ECommonInputType.Gamepad then
      self.Text_TaskScoreTodayTitle:SetText(GText("UI_Event_MidTerm_GetPrize"))
    end
  elseif self.CurInputDevice == ECommonInputType.Gamepad then
    self.Text_TaskScoreTodayTitle:SetText(GText("UI_Event_MidTerm_GotoPreview"))
  end
end

function M:UpdateOneClickBtnState()
  local canReceive = false
  
  local function checkTaskItemCanReceive(TaskItem)
    if not TaskItem or not TaskItem.TaskProp then
      return false
    end
    local taskProp = TaskItem.TaskProp
    return taskProp.Progress >= taskProp.Target and not taskProp.RewardsGot
  end
  
  if self.ChallengeTaskList then
    for _, TaskItem in pairs(self.ChallengeTaskList) do
      if checkTaskItemCanReceive(TaskItem) then
        canReceive = true
        break
      end
    end
  end
  if canReceive then
    self.Btn_OneClickGet.Btn_GetReward:SetForbidden(false)
    self.Btn_OneClickGet.Key_GetReward:SetForbidKey(false)
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
  self.canReceive = canReceive
end

function M:GetAllTaskScores()
  if self.Btn_OneClickGet.Btn_GetReward:GetForbidden() then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/activity/wenmingboyi_all_btn_click", nil, nil)
  
  local function Cb(ErrCode, Ret)
    DebugPrint("GetAllChallengeTaskScores", ErrorCode:Name(ErrCode))
    if ErrCode == ErrorCode.RET_SUCCESS then
      self:UpdateChallengeTaskList()
      self.ChallengeTaskScore = self:CalChallengeTaskScore()
      self:UpdateChallengeTaskScore(self.ChallengeTaskScore)
      self:UpdateOneClickBtnState()
      self:ClearChallengeTaskReddot()
      if self.ChallengeTaskList then
        for _, TaskItem in pairs(self.ChallengeTaskList) do
          if TaskItem.TaskProp and TaskItem.TaskProp.RewardsGot then
            self:TrySubChallengeTaskRewardReddot(TaskItem.TaskProp.UniqueID)
          end
        end
      end
      self:PlayAnimation(self.Up)
      AudioManager(self):PlayUISound(self, "event:/ui/activity/wenmingboyi_challenge_score_add", nil, nil)
    end
    self.Owner:BlockAllUIInput(false)
  end
  
  self.Owner:BlockAllUIInput(true)
  self._Avatar:MidTermGetAllAchvScores(Cb)
end

function M:NewItemContent(TaskType, TaskId, TaskPoint, TaskDes)
  local ItemContent = NewObject(UIUtils.GetCommonItemContentClass())
  ItemContent.Owner = self
  ItemContent.TaskType = TaskType
  ItemContent.TaskId = TaskId
  ItemContent.Point = TaskPoint
  ItemContent.Desc = TaskDes
  return ItemContent
end

function M:OnAchvFinished(TaskId)
  if not self.ChallengeTaskList then
    return
  end
  for _, TaskItem in pairs(self.ChallengeTaskList) do
    if TaskItem.SelfWidget and TaskItem.SelfWidget.OnAchvFinished then
      TaskItem.SelfWidget:OnAchvFinished(TaskId)
    end
  end
  self:UpdateOneClickBtnState()
end

function M:OnMidTermTaskProgressChange(TaskId, Progress)
  if not self.ChallengeTaskList then
    return
  end
  for _, TaskItem in pairs(self.ChallengeTaskList) do
    if TaskItem.SelfWidget and TaskItem.SelfWidget.OnMidTermTaskProgressChange then
      TaskItem.SelfWidget:OnMidTermTaskProgressChange(TaskId, Progress)
    end
  end
  self:UpdateOneClickBtnState()
end

function M:OnTaskGet(Item)
  Item.WS_Btn:SetActiveWidgetIndex(3)
  Item:PlayAnimation(Item.In_Got)
  Item.Content.CanGet = false
  self.ChallengeTaskScore = self:CalChallengeTaskScore()
  self:TrySubChallengeTaskRewardReddot(Item.TaskProp.UniqueID)
  self:TrySubChallengeTaskNewReddot(Item.TaskProp.UniqueID)
  Item.New:SetVisibility(UIConst.VisibilityOp.Hidden)
  self:UpdateChallengeTaskScore(self.ChallengeTaskScore)
  self:UpdateOneClickBtnState()
  self:AddTimer(0.1, function()
    AudioManager(self):PlayUISound(self, "event:/ui/activity/wenmingboyi_challenge_score_add", nil, nil)
    self:PlayAnimation(self.Up)
  end)
end

function M:OnChallengeRewardGet()
  local function Callback(ErrCode, Ret)
    if ErrCode == ErrorCode.RET_SUCCESS then
      UIManager(GWorld.GameInstance):LoadUI(UIConst.LoadInConfig, "GetItemPage", nil, nil, nil, nil, Ret, function()
        self:AddTimer(0.1, function()
          local FocusedTask = self.CurFocusTask or self.List_Challenge:GetItemAt(0)
          
          self.List_Challenge:BP_NavigateToItem(FocusedTask)
        end)
      end)
      self:UpdateChallengeScoreItem(self:CalChallengeTaskScore())
      self:ClearChallengeReddot()
    else
      local Params = {
        Count = self.Count,
        Index = self.Index,
        ActivityId = self.MidTermGoalEventId,
        BackFocusWidget = self.List_Challenge,
        OnCloseCallbackFunction = function()
          self:AddTimer(0.1, function()
            local FocusedTask = self.CurFocusTask or self.List_Challenge:GetItemAt(0)
            self.List_Challenge:BP_NavigateToItem(FocusedTask)
          end)
        end
      }
      UIManager(self):ShowCommonPopupUI(100101, Params, self)
    end
    self.Owner:BlockAllUIInput(false)
  end
  
  self.Owner:BlockAllUIInput(true)
  self._Avatar:MidTermGetProgressReward(Callback)
end

function M:ClearChallengeReddot()
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeRewardReddotName)
  if CacheData then
    for key, _ in pairs(CacheData) do
      CacheData[key] = nil
    end
  end
  ReddotManager.ClearLeafNodeCount(ChallengeRewardReddotName)
end

function M:ClearChallengeTaskReddot()
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeTaskNewReddotName)
  if CacheData then
    for _, TaskItem in pairs(self.ChallengeTaskList) do
      local CacheKey = TaskItem.TaskProp.UniqueID
      CacheData[CacheKey] = false
    end
  end
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
    if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
      self.Key_TitleScore:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    if self.RewardCanGet then
      self.Text_TaskScoreTodayTitle:SetText(GText("UI_Event_MidTerm_GetPrize"))
    else
      self.Text_TaskScoreTodayTitle:SetText(GText("UI_Event_MidTerm_GotoPreview"))
    end
    self.Btn_OneClickGet.Key_GetReward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
      self.Key_TitleScore:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self.Text_TaskScoreTodayTitle:SetText(GText("UI_Event_MidTerm_ChallengePoint"))
    self.Btn_OneClickGet.Key_GetReward:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.CurInputDevice = CurInputDevice
end

function M:InitNavigationRules()
  self.List_Challenge:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.List_Challenge:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
end

function M:BP_GetDesiredFocusTarget()
  if self.CurFocusTask ~= nil then
    return self.CurFocusTask.SelfWidget
  elseif self.List_Challenge:GetItemAt(0) then
    return self.List_Challenge:GetItemAt(0).SelfWidget
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
  if InKeyName == Const.GamepadFaceButtonLeft then
    self:OnChallengeRewardGet()
  elseif InKeyName == Const.GamepadFaceButtonUp then
    self:GetAllTaskScores()
  elseif InKeyName == Const.GamepadFaceButtonRight then
    IsEventHandled = false
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
