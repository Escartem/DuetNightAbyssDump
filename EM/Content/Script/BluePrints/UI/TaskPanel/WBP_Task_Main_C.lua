require("UnLua")
local WBP_Task_Main = Class("BluePrints.UI.BP_UIState_C")
local UIUtils = require("Utils.UIUtils")
local EMCache = require("EMCache.EMCache")
local TimeUtils = require("Utils.TimeUtils")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local ReasoningUtils = require("BluePrints.UI.WBP.DetectiveMinigame.ReasoningUtils")
local GuidePointLocData = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
local TABALL_ID = 99
local QuestRealStateEnum = {
  Lock = 0,
  Doing = 1,
  Finished = 2,
  InProgress = -1
}
local ConstQuestTabData = {}

function WBP_Task_Main:Initialize(Initializer)
  self.Super.Initialize(self)
  self.AllTabInfo = {}
  self.CurTabId = nil
  self.SaveTabId = nil
  self.CurSelectQuest = nil
  self.CurTrackingQuest = nil
  self.TrackingQuestId = nil
  self.IsTracking = false
  self.IsFristOpen = true
  self.CurPlayerCharacterLevel = 0
  self.JumpQuestChainId = nil
  self.PlatformName = nil
  self.CurFocusWidget = nil
  self.IsCanCloseByHotKey = false
end

function WBP_Task_Main:Construct()
  self:InitListenEvent()
  ReddotManager.AddListener("DetectiveQuestion", self, self.UpdateReasoningRedDot)
  ReddotManager.AddListener("DetectiveAnswer", self, self.UpdateReasoningRedDot)
  EventManager:AddEvent(EventID.CheckShowMap, self, self.CheckNeedShowLevelMap)
end

function WBP_Task_Main:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local JumpQuestId = (...)
  if nil ~= (...) then
    self.JumpQuestChainId = tonumber(JumpQuestId)
  end
  self.IsCanReceive = true
  self:RenameWidget()
  self:InitDetailInfo()
  self:InitTrackingButton()
  self:InitTabInfo()
  self:UpdateListViewScrollMultiplier(self.RootWidget.List_Task, 10)
  if 0 ~= self.RootWidget.List_Task.ListItems:Num() then
    self.RootWidget.List_Task:SetScrollbarVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.RootWidget.List_Task:SetScrollbarVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.RootWidget.Btn_Jump:BindEventOnClicked(self, self.OnClickJumpBtn)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self.CurPlayerCharacterLevel = PlayerCharacter:GetAttr("Level")
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "OpenTaskMain", nil)
  self.RootWidget.List_Task:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    self.OnNavigationRight
  })
  self.RootWidget.Group_TaskDetail:SetNavigationRuleCustom(UE4.EUINavigation.Left, {
    self,
    function()
      if self.CurFocusWidget then
        self.CurFocusWidget.Task_SubItem:SetFocus()
      end
    end
  })
end

function WBP_Task_Main:InitTabInfo()
  local function TryGetTabData(InQuestType)
    for _, Data in pairs(DataMgr.QuestTab) do
      if Data and Data.QuestType == InQuestType then
        return Data
      end
    end
    return nil
  end
  
  self.TempQuestTabData = {
    [1] = TryGetTabData(Const.AllQuestChainType),
    [2] = TryGetTabData(Const.MainQuestChainType),
    [3] = TryGetTabData(Const.MainActivityQuestChainType),
    [4] = TryGetTabData(Const.LimTimeQuestChainType),
    [5] = TryGetTabData(Const.SpecialSideQuestChainType),
    [6] = TryGetTabData(Const.SideQuestChainType),
    [7] = TryGetTabData(Const.DailyQuestChainType)
  }
  local Index = 1
  for Index, Data in pairs(self.TempQuestTabData) do
    if Data then
      ConstQuestTabData[Index] = Data
      Index = Index + 1
    end
  end
  for k, v in pairs(ConstQuestTabData) do
    local Info = v
    if Info then
      table.insert(self.AllTabInfo, {
        Text = GText(Info.TabName),
        TabId = k,
        IconPath = Info.Icon
      })
    end
  end
  self.CommonTabWidget:Init({
    TitleName = GText("MAIN_UI_QUEST"),
    LeftKey = "Q",
    RightKey = "E",
    Tabs = self.AllTabInfo,
    DynamicNode = {"Back", "BottomKey"},
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    },
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.OnReturnKeyDown
  })
  for _, Data in pairs(self.TempQuestTabData) do
    if Data then
      local RedDotName = Data.TabName
      local TabId = Data.TabId
      ReddotManager.AddListenerEx(RedDotName, self, function(self, Count, RdType, RdName)
        if Count > 0 then
          self.CommonTabWidget:ShowTabRedDotByTabId(TabId, true, false, false)
        else
          self.CommonTabWidget:ShowTabRedDotByTabId(TabId, false, false, false)
        end
      end)
    end
  end
  self.CommonTabWidget:BindEventOnTabSelected(self, self.OnTabChange)
  local CurTabId = EMCache:Get("QuestPantlTab", true)
  if nil ~= CurTabId and false then
    self.CommonTabWidget:SelectTab(CurTabId)
  else
    self.CommonTabWidget:SelectTab(1)
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local UnlockedQuestions = Avatar.DetectiveGameUnlockedQuestions
  if nil ~= UnlockedQuestions then
    local Count = 0
    for _, _ in pairs(UnlockedQuestions) do
      Count = Count + 1
    end
    if Count > 0 then
      self.CommonTabWidget.Pos_Reasoning:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.CommonTabWidget.ReasoningEntrance = UIManager(self):CreateWidget("WidgetBlueprint'/Game/UI/WBP/Reasoning/Widget/WBP_Reasoning_Entrance.WBP_Reasoning_Entrance'", true)
      self.CommonTabWidget.ReasoningEntrance.Text:SetText(GText("Minigame_Textmap_100304"))
      self.CommonTabWidget.Pos_Reasoning:AddChildToOverlay(self.CommonTabWidget.ReasoningEntrance)
      self.CommonTabWidget.ReasoningEntrance.Btn_Click.OnClicked:Add(self, self.OnClickReasoningEntrance)
      self.CommonTabWidget.ReasoningEntrance.Key_GamePad:CreateCommonKey({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "Menu"}
        }
      })
      if self.UsingGamepad then
        self.CommonTabWidget.ReasoningEntrance.Key_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
  end
  self:UpdateReasoningRedDot()
end

function WBP_Task_Main:UpdateTabWidgetReddot()
end

function WBP_Task_Main:TriggerLevelHardWarningUIShow(QuestChainId, QuestId)
  local TaskInfo = TaskUtils:GetQuestDetail(QuestChainId, QuestId)
  local ConfigRecommandLevel
  if nil ~= TaskInfo then
    ConfigRecommandLevel = TaskUtils:GetQuestDetail(QuestChainId, QuestId).RecommendLevel
  end
  if nil ~= ConfigRecommandLevel and ConfigRecommandLevel > self.CurPlayerCharacterLevel then
    self.RootWidget.Text_HardWarning:SetText(GText("UI_QUEST_TOOHARD"))
    self.RootWidget.HB_HardWarning:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.RootWidget.HB_HardWarning:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Task_Main:OnTabChange(TabWidget)
  EventManager:FireEvent(EventID.OnSelectQuestSubItem, nil)
  local TabId = TabWidget.Idx
  self.CurTabId = TabId
  local QuestData = self:GetQuestData(TabId) or {}
  self.RootWidget.List_Task:ClearListItems()
  self.CurSelectQuest = nil
  local CurTabFirstQuestChainId = self:GetCurTabFirstQuestId(QuestData, TabId)
  self.CurSelectId = 0
  if self.TrackingQuestId and self:IsInTab(self.TrackingQuestId, TabId) then
    self.CurSelectId = self.TrackingQuestId
  else
    local LastSelectId = TaskUtils.TaskMainLastSelectId
    if 0 == LastSelectId or nil == LastSelectId then
      self.CurSelectId = CurTabFirstQuestChainId
    else
      self.CurSelectId = LastSelectId
    end
  end
  if nil ~= self.JumpQuestChainId then
    self.CurSelectId = self.JumpQuestChainId
    self.JumpQuestChainId = nil
  end
  local Count = 0
  local IsExistSelectId = false
  for _, QuestChains in pairs(QuestData) do
    for index = 1, #QuestChains do
      local IsShowType = false
      local Data = QuestChains[index]
      if 1 == index then
        IsShowType = true
      end
      local ListItemContent
      if QuestChains[1] and -1 == QuestChains[1].QuestChainId then
        ListItemContent = TaskUtils:CreateListItemContent({
          DoingQuestId = -1,
          QuestChainId = -1,
          CompletedQuestId = -1,
          OwnerWidget = self,
          State = 1,
          IsShowType = IsShowType,
          IsTracking = false,
          IsSelectDoingQuest = Data.QuestChainId == self.CurSelectId,
          UI = nil
        })
      else
        ListItemContent = TaskUtils:CreateListItemContent({
          DoingQuestId = Data.DoingQuestId,
          QuestChainId = Data.QuestChainId,
          CompletedQuestId = Data.CompleteQuestId,
          OwnerWidget = self,
          State = Data.State,
          IsShowType = IsShowType,
          IsTracking = self.TrackingQuestId and self.TrackingQuestId == Data.QuestChainId,
          IsSelectDoingQuest = Data.QuestChainId == self.CurSelectId,
          UI = nil
        })
      end
      if ListItemContent.IsSelectDoingQuest then
        IsExistSelectId = true
      end
      self.RootWidget.List_Task:AddItem(ListItemContent)
      Count = Count + 2
    end
  end
  local Pre
  for key, value in ipairs(self.RootWidget.List_Task:GetListItems():ToTable()) do
    value.PreItem = Pre
    Pre = value
    local Next = self.RootWidget.List_Task:GetItemAt(key)
    if Next then
      value.NextItem = Next
    else
      value.NextItem = nil
    end
  end
  if not IsExistSelectId then
    self.CurSelectId = CurTabFirstQuestChainId
  end
  if self.PlatformName == "PC" then
    self.RootWidget.Group_TaskList:SetWidthOverride(self.RootWidget.Size_Group_TaskList_P)
  elseif self.PlatformName == "Mobile" then
    self.RootWidget.Group_TaskList:SetWidthOverride(self.RootWidget.Size_Group_TaskList_M)
  end
  if Count > 0 then
    self.IsTaskEmpty = false
    self.RootWidget.Group_TaskDetail_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.RootWidget.Group_TaskDetail:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.RootWidget.Group_TaskList:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.RootWidget.List_Task:SetScrollbarVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  else
    self.IsTaskEmpty = true
    self.RootWidget.Group_TaskDetail_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.RootWidget.Group_TaskDetail:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.RootWidget.Group_TaskList:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.RootWidget.Text_MailDetail_Empry:SetText(GText("UI_QUEST_CLEAR"))
    self.RootWidget.List_Task:SetScrollbarVisibility(UE4.ESlateVisibility.Collapsed)
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
    if self.UsingGamepad then
      self:InitTabPadKeyInfoForBack()
    end
  end
  self:InitDetailInfo()
  self.RootWidget:BindToAnimationFinished(self.RootWidget.Tab_Change, {
    self,
    function()
      self:ScrollToSelectedWidget(self.CurSelectId)
      self.RootWidget:UnbindAllFromAnimationFinished(self.RootWidget.Tab_Change)
    end
  })
  self.RootWidget:PlayAnimation(self.RootWidget.Tab_Change)
  self.CurTrackWidget = nil
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
end

function WBP_Task_Main:GetQuestData(TabId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local AllQuestData = Avatar.QuestChains or {}
  local Result = {}
  self.HasToBeContinued = true
  local ChoiceQuestType = ConstQuestTabData[TabId].QuestType
  if -1 == ChoiceQuestType or 1 == ChoiceQuestType then
    for QuestChainId, Data in pairs(AllQuestData) do
      if DataMgr.QuestChain[QuestChainId] then
        local QuestChainType = DataMgr.QuestChain[QuestChainId].QuestChainType
        local IsShowByCheck = self:CheckQuestIsShowByCheckState(QuestChainId, Data)
        if 3 ~= Data.State and Data.CanShow and IsShowByCheck then
          local Type = DataMgr.QuestChain[QuestChainId].QuestChainType
          if 1 == Type or 6 == Type then
            self.HasToBeContinued = false
            break
          end
        end
      end
    end
  else
    self.HasToBeContinued = false
  end
  if self.HasToBeContinued then
    Result[1] = Result[1] or {}
    table.insert(Result[1], {QuestChainId = -1})
  end
  local MaxQuestType = 0
  if -1 == ChoiceQuestType then
    for QuestChainId, Data in pairs(AllQuestData) do
      if DataMgr.QuestChain[QuestChainId] then
        local QuestChainType = DataMgr.QuestChain[QuestChainId].QuestChainType
        local IsShowByCheck = self:CheckQuestIsShowByCheckState(QuestChainId, Data)
        if 3 ~= Data.State and Data.CanShow and IsShowByCheck then
          Result[QuestChainType] = Result[QuestChainType] or {}
          table.insert(Result[QuestChainType], Data)
        end
      else
        local Message = string.format("\228\187\187\229\138\161\233\157\162\230\157\191\228\184\141\230\152\190\231\164\186\228\187\187\229\138\161\239\188\154 %s", QuestChainId)
        UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\180\166\229\143\183\229\183\178\230\156\137\228\187\187\229\138\161\230\156\141\229\138\161\229\153\168\230\149\176\230\141\174\239\188\140\228\189\134\228\187\187\229\138\161\232\161\168\229\134\133\230\149\176\230\141\174\229\183\178\228\184\141\229\173\152\229\156\168", Message)
      end
    end
  else
    for QuestChainId, Data in pairs(AllQuestData) do
      if DataMgr.QuestChain[QuestChainId] then
        local QuestChainType = DataMgr.QuestChain[QuestChainId].QuestChainType
        local IsShowByCheck = self:CheckQuestIsShowByCheckState(QuestChainId, Data)
        if 3 ~= Data.State and Data.CanShow and QuestChainType == ChoiceQuestType and IsShowByCheck then
          Result[QuestChainType] = Result[QuestChainType] or {}
          table.insert(Result[QuestChainType], Data)
        end
      else
        local Message = string.format("\228\187\187\229\138\161\233\157\162\230\157\191\228\184\141\230\152\190\231\164\186\228\187\187\229\138\161: %s", QuestChainId)
        UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\180\166\229\143\183\229\183\178\230\156\137\228\187\187\229\138\161\230\156\141\229\138\161\229\153\168\230\149\176\230\141\174\239\188\140\228\189\134\228\187\187\229\138\161\232\161\168\229\134\133\230\149\176\230\141\174\229\183\178\228\184\141\229\173\152\229\156\168", Message)
      end
    end
  end
  for k, v in pairs(Result) do
    table.sort(Result[k], function(a, b)
      return a.QuestChainId < b.QuestChainId
    end)
  end
  if 1 ~= TabId then
    return Result
  end
  local RetTable = {}
  for Index, Data in pairs(ConstQuestTabData) do
    if Data and Data.QuestType and Data.QuestType ~= Const.AllQuestChainType and Result[Data.QuestType] then
      table.insert(RetTable, Result[Data.QuestType])
    end
  end
  return RetTable
end

function WBP_Task_Main:CheckQuestIsShowByCheckState(QuestChainId, QuestChainData)
  local QuestChainType = 0
  if DataMgr.QuestChain[QuestChainId] and DataMgr.QuestChain[QuestChainId].QuestChainType then
    QuestChainType = DataMgr.QuestChain[QuestChainId].QuestChainType
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if 3 == QuestChainData.State then
    return false
  end
  local CurrentTime = TimeUtils.NowTime()
  local QuestStartTime = DataMgr.QuestChain[QuestChainId].StartTime
  local QuestEndTime = DataMgr.QuestChain[QuestChainId].EndTime
  if QuestStartTime and QuestEndTime and (CurrentTime < QuestStartTime or CurrentTime > QuestEndTime) and (QuestChainType == Const.LimTimeQuestChainType or QuestChainType == Const.MainActivityQuestChainType) then
    return false
  end
  if QuestChainData.CanShow == false and (QuestChainType == Const.LimTimeQuestChainType or QuestChainType == Const.MainActivityQuestChainType) then
    return false
  end
  if 0 == QuestChainData.State then
    if (QuestChainType == Const.LimTimeQuestChainType or QuestChainType == Const.MainActivityQuestChainType) and QuestChainData.CanShow == false then
      return false
    elseif (QuestChainType == Const.LimTimeQuestChainType or QuestChainType == Const.MainActivityQuestChainType) and QuestChainData.CanShow == true then
      return true
    end
    return true
  end
  local STLExportInfo = DataMgr.STLExportQuestChain[QuestChainId]
  if nil == STLExportInfo or nil == STLExportInfo.Quests or nil == STLExportInfo.Quests[QuestChainData.DoingQuestId] then
    return false
  end
  if STLExportInfo.Quests[QuestChainData.DoingQuestId].IsPreQuest then
    return false
  else
    return true
  end
end

function WBP_Task_Main:InitDetailInfo()
  self.RootWidget.VB_TaskDetails:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.RootWidget.Group_TaskTitle:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.RootWidget.HB_Reward:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.RootWidget.Common_Button_Text_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Task_Main:ShowQuestDetailInfo(QuestWidget)
  if not QuestWidget then
    return
  end
  if -1 == QuestWidget.OwnerWidget.QuestChainId then
    self.CurSelectQuest = QuestWidget
    self.RootWidget.VB_TaskDetails:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.RootWidget.Group_TaskTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.RootWidget.Common_Button_Text_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.RootWidget.Text_TaskTitle:SetText(GText("Quest_ToBeContinued"))
    self.RootWidget.Text_TaskTitle:SetRenderOpacity(0)
    self:AddTimer(0.01, function()
      local TextBlockWidth = UIManager(self):GetWidgetRenderSize(self.RootWidget.Text_TaskTitle)
      self.RootWidget.Text_TaskTitle:SetTextByPixelWidth(GText("Quest_ToBeContinued"), TextBlockWidth.X)
      self.RootWidget.Text_TaskTitle:SetRenderOpacity(1)
    end, false, 0, "DelayToShowText")
    self.RootWidget.HB_Position:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.RootWidget.Group_Title_UnlockTask:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.RootWidget.VB_UnlockCondition:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.RootWidget.Text_TaskDetail:SetText(GText("AllQuest_Over_Description"))
    self.RootWidget.Text_TaskObject:SetText(GText("UI_QUEST_CONTENT"))
    self.RootWidget.Text_TaskRewards:SetText(GText("UI_QUEST_REWARDS"))
    self.RootWidget.ListView_Rewards:ClearListItems()
    self.RootWidget.ListView_Rewards:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:SetTrackButtonText(false)
    return
  end
  self.RootWidget.HB_Position:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.CurSelectQuest = QuestWidget
  local QuestId = QuestWidget.QuestID
  local QuestChainId = QuestWidget.OwnerWidget.QuestChainId
  local RewardList = DataMgr.QuestChain[QuestChainId].QuestChainReward
  local UnlockConditionId = DataMgr.QuestChain[QuestChainId].UnlockCondition
  local UnlockTitle = DataMgr.QuestChain[QuestChainId].UnlockTitle
  local UnlockContent = DataMgr.QuestChain[QuestChainId].UnlockContent
  local UnlockCondition
  if UnlockConditionId then
    UnlockCondition = DataMgr.Condition[UnlockConditionId].ConditionMap
  end
  self.RootWidget.VB_TaskDetails:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.RootWidget.Group_TaskTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.RootWidget.Common_Button_Text_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Info = TaskUtils:GetQuestDetail(QuestChainId, QuestId)
  if not Info then
    return
  end
  if QuestWidget.State == QuestRealStateEnum.Lock and UnlockTitle and UnlockContent then
    self.RootWidget.Text_TaskTitle:SetText(GText(UnlockTitle))
    self.RootWidget.Text_TaskDetail:SetText(GText(UnlockContent))
  else
    self.RootWidget.Text_TaskTitle:SetText(QuestWidget.QuestName)
    self.RootWidget.Text_TaskTitle:SetRenderOpacity(0)
    self:AddTimer(0.01, function()
      local TextBlockWidth = UIManager(self):GetWidgetRenderSize(self.RootWidget.Text_TaskTitle)
      self.RootWidget.Text_TaskTitle:SetTextByPixelWidth(QuestWidget.QuestName, TextBlockWidth.X)
      self.RootWidget.Text_TaskTitle:SetRenderOpacity(1)
    end, false, 0, "DelayToShowText")
    self.RootWidget.Text_TaskDetail:SetText(QuestWidget.QuestDeatil)
  end
  self.RootWidget.Text_TaskObject:SetText(GText("UI_QUEST_CONTENT"))
  if QuestWidget.State == QuestRealStateEnum.Doing then
    self.RootWidget.Group_TimeRemaining:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.RootWidget.Group_TimeRemaining:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if QuestWidget.QuestPosition then
    self.RootWidget.Text_Position:SetText(QuestWidget.QuestPosition)
  else
    self.RootWidget.Group_TaskPosition:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if not RewardList then
    self.RootWidget.Group_Title_Rewards:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.RootWidget.ListView_Rewards:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.RootWidget.HB_Reward:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.RootWidget.Group_Title_Rewards:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.RootWidget.Text_TaskRewards:SetText(GText("UI_QUEST_REWARDS"))
    self.RootWidget.ListView_Rewards:ClearListItems()
    self.RootWidget.ListView_Rewards:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:SortReward(RewardList)
  end
  local IsUnLocking = Avatar and Avatar:CheckCondition(UnlockConditionId)
  if not UnlockConditionId then
    IsUnLocking = false
  end
  self.RootWidget.VB_UnlockCondition:ClearChildren()
  if QuestWidget.State == QuestRealStateEnum.Doing and UnlockCondition and not IsUnLocking then
    self.RootWidget.Group_Title_UnlockTask:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.RootWidget.VB_UnlockCondition:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.RootWidget.Text_UnlockTask:SetText(GText("UI_QUEST_CONDITIONREQUEST"))
    for Type, Param in pairs(UnlockCondition) do
      for i = 1, #Param do
        local p = Param[i]
        local IsUnLock = ConditionUtils["Judge" .. Type](Avatar, p)
        local ConditionWidget = self:CreateWidgetNew("TaskUnlockCondition")
        self.RootWidget.VB_UnlockCondition:AddChildToVerticalBox(ConditionWidget)
        ConditionWidget.bIsFocusable = true
        ConditionWidget:Init(IsUnLock, self)
        ConditionWidget:SetConditionText(Type, IsUnLock, p)
        if self["ConditionJump" .. Type] and not IsUnLock then
          ConditionWidget.CanClick = true
          ConditionWidget:BindEventOnClicked(self, self["ConditionJump" .. Type], p)
        end
        ConditionWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
  elseif QuestWidget.State == QuestRealStateEnum.Lock and UnlockCondition and not IsUnLocking then
    self.RootWidget.Group_Title_UnlockTask:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.RootWidget.VB_UnlockCondition:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.RootWidget.Text_UnlockTask:SetText(GText("UI_QUEST_CONDITIONREQUEST"))
    for Type, Param in pairs(UnlockCondition) do
      for i = 1, #Param do
        local p = Param[i]
        local IsUnLock = ConditionUtils["Judge" .. Type](Avatar, p)
        local ConditionWidget = self:CreateWidgetNew("TaskUnlockCondition")
        ConditionWidget:Init(IsUnLock, self)
        ConditionWidget:SetConditionText(Type, IsUnLock, p)
        if self["ConditionJump" .. Type] and not IsUnLock then
          ConditionWidget.CanClick = true
          ConditionWidget:BindEventOnClicked(self, self["ConditionJump" .. Type], p)
        end
        self.RootWidget.VB_UnlockCondition:AddChildToVerticalBox(ConditionWidget)
        ConditionWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
  else
    self.RootWidget.Group_Title_UnlockTask:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.RootWidget.VB_UnlockCondition:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if self.RootWidget.VB_UnlockCondition:GetAllChildren():Length() > 0 then
    local MaxCount = self.RootWidget.VB_UnlockCondition:GetAllChildren():Length()
    for key, value in pairs(self.RootWidget.VB_UnlockCondition:GetAllChildren()) do
      value:SetNavigationRuleCustom(EUINavigation.Left, {
        self,
        function()
          self.CurFocusWidget.Task_SubItem:SetFocus()
        end
      })
      if 1 == key then
        value:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
        value:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
        local NextItem = self.RootWidget.VB_UnlockCondition:GetChildAt(key)
        if NextItem then
          value:SetNavigationRuleExplicit(EUINavigation.Down, NextItem)
        else
          value:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
        end
      elseif key == MaxCount then
        value:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
        value:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
        local PreItem = self.RootWidget.VB_UnlockCondition:GetChildAt(key - 2)
        if PreItem then
          value:SetNavigationRuleExplicit(EUINavigation.Up, PreItem)
        else
          value:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
        end
      else
        local PreItem = self.RootWidget.VB_UnlockCondition:GetChildAt(key - 2)
        if PreItem then
          value:SetNavigationRuleExplicit(EUINavigation.Up, PreItem)
        end
        local NextItem = self.RootWidget.VB_UnlockCondition:GetChildAt(key)
        if NextItem then
          value:SetNavigationRuleExplicit(EUINavigation.Down, NextItem)
        else
          value:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
        end
      end
    end
  end
  if not IsUnLocking then
    self.RootWidget.Common_Button_Text_PC:ForbidBtn(true)
    if not self.IsForbiddenButton then
      self.RootWidget.Common_Button_Text_PC:PlayAnimation(self.RootWidget.Common_Button_Text_PC.Btn_Forbidden)
    end
    self.IsForbiddenButton = true
    self:SetTrackButtonText(false)
  else
    self.RootWidget.Common_Button_Text_PC:ForbidBtn(false)
    if self.IsForbiddenButton then
      self.RootWidget.Common_Button_Text_PC:PlayAnimation(self.RootWidget.Common_Button_Text_PC.Btn_Normal)
    end
    self.IsForbiddenButton = false
    self:SetTrackButtonText(self.TrackingQuestId == QuestChainId)
  end
  if self.TrackingQuestId == QuestChainId and not self.CurTrackingQuest then
    self.CurTrackingQuest = self.CurSelectQuest
  end
  if DataMgr.QuestChain[QuestChainId] and DataMgr.QuestChain[QuestChainId].QuestChainType == Const.LimTimeQuestChainType then
    self.RootWidget.Group_TimeRemaining:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.RootWidget.Com_Time:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:UpdateComTime(QuestChainId)
  else
    self.RootWidget.Group_TimeRemaining:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Task_Main:UpdateComTime(InQuestChainId)
  if DataMgr.QuestChain[InQuestChainId] and DataMgr.QuestChain[InQuestChainId].StartTime and DataMgr.QuestChain[InQuestChainId].EndTime then
    local EndTime = DataMgr.QuestChain[InQuestChainId].EndTime - TimeUtils.NowTime()
    if EndTime > 0 then
      local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(DataMgr.QuestChain[InQuestChainId].EndTime, TimeUtils.NowTime())
      self.RootWidget.Com_Time:SetTimeText(GText(""), RemainTimeDict)
    end
  end
end

function WBP_Task_Main:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
  elseif InKeyName == CommonUtils:GetActionMappingKeyName("OpenTask") then
    self.IsCanCloseByHotKey = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Task_Main:OnKeyDown(MyGeometry, InKeyEvent)
  if CommonUtils:IfExistSystemGuideUI(self) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local KeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Q" == KeyName then
    self.CommonTabWidget:TabToLeft()
  elseif "E" == KeyName then
    self.CommonTabWidget:TabToRight()
  elseif "Escape" == KeyName then
    self:OnReturnKeyDown()
  elseif KeyName == CommonUtils:GetActionMappingKeyName("OpenTask") and self.IsCanCloseByHotKey then
    self:PlayOutAnim()
  elseif "Gamepad_LeftThumbstick" == KeyName then
    if self.IsTaskEmpty == true then
      return
    end
    self.RootWidget.ListView_Rewards:NavigateToIndex(0)
    self:IsShowGamePad(false)
    self:InitTabPadKeyInfoForReward()
  elseif "Gamepad_Special_Right" == KeyName then
    if self.CommonTabWidget.ReasoningEntrance then
      self:OnClickReasoningEntrance()
    end
  elseif "Gamepad_FaceButton_Top" == KeyName then
    if self.IsTaskEmpty == true then
      return
    end
    if self.RootWidget.Group_Jump:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
      self:OnClickJumpBtn()
    end
  elseif "Gamepad_FaceButton_Left" == KeyName then
    if self.IsTaskEmpty == true then
      return
    end
    if self.RootWidget.ListView_Rewards:HasFocusedDescendants() then
      return
    end
    if self.RootWidget.Common_Button_Text_PC.IsForbidden then
      UIManager(self):ShowUITip("CommonToastMain", GText("UI_QUEST_TRACK_LOCK"), 1.5)
      return
    end
    self:OnTrackButtonClicked()
  elseif "Gamepad_FaceButton_Right" == KeyName then
    if self.IsTaskEmpty == true then
      self:OnReturnKeyDown()
    elseif self.RootWidget.List_Task:HasFocusedDescendants() then
      self:OnReturnKeyDown()
    elseif self.RootWidget.ListView_Rewards:HasFocusedDescendants() or self.RootWidget.ListView_Rewards:HasAnyUserFocus() then
      self.CurFocusWidget.Task_SubItem:SetFocus()
    elseif self.RootWidget.VB_UnlockCondition:HasFocusedDescendants() then
      self.CurFocusWidget.Task_SubItem:SetFocus()
    elseif self.RootWidget:HasAnyUserFocus() then
      self:OnReturnKeyDown()
    end
  elseif "Gamepad_LeftShoulder" == KeyName or "Gamepad_RightShoulder" == KeyName then
    IsEventHandled = self.CommonTabWidget:Handle_KeyEventOnGamePad(KeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Task_Main:OnReturnKeyDown(bClose)
  if not self:IsAnimationPlaying(self.In) then
    self:PlayOutAnim(bClose)
  end
end

function WBP_Task_Main:PlayOutAnim(bClose)
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self:UnbindAllFromAnimationFinished(self.Out)
  if nil == bClose or true == bClose then
    self:BindToAnimationFinished(self.Out, {
      self,
      self.Close
    })
  else
    self:BindToAnimationFinished(self.Out, {
      self,
      self.SetTrackingQuestInfoToServer
    })
  end
  self:PlayAnimation(self.Out)
end

function WBP_Task_Main:Close()
  EMCache:Set("QuestPantlTab", self.SaveTabId or self.CurTabId, true)
  self.Super.Close(self)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if self.CurSelectQuest then
    TaskUtils.TaskMainLastSelectId = self.CurSelectQuest.QuestChainId
  else
    TaskUtils.TaskMainLastSelectId = nil
  end
  EventManager:FireEvent(EventID.OnReceiveNewQuest)
  self.RootWidget.List_Task:ClearListItems()
  local ServerTrackId = Avatar.TrackingQuestChainId
  local ClientTrackId = self.TrackingQuestId
  if ServerTrackId ~= ClientTrackId then
    if Avatar.QuestChains[self.TrackingQuestId] then
      TaskUtils:ResumQuestTaskBarOnTrack(ServerTrackId, ClientTrackId, Avatar.QuestChains[self.TrackingQuestId].DoingQuestId)
    else
      TaskUtils:ResumQuestTaskBarOnTrack(ServerTrackId, nil, nil)
    end
  end
  if ServerTrackId and not ClientTrackId then
    Avatar:CancelQuestTracking(ServerTrackId)
  end
  if self.CurTrackingQuest and self.CurTrackingQuest.SubRegionId <= 0 then
    self:SetTrackingQuestInfoToServer()
  end
end

function WBP_Task_Main:CheckNeedShowLevelMap()
  local bShowLevelMap = false
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local HomeBaseRegionId = Const.HomeBaseSubRegionId
  
  local function CheckIsNeedShowLevelMap(AvatarRegionId, TaskSubRegionId)
    if 0 == TaskSubRegionId then
      return false
    end
    if AvatarRegionId == TaskSubRegionId and TaskSubRegionId == HomeBaseRegionId then
      return false
    end
    if AvatarRegionId ~= TaskSubRegionId and TaskSubRegionId == HomeBaseRegionId then
      return true
    end
    return true
  end
  
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local TrackingQuestData = TaskUtils:GetTrackingQuestDetailInfo()
  local IsFairyLand = false
  if TrackingQuestData and TrackingQuestData.IsFairyLand then
    IsFairyLand = TrackingQuestData.IsFairyLand
  end
  local TargetSubRegionId = 0
  if self.CurTrackingQuest then
    TargetSubRegionId = MissionIndicatorManager:GetTargetTaskSubRegionId(self.CurTrackingQuest.QuestChainId, Avatar.QuestChains[self.CurTrackingQuest.QuestChainId].DoingQuestId)
  end
  local IsInRegion = not TaskUtils:CheckIsNeedLoadLevelMap(TargetSubRegionId, Avatar.CurrentRegionId)
  if self.IsTrackingButtonClicked and self.CurTrackingQuest and false == IsFairyLand and self:CheckIsInSameRegion(Avatar.CurrentRegionId, TargetSubRegionId) then
    local _, RegionMapId = TaskUtils:GetQuestMapInfo(self.CurTrackingQuest.QuestChainId)
    if not RegionMapId then
      return
    end
    if not (RegionMapId and DataMgr.RegionMap[RegionMapId]) or not DataMgr.RegionMap[RegionMapId].RegionId then
      return
    end
    local RegionId = DataMgr.RegionMap[RegionMapId].RegionId
    if false == IsInRegion then
      bShowLevelMap = true
      local MainMap = UIManager:LoadUINew("LevelMapMain", true)
      if MainMap then
        MainMap.RealWildMap:ChangeRegionForSmartIndicator(TargetSubRegionId, self.CurTrackingQuest.QuestChainId)
      end
    else
      EventManager:FireEvent(EventID.OnSetQuestTracking, self.CurSelectQuest.QuestChainId)
      EventManager:FireEvent(EventID.PlayLoopAnimAfterBarAnim)
    end
  elseif self.CurTrackingQuest and self.CurSelectQuest then
    EventManager:FireEvent(EventID.OnSetQuestTracking, self.CurSelectQuest.QuestChainId)
  end
  if false == bShowLevelMap then
    self:Close()
  end
end

function WBP_Task_Main:CheckIsInSameRegion(AvatarRegionId, TaskSubRegionId)
  local HomeBaseRegionId = Const.HomeBaseSubRegionId
  if 0 == TaskSubRegionId then
    return false
  end
  if AvatarRegionId == TaskSubRegionId and TaskSubRegionId == HomeBaseRegionId then
    return false
  end
  if AvatarRegionId ~= TaskSubRegionId and TaskSubRegionId == HomeBaseRegionId then
    return true
  end
  return true
end

function WBP_Task_Main:ShowDeliverPopupUI(InFairyLandRegionId, InQuestChainId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self:SetTrackingQuestInfoToServer()
  if Avatar.CurrentRegionId ~= InFairyLandRegionId then
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    if not DataMgr.QuestChain[InQuestChainId] then
      return
    end
    local TaskName = DataMgr.QuestChain[InQuestChainId].QuestChainName
    local Params = {
      ShortText = string.format("%s <H>%s</>", GText("UI_Prompt_QuestTrans"), GText(TaskName)),
      LeftCallbackObj = self,
      LeftCallbackFunction = self.CancelDeliverTo,
      RightCallbackObj = self,
      RightCallbackFunction = self.DoDeliverTo,
      CloseBtnCallbackObj = self,
      CloseBtnCallbackFunction = self.CancelDeliverTo
    }
    UIManager:ShowCommonPopupUI(100160, Params)
  end
end

function WBP_Task_Main:CancelDeliverTo()
end

function WBP_Task_Main:DoDeliverTo()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if self.CurTrackingQuest and self.CurTrackingQuest.QuestChainId and self.CurTrackingQuest.QuestID then
    local TrackingQuestData = TaskUtils:GetQuestDetail(self.CurTrackingQuest.QuestChainId, self.CurTrackingQuest.QuestID)
    if IsValid(GameMode) and TrackingQuestData and TrackingQuestData.SubRegionId > 0 then
      GameMode:HandleLevelDeliver(UE4.EModeType.ModeRegion, TrackingQuestData.SubRegionId, 1, true)
    end
  end
end

function WBP_Task_Main:CheckAvatarIsInQuestSubRegion()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
  local _, RegionMapId = TaskUtils:GetTrackingQuestMapInfo()
  if not RegionMapId then
    return false
  end
  if not (RegionMapId and DataMgr.RegionMap[RegionMapId]) or not DataMgr.RegionMap[RegionMapId].RegionId then
    return false
  end
  local RegionId = DataMgr.RegionMap[RegionMapId].RegionId
  local IsInRegion = Avatar.CurrentRegionId and RegionId == DataMgr.SubRegion[Avatar.CurrentRegionId].RegionId
  return IsInRegion
end

function WBP_Task_Main:Destruct()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
  EventManager:RemoveEvent(EventID.CheckShowMap, self)
  AudioManager(self):SetEventSoundParam(self, "OpenTaskMain", {ToEnd = 1})
  self.RootWidget.Btn_Reasoning.OnClicked:Clear()
  for _, Data in pairs(self.TempQuestTabData) do
    if Data then
      local RedDotName = Data.TabName
      ReddotManager.RemoveListener(RedDotName, self)
    end
  end
  ReddotManager.RemoveListener("DetectiveQuestion", self)
  ReddotManager.RemoveListener("DetectiveAnswer", self)
  WBP_Task_Main.Super.Destruct(self)
end

function WBP_Task_Main:GetListItemById(QuestChainId)
  local AllListItems = self.RootWidget.List_Task:GetListItems() or {}
  local TargetItem, Index
  for Idx, Item in pairs(AllListItems) do
    if Item.QuestChainId == QuestChainId then
      TargetItem = Item
      Index = Idx
      break
    end
  end
  if TargetItem then
    return Index, TargetItem
  end
end

function WBP_Task_Main:InitTrackingButton()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.TrackingQuestId = Avatar.TrackingQuestChainId
  self:ReSwitchTaskBarTrackingQuest(self.TrackingQuestId)
  self.SaveTabId = self.TrackingQuestId and EMCache:Get("QuestPantlTab", true) or nil
  self:SetTrackButtonText(self.TrackingQuestId ~= nil)
  self.RootWidget.Common_Button_Text_PC:BindEventOnClicked(self, self.OnTrackButtonClicked)
  self.RootWidget.Common_Button_Text_PC:BindForbidStateExecuteEvent(self, function()
    UIManager(self):ShowUITip("CommonToastMain", GText("UI_QUEST_TRACK_LOCK"), 1.5)
    return
  end)
  self.RootWidget.Common_Button_Text_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Task_Main:ReSwitchTaskBarTrackingQuest(InNewTrackingQuestChainId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if Avatar.QuestChains[InNewTrackingQuestChainId] then
    local DoingQuestId = Avatar.QuestChains[InNewTrackingQuestChainId].DoingQuestId
    local QuestExtraInfo = TaskUtils:GetQuestExtraInfo(InNewTrackingQuestChainId, DoingQuestId)
    if QuestExtraInfo and not IsEmptyTable(QuestExtraInfo) then
      for _, Data in pairs(QuestExtraInfo) do
        if Data.Node then
          Data.Node:OnCancelTrack()
        end
      end
    end
  end
  local TaskBar = TaskUtils:GetTaskBarWidget()
  if TaskBar and InNewTrackingQuestChainId > 0 then
    TaskBar:SwitchTaskBarContentByTracking(true, false)
  end
end

function WBP_Task_Main:OnTrackButtonClicked()
  if not TaskUtils:JudgeCanTrack() then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("Quest_Tips_QuestTrackLock"))
    return
  end
  self.CurSelectId = self.CurSelectQuest.QuestChainId
  if -1 == self.CurSelectId then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("AllQuest_OverTips"))
    return
  end
  if self.TrackingQuestId == nil or self.TrackingQuestId ~= self.CurSelectId then
    if self.CurTrackingQuest then
      self.CurTrackingQuest:CancelTracking()
    end
    self.TrackingQuestId = self.CurSelectId
    self.SaveTabId = self.CurTabId
    self.CurTrackingQuest = self.CurSelectQuest
    self.CurTrackingQuest:OnTracking(self.TrackingQuestId)
    self.IsTrackingButtonClicked = true
    local TrackingQuestData = TaskUtils:GetQuestDetail(self.CurTrackingQuest.QuestChainId, self.CurTrackingQuest.QuestID)
    if TrackingQuestData and TrackingQuestData.IsFairyLand and TrackingQuestData.SubRegionId > 0 then
      self:SetTrackButtonText(self.TrackingQuestId ~= nil)
      self:ShowDeliverPopupUI(TrackingQuestData.SubRegionId, self.CurSelectQuest.QuestChainId)
      return
    end
    if self.CurTrackingQuest.SubRegionId > 0 then
      self:SetTrackingQuestInfoToServer()
    elseif TaskUtils:GetQuestInterfaceJump(self.CurSelectQuest.QuestID) then
      self:SetTrackingQuestInfoToServer()
      PageJumpUtils:JumpToTargetPageByJumpId(TaskUtils:GetQuestInterfaceJumpId(self.CurSelectQuest.QuestID))
    end
  elseif self.TrackingQuestId == self.CurSelectId then
    self.CurSelectQuest:CancelTracking()
    self.TrackingQuestId = nil
    self.SaveTabId = nil
    self.CurTrackingQuest = nil
  else
    self.CurTrackingQuest:CancelTracking()
    self.TrackingQuestId = nil
    self.SaveTabId = nil
    self.CurTrackingQuest = nil
  end
  self:SetTrackButtonText(self.TrackingQuestId ~= nil)
end

function WBP_Task_Main:OnClickJumpBtn()
  if not TaskUtils:JudgeCanTrack() then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("Quest_Tips_QuestTrackLock"))
    return
  end
  self.CurSelectId = self.CurSelectQuest.QuestChainId
  if self.TrackingQuestId ~= nil and self.TrackingQuestId == self.CurSelectId then
    self.TrackingQuestId = self.CurSelectId
    self.CurTrackingQuest = self.CurSelectQuest
    self.IsTrackingButtonClicked = true
    local TrackingQuestData = TaskUtils:GetQuestDetail(self.CurTrackingQuest.QuestChainId, self.CurTrackingQuest.QuestID)
    if TrackingQuestData and TrackingQuestData.IsFairyLand and TrackingQuestData.SubRegionId > 0 then
      self:SetTrackButtonText(self.TrackingQuestId ~= nil)
      self:ShowDeliverPopupUI(TrackingQuestData.SubRegionId, self.CurSelectQuest.QuestChainId)
      return
    end
    if self.CurTrackingQuest.SubRegionId > 0 then
      self:SetTrackingQuestInfoToServer()
    elseif TaskUtils:GetQuestInterfaceJump(self.CurSelectQuest.QuestID) then
      self:SetTrackingQuestInfoToServer()
      PageJumpUtils:JumpToTargetPageByJumpId(TaskUtils:GetQuestInterfaceJumpId(self.CurSelectQuest.QuestID))
    end
  end
end

function WBP_Task_Main:SetTrackButtonText(IsTracking)
  if IsTracking then
    self.RootWidget.Common_Button_Text_PC:SetText(GText("UI_QUEST_STOPTRACK"))
    self.RootWidget.Group_Jump:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.UsingGamepad then
      self.RootWidget.Key_Map:SetVisibility(UE4.ESlateVisibility.Visible)
    end
  else
    self.RootWidget.Common_Button_Text_PC:SetText(GText("UI_QUEST_TRACK"))
    self.RootWidget.Group_Jump:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if self.UsingGamepad then
      self.RootWidget.Key_Map:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function WBP_Task_Main:ScrollToSelectedWidget(CurSelectId)
  local TaskItemUIs = self.RootWidget.List_Task:GetDisplayedEntryWidgets()
  if nil == TaskItemUIs or 0 == TaskItemUIs:Num() then
    return
  end
  local TaskMaxCount = UIUtils.GetListViewContentMaxCount(self.RootWidget.List_Task, TaskItemUIs)
  local AllChainList = self.RootWidget.List_Task.ListItems:ToTable()
  if TaskMaxCount <= #AllChainList then
    self.RootWidget.List_Task:SetScrollbarVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.RootWidget.List_Task:SetScrollbarVisibility(UE4.ESlateVisibility.Collapsed)
  end
  for _, ListItem in pairs(AllChainList) do
    local Index = self.RootWidget.List_Task:GetIndexForItem(ListItem) + 1
    if ListItem.QuestChainId == CurSelectId and TaskMaxCount < Index then
      self.RootWidget.List_Task:NavigateToIndex(Index - 1)
      return
    end
  end
end

function WBP_Task_Main:RenameWidget()
  self.PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
  if self.PlatformName == "PC" then
    self.CommonTabWidget = self.Common_Tab
  elseif self.PlatformName == "Mobile" then
    self.CommonTabWidget = self.WBP_Com_Tab_M
  end
  self.RootWidget = self.WBP_Task_Root
end

function WBP_Task_Main:ConditionJumpQuestChain(QuestChainId)
  local Data = DataMgr.QuestChain[QuestChainId]
  if not QuestChainId or not Data then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local QuestChainType
  local AllQuestData = Avatar.QuestChains or {}
  if Avatar.QuestChains[QuestChainId] == nil then
    return
  end
  local IsExisted = false
  local IsExistedInMap = false
  for DataQuestChainId, Data in pairs(AllQuestData) do
    if DataQuestChainId == QuestChainId then
      QuestChainType = DataMgr.QuestChain[DataQuestChainId].QuestChainType
      local IsShowByCheck = self:CheckQuestIsShowByCheckState(DataQuestChainId, Data)
      if 3 ~= Data.State and Data.CanShow and IsShowByCheck then
        IsExisted = true
        break
      end
    end
  end
  if not IsExisted then
    for QuestChainId, QuestChainData in pairs(DataMgr.QuestChain) do
      if nil == QuestChainData or nil == QuestChainData.SpecialQuestDisplayName or nil == QuestChainData.QuestNpcId or QuestChainData.QuestChainType ~= Const.SpecialSideQuestChainType then
      elseif Avatar.QuestChains[QuestChainId] and 1 == Avatar.QuestChains[QuestChainId].State and GuidePointLocData[QuestChainData.SpecialQuestDisplayName] and GuidePointLocData[QuestChainData.SpecialQuestDisplayName].SubRegionId > 0 then
        IsExistedInMap = true
        break
      end
    end
  end
  if not IsExisted and not IsExistedInMap then
    DebugPrint("ERROR::", "\228\187\187\229\138\161:" .. QuestChainId .. "\229\156\168\228\187\187\229\138\161\233\157\162\230\157\191\229\146\140\229\156\176\229\155\190\228\184\173\233\131\189\228\184\141\229\173\152\229\156\168")
  elseif IsExisted then
    local function AfterDisplayQuestWidget()
      local AllDisplayWidget = self.RootWidget.List_Task:GetDisplayedEntryWidgets():ToTable() or {}
      
      for _, Widget in pairs(AllDisplayWidget) do
        if Widget.QuestChainId == QuestChainId then
          Widget.Task_SubItem:SelectQuestProactively()
          break
        end
      end
    end
    
    local TabId = 1
    for k, v in pairs(ConstQuestTabData) do
      if v.QuestType == QuestChainType then
        TabId = k
        break
      end
    end
    if TabId ~= self.CurTabId then
      self.JumpQuestChainId = QuestChainId
      self.CommonTabWidget:SelectTab(TabId)
    else
      AfterDisplayQuestWidget()
    end
  elseif not IsExisted and IsExistedInMap then
    local TargetSubRegionId = MissionIndicatorManager:GetTargetTaskSubRegionId(QuestChainId, Avatar.QuestChains[QuestChainId].DoingQuestId)
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    local MainMap = UIManager:LoadUINew("LevelMapMain")
    if MainMap then
      MainMap.RealWildMap:ChangeRegionForSmartIndicator(TargetSubRegionId, QuestChainId)
    end
  end
end

function WBP_Task_Main:IsInTab(QuestChainId, TabId)
  local Data = DataMgr.QuestChain[QuestChainId]
  if not Data then
    return false
  end
  local TabQuestType = 1
  for k, v in pairs(ConstQuestTabData) do
    if k == TabId then
      TabQuestType = v.QuestType
      break
    end
  end
  return Data.QuestChainType == TabQuestType or 1 == TabId
end

function WBP_Task_Main:GetCurTabFirstQuestId(QuestData, TabId)
  local CurTabQuestType = -1
  if ConstQuestTabData[TabId] and ConstQuestTabData[TabId].QuestType then
    CurTabQuestType = ConstQuestTabData[TabId].QuestType
  end
  if -1 ~= CurTabQuestType then
    if QuestData[CurTabQuestType] then
      for _, Data in ipairs(QuestData[CurTabQuestType]) do
        return Data.QuestChainId or 0
      end
    end
  else
    for Type, Datas in pairs(QuestData) do
      if Datas and #Datas > 0 then
        for _, Data in ipairs(Datas) do
          return Data.QuestChainId or 0
        end
      end
    end
  end
  return 0
end

function WBP_Task_Main:GetQuestInfoString(StringInfo)
  return GText(StringInfo)
end

function WBP_Task_Main:SetTrackingQuestInfoToServer()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local ServerTrackId = Avatar.TrackingQuestChainId
  local ClientTrackId = self.TrackingQuestId
  if ServerTrackId ~= ClientTrackId then
    if Avatar.QuestChains[self.TrackingQuestId] then
      TaskUtils:ResumQuestTaskBarOnTrack(ServerTrackId, ClientTrackId, Avatar.QuestChains[self.TrackingQuestId].DoingQuestId)
    else
      TaskUtils:ResumQuestTaskBarOnTrack(ServerTrackId, nil, nil)
    end
  end
  if ServerTrackId and not ClientTrackId then
    Avatar:CancelQuestTracking(ServerTrackId)
  elseif ServerTrackId ~= ClientTrackId then
    Avatar:SetQuestTracking(ClientTrackId, self.CurTrackingQuest.SubRegionId)
  else
    Avatar:SetQuestTracking(ClientTrackId, self.CurTrackingQuest.SubRegionId)
  end
end

function WBP_Task_Main:SortReward(RewardList)
  local Res = {}
  local Rewards = {}
  for _, RewardId in pairs(RewardList) do
    local RewardInfo = DataMgr.Reward[RewardId]
    if RewardInfo then
      local Ids = RewardInfo.Id or {}
      local RewardCount = RewardInfo.Count or {}
      local TableName = RewardInfo.Type or {}
      for i = 1, #Ids do
        table.insert(Rewards, Ids[i])
        Res[Ids[i]] = {
          ItemId = Ids[i],
          Count = RewardUtils:GetCount(RewardCount[i]),
          Icon = ItemUtils.GetItemIconPath(Ids[i], TableName[i]),
          Rarity = ItemUtils.GetItemRarity(Ids[i], TableName[i]),
          ItemType = TableName[i]
        }
      end
    end
  end
  table.sort(Rewards, function(A, B)
    local TypeA = Res[A].ItemType
    local TypeB = Res[B].ItemType
    if "Reward" == TypeA and "Reward" ~= TypeB then
      return false
    end
    if "Reward" == TypeB and "Reward" ~= TypeA then
      return true
    end
    local RarityA = Res[A].Rarity
    local RarityB = Res[B].Rarity
    local IdA = Res[A].ItemId
    local IdB = Res[B].ItemId
    if "Reward" == TypeA and "Reward" == TypeB then
      if RarityA == RarityB then
        return IdA < IdB
      else
        return RarityA > RarityB
      end
    end
    local WeightA = DataMgr.RewardType[TypeA].DungeonRewardSeq
    local WeightB = DataMgr.RewardType[TypeB].DungeonRewardSeq
    if RarityA == RarityB then
      if WeightA == WeightB then
        return IdA < IdB
      elseif nil == WeightA and WeightB then
        return WeightB
      elseif nil == WeightB and WeightA then
        return WeightA
      else
        return WeightA > WeightB
      end
    else
      return RarityA > RarityB
    end
  end)
  for _, Id in pairs(Rewards) do
    local ItemId = Res[Id].ItemId
    local Count = Res[Id].Count
    local Icon = Res[Id].Icon
    local Rarity = Res[Id].Rarity
    local ItemType = Res[Id].ItemType
    local RewardContent = TaskUtils:CreateRewardContent({
      Id = ItemId,
      Count = Count,
      OwnerWidget = self,
      Icon = Icon,
      Rarity = Rarity,
      IsShowDetails = true,
      ItemType = ItemType
    })
    
    function RewardContent.AfterInitCallback(Widget)
      Widget:BindEvents(self, {
        OnMenuOpenChanged = self.OnRewardMenuOpenChanged
      })
    end
    
    self.RootWidget.ListView_Rewards:AddItem(RewardContent)
  end
end

function WBP_Task_Main:OnRewardMenuOpenChanged(bIsOpen)
  if bIsOpen and self.UsingGamepad then
    self.CommonTabWidget:UpdateBottomKeyInfo({})
  elseif not bIsOpen and self.UsingGamepad then
    self:InitTabPadKeyInfoForReward()
  end
end

function WBP_Task_Main:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Task_Main:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function WBP_Task_Main:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.RootWidget.Reasoning_Entrance:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self.UsingGamepad = false
    self.RootWidget:SetFocus()
    self.RootWidget.Key_Map:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.RootWidget.Key_Title_Rewards:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:IsShowGamePad(false)
    if self.CommonTabWidget.SizeBox_Left then
      self.CommonTabWidget.SizeBox_Left:SetVisibility(UE4.ESlateVisibility.Visible)
      self.CommonTabWidget.SizeBox_Right:SetVisibility(UE4.ESlateVisibility.Visible)
    end
  else
    self.UsingGamepad = true
    self:InitPadKeyInfo()
    self:SetFocusOnTrackWidget(self.CurSelectId)
  end
end

function WBP_Task_Main:InitPadKeyInfo()
  self.RootWidget.Key_Map:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  self.RootWidget.Reasoning_Entrance:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.RootWidget.Key_Title_Rewards:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
  if self.CommonTabWidget.ReasoningEntrance then
    self.CommonTabWidget.ReasoningEntrance.Key_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Menu"}
      }
    })
    self.CommonTabWidget.ReasoningEntrance.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Visible)
  end
  self.RootWidget.Key_Title_Rewards:SetVisibility(UE4.ESlateVisibility.Visible)
  self.RootWidget.Key_Map:SetVisibility(UE4.ESlateVisibility.Visible)
  self.RootWidget.Common_Button_Text_PC:SetGamePadImg("X")
end

function WBP_Task_Main:InitTabPadKeyInfo()
  if self.PlatformName == "Mobile" then
    return
  end
  self.CommonTabWidget:UpdateBottomKeyInfo({
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_CTL_Squad_Expand"),
      bLongPress = false
    },
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
  })
end

function WBP_Task_Main:InitTabPadKeyInfoForReward()
  if self.PlatformName == "Mobile" then
    return
  end
  self.CommonTabWidget:UpdateBottomKeyInfo({
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Controller_CheckDetails"),
      bLongPress = false
    },
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
  })
end

function WBP_Task_Main:InitTabPadKeyInfoForBack()
  if self.PlatformName == "Mobile" then
    return
  end
  self.CommonTabWidget:UpdateBottomKeyInfo({
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
  })
end

function WBP_Task_Main:InitTabPadKeyInfoForCondition()
  if self.PlatformName == "Mobile" then
    return
  end
  self.CommonTabWidget:UpdateBottomKeyInfo({
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_LOGIN_ENSURE"),
      bLongPress = false
    },
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
  })
end

function WBP_Task_Main:GetCurTrackWidget(TrackingQuestId)
  if nil == TrackingQuestId then
    return
  end
  for _, ListItem in pairs(self.RootWidget.List_Task:GetListItems():ToTable()) do
    local Index = self.RootWidget.List_Task:GetIndexForItem(ListItem) + 1
    if ListItem.QuestChainId == TrackingQuestId then
      return ListItem
    end
  end
  return nil
end

function WBP_Task_Main:SetFocusOnTrackWidget(TrackingQuestId)
  local CurTrackWidget = self:GetCurTrackWidget(TrackingQuestId)
  if nil == CurTrackWidget then
    local CurSelect = self:GetCurTrackWidget(self.CurSelectQuest)
    if CurSelect then
      local Index = self.RootWidget.List_Task:GetIndexForItem(CurSelect)
      self.RootWidget.List_Task:NavigateToIndex(Index)
    else
      self.RootWidget.List_Task:NavigateToIndex(0)
    end
  else
    local Index = self.RootWidget.List_Task:GetIndexForItem(CurTrackWidget)
    self.RootWidget.List_Task:NavigateToIndex(Index)
  end
end

function WBP_Task_Main:OnLeftStickUp()
end

function WBP_Task_Main:OnNavigationRight()
  if self.RootWidget.VB_UnlockCondition:GetChildrenCount() <= 0 then
    return
  else
    for key, value in pairs(self.RootWidget.VB_UnlockCondition:GetAllChildren()) do
      if not value.Finish then
        return value
      end
    end
  end
end

function WBP_Task_Main:IsShowGamePad(IsShow)
  if self.PlatformName == "Mobile" then
    return
  end
  if IsShow then
    self.CommonTabWidget.SizeBox_Left:SetVisibility(UE4.ESlateVisibility.Visible)
    self.CommonTabWidget.SizeBox_Right:SetVisibility(UE4.ESlateVisibility.Visible)
    self.RootWidget.Key_Title_Rewards:SetVisibility(UE4.ESlateVisibility.Visible)
    self.RootWidget.Key_Map:SetVisibility(UE4.ESlateVisibility.Visible)
    self.RootWidget.Common_Button_Text_PC:SetGamePadVisibility(UE4.ESlateVisibility.Visible)
    if self.CommonTabWidget.ReasoningEntrance then
      self.CommonTabWidget.ReasoningEntrance.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Visible)
    end
  else
    self.CommonTabWidget.SizeBox_Left:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.CommonTabWidget.SizeBox_Right:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.RootWidget.Key_Title_Rewards:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.RootWidget.Common_Button_Text_PC:SetGamePadVisibility(UE4.ESlateVisibility.Collapsed)
    self.RootWidget.Key_Map:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if self.CommonTabWidget.ReasoningEntrance then
      self.CommonTabWidget.ReasoningEntrance.Key_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function WBP_Task_Main:ReceiveEnterState(StackAction)
  WBP_Task_Main.Super.ReceiveEnterState(self, StackAction)
  if self.IsCanReceive == true then
    if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
      self:InitPadKeyInfo()
    end
    if self.CurFocusWidget then
      self.CurFocusWidget.Task_SubItem:SetFocus()
    end
  end
  if self.AutoClose and 1 == StackAction then
    self.AutoClose = false
    self:Close()
  end
end

function WBP_Task_Main:OnClickReasoningEntrance()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  local UIManager = self:GetGameInstance():GetGameUIManager()
  UIManager:LoadUINew("DetectiveMinigame")
end

function WBP_Task_Main:UpdateReasoningRedDot()
  local HasNewQuestionOrClue = ReasoningUtils:IsHasNewQuestionOrClue()
  if self.CommonTabWidget and self.CommonTabWidget.ReasoningEntrance then
    if 2 == HasNewQuestionOrClue then
      self.CommonTabWidget.ReasoningEntrance.Text_Clue:SetText(GText("Minigame_Textmap_100303"))
      self.CommonTabWidget.ReasoningEntrance.Panel_Clue:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.CommonTabWidget.ReasoningEntrance.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
    elseif 1 == HasNewQuestionOrClue then
      self.CommonTabWidget.ReasoningEntrance.Panel_Clue:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.CommonTabWidget.ReasoningEntrance.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.CommonTabWidget.ReasoningEntrance.Panel_Clue:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.CommonTabWidget.ReasoningEntrance.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function WBP_Task_Main:ShouldShowReasoningEntrance()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local UnlockedQuestions = Avatar.DetectiveGameUnlockedQuestions or {}
  local UnlockedResults = Avatar.DetectiveGameUnlockedResult or {}
  return false
end

return WBP_Task_Main
