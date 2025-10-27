local Component = {}

function Component:MarkCommunityFollowed(CommunityId)
  self.logger.debug("MarkCommunityFollowed Begin", CommunityId)
  
  local function Callback(Ret)
    self.logger.debug("MarkCommunityFollowed Callback", Ret, CommunityId)
  end
  
  self:CallServer("MarkCommunityFollowed", Callback, CommunityId)
end

function Component:GetCommunityFollowedReward(CommunityId)
  self.logger.debug("GetCommunityFollowedReward Begin", CommunityId)
  
  local function Callback(Ret)
    self.logger.debug("GetCommunityFollowedReward Callback", Ret, CommunityId)
  end
  
  self:CallServer("GetCommunityFollowedReward", Callback, CommunityId)
end

function Component:OnCommunityQuerySignUp(CommunityId)
  self.logger.debug("OnCommunityQuerySignUp", CommunityId)
  EventManager:FireEvent(EventID.OnCommunityFollowActivityJJJFinish, CommunityId)
end

return Component
