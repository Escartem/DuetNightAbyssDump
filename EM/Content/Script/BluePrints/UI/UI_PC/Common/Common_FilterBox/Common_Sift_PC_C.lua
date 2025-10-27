require("UnLua")
local UIUtils = require("Utils.UIUtils")
local M = Class("BluePrints.UI.BP_UIState_C")
local IconPathFiltered = "/Game/UI/UI_PNG_Static/Atlas/Common/Common_Filter02.Common_Filter02"
local IconPathUnFiltered = "/Game/UI/UI_PNG_Static/Atlas/Common/Common_Filter.Common_Filter"

function M:Init(Filters)
  self.Filters = Filters or {}
  self.IsSelected = false
  self.SelectedSiftItems = {}
  self.IsListViewOpened = false
  self.SelectedItems = {}
  self.Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Properties:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Properties:SetText("")
  self.List:ClearListItems()
  if Filters and #Filters > 0 then
    self.Filters = Filters
    for i, value in ipairs(Filters) do
      local Obj = NewObject(UIUtils.GetCommonItemContentClass())
      Obj.Text = value
      Obj.Mode = "Multi"
      Obj.IsSelected = false
      Obj.Index = i
      Obj.Owner = self
      self.List:AddItem(Obj)
    end
    self.Button_FIiliter_List:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Button_FIiliter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:UpdateFilterInfos()
  self.Image_Filiter_1:SetBrushResourceObject(self.IconUnfiltered)
end

function M:BindEventOnSelectionsChanged(Obj, Event)
  self.Obj_OnSelectionsChanged = Obj
  self.Event_OnSelectionsChanged = Event
end

function M:BindEventOnAddedToFocusPath(Obj, Event)
  self.Obj_OnAddedToFocusPath = Obj
  self.Event_OnAddedToFocusPath = Event
end

function M:BindEventOnRemovedFromFocusPath(Obj, Event)
  self.Obj_OnRemovedFromFocusPath = Obj
  self.Event_OnRemovedFromFocusPath = Event
end

function M:GetFilterInfos()
  return self.FiltersRes
end

function M:UpdateFilterInfos()
  local FiltersHintText = ""
  local Indexes = {}
  local bHasItem = next(self.SelectedItems) ~= nil
  local Items = self.List:GetListItems()
  local Len = Items:Length()
  if bHasItem then
    for i = 1, Len do
      if self.SelectedItems[Items[i].Text] then
        FiltersHintText = FiltersHintText .. GText(Items[i].Text) .. ", "
        table.insert(Indexes, Items[i].Index)
      end
    end
    FiltersHintText = string.sub(FiltersHintText, 1, #FiltersHintText - 2)
  else
    for i = 1, Len do
      table.insert(Indexes, Items[i].Index)
    end
  end
  self.FiltersRes = Indexes
  return self.FiltersRes, FiltersHintText
end

function M:Construct()
  M.Super.Construct(self)
  self:AddDispatcher(EventID.OnMenuClose, self, self.OnListClosed)
  self.Button_FIiliter_List:BindEventOnClicked(self, self.ListOpenBtnClicked)
  self.Button_FIiliter_List:BindEventOnHover(self, self.OnBtn_Filter_List_Hovered)
  self.Button_FIiliter_List:BindEventOnUnhover(self, self.OnBtn_Filter_List_Unhovered)
  self:BindToAnimationFinished(self.List_Out, {
    self,
    self.OnListOutFin
  })
  self.Text_Properties:SetText("")
  self.SiftModelId = nil
  self.SiftPreviewWidget = self.SiftPreview_Middle
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
  self.FocusKeyName = "LS"
  self:SetGamepadKey(self.FocusKeyName)
  self:InitNavigationRules()
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
end

function M:SetGetBackFocusWidget(OnGetBackFocusWidget)
  self.OnGetBackFocusWidget = OnGetBackFocusWidget
end

function M:OnListOutFin()
  self.Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:Destruct()
  self.Button_FIiliter_List:UnbindEventOnHover()
  self.Button_FIiliter_List:UnbindEventOnUnhover()
  self.Button_FIiliter_List:UnBindEventOnReleased(self, self.ListOpenBtnClicked)
  self:UnbindFromAnimationFinished(self.List_Out, {
    self,
    self.OnListOutFin
  })
  self:RemoveDispatcher(EventID.OnMenuClose)
  self.SiftBox = nil
  self.Event_OnSelectionsChanged = nil
  self.Obj_OnSelectionsChanged = nil
  M.Super.Destruct(self)
end

function M:OnBtn_Filter_List_Hovered()
  if self.IsListViewOpened then
    return
  end
  if self.Text_Properties:GetText() ~= "" then
    self.Properties:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:OnBtn_Filter_List_Unhovered()
  if self.IsListViewOpened then
    return
  end
  if self.Text_Properties:GetText() ~= "" then
    self.Properties:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:GetSiftModelData(SiftModelId)
  local SiftModelDataList = {}
  local SubIds = DataMgr.SiftModel[SiftModelId].SubId
  for _, SiftId in ipairs(SubIds) do
    local SiftData = DataMgr.SiftDimens[SiftId]
    table.insert(SiftModelDataList, SiftData)
  end
  if 0 == #SiftModelDataList then
    DebugPrint("\233\148\153\232\175\175\239\188\154\230\156\170\230\137\190\229\136\176\229\175\185\229\186\148\231\154\132\231\173\155\233\128\137\230\168\161\229\158\139\230\149\176\230\141\174\239\188\140SiftModelId:", SiftModelId)
    return nil
  end
  return SiftModelDataList
end

function M:OnSiftBoxConfirmed(ItemUI, SelectedItems, ItemDatas)
  self.SelectedSiftItems = SelectedItems
  if SelectedItems and next(SelectedItems) then
    self.SiftPreviewWidget:Init(self, ItemUI, SelectedItems, ItemDatas)
    self.Switch_Icon:SetActiveWidgetIndex(1)
    if self.Event_OnSelectionsChanged then
      self.Event_OnSelectionsChanged(self.Obj_OnSelectionsChanged, self.SelectedSiftItems, ItemDatas)
    end
  else
    self.SiftPreviewWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:PreViewDelete(true)
  end
  self:AddTimer(0.2, function()
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      self.Button_FIiliter_List:SetFocus()
    end
  end)
end

function M:ClearSiftSelection()
  self.SiftPreviewWidget:ClearItemSelection()
end

function M:PreViewDelete(bResetFocus2Btn)
  self.SelectedSiftItems = {}
  self.Switch_Icon:SetActiveWidgetIndex(0)
  if self.Event_OnSelectionsChanged then
    self.Event_OnSelectionsChanged(self.Obj_OnSelectionsChanged, self.SelectedSiftItems)
  end
  if self.CurInputDeviceType == ECommonInputType.Gamepad and bResetFocus2Btn then
    self.Button_FIiliter_List:SetFocus()
  end
end

function M:AfterSiftBoxClosed()
  self:AddTimer(0.3, function()
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      self.Button_FIiliter_List:SetFocus()
    end
  end)
end

function M:OpenSiftBox(SiftModelId)
  local ModSiftDatas = self:GetSiftModelData(SiftModelId)
  local Params = {
    ParentWidget = self,
    ItemDatas = ModSiftDatas,
    DontCloseWhenLeftBtnClicked = true,
    RightGamepadKey = EKeys.X.KeyName,
    RightGamepadImg = EKeys.X.KeyName,
    LeftGamepadKey = EKeys.Y.KeyName,
    LeftGamepadImg = EKeys.Y.KeyName,
    CloseBtnCallbackFunction = function()
      if self.SelectedSiftItems and next(self.SelectedSiftItems) then
        self.IsSelected = true
      end
      self:AfterSiftBoxClosed()
    end,
    OnConfirmCallback = function(ItemUI, DialogObj, SelectedItems, ItemDatas)
      if next(SelectedItems) then
        self.IsSelected = true
      end
      self:OnSiftBoxConfirmed(ItemUI, SelectedItems, ItemDatas)
    end,
    ReselectionCallback = function(SiftBox)
      self.SiftBox = SiftBox
      if self.IsSelected then
        SiftBox:Reselection(self.SelectedSiftItems)
        self.IsSelected = false
      end
    end
  }
  local Dialog = UIManager(self):ShowCommonPopupUI(100129, Params, self)
end

function M:SetSiftModelId(SiftModelId)
  self.SiftModelId = SiftModelId
end

function M:SetSiftPreviewSideWidget(bSideWidget, bRight)
  if bSideWidget then
    if bRight then
      self.SiftPreviewWidget = self.SiftPreview_Side_R
    else
      self.SiftPreviewWidget = self.SiftPreview_Side
    end
  else
    self.SiftPreviewWidget = self.SiftPreview_Middle
  end
end

function M:ListOpenBtnClicked()
  if not self.SiftModelId then
    print("Error: SiftModelId is not set.")
    return
  end
  self:OpenSiftBox(self.SiftModelId)
  if not self.Filters then
    self.Filter_List:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  if not self.IsListViewOpened then
    EventManager:FireEvent(EventID.OnMenuClose)
    self.Properties:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:PlayAnimation(self.List_In)
    self.Filter_List:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.IsListViewOpened = true
    for _, Item in pairs(self.SelectedItems) do
      if IsValid(Item.Entry) then
        Item.Entry:OnEntrySelectionChanged()
      end
    end
  else
    self:OnListClosed()
  end
end

function M:OnListItemClicked(Content)
  if self:IsAnimationPlaying(self.List_In) then
    return
  end
  Content.IsSelected = not Content.IsSelected
  Content.Entry:OnEntrySelectionChanged()
  if Content.IsSelected then
    self.SelectedItems[Content.Text] = Content
  else
    self.SelectedItems[Content.Text] = nil
  end
  local Filters, FiltersHintText = self:UpdateFilterInfos()
  self.Text_Properties:SetText(FiltersHintText)
  if "" ~= FiltersHintText then
    self.Image_Filiter_1:SetBrushResourceObject(self.IconFiltered)
  else
    self.Image_Filiter_1:SetBrushResourceObject(self.IconUnfiltered)
  end
  if self.Event_OnSelectionsChanged then
    self.Event_OnSelectionsChanged(self.Obj_OnSelectionsChanged, Filters)
  end
end

function M:OnListClosed()
  if self.Filters and self.IsListViewOpened then
    self:PlayAnimation(self.List_Out)
    self.IsListViewOpened = false
  else
  end
end

function M:IsSifted()
  local hasSelectedItems = self.SelectedSiftItems and next(self.SelectedSiftItems) ~= nil
  local isSiftPreviewGenerated = self.SiftPreviewWidget and self.SiftPreviewWidget:GetVisibility() ~= UIConst.VisibilityOp.Collapsed
  if hasSelectedItems and isSiftPreviewGenerated then
    return true
  else
    return false
  end
end

function M:UpdateGamepadKeyState()
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    if self.IsInFocusPath or IsValid(self.ListWidget) and self.ListWidget.IsInFocusPath or self.ListWidgetOpening then
      self.Controller_L:SetRenderOpacity(0)
    else
      self.Controller_L:SetRenderOpacity(1)
    end
    self.Controller_L:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Controller_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:InitNavigationRules()
  self.Button_FIiliter_List:SetNavigationRuleExplicit(EUINavigation.Up, self.SiftPreviewWidget)
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  local ActiveWidgetIndex = IsUseKeyAndMouse and 0 or 1
  if IsUseKeyAndMouse then
  else
  end
  self:UpdateGamepadKeyState()
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if not UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) or InKeyName == UIConst.GamePadKey.FaceButtonDown then
  end
  if UIConst.GamePadKey.FaceButtonRight == InKeyName and self.OnGetBackFocusWidget then
    local Widget = self.OnGetBackFocusWidget(MyGeometry, InKeyEvent)
    if IsValid(Widget) then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), Widget)
    end
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self:SetFocus()
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnAddedToFocusPath(MyGeometry, InFocusEvent)
  if self.Event_OnAddedToFocusPath then
    self.Event_OnAddedToFocusPath(self.Obj_OnAddedToFocusPath, self)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  if self.Event_OnRemovedFromFocusPath then
    self.Event_OnRemovedFromFocusPath(self.Obj_OnRemovedFromFocusPath, self)
  end
end

function M:SetGamepadKeyVisibility(VisibilityOp)
  self.Img_Key_L:SetVisibility(VisibilityOp)
end

function M:SetGamepadKey(FocusKeyName)
  local FocusKeyImgPath = UIUtils.UtilsGetKeyIconPathInGamepad(self.FocusKeyName)
  self.Img_Key_L:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
  self:UpdateGamepadKeyState()
end

function M:Close()
  self.SiftPreviewWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:PreViewDelete(false)
  if IsValid(self.SiftBox) then
    self.SiftBox:Close()
  end
  M.Super.Close(self)
end

return M
