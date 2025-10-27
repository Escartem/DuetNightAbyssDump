local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local Community = Class("Community", CustomTypes.CustomAttr)
Community.__Props__ = {
  SignInDay = prop.prop("Int", "save", 0),
  CommunityFollowList = prop.prop("Int2IntDict", "client save")
}

function Community:SetFollowed(CommunityId)
  if not self:IsFollowed(CommunityId) then
    self.CommunityFollowList[CommunityId] = 2
  end
end

function Community:SetRewardGot(CommunityId)
  if self:IsRewardCanGet(CommunityId) then
    self.CommunityFollowList[CommunityId] = 3
  end
end

function Community:IsFollowed(CommunityId)
  local FollowState = self.CommunityFollowList[CommunityId]
  if not FollowState then
    return false
  end
  return 1 ~= FollowState
end

function Community:IsRewardCanGet(CommunityId)
  local FollowState = self.CommunityFollowList[CommunityId]
  if not FollowState then
    return false
  end
  return 2 == FollowState
end

function Community:IsRewardGot(CommunityId)
  local FollowState = self.CommunityFollowList[CommunityId]
  if not FollowState then
    return false
  end
  return 3 == FollowState
end

function Community:GetCommunity(CommunityId)
  if not self.CommunityFollowList[CommunityId] then
    self.CommunityFollowList[CommunityId] = 1
  end
  return self.CommunityFollowList[CommunityId]
end

FormatProperties(Community)
return {Community = Community}
