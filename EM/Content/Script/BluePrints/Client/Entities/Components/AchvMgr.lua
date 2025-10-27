local Component = {}

function Component:OnProgressChange(OldIndex, NewIndex, AchvId, CurrentCount)
  self.logger.debug("ZJT_ OldIndex NewIndex AchvId CurrentCount", OldIndex, NewIndex, AchvId, CurrentCount)
  if not (OldIndex and NewIndex and CurrentCount) or 0 == CurrentCount or OldIndex == NewIndex then
    return
  end
  local Achv = self.Achvs[AchvId]
  if not Achv or Achv:Data().IsHideToast then
    return
  end
  local unlocked = self:CheckUIUnlocked("Achievement")
  if _G.ShowAchievement == nil then
    _G.ShowAchievement = true
  end
  if unlocked and _G.ShowAchievement then
    local UIManger = UIManager(GWorld.GameInstance)
    local UI = UIManger:GetUIObjAsync("AchievementPanel", function(UIObj)
      if UIObj then
        if Achv:IsIndividual() then
          CurrentCount = Achv.CompletionValue
        end
        UIObj:AddQuene(AchvId, CurrentCount, Achv.TargetNeedCount, NewIndex)
      end
    end)
    if not UI and not UIManger:GetUIObjIsAsyncLoading("AchievementPanel") then
      if Achv:IsIndividual() then
        CurrentCount = Achv.CompletionValue
      end
      UIManger:LoadUIAsync("AchievementPanel", function(UIObj)
        if not UIManger:CheckNeedExitPopUp() then
          UIObj:Hide("UIPopUp")
        end
      end, AchvId, CurrentCount, Achv.TargetNeedCount, NewIndex)
    end
  end
end

function Component:_OnPropChangeAchvs(Keys)
  self:HandleIOSAchievement(Keys)
  if Keys[2] and "FinishedTargets" == Keys[2] then
    local AchvId = Keys[1]
    if self.Achvs:IsAchvCanGetReward(AchvId) then
      self:TryAddAchieveReddot(self.Achvs:GetAchv(AchvId):Data().AchievementType)
    end
  end
end

function Component:HandleIOSAchievement(Keys)
  local PlatformName = UE4.UUIFunctionLibrary.GetDevicePlatformName(GWorld.GameInstance)
  if "IOS" ~= PlatformName then
    return
  end
  local AchvID = Keys[1]
  local bIOSAchievement = DataMgr.Achievement[AchvID].IsIOSAchievement
  if not bIOSAchievement then
    return
  end
  local Achv = self.Achvs[AchvID]
  local CurrentCount = 0
  for i, TargetId in ipairs(Achv.TargetId) do
    local TargetAchv = self.AchvTargets[TargetId]
    if TargetAchv then
      CurrentCount = CurrentCount + TargetAchv.Count
    end
  end
  local TargetCount = Achv.TargetNeedCount
  local Progress = tonumber(string.format("%.2f", CurrentCount / TargetCount)) * 100
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local Proxy = UE4.UAchievementWriteCallbackProxy.WriteAchievementProgress(GWorld.GameInstance, PlayerController, AchvID, Progress)
  Proxy:Activate()
end

function Component:OnAchvFinish(AchvId)
  self.logger.debug("OnAchvFinish", AchvId)
  EventManager:FireEvent(EventID.OnAchvFinished, AchvId)
end

function Component:GetAchvReward(AchvId, cb)
  local function ServerCallClientBack(Ret, Rewards)
    self.logger.debug("ZJT_ ServerCallClient GetAchvReward ", Ret, Rewards)
    
    EventManager:FireEvent(EventID.OnGetAchvReward, AchvId, Ret)
    if ErrorCode:Check(Ret) then
      local Achv = self.Achvs:GetAchv(AchvId)
      if Achv then
        local TypeNodeName = "AchvType" .. Achv:Data().AchievementType
        ReddotManager.DecreaseLeafNodeCount(TypeNodeName)
      end
      local rewardData = DataMgr.Reward[DataMgr.Achievement[AchvId].AchievementReward]
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(rewardData.Type[1], rewardData.Id[1], rewardData.Count[1][1], Rewards, nil, cb, nil, nil)
    end
  end
  
  self:CallServer("GetAchvReward", ServerCallClientBack, AchvId)
end

function Component:GetAllAchvRewardByType(AchvTypeId, AchvId, cb)
  local function ServerCallClientBack(Ret, Rewards)
    self.logger.debug("JZN_ ServerCallClient GetAllAchvRewardByType ", Ret, Rewards)
    
    EventManager:FireEvent(EventID.OnGetAchvReward, nil, Ret)
    if ErrorCode:Check(Ret) then
      ReddotManager.ClearLeafNodeCount("AchvType" .. AchvTypeId)
      for _, id in pairs(AchvId) do
        local rewardData = DataMgr.Reward[DataMgr.Achievement[id].AchievementReward]
      end
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, nil, cb, nil, nil)
    end
  end
  
  self:CallServer("GetAllAchvRewardByType", ServerCallClientBack, AchvTypeId)
end

function Component:EnterWorld()
  self:RefreshAchieveReddot()
end

function Component:RefreshAchieveReddot()
  if not ReddotManager.GetTreeNode("AchieveMain") then
    ReddotManager.AddNodeEx("AchieveMain")
  end
  local AddTable = {}
  for Id, Achv in pairs(self.Achvs) do
    if self.Achvs:IsAchvCanGetReward(Id) then
      local Type = Achv:Data().AchievementType
      AddTable[Type] = AddTable[Type] and AddTable[Type] + 1 or 1
    end
  end
  for Type, Count in pairs(AddTable) do
    self:TryAddAchieveReddot(Type, Count)
  end
end

function Component:TryAddAchieveReddot(AchievementType, Count)
  local TypeNodeName = "AchvType" .. AchievementType
  local Node = ReddotManager.GetTreeNode(TypeNodeName)
  Node = Node or ReddotManager.AddNodeEx(TypeNodeName, nil, Const.ReddotCacheType.NoneCache, EReddotType.Normal)
  local MainNode = ReddotManager.GetTreeNode("AchieveMain")
  if MainNode then
    MainNode:AddChild(TypeNodeName, Node, true, EReddotType.Normal, Const.ReddotCacheType.NoneCache)
  end
  ReddotManager.IncreaseLeafNodeCount(TypeNodeName, Count)
end

return Component
