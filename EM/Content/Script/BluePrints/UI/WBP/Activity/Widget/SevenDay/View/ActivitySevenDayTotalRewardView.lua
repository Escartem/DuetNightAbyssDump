require("UnLua")
local EnumPlayerSignRewardState = require("Blueprints.UI.WBP.Activity.ActivityUtils").EnumPlayerSignRewardState
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:InitRewardInfo(PageConfigData, ParentWidget)
  local AllDays = PageConfigData.LoginDuration
  for i = 1, AllDays do
    if i == AllDays then
      local SpRewardWidget = self.HighItem
      SpRewardWidget:InitSpecialReward(i, {
        ActivityId = PageConfigData.EventId,
        RewardId = PageConfigData.EventReward[i],
        CharId = PageConfigData.CharInfo
      }, ParentWidget)
    else
      local NorRewardWidget = self["LowItem_" .. i]
      NorRewardWidget:InitNormalReward(i, {
        ActivityId = PageConfigData.EventId,
        RewardId = PageConfigData.EventReward[i]
      }, ParentWidget)
    end
  end
  self.AllDays = AllDays
  self.LowItem_1:SetNavigationRuleCustom(EUINavigation.Left, {
    ParentWidget,
    ParentWidget.LeaveRewardViewMode
  })
  self.LowItem_4:SetNavigationRuleCustom(EUINavigation.Left, {
    ParentWidget,
    ParentWidget.LeaveRewardViewMode
  })
end

function M:BP_GetDesiredFocusTarget()
  local NeedFocusWidget
  for i = 1, self.AllDays do
    local RewardWidget = i == self.AllDays and self.HighItem or self["LowItem_" .. i]
    if RewardWidget:GetRewardState() == EnumPlayerSignRewardState.SignedNotRecv then
      NeedFocusWidget = RewardWidget
      break
    end
  end
  if nil == NeedFocusWidget then
    for i = 1, self.AllDays do
      local RewardWidget = i == self.AllDays and self.HighItem or self["LowItem_" .. i]
      if RewardWidget:GetRewardState() == EnumPlayerSignRewardState.NotSign then
        NeedFocusWidget = RewardWidget
        break
      end
    end
  end
  if nil == NeedFocusWidget then
    NeedFocusWidget = self.LowItem_1
  end
  return NeedFocusWidget
end

return M
