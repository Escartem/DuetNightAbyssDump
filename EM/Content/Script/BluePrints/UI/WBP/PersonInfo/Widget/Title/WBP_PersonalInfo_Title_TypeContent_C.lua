require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Initialize(Initializer)
  self.SelectedItem = nil
  self.EquippedItem = nil
end

function M:Construct()
  self.List_Title.BP_OnItemClicked:Add(self, self.OnItemClicked)
end

function M:InitBaseView()
  local Avatar = GWorld:GetAvatar()
  local TitleFramesData = Avatar.TitleFrames
  local CurrentFrameID = Avatar.TitleFrame
  local TitleFramesContents = {}
  for index, value in pairs(TitleFramesData) do
    local SingleFrame = NewObject(UIUtils.GetCommonItemContentClass())
    SingleFrame.FrameId = index
    if CurrentFrameID == SingleFrame.FrameId and self.SelectedItem == nil then
      SingleFrame.bSelect = true
      SingleFrame.bEquipped = true
      self.SelectedItem = SingleFrame
      self.EquippedItem = SingleFrame
    end
    SingleFrame.Father = self
    table.insert(TitleFramesContents, SingleFrame)
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("TitleFrame")
    if CacheDetail and CacheDetail[SingleFrame.FrameId] then
      SingleFrame.IsNew = true
    else
      SingleFrame.IsNew = false
    end
    SingleFrame.FocusEvent = self.OnFocusFrame
    SingleFrame.FocusEventObj = self
    self.List_Title:AddItem(SingleFrame)
  end
  self.List_Title.OnCreateEmptyContent:Bind(self, function(self)
    return NewObject(UIUtils.GetCommonItemContentClass())
  end)
  self.List_Title:RequestFillEmptyContent()
end

function M:ResetEquipFrame()
  self:OnItemClicked(self.EquippedItem)
  if self.EquippedItem and self.EquippedItem.UI then
    self.EquippedItem.UI:PlayAnimation(self.EquippedItem.UI.Click)
    if not self.EquippedItem.UI.Btn_Area:IsChecked() then
      self.EquippedItem.UI.Btn_Area:SetChecked(true)
    end
  end
end

function M:OnItemClicked(Content)
  AudioManager(self):PlayUISound(self, "event:/ui/common/special_content_01_click", nil, nil)
  if self.SelectedItem == Content then
    return
  end
  if self.SelectedItem and self.SelectedItem.UI then
    self.SelectedItem.UI:SetIsSelected(false)
  end
  self.SelectedItem = Content
  Content.UI:SetIsSelected(true)
  self:OnClickTitleFrame(Content.FrameId)
end

function M:OnClickTitleFrame(TitleFrameID)
  self.FatherPage:OnTietleStyleChange(TitleFrameID)
end

function M:OnFocusFrame(Content, Widget)
  if self.IsGamePad then
    self:OnItemClicked(Content)
    Widget:PlayAnimation(Widget.Click)
    if not Widget.Btn_Area:IsChecked() then
      Widget.Btn_Area:SetChecked(true)
    end
    return
  end
end

function M:InitGamepadView()
  self.IsGamePad = true
  local FocusItem = self.SelectedItem
  self:AddTimer(0.1, function()
    local FocusItem = self.SelectedItem
    if FocusItem and FocusItem.UI then
      FocusItem.UI:SetFocus()
      self.List_Title:BP_SetItemSelection(FocusItem)
    end
  end, nil, nil, nil, true)
end

function M:InitKeyboardView()
  self.IsGamePad = false
end

function M:EquipSelectedTitleFrame()
  if self.EquippedItem == self.SelectedItem then
    return
  end
  if self.EquippedItem and self.EquippedItem.UI then
    self.EquippedItem.UI:SetIsEquipped(false)
  end
  self.EquippedItem = self.SelectedItem
  if self.EquippedItem.UI then
    self.EquippedItem.UI:SetIsEquipped(true)
  else
    ScreenPrint("EquipSelectedTitleFrame: " .. "\230\137\190\228\184\141\229\136\176Item\229\175\185\229\186\148\231\154\132UI")
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.FaceButtonBottom and self.FatherPage:IsCanChangeTitle() then
    self.FatherPage:OnComfirmBtnClick()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    self.IsGamePad = true
    IsEventHandled = self:OnGamePadDown(InKeyName)
  else
  end
  IsEventHandled = false
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

return M
