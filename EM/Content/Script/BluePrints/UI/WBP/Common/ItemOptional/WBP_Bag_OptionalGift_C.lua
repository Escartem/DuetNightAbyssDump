require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")
local StuffIconObject = require("BluePrints.UI.WBP.Bag.Widget.BagStuffIconObject")

function M:InitContent(Params, PopupData, Owner)
  M.Super.InitContent(self, Params, PopupData, Owner)
  self.OptionalItemsList = Params.OptionalItemsList
  self.ChooseCallbackFunction = Params.ChooseCallbackFunction
  self.FunctionCallbackObj = Params.FunctionCallbackObj
  self.OriginalTips = Params.Tips
  self.CurrentChooseInfo = nil
  self.AllItemsWidget = {}
  self.CurrentCount = 1
  self.Text_Title:SetText(GText("UI_Shop_Contain"))
  self.ShortcutBtn = {}
  self.GamePadMode = nil
  self.OptCount = Params.OptionalItemsList[1].OptCount
  self.GamePadKeyLS = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    },
    Desc = GText("UI_Controller_CheckItems")
  })
  self.GamePadKeyB = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_Controller_Close")
  })
  self.GamePadKeyA = self:ShowGamepadShortcutBtn({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_Controller_CheckDetails")
  })
  self:HideGamepadShortcut(self.GamePadKeyA)
  self:HideGamepadShortcut(self.GamePadKeyB)
  self:InitAllOptionalItemsInfo()
  self:InitUI()
  self:InitListenEvent()
end

function M:InitAllOptionalItemsInfo()
  self.List_Gift:ClearListItems()
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
    Content.OnMenuOpenChangedEvents = {
      Obj = self,
      Callback = self.OnMenuOpenChangedEvents
    }
    self.List_Gift:AddItem(Content)
    if not self.CurrentChooseInfo then
      self.CurrentChooseInfo = {
        ResourceId = ItemInfo.ResourceId,
        OptionalId = ItemInfo.OptionalId,
        ConsumeCount = 1
      }
      self:UpdateConsumeNumber()
    end
    table.insert(self.AllItemsWidget, Item)
  end
  local AllCanNavigateCount = #self.AllItemsWidget
  for Idx, TargetWidget in ipairs(self.AllItemsWidget) do
    if TargetWidget then
      TargetWidget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
      TargetWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      if 1 == Idx then
        TargetWidget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
        TargetWidget:SetNavigationRuleExplicit(EUINavigation.Right, self.AllItemsWidget[Idx + 1])
      elseif Idx == AllCanNavigateCount then
        TargetWidget:SetNavigationRuleExplicit(EUINavigation.Left, self.AllItemsWidget[Idx - 1])
        TargetWidget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
      else
        TargetWidget:SetNavigationRuleExplicit(EUINavigation.Left, self.AllItemsWidget[Idx - 1])
        TargetWidget:SetNavigationRuleExplicit(EUINavigation.Right, self.AllItemsWidget[Idx + 1])
      end
    end
  end
end

function M:InitUI()
  self.Num_Exchange:SetText(tostring(1))
  self.Num_Limit:SetText(tostring(self.OptCount))
  self.Text_Exchange:SetText(GText("UI_Consumable_Open_Count"))
  local ConfigData = {
    InitValue = 1,
    MinValue = 1,
    MaxValue = self.OptCount,
    ClickInterval = 1,
    MinusBtnCallback = self.MinusBtnCallback,
    AddBtnCallback = self.AddBtnCallback,
    SliderChangeCallback = self.SliderChangeCallback,
    SoundResPath = {
      Minus = "event:/ui/common/click_btn_minus"
    },
    OwnerPanel = self,
    EnableMiniBtn = true,
    EnableMaxBtn = true
  }
  self.Com_Slider:Init(ConfigData)
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

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.MouseAndKeyboard then
  elseif CurInputDevice == ECommonInputType.Gamepad then
    self:UpdateGamePadKey("Default")
  end
end

function M:ChangeChooseClickCallback(bSelectState, Count)
  if self.CurrentChooseWidget then
    self.CurrentChooseWidget:SetSelected(false)
  end
  self.CurrentChooseInfo = ChooseInfo
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
    self.Owner:OnRightBtnClicked()
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

function M:GetCurrentHoverItem()
  local TargetWidget
  local AllChildren = self.WB_Avatar:GetAllChildren()
  for i = 1, AllChildren:Length() do
    local ChildItem = AllChildren:GetRef(i)
    if ChildItem:CheckIsInHovered() then
      TargetWidget = ChildItem
      break
    end
  end
  return TargetWidget
end

function M:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and self.GamePadMode ~= "CheckItems" then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if not IsEventHandled then
    if InKeyName == UIConst.GamePadKey.LeftThumb then
      self.List_Gift:SetFocus()
      self.List_Gift:NavigateToIndex(0)
      self:UpdateGamePadKey("CheckItems")
      IsEventHandled = true
    elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
      if self.CurrentChooseInfo ~= nil then
        self:OnBtnYes()
        IsEventHandled = true
      end
    elseif InKeyName == UIConst.GamePadKey.FaceButtonRight and self.GamePadMode == "CheckItems" then
      self:SetFocus()
      self:UpdateGamePadKey("Default")
      IsEventHandled = true
    end
  end
  return IsEventHandled
end

function M:OnContentKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and self.GamePadMode ~= "CheckItems" then
    IsEventHandled = self:OnGamePadButtonUp(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = self.Com_Slider:Handle_KeyDownEventOnGamePad(InKeyName)
  return IsEventHandled
end

function M:OnGamePadButtonUp(InKeyName)
  local IsEventHandled = self.Com_Slider:Handle_KeyUpEventOnGamePad(InKeyName)
  return IsEventHandled
end

function M:MinusBtnCallback()
  self.CurrentCount = self.Com_Slider.CurrentCount
  self:UpdateConsumeNumber()
end

function M:AddBtnCallback()
  self.CurrentCount = self.Com_Slider.CurrentCount
  self:UpdateConsumeNumber()
end

function M:SliderChangeCallback(Value)
  self.CurrentCount = Value
  self:UpdateConsumeNumber()
end

function M:UpdateConsumeNumber()
  self.Num_Exchange:SetText(tostring(self.CurrentCount))
  self.CurrentChooseInfo.ConsumeCount = self.CurrentCount
  if type(self.ChooseCallbackFunction) == "function" then
    self.ChooseCallbackFunction(self.FunctionCallbackObj, self.CurrentChooseInfo)
  end
end

function M:UpdateGamePadKey(Mode)
  if "CheckItems" == Mode then
    self:HideGamepadShortcut(self.GamePadKeyLS)
    self:ShowGamepadShortcut(self.GamePadKeyA)
    self:ShowGamepadShortcut(self.GamePadKeyB)
    self.Owner:SetGamepadBtnKeyVisibility(false)
    self.Com_Slider:UpdateUIStyleInPlatform(false)
    self.GamePadMode = "CheckItems"
  elseif "Default" == Mode then
    self:ShowGamepadShortcut(self.GamePadKeyLS)
    self:HideGamepadShortcut(self.GamePadKeyA)
    self:HideGamepadShortcut(self.GamePadKeyB)
    self.Owner:SetGamepadBtnKeyVisibility(true)
    local CurGamepadName = self.GameInputModeSubsystem:GetCurrentGamepadName()
    self.Com_Slider:UpdateUIStyleInPlatform(true, CurGamepadName)
    self.GamePadMode = "Default"
  elseif "OpenTips" == Mode then
    self:HideGamepadShortcut(self.GamePadKeyLS)
    self:HideGamepadShortcut(self.GamePadKeyA)
    self:HideGamepadShortcut(self.GamePadKeyB)
    self.GamePadMode = "OpenTips"
  end
end

function M:OnMenuOpenChangedEvents(bIsOpen)
  if bIsOpen then
    self:UpdateGamePadKey("OpenTips")
  else
    self:UpdateGamePadKey("CheckItems")
  end
end

return M
