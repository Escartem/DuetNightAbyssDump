require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Init()
  self.Key:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("Interactive"))
      }
    }
  })
  self.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = UIUtils.GetIconListByActionName("Interactive")[1]
      }
    }
  })
  self.bInScreen = false
  self.ScreenLocation = FVector2D(0, 0)
  self.CacheScreenPos = FVector2D(0, 0)
  self.TargetWorldLoc = FVector(0, 0, 0)
  self.CurrentWorldLoc = FVector(0, 0, 0)
  self.CenterPos = FVector2D(0, 0)
  self.OvalSize = FVector2D(0, 0)
  self.BoardSize = FVector2D(30, 30)
  self.CurrentOffsetOnDoor = 0
  self.OffsetLerpInterval = 0
  self.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile"
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self:OnUpdateUIStyleByInputTypeChange(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:UpdateOwner(Hook, HookComp, PlayerActor)
  if not self:IsListeningForInputAction("Interactive") then
    self:ListenForInputAction("Interactive", EInputEvent.IE_Pressed, true, {
      self,
      self.PressedSelectAction
    })
    self:ListenForInputAction("Interactive", EInputEvent.IE_Released, true, {
      self,
      self.ReleasedSelectAction
    })
  end
  self.Hook = Hook
  self.HookComp = HookComp
  self.Player = PlayerActor
end

function M:PressedSelectAction()
  print(_G.LogTag, "LXZ PressedSelectAction")
  if not self.bInScreen then
    return
  end
  self.HookComp:StartInteractive(self.Player)
end

function M:ReleasedSelectAction()
  print(_G.LogTag, "LXZ ReleasedSelectAction")
end

function M:ReleasedSpace()
  print(_G.LogTag, "LXZ ReleasedSpace")
  self.HookComp:EndInteractive(self.Player)
end

function M:RefreshKeyLoc(FXLocComp)
  local ViewportSize = UIManager(self):GetViewportSize()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.CenterPos.X, self.CenterPos.Y = ViewportSize.X * 0.5, ViewportSize.Y * 0.463
    self.OvalSize.X, self.OvalSize.Y = 0.6 * ViewportSize.X * 0.5, 0.55 * ViewportSize.Y * 0.5
  elseif CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.CenterPos.X, self.CenterPos.Y = ViewportSize.X * 0.5, ViewportSize.Y * 0.4723
    self.OvalSize.X, self.OvalSize.Y = 0.62 * ViewportSize.X * 0.5, 0.532 * ViewportSize.Y * 0.5
  end
  local Loc = FXLocComp:K2_GetComponentLocation()
  local Controller = UGameplayStatics.GetPlayerController(self, 0)
  local CurrentOffsetOnDoor, LocLerpFinished, IndicatorAngle, TargetDistance, CurrentDistance, IsOutElliptic, IsOutScreen = UUIFunctionLibrary.LerpAndProjectWorldToScreenInEllipse(Controller, Loc, Loc, 3, self.ScreenLocation, self.CenterPos, self.OvalSize, self.BoardSize, false, 0, self.CurrentOffsetOnDoor, self.OffsetLerpInterval, false, 0, 0, 0, false)
  if not IsOutElliptic then
    local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.WS_Type)
    local ViewPortScale = UWidgetLayoutLibrary.GetViewportScale(self)
    self.CacheScreenPos:Set(self.ScreenLocation.X / ViewPortScale, self.ScreenLocation.Y / ViewPortScale)
    CanvasSlot:SetPosition(self.CacheScreenPos)
    self.WS_Type:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.bInScreen = true
  else
    self.WS_Type:SetVisibility(ESlateVisibility.Collapsed)
    self.bInScreen = false
  end
end

function M:Close()
  M.Super.Close(self)
end

function M:Tick(MyGeometry, InDeltaTime)
  if IsValid(self.HookComp) then
    local Owner = self.HookComp:GetOwner()
    self:RefreshKeyLoc(Owner.FXLoc)
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.MouseAndKeyboard and self.DeviceInPc then
    self.WS_Type:SetActiveWidgetIndex(0)
  elseif CurInputDevice == ECommonInputType.Gamepad and self.DeviceInPc then
    self.WS_Type:SetActiveWidgetIndex(1)
  elseif CurInputDevice == ECommonInputType.Touch then
  end
end

return M
