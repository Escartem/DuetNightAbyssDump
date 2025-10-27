local TimeUtils = require("Utils.TimeUtils")
local ReddotTreeNode_ModArchive = Class("BluePrints.UI.Reddot.ReddotTreeNode")

function ReddotTreeNode_ModArchive:OnInitNodeCache(NodeCache)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if self.Name == "ModArchive_Task" then
    NodeCache.Count = 0
    local AllTask = DataMgr.ModGuideBookTask or {}
    for i, v in pairs(AllTask) do
      local ModBookQuest = Avatar.ModBookQuests:GetModBookQuest(v.TaskId)
      if ModBookQuest.IsComplete and ModBookQuest:IsComplete() and not ModBookQuest.RewardsGot then
        NodeCache.Count = NodeCache.Count + 1
      end
    end
  else
    for i, v in pairs(DataMgr.ModGuideBookArchiveTab) do
      if self.Name == v.ReddotNode then
        NodeCache.Detail.RedNum = 0
        NodeCache.Detail.NewNum = 0
        local ArchiveTabId = v.TabId
        for _, ArchiveInfo in pairs(DataMgr.ModGuideBookArchive) do
          if ArchiveInfo.TabId == ArchiveTabId then
            local bCanGet = true
            for __, ModId in ipairs(ArchiveInfo.ModList) do
              if not Avatar.HoldMods[ModId] or Avatar.HoldModRewards[ArchiveInfo.ArchiveId] then
                bCanGet = false
                break
              end
            end
            if bCanGet then
              NodeCache.Detail.RedNum = NodeCache.Detail.RedNum + 1
            end
            if not NodeCache.Detail.States then
              NodeCache.Detail.States = {}
            end
            local Condition = ArchiveInfo.ShowCondition
            if Condition and ConditionUtils.CheckCondition(Avatar, Condition) then
              self:CheckFirstNew(ArchiveInfo, NodeCache)
            end
            Condition = ArchiveInfo.UnlockCondition
            if Condition and ConditionUtils.CheckCondition(Avatar, Condition) then
              self:CheckFirstNew(ArchiveInfo, NodeCache)
            end
            for ModId, State in pairs(NodeCache.Detail.States) do
              if true == State then
                NodeCache.Detail.NewNum = NodeCache.Detail.NewNum + 1
              end
            end
          end
        end
        NodeCache.Count = NodeCache.Detail.RedNum + NodeCache.Detail.NewNum
      end
    end
  end
  self:RefreshInfo()
end

function ReddotTreeNode_ModArchive:OnDecreaseCount(SubValue, CacheDetailChangedParams, OldCount)
  if CacheDetailChangedParams and CacheDetailChangedParams.NewNum and 0 == CacheDetailChangedParams.NewNum and self.Cache.Detail and self.Cache.Detail.RedNum then
    self.Cache.Count = self.Cache.Detail.RedNum
    self.Count = self.Cache.Detail.RedNum
    if self.Cache.Detail and self.Cache.Detail.NewNum then
      self.Cache.Detail.NewNum = 0
    end
  end
  self:RefreshInfo()
end

function ReddotTreeNode_ModArchive:OnIncreaseCount(AddValue, CacheDetailChangedParams, OldCount)
  self:RefreshInfo()
end

function ReddotTreeNode_ModArchive:RefreshInfo()
  if self.Cache.Detail and self.Cache.Detail.RedNum and self.Cache.Detail.RedNum > 0 then
    self.ReddotType = EReddotType.Normal
  elseif self.Cache.Detail and self.Cache.Detail.NewNum and self.Cache.Detail.NewNum > 0 then
    self.ReddotType = EReddotType.New
  elseif self.Cache.Detail and self.Cache.Detail.PhaseId and self.Cache.Detail.PhaseId > 0 then
    self.ReddotType = EReddotType.Normal
  end
  if self.Cache.Detail and self.Cache.Detail.RedNum and self.Cache.Detail and self.Cache.Detail.NewNum then
    self.Count = self.Cache.Detail.RedNum + self.Cache.Detail.NewNum
  end
  self:UpdateRdType()
end

function ReddotTreeNode_ModArchive:CheckFirstNew(ArchiveInfo, NodeCache)
  local NewNum = #ArchiveInfo.ModList
  for i = 1, NewNum do
    local ModId = ArchiveInfo.ModList[i]
    if NodeCache.Detail.States[ModId] == nil then
      NodeCache.Detail.States[ModId] = true
    end
  end
end

return ReddotTreeNode_ModArchive
