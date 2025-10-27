require("unlua")
local WBP_Common_Dialog_Item_Currency_PC_C = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function WBP_Common_Dialog_Item_Currency_PC_C:PreInitContent(Params, PopupData, Owner)
  self.Super.PreInitContent(self, Params, PopupData, Owner)
  self:BindDialogEvent(DialogEvent.HideDialogItem, self.HideDialogItem)
  self:BindDialogEvent("UpdateFunds", self.Show_Funds)
end

function WBP_Common_Dialog_Item_Currency_PC_C:InitContent(Params, PopupData, Owner)
  self.Owner = Owner
  self.PosIndex = self.Owner:GetItemIndex()
  self.SupportLSFocus = Params and Params.SupportLSFocus or false
  self:Show_Funds(Params, PopupData)
end

function WBP_Common_Dialog_Item_Currency_PC_C:Show_Funds(Params, PopupData)
  if Params and Params.Funds then
    local Widgets = self.HB_Item:GetAllChildren()
    local WidgetCount = self.HB_Item:GetChildrenCount()
    local Avatar = GWorld:GetAvatar()
    for index, value in ipairs(Params.Funds) do
      local Widget = index <= WidgetCount and Widgets:GetRef(index)
      if not Widget then
        Widget = self:CreateWidgetNew("CommonDialogCurrency")
        self.HB_Item:AddChildToHorizontalBox(Widget)
      end
      if Widget then
        local InParams = {
          Denominator = value.FundNeed,
          CostText = value.CostText,
          CurrencyGamepadKey = Params.CurrencyGamepadKey,
          NoColor = value.NoColor
        }
        if value.PriceSign then
          InParams.PriceSign = value.PriceSign
        else
          local Resource = Avatar.Resources[value.FundId] or {Count = 0}
          InParams.Numerator = Resource.Count
          InParams.ResourceId = value.FundId
        end
        Widget:InitContent(InParams)
      end
    end
    if WidgetCount > #Params.Funds then
      for index = #Params.Funds + 1, WidgetCount do
        Widgets:GetRef(index):SetVisibility(UE.ESlateVisibility.Collapsed)
      end
    end
    self.Panel_Currency:SetVisibility(UE.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_Currency:SetVisibility(UE.ESlateVisibility.Collapsed)
  end
end

function WBP_Common_Dialog_Item_Currency_PC_C:HideDialogItem(Params, PopupData)
  if Params.DialogItemIndex == self.PosIndex then
    if Params.bHideDialogItem then
      self:SetVisibility(UE.ESlateVisibility.Collapsed)
    else
      self:SetVisibility(UE.ESlateVisibility.SelfHitTestInvisible)
    end
  end
  self.Owner:AutofitDialog()
end

function WBP_Common_Dialog_Item_Currency_PC_C:Focus2Currency(IsFocus)
  local IsFocusing = self:HasAnyFocus()
  if IsFocus and not IsFocusing then
    local Widget = self.HB_Item:GetChildAt(0)
    if Widget then
      Widget.bIsFocusable = true
      Widget:SetFocus()
    end
    self:BroadcastDialogEvent(DialogEvent.OnCurrencyItemSelected, IsFocus)
    return true
  elseif not IsFocus and IsFocusing then
    self.Owner:SetFocus()
    self:BroadcastDialogEvent(DialogEvent.OnCurrencyItemSelected, IsFocus)
    return true
  end
  return false
end

function WBP_Common_Dialog_Item_Currency_PC_C:OnContentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.SupportLSFocus then
    if InKeyName == Const.GamepadLeftThumbstick then
      return self:Focus2Currency(true)
    elseif InKeyName == Const.GamepadFaceButtonRight then
      return self:Focus2Currency(false)
    end
  end
  return false
end

return WBP_Common_Dialog_Item_Currency_PC_C
