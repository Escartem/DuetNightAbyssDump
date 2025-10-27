require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(OwnerItemUI, index, name, iconPath)
  self.OwnerItemUI = OwnerItemUI
  self.Index = index
  self.Name = name
  self.Text_Selection:SetText(GText(name))
  self:SetImage(iconPath)
  self:RefreshBaseInfo()
  self:InitListenEvent()
end

function M:Construct()
  self.ITEMS_PER_ROW = 3
  self.CheckBox_Selection.Btn_Click.OnClicked:Add(self, self.OnItemSelectionChanged)
end

function M:Destruct()
  self.CheckBox_Selection.Btn_Click.OnClicked:Remove(self, self.OnItemSelectionChanged)
end

function M:OnItemSelectionChanged()
  local CheckState = self.CheckBox_Selection:IsChecked()
  self.OwnerItemUI:OnSelectionItemChanged(CheckState, self)
  if CheckState then
    self:PlayAnimation(self.Click)
  else
    self:PlayAnimation(self.Normal)
  end
  return CheckState
end

function M:SetImage(iconPath)
  if not iconPath then
    return
  end
  self.Icon:SetVisibility(UIConst.VisibilityOp.Visible)
  local IconObject = LoadObject(iconPath)
  self.Icon:SetBrushResourceObject(IconObject)
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.CheckBox_Selection.Btn_Click:SetFocus()
  self.CheckBox_Selection:PlayAnimation(self.CheckBox_Selection.Normal)
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnAddedToFocusPath(InFocusEvent)
  if self.CurrentInputDevice == ECommonInputType.Gamepad then
    self.OwnerItemUI.Owner.List_Selection:ScrollWidgetIntoView(self, true, UE4.EDescendantScrollDestination.IntoView)
  end
end

function M:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
  else
    self.CheckBox_Selection.Group_BG:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:InitNavigationRules()
  end
  self.CurrentInputDevice = CurInputDevice
end

function M:InitNavigationRules()
  self:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    self.SetWBoxDownTarget
  })
  self:SetNavigationRuleCustom(EUINavigation.Up, {
    self,
    self.SetWBoxUpTarget
  })
end

function M:SetWBoxDownTarget()
  local parentWBox = self:GetParent()
  if not parentWBox then
    return nil
  end
  local totalChildren = parentWBox:GetChildrenCount()
  local nextRowIndex = self.Index - 1 + self.ITEMS_PER_ROW
  if totalChildren > nextRowIndex then
    local nextItem = parentWBox:GetChildAt(nextRowIndex)
    return nextItem
  end
  local currentCol = (self.Index - 1) % self.ITEMS_PER_ROW
  local currentRow = math.floor((self.Index - 1) / self.ITEMS_PER_ROW)
  local lastRowStartIndex = currentRow * self.ITEMS_PER_ROW + self.ITEMS_PER_ROW
  if totalChildren > lastRowStartIndex then
    local targetIndex = math.min(lastRowStartIndex + currentCol, totalChildren - 1)
    while lastRowStartIndex <= targetIndex and currentCol > 0 and totalChildren <= targetIndex do
      currentCol = currentCol - 1
      targetIndex = lastRowStartIndex + currentCol
    end
    if targetIndex >= 0 and totalChildren > targetIndex then
      return parentWBox:GetChildAt(targetIndex)
    end
  end
  local nextWBox = self.OwnerItemUI:GetNextWrapBox()
  if nextWBox then
    if nextWBox:GetChildrenCount() > 0 then
      local currentCol = (self.Index - 1) % self.ITEMS_PER_ROW
      local targetIndex = currentCol
      if targetIndex < nextWBox:GetChildrenCount() then
        local nextItem = nextWBox:GetChildAt(targetIndex)
        return nextItem
      else
        local nextItem = nextWBox:GetChildAt(0)
        return nextItem
      end
    end
    return nextWBox
  end
  return nil
end

function M:SetWBoxUpTarget()
  local parentWBox = self:GetParent()
  if not parentWBox then
    return nil
  end
  local prevRowIndex = self.Index - 1 - self.ITEMS_PER_ROW
  if prevRowIndex >= 0 then
    local prevItem = parentWBox:GetChildAt(prevRowIndex)
    return prevItem
  end
  local prevWBox = self.OwnerItemUI:GetPrevWrapBox()
  if prevWBox then
    local prevWBoxChildCount = prevWBox:GetChildrenCount()
    if prevWBoxChildCount > 0 then
      local currentCol = (self.Index - 1) % self.ITEMS_PER_ROW
      local lastRowStartIndex = prevWBoxChildCount - prevWBoxChildCount % self.ITEMS_PER_ROW
      if lastRowStartIndex == prevWBoxChildCount then
        lastRowStartIndex = prevWBoxChildCount - self.ITEMS_PER_ROW
      end
      local targetIndex = lastRowStartIndex + currentCol
      while lastRowStartIndex <= targetIndex and prevWBoxChildCount <= targetIndex do
        targetIndex = targetIndex - 1
      end
      if targetIndex >= 0 and prevWBoxChildCount > targetIndex then
        local prevItem = prevWBox:GetChildAt(targetIndex)
        return prevItem
      end
    end
    return prevWBox
  end
  return nil
end

return M
