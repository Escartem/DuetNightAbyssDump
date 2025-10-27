require("UnLua")
local WBP_Common_Dialog_Text02_PC_C = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function WBP_Common_Dialog_Text02_PC_C:Construct()
  WBP_Common_Dialog_Text02_PC_C.Super.Construct(self)
  self.OriginJustfication = self.Text_Details.Justification
end

function WBP_Common_Dialog_Text02_PC_C:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  local Text
  if PopupData and not Text then
    Text = PopupData.PopoverText
  end
  if Params and Params.LongText then
    Text = Params.LongText
  end
  if Params and Params.bTextCenter then
    self.Text_Details:SetJustification(UE.ETextJustify.Center)
  else
    self.Text_Details:SetJustification(self.OriginJustfication)
  end
  if Text then
    self.Text_Details:SetText(GText(Text))
  end
  self:AddTimer(0.1, function()
    local ScrollBoxOffsetEnd = self.Scroll_Box:GetScrollOffsetOfEnd()
    if ScrollBoxOffsetEnd > 0 then
      self:ShowGamepadScrollBtn(true)
    else
      self:ShowGamepadScrollBtn(false)
    end
  end)
end

function WBP_Common_Dialog_Text02_PC_C:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightAnalogY then
    UIUtils.ScrollBoxByGamepad(self.Scroll_Box, InAnalogInputEvent)
  end
end

return WBP_Common_Dialog_Text02_PC_C
