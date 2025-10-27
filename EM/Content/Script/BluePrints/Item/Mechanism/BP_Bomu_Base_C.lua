require("UnLua")
local M = Class("BluePrints.Item.BP_CombatItemBase_C")

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.StateId1 = self.UnitParams.StateId1
  self.StateId2 = self.UnitParams.StateId2
end

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  local MainStoryType = self:CheckMainStoryType()
  if 1 == MainStoryType then
    self:ChangeState("Manual", 0, self.StateId1)
  elseif 2 == MainStoryType then
    self:ChangeState("Manual", 0, self.StateId2)
  end
end

function M:CheckMainStoryType()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return nil
  end
  local DoingQuestChainIds = {}
  local DoingQuestIds
  DoingQuestChainIds, DoingQuestIds = Avatar:GetCurrentDoingQuest()
  for i, v in pairs(DoingQuestChainIds) do
    local QuestChainData = DataMgr.QuestChain[v]
    if QuestChainData and QuestChainData.MainStoryType then
      return QuestChainData.MainStoryType
    end
  end
  return nil
end

return M
