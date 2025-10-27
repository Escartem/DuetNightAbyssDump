require("UnLua")
local G = Class("BluePrints.UI.BP_EMUserWidget_C")

function G:OnListItemObjectSet(Obj)
  self.Obj = Obj
  self.Image_Line:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if Obj.GachaDes then
    self.Text_Desc:SetText(Obj.GachaDes)
  end
end

return G
