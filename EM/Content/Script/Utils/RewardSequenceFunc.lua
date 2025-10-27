local RewardSequenceFunc = {}

function RewardSequenceFunc.Init(RewardId)
  return {
    RewardId = RewardId,
    RewardIndex = 0,
    Rewards = {},
    RandomCount = 0
  }
end

function RewardSequenceFunc:AddIndex(RewardId, Data, bCeiling)
  local Sequence = self.SequenceDict[RewardId]
  if not Sequence then
    Sequence = RewardSequenceFunc.Init(RewardId)
    RewardSequenceFunc.UpdateRewards(Sequence, self.Seed, Data, bCeiling)
  end
  local RewardLength = Sequence.Rewards.Length and Sequence.Rewards:Length() or #Sequence.Rewards
  if RewardLength <= Sequence.RewardIndex then
    RewardSequenceFunc.UpdateRewards(Sequence, self.Seed, Data, bCeiling)
    Sequence.RewardIndex = 1
  else
    Sequence.RewardIndex = Sequence.RewardIndex + 1
  end
  self.SequenceDict[RewardId] = Sequence
end

function RewardSequenceFunc.Random(Sequence, Seed, min, max)
  math.randomseed(Seed + Sequence.RandomCount + Sequence.RewardId)
  Sequence.RandomCount = Sequence.RandomCount + 1
  return math.random(min, max)
end

function RewardSequenceFunc.Shuffle(Sequence, Seed, T)
  local Count = #T
  while Count > 1 do
    local n = RewardSequenceFunc.Random(Sequence, Seed, 1, Count - 1)
    if nil ~= T[n] then
      T[Count], T[n] = T[n], T[Count]
      Count = Count - 1
    end
  end
end

function RewardSequenceFunc.UpdateRewards(Sequence, Seed, Data, bCeiling)
  local RewardInfo = Data[Sequence.RewardId]
  local Result = {}
  if bCeiling then
    for i = 2, #RewardInfo.Param do
      local MaxCount = RewardInfo.Param[i]
      local n = RewardSequenceFunc.Random(Sequence, Seed, 0, MaxCount)
      for j = 1, n do
        Result[#Result + 1] = i
      end
    end
    RewardSequenceFunc.Shuffle(Sequence, Seed, Result)
    Result[#Result + 1] = 1
  else
    for i = 1, #RewardInfo.Param do
      local Param = RewardInfo.Param[i]
      for j = 1, Param do
        Result[#Result + 1] = i
      end
    end
    RewardSequenceFunc.Shuffle(Sequence, Seed, Result)
  end
  Sequence.Rewards = Result
end

function RewardSequenceFunc:GetReward()
  return self.Rewards[self.RewardIndex]
end

return RewardSequenceFunc
