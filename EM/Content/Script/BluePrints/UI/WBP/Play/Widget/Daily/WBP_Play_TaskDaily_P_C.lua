require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local TypeSort = {
  Char = 1,
  Weapon = 2,
  Mod = 3,
  Draft = 4,
  Reward = 5,
  Resource = 6
}

function M:Construct()
  M.Super.Construct(self)
  self.NpcId = 910003
  self:AddDispatcher(EventID.DailyRefreshDailyTask, self, self.OnDailyRefreshDailyTask)
  self:AddDispatcher(EventID.DailyTaskRewardChange, self, self.OnDailyTaskRewardChange)
  self:AddDispatcher(EventID.AllDailyTaskRewardChange, self, self.OnAllRewardDailyTask)
  self:AddDispatcher(EventID.EntryReceiveEnterState, self, self.OnEntryReceiveEnterState)
  self:AddDispatcher(EventID.AllDailyProgressRewardChange, self, self.OnDailyProgressRewardChange)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  self.UIManager = GameInstance:GetGameUIManager()
  self:AddInputMethodChangedListen()
  self:InitDailyGoalTask()
  self.Btn_Reward:BindEventOnClicked(self, self.ClaimAllTaskRewards)
  self.Btn_Reward:SetText(GText("UI_GameEvent_ClaimAll"))
  self.Text_Daily:SetText(GText("MAIN_UI_DAILYGOAL"))
  if self:IsExistTimer("UpdateTimeContent") then
    self:RemoveTimer("UpdateTimeContent")
  end
  self:UpdateTimeCountDown()
  self:AddTimer(1.0, self.UpdateTimeCountDown, true, 0, "UpdateTimeContent", true)
  self.Mobile = "Mobile" == CommonUtils.GetDeviceTypeByPlatformName(self)
  self.Gamepad = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
  self:SetVerticalNavigation()
  if "Mobile" == CommonUtils.GetDeviceTypeByPlatformName() then
    self.List_Task:SetControlScrollbarInside(false)
  else
    self.List_Task:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
    self.List_Task:SetControlScrollbarInside(true)
  end
end

function M:SetVerticalNavigation()
  self.List_Task:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.List_Task:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.List_Task:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.List_Task:SetNavigationRuleCustom(UE4.EUINavigation.Left, {
    self,
    function()
      return self.Progress.Reward01
    end
  })
  local Count = self.Progress.VerticalBox_0:GetChildrenCount()
  local First = self.Progress.VerticalBox_0:GetChildAt(0)
  First:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.Progress.VerticalBox_0:GetChildAt(Count - 1):SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  for i = 1, Count do
    local Current = self.Progress.VerticalBox_0:GetChildAt(i - 1)
    Current:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    Current:SetNavigationRuleExplicit(EUINavigation.Right, self.List_Task)
    Current:SetNavigationRuleCustom(EUINavigation.Right, {
      self,
      function()
        local RewardItemUIs = self.List_Task:GetDisplayedEntryWidgets()
        return RewardItemUIs[1]
      end
    })
  end
end

function M:InitContent(TaskRoot)
  self.TaskRoot = TaskRoot
end

function M:OnEntryReceiveEnterState(StackAction)
  if 1 == StackAction then
    local StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
    if not StyleOfPlay then
      return
    end
    if StyleOfPlay.CurTabId ~= "PlayTaskRoot" then
      return
    end
    if self.TaskRoot.CurSubUI ~= self then
      return
    end
    UIManager(self):HideNpcById(910003, false, "StyleOfPlay")
    self:InitDailyGoalTask()
    self:SetNavigateToIndex()
  end
end

function M:InitDailyGoalTask()
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  self.PlayerAvatar = PlayerAvatar
  self:RefresDailyGoalTask()
  self:RefreshProgress()
  self:SetBtn_RewardState()
end

function M:SetBtn_RewardState()
  if self:HasClaimableTaskReward() then
    self.Btn_Reward:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Btn_Reward:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:UpdateUIStyleInPlatform()
end

function M:RefreshProgress()
  self.Progress:RefreshProgress(self)
  self.Activation.Text_Num:SetText(self.PlayerAvatar.CurrentTaskProgress)
  self.Activation.Text_Activation:SetText(GText("UI_DailyGoal_Activeness"))
end

function M:RefresDailyGoalTask()
  self.List_Task:ClearListItems()
  local TaskList = {}
  for _, Task in pairs(self.PlayerAvatar.DailyTasks) do
    table.insert(TaskList, DataMgr.DailyGoalTask[Task.DailyGoalTaskId])
  end
  table.sort(TaskList, function(a, b)
    local TaskDataA = self.PlayerAvatar.DailyTasks[a.DailyGoalTaskId]
    local TaskDataB = self.PlayerAvatar.DailyTasks[b.DailyGoalTaskId]
    local StateA = TaskDataA and TaskDataA.State or 2
    local StateB = TaskDataB and TaskDataB.State or 2
    local Priority = {
      [2] = CommonConst.DailyTaskState.Doing,
      [1] = CommonConst.DailyTaskState.Complete,
      [3] = CommonConst.DailyTaskState.GetReward
    }
    local PriorityA = Priority[StateA] or 2
    local PriorityB = Priority[StateB] or 2
    if PriorityA ~= PriorityB then
      return PriorityA < PriorityB
    end
    if a.JumpUIId ~= nil ~= (b.JumpUIId ~= nil) then
      return a.JumpUIId ~= nil
    end
    return a.DailyGoalTaskId < b.DailyGoalTaskId
  end)
  for i, Task in ipairs(TaskList) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.DailyGoalTaskId = Task.DailyGoalTaskId
    Content.DailyTasktDes = Task.DailyTasktDes
    Content.JumpUIId = Task.JumpUIId
    Content.QuestReward = Task.QuestReward
    Content.Target = Task.Target
    Content.TargetId = Task.TargetId
    Content.Parent = self
    self.List_Task:AddItem(Content)
  end
  self.List_Task:RequestPlayEntriesAnim()
end

function M:SetNavigateToIndex()
  self:AddTimer(0.01, function()
    self.List_Task:NavigateToIndex(0)
  end, false, 0, "Play_Daily_List_Task")
end

function M:OnAddedToFocusPath(InFocusEvent)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:SetNavigateToIndex()
  end
end

function M:HasClaimableTaskReward()
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return false
  end
  local DailyTaskServerData = PlayerAvatar.DailyTasks
  for _, TaskData in pairs(DailyTaskServerData) do
    if TaskData.State == CommonConst.DailyTaskState.Complete then
      return true
    end
  end
  return false
end

function M:HasClaimableProgressReward()
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return false
  end
  local DailyTaskProgressState = PlayerAvatar.DailyTaskProgress
  for _, ProgressState in pairs(DailyTaskProgressState) do
    if ProgressState == CommonConst.DailyTaskState.Complete then
      return true
    end
  end
  return false
end

function M:ClaimAllTaskRewards()
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return false
  end
  PlayerAvatar:GetAllDailyTaskReward()
end

function M:OnDailyProgressRewardChange(Rewards)
  self:RefreshProgress()
  UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, nil, self)
end

function M:OnAllRewardDailyTask(Rewards)
  self:RefresDailyGoalTask()
  self:RefreshProgress()
  self:SetBtn_RewardState()
  UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, nil, self)
end

function M:OnDailyRefreshDailyTask()
  local Params = {}
  local UI = UIManager(self):ShowCommonPopupUI(100177, Params)
  self:AddTimer(0.01, function()
    self:InitDailyGoalTask()
  end, false, 0, "OnDailyRefreshDailyTask")
end

function M:OnDailyTaskRewardChange(DailyTaskId, Rewards)
  self:RefresDailyGoalTask()
  self:RefreshProgress()
  self:SetBtn_RewardState()
  UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, nil, self)
end

function M:UpdateTimeCountDown()
  self.LeftTimeDict = TimeUtils.TimestampNextClock(CommonConst.GAME_REFRESH_HMS[1])
  local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(self.LeftTimeDict)
  self.Refresh_Time:SetTimeText(GText("UI_DailyGoal_RemainTime"), RemainTimeDict)
end

function M:RewardView()
  local GoalRewards = {}
  self.DataMap = {}
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  local key, maxLv, prevLv
  local SortedKeys = {}
  for lv in pairs(DataMgr.DailyGoalReward) do
    table.insert(SortedKeys, lv)
  end
  table.sort(SortedKeys)
  for _, lv in pairs(SortedKeys) do
    if not maxLv or maxLv < lv then
      maxLv = lv
    end
    if lv == PlayerAvatar.DailyInitLevel then
      key = lv
      break
    elseif lv > PlayerAvatar.DailyInitLevel then
      key = prevLv
      break
    end
    prevLv = lv
  end
  key = key or maxLv
  local DailyGoalReward = DataMgr.DailyGoalReward[key]
  for _, ItemData in pairs(DailyGoalReward) do
    table.insert(GoalRewards, ItemData)
  end
  
  local function SortFunc(A, B)
    if A.Rarity == B.Rarity then
      if TypeSort[A.ItemType] and TypeSort[B.ItemType] then
        if TypeSort[A.ItemType] == TypeSort[B.ItemType] then
          return A.ItemId < B.ItemId
        end
        return TypeSort[A.ItemType] < TypeSort[B.ItemType]
      end
      return A.ItemId < B.ItemId
    end
    return A.Rarity > B.Rarity
  end
  
  for _, Data in ipairs(GoalRewards) do
    local RewardInfo = DataMgr.Reward[Data.ActivenessReward]
    if RewardInfo then
      local Ids = RewardInfo.Id
      local RewardCount = RewardInfo.Count
      local TableName = RewardInfo.Type
      local RewardList = {}
      for i = 1, #Ids do
        local ItemData = {}
        ItemData.ItemId = Ids[i]
        ItemData.Count = RewardUtils:GetCount(RewardCount[i])
        ItemData.Icon = ItemUtils.GetItemIconPath(ItemData.ItemId, TableName[i])
        ItemData.Rarity = ItemUtils.GetItemRarity(ItemData.ItemId, TableName[i])
        ItemData.ItemType = TableName[i]
        table.insert(RewardList, ItemData)
      end
      table.sort(RewardList, SortFunc)
      if not self.DataMap[Data.RequiredActiveness] then
        self.DataMap[Data.RequiredActiveness] = {}
      end
      self.DataMap[Data.RequiredActiveness] = RewardList
    end
  end
  local Params = {}
  Params.DataMap = self.DataMap
  local UI = UIManager(self):ShowCommonPopupUI(100181, Params)
end

function M:HideNpc(IsHide)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:HideNpcActor(IsHide, "StyleOfPlay")
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if self:HasFocusedDescendants() or self:HasAnyUserFocus() then
    self:UpdateUIStyleInPlatform()
  end
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

function M:SwitchIn()
  self:UpdateUIStyleInPlatform()
end

function M:UpdateUIStyleInPlatform()
  if not UIUtils.IsGamepadInput() and not UIUtils.IsMobileInput() then
    self.Panel_Controller_Reward:SetVisibility(ESlateVisibility.Collapsed)
    local StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    }
    if self:HasClaimableTaskReward() then
      table.insert(BottomKeyInfo, 1, {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Space",
            ClickCallback = self.ClaimAllTaskRewards,
            Owner = self
          }
        },
        Desc = GText("UI_GameEvent_ClaimAll"),
        bLongPress = false
      })
    end
    if StyleOfPlay then
      StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
    end
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Panel_Controller_Reward:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Key_Controller_Reward:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "X"}
      }
    })
    if self:HasClaimableProgressReward() then
      self.Text_Reward:SetText(GText("UI_CTL_Claim"))
    else
      self.Text_Reward:SetText(GText("UI_DailyGoal_RewardView"))
    end
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if not UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "SpaceBar" == InKeyName then
      IsEventHandled = true
      self:ClaimAllTaskRewards()
    end
  elseif UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if "Gamepad_FaceButton_Left" == InKeyName then
    if self:HasClaimableProgressReward() then
      self:ReceiveProgressReward()
    else
      self:RewardView()
    end
  end
  return IsEventHandled
end

function M:ReceiveProgressReward()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  local PlayerAvatar = GWorld:GetAvatar()
  if not PlayerAvatar then
    return
  end
  PlayerAvatar:GetAllDailyProgressReward()
end

function M:CloseSelf()
  local Item = UIManager(self):GetUIObj("StyleOfPlay")
  self:PlayAnimation(self.Out)
  Item:OnClickBack()
end

return M
