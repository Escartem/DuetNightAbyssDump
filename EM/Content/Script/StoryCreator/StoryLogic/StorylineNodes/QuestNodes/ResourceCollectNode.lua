local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local M = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function M:Init()
  self.ResourceType = "Resource"
  self.ResourceId = -1
  self.NeedCount = 0
  self.ResourceSType = "None"
  self.bGuideUIEnable = true
  self.bUseBagCount = true
  self.GuideType = "P"
  self.GuidePointName = ""
  self.InitResourceCount = 0
  self.Timer = nil
  self.TimerInterval = 0.5
end

function M:Execute(Callback)
  self:SetGuideVisibility(true)
  self.InitResourceCount = self:CalcInitResourceCount()
  self.Timer = GWorld.GameInstance:AddTimer(self.TimerInterval, function()
    if self:CheckCollectCompleted() then
      Callback()
    end
  end, true)
end

function M:Clear()
  self:SetGuideVisibility(false)
  GWorld.GameInstance:RemoveTimer(self.Timer)
  TaskUtils:ClearQuestExtraInfo(self.Context.QuestChainId, self.QuestId, self.Key)
end

function M:SetGuideVisibility(bVisibility)
  if not self.bGuideUIEnable then
    return
  end
  if bVisibility then
    MissionIndicatorManager:ActiveMissionIndicatorByNode(self)
  else
    MissionIndicatorManager:ReactiveMissionIndicatorByNode(self)
  end
end

function M:CalcInitResourceCount()
  if self.bUseBagCount then
    return 0
  else
    return self:CalcResourceCount()
  end
end

function M:CalcResourceCount()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return 0
  end
  local Count = 0
  if self.ResourceType == "Mod" then
    Count = Avatar:GetModCount2ModId(self.ResourceId)
  elseif self.ResourceType == "Weapon" then
    Count = Avatar:GetWeaponCountById(self.ResourceId)
  elseif self.ResourceType == "Resource" then
    if self.ResourceSType == "Fish" then
      Count = Avatar:GetFishCount()
    elseif self.ResourceSType == "None" then
      Count = Avatar:GetResourceNum(self.ResourceId)
    end
  end
  return Count
end

function M:CheckCollectCompleted()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  local CollectedCount = self:CalcResourceCount() - self.InitResourceCount
  Avatar:DoRefreshTaskItemUIInfo("Modify", nil, {
    CollectedCount,
    self.NeedCount,
    self.Context.QuestChainId,
    self.QuestId,
    self
  })
  return CollectedCount >= self.NeedCount
end

function M:OnCancelTrack()
end

function M:OnChooseTrack()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Count = self:CalcResourceCount()
  Avatar:DoRefreshTaskItemUIInfo("Modify", nil, {
    Count,
    self.NeedCount,
    self.Context.QuestChainId,
    self.QuestId,
    self
  })
end

return M
