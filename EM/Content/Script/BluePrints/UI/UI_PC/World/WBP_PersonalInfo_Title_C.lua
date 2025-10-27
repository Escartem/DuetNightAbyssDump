require("UnLua")
require("DataMgr")
local PersonalTitleUtils = require("Utils.PersonalTitleUtils")
local WBP_PersonalInfo_Title_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_PersonalInfo_Title_C:SetTitleContent(PrefixId, SuffixId)
  local TitleContent = PersonalTitleUtils.GetTitleContent(PrefixId, SuffixId)
  self.Text_Title:SetText(TitleContent)
end

function WBP_PersonalInfo_Title_C:SetEmpty()
  self.Text_Title:SetText("\226\128\148 \226\128\148")
end

return WBP_PersonalInfo_Title_C
