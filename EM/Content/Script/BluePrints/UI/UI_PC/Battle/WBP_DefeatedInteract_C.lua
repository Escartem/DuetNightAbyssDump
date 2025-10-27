require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Initialize(Initializer)
  self.Super.Initialize(self, Initializer)
  self.BoardSize = FVector2D(30, 30)
  self.ScreenLocation = FVector2D(0, 0)
  self.TargetWorldLoc = FVector(0, 0, 0)
end

function M:Construct()
  self.Super.Construct(self)
  self.Btn_KeyClick.OnClicked:Add(self, self.OnClick)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  local IsGamePad = GameInputModeSubsystem and GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
  self.Text_Key:SetText(CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("Interactive", IsGamePad)))
  self.Key_Execute:SetVisibility(IsGamePad and ESlateVisibility.HitTestInvisible or ESlateVisibility.Collapsed)
  self.Text_Key:SetVisibility(IsGamePad and ESlateVisibility.Collapsed or ESlateVisibility.HitTestInvisible)
  self.Key_Execute:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("Interactive", IsGamePad))
      }
    },
    bLongPress = false
  })
  self:SetKeyMap(true)
  self.Constructing = true
  self:StopAllAnimations()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  local ViewportSize = UIManager:GetViewportSize()
  self.DesignedSize = FVector2D(0.846 * ViewportSize.X / 2, 0.864 * ViewportSize.Y / 2)
  self.CenterPos = FVector2D(ViewportSize.X / 2, ViewportSize.Y / 2)
  self.Panel_Execute:SetVisibility(ESlateVisibility.HitTestInvisible)
  self.Panel_Execute:SetRenderOpacity(1)
  self.VX:SetRenderOpacity(1)
  self.Constructing = false
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  local IsGamePad = GameInputModeSubsystem and GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad
  self.Text_Key:SetText(CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("Interactive", IsGamePad)))
  self.Key_Execute:SetVisibility(IsGamePad and ESlateVisibility.HitTestInvisible or ESlateVisibility.Collapsed)
  self.Text_Key:SetVisibility(IsGamePad and ESlateVisibility.Collapsed or ESlateVisibility.HitTestInvisible)
  self.Key_Execute:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("Interactive", IsGamePad))
      }
    },
    bLongPress = false
  })
end

function M:InitDefeatedCharacter(InCharacter)
  self:PlayAnimation(self.In)
  self.DefeatedCharacter = InCharacter
  self.SFX_ActorSrc = InCharacter
  self.MainPlayer = UGameplayStatics.GetPlayerCameraManager(self, 0)
  self.InteractiveComponent = self.DefeatedCharacter.PenalizeInteractiveComponent
  self.ScreenLocation = FVector2D(0, 0)
  self.TargetWorldLoc = FVector(0, 0, 0)
  self:InitTextExecuteDesc()
  self:ChangeUIDefeatedState(self.InteractiveComponent.IsDisPlayBtn)
  self:TryShowPhoneUI(true)
  self.Group_Key:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Distance:SetVisibility(ESlateVisibility.HitTestInvisible)
  self.PlayerController = UGameplayStatics.GetPlayerController(self, 0)
  self.LastTN = self.DefeatedCharacter:GetAttr("TN")
  self:AddDispatcher(EventID.UpdateBossToughness, self, self.OnTNChanged)
end

function M:OnTNChanged()
  if not IsValid(self.DefeatedCharacter) then
    return
  end
  local RecoverSpeed = self.DefeatedCharacter:GetAttr("BossTNToZeroRecoverSpeed")
  if RecoverSpeed and RecoverSpeed > 0 then
    local TN = self.DefeatedCharacter:GetAttr("TN")
    local MaxTN = self.DefeatedCharacter:GetAttr("MaxTN")
    if TN > self.LastTN and MaxTN ~= TN and TN / MaxTN >= 0.7 and not self.MarkPlayLoop then
      self.MarkPlayLoop = true
      self:PlayAnimation(self.Loop, 0, 0, 0, 1, true)
      if self.PhoneExecute then
        if not self.PhoneExecute.IsPlayBan then
          self.PhoneExecute:PlayAnimation(self.PhoneExecute.Loop, 0, 0, 0, 1, true)
        else
          self.PhoneExecute:StopAnimation(self.PhoneExecute.Loop)
        end
      end
    end
    self.LastTN = TN
  end
end

function M:Tick(MyGeometry, InDeltaTime)
  if not (IsValid(self.DefeatedCharacter) and IsValid(self.MainPlayer) and IsValid(self.InteractiveComponent)) or not IsValid(self.PlayerController) then
    self:Close()
    return
  end
  if self.MarkLoopOut and InDeltaTime >= math.abs(self.Loop:GetEndTime() - self:GetAnimationCurrentTime(self.Loop)) then
    self.MarkLoopOut = false
    self.MarkPlayLoop = false
  end
  local ModelData = DataMgr.Model[self.DefeatedCharacter.ModelId]
  if ModelData and ModelData.PenalizeParam and self.DefeatedCharacter.PenalizeInteractiveComponent then
    self.TargetWorldLoc = self.DefeatedCharacter.PenalizeInteractiveComponent:K2_GetComponentLocation()
  else
    self.TargetWorldLoc = self.DefeatedCharacter:K2_GetActorLocation()
    self.TargetWorldLoc.Z = self.TargetWorldLoc.Z + 50
  end
  self.ViewPortScale = UWidgetLayoutLibrary.GetViewportScale(self)
  local IndicatorAngle, TargetDistance, IsOutElliptic = UE4.UUIFunctionLibrary.ProjectWorldToScreenInEllipse(self.PlayerController, self.TargetWorldLoc, self.ScreenLocation, self.CenterPos, self.DesignedSize, self.BoardSize, 0, 0, false)
  self.ScreenLocation = self.ScreenLocation / self.ViewPortScale
  if IsOutElliptic then
    self.Common_Arrows:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Common_Arrows:SetRenderTransformAngle(IndicatorAngle + 90)
    self.VX:SetVisibility(ESlateVisibility.Collapsed)
    self.Icon_GuideExecute:SetVisibility(ESlateVisibility.HitTestInvisible)
  else
    self.Common_Arrows:SetVisibility(ESlateVisibility.Collapsed)
    self.VX:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Icon_GuideExecute:SetVisibility(ESlateVisibility.Collapsed)
    if not self.bCanExecute then
      self.Text_Distance:SetVisibility(ESlateVisibility.HitTestInvisible)
    end
  end
  self.Panel_Execute.Slot:SetPosition(self.ScreenLocation)
  self.Text_Distance:SetText(string.format("%.0f", TargetDistance) .. GText("UI_SCALE_METER"))
  self:RefreshTextDistanceVisibility()
end

function M:SetKeyMap(IsSet)
  if IsSet == self.IsSetedKeyMap then
    return
  end
  self.IsSetedKeyMap = IsSet
  if IsSet then
    self:ListenForInputAction("Interactive", EInputEvent.IE_Pressed, true, {
      self,
      self.PressedSelectAction
    })
    self:ListenForInputAction("Interactive", EInputEvent.IE_Released, true, {
      self,
      self.ReleasedSelectAction
    })
  else
    self:StopListeningForAllInputActions()
  end
end

function M:OnClick()
  self:PressedSelectAction()
  self:ReleasedSelectAction()
end

function M:RefreshTextDistanceVisibility()
  local PenalizeText = self.DefeatedCharacter and self.DefeatedCharacter.UnitId and DataMgr.Monster[self.DefeatedCharacter.UnitId].BossPenalize.PenalizeText
  if PenalizeText and self.DefeatedCharacter:GetAttr("Hp") <= 0 and self.bCanExecute then
    self.Group_ExecuteDesc:SetVisibility(ESlateVisibility.HitTestInvisible)
    if self.PhoneGroupExecuteDesc then
      self.PhoneGroupExecuteDesc:SetVisibility(ESlateVisibility.HitTestInvisible)
    end
  else
    self.Group_ExecuteDesc:SetVisibility(ESlateVisibility.Collapsed)
    if self.PhoneGroupExecuteDesc then
      self.PhoneGroupExecuteDesc:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function M:ChangeUIDefeatedState(bCanExecute)
  if self.bCanExecute == bCanExecute then
    return
  end
  self.bCanExecute = bCanExecute
  if bCanExecute then
    if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
      self.Group_Key:SetVisibility(ESlateVisibility.HitTestInvisible)
    end
    self.Text_Distance:SetVisibility(ESlateVisibility.Collapsed)
    self:PlayAnimation(self.F_In)
  else
    self.Group_Key:SetVisibility(ESlateVisibility.Collapsed)
    self.Icon_GuideExecute:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Text_Distance:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
end

function M:InitTextExecuteDesc()
  local PenalizeText = DataMgr.Monster[self.DefeatedCharacter.UnitId].BossPenalize.PenalizeText
  if PenalizeText then
    self.Text_ExecuteDesc:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Text_ExecuteDesc:SetText(GText(PenalizeText))
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    return
  end
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if not BattleMainUI or not BattleMainUI.Char_Skill then
    return
  end
  local Execute = BattleMainUI.Char_Skill.Execute
  local Group_ExecuteDesc = Execute.Group_ExecuteDesc
  self.PhoneExecute = Execute
  if PenalizeText then
    Group_ExecuteDesc:SetVisibility(ESlateVisibility.HitTestInvisible)
    Execute.Text_ExecuteDesc:SetVisibility(ESlateVisibility.HitTestInvisible)
    Execute.Text_ExecuteDesc:SetText(GText(PenalizeText))
    self.PhoneGroupExecuteDesc = Group_ExecuteDesc
    self.PhoneExecute = Execute
  else
    Group_ExecuteDesc:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:TryShowPhoneUI(bShow)
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    return
  end
  local BattleMainUI = UIManager(self):GetUIObj("BattleMain")
  if not BattleMainUI or not BattleMainUI.Char_Skill then
    return
  end
  local Execute = BattleMainUI.Char_Skill.Execute
  Execute:SetVisibility(UE4.ESlateVisibility.Visible)
  if bShow then
    Execute:Show()
    self:SetVisibility(ESlateVisibility.Collapsed)
  else
    Execute:Hide()
    self:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
end

function M:PressedSelectAction()
  if not IsValid(self.InteractiveComponent) or not self.bCanExecute then
    return
  end
  self.Pressed = true
  self.InteractiveComponent:BtnPressed(UE4.UGameplayStatics.GetPlayerCharacter(self, 0))
  self.Group_Key:SetVisibility(ESlateVisibility.Collapsed)
end

function M:ReleasedSelectAction()
  if not IsValid(self.InteractiveComponent) or not self.Pressed then
    return
  end
  self.InteractiveComponent:BtnReleased(UE4.UGameplayStatics.GetPlayerCharacter(self, 0))
  self.Pressed = false
end

function M:OnAnimationFinished(Animation)
  if self.Constructing then
    return
  end
  if Animation == self.In then
  elseif (Animation == self.Press or Animation == self.out) and not self:IsAnimationPlaying(self.In) then
    self:Close()
  end
end

function M:Close()
  self.MarkLoopOut = false
  self.MarkPlayLoop = false
  self:TryShowPhoneUI(false)
  self.Super.Close(self)
end

return M
