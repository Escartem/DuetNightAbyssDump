require("UnLua")
local WikiController = require("BluePrints.UI.WBP.Wiki.WikiController")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Construct()
  self.List_Box:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.ListBox_Parent.Button_Area.OnClicked:Add(self, self.OnItemClicked)
  self.IsExpanded = false
  self:InitListenEvent()
  self:RefreshBaseInfo()
  self.ReddotName = DataMgr.ReddotNode.WikiEntrance.Name
  WikiController:GetModel():AddNewStateListener(self, function(subTypeId, tabId)
    if self.SubTypeId == subTypeId then
      if WikiController:GetModel():IsSubTypeNew(self.SubTypeId) then
        self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
  end)
end

function M:OnItemClicked(bNotPlaySound)
  self.IsExpanded = not self.IsExpanded
  self:ToggleFold(self.IsExpanded)
  if not bNotPlaySound then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  end
end

function M:ToggleFold(bExpand)
  if bExpand then
    self.List_Box:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.ListBox_Parent.IsFold = true
    self.ListBox_Parent:OnCellClicked()
  else
    self.List_Box:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.ListBox_Parent.IsFold = false
    self.ListBox_Parent:OnCellClicked()
    self.ListBox_Parent:OnCellReleased()
  end
  self:_StopExpandDelayTimer()
  self.ExpandDelayTimer = self:AddTimer(0.05, function()
    self.Owner:RefreshList_Catalogue()
  end, false, 0, nil, true)
end

function M:_StopExpandDelayTimer()
  if self:IsExistTimer(self.ExpandDelayTimer) then
    self:RemoveTimer(self.ExpandDelayTimer)
    self.ExpandDelayTimer = nil
  end
end

function M:OnListItemObjectSet(InObject)
  self:_StopExpandDelayTimer()
  self.Text_Name:SetText(GText(InObject.SubTypeText))
  self.Index = InObject.Index
  self.Owner = InObject.Owner
  self.SubTypeId = InObject.SubTypeId
  self.Entries = InObject.Entries
  self.IsSearchMode = InObject.IsSearchMode
  self.Content = InObject
  if WikiController:GetModel():IsSubTypeNew(self.SubTypeId) then
    self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:ClearItemState()
  if self.IsSearchMode then
    self:ToggleFold(self.IsSearchMode)
  end
  self:UpdateEntryList()
end

function M:ClearItemState()
  if self.IsExpanded then
    self:ToggleFold(false)
    self.ListBox_Parent:OnCellReleased()
    self.IsExpanded = false
  end
end

function M:UpdateEntryStyle()
  self.Owner:UpdateEntryWidgetSelectedStyle(self)
end

function M:UpdateEntryList()
  if not self.List_Box then
    return
  end
  if not self.Entries or CommonUtils.Size(self.Entries) <= 0 then
    self.List_Box:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  self.List_Box:ClearChildren()
  local sortedEntries = WikiController:GetModel():SortAndFilterEntries(self.Entries)
  for index, entryPair in ipairs(sortedEntries) do
    local entryData = entryPair.entryData
    local entryItem = self:CreateEntryItem(entryData.entryId, entryData)
    local EntryWidget = UIManager(self):CreateWidget("/Game/UI/WBP/Encyclopedia/Widget/WBP_Encyclopedia_List01.WBP_Encyclopedia_List01")
    self.List_Box:AddChild(EntryWidget)
    EntryWidget:OnListItemObjectSet(entryItem)
    EntryWidget.Index = index - 1
  end
end

function M:CreateEntryItem(entryId, entryData)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.EntryId = entryId
  Obj.EntryTitle = entryData.EntryTitle
  Obj.OriginalTitle = entryData.OriginalTitle
  Obj.Parent = self
  return Obj
end

function M:GetEntryIndex(entryId)
  for index, Entry in ipairs(self.List_Box:GetAllChildren()) do
    if Entry.EntryId == entryId then
      return index - 1
    end
  end
  return nil
end

function M:Destruct()
  self:_StopExpandDelayTimer()
  self.ListBox_Parent.Button_Area.OnClicked:Remove(self, self.OnItemClicked)
  WikiController:GetModel():RemoveNewStateListener(self)
end

function M:_OnWikiEntryTextReaded(TextId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:WikiEntryTextReaded(self.EntryId, TextId)
  end
end

function M:InitListenEvent()
  local PlayerController = self:GetOwningPlayer()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshBaseInfo()
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurGamepadName = CurGamepadName
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  local ActiveWidgetIndex = IsUseKeyAndMouse and 0 or 1
  if IsUseKeyAndMouse then
  else
  end
  self.CurInputDevice = CurInputDevice
end

function M:OnAddedToFocusPath(InFocusEvent)
  if self.CurInputDevice == ECommonInputType.Gamepad then
    local ListBoxItem = self.List_Box:GetChildAt(0)
    ListBoxItem:OnCellClicked(true)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  self.Owner.CatalogueScroll:ScrollWidgetIntoView(self, true, UE4.EDescendantScrollDestination.IntoView)
  if CommonUtils.GetDeviceTypeByPlatformName() ~= "Mobile" then
    self.Owner.Com_Tab:UpdateBottomKeyInfo({
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    })
  end
  self.ListBox_Parent:SetFocus()
  self:InitNavigationRules()
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:InitNavigationRules()
  self:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    self.SetDownTarget
  })
  self:SetNavigationRuleCustom(EUINavigation.Up, {
    self,
    self.SetUpTarget
  })
end

function M:SetDownTarget()
  if self.List_Box:GetVisibility() == UIConst.VisibilityOp.SelfHitTestInvisible and self.List_Box:GetChildrenCount() > 0 then
    return self.List_Box:GetChildAt(0)
  else
    return self:GetNextListCatalogueItem()
  end
end

function M:SetUpTarget()
  local ListBoxItem = self:GetPreListCatalogueItem()
  if not ListBoxItem then
    return nil
  end
  if ListBoxItem.List_Box:GetVisibility() == UIConst.VisibilityOp.SelfHitTestInvisible and ListBoxItem.List_Box:GetChildrenCount() > 0 then
    return ListBoxItem.List_Box:GetChildAt(ListBoxItem.List_Box:GetChildrenCount() - 1)
  else
    return ListBoxItem
  end
end

function M:GetNextListCatalogueItem()
  if self.Owner and self.Owner.List_Catalogue then
    local nextItem = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.Owner.List_Catalogue, self.Index + 1)
    return nextItem
  end
  return nil
end

function M:GetPreListCatalogueItem()
  if self.Owner and self.Owner.List_Catalogue then
    local Item = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.Owner.List_Catalogue, self.Index - 1)
    return Item
  end
  return nil
end

function M:GetSelfListCatalogueItem()
  if self.Owner and self.Owner.List_Catalogue then
    local Item = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.Owner.List_Catalogue, self.Index)
    return Item
  end
  return nil
end

return M
