require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:InitContent(Params, PopupData, Owner)
  self.OptionalItemsList = Params.OptionalItemsList
  self.ChooseCallbackFunction = Params.ChooseCallbackFunction
  self.FunctionCallbackObj = Params.FunctionCallbackObj
  self.OriginalTips = Params.Tips
  self.CurrentChooseWidget = nil
  self.CurrentChooseInfo = {}
  self.AllItemsWidget = {}
  self.CurrentCount = 0
  self.ResourceName = Params.Title
  self.GamePadMode = "Default"
  self.OptCount = Params.OptionalItemsList[1].OptCount
  self.Id2ConsumeCount = {}
  self.GamePadKeyLS = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    },
    Desc = GText("UI_Controller_CheckDetails")
  })
  self:InitAllOptionalItemsInfo()
  self:InitListenEvent()
  self:InitUIInfo()
end

function M:InitUIInfo()
  self.List_Prop:SetScrollbarVisibility(UE4.ESlateVisibility.Collapsed)
  self.List_Prop:SetControlScrollbarInside(true)
end

function M:InitAllOptionalItemsInfo()
  self.List_Prop:ClearListItems()
  for Index, ItemInfo in ipairs(self.OptionalItemsList) do
    ItemInfo.Index = Index
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = ItemInfo.StuffId
    Content.Rarity = ItemInfo.Rarity
    Content.Type = CommonConst.DataType.Resource
    Content.Name = ItemInfo.StuffName
    Content.Count = ItemInfo.Count
    Content.IsShowDetails = true
    Content.Icon = ItemInfo.StuffIcon
    Content.Count = ItemInfo.Count
    Content.ItemType = ItemInfo.StuffType
    Content.ChooseCallback = self.ChangeChooseClickCallback
    Content.ParentWidget = self
    Content.ChooseIndex = ItemInfo.Index
    Content.OptionalId = ItemInfo.OptionalId
    Content.ResourceId = ItemInfo.ResourceId
    Content.OptCount = ItemInfo.OptCount
    Content.StuffCount = ItemInfo.StuffCount
    self.Id2ConsumeCount[ItemInfo.StuffId] = 0
    self.List_Prop:AddItem(Content)
    table.insert(self.AllItemsWidget, Item)
  end
  local CurInputDevice = self.GameInputModeSubsystem:GetCurrentInputType()
  self:RefreshOpInfoByInputDevice(CurInputDevice)
  local AllCanNavigateCount = #self.AllItemsWidget
  for Idx, TargetWidget in ipairs(self.AllItemsWidget) do
    if TargetWidget then
      TargetWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
      TargetWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      if 1 == Idx then
      else
        if Idx == AllCanNavigateCount then
        else
        end
      end
    end
  end
end

function M:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:Destruct()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:ChangeChooseClickCallback(bSelectState, ChooseInfo)
  if self.CurrentChooseWidget then
  end
  local ChooseId = ChooseInfo.ChooseId
  self.CurrentChooseInfo[ChooseId] = ChooseInfo
  if bSelectState then
    self.CurrentChooseWidget = ChooseInfo.ChooseWidget
    if type(self.ChooseCallbackFunction) == "function" then
      self.ChooseCallbackFunction(self.FunctionCallbackObj, self.CurrentChooseInfo)
    end
    self.Owner:ForbidRightBtn(false)
  else
    self.CurrentChooseWidget = nil
    self.Owner:ForbidRightBtn(true)
  end
end

function M:ScrollToTargetItem(TargetItem)
  self.ScrollBox_Avatar:ScrollWidgetIntoView(TargetItem)
end

function M:BP_GetDesiredFocusTarget()
  return self.CurrentChooseWidget or self.ScrollBox_Avatar
end

function M:OnBtnYes()
  if self.Owner then
    if 0 == self.CurrentCount then
      self.Owner:OnForbiddenRightBtnClicked()
    else
      self.Owner:OnRightBtnClicked()
    end
  end
end

function M:HideSelf(bIsHide, IsNeedFocus)
  if self.Owner then
    if bIsHide then
      self.Owner:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Owner:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    if IsNeedFocus then
      self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
      self:AddTimer(0.6, function()
        self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
        self:SetFocus()
      end)
    end
  end
end

function M:CloseDialog()
  if self.Owner then
    self.Owner:Close()
  end
end

function M:RefreshDialogTip()
  self:BroadcastDialogEvent("UpdateDialogTipText", {
    Tips = {
      string.format(GText("UI_Consumable_Effect_ResourcePack"), self.ResourceName, self.CurrentCount, self.OptCount, 2)
    },
    DialogItemIndex = 1,
    bShowTip = true
  })
  if self.CurrentCount <= 0 then
    self.Owner:ForbidRightBtn(true)
  else
    self.Owner:ForbidRightBtn(false)
  end
end

function M:GetCurrentHoverItem()
  local TargetWidget
  local Displayed = self.List_Prop:GetDisplayedEntryWidgets()
  local index = 1
  if Displayed then
    for i = 1, Displayed:Length() do
      local Entry = Displayed:GetRef(i)
      if Entry and (Entry:IsHovered() or Entry.HasAnyFocus and Entry:HasAnyFocus()) then
        TargetWidget = Entry
        index = i - 1
        break
      end
    end
  end
  return TargetWidget
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.MouseAndKeyboard then
    if self.LastFocusWidget and self.LastFocusWidget.Com_NumInput then
      self.LastFocusWidget.Com_NumInput:UpdateUIStyleInPlatform(true)
    end
  elseif CurInputDevice == ECommonInputType.Gamepad then
    self.List_Prop:SetFocus()
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if (InKeyName == UIConst.GamePadKey.DPadRight or InKeyName == UIConst.GamePadKey.DPadLeft) and self.GamePadMode ~= "CheckDetails" then
    local Item = self:GetCurrentHoverItem()
    Item:OnKeyDownEvent(InKeyName)
    IsEventHandled = true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == UIConst.GamePadKey.FaceButtonRight then
      if self.GamePadMode == "CheckDetails" then
        self:ChangeGamePadMode("Default")
        IsEventHandled = true
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
      if self.CurrentChooseInfo ~= nil then
        self:OnBtnYes()
        IsEventHandled = true
      end
    elseif InKeyName == UIConst.GamePadKey.LeftThumb then
      if self.LastFocusWidget then
        self.LastFocusWidget.Item_Gift:OpenItemMenu()
        self:ChangeGamePadMode("CheckDetails")
      end
      IsEventHandled = true
    elseif self.GamePadMode ~= "CheckItems" then
      local Item = self:GetCurrentHoverItem()
      if Item then
        IsEventHandled = Item:OnKeyDownEvent(InKeyName)
      end
    end
  end
  return IsEventHandled
end

function M:OnMenuOpenChangedEvents(bIsOpen)
  if bIsOpen then
    self:ChangeGamePadMode("CheckDetails")
  else
    self:ChangeGamePadMode("Default")
    self:AddTimer(0.01, function()
      self.LastFocusWidget:SetFocus()
    end)
  end
end

function M:ChangeGamePadMode(Mode)
  if "CheckDetails" == Mode then
    self:HideGamepadShortcut(self.GamePadKeyLS)
    self.Owner:SetGamepadBtnKeyVisibility(false)
    self.GamePadMode = "CheckDetails"
  elseif "Default" == Mode then
    self:ShowGamepadShortcut(self.GamePadKeyLS)
    local CurInputDevice = self.GameInputModeSubsystem:GetCurrentInputType()
    if CurInputDevice == ECommonInputType.Gamepad then
      self.Owner:SetGamepadBtnKeyVisibility(true)
    end
    self.GamePadMode = "Default"
  end
end

return M
