require("UnLua")
local WBP_GM_Tips_Item_Common_C = Class("BluePrints.UI.GMInterface.WBP_GM_Item_Base_C")

function WBP_GM_Tips_Item_Common_C:SetItem()
  self.Super.SetItem(self)
  if self.Command.Mode == "edit" then
    if self.Command.Parameters:Length() <= 0 or self.Command.Parameters[1] == "" then
      self.EditText_Para:SetText("")
    else
      self.EditText_Para:SetText(self.Command.Parameters[1])
    end
  end
end

function WBP_GM_Tips_Item_Common_C:Exec()
  self.Super.Exec(self)
end

function WBP_GM_Tips_Item_Common_C:BndEvt__GM_Tips_Item_Common_EditableTextBox_Input_K2Node_ComponentBoundEvent_1_OnEditableTextBoxCommittedEvent__DelegateSignature(Text, CommitMethod)
  if CommitMethod == ETextCommit.OnEnter then
    self.Super.Exec(self)
  end
end

function WBP_GM_Tips_Item_Common_C:BndEvt__GM_Tips_Item_Common_Button_102_K2Node_ComponentBoundEvent_3_OnButtonPressedEvent__DelegateSignature()
  self.Super.Exec(self)
end

return WBP_GM_Tips_Item_Common_C
