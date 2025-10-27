require("UnLua")
local EMCache = require("EMCache.EMCache")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Initialize(Initializer)
  self.CircleLimitArea = 55
  self.LocalTurnSpeed_Horizontal = 4.5
  self.LocalTurnSpeed_Vertical = 2
  self.EdgeWidth = 60
  self.LerpTime = 1.5
  self.YawRotateSpeed = 30
  self.BtnHoldCD = 3
end

function M:Tick(MyGeometry, InDeltaTime)
  if self.AutoYawRotate then
    local YawSpeed = self.YawRotateSpeed
    if self.YawDirection < 0 then
      YawSpeed = -self.YawRotateSpeed
    end
    if self.PassedTime < self.LerpTime then
      self.PassedTime = self.PassedTime + InDeltaTime
      local Alpha = self.PassedTime / self.LerpTime
      Alpha = math.clamp(Alpha, 0, 1)
      YawSpeed = UE4.UKismetMathLibrary.Ease(self.LastYawSpeed, YawSpeed, Alpha, UE4.EEasingFunc.EaseOut)
    end
    self.OwnerPlayer:AddControllerYawInput(YawSpeed * InDeltaTime)
  end
end

function M.ButtonFireDown(Battle_Button_Phone, Index, StartPos)
  local FireBtn = Battle_Button_Phone.Btn_Shoot
  FireBtn.LockShooting = EMCache:Get("LongPressLockShooting")
  if FireBtn.LockShooting then
    FireBtn.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(FireBtn)
  end
  FireBtn.IsFireDown = true
  FireBtn.OwnerPanel:TryToPlayTargetCommand("Fire", true)
  FireBtn.ViewPortSize = UWidgetLayoutLibrary.GetViewportSize(Battle_Button_Phone)
  if not EMUIAnimationSubsystem:EMAnimationIsPlaying(FireBtn, FireBtn.Press) then
    EMUIAnimationSubsystem:EMPlayAnimation(FireBtn, FireBtn.Press)
    FireBtn.Joystick:SetRenderOpacity(1.0)
    FireBtn.Joystick_Border:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M.ButtonFireMove(Battle_Button_Phone, TouchFingerCount, Index, LastPos, TotalDeltaDis, LastDeltaDis, TouchLocalPos)
  DebugPrint("ButtonFireMove")
  local FireBtn = Battle_Button_Phone.Btn_Shoot
  local WorldDeltaTime = UE4.UGameplayStatics.GetWorldDeltaSeconds(FireBtn)
  FireBtn.OwnerPlayer:AddCharacterPitchInput(-FireBtn.LocalTurnSpeed_Vertical * LastDeltaDis.Y * WorldDeltaTime)
  if TouchLocalPos.X > FireBtn.EdgeWidth and TouchLocalPos.X < FireBtn.ViewPortSize.X - FireBtn.EdgeWidth then
    FireBtn.AutoYawRotate = false
    FireBtn.LastYawSpeed = FireBtn.LocalTurnSpeed_Horizontal * LastDeltaDis.X
    FireBtn.OwnerPlayer:AddCharacterYawInput(FireBtn.LastYawSpeed * WorldDeltaTime)
    FireBtn.PassedTime = 0
    FireBtn.YawDirection = TotalDeltaDis.X
  else
    FireBtn.AutoYawRotate = true
  end
  local FinalAngle = FireBtn:CalcFinalAngle(LastPos)
  FireBtn.Joystick_Border:SetRenderTransformAngle(FinalAngle)
end

function M.ButtonFireUp(Battle_Button_Phone, Index, WidgetLocalPos, LastWidgetTouchPos, EndTouchPos, TotalDeltaDis)
  local FireBtn = Battle_Button_Phone.Btn_Shoot
  if FireBtn.LockShooting and FireBtn.OwnerPlayer:CharacterInTag("Shooting") then
    FireBtn.CurrentTime = UE4.UGameplayStatics.GetRealTimeSeconds(FireBtn)
    if FireBtn.CurrentTime - FireBtn.StartTime > FireBtn.BtnHoldCD then
      FireBtn.IsLockingShoot = true
      return
    end
  end
  FireBtn.OwnerPanel:TryToStopTargetCommand("Fire", true)
  FireBtn.AutoYawRotate = false
  FireBtn.IsFireDown = false
  FireBtn.IsLockingShoot = false
  FireBtn.Joystick:SetRenderOpacity(0)
  FireBtn.Joystick_Border:SetVisibility(UIConst.VisibilityOp.Hidden)
  EMUIAnimationSubsystem:EMPlayAnimation(FireBtn, FireBtn.Click)
  FireBtn:AddTimer(FireBtn.Click:GetEndTime(), function()
    EMUIAnimationSubsystem:EMPlayAnimation(FireBtn, FireBtn.Normal)
  end)
end

function M:CalcFinalAngle(LastPos)
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

return M
