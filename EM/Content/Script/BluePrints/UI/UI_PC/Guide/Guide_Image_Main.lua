require("UnLua")
local Guide_Image_Main = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})
Guide_Image_Main._components = {
  "BluePrints.UI.WidgetComponent.ChangeTextToKeyInfoComponent"
}

function Guide_Image_Main:OnLoaded(...)
  self:ChangePlayerInputable(false)
  self.isPC = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.GuideTable = "UIGuide"
  self.ChildGuideTable = "UIChildGuide"
  self:Init_CloseShortCut()
  self:BindButtonLogics()
  self:AddDispatcher(EventID.CloseLoading, self, self.AfterLoadingClose)
  AudioManager(self):PlayUISound(self, "event:/snapshot/ui/filter_guider_window", "Guide_Image_Main", nil)
  self.IsDestroied = false
end

function Guide_Image_Main:Init_CloseShortCut()
  if not self.isPC then
    return
  end
  self.Key_Close:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = "Esc",
        ClickCallback = self.OnReturnKeyDown,
        Owner = self
      }
    },
    Desc = GText("UI_UIGUIDE_CLOSE"),
    bLongPress = false
  })
  self.Key_Close:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Key_Close_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_UIGUIDE_CLOSE"),
    bLongPress = false
  })
  self.Key_Close_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function Guide_Image_Main:BindButtonLogics()
  self.Button_Previous:BindEventOnClicked(self, self.SwitchToLeft)
  self.Button_Next:BindEventOnClicked(self, self.SwitchToRight)
  self.Button_Close:BindEventOnClicked(self, self.CloseButtonLogic)
end

function Guide_Image_Main:AfterLoadingClose()
  self:SetFocus(true)
  self:StopAllAnimations()
  AudioManager(self):PlayUISound(self, "event:/snapshot/ui/filter_guider_window", "Guide_Image_Main", nil)
  self:PlayAnimation(self.In)
end

function Guide_Image_Main:Destruct()
  AudioManager(self):SetEventSoundParam(self, "Guide_Image_Main", {ToEnd = 1})
  self.Super.Destruct(self)
  self.IsDestroied = true
end

function Guide_Image_Main:CloseButtonLogic()
  if self.IsClosing or not self.HasReachEnd then
    return
  end
  self.IsClosing = true
  self:PreClose()
end

function Guide_Image_Main:PreClose()
  self:BindToAnimationFinished(self.Out, {
    self,
    function()
      self:Close()
    end
  })
  self:PlayAnimation(self.Out)
end

function Guide_Image_Main:Close()
  AudioManager(self):SetEventSoundParam(self, "Guide_Image_Main", {ToEnd = 1})
  self:RemoveTimer("GuideMainRefreshInput")
  self:ChangePlayerInputable(true)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:HideAllUI(false, Const.GuideMainHideTag)
  self:FinishGuideBookCondition()
  self.Super.Close(self)
end

function Guide_Image_Main:RealClose()
  self.Super.RealClose(self)
  self.bIsShowing = false
  if self.OnGuideEnd:IsBound() then
    self.OnGuideEnd:Broadcast()
  end
end

function Guide_Image_Main:FinishGuideBookCondition()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    Avatar:GuideBookFinishSomething("CompleteUIGuideId", self.GuideId)
  end
end

function Guide_Image_Main:ChangePlayerInputable(IfAble)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  if not IfAble then
    self:SetInputUIOnly(true)
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
      local CenterPos = UE4.UWidgetLayoutLibrary.GetViewportSize(self)
      PlayerController:SetMouseLocation(math.floor(CenterPos.X / 2), math.floor(CenterPos.Y / 2))
    end
    self:SetFocus(true)
  else
    self:SetInputUIOnly(false)
  end
end

function Guide_Image_Main:GuideUIInit(UIKey, GuideId, Time, ExecuteLogic, IsTimeDilation, IsForceClick)
  self.bIsShowing = true
  self:InitInfo(GuideId)
end

function Guide_Image_Main:InitInfo(GuideId)
  if not DataMgr[self.GuideTable][GuideId] then
    print(_G.LogTag, "Error: GuideId is Wrong", GuideId)
    self:PreClose()
    return
  end
  self.GuideId = GuideId
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
  self:AddTimer(0.01, function()
    self:SetInputUIOnly(true)
  end, false, 0, "GuideMainRefreshInput", true)
  self:SetFocus(true)
  self.IsClosing = false
  self.HasReachEnd = false
  self.GuideMessageArray = DataMgr[self.GuideTable][GuideId].ChildGuideId
  self.StartPageIndex = 1
  self.CurrentPageIndex = 1
  self.EndPageIndex = #self.GuideMessageArray
  self.PageTurner:InitPageTurner(self.EndPageIndex, self, self.UpdateGuideInfo)
  self:InitButton()
  if self.StartPageIndex == self.EndPageIndex then
    self.WidgetSwitcher_Mode:SetActiveWidgetIndex(0)
  else
    self.WidgetSwitcher_Mode:SetActiveWidgetIndex(1)
    self.Button_Previous:ForbidBtn(true)
  end
  self:UpdateNumStep()
  self:UpdateUIVisibility()
  self:UpdateTextInfo(self.GuideMessageArray[self.CurrentPageIndex])
  self:UpdateUIByInputDevice()
end

function Guide_Image_Main:InitButton()
  if self.isPC then
    self.Key_L:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LT"}
      }
    })
    self.Key_R:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RT"}
      }
    })
  end
  self.Button_Previous:SetText(GText("UI_UIGUIDE_PREV"))
  self.Button_Next:SetText(GText("UI_UIGUIDE_NEXT"))
  self.Button_Close:SetText(GText("UI_UIGUIDE_CLOSE"))
  self.Button_Close:SetGamePadImg("B")
end

function Guide_Image_Main:UpdateGuideInfo(NewPageIndex)
  if self.CurrentPageIndex == NewPageIndex then
    return
  end
  if not self:CheckCanSwitchPage(NewPageIndex - self.CurrentPageIndex) then
    return
  end
  self.CurrentPageIndex = NewPageIndex
  self:UpdateUIVisibility()
  self:UpdateTextInfo(self.GuideMessageArray[self.CurrentPageIndex])
end

function Guide_Image_Main:UpdateNumStep()
  for i = 1, 4 do
    self["Guide_" .. i]:SetNumStep(i)
  end
end

function Guide_Image_Main:UpdateTextInfo(ChildGuideId)
  local TitleTextMapId = DataMgr[self.ChildGuideTable][ChildGuideId].GuideTitle
  self.Text_Title:SetText(GText(TitleTextMapId))
  local ChildGuideType = DataMgr[self.ChildGuideTable][ChildGuideId].GuideType
  for i = 1, 4 do
    if DataMgr[self.ChildGuideTable][ChildGuideId]["GuideInfo" .. i] then
      self["Guide_" .. i]:SetGuideType(ChildGuideType)
      self["Guide_" .. i]:UpdateContent(ChildGuideId, i, self.isPC)
      self["Guide_" .. i]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self["Guide_" .. i]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  self:AddDelayFrameFunc(function()
    self:UpdateScrollBoxTip()
  end, 3)
end

function Guide_Image_Main:CheckCanSwitchPage(Adjective)
  if self.IsClosing then
    return false
  end
  if self.CurrentPageIndex + Adjective < self.StartPageIndex or self.CurrentPageIndex + Adjective > self.EndPageIndex then
    return false
  end
  return true
end

function Guide_Image_Main:SwitchToLeft()
  if not self:CheckCanSwitchPage(-1) then
    return
  end
  self.PageTurner:PageLeft()
end

function Guide_Image_Main:SwitchToRight()
  if not self:CheckCanSwitchPage(1) then
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      return
    end
    self.Button_Close:OnBtnClicked()
    return
  end
  self.PageTurner:PageRight()
end

function Guide_Image_Main:UpdateUIVisibility()
  if self.CurrentPageIndex == self.EndPageIndex and not self.HasReachEnd then
    self.HasReachEnd = true
    self:UpdateKeyCloseVisiable()
  end
  if self.CurrentPageIndex == self.StartPageIndex then
    self.Button_Previous:ForbidBtn(true)
    if self.isPC then
      self.Key_L:SetForbidKey(true)
    end
  else
    self.Button_Previous:ForbidBtn(false)
    if self.isPC then
      self.Key_L:SetForbidKey(false)
    end
  end
  if self.CurrentPageIndex == self.EndPageIndex then
    self.Button_Next:SetText(GText("UI_UIGUIDE_CLOSE"))
    if self.isPC then
      self.Key_R:SetForbidKey(true)
    end
  else
    self.Button_Next:SetText(GText("UI_UIGUIDE_NEXT"))
    if self.isPC then
      self.Key_R:SetForbidKey(false)
    end
  end
end

function Guide_Image_Main:Handle_OnPCDown(InKeyName)
  if "Escape" == InKeyName then
    self.Button_Close:OnBtnClicked()
    return true
  end
  if "Right" == InKeyName then
    self:SwitchToRight()
    self.Button_Next:SoundFunc()
    return true
  end
  if "Left" == InKeyName then
    self:SwitchToLeft()
    self.Button_Previous:SoundFunc()
    return true
  end
  return false
end

function Guide_Image_Main:Handle_OnGamePadDown(InKeyName)
  if InKeyName == UIConst.GamePadKey.LeftTriggerThreshold then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click", nil, nil)
    self:SwitchToLeft()
    return true
  end
  if InKeyName == UIConst.GamePadKey.RightTriggerThreshold then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click", nil, nil)
    self:SwitchToRight()
    return true
  end
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click", nil, nil)
    self.Button_Close:OnBtnClicked()
    return true
  end
  return false
end

function Guide_Image_Main:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    DebugPrint("thy    Key_IsGamepadKey", InKeyName)
    IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
  else
    DebugPrint("thy    Key_IsPC", InKeyName)
    IsEventHandled = self:Handle_OnPCDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function Guide_Image_Main:OnReturnKeyDown()
  self.Button_Close:OnBtnClicked()
end

function Guide_Image_Main:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self:UpdateUIByInputDevice()
end

function Guide_Image_Main:UpdateUIByInputDevice()
  if not self.isPC then
    return
  end
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.WidgetSwitcher_L:SetActiveWidgetIndex(1)
    self.WidgetSwitcher_R:SetActiveWidgetIndex(1)
    if self.isPC then
      if self.CurrentPageIndex == self.StartPageIndex then
        self.Key_L:SetForbidKey(true)
      else
        self.Key_L:SetForbidKey(false)
      end
      if self.CurrentPageIndex == self.EndPageIndex then
        self.Key_R:SetForbidKey(true)
      else
        self.Key_R:SetForbidKey(false)
      end
    end
    self:UpdateKeyCloseVisiable()
    self:SetFocus(true)
  else
    self.WidgetSwitcher_L:SetActiveWidgetIndex(0)
    self.WidgetSwitcher_R:SetActiveWidgetIndex(0)
    self:UpdateKeyCloseVisiable()
  end
  for i = 1, 4 do
    self["Guide_" .. i]:UpdateTextOnInputDeviceChanged(self.CurInputDeviceType)
  end
end

function Guide_Image_Main:UpdateKeyCloseVisiable()
  if not self.isPC then
    return
  end
  if self.HasReachEnd then
    if self.CurInputDeviceType == ECommonInputType.Gamepad and self.StartPageIndex ~= self.EndPageIndex then
      self.Key_Close:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Key_Close_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    elseif self.CurInputDeviceType == ECommonInputType.Gamepad then
      self.Key_Close:SetVisibility(UIConst.VisibilityOp.Collapsed)
      if self.IsShowingRV then
        self.Key_Close_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      else
        self.Key_Close_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    else
      self.Key_Close:SetVisibility(UIConst.VisibilityOp.Visible)
      self.Key_Close_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self:PlayAnimation(self.KeyClose_In)
  else
    self.Key_Close:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Close_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function Guide_Image_Main:UpdateScrollBoxTip()
  if not self.isPC then
    return
  end
  if self.Guide_1:GetCurrentTextIsLong() then
    self.Key_Close_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RV"}
      },
      Desc = GText("UI_Controller_Slide"),
      bLongPress = false
    })
    self.IsShowingRV = true
  else
    self.Key_Close_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_UIGUIDE_CLOSE"),
      bLongPress = false
    })
    self.IsShowingRV = false
  end
  self:UpdateKeyCloseVisiable()
end

function Guide_Image_Main:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  if not self.IsShowingRV then
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
  if "Gamepad_RightY" == InKeyName then
    local CurScrollOffset = self.Guide_1.EMScrollBox_Desc:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.Guide_1.EMScrollBox_Desc:GetScrollOffsetOfEnd())
    self.Guide_1.EMScrollBox_Desc:SetScrollOffset(ScrollOffset)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

AssembleComponents(Guide_Image_Main)
return Guide_Image_Main
