require("UnLua")
local WBP_CommonDialogCurrency_PC_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_CommonDialogCurrency_PC_C:InitContent(Params)
  if Params.PriceSign then
    self.WS_PriceSign:SetActiveWidgetIndex(0)
  else
    self.WS_PriceSign:SetActiveWidgetIndex(1)
    local Resource = DataMgr.Resource[Params.ResourceId]
    local Icon = LoadObject(Resource.Icon)
    self.Common_Item_Icon:Init({
      Id = Params.ResourceId,
      Icon = Icon,
      ItemType = "Resource",
      UIName = "CommonDialog",
      IsShowDetails = true,
      IsCantItemSelection = true,
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight
    })
  end
  self.Text_Expend:SetText(Params.Denominator)
  if Params.bShowNumerator then
    self.TextBlock_3:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Text_Possess:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Text_Expend:SetText(Params.Denominator)
    self.Text_Possess:SetText(Params.Numerator)
  end
  if Params.CostText then
    self.Text_CostTitle:SetText(Params.CostText)
    self.Text_CostTitle:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Text_CostTitle:SetVisibility(ESlateVisibility.Collapsed)
  end
  if Params.NoColor then
    self.Text_Expend:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFF"))
  else
    if Params.Numerator >= Params.Denominator then
      self.Text_Expend:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("FFFFFF"))
    else
      self.Text_Expend:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DA2A4A"))
    end
    if Params.bShowNumerator then
      if Params.Numerator < Params.Denominator then
        self.Text_Expend:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("DA2A4A"))
      else
        self.Text_Expend:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToSlateColor("34A981"))
      end
    end
  end
  if Params.CurrencyGamepadKey then
    self.Key_GamePad:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = Params.CurrencyGamepadKey
        }
      }
    })
    self:InitInputSettings()
  end
end

function WBP_CommonDialogCurrency_PC_C:InitInputSettings()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
end

function WBP_CommonDialogCurrency_PC_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  if self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  elseif self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return WBP_CommonDialogCurrency_PC_C
