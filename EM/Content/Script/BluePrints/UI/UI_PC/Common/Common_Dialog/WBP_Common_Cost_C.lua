require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:InitContent(Params)
  self.Group_Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.IsGamePadIconVisible = true
  if Params.IsGamePadIconVisible == false then
    self.IsGamePadIconVisible = false
  end
  self.Btn_Cost.OnPressed:Add(self, function()
    self.Common_Item_Icon:OnMouseButtonDown()
  end)
  self.Btn_Cost.OnReleased:Add(self, function()
    self.Common_Item_Icon:OnMouseButtonUp()
  end)
  self.Btn_Cost.OnHovered:Add(self, function()
    self.Common_Item_Icon:OnMouseEnter()
  end)
  self.Btn_Cost.OnUnhovered:Add(self, function()
    self.Common_Item_Icon:OnMouseLeave()
  end)
  self.Common_Item_Icon:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Owner = Params.Owner
  local Resource = DataMgr.Resource[Params.ResourceId]
  local Icon = LoadObject(Resource.Icon)
  self.Common_Item_Icon:Init({
    Id = Params.ResourceId,
    Icon = Icon,
    ItemType = "Resource",
    UIName = "CommonDialog",
    IsShowDetails = Params.IsShowDetails == nil and true or Params.IsShowDetails,
    IsCantItemSelection = true,
    MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
    HandleMouseDown = Params.HandleMouseDown,
    HandleKeyDown = false,
    NotInteractive = Params.NotInteractive
  })
  self.Text_Possess:SetText(FormatNumber(Params.Numerator, false))
  if Params.bShowDenominator then
    self.Group_Expend:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_Expend:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Text_Expend:SetText(FormatNumber(Params.Denominator, false))
  else
    self.Group_Expend:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if Params.CostText then
    self.Text_CostTitle:SetText(Params.CostText)
    self.Text_CostTitle:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Text_CostTitle:SetVisibility(ESlateVisibility.Collapsed)
  end
  if Params.Denominator and Params.Numerator < Params.Denominator then
    self.Text_Possess:SetColorAndOpacity(self.UnEnoughColor)
  else
    self.Text_Possess:SetColorAndOpacity(self.NormalColor)
  end
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
  self.Common_Item_Icon.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.ItemMenuAnchorChanged)
  self:InitConfig()
  self:InitGamePad(Params.KeyIconName)
  self.IsOpen = false
end

function M:OpenTip()
  self.Common_Item_Icon:OnMouseButtonUp()
  self.OpenByKey = true
end

function M:SetPossess(PossessNum)
  self.Text_Possess:SetText(PossessNum)
  if tonumber(self.Text_Possess:GetText()) < tonumber(self.Text_Expend:GetText()) then
    self.Text_Possess:SetColorAndOpacity(self.UnEnoughColor)
  else
    self.Text_Possess:SetColorAndOpacity(self.NormalColor)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  self.Group_Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
  local IsGamepad = UIUtils.IsGamepadInput()
  if IsGamepad and self.IsGamePadIconVisible then
    self.Group_Controller:SetVisibility(UIConst.VisibilityOp.Visible)
  else
  end
end

function M:SetCost(Cost, Possess)
  self.Text_Expend:SetText(Cost)
  if Possess then
    self.Text_Possess:SetText(Possess)
  end
  if tonumber(self.Text_Possess:GetText()) < tonumber(self.Text_Expend:GetText()) then
    self.Text_Possess:SetColorAndOpacity(self.UnEnoughColor)
  else
    self.Text_Possess:SetColorAndOpacity(self.NormalColor)
  end
end

function M:SetIsEnough(bIsEnough)
  if bIsEnough then
    self.Text_Possess:SetColorAndOpacity(self.NormalColor)
  else
    self.Text_Possess:SetColorAndOpacity(self.UnEnoughColor)
  end
end

function M:InitGamePad(KeyIconName)
  KeyIconName = KeyIconName or "LS"
  local ImgPath = UIUtils.UtilsGetKeyIconPathInGamepad(KeyIconName, self.CurGamepadName)
  self.Key:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgLongPath = ImgPath}
    }
  })
end

function M:InitConfig()
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
end

function M:RefreshIconAndGamePadVisibility()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:SwitchToGamePad()
  else
    self:SwitchToPC()
  end
end

function M:SwitchToPC()
  self.Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:SwitchToGamePad()
  self.Key:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:OnkeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if not UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) or "Gamepad_FaceButton_Bottom" == InKeyName then
  elseif "Gamepad_FaceButton_Right" == InKeyName then
  end
  return IsEventHandled
end

function M:OpenTipsBindEvents(Widget)
  local Events = {}
  Events.OnMenuOpenChanged = self.ItemMenuAnchorChanged
  Widget:BindEvents(self, Events)
end

function M:ItemMenuAnchorChanged(IsOpen)
  self.IsOpen = IsOpen
  if not IsOpen and self.OpenByKey then
    self.Common_Item_Icon:PlayAnimation(self.Common_Item_Icon.Normal)
    self.OpenByKey = false
  end
end

function M:IsTipOpen()
  return self.IsOpen
end

function M:Handle_KeyEventOnGamePad(InKeyName)
  local IsEventHandled = false
  if "Gamepad_RightStick_Right" == InKeyName then
    self.Common_Item_Icon:OnMouseButtonUp()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:Destruct()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:Activate()
  self.Common_Item_Icon:OnMouseButtonUp()
end

function M:InActivate()
  self.Common_Item_Icon:OnMouseLeave()
end

function M:SetGamePadIconVisible(IsVisible)
  self.IsGamePadIconVisible = IsVisible
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
end

return M
