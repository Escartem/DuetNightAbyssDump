local GoToRegionNode = Class("StoryCreator.StoryLogic.storylineNodes.BaseAsynQuestNode")

function GoToRegionNode:Init()
  self.RegionType = 1
  self.IsEnter = ""
  self.RegionId = 0
  self.bGuideUIEnable = false
  self.GuideType = ""
  self.GuideName = ""
  self.GuideStaticCreatorId = 0
  self.EnterSubRegionCallback = nil
  self.LeaveSubRegionCallback = nil
  self.EnterRegionCallback = nil
  self.LeaveRegionCallback = nil
end

function GoToRegionNode:Execute(ReturnCallback)
  self.ReturnCallback = ReturnCallback
  if 1 == self.RegionType then
    if self.IsEnter == "Enter" then
      self:GoToSubRegion()
    elseif self.IsEnter == "Leave" then
      self:LeaveFromSubRegion()
    end
  elseif self.IsEnter == "Enter" then
    self:GoToRegion()
  else
    self:LeaveToRegion()
  end
end

function GoToRegionNode:GoToRegion()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local Avatar = GWorld:GetAvatar()
  if not GameMode or not Avatar then
    GWorld.logger.error("ZJT_ GoToRegionNode Error GameMode: " .. GameMode .. "Avatar: ", Avatar)
    return
  end
  if Avatar:GetSubRegionId2RegionId() == self.RegionId then
    self:FinishAction()
    return
  end
  
  local function Callback()
    if Avatar:GetSubRegionId2RegionId() ~= self.RegionId then
      return
    end
    DebugPrint("ZJT_ Exce RegionSkipCallBack GoToRegionNode:GoToRegion Callback, RegionId, ", self.RegionId, " CurrentRegionId", Avatar.CurrentRegionId)
    self:FinishAction()
    Avatar:RemoveRegionSkipCallback(self.RegionId, self, self.EnterRegionCallback)
  end
  
  self.EnterRegionCallback = Callback
  DebugPrint("ZJT_ Add RegionSkipCallBack GoToRegionNode ", self.RegionId, Avatar.CurrentRegionId)
  Avatar:AddRegionSkipCallback(self.RegionId, self, self.EnterRegionCallback)
  if self.bGuideUIEnable then
    MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
  end
end

function GoToRegionNode:LeaveToRegion()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local Avatar = GWorld:GetAvatar()
  if not GameMode or not Avatar then
    GWorld.logger.error("ZJT_ GoToRegionNode Error GameMode: " .. GameMode .. "Avatar: ", Avatar)
    return
  end
  if Avatar.CurrentRegionId ~= self.RegionId then
    self:FinishAction()
    return
  end
  
  local function Callback()
    if Avatar:GetSubRegionId2RegionId() == self.RegionId then
      return
    end
    self:FinishAction()
    Avatar:RemoveRegionSkipCallback(self.RegionId, self, self.LeaveRegionCallback)
  end
  
  self.LeaveRegionCallback = Callback
  Avatar:AddRegionSkipCallback(self.RegionId, self, self.LeaveRegionCallback)
end

function GoToRegionNode:GoToSubRegion()
  self:CheckResurgencePoint()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local Avatar = GWorld:GetAvatar()
  if not GameMode or not Avatar then
    return
  end
  if Avatar.CurrentRegionId == self.RegionId then
    self:FinishAction()
    return
  end
  
  local function Callback()
    local Avatar = GWorld:GetAvatar()
    if Avatar.CurrentRegionId ~= self.RegionId then
      return
    end
    self:FinishAction()
    Avatar:RemoveSubRegionSkipCallback(self.RegionId, self, self.EnterSubRegionCallback)
    DebugPrint(string.format("ZJT_ RegionSkipCallBack GoToSubRegion Callback TargetSubRegionId : %d CurrentSubRegionId: %d ", self.RegionId, Avatar.CurrentRegionId))
  end
  
  self.EnterSubRegionCallback = Callback
  Avatar:AddRegionSkipCallback(self.RegionId, self, self.EnterSubRegionCallback)
  DebugPrint(string.format("ZJT_ RegionSkipCallBack GoToSubRegion : %d CurrentSubRegionId %d ", self.RegionId, Avatar.CurrentRegionId))
  if self.bGuideUIEnable then
    MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
  end
end

function GoToRegionNode:LeaveFromSubRegion()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local Avatar = GWorld:GetAvatar()
  if not GameMode or not Avatar then
    return
  end
  if Avatar.CurrentRegionId ~= self.RegionId then
    self:FinishAction()
    return
  end
  
  local function Callback()
    local Avatar = GWorld:GetAvatar()
    if Avatar.CurrentRegionId == self.RegionId then
      return
    end
    self:FinishAction()
    Avatar:RemoveSubRegionSkipCallback(self.RegionId, self, self.LeaveSubRegionCallback)
  end
  
  self.LeaveSubRegionCallback = Callback
  Avatar:AddRegionSkipCallback(self.RegionId, self, self.LeaveSubRegionCallback)
  if self.bGuideUIEnable then
    MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
  end
end

function GoToRegionNode:FinishAction()
  if self.bGuideUIEnable then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local WCSubsystem = GameMode.WorldCompositionSubSystem
  if WCSubsystem then
    self:CheckIsAsyncTraveling(WCSubsystem)
    return
  end
  self.ReturnCallback()
end

function GoToRegionNode:CheckIsAsyncTraveling(WCSubsystem)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not Player then
    self:Finish()
    return
  end
  local MovementComponent = Player:GetMovementComponent()
  if not MovementComponent then
    self:Finish()
    return
  end
  if not MovementComponent.bIsAsyncTraveling then
    self:Finish()
    return
  end
  WCSubsystem:AddOnAsyncTravelEnded(self, self.Finish)
end

function GoToRegionNode:Reactive()
  self:Start(self.Context)
end

function GoToRegionNode:Clear()
  if self.bGuideUIEnable then
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
  local Avatar = GWorld:GetAvatar()
  DebugPrint("GoToRegionNode:Clear", self.bGuideUIEnable)
  if Avatar then
    if self.EnterSubRegionCallback then
      Avatar:RemoveSubRegionSkipCallback(self.RegionId, self, self.EnterSubRegionCallback)
    end
    if self.LeaveSubRegionCallback then
      Avatar:RemoveSubRegionSkipCallback(self.RegionId, self, self.LeaveSubRegionCallback)
    end
    if self.EnterRegionCallback then
      Avatar:RemoveRegionSkipCallback(self.RegionId, self, self.EnterRegionCallback)
    end
    if self.LeaveRegionCallback then
      Avatar:RemoveRegionSkipCallback(self.RegionId, self, self.LeaveRegionCallback)
    end
  end
end

function GoToRegionNode:CheckResurgencePoint()
  if self.Context.QuestData.bUseQuestCoordinate and self.Context.QuestData.ResurgencePoint == "" then
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    local QuestChain = Avatar.QuestChains[self.Context.QuestChainId]
    local QuestCoordinate = QuestChain.QuestCoordinate
    if not QuestCoordinate then
      return
    end
    if self.RegionId ~= QuestCoordinate.SubRegionId then
      local Message = "GoToRegionNode\230\137\128\229\156\168\228\187\187\229\138\161\233\147\190\231\154\132StoryNode\233\156\128\232\166\129\233\133\141\231\189\174ResurgencePoint" .. [[

FileName:]] .. self.Context.FileName .. [[

QuestChainId:]] .. self.Context.QuestChainId .. [[

QuestId:]] .. self.Context.QuestId .. [[

StoryNodeKey:]] .. self.Context.Data.key
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "GoToRegionNode\230\137\128\229\156\168\228\187\187\229\138\161\233\147\190\231\154\132StoryNode\233\156\128\232\166\129\233\133\141\231\189\174ResurgencePoint", Message)
      return
    end
  end
end

return GoToRegionNode
