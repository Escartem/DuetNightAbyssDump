require("UnLua")
local WBP_Common_Dialog_Text01_PC_C = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")
local Rule = FSlateChildSize()
Rule.SizeRule = UE.ESlateSizeRule.Fill
Rule.Value = 1.0

function WBP_Common_Dialog_Text01_PC_C:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  local Text
  if PopupData and not Text then
    Text = PopupData.PopoverText
  end
  if Params and Params.ShortText then
    Text = Params.ShortText
  end
  if nil == Text then
    return
  end
  if Params and Params.ShortTextParams then
    self.Text_Details:SetText(string.format(GText(Text), table.unpack(Params.ShortTextParams)))
    return
  end
  self.Text_Details:SetText(GText(Text))
  local ListSlot = UE4.UWidgetLayoutLibrary.SlotAsVerticalBoxSlot(self)
  ListSlot:SetSize(Rule)
end

return WBP_Common_Dialog_Text01_PC_C
