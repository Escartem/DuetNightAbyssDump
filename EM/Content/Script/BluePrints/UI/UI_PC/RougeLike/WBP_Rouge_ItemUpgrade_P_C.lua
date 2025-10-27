local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local SkillUtils = require("Utils.SkillUtils")
local WBP_Rouge_ItemUpgrade_P_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Rouge_ItemUpgrade_P_C:Construct()
end

function WBP_Rouge_ItemUpgrade_P_C:OnLoaded(Params)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/get_award_update", nil, nil)
  self:SetFocus()
  self:PlayAnimation(self.In)
  self.Text_Title:SetText(GText("UI_RougeLike_BlessingUpgrade_Title"))
  self.Button_FullClose.OnClicked:Add(self, self.CloseSelf)
  self.Item_Before:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Item_Now:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Item_Before:OnLoaded({
    AwardType = "Blessing",
    AwardId = Params.ItemId,
    AwardLevel = Params.OldLevel - 1
  }, self, true)
  self.Item_Now:OnLoaded({
    AwardType = "Blessing",
    AwardId = Params.ItemId,
    AwardLevel = Params.NewLevel - 1
  }, self, true)
  self.Text_Tip:SetText(GText("UI_RougeLike_End__ClickEmpty"))
  self.Item_Before:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    self.SetRightNavigation
  })
  self.Item_Now:SetNavigationRuleCustom(EUINavigation.Left, {
    self,
    self.SetLeftNavigation
  })
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  self:AddInputMethodChangedListen()
end

function WBP_Rouge_ItemUpgrade_P_C:SetRightNavigation()
  return self.Item_Now
end

function WBP_Rouge_ItemUpgrade_P_C:SetLeftNavigation()
  return self.Item_Before
end

function WBP_Rouge_ItemUpgrade_P_C:CloseSelf()
  if self:IsPlayingAnimation(self.In) then
    return
  end
  local AnimObj = self:GetAnimationByName("Out")
  
  local function PlayAnimFinished()
    if GWorld.RougeLikeManager then
      GWorld.RougeLikeManager:ShowNextAward({})
    end
    self:Close()
  end
  
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:BindToAnimationFinished(AnimObj, {self, PlayAnimFinished})
  self:PlayAnimation(AnimObj)
  local UIState = UIManager(self):GetCurrentState()
  if UIState then
    UIState:SetFocus()
  end
  self:RemoveInputMethodChangedListen()
end

function WBP_Rouge_ItemUpgrade_P_C:AddInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_ItemUpgrade_P_C:RemoveInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_ItemUpgrade_P_C:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
    local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
    if "Gamepad_RightY" == InKeyName and self.CurrentSelectItem then
      UIUtils.ScrollBoxByGamepad(self.CurrentSelectItem.ScrollBox_Desc, InAnalogInputEvent)
    end
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Rouge_ItemUpgrade_P_C:InitGamepadView()
  self.Switch_Key:SetActiveWidgetIndex(1)
  self.SelectedIndex = 0
  self.Key03:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Item_Before:SetFocus()
  self.Item_Now.ScrollBox_Desc:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Item_Before.ScrollBox_Desc:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Key01:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RV"}
    },
    Desc = GText("UI_Controller_Slide")
  })
  self.Key02:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_Controller_Close")
  })
end

function WBP_Rouge_ItemUpgrade_P_C:RefreshOpInfoByInputDevice(CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  elseif CurInputType == ECommonInputType.MouseAndKeyboard then
    self:InitKeyboardView()
  end
end

function WBP_Rouge_ItemUpgrade_P_C:InitKeyboardView()
  self.Switch_Key:SetActiveWidgetIndex(0)
  self.Item_Now.ScrollBox_Desc:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Item_Before.ScrollBox_Desc:SetVisibility(UIConst.VisibilityOp.Visible)
end

function WBP_Rouge_ItemUpgrade_P_C:OnKeyDown(MyGeometry, InKeyEvent)
  local IsHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName or InKeyName == UIConst.GamePadKey.FaceButtonRight then
    IsHandled = true
    self:CloseSelf()
  end
  if IsHandled then
    return UIUtils.Handled
  else
    return UIUtils.Unhandled
  end
end

function WBP_Rouge_ItemUpgrade_P_C:OnItemSelected()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.CurrentSelectItem:SetNavigatePosAngle(0)
    self.CurrentSelectItem:SetNavigatePosOffsetPercent(UE4.FVector2D(0.5, -12))
    self.CurrentSelectItem:SetNavigatePosOffsetAlignment(UE4.FVector2D(0.5, 0.5))
    
    local function HideKeyTips()
      if not UIUtils.CheckScrollBoxCanScroll(self.CurrentSelectItem.ScrollBox_Desc) then
        self.Key01:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
    
    self:AddDelayFrameFunc(HideKeyTips, 2)
  end
end

return WBP_Rouge_ItemUpgrade_P_C
