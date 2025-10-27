require("UnLua")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local EMCache = require("EMCache.EMCache")
local WBP_TaskListItem_C = Class("BluePrints.UI.BP_UIState_C")
local QuestStateEnum = {
  DOING = 1,
  COMPLETED = 2,
  LOCK = 3
}
local QuestChainTypeEnum = {
  Main = 1,
  Normal = 2,
  Side = 3
}

function WBP_TaskListItem_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.QuestChainType = nil
  self.ChapterName = nil
  self.ChapterDescription = nil
  self.QuestChainId = nil
  self.DoingQuestId = nil
  self.OwnerWidget = nil
  self.CompletedQuestInfo = {}
  self.State = nil
  self.ShowCompleteCount = 0
end

function WBP_TaskListItem_C:Construct()
  self.Super.Construct(self)
  self.IsDestroied = false
end

function WBP_TaskListItem_C:Destruct()
  self.Super.Destruct(self)
  self.IsDestroied = true
end

function WBP_TaskListItem_C:RefreshListItemInfo(Content)
  if not Content then
    print(_G.LogTag, "WBP_TaskListItem_C.RefreshListItemInfo: Content Is Nil!")
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.List_MainTask:ClearListItems()
  self.List_MainTask:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Task_SubItem:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Group_TaskType:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Group_Head:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Common_List_Cell_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Common_List_Cell_PC.Button_Area.OnClicked:Add(self, self.OnClicked)
  self.Common_List_Cell_PC.Image_Unfold:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Common_List_Cell_PC.VXImage_Unfold_1:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Common_List_Cell_PC:Init(self, self.UpdateTabInfo)
  self.Group_RecommendedLevel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.OwnerWidget = Content.OwnerWidget
  self.QuestChainId = Content.QuestChainId
  self.DoingQuestId = Content.DoingQuestId or 0
  self.IsEmpty = Content.IsEmpty
  self.IsShowType = Content.IsShowType
  self.IsTracking = self.OwnerWidget.TrackingQuestId == self.QuestChainId
  self.IsSelectDoingQuest = Content.IsSelectDoingQuest
  self.IsExpansion = true
  self.Content = Content
  Content.UI = self
  if self.OwnerWidget.PlatformName == "PC" then
    self.Group_Item.WidthOverride = self.Size_Group_Item_P
  elseif self.OwnerWidget.PlatformName == "Mobile" then
    self.Group_Item.WidthOverride = self.Size_Group_Item_M
  end
  local QuestConfig = DataMgr.QuestChain[self.QuestChainId]
  if not QuestConfig and not self.IsEmpty and -1 ~= self.QuestChainId then
    print(_G.LogTag, "Quest Conifg Not Exist! Check QuestChain.xlsx Id:", self.QuestChainId)
    return
  end
  if -1 ~= self.QuestChainId then
    if 0 ~= self.DoingQuestId then
      self:TriggerRecommendedLevelUIShow(TaskUtils:GetQuestDetail(self.QuestChainId, self.DoingQuestId))
    else
      local UnlockConditionId = DataMgr.QuestChain[self.QuestChainId].UnlockCondition
      local IsUnlock = Avatar:CheckCondition(UnlockConditionId)
      if not IsUnlock then
        local FirstQuestId = tostring(self.QuestChainId) .. "01"
        self:TriggerRecommendedLevelUIShow(TaskUtils:GetQuestDetail(self.QuestChainId, tonumber(FirstQuestId)))
      end
    end
    if 0 == self.DoingQuestId then
      print(_G.LogTag, "Doing Quest Id == 0 ", self.QuestChainId)
      self.DoingQuestId = DataMgr.STLExportQuestChain[self.QuestChainId].StartQuestId
    end
    if self.IsEmpty then
      self.Switcher_Chapter:SetActiveWidgetIndex(1)
      self.Common_List_Cell_PC:SetRenderOpacity(0.5)
      self.Common_List_Cell_PC:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
      return
    else
      self.Switcher_Chapter:SetActiveWidgetIndex(0)
    end
  else
    self.Group_RecommendedLevel:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Switcher_Chapter:SetActiveWidgetIndex(0)
  end
  if self.IsShowType then
    self.Group_TaskType:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    local Type
    if -1 == self.QuestChainId then
      Type = 1
    else
      Type = DataMgr.QuestChain[self.QuestChainId].QuestChainType
    end
    local QuestTabData
    for _, v in pairs(DataMgr.QuestTab) do
      if v.QuestType == Type then
        QuestTabData = v
        break
      end
    end
    if nil ~= QuestTabData then
      self.Text_TaskType:SetText(GText(QuestTabData.TabName))
      self.Image_TaskTypeIcon:SetBrushResourceObject(LoadObject(QuestTabData.Icon))
    end
  else
    self.Group_TaskType:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  local DoingQuestInfo
  if -1 ~= self.QuestChainId then
    local UnlockConditionId = QuestConfig.UnlockCondition
    local QuestState = Avatar and Avatar:CheckCondition(UnlockConditionId) and QuestStateEnum.DOING or QuestStateEnum.LOCK
    if not UnlockConditionId then
      QuestState = QuestStateEnum.DOING
    end
    DoingQuestInfo = self:PreCreateSubItemContent(QuestState, self.QuestChainId, self.DoingQuestId)
  else
    DoingQuestInfo = self:PreCreateSubItemContent(-1, self.QuestChainId, self.DoingQuestId)
  end
  self.Task_SubItem:RefreshTaskSubItemInfo(DoingQuestInfo)
  self.Task_SubItem:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:PlayImageTaskTypeAnimation()
  if self.IsTracking then
    self.Task_SubItem:OnTracking()
  end
  if self.OwnerWidget.CurSelectId == self.QuestChainId then
    self.Task_SubItem:SelectQuestProactively()
  else
    self.Task_SubItem:OnQuestUnSelect()
  end
  if -1 == self.QuestChainId then
    self.Text_ChapterName:SetText(GText("AllQuest_Over"))
    self.Text_TaskArea:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Text_Chapter:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Text_TaskArea:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_Chapter:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    local TaskArea = DataMgr.TextMap[QuestConfig.ChapterName] and GText(QuestConfig.ChapterName) or GText("UI_QUEST_UNKNOWN")
    local ChapterName = DataMgr.TextMap[QuestConfig.QuestChainName] and GText(QuestConfig.QuestChainName) or GText("UI_QUEST_UNKNOWN")
    local Chapter = DataMgr.TextMap[QuestConfig.EpisodeName] and GText(QuestConfig.EpisodeName) or GText("UI_QUEST_UNKNOWN")
    self.Text_ChapterName:SetText(ChapterName)
    self.Text_Chapter:SetText(Chapter)
    self.Text_TaskArea:SetText(TaskArea)
    local BossImagePath = DataMgr.QuestChain[self.QuestChainId].CharacterImagePath
    if BossImagePath then
      local Image = LoadObject(BossImagePath)
      if Image then
        local DynamicMaterial = self.Image_Head:GetDynamicMaterial()
        DynamicMaterial:SetTextureParameterValue("MainTex", Image)
        self.Group_Head:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
  end
end

function WBP_TaskListItem_C:TriggerRecommendedLevelUIShow(TaskInfo)
  local Level = self.OwnerWidget.CurPlayerCharacterLevel
  local ConfigRecommandLevel
  if TaskInfo and TaskInfo.RecommendLevel then
    ConfigRecommandLevel = TaskInfo.RecommendLevel
  end
  self.Text_RecommendedLevel_Desc:SetText(GText("UI_QUEST_SUGGEST_LEVEL"))
  if nil == ConfigRecommandLevel or -1 == ConfigRecommandLevel then
    self.Group_RecommendedLevel:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  else
    self.Text_RecommendedLevel:SetText(GText("UI_LEVEL_NAME") .. ConfigRecommandLevel)
    self.Image_RedBG:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Group_RecommendedLevel:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if nil ~= ConfigRecommandLevel and Level < ConfigRecommandLevel then
    self.Text_RecommendedLevel:SetText(GText("UI_LEVEL_NAME") .. ConfigRecommandLevel)
    self.Image_RedBG:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_TaskListItem_C:ShowCompletedQuestList(IsExpansion)
end

function WBP_TaskListItem_C:PreCreateSubItemContent(State, QuestChainId, QuestId)
  local Content = {}
  Content.QuestChainId = QuestChainId
  Content.QuestId = QuestId
  Content.OwnerWidget = self
  Content.MainWidget = self.OwnerWidget
  if State == QuestStateEnum.DOING then
    Content.State = State
    Content.IsDoingQuest = true
  elseif State == QuestStateEnum.COMPLETED then
    Content.State = 2
    Content.IsNew = false
  elseif State == QuestStateEnum.LOCK then
    Content.State = 0
  end
  return TaskUtils:CreateSubItemContent(Content)
end

function WBP_TaskListItem_C:OnClicked()
  if not self.IsExpansion then
    self.Task_SubItem:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.Task_SubItem.IsExpansion then
    end
    self.IsExpansion = true
  else
    self.Task_SubItem:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.IsExpansion = false
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  self.OwnerWidget.RootWidget.List_Task:RequestRefresh()
  if true == self.OwnerWidget.UsingGamepad then
  else
    self.OwnerWidget.RootWidget:SetFocus()
  end
end

function WBP_TaskListItem_C:PlayImageTaskTypeAnimation()
  local QuestChainType
  if -1 == self.QuestChainId then
    QuestChainType = 1
  else
    QuestChainType = DataMgr.QuestChain[self.QuestChainId].QuestChainType
  end
  if QuestChainType == Const.MainQuestChainType or QuestChainType == Const.MainActivityQuestChainType then
    self:PlayAnimation(self.Task_MainColor)
  elseif 2 == QuestChainType then
    self:PlayAnimation(self.Task_DailyColor)
  elseif QuestChainType == Const.SideQuestChainType then
    self:PlayAnimation(self.Task_SideColor)
  elseif QuestChainType == Const.LimTimeQuestChainType or QuestChainType == Const.SpecialSideQuestChainType then
    self:PlayAnimation(self.Task_SpecialColor)
  end
end

function WBP_TaskListItem_C:OnFocusReceived(MyGeometry, InFocusEvent)
  self:UpdateTabInfo()
  local LastIndex = -1
  if self.OwnerWidget.CurFocusWidget then
    LastIndex = self.OwnerWidget.RootWidget.List_Task:GetIndexForItem(self.OwnerWidget.CurFocusWidget.Content)
  end
  local CurIndex = self.OwnerWidget.RootWidget.List_Task:GetIndexForItem(self.Content)
  self:SetItemNavigation()
  self.OwnerWidget.CurFocusWidget = self
  if -1 == LastIndex then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Task_SubItem)
  elseif LastIndex > CurIndex then
    if self.IsExpansion then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Task_SubItem)
    else
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Common_List_Cell_PC)
    end
  elseif LastIndex < CurIndex then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Common_List_Cell_PC)
  else
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Task_SubItem)
  end
end

function WBP_TaskListItem_C:SetItemNavigation()
  self.Common_List_Cell_PC:SetNavigationRuleCustom(EUINavigation.Up, {
    self,
    function()
      if self.Content.PreItem then
        self.OwnerWidget.RootWidget.List_Task:BP_CancelScrollIntoView()
        self.OwnerWidget.RootWidget.List_Task:BP_SetSelectedItem(self.Content.PreItem)
        self.OwnerWidget.RootWidget.List_Task:BP_NavigateToItem(self.Content.PreItem)
        return self.OwnerWidget.RootWidget.List_Task
      end
    end
  })
  self.Common_List_Cell_PC:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    function()
      if self.IsExpansion then
        return self.Task_SubItem
      elseif self.Content.NextItem then
        self.OwnerWidget.RootWidget.List_Task:BP_CancelScrollIntoView()
        self.OwnerWidget.RootWidget.List_Task:BP_SetSelectedItem(self.Content.NextItem)
        self.OwnerWidget.RootWidget.List_Task:BP_NavigateToItem(self.Content.NextItem)
        return self.OwnerWidget.RootWidget.List_Task
      end
    end
  })
  self.Task_SubItem:SetNavigationRuleExplicit(EUINavigation.Up, self.Common_List_Cell_PC)
  self.Task_SubItem:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    function()
      if self.Content.NextItem then
        self.OwnerWidget.RootWidget.List_Task:BP_CancelScrollIntoView()
        self.OwnerWidget.RootWidget.List_Task:BP_SetSelectedItem(self.Content.NextItem)
        self.OwnerWidget.RootWidget.List_Task:BP_NavigateToItem(self.Content.NextItem)
        return self.OwnerWidget.RootWidget.List_Task
      end
    end
  })
end

function WBP_TaskListItem_C:UpdateTabInfo()
  if self.OwnerWidget.UsingGamepad then
    self.OwnerWidget:InitTabPadKeyInfo()
  end
end

function WBP_TaskListItem_C:OnAddedToFocusPath(InFocusEvent)
  if self.OwnerWidget.UsingGamepad then
    self.OwnerWidget:IsShowGamePad(true)
  end
end

function WBP_TaskListItem_C:BP_OnEntryReleased()
  if self.Task_SubItem then
    self.Task_SubItem.SubRegionId = 0
    self.Task_SubItem.RegionId = 0
  end
end

return WBP_TaskListItem_C
