local EMCache = require("EMCache.EMCache")
local Component = {}

function Component:EnterWorld()
  self:RefreshAbyssRewardReddot()
  self:InitEntryNode("AbyssEntry1")
  self:InitEntryNode("AbyssEntry2")
end

function Component:InitEntryNode(ReddotName)
  local Node = ReddotManager.GetTreeNode(ReddotName)
  Node = Node or ReddotManager.AddNode(ReddotName, nil, 1)
  ReddotManager.ClearLeafNodeCount(ReddotName)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(ReddotName)
  if CacheDetail then
    for _, CacheData in pairs(CacheDetail) do
      if CacheData then
        ReddotManager.IncreaseLeafNodeCount(ReddotName)
      end
    end
  end
end

function Component:ClearEntryNode(ReddotName)
  ReddotManager.ClearLeafNodeCount(ReddotName, true)
end

function Component:GetAbyssSeasonBestAbyssId(SeasonId)
  if not SeasonId or not DataMgr.AbyssSeasonList[SeasonId] then
    return nil
  end
  local SeasonData = DataMgr.AbyssSeasonList[SeasonId]
  if not SeasonData.Abyss then
    return nil
  end
  local Infinite = SeasonData.Abyss.Infinite
  local AbyssInfinite = self.Abysses[Infinite]
  if AbyssInfinite and (AbyssInfinite.MaxAbyssProgress[1] > 1 or 1 == AbyssInfinite.MaxAbyssProgress[1] and AbyssInfinite.MaxAbyssProgress[2] > 0) then
    return Infinite
  else
    local Rotate = SeasonData.Abyss.Rotate
    local AbyssRotate = self.Abysses[Rotate]
    if AbyssRotate and AbyssRotate.FastestTeamList then
      return Rotate
    end
  end
  return nil
end

function Component:CheckAbyssCanJump(AbyssId, AbyssLevelId)
  local Abyss = self.Abysses[AbyssId]
  if not AbyssId or not Abyss then
    return false
  end
  if not Abyss:IsLoopAbyss() then
    return false
  end
  local SeasonData = DataMgr.AbyssSeasonList[self.CurrentAbyssSeasonId]
  if not SeasonData or not SeasonData.LastSeason then
    return false
  end
  local LastSeasonData = DataMgr.AbyssSeasonList[SeasonData.LastSeason]
  local LastInfiniteId = LastSeasonData.Abyss.Infinite
  if not LastInfiniteId then
    return false
  end
  local SeasonInfo = Abyss:Data()
  if SeasonInfo.InfiniteNode then
    local LastInfinite = self.Abysses[LastInfiniteId]
    if not LastInfinite then
      return false
    end
    local LastMaxProgress = LastInfinite.MaxAbyssProgress[1] - 1
    if AbyssLevelId >= LastMaxProgress or AbyssLevelId <= 0 then
      return false
    end
    local JumpLevel = SeasonInfo.InfiniteNode[1]
    if 0 ~= AbyssLevelId % JumpLevel then
      return false
    end
    local LastAbyssLevel = Abyss.AbyssLevelList[AbyssLevelId - JumpLevel]
    if AbyssLevelId - JumpLevel > 0 and not LastAbyssLevel then
      return false
    end
    if LastAbyssLevel and not LastAbyssLevel:IsAbyssLevelPass() then
      return false
    end
    local CanJumpTimes = math.min(LastMaxProgress // JumpLevel, SeasonInfo.InfiniteNode[2])
    if CanJumpTimes <= Abyss.AlreadyJumpLevelTimes then
      return false
    end
    return true
  end
  return false
end

function Component:SaveAbyssTeam(callback, AbyssId, AbyssLevelId, TeamTable)
  self.logger.debug("SaveAbyssTeam Begin", AbyssId, AbyssLevelId, TeamTable)
  
  local function Callback(Ret)
    self.logger.debug("SaveAbyssTeam Callback", Ret, AbyssId, AbyssLevelId, TeamTable)
    if callback then
      callback(Ret)
    end
  end
  
  self:CallServer("SaveAbyssTeam", Callback, AbyssId, AbyssLevelId, TeamTable)
end

function Component:UnLockAbyssTeam(callback, AbyssId, AbyssLevelId)
  self.logger.debug("UnLockAbyssTeam Begin", AbyssId, AbyssLevelId)
  
  local function Callback(Ret)
    self.logger.debug("UnLockAbyssTeam Callback", Ret, AbyssId, AbyssLevelId)
    if callback then
      callback(Ret)
    end
  end
  
  self:CallServer("UnLockAbyssTeam", Callback, AbyssId, AbyssLevelId)
end

function Component:TriggerEnterAbyss(callback, AbyssId, AbyssLevelId, AbyssDungeonIndex)
  self.logger.debug("TriggerEnterAbyss Begin", AbyssId, AbyssLevelId, AbyssDungeonIndex)
  
  local function Callback(Ret)
    self.logger.debug("TriggerEnterAbyss Callback", Ret, AbyssId, AbyssLevelId, AbyssDungeonIndex)
    if callback then
      callback(Ret)
    end
  end
  
  self:CallServer("TriggerEnterAbyss", Callback, AbyssId, AbyssLevelId, AbyssDungeonIndex)
end

function Component:TriggerReEnterAbyss()
  self.logger.debug("TriggerReEnterAbyss Begin")
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  if GameMode then
    GameMode:FlushRewards()
  end
  
  local function Callback(Ret)
    self.logger.debug("TriggerReEnterAbyss Callback", Ret)
  end
  
  self:CallServer("TriggerReEnterAbyss", Callback)
end

function Component:TriggerCompleteAbyssRoom(RoomId, PassTime)
  self.logger.debug("TriggerCompleteAbyssRoom Begin", RoomId, PassTime)
  
  local function Callback(Ret)
    self:TryIncreaceAbyssRewardReddot()
    self.logger.debug("TriggerCompleteAbyssRoom Callback", Ret, RoomId, PassTime)
  end
  
  self:CallServer("TriggerCompleteAbyssRoom", Callback, RoomId, PassTime)
end

function Component:OnAbyssEnd(AbyssId, AbyssLevelId, AbyssDungeonIndex, IsWin, PassTime)
  self.logger.debug("OnAbyssEnd", AbyssId, AbyssLevelId, AbyssDungeonIndex, IsWin, PassTime)
  GWorld.GameInstance:PushLogicServerCallbackInfo(IsWin, AbyssId, AbyssLevelId, AbyssDungeonIndex, PassTime)
  local PlayerCharacter = GWorld:GetMainPlayer()
  if PlayerCharacter then
    PlayerCharacter:EnableBattleWheel()
  end
end

function Component:GetAbyssReward(AbyssId, StarCount, InCallBack)
  self.logger.debug("GetAbyssReward Begin", AbyssId, StarCount)
  
  local function Callback(Ret, RewardReturn)
    self.logger.debug("GetAbyssReward Callback", Ret, AbyssId, StarCount, RewardReturn)
    if 0 == Ret then
      local Abyss = self.Abysses[AbyssId]
      local Id = Abyss:GetAbyssRewardIdByStar(StarCount)
      if DataMgr.Reward[Id] then
        local rewardData = DataMgr.Reward[Id]
        UIManager(GWorld.GameInstance):LoadUI(UIConst.LoadInConfig, "GetItemPage", nil, rewardData.Type[1], rewardData.Id[1], rewardData.Count[1][1], RewardReturn)
      end
      self:TryDecreaceAbyssRewardReddot(AbyssId, StarCount)
      if InCallBack then
        InCallBack(Ret, RewardReturn)
      end
    end
  end
  
  self:CallServer("GetAbyssReward", Callback, AbyssId, StarCount)
end

function Component:GetAbyssAllReward(AbyssId, InCallBack)
  self.logger.debug("GetAbyssAllReward Begin", AbyssId)
  
  local function Callback(Ret, RewardReturn)
    self.logger.debug("GetAbyssAllReward Callback", Ret, AbyssId, RewardReturn)
    if 0 == Ret then
      UIManager(GWorld.GameInstance):LoadUI(UIConst.LoadInConfig, "GetItemPage", nil, nil, nil, nil, RewardReturn)
      self:TryDecreaceAbyssRewardReddot(AbyssId)
      if InCallBack then
        InCallBack(Ret, RewardReturn)
      end
    end
  end
  
  self:CallServer("GetAbyssAllReward", Callback, AbyssId)
end

function Component:OnAbyssSeasonEnd(AbyssSeasonId)
  self.logger.debug("OnAbyssSeasonEnd", AbyssSeasonId)
  EventManager:FireEvent(EventID.OnAbyssSeasonEnd, AbyssSeasonId)
end

function Component:TryIncreaceAbyssRewardReddot()
  local Node = ReddotManager.GetTreeNode("AbyssReward")
  if not Node then
    ReddotManager.AddNode("AbyssReward")
  end
  for AbyssId, Abyss in pairs(self.Abysses) do
    if not Abyss.AbyssSeasonId or Abyss.AbyssSeasonId == self.CurrentAbyssSeasonId then
      local RoomCount = Abyss:GetAllPassRoomCount()
      if Abyss:CheckRewardCanGet(RoomCount) then
        local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("AbyssReward")
        if not CacheDetail[AbyssId] then
          CacheDetail[AbyssId] = {}
          CacheDetail[AbyssId].Count = 0
        end
        if not CacheDetail[AbyssId][RoomCount] then
          CacheDetail[AbyssId][RoomCount] = 1
          CacheDetail[AbyssId].Count = CacheDetail[AbyssId].Count + 1
          ReddotManager.IncreaseLeafNodeCount("AbyssReward")
        end
      end
    end
  end
end

function Component:TryDecreaceAbyssRewardReddot(AbyssId, StarCount)
  local Node = ReddotManager.GetTreeNode("AbyssReward")
  if not Node then
    ReddotManager.AddNode("AbyssReward")
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("AbyssReward")
  if CacheDetail[AbyssId] then
    if StarCount then
      if CacheDetail[AbyssId][StarCount] then
        CacheDetail[AbyssId][StarCount] = nil
        CacheDetail[AbyssId].Count = CacheDetail[AbyssId].Count - 1
        if CacheDetail[AbyssId].Count <= 0 then
          CacheDetail[AbyssId] = nil
        end
        ReddotManager.DecreaseLeafNodeCount("AbyssReward")
      end
    else
      local Count = CacheDetail[AbyssId].Count
      CacheDetail[AbyssId] = nil
      ReddotManager.DecreaseLeafNodeCount("AbyssReward", Count)
    end
  end
end

function Component:_OnPropChangeCurrentAbyssSeasonId(Keys)
  self:ClearEntryNode("AbyssEntry1")
  self:ClearEntryNode("AbyssEntry2")
  self:RefreshAbyssRewardReddot()
  EMCache:Remove("LastUnlockNodeLevel")
  EventManager:FireEvent(EventID.OnCurrentAbyssSeasonIdChange)
end

function Component:RefreshAbyssRewardReddot()
  if not ReddotManager.GetTreeNode("AbyssReward") then
    ReddotManager.AddNode("AbyssReward")
  end
  ReddotManager.ClearLeafNodeCount("AbyssReward", true)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("AbyssReward")
  local IncreaceNum = 0
  for AbyssId, Abyss in pairs(self.Abysses) do
    if not Abyss.AbyssSeasonId or Abyss.AbyssSeasonId == self.CurrentAbyssSeasonId then
      local RoomCount = Abyss:GetAllPassRoomCount()
      for i = 1, RoomCount do
        if Abyss:CheckRewardCanGet(i) then
          if not CacheDetail[AbyssId] then
            CacheDetail[AbyssId] = {}
            CacheDetail[AbyssId].Count = 0
          end
          if not CacheDetail[AbyssId][i] then
            CacheDetail[AbyssId][i] = 1
            CacheDetail[AbyssId].Count = CacheDetail[AbyssId].Count + 1
            IncreaceNum = IncreaceNum + 1
          end
        end
      end
    end
  end
  if IncreaceNum > 0 then
    ReddotManager.IncreaseLeafNodeCount("AbyssReward", IncreaceNum)
  end
end

return Component
