require("UnLua")
local WBP_Common_Dialog_Number_PC_C = Class()

function WBP_Common_Dialog_Number_PC_C:OnListItemObjectSet(Content)
  DebugPrint("Tianyi@ Content Value = " .. Content.Value)
  self.Text_Number:SetText(Content.Value)
end

return WBP_Common_Dialog_Number_PC_C
