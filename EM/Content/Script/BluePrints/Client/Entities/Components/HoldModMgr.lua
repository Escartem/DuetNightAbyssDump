local Component = {}

function Component:GetModGuideBookArchiveReward(ArchiveId, CallBack)
  local function Callback(Ret, Reward)
    self.logger.debug("ZJT_ GetModGuideBookArchiveReward ServerCallClient ", Ret, Reward)
    
    if CallBack then
      CallBack(Ret, Reward)
    end
  end
  
  self:CallServer("GetModGuideBookArchiveReward", Callback, ArchiveId)
end

function Component:GetAllModGuideBookArchiveReward(ArchiveIds, CallBack)
  local function Callback(Ret, Reward)
    self.logger.debug("ZJT_ GetAllModGuideBookArchiveReward ServerCallClient ", Ret, Reward)
    
    if CallBack then
      CallBack(Ret, Reward)
    end
  end
  
  self:CallServer("GetAllModGuideBookArchiveReward", Callback, ArchiveIds)
end

return Component
