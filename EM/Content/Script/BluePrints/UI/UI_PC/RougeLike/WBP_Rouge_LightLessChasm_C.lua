require("UnLua")
local WBP_Rouge_LightLessChasm_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Rouge_LightLessChasm_C:Construct()
end

function WBP_Rouge_LightLessChasm_C:SetInfo(Info)
  self.Text_Title:SetText(GText(Info.MainTitle))
  if Info.SubTitle then
    self.Text_SubTitle:SetText(GText(Info.SubTitle))
    self.VerticalBox_0:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.VerticalBox_0:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

return WBP_Rouge_LightLessChasm_C
