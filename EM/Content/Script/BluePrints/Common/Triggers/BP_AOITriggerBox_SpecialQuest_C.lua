require("UnLua")
local M = Class("BluePrints.Common.Triggers.BP_AOITriggerBox_C")

function M:InitTriggerEventId(Info)
  M.Super.InitTriggerEventId(self, Info)
  local SpecialConfigId = DataMgr.SpecialQuestMechanism2SpecialConfigId[self.CreatorId]
  if not SpecialConfigId then
    return
  end
  self.TriggerQuestId = SpecialConfigId[1]
  self.TriggerTalkId = DataMgr.SpecialQuestConfig[SpecialConfigId[1]].TalkTriggerId or 0
end

function M:SetBoxExtent_Lua(QuestSize, TipsSize)
  M.Super.SetBoxExtent_Lua(self, QuestSize)
  self.TipTrigger.OnComponentBeginOverlap:Add(self, self.TalkBeginOverlap)
  self.TipTrigger.OnComponentEndOverlap:Add(self, self.TalkEndOverlap)
  self.TipTrigger:SetBoxExtent(TipsSize)
end

function M:TalkBeginOverlap(Component, OtherActor)
  print(_G.LogTag, "LXZ TalkBeginOverlap")
end

function M:TalkEndOverlap(Component, OtherActor)
  print(_G.LogTag, "LXZ TalkEndOverlap", self.TriggerTalkId)
  if not OtherActor:IsMainPlayer() or 0 == self.TriggerTalkId then
    return
  end
  UE4.UTalkFunctionLibrary.PlayDirectTalkByTalkTriggerId(GWorld.GameInstance, self.TriggerTalkId)
end

function M:CreateTriggerRule(Creator)
  M.Super.CreateTriggerRule(self, Creator)
  self.InOrOutTrigger = "All"
end

function M:OnEMActorDestroy(DestroyReason)
  self.TipTrigger.OnComponentBeginOverlap:Remove(self, self.TalkBeginOverlap)
  self.TipTrigger.OnComponentEndOverlap:Remove(self, self.TalkEndOverlap)
  M.Super.OnEMActorDestroy(self, DestroyReason)
end

return M
