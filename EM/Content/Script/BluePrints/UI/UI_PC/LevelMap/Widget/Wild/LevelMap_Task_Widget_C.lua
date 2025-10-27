require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Construct()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType())
  self.Key_TitleRewards:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
end

function M:Destruct()
  self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
end

function M:Init(MainMap)
  self.MainMap = MainMap
  self.Key_Tip = MainMap.Key_Tip
  self:InitCommonWidget()
  self.ScrollBox_TaskDetail:ScrollToStart()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local KeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if KeyName == UIConst.GamePadKey.LeftThumb then
    local Visible = self.Key_TitleRewards:GetVisibility()
    if Visible == UE4.ESlateVisibility.Collapsed then
      self:ShowGamepadRewardKey(true)
      self:TileViewQuit()
      self:SetWatchTaskContentGamePadKeys()
      self.Btn_Track:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Btn_Cancel_Track:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    elseif Visible == UE4.ESlateVisibility.Visible then
      self:ShowGamepadRewardKey(false)
      self:TileViewSelectFirst()
      self.Key_Tip:UpdateKeyInfo(self.SelectTaskRewardGamePadKeys)
      self.Btn_Track:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
      self.Btn_Cancel_Track:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    end
    return UWidgetBlueprintLibrary.Handled()
  elseif KeyName == UIConst.GamePadKey.FaceButtonRight and (self.TileView_Rewards:HasAnyUserFocus() or self.TileView_Rewards:HasFocusedDescendants()) then
    self:ShowGamepadRewardKey(true)
    self:TileViewQuit()
    self:SetWatchTaskContentGamePadKeys()
    return UWidgetBlueprintLibrary.Handled()
  end
  return UWidgetBlueprintLibrary.UnHandled()
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    local Visible = self.Key_TitleRewards:GetVisibility()
    if Visible == UE4.ESlateVisibility.Visible then
      if 1 == self.Switch_Button:GetActiveWidgetIndex() then
        self:OnSpecialSideTaskGuidePointTrackClick()
      elseif 3 == self.Switch_Button:GetActiveWidgetIndex() then
        self:OnSpecialSideTaskGuidePointUnTrackClick()
      end
    end
    IsHandled = true
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    if self.TileView_Rewards:HasAnyUserFocus() then
      self.Key_Tip:UpdateKeyInfo(self.SelectTaskRewardGamePadKeys)
      self:ShowGamepadRewardKey(false)
    elseif self.TileView_Rewards:HasFocusedDescendants() then
      self.Key_Tip:UpdateKeyInfo({})
      self:ShowGamepadRewardKey(false)
    else
      self:SetWatchTaskContentGamePadKeys()
      self:ShowGamepadRewardKey(true)
    end
  else
    self:ShowGamepadRewardKey(false)
    if self.Key_Tip then
      self.Key_Tip:UpdateKeyInfo(self.BackKey)
    end
  end
end

function M:OnShow()
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:SetWatchTaskContentGamePadKeys()
    self:ShowGamepadRewardKey(true)
  end
end

function M:OnSpecialSideTaskGuidePointTrackClick()
  local LevelMap = UIManager(self):GetUI("LevelMapMain")
  if LevelMap and LevelMap.RealWildMap then
    LevelMap.RealWildMap:OnSpecialSideTaskGuidePointTrackClick()
  end
end

function M:OnSpecialSideTaskGuidePointUnTrackClick()
  local LevelMap = UIManager(self):GetUI("LevelMapMain")
  if LevelMap and LevelMap.RealWildMap then
    LevelMap.RealWildMap:OnSpecialSideTaskGuidePointUnTrackClick()
  end
end

function M:OnHide()
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self.Key_Tip:UpdateKeyInfo(self.MainMap.WildMapGamePadEnsureKeys)
  end
end

function M:OnRewardItemMenuAnchorChanged(bIsOpen)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    if bIsOpen then
      self.Key_Tip:UpdateKeyInfo({})
    else
      self.Key_Tip:UpdateKeyInfo(self.SelectTaskRewardGamePadKeys)
    end
  end
end

function M:SetWatchTaskContentGamePadKeys()
  if not self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    return
  end
  local ContentHeight = self.ScrollBox_TaskDetail:GetDesiredSize().Y
  local VisibleHeight = USlateBlueprintLibrary.GetLocalSize(self.ScrollBox_TaskDetail:GetTickSpaceGeometry()).Y
  if 0 == VisibleHeight then
    self:AddTimer(0.001, self.SetWatchTaskContentGamePadKeys, false, 0, "WBP_Map_Task", true)
    return
  end
  if ContentHeight - VisibleHeight > 0.001 then
    self.Key_Tip:UpdateKeyInfo(self.WatchTaskContentGamePadKeys)
  else
    self.Key_Tip:UpdateKeyInfo(self.BackGamePadKey)
  end
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
  if InKeyName == UIConst.GamePadKey.RightAnalogY then
    local CurScrollOffset = self.ScrollBox_TaskDetail:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.ScrollBox_TaskDetail:GetScrollOffsetOfEnd())
    self.ScrollBox_TaskDetail:SetScrollOffset(ScrollOffset)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:TileViewSelectFirst()
  local Items = self.TileView_Rewards:GetListItems()
  if Items and Items:Num() > 0 then
    self.TileView_Rewards:SetFocus()
    self.TileView_Rewards:SetSelectedIndex(0)
    self.TileView_Rewards:NavigateToIndex(0)
  end
end

function M:TileViewQuit()
  self:SetFocus()
end

function M:ShowGamepadRewardKey(flag)
  if flag then
    self.Key_TitleRewards:SetVisibility(UE4.ESlateVisibility.Visible)
    self.ScrollBox_TaskDetail:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Key_TitleRewards:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.ScrollBox_TaskDetail:SetVisibility(UE4.ESlateVisibility.Visible)
  end
end

function M:InitCommonWidget()
  self.WatchTaskContentGamePadKeys = {
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RV"}
      },
      Desc = GText("UI_Controller_Slide")
    },
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
  }
  self.BackKey = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          Owner = self.MainMap,
          ClickCallback = self.MainMap.OnUIReturnKeyDown
        }
      },
      Desc = GText("UI_BACK")
    }
  }
  self.BackGamePadKey = {
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
  }
  self.SelectTaskRewardGamePadKeys = {
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Controller_CheckDetails")
    },
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
  }
end

return M
