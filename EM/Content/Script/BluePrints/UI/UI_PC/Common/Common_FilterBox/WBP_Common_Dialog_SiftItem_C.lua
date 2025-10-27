require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Construct()
  self.isSelectedAll = false
  self.disableInteraction = false
end

function M:Init(Owner, InItem)
  self.Owner = Owner
  self.ItemData = InItem
  self.Text_Title:SetText(GText(InItem.Title))
  self.Text_SelectAll:SetText(GText("ModFilter_SelectAll"))
  if InItem.HasSelectAll then
    self.Btn_SelectAll.OnClicked:Add(self, self.OnBtnSelectAllClicked)
    self.Btn_SelectAll.OnHovered:Add(self, self.OnBtnSelectAllHovered)
    self.Btn_SelectAll.OnUnhovered:Add(self, self.OnBtnSelectAllUnhovered)
    self.Btn_SelectAll.OnPressed:Add(self, self.OnBtnSelectAllPressed)
    self.SelectAll:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.SelectAll:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:RefreshBaseInfo()
  self:InitListenEvent()
  self:SetGamepadKey("LS")
end

function M:InitSelectionItems(SelectionDatas, SelectionText, IconPaths)
  self.WBox_Selection:ClearChildren()
  local indices = {}
  for index in pairs(SelectionDatas) do
    table.insert(indices, index)
  end
  table.sort(indices)
  for _, index in ipairs(indices) do
    local name = SelectionText[index]
    local iconPath
    if IconPaths then
      iconPath = IconPaths[index]
      if "nil" == iconPath then
        iconPath = nil
      end
    end
    self:AddSelectionItem(index, name, iconPath)
  end
end

function M:AddSelectionItem(index, name, iconPath)
  local UIManager = UIManager(GWorld.GameInstance)
  local SelectionUI = UIManager:CreateWidget("/Game/UI/WBP/Common/FilterSort/WBP_Com_SiftSelection.WBP_Com_SiftSelection")
  self.WBox_Selection:AddChild(SelectionUI)
  SelectionUI:Init(self, index, name, iconPath)
end

function M:UpdateSelectionState()
  if self.isSelectedAll then
    self:PlayAnimation(self.Click)
    self.disableInteraction = true
  else
    self:PlayAnimation(self.Normal)
    self.disableInteraction = false
  end
end

function M:OnBtnSelectAllClicked()
  local isChecked = true
  if self.isSelectedAll then
    isChecked = false
  end
  self.isSelectedAll = not self.isSelectedAll
  local children = self.WBox_Selection:GetAllChildren()
  local numChildren = children:Num()
  for i = 1, numChildren do
    local child = children:Get(i)
    if child and child.CheckBox_Selection and child.CheckBox_Selection:IsChecked() ~= isChecked then
      child.CheckBox_Selection:SetIsChecked(isChecked, false)
      child:OnItemSelectionChanged()
    end
  end
  self:PlayCheckSound(isChecked)
  self:UpdateSelectionState()
end

function M:OnSelectionItemChanged(CheckState, selectionUI)
  if CheckState then
    self.Owner:AddSelection(self, selectionUI.Index, selectionUI.Name)
  else
    self.Owner:RemoveSelection(self, selectionUI.Index)
  end
  local allSelected = true
  local children = self.WBox_Selection:GetAllChildren()
  local numChildren = children:Num()
  for i = 1, numChildren do
    local child = children:Get(i)
    if child and child.CheckBox_Selection and not child.CheckBox_Selection:IsChecked() then
      allSelected = false
      break
    end
  end
  if self.isSelectedAll ~= allSelected then
    self.isSelectedAll = allSelected
    self:UpdateSelectionState()
  end
end

function M:OnBtnSelectAllHovered()
  if self.disableInteraction then
    return
  end
  self:PlayAnimation(self.Hover)
end

function M:OnBtnSelectAllUnhovered()
  if self.disableInteraction then
    return
  end
  self:PlayAnimation(self.Unhover)
end

function M:OnBtnSelectAllPressed()
  if self.disableInteraction then
    return
  end
  self:PlayAnimation(self.Press)
end

function M:PlayCheckSound(IsChecked)
  if IsChecked then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_checkbox_check", nil, nil)
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_checkbox_uncheck", nil, nil)
  end
end

function M:Destruct()
  self.Btn_SelectAll.OnClicked:Remove(self, self.OnBtnSelectAllClicked)
  self.Btn_SelectAll.OnHovered:Remove(self, self.OnBtnSelectAllHovered)
  self.Btn_SelectAll.OnUnhovered:Remove(self, self.OnBtnSelectAllUnhovered)
  self.Btn_SelectAll.OnPressed:Remove(self, self.OnBtnSelectAllPressed)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self:InitNavigationRules()
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnAddedToFocusPath(InFocusEvent)
  if self.CurInputDevice == ECommonInputType.Gamepad then
    self.Key_Controller:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  if self.CurInputDevice == ECommonInputType.Gamepad then
    self.Key_Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  local ActiveWidgetIndex = IsUseKeyAndMouse and 0 or 1
  if IsUseKeyAndMouse then
    self.Key_Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
  end
  self.CurInputDevice = CurInputDevice
end

function M:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:SetFirstCheckBoxFocusTarget()
  local firstCheckBox = self.WBox_Selection:GetChildAt(0)
  if firstCheckBox then
    return firstCheckBox
  end
end

function M:SetLastCheckBoxFocusTarget()
  local lastCheckBox = self.WBox_Selection:GetChildAt(self.WBox_Selection:GetChildrenCount() - 1)
  if lastCheckBox then
    return lastCheckBox
  end
end

function M:InitNavigationRules()
  self.Btn_SelectAll:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    self.SetFirstCheckBoxFocusTarget
  })
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and "Gamepad_LeftThumbstick" == InKeyName then
    IsEventHandled = true
    self:OnBtnSelectAllClicked()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:SetGamepadKey(FocusKeyName)
  self.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
end

function M:GetNextWrapBox()
  local nextSiftItemIdx = self.Owner.List_Selection:GetChildIndex(self) + 1
  if nextSiftItemIdx < self.Owner.List_Selection:GetChildrenCount() then
    local nextSiftItem = self.Owner.List_Selection:GetChildAt(nextSiftItemIdx)
    return nextSiftItem.WBox_Selection
  end
  return nil
end

function M:GetPrevWrapBox()
  local prevSiftItemIdx = self.Owner.List_Selection:GetChildIndex(self) - 1
  if prevSiftItemIdx >= 0 then
    local prevSiftItem = self.Owner.List_Selection:GetChildAt(prevSiftItemIdx)
    return prevSiftItem.WBox_Selection
  end
  return nil
end

return M
