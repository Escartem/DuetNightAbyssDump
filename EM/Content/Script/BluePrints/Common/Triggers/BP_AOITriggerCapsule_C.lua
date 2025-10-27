require("UnLua")
local M = Class("BluePrints.Common.Triggers.BP_AOITriggerBox_C")

function M:InitTriggerEventId(Info)
  M.Super.InitTriggerEventId(self, Info)
  local SpecialConfigId = DataMgr.SpecialQuestMechanism2SpecialConfigId[self.CreatorId]
  if not SpecialConfigId then
    return
  end
  self.TriggerQuestId = SpecialConfigId[1]
  self.TriggerTalkId = DataMgr.SpecialQuestConfig[SpecialConfigId[1]].TalkTriggerId or 600308
end

function M:BindEvent(Info)
  if not IsAuthority(self) then
    return
  end
  self.CollisionComponent.OnComponentBeginOverlap:Add(self, self.CollisionBeginOverlap)
  self.CollisionComponent.OnComponentEndOverlap:Add(self, self.CollisionEndOverlap)
  if Info.Creator then
    self:SetCapsuleSize(Info.Creator.TriggerCapsuleRadius, Info.Creator.TriggerCapsuleHalfHeight, Info.Creator.TriggerTipsCapsuleRadius, Info.Creator.TriggerTipsCapsuleHalfHeight)
  else
    local ObjectTypes = TArray(EObjectTypeQuery)
    ObjectTypes:Add(UE4.EObjectTypeQuery.Pawn)
    local OutActors = TArray(AActor)
    OutActors = UE4.UKismetSystemLibrary.ComponentOverlapActors(self.CollisionComponent, self.CollisionComponent:K2_GetComponentToWorld(), ObjectTypes)
    for i = 1, OutActors:Length() do
      local TargetActor = OutActors:GetRef(i)
      self:CollisionBeginOverlap(nil, TargetActor)
    end
  end
end

function M:SetCapsuleSize_Lua(NewRadius, NewHalfHeight, NewTipsRadius, NewTipsHalfHeight)
  if self.TipTrigger then
    self.TipTrigger.OnComponentBeginOverlap:Add(self, self.TalkBeginOverlap)
    self.TipTrigger.OnComponentEndOverlap:Add(self, self.TalkEndOverlap)
    self.TipTrigger:SetCapsuleSize(NewTipsRadius, NewTipsHalfHeight)
  end
end

function M:TalkBeginOverlap(Component, OtherActor)
end

function M:TalkEndOverlap(Component, OtherActor)
  if not OtherActor:IsPlayer() or not self.TriggerTalkId then
    return
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  UE4.UPlayTalkAsyncAction.PlayTalk(GameInstance, self.TriggerTalkId, nil)
end

function M:CreateTriggerRule(Creator)
  M.Super.CreateTriggerRule(self, Creator)
  if self.TipTrigger then
    self.InOrOutTrigger = "All"
  end
end

return M
