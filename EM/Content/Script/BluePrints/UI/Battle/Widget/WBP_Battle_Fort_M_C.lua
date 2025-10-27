require("UnLua")
require("DataMgr")
local WBP_Battle_Fort_M_C = Class("BluePrints.UI.Battle.Widget.WBP_Battle_Fort_Base_C")
WBP_Battle_Fort_M_C._components = {
  "BluePrints.UI.UIComponent.TouchComponent"
}

function WBP_Battle_Fort_M_C:Initialize(Initializer)
  WBP_Battle_Fort_M_C.Super.Initialize(self)
end

function WBP_Battle_Fort_M_C:OnLoaded(...)
  WBP_Battle_Fort_M_C.Super.OnLoaded(self, ...)
  self:InitJoyStick()
  self.LocalTurnSpeed_Horizontal = 4
  self.LocalTurnSpeed_Vertical = 4
  self.ChangeSpeed = 1
  self.YawRotateSpeed = 30
  self.Radius = 80
  self.Limit = 0.8 * self.Radius
  self.PowLimit = self.Limit * self.Limit
  self:InitTouchLayer(self.OwnerPlayer, 0, 0)
  self.DelayAddTouchLayerTimer = self:AddTimer(0.1, self.DelayAddTouchLayer, true)
end

function WBP_Battle_Fort_M_C:DelayAddTouchLayer()
  if self.Joystick and not self.IsInitTouch then
    self.IsInitTouch = true
    self:AddMovedSubTouchItem("BattleFortJoystick", self.Joystick, nil, {
      Down = self.ButtonDown,
      Move = self.ButtonMove,
      Up = self.ButtonUp
    }, {
      Type = "Circle",
      Param = {
        Radius = self.Radius,
        NeedReset = false
      },
      TouchTimes = -1,
      NeedResetPos = true
    })
  end
  if self.IsInitTouch then
    self:RemoveTimer(self.DelayAddTouchLayerTimer)
  end
end

function WBP_Battle_Fort_M_C:ButtonDown(Index, StartPos)
  self.Joystick:SetRenderOpacity(1.0)
end

function WBP_Battle_Fort_M_C:ButtonMove(TouchFingerCount, Index, LastPos, TotalDeltaDis, LastDeltaDis, TouchLocalPos)
  local WorldDeltaTime = UE4.UGameplayStatics.GetWorldDeltaSeconds(self)
  self.AddPitch = -self.LocalTurnSpeed_Vertical * LastDeltaDis.Y * WorldDeltaTime
  self.AddYaw = self.LocalTurnSpeed_Horizontal * LastDeltaDis.X * WorldDeltaTime
  local FinalAngle = self:CalcFinalAngle(TotalDeltaDis)
  self.Joystick_Border:SetRenderTransformAngle(FinalAngle)
  self.Joystick_Border:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  local PowTotalDeltaDis = TotalDeltaDis.X * TotalDeltaDis.X + TotalDeltaDis.Y * TotalDeltaDis.Y
  if PowTotalDeltaDis > self.PowLimit and (FinalAngle > 45 and FinalAngle < 135 or FinalAngle < -45 and FinalAngle > -135) then
    self.AutoMove = true
    if FinalAngle > 0 then
      self.YawDirection = 1
      if not self.ArrowRightLight then
        self.ArrowRightLight = true
        self.Arrow_Right:BindToAnimationFinished(self.Arrow_Right.VX_HightLight_Loop, function()
          EMUIAnimationSubsystem:EMPlayAnimation(self.Arrow_Right, self.Arrow_Right.VX_HightLight_Loop)
        end)
        EMUIAnimationSubsystem:EMPlayAnimation(self.Arrow_Right, self.Arrow_Right.VX_HightLight_Loop)
      end
    else
      self.YawDirection = -1
      if not self.ArrowLeftLight then
        self.ArrowLeftLight = true
        self.Arrow_Left:BindToAnimationFinished(self.Arrow_Left.VX_HightLight_Loop, function()
          EMUIAnimationSubsystem:EMPlayAnimation(self.Arrow_Left, self.Arrow_Left.VX_HightLight_Loop)
        end)
        EMUIAnimationSubsystem:EMPlayAnimation(self.Arrow_Left, self.Arrow_Left.VX_HightLight_Loop)
      end
    end
  else
    self.AutoMove = false
    self:StopAnimationLeftAndRight()
  end
  if PowTotalDeltaDis > self.PowLimit and (FinalAngle > -10 and FinalAngle < 10 or FinalAngle > -180 and FinalAngle < -170 or FinalAngle > 170 and FinalAngle < 180) then
    if FinalAngle > -10 and FinalAngle < 10 then
      if not self.ArrowUpBlack then
        self.ArrowUpBlack = true
        EMUIAnimationSubsystem:EMPlayAnimation(self.Arrow_Up, self.Arrow_Up.VX_Black)
      end
    elseif not self.ArrowDownBlack then
      self.ArrowDownBlack = true
      EMUIAnimationSubsystem:EMPlayAnimation(self.Arrow_Down, self.Arrow_Down.VX_Black)
    end
  else
    self:StopAnimationUpAndDown()
  end
  self.LerpAlpha = 0
  if not self.ControlMoveTimer then
    self.ControlMoveTimer = self:AddTimer(0.01, self.LerpSetCharacterPitchAndYawInput, true, 0, "LerpSetAmmoBarPercentTimer", false, 0.01667)
  end
end

function WBP_Battle_Fort_M_C:LerpSetCharacterPitchAndYawInput(DeltaTime)
  self.LerpAlpha = self.LerpAlpha + self.ChangeSpeed * DeltaTime
  if self.LerpAlpha >= 1 then
    self.LerpAlpha = 1
    if self.AutoMove then
      self.OwnerPlayer:AddCharacterYawInput(self.YawDirection * self.YawRotateSpeed * DeltaTime)
      return
    else
      self:RemoveTimer(self.ControlMoveTimer)
      self.ControlMoveTimer = nil
      return
    end
  end
  self.OwnerPlayer:AddCharacterPitchInput(self.AddPitch)
  if self.AutoMove then
    self.OwnerPlayer:AddCharacterYawInput(self.YawDirection * self.YawRotateSpeed * DeltaTime)
  else
    self.OwnerPlayer:AddCharacterYawInput(self.AddYaw)
  end
end

function WBP_Battle_Fort_M_C:ButtonUp(Index, StartPos)
  self.Joystick:SetRenderOpacity(self.Noraml)
  self.Joystick_Border:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:StopAnimationUpAndDown()
  self:StopAnimationLeftAndRight()
  if self.ControlMoveTimer then
    self:RemoveTimer(self.ControlMoveTimer)
    self.ControlMoveTimer = nil
  end
end

function WBP_Battle_Fort_M_C:CalcFinalAngle(LastPos)
  local DirectionVec = FVector2D(LastPos.X, -LastPos.Y)
  DirectionVec:Normalize()
  local SinValue = DirectionVec.X / 1.0
  local Angle, FinalAngle = math.asin(SinValue) / math.pi, 0
  if DirectionVec.Y < 0 then
    if DirectionVec.X < 0 then
      FinalAngle = -180 - Angle * 180
    else
      FinalAngle = 180 - Angle * 180
    end
  else
    FinalAngle = Angle * 180
  end
  return FinalAngle
end

function WBP_Battle_Fort_M_C:StopAnimationUpAndDown()
  if self.ArrowUpBlack then
    self.ArrowUpBlack = false
    EMUIAnimationSubsystem:EMPlayAnimation(self.Arrow_Up, self.Arrow_Up.VX_Normal)
  end
  if self.ArrowDownBlack then
    self.ArrowDownBlack = false
    EMUIAnimationSubsystem:EMPlayAnimation(self.Arrow_Down, self.Arrow_Down.VX_Normal)
  end
end

function WBP_Battle_Fort_M_C:StopAnimationLeftAndRight()
  if self.ArrowRightLight then
    self.ArrowRightLight = false
    self.Arrow_Right:UnbindAllFromAnimationFinished(self.Arrow_Right.VX_HightLight_Loop)
    EMUIAnimationSubsystem:EMStopAnimation(self.Arrow_Right, self.Arrow_Right.VX_HightLight_Loop)
    EMUIAnimationSubsystem:EMPlayAnimation(self.Arrow_Right, self.Arrow_Right.VX_Normal)
  end
  if self.ArrowLeftLight then
    self.ArrowLeftLight = false
    self.Arrow_Left:UnbindAllFromAnimationFinished(self.Arrow_Left.VX_HightLight_Loop)
    EMUIAnimationSubsystem:EMStopAnimation(self.Arrow_Left, self.Arrow_Left.VX_HightLight_Loop)
    EMUIAnimationSubsystem:EMPlayAnimation(self.Arrow_Left, self.Arrow_Left.VX_Normal)
  end
end

function WBP_Battle_Fort_M_C:InitJoyStick()
  self.Joystick:SetRenderOpacity(self.Noraml)
  self.Joystick_Border:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function WBP_Battle_Fort_M_C:InitFortBackKey(FortBackKey)
  FortBackKey.Btn_Exit:SetText(GText("UI_Mechanism_ExitPaotai"))
  FortBackKey.Btn_Exit:BindEventOnClicked(self, self.OnPressQuit)
end

function WBP_Battle_Fort_M_C:HideSelf(IsHide)
  local AllChildrend = self.Main:GetAllChildren()
  local Length = AllChildrend:Length()
  for i = 1, Length do
    local Widget = AllChildrend:GetRef(i)
    if Widget ~= self.Node_Activity then
      if IsHide then
        Widget:SetVisibility(UIConst.VisibilityOp.Collapsed)
      else
        Widget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
    end
  end
end

AssembleComponents(WBP_Battle_Fort_M_C)
return WBP_Battle_Fort_M_C
