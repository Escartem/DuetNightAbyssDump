require("UnLua")
local BP_AOITriggerBox_C = Class("BluePrints.Item.SceneItemBase")

function BP_AOITriggerBox_C:Initialize(Initializer)
  self.CallBack = nil
  self.OverlapActors = {}
end

function BP_AOITriggerBox_C:ReceiveBeginPlay()
  print(_G.LogTag, "LXZ AOITriggerBox, ReceiveBeginPlay", self:GetName())
end

function BP_AOITriggerBox_C:AuthorityInitInfo(Info)
  BP_AOITriggerBox_C.Super.AuthorityInitInfo(self, Info)
  self:InitTriggerEventId(Info)
  self:CreateTriggerRule(Info.Creator)
end

function BP_AOITriggerBox_C:CommonInitInfo(Info)
  Battle(self):AddEntity(self.Eid, self)
  self:RegisterToGameState()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.CombatItemMap:Add(self.Eid, self)
end

function BP_AOITriggerBox_C:OnActorReady(Info)
  BP_AOITriggerBox_C.Super.OnActorReady(self, Info)
  self:BindEvent(Info)
  print(_G.LogTag, "LXZ AOITriggerBox, OnActorReady", self:GetName(), self.CreatorId, Info.IntParams:Find("TriggerEventId"))
  self.CollisionComponent:SetCollisionEnabled(1)
end

function BP_AOITriggerBox_C:InitTriggerEventId(Info)
  self.TriggerEventId = Info.IntParams:Find("TriggerEventId") or self.CreatorId
  DebugPrint("BP_AOITriggerBox_C:InitTriggerEventId", self.TriggerEventId, self:GetName())
end

function BP_AOITriggerBox_C:BindEvent(Info)
  if not IsAuthority(self) then
    return
  end
  if Info.Creator then
    self:SetBoxExtent(Info.Creator.TriggerBoxContent, Info.Creator.TriggerTipsBoxContent)
  else
    self:SetBoxExtent(nil, nil)
  end
  self.CollisionComponent.OnComponentBeginOverlap:Add(self, self.CollisionBeginOverlap)
  self.CollisionComponent.OnComponentEndOverlap:Add(self, self.CollisionEndOverlap)
end

function BP_AOITriggerBox_C:SetBoxExtent_Lua(Size, TipSize)
  if Size and 0 ~= Size.X and 0 ~= Size.Y and 0 ~= Size.Z then
    self.CollisionComponent:SetBoxExtent(Size)
  end
end

function BP_AOITriggerBox_C:RegisterToGameState()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState:RegisterMechanism(self, self:GetUnitRealType())
end

function BP_AOITriggerBox_C:OnActorOverlap(OtherActor, TriggerType)
  self.TriggerNum = self.TriggerNum + 1
  if OtherActor.InitSuccess then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode then
      local TriggerEventId = self.TriggerEventId or self.CreatorId
      GameMode:TriggerAOIBase(TriggerEventId, self, OtherActor.Eid, TriggerType)
      if "BeginOverlap" == TriggerType then
        EventManager:FireEvent(EventID.OnEnterTriggerBox, TriggerEventId, self, OtherActor.Eid)
      elseif "EndOverlap" == TriggerType then
        EventManager:FireEvent(EventID.OnLeaveTriggerBox, TriggerEventId, self, OtherActor.Eid)
      end
    end
  end
  if self.CallBack then
    print("-----------------------------------BP_AOITriggerBox_C:ReceiveActorBeginOverlap:CallBack-----------------------------------")
    self.CallBack()
  end
  if self.TriggerRule.MaxTriggerNum and self.TriggerNum + 1 > self.TriggerRule.MaxTriggerNum then
    self:EMActorDestroy()
  end
end

function BP_AOITriggerBox_C:CollisionBeginOverlap(Component, OtherActor)
  print(_G.LogTag, "LXZ CollisionBeginOverlap", self:GetName(), OtherActor:GetName(), self.TriggerEventId)
  if not self:CheckCanTrigger(OtherActor) or self.InOrOutTrigger == "Out" then
    return
  end
  self:OnActorOverlap(OtherActor, "BeginOverlap")
  if self.BeginOverlapExecLogic then
    self.BeginOverlapExecLogic()
  end
  self.OverlapActors = self.OverlapActors or {}
  self.OverlapActors[OtherActor] = true
end

function BP_AOITriggerBox_C:CollisionEndOverlap(Component, OtherActor)
  if not self:CheckCanTrigger(OtherActor) or self.InOrOutTrigger == "In" then
    return
  end
  self:OnActorOverlap(OtherActor, "EndOverlap")
  if self.EndOverlapExecLogic then
    self.EndOverlapExecLogic()
  end
  self.OverlapActors = self.OverlapActors or {}
  self.OverlapActors[OtherActor] = nil
end

function BP_AOITriggerBox_C:CreateTriggerRule(Creator)
  local CollisionType
  if Creator then
    self.TriggerRule = {
      UnitId = 0 ~= Creator.TriggerUnitId and Creator.TriggerUnitId or nil,
      UnitType = Creator.TriggerUnitType ~= "" and Creator.TriggerUnitType or nil,
      ActorType = "" ~= Creator.TriggerActorType and Creator.TriggerActorType or nil,
      TriggerConditionId = 0 ~= Creator.TriggerConditionId and Creator.TriggerConditionId or nil,
      MaxTriggerNum = 0 ~= Creator.MaxTriggerNum and Creator.MaxTriggerNum or nil
    }
    self.InOrOutTrigger = Creator.InOrOutTrigger
    CollisionType = "" ~= Creator.CollisionType and Creator.CollisionType or nil
  else
    self.TriggerRule = {
      UnitId = 0 ~= self.TriggerUnitId and self.TriggerUnitId or nil,
      UnitType = self.TriggerUnitType ~= "" and self.TriggerUnitType or nil,
      ActorType = "" ~= self.TriggerActorType and self.TriggerActorType or nil,
      TriggerConditionId = 0 ~= self.TriggerConditionId and self.TriggerConditionId or nil,
      MaxTriggerNum = 0 ~= self.MaxTriggerNum and self.MaxTriggerNum or nil
    }
    self.InOrOutTrigger = self.InOrOutTrigger
    CollisionType = "" ~= self.CollisionType and self.CollisionType or nil
  end
  self:SetCollision(CollisionType)
end

function BP_AOITriggerBox_C:CheckCanTrigger(TriggerActor)
  local Res = true
  if self.TriggerRule == nil then
    return false
  end
  for i, v in pairs(self.TriggerRule) do
    if self["CheckRule" .. i] and not self["CheckRule" .. i](self, TriggerActor, v) then
      return false
    end
  end
  return Res
end

function BP_AOITriggerBox_C:CheckRuleUnitId(TriggerActor, UnitId)
  return TriggerActor.UnitId == UnitId
end

function BP_AOITriggerBox_C:CheckRuleUnitType(TriggerActor, UnitType)
  return TriggerActor.UnitType == UnitType
end

function BP_AOITriggerBox_C:CheckRuleActorType(TriggerActor, ActorType)
  return TriggerActor["Is" .. ActorType] and TriggerActor["Is" .. ActorType](TriggerActor)
end

function BP_AOITriggerBox_C:CheckRuleTriggerConditionId(TriggerActor, TriggerConditionId)
  return true
end

function BP_AOITriggerBox_C:CheckRuleMaxTriggerNum(TriggerActor, MaxTriggerNum)
  if MaxTriggerNum >= self.TriggerNum + 1 then
    return true
  end
  return false
end

function BP_AOITriggerBox_C:SetCallBack(CB)
  self:UpdateRegionData("CallBack", CB)
  self.CallBack = CB
end

function BP_AOITriggerBox_C:SetCollision(ObjectType)
  if not ObjectType then
    return
  end
  self:SetCollisionType("CollisionComponent", ObjectType, ECollisionResponse.ECR_OverLap, true)
end

function BP_AOITriggerBox_C:SetCollisionType_Lua(ComponentName, ChannelIndex, Response, Reset)
  if Reset then
    self[ComponentName]:SetCollisionResponseToAllChannels(ECollisionResponse.ECR_Ignore)
  end
  self[ComponentName]:SetCollisionResponseToChannel(ChannelIndex, Response)
end

function BP_AOITriggerBox_C:HasOverlapActors()
  self.OverlapActors = self.OverlapActors or {}
  return not IsEmptyTable(self.OverlapActors)
end

return BP_AOITriggerBox_C
