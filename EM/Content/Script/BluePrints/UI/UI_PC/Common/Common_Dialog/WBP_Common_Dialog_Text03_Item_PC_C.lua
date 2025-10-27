require("UnLua")
local WBP_Common_Dialog_Text03_Item_PC_C = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function WBP_Common_Dialog_Text03_Item_PC_C:OnListItemObjectSet(Content)
  self.Text_Title:SetText(Content.Title)
  self.Text_Details:SetText(Content.Text)
  if Content.bShowLine then
    self.Image_Line:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Image_Line:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return WBP_Common_Dialog_Text03_Item_PC_C
