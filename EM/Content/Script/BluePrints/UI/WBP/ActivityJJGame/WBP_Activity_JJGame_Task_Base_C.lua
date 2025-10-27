require("UnLua")
local TaskType = {
  Daily = {1, 2},
  Cycle = 3,
  Achievement = 4
}
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local NormalTaskBP_P = "/Game/UI/WBP/Activity/PC/JJGame/WBP_Activity_JJGame_NormalTask_P.WBP_Activity_JJGame_NormalTask_P"
local NormalTaskBP_M = "/Game/UI/WBP/Activity/Mobile/JJGame/WBP_Activity_JJGame_NormalTask_M.WBP_Activity_JJGame_NormalTask_M"
local ChallengeTaskBP_P = "/Game/UI/WBP/Activity/PC/JJGame/WBP_Activity_JJGame_ChallengeTask_P.WBP_Activity_JJGame_ChallengeTask_P"
local ChallengeTaskBP_M = "/Game/UI/WBP/Activity/Mobile/JJGame/WBP_Activity_JJGame_ChallengeTask_M.WBP_Activity_JJGame_ChallengeTask_M"
local NormalRewardReddotName = "JJGameTask_Normal_Reddot"
local ChallengeRewardReddotName = "JJGameTask_Challenge_Reddot"
local NormalTaskNewReddotName = "JJGameTask_Normal_New"
local ChallengeTaskNewReddotName = "JJGameTask_Challenge_New"

function M:Construct()
  self.Super.Construct(self)
  self:AddDispatcher(EventID.OnMidTermTaskComplete, self, self.OnAchvFinished)
  self:AddDispatcher(EventID.OnMidTermTaskProgressChange, self, self.OnMidTermTaskProgressChange)
  self:InitListenEvent()
  self:RefreshBaseInfo()
  ReddotManager.AddListenerEx(NormalTaskNewReddotName, self, self.UpdateNormalTaskNewReddot)
  ReddotManager.AddListenerEx(ChallengeTaskNewReddotName, self, self.UpdateChallengeTaskNewReddot)
  ReddotManager.AddListenerEx(NormalRewardReddotName, self, self.UpdateNormalRewardReddot)
  ReddotManager.AddListenerEx(ChallengeRewardReddotName, self, self.UpdateChallengeRewardReddot)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "JJGameTaskBase", nil)
end

function M:Destruct()
  AudioManager(self):SetEventSoundParam(self, "JJGameTaskBase", {ToEnd = 1})
  self.Super.Destruct(self)
  ReddotManager.RemoveListener(NormalTaskNewReddotName, self)
  ReddotManager.RemoveListener(ChallengeTaskNewReddotName, self)
  ReddotManager.RemoveListener(NormalRewardReddotName, self)
  ReddotManager.RemoveListener(ChallengeRewardReddotName, self)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, Params)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, Params)
  self.NormalTaskBP = nil
  self.ChallengeTaskBP = nil
  if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" then
    self.NormalTaskBP = NormalTaskBP_M
    self.ChallengeTaskBP = ChallengeTaskBP_M
  else
    self.NormalTaskBP = NormalTaskBP_P
    self.ChallengeTaskBP = ChallengeTaskBP_P
  end
  self.Params = Params
  self.Owner = Params.Owner
  self:SwitchBG(Params.TabId)
  self._Avatar = GWorld:GetAvatar()
  self:InitTaskData()
  self:InitMainTab(Params.TabId)
  self:UpdateTabNewReddot()
  self:PlayAnimation(self.In)
  self:SetFocus()
end

function M:InitTaskData()
  self.MidTermTasks = self._Avatar.MidTermTasks
  self.MidTermTasksRecord = self._Avatar.MidTermTasksRecord
  self.MidTermAchvProgressRewarded = self._Avatar.MidTermAchvProgressRewarded
  self.MidTermScores = self._Avatar.MidTermScores
  self.MidTermScoresRewards = self._Avatar.MidTermScoresRewards
  self.MidTermConst = DataMgr.MidTermGoalConstant
  self.MidTermGoalEventId = self.MidTermConst.MidTermGoalEventId.ConstantValue
  self.EventStartTime = DataMgr.EventMain[self.MidTermGoalEventId].EventStartTime
  self.EventEndTime = DataMgr.EventMain[self.MidTermGoalEventId].EventEndTime
  self.remainDays, self.remainHours = self:UpdateEventDay()
end

function M:UpdateEventDay()
  local currentTime = TimeUtils.NowTime()
  local SECOND_IN_DAY = CommonConst.SECOND_IN_DAY
  local SECOND_IN_HOUR = CommonConst.SECOND_IN_HOUR
  local RESET_HOUR = 5
  local RESET_OFFSET = RESET_HOUR * SECOND_IN_HOUR
  local intervalDays = TimeUtils.GetIntervalDay(self.EventStartTime, currentTime)
  local calculatedEventDay = intervalDays + 1
  local hasDailyTask = false
  local enableDayEventDay = -1
  for _, Task in pairs(self._Avatar.MidTermTasks) do
    local TaskData = DataMgr.MidTermTask[Task.UniqueID]
    if not TaskData then
      Utils.ScreenPrint("MidTermTask\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168UniqueID\228\184\186" .. Task.UniqueID .. "\231\154\132\228\187\187\229\138\161\239\188\140\232\175\183\230\163\128\230\159\165\233\133\141\231\189\174")
    elseif TaskData.TaskType == TaskType.Daily[1] or TaskData.TaskType == TaskType.Daily[2] then
      enableDayEventDay = TaskData.EnableDay
      hasDailyTask = true
      break
    end
  end
  if hasDailyTask and calculatedEventDay ~= enableDayEventDay then
    DebugPrint(TXTTag, "\232\173\166\229\145\138\239\188\154EventDay\232\174\161\231\174\151\228\184\141\228\184\128\232\135\180\239\188\129GetIntervalDay\230\150\185\230\179\149\239\188\154" .. calculatedEventDay .. "\239\188\140EnableDay\230\150\185\230\179\149\239\188\154" .. enableDayEventDay)
  end
  self.EventDay = calculatedEventDay
  if not hasDailyTask then
    DebugPrint(TXTTag, "NO DailyTask, EventDay: " .. self.EventDay .. " currentTime: ", TimeUtils.TimeToYMDHMStr(currentTime))
    return false, false
  end
  local nextEnableDay
  for _, Task in pairs(DataMgr.MidTermTask) do
    local TaskData = Task
    if not TaskData then
      Utils.ScreenPrint("MidTermTask\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168UniqueID\228\184\186" .. Task.UniqueID .. "\231\154\132\228\187\187\229\138\161\239\188\140\232\175\183\230\163\128\230\159\165\233\133\141\231\189\174")
    elseif TaskData and TaskData.TaskType == TaskType.Achievement and TaskData.EnableDay then
      local enableDay = TaskData.EnableDay
      if enableDay > self.EventDay and (not nextEnableDay or nextEnableDay > enableDay) then
        nextEnableDay = enableDay
      end
    end
  end
  if not nextEnableDay then
    DebugPrint(TXTTag, "NO nextEnableDay, EventDay: " .. self.EventDay .. " currentTime: ", TimeUtils.TimeToYMDHMStr(currentTime))
    return false, false
  end
  local nextUnlockTime
  if 1 == nextEnableDay then
    nextUnlockTime = self.EventStartTime
  else
    local eventStartData = TimeUtils.TimestampToDataObj(self.EventStartTime)
    local targetDate = TimeUtils.DataToTimestamp(eventStartData.year, eventStartData.month, eventStartData.day + (nextEnableDay - 1), RESET_HOUR, 0, 0)
    nextUnlockTime = targetDate
  end
  local remainTime = nextUnlockTime - currentTime
  if remainTime < 0 then
    remainTime = 0
  end
  local remainDays = math.floor(remainTime / SECOND_IN_DAY)
  local remainHours = math.floor((remainTime - remainDays * SECOND_IN_DAY) / SECOND_IN_HOUR)
  if 0 == remainDays and 0 == remainHours and remainTime > 0 then
    remainHours = 1
  end
  DebugPrint(TXTTag, "EventDay: " .. self.EventDay .. " remainDays: " .. remainDays .. " remainHours: " .. remainHours, TimeUtils.TimeToYMDHMStr(currentTime))
  return remainDays, remainHours
end

function M:InitMainTab(TargetTabId)
  local IsInPc = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
  if IsInPc then
    self.Com_Tab = self.Com_Tab_P
  else
    self.Com_Tab = self.Com_Tab_M
  end
  self.Tabs = {
    {
      TabId = 0,
      Text = GText("UI_Event_MidTerm_NormalTask"),
      IconPath = self.MidTermConst.TabIcon_1.ConstantString
    },
    {
      TabId = 1,
      Text = GText("UI_Event_MidTerm_ChallengeTask"),
      IconPath = self.MidTermConst.TabIcon_2.ConstantString
    }
  }
  self.Com_Tab:Init({
    Tabs = self.Tabs,
    DynamicNode = {"Back", "BottomKey"},
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "SpaceBar",
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "Y",
            Owner = self
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
    },
    OwnerPanel = self,
    BackCallback = self.CloseSelf,
    StyleName = "TextImage",
    TitleName = GText("Event_Title_103006")
  })
  if self.Com_Tab.Btn_Confirm then
    self.Com_Tab.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Com_Tab:BindEventOnTabSelected(self, self.OnTabChanged)
  self.IsInited = true
  self.Com_Tab:SelectTabById(TargetTabId)
end

function M:UpdateTabNewReddot()
  local HasNewNormalTask = false
  local HasNewChallengeTask = false
  local HasNormalReward = false
  local HasChallengeReward = false
  for TaskId, Task in pairs(self._Avatar.MidTermTasks) do
    local TaskData = DataMgr.MidTermTask[Task.UniqueID]
    if not TaskData then
      Utils.ScreenPrint("MidTermTask\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168UniqueID\228\184\186" .. Task.UniqueID .. "\231\154\132\228\187\187\229\138\161\239\188\140\232\175\183\230\163\128\230\159\165\233\133\141\231\189\174")
    else
      local CacheKey = Task.UniqueID
      if TaskData.TaskType == TaskType.Achievement then
        local CacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeTaskNewReddotName)
        if CacheData and CacheData[CacheKey] then
          HasNewChallengeTask = true
        end
      else
        local CacheData = ReddotManager.GetLeafNodeCacheDetail(NormalTaskNewReddotName)
        if CacheData and CacheData[CacheKey] then
          HasNewNormalTask = true
        end
      end
    end
  end
  local NormalRewardCacheData = ReddotManager.GetLeafNodeCacheDetail(NormalRewardReddotName)
  if NormalRewardCacheData then
    if NormalRewardCacheData[NormalRewardReddotName .. "ScoresRewards"] then
      HasNormalReward = true
    end
    if not HasNormalReward then
      for TaskId, Task in pairs(self._Avatar.MidTermTasks) do
        local TaskData = DataMgr.MidTermTask[Task.UniqueID]
        if not TaskData then
          Utils.ScreenPrint("MidTermTask\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168UniqueID\228\184\186" .. Task.UniqueID .. "\231\154\132\228\187\187\229\138\161\239\188\140\232\175\183\230\163\128\230\159\165\233\133\141\231\189\174")
        elseif TaskData.TaskType ~= TaskType.Achievement then
          local TaskCacheKey = NormalRewardReddotName .. Task.UniqueID
          if NormalRewardCacheData[TaskCacheKey] then
            HasNormalReward = true
            break
          end
        end
      end
    end
  end
  local ChallengeRewardCacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeRewardReddotName)
  if ChallengeRewardCacheData then
    for key, _ in pairs(ChallengeRewardCacheData) do
      if ChallengeRewardCacheData[key] then
        HasChallengeReward = true
        break
      end
    end
  end
  if HasNormalReward then
    self.Com_Tab:ShowTabRedDot(1, false, true)
  elseif HasNewNormalTask then
    self.Com_Tab:ShowTabRedDot(1, true, false)
  else
    self.Com_Tab:ShowTabRedDot(1, false)
  end
  if HasChallengeReward then
    self.Com_Tab:ShowTabRedDot(2, false, true)
  elseif HasNewChallengeTask then
    self.Com_Tab:ShowTabRedDot(2, true, false)
  else
    self.Com_Tab:ShowTabRedDot(2, false)
  end
  if TimeUtils.NowTime() > self.EventEndTime then
    self.Com_Tab:ShowTabRedDot(1, false)
    self.Com_Tab:ShowTabRedDot(2, false)
    return
  end
end

function M:UpdateNormalRewardReddot(Count)
  if not self.Com_Tab then
    return
  end
  self:UpdateTabNewReddot()
end

function M:UpdateChallengeRewardReddot(Count)
  if not self.Com_Tab then
    return
  end
  self:UpdateTabNewReddot()
end

function M:UpdateNormalTaskNewReddot(Count)
  if not self.Com_Tab then
    return
  end
  self:UpdateTabNewReddot()
end

function M:UpdateChallengeTaskNewReddot(Count)
  if not self.Com_Tab then
    return
  end
  self:UpdateTabNewReddot()
end

function M:InitTask(TargetTabId)
  self.PanelAnchor:ClearChildren()
  if 0 == TargetTabId then
    self.NormalTaskWidget = UIManager(self):CreateWidget(self.NormalTaskBP)
    self.TaskWidget = self.NormalTaskWidget
  else
    self.ChallengeTaskWidget = UIManager(self):CreateWidget(self.ChallengeTaskBP)
    self.TaskWidget = self.ChallengeTaskWidget
  end
  if not self.TaskWidget then
    return
  end
  local Slot = self.PanelAnchor:AddChildToOverlay(self.TaskWidget)
  Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
  Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
  local Params = {
    Owner = self,
    EventDay = self.EventDay,
    RemainDays = self.remainDays,
    RemainHours = self.remainHours,
    EventEndTime = self.EventEndTime
  }
  self.TaskWidget:Init(Params)
end

function M:TryIncreaceNormalRewardReddot(TaskId)
  local CacheKey = NormalRewardReddotName .. TaskId
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(NormalRewardReddotName)
  if CacheData and nil == CacheData[CacheKey] then
    CacheData[CacheKey] = true
    ReddotManager.IncreaseLeafNodeCount(NormalRewardReddotName)
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

function M:OnAchvFinished(TaskId)
  if self.NormalTaskWidget and self.NormalTaskWidget.OnAchvFinished then
    self.NormalTaskWidget:OnAchvFinished(TaskId)
  end
  if self.ChallengeTaskWidget and self.ChallengeTaskWidget.OnAchvFinished then
    self.ChallengeTaskWidget:OnAchvFinished(TaskId)
  end
  local Task = self._Avatar.MidTermTasks[TaskId]
  if Task then
    local TaskData = DataMgr.MidTermTask[Task.UniqueID]
    if TaskData and TaskData.TaskType == TaskType.Achievement then
      self:TryIncreaceChallengeTaskRewardReddot(TaskId)
    else
      self:TryIncreaceNormalRewardReddot(TaskId)
    end
  end
end

function M:OnMidTermTaskProgressChange(TaskId, Progress)
  if self.TaskWidget and self.TaskWidget.OnMidTermTaskProgressChange then
    self.TaskWidget:OnMidTermTaskProgressChange(TaskId, Progress)
  end
end

function M:GetTaskReward(Item, TaskWidget, TaskId)
  local function Callback(ErrCode)
    print("MidTermGetTaskReward", ErrorCode:Name(ErrCode))
    
    if ErrCode == ErrorCode.RET_SUCCESS then
      TaskWidget:OnTaskGet(Item)
    else
      local ErrorCodeData = DataMgr.ErrorCode[ErrCode]
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText(ErrorCodeData.ErrorCodeContent))
    end
    self:BlockAllUIInput(false)
  end
  
  self:BlockAllUIInput(true)
  self._Avatar:MidTermGetTaskReward(TaskId, Callback)
end

function M:OnTabChanged(TabWidget)
  if self.IsInited then
    self.IsInited = false
  else
    AudioManager(self):PlayUISound(self, "event:/ui/activity/wenmingboyi_page_refresh", nil, nil)
  end
  self:PlayAnimation(self.Change)
  local TabId = TabWidget:GetTabId()
  self.CurrentTabIndex = TabId
  self:SwitchBG(TabId)
  self:InitTask(TabId)
end

function M:SwitchBG(TabId)
  if 0 == TabId then
    self.WS_BG:SetActiveWidgetIndex(0)
  else
    self.WS_BG:SetActiveWidgetIndex(1)
  end
end

function M:CloseSelf()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimation(self.Out)
  EventManager:FireEvent(EventID.OnReturnToActivityEntry)
  if self.Params.CloseCallback then
    self.Params.CloseCallback(self, self.Params.CloseCallbackObj)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  elseif "Escape" == InKeyName then
    self:CloseSelf()
  elseif "Q" == InKeyName then
    self.Com_Tab:TabToLeft()
  elseif "E" == InKeyName then
    self.Com_Tab:TabToRight()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if "Gamepad_FaceButton_Right" == InKeyName then
    if self.NormalTaskWidget and self.NormalTaskWidget.IsFocusBigReward then
      self.NormalTaskWidget.IsFocusBigReward = false
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
    self:CloseSelf()
  elseif InKeyName == Const.GamepadLeftShoulder then
    self.Com_Tab:TabToLeft()
  elseif InKeyName == Const.GamepadRightShoulder then
    self.Com_Tab:TabToRight()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:InitListenEvent()
  local PlayerController = self:GetOwningPlayer()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
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
  else
  end
  self.CurInputDevice = CurInputDevice
end

function M:BP_GetDesiredFocusTarget()
  return self.TaskWidget
end

function M:ReceiveEnterState(StackAction)
  self.Super.ReceiveEnterState(self, StackAction)
  if 0 == self.CurrentTabIndex then
    if IsValid(self.TaskWidget.NormalItem) then
      self.TaskWidget.NormalItem:SetFocus()
    end
  elseif 1 == self.CurrentTabIndex and IsValid(self.TaskWidget.ChallengeItem) then
    self.TaskWidget.List_Challenge:SetFocus()
  end
end

return M
