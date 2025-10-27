require("UnLua")
local WBP_TaskSubItem_C = Class("BluePrints.UI.BP_UIState_C")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local GuidePointLocData = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
local EMCache = require("EMCache.EMCache")
local QuestRealStateEnum = {
  Lock = 0,
  Doing = 1,
  Finished = 2,
  InProgress = -1
}
local QuestChainTypeEnum = {
  Main = 1,
  Normal = 2,
  Side = 3
}

function WBP_TaskSubItem_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.Index = nil
  self.State = nil
  self.QuestName = nil
  self.QuestPosition = nil
  self.OwnerWidget = nil
  self.MainWidget = nil
  self.QuestID = nil
  self.IsExpansion = false
  self.IsDoingQuest = false
end

function WBP_TaskSubItem_C:Construct()
  EventManager:AddEvent(EventID.OnSelectQuestSubItem, self, self.OnQuestSelectedToStopAnimation)
  self.IsDestroied = false
end

function WBP_TaskSubItem_C:Destruct()
  self.Super.Destruct(self)
  self.Common_List_Subcell_PC.Button_Area.OnClicked:Clear()
  EventManager:RemoveEvent(EventID.OnSelectQuestSubItem, self, self.OnQuestSelectedToStopAnimation)
  self.IsDestroied = true
end

function WBP_TaskSubItem_C:OnQuestSelectedToStopAnimation(SelectId)
  if nil == SelectId or self.QuestChainId ~= SelectId then
    self:OnQuestUnSelect()
  end
end

function WBP_TaskSubItem_C:RefreshTaskSubItemInfo(Content)
  if not Content then
    print(_G.LogTag, "WBP_TaskSubItem_C.OnListItemObjectSet: Content is nil!")
    return
  end
  print(_G.LogTag, "SUbItem 1111111")
  self.State = Content.State
  self.OwnerWidget = Content.OwnerWidget
  self.MainWidget = Content.MainWidget
  self.QuestID = Content.QuestID
  self.QuestChainId = Content.QuestChainId
  if -1 ~= self.QuestChainId then
    local UnlockTitle = DataMgr.QuestChain[self.QuestChainId].UnlockTitle
  end
  self.IsDoingQuest = Content.IsDoingQuest
  self.IsNew = Content.IsNew
  self.QuestName = ""
  self.QuestPosition = ""
  self.TeleportPointName = ""
  if -1 ~= self.QuestChainId then
    local UnlockTitle = DataMgr.QuestChain[self.QuestChainId].UnlockTitle
    self:GetDetailInfo()
  end
  self.Group_Fold:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Group_Guide_Point:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if -1 == self.QuestChainId then
    self.StateSwitcher:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif self.State == QuestRealStateEnum.Finished or self.State == QuestRealStateEnum.Lock then
    self.StateSwitcher:SetActiveWidgetIndex(self.State)
    self.StateSwitcher:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.StateSwitcher:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if self.State ~= QuestRealStateEnum.Finished then
    self.Common_List_Subcell_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Common_List_Subcell_PC:BindEventOnClicked(self, self.OnQuestSelected)
    self.Common_List_Subcell_PC.Button_Area.OnClicked:Add(self, self.OnSubItemClicked)
  else
    self.Common_List_Subcell_PC:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  end
  self:PlayImageTaskTypeAnimation()
  if -1 ~= self.QuestChainId then
    local Type = DataMgr.QuestChain[self.QuestChainId].QuestChainType
    local TypeName = CommonConst.QuestTypeName[Type]
    local NodeName = DataMgr.ReddotNode[TypeName].Name
    local RedDotDetail = ReddotManager.GetLeafNodeCacheDetail(NodeName)
    local IsNew = RedDotDetail[self.QuestChainId]
    if 1 == IsNew then
      self.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    self.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if -1 == self.QuestChainId then
    self.Text_TaskName:SetText(GText("Quest_ToBeContinued"))
    self.Text_TaskPosition:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Text_TaskPosition:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.State == QuestRealStateEnum.Lock and UnlockTitle then
      self.Text_TaskName:SetText(GText(UnlockTitle))
    else
      self.Text_TaskName:SetText(self.QuestName)
    end
    self.Text_TaskPosition:SetText(self.QuestPosition)
  end
end

function WBP_TaskSubItem_C:OnSubItemClicked()
  self.MainWidget.RootWidget:SetFocus()
end

function WBP_TaskSubItem_C:FoldButtonOnClited()
end

function WBP_TaskSubItem_C:OnQuestSelected()
  if -1 ~= self.QuestChainId then
    local Type = DataMgr.QuestChain[self.QuestChainId].QuestChainType
    local TypeName = CommonConst.QuestTypeName[Type]
    local NodeName = DataMgr.ReddotNode[TypeName].Name
    local RedDotDetail = ReddotManager.GetLeafNodeCacheDetail(NodeName)
    if 1 == RedDotDetail[self.QuestChainId] then
      ReddotManager.DecreaseLeafNodeCount(NodeName, 1, {
        QuestId = self.QuestChainId
      })
      self.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  self.MainWidget:ShowQuestDetailInfo(self)
  if -1 ~= self.QuestChainId then
    self.MainWidget:TriggerLevelHardWarningUIShow(self.QuestChainId, self.QuestID)
  end
  if self:IsAnimationPlaying(self.Text_Normal) then
    self:StopAnimation(self.Text_Normal)
  end
  self:PlayTextAnimation(self.Text_Select)
  self.OwnerWidget.Common_List_Cell_PC:PlayAnimation(self.OwnerWidget.Common_List_Cell_PC.Select)
  self.OwnerWidget.Common_List_Cell_PC.IsSelected = true
  self.MainWidget.CurSelectId = self.QuestChainId
  TaskUtils.TaskMainLastSelectId = self.QuestChainId
  if self.OwnerWidget.OwnerWidget.UsingGamepad then
    self.Common_List_Subcell_PC:OnCellClicked()
  end
  EventManager:FireEvent(EventID.OnSelectQuestSubItem, self.QuestChainId)
end

function WBP_TaskSubItem_C:OnQuestUnSelect()
  self.Common_List_Subcell_PC:OnCellUnSelect()
  self:PlayTextAnimation(self.Text_Normal)
  self.OwnerWidget.Common_List_Cell_PC.Bg_Select:SetRenderOpacity(0)
  self.OwnerWidget.Common_List_Cell_PC:OnCellUnSelect()
  self.OwnerWidget.Common_List_Cell_PC.IsSelected = false
end

function WBP_TaskSubItem_C:SelectQuestProactively()
  self.Common_List_Subcell_PC:OnCellClicked()
end

function WBP_TaskSubItem_C:GetDetailInfo()
  local Info = TaskUtils:GetQuestDetail(self.QuestChainId, self.QuestID)
  if Info and Info.SubRegionId ~= nil and Info.SubRegionId > 0 then
    self.SubRegionId = Info.SubRegionId
    local UIObjs = MissionIndicatorManager:GetIndicatorUIObjByQuestChainIdWithType(self.QuestChainId, "Task")
    local Avatar = GWorld:GetAvatar()
    if Avatar and IsEmptyTable(UIObjs) and DataMgr.QuestChain[self.QuestChainId] and nil ~= DataMgr.QuestChain[self.QuestChainId].LockShowSubRegionId and Avatar.QuestChains[self.QuestChainId]:IsLock() then
      self.TeleportPointName = DataMgr.QuestChain[self.QuestChainId].LockShowTeleportPointName
    end
    for _, v in pairs(UIObjs) do
      local TargetKey = v.GuideInfoCache.PointOrStaticCreatorName
      if TargetKey and GuidePointLocData[TargetKey] then
        self.TeleportPointName = GuidePointLocData[TargetKey].TeleportPointName
      end
      break
    end
  else
    local UIObjs = MissionIndicatorManager:GetIndicatorUIObjByQuestChainIdWithType(self.QuestChainId, "Task")
    local Avatar = GWorld:GetAvatar()
    if Avatar and IsEmptyTable(UIObjs) then
      if DataMgr.QuestChain[self.QuestChainId] and nil ~= DataMgr.QuestChain[self.QuestChainId].LockShowSubRegionId and Avatar.QuestChains[self.QuestChainId]:IsLock() then
        self.SubRegionId = DataMgr.QuestChain[self.QuestChainId].LockShowSubRegionId
        self.TeleportPointName = DataMgr.QuestChain[self.QuestChainId].LockShowTeleportPointName
      else
        ScreenPrint(string.format("WBP_TaskSubItem_C: \228\187\187\229\138\161\233\157\162\230\157\191Item\229\138\160\232\189\189\229\140\186\229\159\159\228\191\161\230\129\175\232\142\183\229\143\150\229\164\177\232\180\165\239\188\140\232\175\183\230\163\128\230\159\165STL\230\152\175\229\144\166\233\133\141\231\189\174\230\140\135\229\188\149\231\130\185\232\138\130\231\130\185, \228\187\187\229\138\161Id: %s", self.QuestID))
      end
    end
    for _, v in pairs(UIObjs) do
      local TargetKey = v.GuideInfoCache.PointOrStaticCreatorName
      if TargetKey and GuidePointLocData[TargetKey] then
        self.SubRegionId = GuidePointLocData[TargetKey].SubRegionId
        self.TeleportPointName = GuidePointLocData[TargetKey].TeleportPointName
        break
      end
      ScreenPrint(string.format("WBP_TaskSubItem_C: \230\140\135\229\188\149\231\130\185\229\140\186\229\159\159\230\149\176\230\141\174\228\184\141\229\173\152\229\156\168, \228\187\187\229\138\161\229\140\186\229\159\159\228\191\161\230\129\175\232\142\183\229\143\150\229\164\177\232\180\165\239\188\140\232\175\183\230\163\128\230\159\165\229\175\188\229\135\186\230\149\176\230\141\174, \230\140\135\229\188\149\231\130\185: %s", v:GetName()))
      break
    end
  end
  if not Info then
    ScreenPrint(string.format("WBP_TaskSubItem_C: \228\187\187\229\138\161\232\138\130\231\130\185\228\191\161\230\129\175\232\142\183\229\143\150\229\164\177\232\180\165\239\188\140\232\175\183\230\163\128\230\159\165STL\232\138\130\231\130\185, \228\187\187\229\138\161Id: %s", self.QuestID))
    return
  end
  if self.SubRegionId == nil then
    self.SubRegionId = 0
  end
  self.RegionId = 0
  if self.SubRegionId and self.SubRegionId > 0 then
    self.RegionId = math.floor(self.SubRegionId / 100)
    if Info.TaskRegionReName ~= "" then
      self.QuestPosition = GText(Info.TaskRegionReName) .. " \226\128\148\226\128\148 "
    else
      self.QuestPosition = GText(DataMgr.Region[self.RegionId].RegionName) .. " \226\128\148\226\128\148 "
    end
    if "" ~= Info.TaskSubRegionReName then
      self.QuestPosition = self.QuestPosition .. GText(Info.TaskSubRegionReName)
    elseif self.TeleportPointName == "" or nil == self.TeleportPointName then
      self.QuestPosition = self.QuestPosition .. GText(DataMgr.SubRegion[self.SubRegionId].SubRegionName)
    else
      self.QuestPosition = self.QuestPosition .. GText(self.TeleportPointName)
    end
  else
    if Info.TaskRegionReName ~= "" then
      self.QuestPosition = GText(Info.TaskRegionReName) .. " \226\128\148\226\128\148 "
    end
    if "" ~= Info.TaskSubRegionReName then
      self.QuestPosition = self.QuestPosition .. GText(Info.TaskSubRegionReName)
    end
  end
  if not Info.QuestDescription or not DataMgr.TextMap[Info.QuestDescription] then
    self.QuestName = GText("UI_QUEST_UNKNOWN")
  else
    self.QuestName = GText(Info.QuestDescription) .. TaskUtils:GetQuestCountExtraInfoString(self.QuestChainId, self.QuestID)
  end
  if not Info.QuestDeatil or not DataMgr.TextMap[Info.QuestDeatil] then
    self.QuestDeatil = GText("UI_QUEST_UNKNOWN")
  else
    self.QuestDeatil = GText(Info.QuestDeatil)
  end
  self:TrySetSTLDetail(self.QuestChainId, self.QuestID)
end

function WBP_TaskSubItem_C:TrySetSTLDetail(InQuestChain, InQuestId)
  local QuestExtraInfo = TaskUtils:GetQuestExtraInfo(InQuestChain, InQuestId)
  if not QuestExtraInfo or IsEmptyTable(QuestExtraInfo) then
    return
  end
  local HasNewDetail = false
  local HasNewDescrible = false
  local NewDetail = ""
  local NewDescription = ""
  for _, Data in pairs(QuestExtraInfo) do
    if Data.Node and Data.Node.Type == "UpdateTaskBarAndTaskMainNode" and 0 == Data.SubTaskIndex then
      NewDetail = Data.Detail
      HasNewDetail = true
      if Data.Description then
        NewDescription = Data.Description
        HasNewDescrible = true
      end
      break
    end
  end
  if false == HasNewDetail or "" == NewDetail then
    return
  end
  if HasNewDetail then
    self.QuestDeatil = GText(NewDetail)
  end
  if HasNewDescrible then
    self.QuestName = GText(NewDescription) .. TaskUtils:GetQuestCountExtraInfoString(self.QuestChainId, self.QuestID)
  end
end

function WBP_TaskSubItem_C:OnTracking(QuestChainId)
  local Texture = TaskUtils:GetIconTextureByTrackQuestChainType(QuestChainId)
  if Texture then
    self.Common_GuidePoint_PC.Img_GuidePoint_Icon:SetBrushResourceObject(Texture)
  end
  self.Group_Guide_Point:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Common_GuidePoint_PC:PlayAnimation(self.Common_GuidePoint_PC.Loop, 0, 0)
  if self.Common_GuidePoint_PC.HoverFunction then
    self.Common_GuidePoint_PC.HoverFunction = nil
  end
  if self.Common_GuidePoint_PC.ClickFunction then
    self.Common_GuidePoint_PC.ClickFunction = nil
  end
end

function WBP_TaskSubItem_C:CancelTracking()
  self.Group_Guide_Point:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Common_GuidePoint_PC:StopAnimation(self.Common_GuidePoint_PC.Loop)
end

function WBP_TaskSubItem_C:PlayTextAnimation(Anim)
  if self:IsAnimationPlaying(self.Text_Normal) then
    self:StopAnimation(self.Text_Normal)
  elseif self:IsAnimationPlaying(self.Text_Select) then
    self:StopAnimation(self.Text_Select)
  end
  self:PlayAnimation(Anim)
end

function WBP_TaskSubItem_C:PlayImageTaskTypeAnimation()
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

function WBP_TaskSubItem_C:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.MainWidget.CurSelectId ~= self.QuestChainId then
    self:OnQuestSelected()
  end
  self.OwnerWidget.OwnerWidget:InitTabPadKeyInfoForBack()
  return UIUtils.Handle
end

function WBP_TaskSubItem_C:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if "Gamepad_FaceButton_Bottom" == InKeyName and self.Group_Fold:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    self:SetFocus()
    IsHandled = true
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

return WBP_TaskSubItem_C
