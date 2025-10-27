require("UnLua")
local WBP_ModArchive_UpdateTips_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_ModArchive_UpdateTips_C:Construct()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
end

function WBP_ModArchive_UpdateTips_C:OnLoaded(...)
  self.Super:OnLoaded(...)
  self.ModShows, self.ModUnlocks, self.Owner = ...
  AudioManager(self):PlayUISound(self, "event:/ui/common/preset_team_panel_expand", "ModArchiveUpdateTips", nil)
  self:PlayAnimation(self.In)
  self:BindToAnimationFinished(self.In, {
    self,
    self.OnInFinished
  })
  self.IsIn = true
  self.Btn_AllClose.OnClicked:Add(self, self.OnClose)
  self.Text_Tip:SetText(GText("UI_TRAIN_CLOSE"))
  self.Text_Title:SetText(GText("UI_New_Content"))
  local KeyInfo = {
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
  self.Com_MidKeyTips:UpdateKeyInfo(KeyInfo)
  self:UpdateOnInputDeviceTypeChange()
  self:InitModUnlock()
  self:InitModShow()
end

function WBP_ModArchive_UpdateTips_C:InitModUnlock()
  if not self.ModUnlocks or #self.ModUnlocks <= 0 then
    self.Group_ModUnlock:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.Text_ModUnlock:SetText(GText("UI_ModGuideBook_Unlock_New"))
  self.List_ModUnlock:ClearListItems()
  for i = 1, #self.ModUnlocks do
    local ModInfo = DataMgr.Mod[self.ModUnlocks[i]]
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = self.ModUnlocks[i]
    Content.Rarity = ModInfo.Rarity
    Content.Icon = ModInfo.Icon
    Content.ItemName = ModInfo.Name
    Content.ItemType = "Mod"
    Content.IsShowDetails = true
    Content.UIName = self:GetUIConfigName()
    
    function Content.AfterInitCallback(Widget)
      Widget:BindEvents(self, {
        OnMenuOpenChanged = self.OnTipsOpenChanged
      })
    end
    
    self.List_ModUnlock:AddItem(Content)
  end
  self:AddDelayFrameFunc(function()
    self.List_ModUnlock:SetFocus()
  end, 4, "FocusUnlock")
end

function WBP_ModArchive_UpdateTips_C:InitModShow()
  if not self.ModShows or #self.ModShows <= 0 then
    self.Group_ModUnlockArchive:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.Text_ModUnlockArchive:SetText(GText("UI_ModGuideBook_Show_New"))
  self.List_ModUnlockArchive:ClearListItems()
  for i = 1, #self.ModShows do
    local ModInfo = DataMgr.Mod[self.ModShows[i]]
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = self.ModShows[i]
    Content.Rarity = ModInfo.Rarity
    Content.Icon = ModInfo.Icon
    Content.ItemName = ModInfo.Name
    Content.ItemType = "Mod"
    Content.IsShowDetails = true
    Content.UIName = self:GetUIConfigName()
    
    function Content.AfterInitCallback(Widget)
      Widget:BindEvents(self, {
        OnMenuOpenChanged = self.OnTipsOpenChanged
      })
    end
    
    self.List_ModUnlockArchive:AddItem(Content)
  end
  self:AddDelayFrameFunc(function()
    self.List_ModUnlockArchive:SetFocus()
  end, 3, "FocusShow")
end

function WBP_ModArchive_UpdateTips_C:OnInFinished()
  self.IsIn = false
end

function WBP_ModArchive_UpdateTips_C:OnClose()
  if self.IsClosing then
    return
  end
  if self.IsIn then
    return
  end
  self:UnbindFromAnimationFinished(self.Out, {
    self,
    self.RealOnClose
  })
  self:BindToAnimationFinished(self.Out, {
    self,
    self.RealOnClose
  })
  self:PlayAnimation(self.Out)
  self.IsClosing = true
  AudioManager(self):SetEventSoundParam(self, "ModArchiveUpdateTips", {ToEnd = 1})
  AudioManager(self):StopSound(self, "ModArchiveUpdateTips")
end

function WBP_ModArchive_UpdateTips_C:RealOnClose()
  if self.Owner then
    self.Owner:SetFocus()
    self.Owner:OnShowTipsClose()
  end
  self:Close()
end

function WBP_ModArchive_UpdateTips_C:OnTipsOpenChanged(bIsOpen)
  if self.CurInputDeviceType ~= ECommonInputType.GamePad then
    return
  end
  if bIsOpen then
    self.WS_Tips:SetVisibility(ESlateVisibility.Hidden)
    self.WS_Tips:SetVisibility(ESlateVisibility.Hidden)
  else
    self.WS_Tips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.WS_Tips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_ModArchive_UpdateTips_C:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
  else
    IsEventHandled = self:Handle_OnPCDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_ModArchive_UpdateTips_C:Handle_OnGamePadDown(InKeyName)
  DebugPrint("zwkkk  Handle_OnGamePadUp", InKeyName, self:GetName())
  if "Gamepad_FaceButton_Right" == InKeyName then
    if not self.IsClosing then
      self:OnClose()
    end
    return true
  end
  return false
end

function WBP_ModArchive_UpdateTips_C:Handle_OnPCDown(InKeyName)
  if "Escape" == InKeyName then
    if not self.IsClosing then
      self:OnClose()
    end
    return true
  end
  return false
end

function WBP_ModArchive_UpdateTips_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self:UpdateOnInputDeviceTypeChange()
end

function WBP_ModArchive_UpdateTips_C:UpdateOnInputDeviceTypeChange()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.WS_Tips:SetActiveWidgetIndex(1)
  elseif self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    self.WS_Tips:SetActiveWidgetIndex(0)
  end
end

return WBP_ModArchive_UpdateTips_C
