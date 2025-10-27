require("UnLua")
local WBP_JoyStick_C = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_JoyStick_C:Construct()
  self.Overridden.Construct(self)
  self:AddTimer(0.2, self.UpdateDirection, true, 0, "UpdateDirectionForTouch")
end

function WBP_JoyStick_C:SetPosition()
  local Controller = UGameplayStatics.GetPlayerController(self, 0)
  local TouchInterface = Controller.CurrentTouchInterface
  if not TouchInterface then
    return
  end
  self.ActiveOpacity = TouchInterface.ActiveOpacity
  self.InactiveOpacity = TouchInterface.InactiveOpacity
  self.NowOpacity = self.InactiveOpacity
  self.IsActiveNow = false
  self.IsHide = false
  self.VisibilityFromBattle = UIConst.VisibilityOp.Visible
  self.VisibilityFromSelf = UIConst.VisibilityOp.Visible
  UIManager(self):SetRealVirtualJoystickZOrder(6)
  UIManager(self):SetRealVirtualJoystickOpacity(self.NowOpacity, self.InactiveOpacity)
end

function WBP_JoyStick_C:SetOpacity(IsAvtive)
  if self.IsActiveNow ~= IsAvtive then
    if IsAvtive then
      self.NowOpacity = self.ActiveOpacity
    else
      self.NowOpacity = self.InactiveOpacity
    end
    local SetOpacity = UIManager(self):SetRealVirtualJoystickOpacity(self.NowOpacity, self.InactiveOpacity)
    if SetOpacity then
      self.IsActiveNow = IsAvtive
    end
  end
end

function WBP_JoyStick_C:SetTouchVisibilityFromBattle(InVisibility)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local Controller = UGameplayStatics.GetPlayerController(self, 0)
  self.VisibilityFromBattle = InVisibility
  if InVisibility == UIConst.VisibilityOp.Collapsed or InVisibility == UIConst.VisibilityOp.Hidden then
    self.IsHide = true
    DebugPrint("HY@ UIManagerComponent InActivateVirtualJoystick== Try to InActivate Joystick")
    if not UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
      UIManager:InActivateVirtualJoystick()
    end
    UIManager:SetRealVirtualJoystickOpacity(0, self.InactiveOpacity)
    Controller:SetVirtualJoystickVisibility(false)
  else
    self:SetTouchVisibility(self.VisibilityFromSelf)
  end
end

function WBP_JoyStick_C:SetTouchVisibility(InVisibility)
  self.VisibilityFromSelf = InVisibility
  if self.VisibilityFromBattle == UIConst.VisibilityOp.Collapsed or self.VisibilityFromBattle == UIConst.VisibilityOp.Hidden then
    return
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local Controller = UGameplayStatics.GetPlayerController(self, 0)
  if InVisibility == UIConst.VisibilityOp.Collapsed or InVisibility == UIConst.VisibilityOp.Hidden then
    self.IsHide = true
    if not UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
      UIManager:InActivateVirtualJoystick()
    end
    UIManager:SetRealVirtualJoystickOpacity(0, self.InactiveOpacity)
    Controller:SetVirtualJoystickVisibility(false)
    DebugPrint("HY@ UIManagerComponent InActivateVirtualJoystick== Try to InActivate Joystick")
  else
    self.IsHide = false
    if not UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
      UIManager:ActivateVirtualJoystick()
    end
    UIManager:SetRealVirtualJoystickZOrder(6)
    UIManager:SetRealVirtualJoystickOpacity(self.NowOpacity, self.InactiveOpacity)
    Controller:SetVirtualJoystickVisibility(true)
    DebugPrint("HY@ UIManagerComponent ActivateVirtualJoystick== Try to Activate Joystick")
  end
end

return WBP_JoyStick_C
