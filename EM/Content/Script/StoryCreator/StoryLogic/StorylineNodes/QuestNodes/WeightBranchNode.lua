local M = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function M:Start()
  local IndexArray = self:WeightedRandomSelection(self.WeightBranchArray, self.RandomTriggerBranchCount)
  local PortNameArray = self:IndexToPortName(IndexArray)
  self:Finish(PortNameArray)
end

function M:WeightedRandomSelection(WeightArray, RandomCount)
  local TotalWeight = 0
  for _, Weight in pairs(WeightArray) do
    TotalWeight = TotalWeight + Weight
  end
  local SelectedArray = {}
  local SelectedFlags = {}
  for _ = 1, RandomCount do
    local Rand = math.random() * TotalWeight
    local CumulativeWeight = 0
    for Index, Weight in pairs(WeightArray) do
      if not SelectedFlags[Index] then
        CumulativeWeight = CumulativeWeight + Weight
        if Rand <= CumulativeWeight then
          table.insert(SelectedArray, Index)
          TotalWeight = TotalWeight - Weight
          SelectedFlags[Index] = true
          break
        end
      end
    end
  end
  assert(#SelectedArray == RandomCount, "\233\128\137\228\184\173\231\154\132\229\136\134\230\148\175\230\149\176\233\135\143\228\184\141\229\175\185")
  return SelectedArray
end

function M:IndexToPortName(IndexArray)
  local PortNameArray = {}
  for _, Index in pairs(IndexArray) do
    table.insert(PortNameArray, "WeightBranch_" .. Index)
  end
  return PortNameArray
end

return M
