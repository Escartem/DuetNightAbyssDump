require("UnLua")
local M = Class("BluePrints.UI.WBP.Camera.WBP_CameraBase_C")
local Handle = UE4.UWidgetBlueprintLibrary.Handled()
local Unhandle = UE4.UWidgetBlueprintLibrary.Unhandled()

function M:InitKeySetting()
  self.TabLeftKey = EKeys.Q.KeyName
  self.TabLeftKeyGamepad = Const.GamepadLeftShoulder
  self.TabRightKey = EKeys.E.KeyName
  self.TabRightKeyGamepad = Const.GamepadRightShoulder
  self.CameraMoveLeftKey = EKeys.A.KeyName
  self.CameraMoveRightKey = EKeys.D.KeyName
  self.CameraMoveUpKey = EKeys.W.KeyName
  self.CameraMoveDownKey = EKeys.S.KeyName
  self.CheeseKey = EKeys.F.KeyName
  self.CheeseKeyGamepad = Const.GamepadFaceButtonUp
  self.CameraRollLeftKey = EKeys.Z.KeyName
  self.CameraRollLeftKeyGamepad = Const.GamepadDPadLeft
  self.CameraRollRightKey = EKeys.X.KeyName
  self.CameraRollRightKeyGamepad = Const.GamepadDPadRight
  self.HideUIKey = EKeys.U.KeyName
  self.HideUIKeyGamepad = Const.GamepadLeftThumbstick
  self.HideCharacterKey = EKeys.I.KeyName
  self.HideCharacterKeyGamepad = Const.GamepadSpecialLeft
  self.ResetCameraKey = EKeys.R.KeyName
  self.ResetCameraKeyGamepad = Const.GamepadFaceButtonLeft
  self.AddFocalLengthKey = EKeys.Add.KeyName
  self.AddFocalLengthGamepad = Const.GamepadDPadUp
  self.SubFocalLengthKey = EKeys.Subtract.KeyName
  self.SubFocalLengthGamepad = Const.GamepadDPadDown
  self.LeftMouseButton = EKeys.LeftMouseButton.KeyName
  self.Escape = EKeys.Escape.KeyName
  self.EscapeGamepad = Const.GamepadFaceButtonRight
  self.GlobalGamePauseGamepad = Const.GamepadRightThumbstick
  self.MoveCloseGamepad = Const.GamepadLeftTrigger
  self.MoveFarGamepad = Const.GamepadRightTrigger
  self.KeyDownEvent = {}
  self.KeyDownEvent[self.TabLeftKey] = self.OnTabLeftKeyDown
  self.KeyDownEvent[self.TabRightKey] = self.OnTabRightKeyDown
  self.KeyDownEvent[self.TabLeftKeyGamepad] = self.OnTabLeftKeyDown
  self.KeyDownEvent[self.TabRightKeyGamepad] = self.OnTabRightKeyDown
  self.KeyDownEvent[self.CameraMoveLeftKey] = self.OnCameraMoveLeftKeyDown
  self.KeyDownEvent[self.CameraMoveRightKey] = self.OnCameraMoveRightKeyDown
  self.KeyDownEvent[self.CameraMoveUpKey] = self.OnCameraMoveUpKeyDown
  self.KeyDownEvent[self.CameraMoveDownKey] = self.OnCameraMoveDownKeyDown
  self.KeyDownEvent[self.CheeseKey] = self.OnCheeseKeyDown
  self.KeyDownEvent[self.CheeseKeyGamepad] = self.OnCheeseKeyDown
  self.KeyDownEvent[self.CameraRollLeftKey] = self.OnCameraRollLeftKeyDown
  self.KeyDownEvent[self.CameraRollRightKey] = self.OnCameraRollRightKeyDown
  self.KeyDownEvent[self.CameraRollLeftKeyGamepad] = self.OnCameraRollLeftKeyDown
  self.KeyDownEvent[self.CameraRollRightKeyGamepad] = self.OnCameraRollRightKeyDown
  self.KeyDownEvent[self.HideUIKey] = self.OnHideUIKeyDown
  self.KeyDownEvent[self.HideUIKeyGamepad] = self.OnHideUIKeyDown
  self.KeyDownEvent[self.HideCharacterKey] = self.OnHideCharacterKeyDown
  self.KeyDownEvent[self.HideCharacterKeyGamepad] = self.OnHideCharacterKeyDown
  self.KeyDownEvent[self.ResetCameraKey] = self.OnResetCameraKeyDown
  self.KeyDownEvent[self.ResetCameraKeyGamepad] = self.OnResetCameraKeyDown
  self.KeyDownEvent[self.AddFocalLengthKey] = self.OnAddFocalLengthKeyDown
  self.KeyDownEvent[self.AddFocalLengthGamepad] = self.OnAddFocalLengthKeyDown
  self.KeyDownEvent[self.SubFocalLengthKey] = self.OnSubFocalLengthKeyDown
  self.KeyDownEvent[self.SubFocalLengthGamepad] = self.OnSubFocalLengthKeyDown
  self.KeyDownEvent[self.Escape] = self.OnBackKeyDown
  self.KeyDownEvent[self.EscapeGamepad] = self.OnBackKeyDown
  self.KeyDownEvent[self.GlobalGamePauseGamepad] = self.OnGlobalGamePause
  self.KeyDownEvent[self.MoveCloseGamepad] = self.OnMoveCloseKeyDown
  self.KeyDownEvent[self.MoveFarGamepad] = self.OnMoveFarKeyDown
  self.KeyUpEvent = {}
  self.KeyUpEvent[self.CameraMoveLeftKey] = self.OnCameraMoveLeftKeyUp
  self.KeyUpEvent[self.CameraMoveRightKey] = self.OnCameraMoveRightKeyUp
  self.KeyUpEvent[self.CameraMoveUpKey] = self.OnCameraMoveUpKeyUp
  self.KeyUpEvent[self.CameraMoveDownKey] = self.OnCameraMoveDownKeyUp
  self.KeyUpEvent[self.CameraRollLeftKey] = self.OnCameraRollLeftKeyUp
  self.KeyUpEvent[self.CameraRollLeftKeyGamepad] = self.OnCameraRollLeftKeyUp
  self.KeyUpEvent[self.CameraRollRightKey] = self.OnCameraRollRightKeyUp
  self.KeyUpEvent[self.CameraRollRightKeyGamepad] = self.OnCameraRollRightKeyUp
  self.KeyUpEvent[self.AddFocalLengthGamepad] = self.OnAddFocalLengthKeyUp
  self.KeyUpEvent[self.SubFocalLengthGamepad] = self.OnSubFocalLengthKeyUp
  self.KeyUpEvent[self.MoveCloseGamepad] = self.OnMoveCloseKeyUp
  self.KeyUpEvent[self.MoveFarGamepad] = self.OnMoveFarKeyUp
end

function M:Construct()
  self:InitKeySetting()
  self.Btn_Close.OnClicked:Clear()
  self.Btn_Close.OnClicked:Add(self, self.OnBackKeyDown)
  self.TabConfig = {
    Tabs = {
      {
        Text = GText("UI_CameraSystem_CameraModeSelfie"),
        CameraIndex = 1
      },
      {
        Text = GText("UI_CameraSystem_CameraModeDefault"),
        CameraIndex = 0
      },
      {
        Text = GText("UI_CameraSystem_CameraModePhotography"),
        CameraIndex = 2
      }
    },
    LeftKey = self.TabLeftKey,
    RightKey = self.TabRightKey,
    SoundFunc = function()
    end
  }
  self.WBP_Camera_Shoot_P:UnBindEventOnClicked(self, self.OnCheeseKeyDown)
  self.WBP_Camera_Shoot_P:BindEventOnClicked(self, self.OnCheeseKeyDown)
  self.WBP_Camera_Shoot_P:SetKeyInfo(self.CheeseKey)
  self.FocalLengthChangeInterval = 0.1
  self.FocalLengthChangePressTime = 4
  self.WS_Pause:SetVisibility(UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and UIConst.VisibilityOp.SelfHitTestInvisible or UIConst.VisibilityOp.Collapsed)
  self.MidMouseBtn_Key.IsButton = false
  self.MidMouseBtn_Key:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        ImgShortPath = "Mouse_Button",
        Owner = self
      }
    },
    SoundFunc = function()
    end,
    Desc = GText("UI_Dye_Zoom")
  })
  self.HideUI_Key:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = self.HideUIKey,
        ClickCallback = self.OnHideUIKeyDown,
        Owner = self
      }
    },
    SoundFunc = function()
    end,
    Desc = GText("UI_CameraSystem_HideUI")
  })
  self.HideRole_Key:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = self.HideCharacterKey,
        ClickCallback = self.OnHideCharacterKeyDown,
        Owner = self
      }
    },
    SoundFunc = function()
    end,
    Desc = GText("UI_CameraSystem_HideModel")
  })
  self.Restore_Key:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = self.ResetCameraKey,
        ClickCallback = self.OnResetCameraKeyDown,
        Owner = self
      }
    },
    SoundFunc = function()
    end,
    Desc = GText("UI_CameraSystem_CameraReset")
  })
  self.Close_Key:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = "Esc",
        ClickCallback = self.OnBackKeyDown,
        Owner = self
      }
    },
    SoundFunc = function()
    end,
    Desc = GText("UI_BACK")
  })
  self.Z_L:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = self.CameraRollLeftKey,
        ClickCallback = self.OnCameraRollLeftClicked,
        Owner = self
      }
    },
    SoundFunc = function()
    end,
    Desc = GText("UI_CameraSystem_CameraLeftLean")
  })
  self.X_R:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = self.CameraRollRightKey,
        ClickCallback = self.OnCameraRollRightClicked,
        Owner = self
      }
    },
    SoundFunc = function()
    end,
    Desc = GText("UI_CameraSystem_CameraRightLean")
  })
  self.Key_Controller_LeanL:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Left",
        Owner = self
      }
    },
    SoundFunc = function()
    end,
    Desc = GText("UI_CameraSystem_CameraLeftLean")
  })
  self.Key_Controller_LeanR:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Right",
        Owner = self
      }
    },
    SoundFunc = function()
    end,
    Desc = GText("UI_CameraSystem_CameraRightLean")
  })
  self.Key_Controller_View:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "R",
        Owner = self
      }
    },
    SoundFunc = function()
    end,
    Desc = GText("UI_CameraSystem_CameraAdjust")
  })
  self.Key_Controller_Zoom:CreateSubKeyDesc({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "LT",
        Owner = self
      },
      {
        Type = "Img",
        ImgShortPath = "RT",
        Owner = self
      }
    },
    Type = "Or",
    SoundFunc = function()
    end,
    Desc = GText("UI_Dye_Zoom")
  })
  self.Key_Controller_HideUI:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "LS",
        Owner = self
      }
    },
    SoundFunc = function()
    end,
    Desc = GText("UI_CameraSystem_HideUI")
  })
  self.Key_Controller_HideRole:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "View",
        Owner = self
      }
    },
    SoundFunc = function()
    end,
    Desc = GText("UI_CameraSystem_HideModel")
  })
  self.Key_Controller_Restore:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
        Owner = self
      }
    },
    SoundFunc = function()
    end,
    Desc = GText("UI_CameraSystem_CameraReset")
  })
  self.Key_Controller_Close:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "B",
        Owner = self
      }
    },
    SoundFunc = function()
    end,
    Desc = GText("UI_BACK")
  })
  self.Key_Controller_Pause:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "RS",
        Owner = self
      }
    },
    SoundFunc = function()
    end
  })
  self.Key_Controller_HideAll:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "X",
        Owner = self
      }
    },
    SoundFunc = function()
    end
  })
  self.Key_Tip_Controller:UpdateKeyInfo({
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("ModFilter_Confirm")
    },
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_PATCH_CANCEL")
    }
  })
  self.WBP_Camera_Roll_P:InitKeyInfo(self.CameraMoveLeftKey, self.CameraMoveRightKey, self.CameraMoveUpKey, self.CameraMoveDownKey)
  self.WBP_Camera_Roll_P:BindEvnetOnJoyStick(self, {
    OnMoved = self.OnJoyStickMove,
    OnPointerDown = self.OnJoyStickPointerDown,
    OnPointerUp = self.OnJoyStickPointerUp
  })
  self.WBP_Camera_Bar_P:_SetExtraText(GText("UI_CameraSystem_CameraFocalLength"))
  self.FocalLengthSlider = self.WBP_Camera_Bar_P
  self.RollScrollBar = self.WBP_Camera_Scale_P
  self.WBP_Com_BtnClose01:BindEventOnClicked(self, self.OnCloseHideModel)
  self.Text_Title:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Text_Title:SetText(GText("UI_CameraSystem_HideModel"))
  self.Text_Hide_All:SetText(GText("UI_CameraSystem_HideModelAll"))
  self.Btn_AISetting:SetChecked(false, false)
  self.Btn_AISetting:AddEventOnCheckStateChanged(self, self.OnCheckBoxClicked)
  self.Hide_Role:BindEventOnClicked(self, self.OnHideRoleBtnClicked)
  self.Hide_Player:BindEventOnClicked(self, self.OnHidePlayerBtnClicked)
  self.Hide_NPC:BindEventOnClicked(self, self.OnHideNPCBtnClicked)
  self.Hide_Monster:BindEventOnClicked(self, self.OnHideMonsterBtnClicked)
  self.Hide_Pet:BindEventOnClicked(self, self.OnHidePetBtnClicked)
  self:UnbindAllFromAnimationFinished(self.Menu_Out)
  self:BindToAnimationFinished(self.Menu_Out, {
    self,
    self.OnMenu_OutFinished
  })
  self:UnbindAllFromAnimationFinished(self.Menu_Out)
  self:BindToAnimationFinished(self.MenuPart_Out, {
    self,
    self.OnMenuPart_OutFinished
  })
  self:SetMenuWidgetVisibility(true)
  self.CanvasPanel_1:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.WidgetHideTags = {
    Top = 0,
    Bottom = 0,
    ESC = 0,
    Menu = 1
  }
  for key, value in pairs(self.WidgetHideTags) do
    self["Set" .. key .. "WidgetVisibility"](self, 0 == value)
  end
  self.WidgetHideAnims = {
    Top = {
      In = self.Hide_In,
      Out = self.Hide_Out
    },
    Bottom = {
      In = self.MenuPart_In,
      Out = self.MenuPart_Out
    },
    ESC = {
      In = self.ESC_In,
      Out = self.ESC_Out
    },
    Menu = {
      In = self.Menu_In,
      Out = self.Menu_Out
    }
  }
  self.OperationStack = {}
  M.Super.Construct(self)
end

function M:OnMouseWheel(MyGeometry, MouseEvent)
  if self.bScreenshotWidgetShow then
    return Unhandle
  end
  local WheelDelta = UE4.UKismetInputLibrary.PointerEvent_GetWheelDelta(MouseEvent)
  self:MoveCamera(WheelDelta, 0, 0)
  return Unhandle
end

function M:OnMoveCloseKeyDown()
  self.bCameraMoveCloseKeyDown = true
end

function M:OnMoveCloseKeyUp()
  self.bCameraMoveCloseKeyDown = false
end

function M:OnMoveFarKeyDown()
  self.bCameraMoveFarKeyDown = true
end

function M:OnMoveFarKeyUp()
  self.bCameraMoveFarKeyDown = false
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if self.bScreenshotWidgetShow then
    return Unhandle
  end
  self.IsDragging = true
  local IsLeftMouseButton = UE4.UKismetInputLibrary.PointerEvent_IsMouseButtonDown(MouseEvent, EKeys.LeftMouseButton)
  if IsLeftMouseButton and self.KeyDownEvent[self.LeftMouseButton] then
    self.KeyDownEvent[self.LeftMouseButton](self)
  end
  return UWidgetBlueprintLibrary.CaptureMouse(Handle, self)
end

function M:OnMouseButtonUp(MyGeometry, InKeyEvent)
  self.IsDragging = false
  self.RotateCameraByPointer = false
  return UWidgetBlueprintLibrary.ReleaseMouseCapture(Handle)
end

function M:OnMouseMove(MyGeometry, InKeyEvent)
  if self.bScreenshotWidgetShow then
    self.IsDragging = false
    return Unhandle
  end
  if self.IsDragging then
    local CursorDelta = UE4.UKismetInputLibrary.PointerEvent_GetCursorDelta(InKeyEvent)
    self:RotateCamera(0, -CursorDelta.Y, CursorDelta.X)
    self.RotateCameraByPointer = self.RotateCameraByPointer or 0 ~= CursorDelta.X or 0 ~= CursorDelta.Y
  end
  return Unhandle
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if self.bScreenshotWidgetShow then
    return self.ScreenshotWidget:OnPreviewKeyDown(MyGeometry, InKeyEvent) and UIUtils.Handled or UIUtils.Unhandled
  end
  return UIUtils.Unhandled
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if self.bScreenshotWidgetShow then
    self.ScreenshotWidget:OnKeyDown(MyGeometry, InKeyEvent)
    return UIUtils.Handled
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.KeyDownEvent[InKeyName] then
    self.KeyDownEvent[InKeyName](self)
  end
  return UIUtils.Handled
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.KeyUpEvent[InKeyName] then
    self.KeyUpEvent[InKeyName](self)
    return Unhandle
  end
  return Unhandle
end

function M:OnTabLeftKeyDown()
  self.WBP_Camera_Tab_P:TabToLeft()
end

function M:OnTabRightKeyDown()
  self.WBP_Camera_Tab_P:TabToRight()
end

function M:OnTabSelected(TabWidget, Tab)
  self:ChangeCamera(Tab.CameraIndex)
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local HandleResult = UIUtils.Unhandled
  if self.bScreenshotWidgetShow then
    return HandleResult
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local Value = UE4.UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
  if self.bNeedFreshGamepadAnalogValue then
    self.bCameraMoveLeftKeyDown = false
    self.bCameraMoveRightKeyDown = false
    self.bCameraMoveUpKeyDown = false
    self.bCameraMoveDownKeyDown = false
    self.bNeedFreshGamepadAnalogValue = false
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and not self.bShowHideCharacterWidget then
    if InKeyName == UIConst.GamePadKey.LeftAnalogX then
      self.bCameraMoveLeftKeyDown = Value < -0.2
      self.bCameraMoveRightKeyDown = Value > 0.2
      HandleResult = UIUtils.Handled
    end
    if InKeyName == UIConst.GamePadKey.LeftAnalogY then
      self.bCameraMoveDownKeyDown = Value < -0.2
      self.bCameraMoveUpKeyDown = Value > 0.2
      HandleResult = UIUtils.Handled
    end
    if Value > 0.2 or Value < -0.2 then
      if InKeyName == UIConst.GamePadKey.RightAnalogX then
        self.RotYaw = Value * self.RotYawGamepadCoe
        self.RotateCameraByPointer = true
        HandleResult = UIUtils.Handled
      end
      if InKeyName == UIConst.GamePadKey.RightAnalogY then
        self.RotPitch = Value * self.RotPitchGamepadCoe
        self.RotateCameraByPointer = true
        HandleResult = UIUtils.Handled
      end
    end
  end
  return HandleResult
end

function M:Tick(MyGeometry, InDeltaTime)
  if self.bCameraMoveLeftKeyDown then
    self:MoveCamera(0, -InDeltaTime, 0)
  end
  if self.bCameraMoveRightKeyDown then
    self:MoveCamera(0, InDeltaTime, 0)
  end
  if self.bCameraMoveUpKeyDown then
    self:MoveCamera(0, 0, InDeltaTime)
  end
  if self.bCameraMoveDownKeyDown then
    self:MoveCamera(0, 0, -InDeltaTime)
  end
  if self.bCameraMoveCloseKeyDown then
    self:MoveCamera(InDeltaTime * 20, 0, 0)
  end
  if self.bCameraMoveFarKeyDown then
    self:MoveCamera(-InDeltaTime * 20, 0, 0)
  end
  if self.CameraRollKeyPressedTime ~= nil and self.CameraRollKeyPressedTime >= 0.5 then
    if self.bCameraLeftRollKeyDown then
      self:RotateCameraRoll(-1)
    end
    if self.bCameraRightRollKeyDown then
      self:RotateCameraRoll(1)
    end
  elseif (self.bCameraRightRollKeyDown or self.bCameraLeftRollKeyDown) and self.CameraRollKeyPressedTime ~= nil and self.CameraRollKeyPressedTime < 0.5 then
    self.CameraRollKeyPressedTime = self.CameraRollKeyPressedTime + InDeltaTime
  end
  if nil ~= self.FocalLengthKeyPressedTime and self.FocalLengthKeyPressedTime >= 0.5 then
    if self.FocalLengthSub then
      self.FocalLengthSlider:SubValue()
    end
    if self.FocalLengthAdd then
      self.FocalLengthSlider:AddValue()
    end
  elseif (self.FocalLengthSub or self.FocalLengthAdd) and nil ~= self.FocalLengthKeyPressedTime and self.FocalLengthKeyPressedTime < 0.5 then
    self.FocalLengthKeyPressedTime = self.FocalLengthKeyPressedTime + InDeltaTime
  end
  if self.bCameraMoveLeftKeyDown or self.bCameraMoveRightKeyDown or self.bCameraMoveUpKeyDown or self.bCameraMoveDownKeyDown or self.bCameraMovedByJoyStick or self.RotateCameraByPointer then
    self.SoundFlags.Camera_Motor = true
  else
    self.SoundFlags.Camera_Motor = false
  end
  if self.RotateCameraByPointer and (0 ~= self.RotPitch or 0 ~= self.RotYaw) then
    self:RotateCamera(0, self.RotPitch, self.RotYaw)
  end
  self.RotateCameraByPointer = false
  M.Super.Tick(self, MyGeometry, InDeltaTime)
  self.RotPitch = 0
  self.RotYaw = 0
  self.bNeedFreshGamepadAnalogValue = true
end

function M:OnJoyStickMove(Dir, Percent)
  self.bCameraMovedByJoyStick = not self.bLockCameraPos
  self:MoveCamera(0, Dir.X * Percent, Dir.Y * Percent)
end

function M:OnJoyStickPointerDown()
  if self.bLockCameraPos then
    self.WBP_Camera_Roll_P:PlayAnimation(self.WBP_Camera_Roll_P.Warning)
  end
end

function M:OnJoyStickPointerUp()
  self.bCameraMovedByJoyStick = false
end

function M:OnCameraMoveLeftKeyDown()
  self.bCameraMoveLeftKeyDown = not self.bLockCameraPos
  self.WBP_Camera_Roll_P:SetPressed("Left", true)
  self:OnJoyStickPointerDown()
end

function M:OnCameraMoveLeftKeyUp()
  self.bCameraMoveLeftKeyDown = false
  self.WBP_Camera_Roll_P:SetPressed("Left", false)
end

function M:OnCameraMoveRightKeyDown()
  self.bCameraMoveRightKeyDown = not self.bLockCameraPos
  self.WBP_Camera_Roll_P:SetPressed("Right", true)
  self:OnJoyStickPointerDown()
end

function M:OnCameraMoveRightKeyUp()
  self.bCameraMoveRightKeyDown = false
  self.WBP_Camera_Roll_P:SetPressed("Right", false)
end

function M:OnCameraMoveUpKeyDown()
  self.bCameraMoveUpKeyDown = not self.bLockCameraPos
  self.WBP_Camera_Roll_P:SetPressed("Up", true)
  self:OnJoyStickPointerDown()
end

function M:OnCameraMoveUpKeyUp()
  self.bCameraMoveUpKeyDown = false
  self.WBP_Camera_Roll_P:SetPressed("Up", false)
end

function M:OnCameraMoveDownKeyDown()
  self.bCameraMoveDownKeyDown = not self.bLockCameraPos
  self.WBP_Camera_Roll_P:SetPressed("Down", true)
  self:OnJoyStickPointerDown()
end

function M:OnCameraMoveDownKeyUp()
  self.bCameraMoveDownKeyDown = false
  self.WBP_Camera_Roll_P:SetPressed("Down", false)
end

function M:OnCheeseKeyDown()
  self:Screenshot()
end

function M:OnCameraRollLeftKeyDown()
  self.bCameraLeftRollKeyDown = true
  self.CameraRollKeyPressedTime = 0
  self:RotateCameraRoll(-1)
end

function M:OnCameraRollLeftKeyUp()
  self.bCameraLeftRollKeyDown = false
end

function M:OnCameraRollLeftClicked()
  self:RotateCameraRoll(-1)
end

function M:OnCameraRollRightKeyDown()
  self.bCameraRightRollKeyDown = true
  self.CameraRollKeyPressedTime = 0
  self:RotateCameraRoll(1)
end

function M:OnCameraRollRightKeyUp()
  self.bCameraRightRollKeyDown = false
end

function M:OnCameraRollRightClicked()
  self:RotateCameraRoll(1)
end

function M:OnRollScrollBarPercentChanged(Percent)
  self.bRollScrollBarPointerDown = true
  self:SetRollPercent(Percent)
end

function M:OnRollScrollBarInertialScrollingEnd()
  M.Super.OnRollScrollBarInertialScrollingEnd(self)
  self.bRollScrollBarPointerDown = false
end

function M:PushOperationStack(Operation)
  table.insert(self.OperationStack, Operation)
end

function M:PopOperationStack(Operation)
  local NewOperatoinStack = {}
  for _, value in ipairs(self.OperationStack) do
    if value ~= Operation then
      table.insert(NewOperatoinStack, value)
    end
  end
  self.OperationStack = NewOperatoinStack
end

function M:OnHideUIKeyDown()
  self:ToggleHideSelf()
end

function M:ToggleHideSelf()
  self.bSelfHidden = not self.bSelfHidden
  if self.bSelfHidden then
    AudioManager(self):PlayUISound(self, "event:/ui/common/camera_reset", "Camera_HideUI", nil)
    self:PushOperationStack("HideUI")
    self:AddWidgetHideTag("Top")
    self:AddWidgetHideTag("Bottom")
  else
    UIUtils.PlayCommonBtnSe(self)
    self:PopOperationStack("HideUI")
    self:RemoveWidgetHideTag("Top")
    self:RemoveWidgetHideTag("Bottom")
  end
end

function M:OnHideCharacterKeyDown()
  UIUtils.PlayCommonBtnSe(self)
  self:ToggleShowHideCharacterWidget()
end

function M:ToggleShowHideCharacterWidget()
  self.bShowHideCharacterWidget = not self.bShowHideCharacterWidget
  if self.bShowHideCharacterWidget then
    self:PushOperationStack("HideCharcater")
    self:RemoveWidgetHideTag("Menu")
    self:AddWidgetHideTag("ESC")
    self:AddWidgetHideTag("Bottom")
    self.KeyDownEvent[self.ResetCameraKeyGamepad] = self.HiddenAllKeyDown
    self.GameInputModeSubsystem:SetTargetUIFocusWidget(self.Hide_Role.Btn_Click)
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  else
    self:PopOperationStack("HideCharcater")
    self:AddWidgetHideTag("Menu")
    self:RemoveWidgetHideTag("ESC")
    self:RemoveWidgetHideTag("Bottom")
    self.KeyDownEvent[self.ResetCameraKeyGamepad] = self.OnResetCameraKeyDown
    self.GameInputModeSubsystem:SetTargetUIFocusWidget(self)
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
  end
end

function M:OnCloseHideModel()
  self:ToggleShowHideCharacterWidget()
end

function M:OnMenu_OutFinished()
  self.HorizontalBox:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.HorizontalBox_39:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.WBP_Camera_Roll_P:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.WBP_Camera_Scale_P:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Close:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:OnMenuPart_OutFinished()
  self.IsMenuPart_OutFinished = true
end

function M:SetWidgetsVisibilityByTag(Tag, bHitTestable)
  self["Set" .. Tag .. "WidgetVisibility"](self, bHitTestable)
end

function M:SetTopWidgetVisibility(bHitTestable)
  if bHitTestable then
    self.WBP_Camera_Bar_P:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.WBP_Camera_Tab_P:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.WBP_Camera_Shoot_P:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.WBP_Camera_Bar_P:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.WBP_Camera_Tab_P:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.WBP_Camera_Shoot_P:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
end

function M:SetBottomWidgetVisibility(bHitTestable)
  if bHitTestable then
    self.MidMouseBtn_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.HideUI_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.HideRole_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Restore_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.HorizontalBox_39:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.WBP_Camera_Roll_P:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.WBP_Camera_Scale_P:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Close:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.MidMouseBtn_Key:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.HideUI_Key:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.HideRole_Key:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Restore_Key:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.HorizontalBox_39:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.WBP_Camera_Roll_P:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.WBP_Camera_Scale_P:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Btn_Close:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
end

function M:SetMenuWidgetVisibility(bHitTestable)
  self:SetBottomWidgetVisibility(not bHitTestable)
  if bHitTestable then
    self.CanvasPanel_1:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.CanvasPanel_1:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
end

function M:SetESCWidgetVisibility(bHitTestable)
  if bHitTestable then
    self.Close_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Close_Key:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
end

function M:SetMenuHideExcludeBottom()
  self:AddTimer(0.02, function()
    if self.WidgetHideTags.Bottom > 0 then
      self.Panel_Pause:SetRenderOpacity(0)
      self.WS_LeftCorner:SetRenderOpacity(0)
    end
  end, false, 0, "SetMenuHideExcludeBottom")
  self:UnbindFromAnimationFinished(self.WidgetHideAnims.Menu.Out, {
    self,
    self.SetMenuHideExcludeBottom
  })
end

function M:AddWidgetHideTag(Tag)
  if 0 == self.WidgetHideTags[Tag] then
    self:StopAnimation(self.WidgetHideAnims[Tag].In)
    self:PlayAnimation(self.WidgetHideAnims[Tag].Out)
    self:SetWidgetsVisibilityByTag(Tag, false)
  end
  self.WidgetHideTags[Tag] = self.WidgetHideTags[Tag] + 1
  if "Menu" == Tag and self.WidgetHideTags.Menu > 0 then
    self:BindToAnimationFinished(self.WidgetHideAnims[Tag].Out, {
      self,
      self.SetMenuHideExcludeBottom
    })
  end
end

function M:RemoveWidgetHideTag(Tag)
  self.WidgetHideTags[Tag] = self.WidgetHideTags[Tag] - 1
  if 0 == self.WidgetHideTags[Tag] then
    self:StopAnimation(self.WidgetHideAnims[Tag].Out)
    self:PlayAnimation(self.WidgetHideAnims[Tag].In)
    self:SetWidgetsVisibilityByTag(Tag, true)
  end
end

function M:TickFindTargets()
  M.Super.TickFindTargets(self)
  if self.bScreenshotWidgetShow or self.IsShotTargetSucceeded then
    self.WBP_Camera_Shoot_P:StopLoopRemind()
    return
  end
  if self.bFindTarget then
    self.WBP_Camera_Shoot_P:PlayLoopRemind()
  else
    self.WBP_Camera_Shoot_P:StopLoopRemind()
  end
end

function M:UpdateCheckBox()
  local Checked = self.CharType.All == self.CurCharHiddenState
  local CheckedBefore = not not self.Btn_AISetting:GetChecked()
  if CheckedBefore ~= Checked then
    self.Btn_AISetting:SetChecked(Checked, false)
  end
end

function M:OnCheckBoxClicked()
  if self.CurCharHiddenState ~= self.CharType.All then
    self:SetCharHiddengState(self.CharType.All)
  else
    self:SetCharHiddengState(0)
  end
  self.Hide_Role:SetHiddenState(0 ~= self.CharType.Char & self.CurCharHiddenState)
  self.Hide_Player:SetHiddenState(0 ~= self.CharType.Player & self.CurCharHiddenState)
  self.Hide_NPC:SetHiddenState(0 ~= self.CharType.NPC & self.CurCharHiddenState)
  self.Hide_Monster:SetHiddenState(0 ~= self.CharType.Monster & self.CurCharHiddenState)
  self.Hide_Pet:SetHiddenState(0 ~= self.CharType.Pet & self.CurCharHiddenState)
end

function M:OnResetCameraKeyDown()
  self:ResetCamera()
end

function M:HiddenAllKeyDown()
  self.Btn_AISetting:OnBtnClicked(self.Btn_AISetting)
end

function M:OnAddFocalLengthKeyDown()
  self.FocalLengthAdd = true
  self.FocalLengthKeyPressedTime = 0
  self.FocalLengthSlider:AddValue()
end

function M:OnAddFocalLengthKeyUp()
  self.FocalLengthAdd = false
end

function M:OnSubFocalLengthKeyDown()
  self.FocalLengthSub = true
  self.FocalLengthKeyPressedTime = 0
  self.FocalLengthSlider:SubValue()
end

function M:OnSubFocalLengthKeyUp()
  self.FocalLengthSub = false
end

function M:OnFocalLengthSliderValueChanged(Value)
  self:SetFocalLength(Value)
end

function M:OnBackKeyDown()
  if #self.OperationStack > 0 then
    if self.OperationStack[#self.OperationStack] == "HideCharcater" then
      self:OnHideCharacterKeyDown()
    else
      self:OnHideUIKeyDown()
    end
  else
    self:CheckHasAnyOperationOrClose()
  end
end

function M:OnGlobalGamePause()
  if 0 == self.WS_Pause:GetActiveWidgetIndex() then
    self.Btn_Pause:OnBtnClicked()
  else
    self:OnGamePauseBtnLockedClick()
  end
end

function M:OnFocusLost(InFocusEvent)
end

function M:OnMouseCaptureLost()
  self.IsDragging = false
  self.RotateCameraByPointer = false
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.WBP_Camera_Tab_P:Init(self.TabConfig)
  self.WBP_Camera_Tab_P:BindEventOnTabSelected(nil, nil)
  self.WBP_Camera_Tab_P:SelectTab(2)
  self.WBP_Camera_Tab_P:BindEventOnTabSelected(self, self.OnTabSelected)
end

function M:SetLockGamePause(bNewLock)
  M.Super.SetLockGamePause(self, bNewLock)
  self.WS_Pause:SetActiveWidgetIndex(bNewLock and 1 or 0)
  if bNewLock or UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.WS_Pause:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.WS_Pause:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetLockCameraPos(bNewLock)
  M.Super.SetLockCameraPos(self, bNewLock)
  if bNewLock then
    self.WBP_Camera_Roll_P:PlayAnimation(self.WBP_Camera_Roll_P.Roll_Lock)
  else
    self.WBP_Camera_Roll_P:PlayAnimation(self.WBP_Camera_Roll_P.Roll_Normal)
  end
  self.WBP_Camera_Roll_P:SetJoyStickLocked(bNewLock)
  self.WBP_Camera_Roll_P.WS_Type:SetActiveWidgetIndex(bNewLock and 1 or 0)
end

function M:SetLockHiddenButton(HiddenButton, bNewLock)
  M.Super.SetLockHiddenButton(self, HiddenButton, bNewLock)
  if bNewLock then
    self.WS_Type_Hide:SetActiveWidgetIndex(1)
    self:SetLockHiddenAllButton(bNewLock)
  end
end

function M:SetLockAllHiddenButton(bNewLock)
  M.Super.SetLockAllHiddenButton(self, bNewLock)
  self.WS_Type_Hide:SetActiveWidgetIndex(bNewLock and 1 or 0)
  self:SetLockHiddenAllButton(bNewLock)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  M.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputType, CurGamepadName)
  self.WBP_Camera_Roll_P:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.WBP_Camera_Shoot_P:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.WBP_Camera_Tab_P:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.WS_LeftCorner:SetActiveWidgetIndex(CurInputType == ECommonInputType.Gamepad and 1 or 0)
  self.WS_RightCorner:SetActiveWidgetIndex(CurInputType == ECommonInputType.Gamepad and 1 or 0)
  if 0 == self.WS_Pause:GetActiveWidgetIndex() then
    self.WS_Pause:SetVisibility(CurInputType == ECommonInputType.Gamepad and UIConst.VisibilityOp.SelfHitTestInvisible or UIConst.VisibilityOp.Collapsed)
  else
    self.WS_Pause:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.Key_Controller_Pause:SetVisibility(CurInputType == ECommonInputType.Gamepad and UIConst.VisibilityOp.SelfHitTestInvisible or UIConst.VisibilityOp.Hidden)
  self.Key_Controller_HideAll:SetVisibility(CurInputType == ECommonInputType.Gamepad and UIConst.VisibilityOp.SelfHitTestInvisible or UIConst.VisibilityOp.Collapsed)
  self.Key_Tip_Controller:SetVisibility(CurInputType == ECommonInputType.Gamepad and UIConst.VisibilityOp.SelfHitTestInvisible or UIConst.VisibilityOp.Collapsed)
  if CurInputType == ECommonInputType.Gamepad then
    if self.bShowHideCharacterWidget then
      self.GameInputModeSubsystem:SetTargetUIFocusWidget(self.Hide_Role.Btn_Click)
    elseif self.ScreenshotWidget then
    end
  end
  if self.bScreenshotWidgetShow and self.ScreenshotWidget then
    self.ScreenshotWidget:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  end
end

function M:ShowScreenshotWidget(Image)
  M.Super.ShowScreenshotWidget(self, Image)
  if IsValid(self.ScreenshotWidget) then
    self.ScreenshotWidget:OnUpdateUIStyleByInputTypeChange(UIUtils.UtilsGetCurrentInputType())
  end
end

function M:OnScreenshotWidgetHidden(bSaved)
  M.Super.OnScreenshotWidgetHidden(self, bSaved)
end

return M
