local Component = {}

function Component:EnterWorld()
  self:RefreshPaotaiEventRewardReddot()
end

function Component:PaotaiGetScoreReward(PaotaiId, ScoreIdx, Callback)
  self.logger.info("PaotaiGetScoreReward", PaotaiId, ScoreIdx)
  
  local function Cb(ErrCode, RewardReturn)
    DebugPrint("PaotaiGetScoreReward", ErrorCode:Name(ErrCode))
    if ErrorCode:Check(ErrCode) then
      Callback(ErrCode, RewardReturn)
    end
  end
  
  self:CallServer("PaotaiGetScoreReward", Cb, PaotaiId, ScoreIdx)
end

function Component:PaotaiGetAllScoreReward(PaotaiId, Callback)
  self.logger.info("PaotaiGetAllScoreReward", PaotaiId)
  
  local function Cb(ErrCode, RewardReturn)
    DebugPrint("PaotaiGetAllScoreReward", ErrorCode:Name(ErrCode))
    if ErrorCode:Check(ErrCode) then
      Callback(ErrCode, RewardReturn)
    end
  end
  
  self:CallServer("PaotaiGetAllScoreReward", Cb, PaotaiId)
end

function Component:PaotaiUpdateBuffs(Buffs, Callback)
  self.logger.info("PaotaiUpdateBuffs", Buffs)
  
  local function Cb(ErrCode)
    DebugPrint("PaotaiUpdateBuffs", ErrorCode:Name(ErrCode))
    if ErrorCode:Check(ErrCode) then
      Callback()
    end
  end
  
  self:CallServer("PaotaiUpdateBuffs", Cb, Buffs)
end

function Component:_OnPropChangePaotaiGame(key)
  local EventId = key[1]
  self:_TryAddPaotaiGameRewardReddot(EventId)
end

function Component:RefreshPaotaiEventRewardReddot()
  if not ReddotManager.GetTreeNode("PaotaiEventReward") then
    ReddotManager.AddNode("PaotaiEventReward")
  end
  ReddotManager.ClearLeafNodeCount("PaotaiEventReward", true)
  local EventId = DataMgr.PaotaiEventConstant.PaotaiGameEventId.ConstantValue
  self:_TryAddPaotaiGameRewardReddot(EventId)
end

function Component:_TryAddPaotaiGameRewardReddot(EventId)
  local ReddotNode = ReddotManager.GetTreeNode("PaotaiEventReward")
  ReddotNode = ReddotNode or ReddotManager.AddNode("PaotaiEventReward")
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("PaotaiEventReward")
  if CacheDetail.EventId ~= EventId then
    ReddotManager.ClearLeafNodeCount("PaotaiEventReward", true)
  end
  CacheDetail = ReddotManager.GetLeafNodeCacheDetail("PaotaiEventReward")
  CacheDetail.EventId = EventId
  local TargetNum = 0
  local CurrentNum = ReddotNode.Count
  local PaotaiMiniGame = DataMgr.PaotaiMiniGame
  for DungeonId, Info in pairs(PaotaiMiniGame) do
    if Info.EventId == EventId then
      if self.PaotaiGame[EventId] and self.PaotaiGame[EventId][DungeonId] then
        local RewardsGot = self.PaotaiGame[EventId][DungeonId].RewardsGot
        local MaxScore = self.PaotaiGame[EventId][DungeonId].MaxScore
        for Index, Score in pairs(Info.Level) do
          if Score <= MaxScore and not RewardsGot[Score] then
            if not CacheDetail[DungeonId] then
              CacheDetail[DungeonId] = {}
            end
            CacheDetail[DungeonId][Score] = 1
            TargetNum = TargetNum + 1
          elseif CacheDetail[DungeonId] then
            CacheDetail[DungeonId][Score] = nil
            if nil == next(CacheDetail[DungeonId]) then
              CacheDetail[DungeonId] = nil
            end
          end
        end
      else
        CacheDetail[DungeonId] = nil
      end
    else
      CacheDetail[DungeonId] = nil
    end
  end
  if CurrentNum < TargetNum then
    ReddotManager.IncreaseLeafNodeCount("PaotaiEventReward", TargetNum - CurrentNum)
  elseif CurrentNum > TargetNum then
    ReddotManager.DecreaseLeafNodeCount("PaotaiEventReward", CurrentNum - TargetNum)
  end
end

return Component
