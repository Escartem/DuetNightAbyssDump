local BP_MechanismSummon_C = Class({
  "BluePrints.Combat.Components.EffectSourceInterface",
  "BluePrints.Common.TimerMgr"
})
BP_MechanismSummon_C._components = {
  "BluePrints.Combat.Components.ActorTypeComponent",
  "BluePrints.Combat.Components.SkillLevelInterface",
  "BluePrints.Combat.Skill.MechanismSummonInitLogic",
  "BluePrints.Common.DelayFrameComponent"
}

function BP_MechanismSummon_C:ReceiveBeginPlay()
  EventManager:AddEvent(EventID.OnBattleReady, self, self.OnBattleReady_TryInitCharacterInfo)
end

function BP_MechanismSummon_C:OnBattleReady_TryInitCharacterInfo(_Battle)
  if Battle(self) == _Battle then
    self:TryInitActorInfo("Battle")
  end
end

function BP_MechanismSummon_C:RealReceiveBeginPlay()
  self.Data = DataMgr.MechanismSummon[self.UnitId]
  if self.Data.BluePrintParams then
    for Key, Value in pairs(self.Data.BluePrintParams) do
      self[Key] = Value
    end
  end
  self.InitSuccess = true
  self.Overridden.ReceiveBeginPlay(self)
  self:AllBeginPlay()
  self.Overridden.OnActorReady(self)
  if IsDedicatedServer(self) or IsStandAlone(self) then
    self:ServerBeginPlay(self)
  end
  if IsClient(self) or IsStandAlone(self) then
    self:ClientBeginPlay(self)
  end
  local Creator = self:GetDirectSource()
  if Creator and Creator:IsMainPlayer() and (IsStandAlone(self) or IsClient(self)) then
    EventManager:FireEvent(EventID.OnCharCallSummoner, self)
  end
end

function BP_MechanismSummon_C:ReceiveEndPlay(EndPlayReason)
  local Creator = self:GetDirectSource()
  if Creator and Creator:IsMainPlayer() and (IsStandAlone(self) or IsClient(self)) then
    EventManager:FireEvent(EventID.OnCharRemoveSummoner, self)
  end
  self.Overridden.ReceiveEndPlay(self, EndPlayReason)
  EventManager:RemoveEvent(EventID.OnBattleReady, self)
end

function BP_MechanismSummon_C:LoadCurrentModel()
  local ModelId = self.Data.ModelId
  if not ModelId then
    return
  end
  local ModelData = DataMgr.Model[ModelId]
  local ModelPath = ModelData.SkeletonMeshPath
  ModelPath = "/Game/" .. ModelPath
  local ModelMesh = UE4.UResourceLibrary.FindObject(self, ModelPath)
  if nil == ModelMesh then
    ModelMesh = LoadObject(ModelPath)
  end
  if ModelMesh then
    self.Mesh:SetSkeletalMesh(ModelMesh, true)
  end
end

function BP_MechanismSummon_C:OnDead(KillMineRoleEid, KillMineSkillId, DeathReason)
  local Creator = self:GetDirectSource()
  local CreatorName = Creator and Creator:GetName() or ""
  local CreatorEid = Creator and Creator.Eid or 0
  Battle(self):RecordBattleEvent_Lua("\229\143\172\229\148\164\232\128\133Eid\228\184\186:" .. CreatorEid .. "\239\188\140\229\143\172\229\148\164\232\128\133\229\144\141\229\173\151\228\184\186:" .. CreatorName .. "\239\188\140Eid\228\184\186:" .. self.Eid .. "\239\188\140\229\144\141\229\173\151\228\184\186" .. self:GetName() .. "\231\154\132\230\156\186\229\133\179\229\143\172\229\148\164\231\137\169\230\173\187\228\186\161\228\186\134\239\188\140\229\174\131\231\154\132UnitId\228\184\186:" .. self.UnitId, "MechanismSummon", 0)
  self:OnMechanismSummonDead(KillMineRoleEid, KillMineSkillId, DeathReason)
  if self.Data and self.Data.DelayDestroyTime then
    self.FXComponent:StopAllEffects(false)
    self:AddTimer_Combat(self.Data.DelayDestroyTime, function()
      self:EMActorDestroy(EDestroyReason.MechanismSummon)
    end)
  else
    self:EMActorDestroy(EDestroyReason.MechanismSummon)
  end
  if self.BillboardComponent then
    self.BillBoardComponent:CharOnDead()
  end
end

AssembleComponents(BP_MechanismSummon_C)
return BP_MechanismSummon_C
