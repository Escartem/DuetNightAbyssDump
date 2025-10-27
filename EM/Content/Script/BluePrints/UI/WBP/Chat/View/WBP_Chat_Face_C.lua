require("UnLua")
local ChatModel = ChatController:GetModel()
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.OriginHeight = self.List_Item:GetEntryHeight()
  self.OriginWidth = self.List_Item:GetEntryWidth()
  self.bEmoji = false
end

function M:Destruct()
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
    if IsValid(GameInputModeSubsystem) then
      GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
    end
  end
end

function M:Open(Owner, ViewName)
  self:PlayAnimation(self.In)
  self.Owner = Owner
  self.ViewName = ViewName
  self.List_Tab:ClearListItems()
  local Index = 0
  for GroupId, Data in pairs(DataMgr.EmojiGroup) do
    if not ChatModel:HasEmojiGroup(GroupId) then
    else
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.bSelected = GroupId == ChatCommon.EmojiGroupId
      Content.Data = Data
      Content.Owner = self
      Content.Index = Index
      Index = Index + 1
      self.List_Tab:AddItem(Content)
    end
  end
  self:UpdateWidth()
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    self.Key_FaceTabLeft:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "LT",
          Owner = self
        }
      }
    })
    self.Key_FaceTabRight:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "RT",
          Owner = self
        }
      }
    })
    local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
    if IsValid(GameInputModeSubsystem) then
      GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
      self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
      self:UpdateUIStyleInPlatform()
    end
  end
end

function M:UpdateWidth()
  self.Root:SetWidthOverride(self.Owner:GetWidthOverrideForInput())
end

function M:OnListTabSelected(TabContent)
  if self.CurrSelectContent and IsValid(self.CurrSelectContent.UI) then
    self.CurrSelectContent.UI:SetSelected(false)
  end
  self.CurrSelectContent = TabContent
  self.bEmoji = self.CurrSelectContent.Data.GroupId == ChatCommon.EmojiGroupId
  self.List_Item:ClearListItems()
  local Emojis = DataMgr.ChatEmoji[TabContent.Data.GroupId]
  if TabContent.Data.GroupId == ChatCommon.EmojiGroupId then
    self.List_Item:SetEntryHeight(self.OriginHeight * self.Factor)
    self.List_Item:SetEntryWidth(self.OriginWidth * self.Factor)
  else
    self.List_Item:SetEntryHeight(self.OriginHeight)
    self.List_Item:SetEntryWidth(self.OriginWidth)
  end
  for _, Data in pairs(Emojis) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Data = Data
    Content.Owner = self
    self.List_Item:AddItem(Content)
  end
  self.List_Item:NavigateToIndex(0)
end

function M:OnListItemClicked(Content)
  self.Owner:ApplyEmoji(Content.Data)
  self:SetFocus()
end

function M:Close()
  self:PlayAnimation(self.Close)
  self.Owner:OnExtraPanelClose()
end

function M:SwitchNextTabGroup(AddIndex)
  if not self.CurrSelectContent then
    return
  end
  local NextIndex = self.CurrSelectContent.Index + AddIndex
  local Nums = self.List_Tab:GetNumItems()
  for i = 1, Nums do
    local Item = self.List_Tab:GetItemAt(i - 1)
    if Item and Item.Index == NextIndex then
      if Item.UI then
        Item.UI:SetSelected(true)
      end
      return
    end
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self:UpdateUIStyleInPlatform()
end

function M:UpdateUIStyleInPlatform()
  local IsGamepad = self.CurInputDeviceType == ECommonInputType.Gamepad
  local Visibility = IsGamepad and UIConst.VisibilityOp.Visible or UIConst.VisibilityOp.Collapsed
  self.Key_FaceTabLeft:SetVisibility(Visibility)
  self.Key_FaceTabRight:SetVisibility(Visibility)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  end
  return UWidgetBlueprintLibrary.UnHandled()
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == Const.GamepadLeftTrigger then
    IsEventHandled = true
    self:SwitchNextTabGroup(-1)
  elseif InKeyName == Const.GamepadRightTrigger then
    IsEventHandled = true
    self:SwitchNextTabGroup(1)
  elseif InKeyName == Const.GamepadFaceButtonRight then
    IsEventHandled = true
    self.Owner.Com_Input:FocusInputField()
  end
  return IsEventHandled
end

return M
