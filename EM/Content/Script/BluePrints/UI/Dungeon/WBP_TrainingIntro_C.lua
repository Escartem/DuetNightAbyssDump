require("UnLua")
local WBP_TrainingIntro_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_TrainingIntro_C:SetItem(Content)
  self.text_particulars:SetText(Content.text_skillname)
  self.text_skillname:SetText(Content.text_particulars)
end

return WBP_TrainingIntro_C
