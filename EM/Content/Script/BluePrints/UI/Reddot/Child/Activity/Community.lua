local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ReddotTreeNode_Community = Class("BluePrints.UI.Reddot.Child.Activity.ActivityBase")

function ReddotTreeNode_Community:_Judge(EventId)
  local PlayerAvatar = GWorld:GetAvatar()
  local Community = PlayerAvatar.Community
  for CommunityId, _ in pairs(DataMgr.CommunityList) do
    if Community:IsRewardCanGet(CommunityId) then
      return true
    end
  end
  return false
end

return ReddotTreeNode_Community
