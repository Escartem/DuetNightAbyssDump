require("UnLua")
local WBP_GuideTextFloatList_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_GuideTextFloatList_C:close()
  if 0 == self.List_Float:GetChildrenCount() then
    UE4.UUIStateAsyncActionBase.ResetGuideTextFloatIndex()
    UIManager(self):UnLoadUI(UE4.UUIStateAsyncActionBase.GetGuideTextFloatListKey())
  else
    self:SetTitle(self.List_Float:GetChildAt(self.List_Float:GetChildrenCount() - 1).Text_Title:GetText())
  end
end

function WBP_GuideTextFloatList_C:SetTitle(title)
  self.Text_Title:SetText(title)
end

return WBP_GuideTextFloatList_C
