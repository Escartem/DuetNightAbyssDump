require("UnLua")
local WBP_GM_Tips_Item_Monster_C = Class("BluePrints.UI.GMInterface.WBP_GM_Item_Base_C")

function WBP_GM_Tips_Item_Monster_C:SetItem()
  self.Super.SetItem(self)
  if self.Command.Mode == "edit" then
    self.Text_Name_Para:SetText(self.Command.Text)
    if self.Command.Parameters:Length() >= 2 then
      self.EditText_Para:SetText(self.Command.Parameters[2])
    end
  end
end

function WBP_GM_Tips_Item_Monster_C:Exec()
  self.Super.Exec(self)
end

function WBP_GM_Tips_Item_Monster_C:BndEvt__GM_Tips_Item_Msonster_EditText_Para_K2Node_ComponentBoundEvent_1_OnEditableTextCommittedEvent__DelegateSignature(Text, CommitMethod)
  if CommitMethod == ETextCommit.OnEnter then
    self.Super.Exec(self)
  end
end

function WBP_GM_Tips_Item_Monster_C:BndEvt__GM_Tips_Item_Monster_Button_108_K2Node_ComponentBoundEvent_3_OnButtonPressedEvent__DelegateSignature()
  self.Super.Exec(self)
end

return WBP_GM_Tips_Item_Monster_C
