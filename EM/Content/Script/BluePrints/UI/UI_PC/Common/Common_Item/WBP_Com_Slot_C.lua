require("UnLua")
local WBP_Com_Item_Slot_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Com_Item_Slot_C:Init(Parmas)
  self.Parent = Parmas.Owner
end

function WBP_Com_Item_Slot_C:OnAddedToFocusPath()
  if self.Parent then
    self.Parent.Owner.CurFocusSlot = self.Parent
    self.Parent:OnFocusReceived()
  end
  return false
end

return WBP_Com_Item_Slot_C
