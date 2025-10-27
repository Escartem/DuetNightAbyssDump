require("UnLua")
local ActivityCommon = require("BluePrints.UI.WBP.Activity.ActivityCommon")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local M = Class()

function M:GenerateAllDataInfo()
  ActivityUtils.RefreshActivityReddotNode()
  local SubTabItems = self:GenerateCurrentSubTabItems()
  local TopTabInfo = self:GetTopTabInfo()
  self:RefreshBaseInfo(TopTabInfo, SubTabItems, self.ActivityItemClick, self.HandleVirtualClickInGamePad, self.NeedJumpToTabId or 1)
  self:RefreshDynamicInfo()
  self:AddTimer(0.15, function()
    if not self then
      return
    end
    if not self.NeedJumpToTabId then
    else
      self.NeedJumpToTabId = nil
    end
  end)
  self.List_Tab.BP_OnItemSelectionChanged:Add(self, self.OnSelectActivityPageChanged)
end

function M:GenerateCurrentSubTabItems()
  self.AllCurrentActivityInfo, self.AllAllActivityTabIdx = ActivityUtils.GetCurrentAllActivityWithoutSystemCheck()
  self.SubTabItems = {}
  local Avatar = GWorld:GetAvatar()
  local LimitUndone, LimitDone = {}, {}
  local NormalUndone, NormalDone = {}, {}
  local ActivityInfo = {}
  local LimitCount, NormalCount = 0, 0
  for _, v in ipairs(self.AllAllActivityTabIdx) do
    local TabConfigInfo = DataMgr.EventTab[v]
    local MainConfigInfo = TabConfigInfo and DataMgr.EventMain[TabConfigInfo.EventId[1]]
    if not MainConfigInfo then
    else
      local bPermanentEvent = ActivityUtils.CheckIsPermanentEvent(TabConfigInfo.EventId[1])
      local Item = {
        Text = GText(TabConfigInfo.EventTabName),
        IconPath = TabConfigInfo.EventIcon,
        bLimit = not bPermanentEvent,
        TabId = TabConfigInfo.EventTabId,
        EventId = TabConfigInfo.EventId,
        EventBgPath = TabConfigInfo.EventTabBg,
        EventTabIconPath = TabConfigInfo.EventTabIcon
      }
      local isDone = false
      if Avatar and Item.EventId and Item.EventId[1] then
        local doneFlag = Avatar.CompletedActivity and Avatar.CompletedActivity[Item.EventId[1]]
        isDone = true == doneFlag or 1 == doneFlag
      end
      if bPermanentEvent then
        NormalCount = NormalCount + 1
        if isDone then
          table.insert(NormalDone, Item)
        else
          table.insert(NormalUndone, Item)
        end
      else
        LimitCount = LimitCount + 1
        if isDone then
          table.insert(LimitDone, Item)
        else
          table.insert(LimitUndone, Item)
        end
      end
    end
  end
  local ordered = {}
  for _, t in ipairs(LimitUndone) do
    table.insert(ordered, t)
  end
  for _, t in ipairs(LimitDone) do
    table.insert(ordered, t)
  end
  for _, t in ipairs(NormalUndone) do
    table.insert(ordered, t)
  end
  for _, t in ipairs(NormalDone) do
    table.insert(ordered, t)
  end
  self.ActivityInfoIdxOffset = 100
  ActivityInfo = {}
  local limitTotal = #LimitUndone + #LimitDone
  local idx = 0
  
  local function fillLimit(list)
    for _, value in ipairs(list) do
      idx = idx + 1
      ActivityInfo[idx] = value.EventId
    end
  end
  
  fillLimit(LimitUndone)
  fillLimit(LimitDone)
  local normalIdx = 0
  
  local function fillNormal(list)
    for _, value in ipairs(list) do
      normalIdx = normalIdx + 1
      ActivityInfo[self.ActivityInfoIdxOffset + normalIdx] = value.EventId
    end
  end
  
  fillNormal(NormalUndone)
  fillNormal(NormalDone)
  if LimitCount <= 0 then
    self.EventTypeTab:SetIsLimitTime(false)
    self.EventTypeTab:SetForbidden(true)
    self.Group_EventType:SetVisibility(UIConst.VisibilityOp.Collapsed)
  elseif NormalCount <= 0 then
    self.EventTypeTab:SetIsLimitTime(true)
    self.EventTypeTab:SetForbidden(true)
    self.Group_EventType:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Group_EventType:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self.SubTabItems = ordered
  self.AllCurrentActivityInfo = ActivityInfo
  return self.SubTabItems
end

function M:BP_GetDesiredFocusTarget()
  return self.CurFocusWidgetItem or self.List_Tab
end

function M:ActivityItemClick(TabWidget)
  if not TabWidget then
    return
  end
  local TabId = TabWidget:GetTabId()
  if self.CurTabId == TabId then
    return
  end
  if self.CurTabId ~= nil then
    local LastActivityPageName = DataMgr.EventTab[self.CurTabId].EventTabName
    if LastActivityPageName then
      ForceStopAsyncTask(self, LastActivityPageName)
    end
  end
  local TabIndex = TabWidget:GetTabIndex()
  local ActivityInfoIndex = TabIndex
  if self.EventTypeTab and not self.EventTypeTab:IsLimitTime() then
    ActivityInfoIndex = TabIndex + self.ActivityInfoIdxOffset
  end
  local ActivityInfo = self.AllCurrentActivityInfo[ActivityInfoIndex]
  local ActivityId
  if #ActivityInfo > 0 then
    ActivityId = ActivityInfo[1]
  end
  if nil ~= self.NeedJumpToActivityId then
    ActivityId = self.NeedJumpToActivityId
  end
  if nil == ActivityId then
    DebugPrint("ActivityItemClick error ActivityId is nil!!!")
    return
  end
  local ActivityConfigData = DataMgr.EventMain[ActivityId]
  local IsInActiveTime = ActivityUtils.CheckEventIsInActiveTime(ActivityId, ActivityConfigData)
  if not IsInActiveTime then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_GameEvent_EventEnd"))
    self:JumpToTargetTab(self.CurTabIndex)
    return
  end
  if self.CurTabId ~= nil then
    local LastShowPage = self.AllCurrentActivityPage[self.CurTabId]
    if nil ~= LastShowPage then
      LastShowPage:HidePage()
    end
  end
  if nil ~= self.CurTabIndex and self.CurTabIndex ~= TabIndex then
    local LastTabObject = self.List_Tab:GetItemAt(self.CurTabIndex - 1)
    if LastTabObject then
      if LastTabObject.UI then
        LastTabObject.UI:SetIsSelected(false)
      else
        LastTabObject.IsSelected = false
      end
    end
  end
  self.CurTabId = TabId
  self.CurTabIndex = TabIndex
  self.List_Tab:SetSelectedIndex(self.CurTabIndex - 1)
  self:GenerateActivityPage(ActivityId, ActivityInfo, ActivityConfigData, TabId)
  ActivityUtils.TrySubActivityReddotCommon("New", ActivityId)
  self:UpdateTabRedInfoByActivityID(ActivityInfoIndex, ActivityId)
end

function M:GenerateActivityPage(ActivityId, ActivityInfo, ActivityConfigData, TabId)
  if nil == ActivityConfigData then
    return
  end
  local ActivityPage = self.AllCurrentActivityPage[TabId]
  if ActivityCommon.IsLoadAsync and self.IsNotFirstOpenSystem then
    if nil == ActivityPage then
      local ActivityPageName = DataMgr.EventTab[TabId].EventTabName
      RunAsyncTask(self, ActivityPageName, function(CoroutineObj)
        local ActivityPage
        if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.PC then
          ActivityPage = UIManager(self):CreateWidgetAsync(ActivityPageName, CoroutineObj, ActivityConfigData.PCBluePrint)
        else
          ActivityPage = UIManager(self):CreateWidgetAsync(ActivityPageName, CoroutineObj, ActivityConfigData.MobileBluePrint or ActivityConfigData.PCBluePrint)
        end
        if nil ~= ActivityPage then
          self:AddActivityPageToNewNode(ActivityPage)
          ActivityPage:InitPage(ActivityId, TabId, ActivityInfo, self)
          local PageConfigData = ActivityPage:GetPageConfigData()
          self:RefreshViewAfterPageDataSet(ActivityConfigData, PageConfigData)
          ActivityPage:PlayFadeIn()
          self:SetDescTextType(ActivityPage)
          self.AllCurrentActivityPage[TabId] = ActivityPage
          self:RefreshUIStyleAfterPageChange()
        end
      end)
    else
      ActivityPage:UpdatePage("ActivityTab")
      local PageConfigData = ActivityPage:GetPageConfigData()
      self:RefreshViewAfterPageDataSet(ActivityConfigData, PageConfigData)
      self:RefreshUIStyleAfterPageChange()
      ActivityPage:ShowPage(true)
    end
  else
    if nil == ActivityPage then
      ActivityPage = self:CreateActivityPage(ActivityConfigData)
      ActivityPage:InitPage(ActivityId, TabId, ActivityInfo, self)
      ActivityPage:PlayFadeIn()
      self.AllCurrentActivityPage[TabId] = ActivityPage
    else
      ActivityPage:UpdatePage("ActivityTab")
      ActivityPage:ShowPage(true)
    end
    local PageConfigData = ActivityPage:GetPageConfigData()
    self:RefreshViewAfterPageDataSet(ActivityConfigData, PageConfigData)
    self:RefreshUIStyleAfterPageChange()
  end
  self:SetDescTextType(ActivityPage)
end

function M:SetDescTextType(ActivityPage)
  if ActivityPage and ActivityPage.WS_TextDesc ~= nil then
    local index = 0
    local JumpPageBG = self.WidgetBGAnchor:GetChildAt(index)
    if JumpPageBG and JumpPageBG.WS_DescIndex then
      local descIndex = tonumber(JumpPageBG.WS_DescIndex)
      if descIndex and descIndex >= 0 and descIndex <= 1 then
        index = math.floor(descIndex)
      end
    end
    ActivityPage.WS_TextDesc:SetActiveWidgetIndex(index)
  end
end

function M:RefreshDynamicInfo()
  local CurActivityPage = self.AllCurrentActivityPage[self.CurTabId]
  if nil ~= CurActivityPage then
    local CurPageConfigData = CurActivityPage:GetPageConfigData()
    local CurActivityId
    if CurActivityPage.GetActivityId and type(CurActivityPage.GetActivityId) == "function" then
      CurActivityId = CurActivityPage:GetActivityId()
    end
    local ActivityId = CurActivityId or CurPageConfigData.EventId
    local ActivityConfigData = DataMgr.EventMain[ActivityId]
    self:RefreshViewAfterPageDataSet(ActivityConfigData, CurPageConfigData)
  end
end

function M:ResetListTab()
  if not self.List_Tab then
    return
  end
  local EntryItems = self.List_Tab:GetListItems()
  local isLimitTime = self.EventTypeTab and self.EventTypeTab:IsLimitTime()
  local selected = false
  for _, Item in pairs(EntryItems or {}) do
    if not Item then
    elseif not selected and (isLimitTime and Item.bLimit or not isLimitTime and not Item.bLimit) then
      selected = true
    elseif Item.UI then
    end
  end
end

function M:RefreshUIStyleAfterPageChange()
  self:UpdateUIStyleInPlatform(self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.PC then
    local CurrentActivePage, CurFocusWidgetName, CurFocusWidgetItem = self.AllCurrentActivityPage[self.CurTabId]
    if nil ~= CurrentActivePage then
      if type(CurrentActivePage.GetCurFocusWidgetInfo) == "function" then
        CurFocusWidgetName, CurFocusWidgetItem = CurrentActivePage:GetCurFocusWidgetInfo()
      end
      self:UpdateActivityKeyTips(CurFocusWidgetName, CurFocusWidgetItem)
    else
      self:UpdateActivityKeyTips()
    end
  end
end

function M:OnReturnKeyDown()
  if not self:CheckIsCanCloseSelf() then
    return
  end
  for k, v in pairs(self.AllCurrentActivityPage) do
    if type(v.CleanSelf) == "function" then
      v:CleanSelf(k ~= self.CurTabId)
    end
    if k == self.CurTabId then
      v:PlayFadeOut(true)
    end
  end
  if self.CurTabId ~= nil then
    local CurActivityPageName = DataMgr.EventTab[self.CurTabId].EventTabName
    if CurActivityPageName then
      ForceStopAsyncTask(self, CurActivityPageName)
    end
  end
  self:PlayOutAnim()
end

function M:OnSpaceBarKeyDown()
  local CurActivityPage = self.AllCurrentActivityPage[self.CurTabId]
  if nil ~= CurActivityPage and type(CurActivityPage.OnSpaceBarKeyDown) == "function" then
    CurActivityPage:OnSpaceBarKeyDown()
  end
end

function M:OnRefreshCurrentPageAfterJump()
  local ActivityPage = self.AllCurrentActivityPage[self.CurTabId]
  if nil ~= ActivityPage then
    ActivityPage:UpdatePage("BackToPageWithJump")
  end
end

function M:UpdateActivityKeyTips(FocusTypeName, FocusWidgetItem)
  FocusTypeName = FocusTypeName or "DefaultWidget"
  FocusWidgetItem = FocusWidgetItem or self.List_Tab
  local BottomKeyInfo = {}
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.MouseAndKeyboard then
    if "GetAllReward" == FocusTypeName then
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
        },
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "SpaceBar",
              ClickCallback = self.OnSpaceBarKeyDown,
              Owner = self
            }
          },
          Desc = GText("UI_Achievement_GetAllReward")
        }
      }
    else
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
      }
    end
  elseif "CheckRewardView" == FocusTypeName then
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "LS"}
        },
        Desc = GText("UI_Controller_CheckReward")
      },
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_Tips_Close")
      }
    }
  elseif "SelectView" == FocusTypeName then
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_CTL_Select")
      },
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_Tips_Close")
      }
    }
  elseif "ACheckRewardView" == FocusTypeName then
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Controller_CheckReward")
      },
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_Tips_Close")
      }
    }
  elseif "CheckRewardDetailView" == FocusTypeName then
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Controller_CheckDetails")
      },
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_Tips_Close")
      }
    }
  elseif "CheckMultiRewardDetailView" == FocusTypeName then
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_Tips_Ensure")
      },
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_Tips_Close")
      }
    }
  elseif "ReceiveRewardView" == FocusTypeName then
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_CTL_Claim")
      },
      {
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_Tips_Close")
      }
    }
  elseif "EmptyView" == FocusTypeName then
    BottomKeyInfo = {}
  else
    BottomKeyInfo = self:GetDefaultTipsWithCurTab()
    if nil == BottomKeyInfo then
      BottomKeyInfo = {
        {
          KeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              ClickCallback = self.OnReturnKeyDown,
              Owner = self
            }
          },
          Desc = GText("UI_Tips_Close")
        }
      }
    end
  end
  self.CurFocusWidgetName = FocusTypeName
  self.CurFocusWidgetItem = FocusWidgetItem
  if self.Com_KeyTips then
    self.Com_KeyTips:UpdateKeyInfo(BottomKeyInfo)
  end
  if self.Com_KeyTipsEmpty then
    self.Com_KeyTipsEmpty:UpdateKeyInfo(BottomKeyInfo)
  end
end

function M:GetDefaultTipsWithCurTab()
  local ResultKeyInfo
  local CurActivityPage = self.AllCurrentActivityPage[self.CurTabId]
  if nil ~= CurActivityPage and type(CurActivityPage.GetDefaultBottomTips) == "function" then
    ResultKeyInfo = CurActivityPage:GetDefaultBottomTips()
  end
  return ResultKeyInfo
end

function M:IsCanChangeToGamePadViewMode()
  return true
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  local IsUseGamePad = CurInputType == ECommonInputType.Gamepad and self:IsCanChangeToGamePadViewMode()
  self:UpdateUIStyleInPlatform(IsUseGamePad)
end

function M:OnUpdateActivityByAction(OpAction, ...)
  if "QuestGetReward" == OpAction then
    local QuestId = (...)
    local ActivityID = DataMgr.CommonQuestDetail[QuestId].EventId
    local CurPageWidget = self.AllCurrentActivityPage[self.CurTabId]
    if nil ~= CurPageWidget and CurPageWidget:GetActivityId() == ActivityID and CurPageWidget:IsPageInVisible() then
      CurPageWidget:RefreshItemStyleByAction("QuestGetReward", QuestId)
    end
  elseif "QuestGetAllReward" == OpAction then
    local PhaseId = (...)
    local ActivityID = DataMgr.CommonQuestPhase[PhaseId].EventId
    local CurPageWidget = self.AllCurrentActivityPage[self.CurTabId]
    if nil ~= CurPageWidget and CurPageWidget:GetActivityId() == ActivityID and CurPageWidget:IsPageInVisible() then
      CurPageWidget:RefreshItemStyleByAction("QuestGetAllReward", PhaseId)
    end
  elseif "QuestComplete" == OpAction then
    local QuestId = (...)
    local ActivityID = DataMgr.CommonQuestDetail[QuestId].EventId
    local CurPageWidget = self.AllCurrentActivityPage[self.CurTabId]
    if nil ~= CurPageWidget and CurPageWidget:GetActivityId() == ActivityID and CurPageWidget:IsPageInVisible() then
      CurPageWidget:RefreshItemStyleByAction("QuestComplete", QuestId)
    end
    self:UpdateTabRedInfoByActivityID(nil, ActivityID)
  elseif "QuestRefreshReddot" == OpAction then
    local ActivityID = (...)
    self:UpdateTabRedInfoByActivityID(nil, ActivityID)
  elseif "SignGetReward" == OpAction then
    local ActivityID, RewardIndex = ...
    local CurPageWidget = self.AllCurrentActivityPage[self.CurTabId]
    if nil ~= CurPageWidget and CurPageWidget:GetActivityId() == ActivityID and CurPageWidget:IsPageInVisible() then
      CurPageWidget:RefreshItemStyleByAction("SignGetReward", ActivityID, RewardIndex)
    end
    self:UpdateTabRedInfoByActivityID(nil, ActivityID)
  elseif "TryOutGetReward" == OpAction then
    local ActivityID = (...)
    local CurPageWidget = self.AllCurrentActivityPage[self.CurTabId]
    if nil ~= CurPageWidget and CurPageWidget:GetActivityId() == ActivityID and CurPageWidget:IsPageInVisible() then
      CurPageWidget:RefreshItemStyleByAction("TryOutGetReward", ActivityID)
    end
    self:UpdateTabRedInfoByActivityID(nil, ActivityID)
  elseif "TrainingLevelReward" == OpAction then
    local ActivityID = (...)
    self:UpdateTabRedInfoByActivityID(nil, ActivityID)
  end
end

function M:OnUpdateActivityByControllerEvent(ActivityEventId, ...)
  if ActivityEventId == ActivityCommon.EventId.OnRefreshInNextDay then
    local CurActivityPage = self.AllCurrentActivityPage[self.CurTabId]
    if nil ~= CurActivityPage then
      CurActivityPage:UpdatePage(ActivityCommon.AllUpdateTag.ActivityTab)
    end
  end
end

function M:OnSelectActivityPageChanged(SelectActivityItem, bIsSelect)
  if not SelectActivityItem then
    return
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    local isLimitTime = self.EventTypeTab and self.EventTypeTab:IsLimitTime()
    local bCanSelect = isLimitTime and SelectActivityItem.bLimit or not isLimitTime and not SelectActivityItem.bLimit
    if bCanSelect then
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
      self:JumpToTargetTab(SelectActivityItem.Index)
      self.List_Tab:BP_NavigateToItem(SelectActivityItem)
      self:AddTimer(0.25, function()
        self.GameInputModeSubsystem:UpdateCurrentFocusWidgetPos()
      end, false, 0, nil, true)
    end
  end
  if self.LastIndex == SelectActivityItem.Index then
    self:AddTimer(0.3, function()
      local NextOffset = self.List_Tab:GetScrollOffsetOfEnd()
      self.List_Tab:SetScrollOffset(NextOffset)
    end, false, 0, nil, true)
  elseif self.GameInputModeSubsystem:GetCurrentInputType() ~= ECommonInputType.Gamepad then
    self:ScrollToItemWithPadding(SelectActivityItem.Index, 0.05)
  end
end

function M:ScrollToItemWithPadding(Index, Padding)
  DebugPrint("JLYScrollToItemWithPadding", Index, Padding)
  if not self.List_Tab then
    return
  end
  if nil == Index or Index < 0 then
    return
  end
  local NumLiveWidgets = self:GetListViewContentMaxCount() - 1
  if NumLiveWidgets <= 0 then
    return
  end
  local CurrentScrollOffset = self.List_Tab:GetScrollOffset()
  if not CurrentScrollOffset then
    return
  end
  local ViewStart = CurrentScrollOffset
  local ViewEnd = ViewStart + NumLiveWidgets - 1
  DebugPrint("JLYViewStart, ViewEnd", ViewStart, ViewEnd)
  local PaddingOffset = Padding
  local NewScrollOffset = CurrentScrollOffset
  if ViewStart > Index - 1 then
    NewScrollOffset = Index - 1
  elseif Index >= ViewEnd then
    NewScrollOffset = Index - NumLiveWidgets + PaddingOffset
  end
  DebugPrint("JLYNumLiveWidgets", NumLiveWidgets)
  DebugPrint("JLYNewScrollOffset", NewScrollOffset)
  local TotalItems = self.List_Tab:GetNumItems()
  local MaxScrollOffset = math.max(0.0, TotalItems - NumLiveWidgets)
  NewScrollOffset = math.max(0.0, math.min(NewScrollOffset, MaxScrollOffset))
  self.List_Tab:SetScrollOffset(NewScrollOffset)
end

function M:GetListViewContentMaxCount()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local ListSize = UIManager:GetWidgetRenderSize(self.List_Tab)
  local Parent = self.List_Tab:GetParent()
  if Parent:Cast(UScrollBox) then
    ListSize = UIManager:GetWidgetRenderSize(Parent)
  end
  local ItemWidget
  for _, Widget in pairs(self.List_Tab:GetDisplayedEntryWidgets()) do
    if Widget and Widget.IsTabSelected == false and Widget.Index > 1 then
      ItemWidget = Widget
      break
    end
  end
  if nil == ItemWidget then
    return 10
  end
  local ItemSize = UIManager:GetWidgetRenderSize(ItemWidget.WidgetTree.RootWidget)
  if self.List_Tab.Orientation == EOrientation.Orient_Horizontal then
    ListSize, ItemSize = ListSize.X, ItemSize.X + self.List_Tab.EntrySpacing
  elseif self.List_Tab.Orientation == EOrientation.Orient_Vertical then
    ListSize, ItemSize = ListSize.Y, ItemSize.Y + self.List_Tab.EntrySpacing
  end
  local RawCount = ListSize / ItemSize - self.List_Tab.EntrySpacing / ItemSize
  local Count = math.ceil(RawCount - 0.01)
  return Count
end

function M:UpdateTabRedInfoByActivityID(TabIndex, ActivityId)
  if nil == TabIndex then
    for k, v in pairs(self.AllCurrentActivityInfo) do
      for _, AId in ipairs(v) do
        if AId == ActivityId then
          TabIndex = k
          break
        end
      end
    end
  end
  if nil == TabIndex then
    return
  end
  local AllActivityInfo = self.AllCurrentActivityInfo[TabIndex]
  local IsShowNew, IsHaveReddotInTab = false, false
  for index, value in ipairs(AllActivityInfo) do
    local NewInfo = ActivityUtils.GetReddotCachInfoByKey("New", value)
    IsHaveReddotInTab = 1 == ActivityUtils.GetReddotCachInfoByKey("Red", value)
    IsShowNew = 1 == NewInfo and not IsHaveReddotInTab
    if IsShowNew or IsHaveReddotInTab then
      break
    end
  end
  if TabIndex >= self.ActivityInfoIdxOffset then
    TabIndex = TabIndex - self.ActivityInfoIdxOffset
  end
end

return M
