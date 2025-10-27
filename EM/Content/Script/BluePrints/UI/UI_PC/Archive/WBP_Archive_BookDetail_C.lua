require("UnLua")
local WBP_Archive_BookDetail_C = Class({
  "BluePrints.UI.BP_UIState_C"
})

function WBP_Archive_BookDetail_C:Construct()
  self.Super.Construct(self)
  self.Panel_Content:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Btn_Close:Init("Close", self, self.Close)
  self.List_Tab.BP_OnItemSelectionChanged:Add(self, self.OnSelectItemChanged)
  self.SelectFirstTime = false
  self.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self:InitListenEvent()
  self:InitWidgetInfoInGamePad()
end

function WBP_Archive_BookDetail_C:Destruct()
  self.Super.Destruct(self)
  self:ClearListenEvent()
end

function WBP_Archive_BookDetail_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.Type, self.BookSeriesId, self.ResourceIdTab = ...
  AudioManager(self):PlayUISound(self, "event:/ui/common/reading_hud", "ArchiveBookDetailOpenSound", nil)
  self:Init()
end

function WBP_Archive_BookDetail_C:Close()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  AudioManager(self):SetEventSoundParam(self, "ArchiveBookDetailOpenSound", {ToEnd = 1})
  self.Super.Close(self)
end

function WBP_Archive_BookDetail_C:Init()
  self:InitListTab()
end

function WBP_Archive_BookDetail_C:InitListTab()
  self.List_Tab:ClearListItems()
  local ClassPath = "/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C"
  local ArchiveList = {}
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    ArchiveList = Avatar.Archives[self.Type].ArchiveList
  end
  local SelectIndex
  for Index, Id in ipairs(self.ResourceIdTab) do
    local Obj = NewObject(UE4.LoadClass(ClassPath))
    Obj.Root = self
    Obj.Index = Index
    Obj.Id = Id
    Obj.Unlock = false
    if ArchiveList[Id] then
      Obj.Unlock = true
      if not SelectIndex or Index < SelectIndex then
        SelectIndex = Index
      end
    end
    self.List_Tab:AddItem(Obj)
  end
  if SelectIndex then
    self:AddTimer(0.01, function()
      self.List_Tab:ScrollIndexIntoView(SelectIndex - 1)
      self:AddTimer(0.01, function()
        local Item = self.List_Tab:GetItemAt(SelectIndex - 1)
        Item.Entry:OnCellClicked()
      end, false, 0, "RealSelectBookTab", true)
    end, false, 0, "SelectBookTab", true)
  end
end

function WBP_Archive_BookDetail_C:RefreshBookDetailInfo(Item)
  if self.SelectedContent then
    self.SelectedContent.Entry:UnSelected()
  end
  self.SelectedContent = Item.Content
  self.SelectedContent.Entry:Selected()
  self.List_Tab:BP_NavigateToItem(Item.Content)
  self:RealRefreshBookDetailInfo(self.SelectedContent.Id)
end

function WBP_Archive_BookDetail_C:RealRefreshBookDetailInfo(Id)
  self.Panel_Content:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Text_Title:SetText(GText(DataMgr.Resource[Id].ResourceName))
  self.Text_Content:SetText(GText(DataMgr.Resource[Id].IpDes))
  self.EMScrollBox_104:ScrollToStart()
  self:AddDelayFrameFunc(function()
    if UIUtils.CheckScrollBoxCanScroll(self.EMScrollBox_104) then
      self.Key_01:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Key_01:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end, 2)
  self:PlayAnimation(self.Refresh)
end

function WBP_Archive_BookDetail_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_FaceButton_Right" == InKeyName then
      IsEventHandled = true
      self:OnReturnKeyDown()
    end
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    self:OnReturnKeyDown()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Archive_BookDetail_C:OnReturnKeyDown()
  self:Close()
end

function WBP_Archive_BookDetail_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Archive_BookDetail_C:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Archive_BookDetail_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
end

function WBP_Archive_BookDetail_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self:InitKeyboardView()
  else
    self:InitGamepadView()
  end
end

function WBP_Archive_BookDetail_C:InitGamepadView()
  self.Controller:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if self.SelectedContent then
    self.List_Tab:BP_NavigateToItem(self.SelectedContent)
  end
end

function WBP_Archive_BookDetail_C:InitKeyboardView()
  self.Controller:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Archive_BookDetail_C:InitWidgetInfoInGamePad()
  self.Key_01:CreateCommonKey({
    KeyInfoList = {
      {ImgShortPath = "RV", Type = "Img"}
    },
    Desc = GText("UI_CTL_Rougelike_SlideItems")
  })
  self.Key_02:CreateCommonKey({
    KeyInfoList = {
      {ImgShortPath = "B", Type = "Img"}
    },
    Desc = GText("UI_Controller_Close")
  })
end

function WBP_Archive_BookDetail_C:OnSelectItemChanged(SelectItem)
  if not SelectItem then
    return
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:ClickListItemWhenSelectItemChanged(SelectItem)
  end
end

function WBP_Archive_BookDetail_C:ClickListItemWhenSelectItemChanged(Content)
  Content.Entry:OnCellClicked()
end

function WBP_Archive_BookDetail_C:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightY" == InKeyName then
    local a = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 10
    local CurScrollOffset = self.EMScrollBox_104:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - a, 0, self.EMScrollBox_104:GetScrollOffsetOfEnd())
    self.EMScrollBox_104:SetScrollOffset(ScrollOffset)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function WBP_Archive_BookDetail_C:TrySetFocusFirstTime(Entry)
  if not self.SelectFirstTime then
    self.SelectFirstTime = true
    Entry:SetFocus()
  end
end

return WBP_Archive_BookDetail_C
