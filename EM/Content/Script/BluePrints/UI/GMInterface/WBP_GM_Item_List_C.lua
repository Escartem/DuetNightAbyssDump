require("UnLua")
local WBP_GM_Item_List_C = Class("BluePrints.UI.GMInterface.WBP_GM_Item_Base_C")

function WBP_GM_Item_List_C:SetItem()
  self.Super.SetItem(self)
end

function WBP_GM_Item_List_C:Exec(...)
  self.Super.Exec(self, ...)
end

function WBP_GM_Item_List_C:BndEvt__GM_Item_List_Button_Exec_K2Node_ComponentBoundEvent_2_OnButtonPressedEvent__DelegateSignature()
  self.Super.Exec(self)
end

return WBP_GM_Item_List_C
