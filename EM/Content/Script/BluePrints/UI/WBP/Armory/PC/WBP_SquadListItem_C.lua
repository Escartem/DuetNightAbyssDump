require("UnLua")
local Platform = CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance)
local WBP_SquadListItem_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr",
  "BluePrints.Common.DelayFrameComponent"
})
WBP_SquadListItem_C._components = {
  "BluePrints.UI.WBP.Abyss.MainComponent.Abyss_CharMainComponent"
}
local Handled = UE.UWidgetBlueprintLibrary.Handled()
local UnHandled = UE.UWidgetBlueprintLibrary.UnHandled()

function WBP_SquadListItem_C:Init()
  self:SwitchItemType()
  self:InitBtn()
  if not self.IsAddSquad then
    self:InitItem()
    self.Btn_Add:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Btn_Add:SetVisibility(ESlateVisibility.Visible)
  end
  self:HideAllArrow()
  self:CheckSortIcon()
  self:UnbindAllFromAnimationFinished(self.Click)
  self:BindToAnimationFinished(self.Click, {
    self,
    function()
      self.ClickCallback(self.Owner, self.Index)
    end
  })
  if self.Owner.IsDraging and self.Owner.CurSelectSquadIndex == self.Index then
    self.Owner:HideOrShowItemInDraging(self.Owner.CurSelectSquadIndex)
  end
  if not self.Owner.IsDraging then
    if self.Owner.CurSelectSquadIndex == self.Index then
      self.IsSelect = true
      self:PlayAnimation(self.Select)
    else
      self:PlayAnimation(self.Normal)
    end
  end
end

function WBP_SquadListItem_C:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.SelfWidget = self
  self.SquadInfo = Content.SquadInfo
  self.IsNeedSort = Content.IsNeedSort
  self.ClickCallback = Content.ClickCallback
  self.Owner = Content.Owner
  self.IsAddSquad = Content.IsAddSquad
  self.Index = self.IsAddSquad and self.Owner.SquadMax or Content.Index
  self.IsSelect = false
  self.FakeIndex = self.Index
  self:Init()
  self:PlayAnimation(self.ResetPos)
end

function WBP_SquadListItem_C:SetIndex(Index)
  self.FakeIndex = Index
end

function WBP_SquadListItem_C:SwitchItemType()
  if self.IsAddSquad then
    self.Panel_Normal:SetVisibility(ESlateVisibility.Collapsed)
    self.Panel_Add:SetVisibility(ESlateVisibility.Visible)
  else
    self.Panel_Add:SetVisibility(ESlateVisibility.Collapsed)
    self.Panel_Normal:SetVisibility(ESlateVisibility.Visible)
  end
end

function WBP_SquadListItem_C:InitItem()
  local SquadName = ""
  if self.SquadInfo.Name and "" ~= self.SquadInfo.Name then
    SquadName = self.SquadInfo.Name
  else
    SquadName = GText("Squad_DefaultName1")
  end
  self.Text_Name:SetText(SquadName)
  if self:CheckBasicSquadInfo() then
    self.Icon_Warning:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Icon_Warning:SetVisibility(ESlateVisibility.Visible)
  end
  local CharId = self.SquadInfo.CharId
  local IconDynaMaterial = self.Icon_Avatar:GetDynamicMaterial()
  if IconDynaMaterial and CharId then
    IconDynaMaterial:SetTextureParameterValue("IconMap", LoadObject(DataMgr.Char[CharId].Icon))
  end
end

function WBP_SquadListItem_C:HideOrShowItemUIInfo(bShow)
  if bShow then
    self.Avatar:SetVisibility(ESlateVisibility.Visible)
    self.HorizontalBox_0:SetVisibility(ESlateVisibility.Visible)
    self.Icon_Sort:SetVisibility(ESlateVisibility.Visible)
  else
    self.Avatar:SetVisibility(ESlateVisibility.Collapsed)
    self.HorizontalBox_0:SetVisibility(ESlateVisibility.Collapsed)
    self.Icon_Sort:SetVisibility(ESlateVisibility.Collapsed)
  end
  self:PlayAnimation(self.Normal)
end

function WBP_SquadListItem_C:CheckSortIcon()
  self.IsNeedSort = self.Index == self.Owner.CurSelectSquadIndex and self.Owner.SquadListLen > 1
  if self.IsNeedSort then
    self.Icon_Sort:SetRenderOpacity(1)
    self.Icon_Sort:SetVisibility(ESlateVisibility.Visible)
  else
    self.Icon_Sort:SetRenderOpacity(0)
    self.Icon_Sort:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_SquadListItem_C:PlayUpArrowAnimation()
  self.Arrow_Up:SetVisibility(ESlateVisibility.Visible)
end

function WBP_SquadListItem_C:PlayDownArrowAnimation()
  self.Arrow_Down:SetVisibility(ESlateVisibility.Visible)
end

function WBP_SquadListItem_C:OnlyShowUpArrow()
  self.Arrow_Up:SetVisibility(ESlateVisibility.Visible)
  self.Arrow_Down:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_SquadListItem_C:OnlyShowDownArrow()
  self.Arrow_Up:SetVisibility(ESlateVisibility.Collapsed)
  self.Arrow_Down:SetVisibility(ESlateVisibility.Visible)
end

function WBP_SquadListItem_C:ShowAllArrow()
  self.Arrow_Down:SetVisibility(ESlateVisibility.Visible)
  self.Arrow_Up:SetVisibility(ESlateVisibility.Visible)
end

function WBP_SquadListItem_C:HideAllArrow()
  self.Arrow_Down:SetVisibility(ESlateVisibility.Collapsed)
  self.Arrow_Up:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_SquadListItem_C:CheckBasicSquadInfo()
  if self.SquadInfo.Char and self.SquadInfo.MeleeWeapon and self.SquadInfo.RangedWeapon then
    return true
  end
  return false
end

function WBP_SquadListItem_C:InitBtn()
  if self.IsAddSquad then
    self.Btn_Add.OnClicked:Add(self, function()
      self:OnBtnAddClicked()
    end)
    self.Btn_Add.OnPressed:Add(self, function()
      self:OnBtnAddPressed()
    end)
    self.Btn_Add.OnHovered:Add(self, function()
      self:OnBtnAddHovered()
    end)
    self.Btn_Add.OnUnhovered:Add(self, function()
      self:OnBtnAddUnhovered()
    end)
    self:PlayAnimation(self.Add_Normal)
  else
  end
end

function WBP_SquadListItem_C:MoveUp()
  local NowIndex = self.Index - self.FakeIndex
  if NowIndex >= 0 then
    self:PlayAnimation(self["Offset_Up_" .. NowIndex])
    DebugPrint("thy  MoveUp: Offset_Up_   ", NowIndex, self.FakeIndex, self.Index, self.SquadInfo.CharId)
  else
    NowIndex = math.abs(NowIndex) - 1
    self:PlayAnimation(self["Offset_Down_" .. NowIndex], 0, 1, EUMGSequencePlayMode.Reverse)
    DebugPrint("thy  MoveUp:   Offset_Down_    ", NowIndex, self.FakeIndex, self.Index, self.SquadInfo.CharId)
  end
end

function WBP_SquadListItem_C:MoveDown()
  local NowIndex = self.Index - self.FakeIndex
  if NowIndex <= 0 then
    NowIndex = math.abs(NowIndex)
    self:PlayAnimation(self["Offset_Down_" .. NowIndex])
    DebugPrint("thy  MoveDown: Offset_Down_", NowIndex, self.FakeIndex, self.Index, self.SquadInfo.CharId)
  else
    NowIndex = NowIndex - 1
    self:PlayAnimation(self["Offset_Up_" .. NowIndex], 0, 1, EUMGSequencePlayMode.Reverse)
    DebugPrint("thy  MoveDown: Offset_Up_   ", NowIndex, self.FakeIndex, self.Index, self.SquadInfo.CharId)
  end
end

function WBP_SquadListItem_C:OnBtnAddClicked()
  self:PlayAnimation(self.Add_Click)
  if self.ClickCallback then
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_large", nil, nil)
    self.ClickCallback(self.Owner)
  end
end

function WBP_SquadListItem_C:OnBtnAddPressed()
  self:PlayAnimation(self.Add_Press)
end

function WBP_SquadListItem_C:OnBtnAddHovered()
  self:PlayAnimation(self.Add_Hover)
end

function WBP_SquadListItem_C:OnBtnAddUnhovered()
  self:PlayAnimation(self.Add_UnHover)
end

function WBP_SquadListItem_C:OnMouseButtonDown(MyGeometry, MouseEvent)
  self.bClickBegin = true
  if not self.IsAddSquad then
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_large", nil, nil)
  end
  if self.Owner.CurSelectSquadIndex ~= self.Index then
    self:PlayAnimation(self.Press)
  end
  if self.IsNeedSort and self.Owner.CurSelectSquadIndex == self.Index then
    self.IsPressingItem = true
    self.StartDrag = false
    self.StartDragCountDown = self.StartDragTime
    self:AddTimer(0.1, function()
      if not self.IsPressingItem then
        DebugPrint("thy  OnDragDetected fail")
        self:RemoveTimer("DragDelay")
        return UnHandled
      end
      self.StartDragCountDown = math.max(self.StartDragCountDown - 0.1, 0)
      if self.StartDragCountDown <= 0 then
        self.StartDrag = true
        self:CheckArrowState()
        self:RemoveTimer("DragDelay")
      end
    end, true, 0, "DragDelay", true)
  end
  local LocalHandle = UE.UWidgetBlueprintLibrary.DetectDragIfPressed(MouseEvent, self, UE.EKeys.LeftMouseButton)
  return UE4.UWidgetBlueprintLibrary.CaptureMouse(LocalHandle, self)
end

function WBP_SquadListItem_C:OnMouseButtonUp(MyGeometry, MouseEvent)
  self.Owner:GetSquadWidgetInSquadList(self.Owner.CurSelectSquadIndex):HideAllArrow()
  if not self.bClickBegin then
    return Handled
  end
  self.bClickBegin = false
  if self.Owner.CurSelectSquadIndex ~= self.Index then
    self.Owner:SelectCurSquadInSquadList(self.Index)
  end
  self.Owner.IsNeedPlayRefresh = true
  self.IsPressingItem = false
  return Handled
end

function WBP_SquadListItem_C:OnMouseMove(MyGeometry, MouseEvent)
  if self.Owner.IsDraging then
  end
  local Reply = UE4.UWidgetBlueprintLibrary.DetectDragIfPressed(InMouseEvent, self, EKeys.LeftMouseButton)
  return UE4.UWidgetBlueprintLibrary.ReleaseMouseCapture(Reply)
end

function WBP_SquadListItem_C:OnMouseEnter(MyGeometry, InKeyEvent)
  if not self.IsSelect and "PC" == Platform then
    self:PlayAnimation(self.Hover)
  end
end

function WBP_SquadListItem_C:OnMouseLeave(MyGeometry, InKeyEvent)
  if self.Owner.IsDraging then
  end
  self.IsPressingItem = false
  if not self.IsSelect and "PC" == Platform then
    self:PlayAnimation(self.UnHover)
  else
    self:PlayAnimation(self.Select)
  end
end

function WBP_SquadListItem_C:OnTouchStarted(MyGeometry, InTouchEvent)
  local LocalHandle = UE.UWidgetBlueprintLibrary.DetectDragIfPressed(InTouchEvent, self, UE.FKey("Touch"))
  self.bClickBegin = true
  if self.Owner.CurSelectSquadIndex ~= self.Index then
    self:PlayAnimation(self.Press)
  end
  if self.IsNeedSort and self.Owner.CurSelectSquadIndex == self.Index then
    self.IsPressingItem = true
    self.StartDrag = false
    self.StartDragCountDown = self.StartDragTime
    self:AddTimer(0.1, function()
      if not self.IsPressingItem then
        DebugPrint("thy  OnDragDetected fail")
        self:RemoveTimer("DragDelay")
        return
      end
      DebugPrint("thy  self.StartDragCountDown ", self.StartDragCountDown)
      self.StartDragCountDown = math.max(self.StartDragCountDown - 0.1, 0)
      if self.StartDragCountDown <= 0 then
        self.StartDrag = true
        DebugPrint("thy  self.StartDragCountDown 0")
        self:CheckArrowState()
        self:RemoveTimer("DragDelay")
      end
    end, true, 0, "DragDelay", true)
  end
  return LocalHandle
end

function WBP_SquadListItem_C:OnTouchEnded(MyGeometry, InTouchEvent)
  DebugPrint("thy   OnTouchEnded")
  self.Owner:GetSquadWidgetInSquadList(self.Owner.CurSelectSquadIndex):HideAllArrow()
  if not self.bClickBegin then
    return Handled
  end
  self.bClickBegin = false
  if self.Owner.CurSelectSquadIndex ~= self.Index then
    self.Owner:SelectCurSquadInSquadList(self.Index)
  end
  self.IsPressingItem = false
  return Handled
end

function WBP_SquadListItem_C:ShowFakeIconInDrag()
  self.BG:SetVisibility(ESlateVisibility.HitTestInvisible)
  self.Avatar:SetVisibility(ESlateVisibility.HitTestInvisible)
  self.HorizontalBox_0:SetVisibility(ESlateVisibility.HitTestInvisible)
end

function WBP_SquadListItem_C:InitAsDragUI(Owner)
  self.LinkWidgets = {}
  self.ActiveLinkWidgets = {}
  self.Panel_Add:SetVisibility(ESlateVisibility.Collapsed)
  local AllWidgets = self.Panel_Normal:GetAllChildren():ToTable()
  for key, value in pairs(AllWidgets) do
    value:GetName()
    value:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Icon_Warning:SetVisibility(ESlateVisibility.Collapsed)
  self:ShowFakeIconInDrag()
  self:PlayAnimation(self.Click, 0.17)
  local CharId = Owner.SquadInfo.CharId
  local IconDynaMaterial = self.Icon_Avatar:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("IconMap", LoadObject(DataMgr.Char[CharId].Icon))
  end
  local SquadName = Owner.SquadInfo.Name or GText("Squad_DefaultName1")
  self.Text_Name:SetText(SquadName)
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:SetRenderScale(FVector2D(1, 1))
end

function WBP_SquadListItem_C:CreateDragUI()
  local DragUI = UIManager(self):_CreateWidgetNew("SquadListItem")
  DragUI:InitAsDragUI(self)
  return DragUI
end

function WBP_SquadListItem_C:OnDragDetected(MyGeometry, PointerEvent)
  self.Owner:GetSquadWidgetInSquadList(self.Owner.CurSelectSquadIndex):HideAllArrow()
  if self.Owner.CurSelectSquadIndex ~= self.Index or not self.StartDrag then
    return
  end
  self.bClickBegin = false
  self.Owner.IsDraging = true
  local DragDropOperation = NewObject(UIUtils.GetCommonDragDropOperationClass())
  local DragUI = self:CreateDragUI()
  DragDropOperation.DefaultDragVisual = DragUI
  DragDropOperation.Pivot = UE.EDragPivot.CenterCenter
  DragDropOperation.Index = self.Index
  DragDropOperation.FakeIndex = self.FakeIndex
  DragDropOperation.Tag = "SquadListItem"
  DragDropOperation.Payload = self.Content
  DragDropOperation.Owner = self.Owner
  self:HideOrShowItemUIInfo(false)
  self.Owner:SwitchAddSquadItemVisibility(false)
  return DragDropOperation
end

function WBP_SquadListItem_C:OnDragEnter(MyGeometry, PointerEvent, Operation)
  if self.Owner.IsDraging then
  end
  if not self.IsSelect and "PC" == Platform then
    self:PlayAnimation(self.Hover)
  end
  if 1 == Operation.FakeIndex then
    Operation.DefaultDragVisual:OnlyShowDownArrow()
    Operation.DefaultDragVisual:PlayDownArrowAnimation()
  elseif Operation.FakeIndex < self.Owner.SquadListLen then
    Operation.DefaultDragVisual:ShowAllArrow()
    Operation.DefaultDragVisual:PlayUpArrowAnimation()
    Operation.DefaultDragVisual:PlayDownArrowAnimation()
  else
    Operation.DefaultDragVisual:OnlyShowUpArrow()
    Operation.DefaultDragVisual:PlayUpArrowAnimation()
  end
  return true
end

function WBP_SquadListItem_C:OnDragLeave(PointerEvent, Operation)
  if self.Owner.IsDraging then
  end
  if not self.IsSelect and "PC" == Platform then
    self:PlayAnimation(self.UnHover)
  end
  local SquadMainUI = UIManager(self):GetUIObj("SquadMainUINew")
  local ListViewGeo = SquadMainUI.List_Default:GetTickSpaceGeometry()
  local MousePos = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(PointerEvent)
  if self.Offset then
    MousePos.X = MousePos.X + self.Offset
  end
  if not UE4.USlateBlueprintLibrary.IsUnderLocation(ListViewGeo, MousePos) then
    Operation.DefaultDragVisual:SetVisibility(ESlateVisibility.Collapsed)
    self.Owner.IsDraging = false
    self.StartDrag = false
    self.Owner.IsInSortState = false
    self.Owner.IsOutBound = true
    self.Owner:SelectCurSquadInSquadList(self.Owner.CurSelectSquadIndex)
    self.Owner:HideOrShowItemInDraging()
  end
  return true
end

function WBP_SquadListItem_C:OnDragCancelled(PointerEvent, Operation)
  self.Owner.IsDraging = false
  self.StartDrag = false
  Operation.DefaultDragVisual:HideAllArrow()
  if not self.Owner.IsOutBound then
    self.Owner:SelectCurSquadInSquadList(self.Owner.CurSelectSquadIndex)
    self.Owner:HideOrShowItemInDraging()
  end
  self.Owner.IsOutBound = false
  self.Owner:SwitchAddSquadItemVisibility(true)
  return true
end

function WBP_SquadListItem_C:OnDrop(MyGeometry, PointerEvent, Operation)
  self.Owner.IsDraging = false
  self.StartDrag = false
  Operation.DefaultDragVisual:HideAllArrow()
  self.Owner:HideOrShowItemInDraging()
  self.Owner:SwitchAddSquadItemVisibility(true)
  self.Owner:SelectCurSquad(self.Owner.CurSelectSquadIndex)
  return true
end

function WBP_SquadListItem_C:OnDragOver(MyGeometry, PointerEvent, Operation)
  if not self.Owner.IsDraging then
    return true
  end
  local ListView = self.Owner.List_Default
  local MouseDownPos = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(PointerEvent)
  local LocalPos = USlateBlueprintLibrary.AbsoluteToLocal(ListView:GetCachedGeometry(), MouseDownPos)
  local ScrollOffset = ListView:GetScrollOffset()
  local YPos = LocalPos.Y + ScrollOffset
  local ListViewHeight, ItemHeight = self:GetListViewSize(ListView)
  local NewIndex = math.clamp(math.floor(YPos / ItemHeight), 0, self.Owner.SquadListLen - 1) + 1
  local DragIndex = Operation.FakeIndex
  if DragIndex ~= NewIndex then
    self:ChangeTwoItemInListView(ListView, DragIndex, NewIndex, Operation)
  end
  return true
end

function WBP_SquadListItem_C:ChangeTwoItemInListView(ListView, DragIndex, NewIndex, Operation)
  local ListViewItems = ListView:GetListItems()
  NewIndex = math.min(NewIndex, self.Owner.SquadMax)
  if ListViewItems[NewIndex].IsAddSquad then
    return
  end
  DebugPrint("thy  MoveChangeTwoItemInListView", DragIndex, NewIndex)
  local DragItem = self.Owner:GetSquadContent(DragIndex)
  local NewItem = self.Owner:GetSquadContent(NewIndex)
  if DragItem and NewItem then
    DebugPrint("thy  DragItem", DragItem.Index, DragItem.SquadInfo.CharId)
    DebugPrint("thy  NewItem", NewItem.Index, NewItem.SquadInfo.CharId)
    if DragIndex < NewIndex then
      DragItem:MoveDown()
      NewItem:MoveUp()
    else
      DragItem:MoveUp()
      NewItem:MoveDown()
    end
    DragItem:SetIndex(NewIndex)
    NewItem:SetIndex(DragIndex)
  else
    DebugPrint("thy  DragItem or NewItem is nil", DragItem, NewItem)
  end
  if Operation then
    Operation.FakeIndex = NewIndex
  end
  self.Owner.CurSelectSquadIndex = self.FakeIndex
  self.Owner:SelectCurSquadInSquadList(self.Owner.CurSelectSquadIndex, false)
  local Avatar = GWorld:GetAvatar()
  Avatar:SwitchSquad(nil, self, DragIndex, NewIndex)
end

function WBP_SquadListItem_C:GetListViewSize(TileView)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local ListSize = UIManager:GetWidgetRenderSize(TileView)
  local Parent = TileView:GetParent()
  if Parent:Cast(UScrollBox) then
    ListSize = UIManager:GetWidgetRenderSize(Parent)
  end
  local ListSizeX, ItemSizeX = ListSize.X, UIManager:GetWidgetRenderSize(self.BG).X
  local ListSizeY, ItemSizeY = ListSize.Y, UIManager:GetWidgetRenderSize(self.BG).Y
  self.Offset = (ListSizeX - ItemSizeX) / 2
  return ListSizeY, ItemSizeY
end

function WBP_SquadListItem_C:GetItemRenderSizeXY(Item)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  return UIManager:GetWidgetRenderSize(Item).X, UIManager:GetWidgetRenderSize(Item).Y
end

function WBP_SquadListItem_C:CheckArrowState()
  if 1 == self.FakeIndex then
    self:OnlyShowDownArrow()
    self:PlayDownArrowAnimation()
  elseif self.FakeIndex < self.Owner.SquadListLen then
    self:ShowAllArrow()
    self:PlayUpArrowAnimation()
    self:PlayDownArrowAnimation()
  else
    self:OnlyShowUpArrow()
    self:PlayUpArrowAnimation()
  end
end

function WBP_SquadListItem_C:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.Owner.CurInputDeviceType and self.Owner.CurInputDeviceType == ECommonInputType.Gamepad then
    if self.Owner.IsInSortState then
      self.Owner:FocusOnSquadListInSortState()
      return UnHandled
    else
      self.Owner.IsOnlyPlayAnimation = false
      self.Owner:SelectCurSquad(self.Owner:GetSquadContentListIndex(self.FakeIndex))
      if self.IsAddSquad then
        self.Owner.IsAddSquadDefault = true
        self.Owner:InitBottomTab(false, 2)
        self.Owner.FocusInAddSquad = true
        return UnHandled
      else
        local PreIndex = self.Owner.CurSelectSquadIndex
        self.Owner.CurSelectSquadIndex = self.Owner:GetSquadContentListIndex(self.FakeIndex)
        self.Owner:GetSquadWidgetInSquadList(PreIndex):CheckSortIcon()
        if self.Owner.IsAddSquadDefault then
          self.Owner.IsAddSquadDefault = false
          self.Owner:InitBottomTab(true, 2)
        end
        self:CheckSortIcon()
        return Handled
      end
    end
  end
  return UnHandled
end

return WBP_SquadListItem_C
