require("UnLua")
local WBP_BattleMainPanel_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_BattleMainPanel_C:HideOrShowSubUIByName(IsHide, NeedHideListStr)
  local HideUITable = Split(NeedHideListStr, ",")
  if IsHide then
    for _, value in pairs(HideUITable) do
      self[value]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    for _, value in pairs(HideUITable) do
      self[value]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

return WBP_BattleMainPanel_C
