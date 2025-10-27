require("UnLua")
require("DataMgr")
local CommonConst = require("CommonConst")
local MiscUtils = require("Utils.MiscUtils")
local BP_NewBreakableItem_C = Class({
  "BluePrints.Combat.Components.EffectSourceInterface",
  "BluePrints.Common.TimerMgr"
})
BP_NewBreakableItem_C._components = {
  "BluePrints.Combat.Components.SkillLevelInterface",
  "BluePrints.Common.DelayFrameComponent",
  "BluePrints.Combat.Components.ActorTypeComponent"
}

function BP_NewBreakableItem_C:ReceiveBeginPlay()
  DebugPrint("BP_NewBreakableItem_C", self:GetName(), self:K2_GetActorLocation())
  self.Overridden.ReceiveBeginPlay(self)
  EventManager:AddEvent(EventID.OnBattleReady, self, self.OnBattleReady_TryInitCharacterInfo)
  if self.BpBorn and IsAuthority(self) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if not GameMode:GetAlreadyInit() then
      GameMode.BPBornActor:AddUnique(self)
    end
    self:RegisterInfo({
      UnitId = self.UnitId,
      UnitType = self.UnitType
    })
  end
end

function BP_NewBreakableItem_C:OnBattleReady_TryInitCharacterInfo(_Battle)
  if Battle(self) == _Battle then
    self:TryInitActorInfo("Battle")
  end
end

function BP_NewBreakableItem_C:RealReceiveBeginPlay()
  self.InitSuccess = true
  self.Overridden.OnActorReady(self)
end

function BP_NewBreakableItem_C:BeginInitInfo()
  if self.InitSuccess then
    return
  end
  self:InitActorInfo()
end

function BP_NewBreakableItem_C:RegisterInfo(Info)
  if Info then
    self.InfoForInit = Info
  end
  self:TryInitActorInfo("InitInfo")
end

function BP_NewBreakableItem_C:OnRep_ServerInitSuccess()
  self.InfoForInit = {
    UnitId = self.UnitId,
    UnitType = self.UnitType
  }
  self:TryInitActorInfo("InitInfo")
end

function BP_NewBreakableItem_C:InitActorInfo(Info)
  if nil == Info then
    Info = self.InfoForInit
  end
  self:PreInitInfo(Info)
  if IsAuthority(self) then
    self:AuthorityInitInfo(Info)
  end
  self:CommonInitInfo(Info)
  if IsStandAlone(self) or not IsAuthority(self) then
    self:ClientInitInfo(Info)
  end
  self.ServerInitSuccess = true
  self.InitSuccess = true
  self:OnActorReady(Info)
end

function BP_NewBreakableItem_C:ClientInitInfo(Info)
  self:InitItemClientInfo()
end

function BP_NewBreakableItem_C:OnActorReady(Info)
  self:RealReceiveBeginPlay()
end

function BP_NewBreakableItem_C:AuthorityInitInfo(Info)
  self:SetCamp(self.Camp)
  self:SetTableAttr()
  self.ModelId = self.ModelId or self.BPModelId
  self:InitCreatorInfo(Info)
  self:InitCombatPropInfo()
end

function BP_NewBreakableItem_C:InitCreatorInfo(Info)
end

function BP_NewBreakableItem_C:CommonInitInfo()
  Battle(self):AddEntity(self.Eid, self)
  self:InitComponent()
end

function BP_NewBreakableItem_C:InitComponent(Info)
  self:AddNavModifier()
end

function BP_NewBreakableItem_C:PreInitInfo(Info)
  self.Data = DataMgr.Mechanism[self.UnitId]
  if not self.Data then
    return
  end
  self.BattleCharInfo = DataMgr.BattleMonster[self.Data.BattleRoleId]
  if Info.Eid ~= nil then
    self.Eid = Info.Eid
  elseif IsAuthority(self) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    self.Eid = GameMode:GetBattleEid()
  end
end

function BP_NewBreakableItem_C:InitCombatPropInfo()
end

function BP_NewBreakableItem_C:InitItemClientInfo()
  self:ItemMeshChildComponentInit()
end

function BP_NewBreakableItem_C:OnDead(KillMineRoleEid, KillMineSkillId, DeathReason)
  if not self.EnbaleHollow then
    self:SetHollowAttribute()
  end
  self:ShowDeath()
  local Player = Battle(self):GetEntity(KillMineRoleEid)
  if IsValid(Player) and Player.IsPlayer and Player:IsPlayer() then
    Player:AddBreakableItemCount()
  end
  local ExtraInfo = {
    UniqueSign = self.Eid,
    SourceEid = KillMineRoleEid
  }
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if GameMode then
    GameMode:TriggerRewardEvent(self.UnitId, CommonConst.RewardReason.BreakableItem, self:GetTransform(), ExtraInfo)
  end
end

function BP_NewBreakableItem_C:HandleShowDeath()
  self:SetActorEnableCollision(false)
  if not IsDedicatedServer(self) then
    self:PlayBreakFx()
    self:ArtShowDeath()
    self:PlayBreakSound()
  end
  self:AddTimer(self.DelayDestoryTime, function()
    self:EMActorDestroy(EDestroyReason.Breakable)
  end)
end

function BP_NewBreakableItem_C:ShowDeath(DissolveDuration)
  if self.SourceEid then
    self:TriggerSource()
  end
  if self.EMNavModifierComponent then
    self.EMNavModifierComponent:K2_DestroyComponent(self.EMNavModifierComponent)
  end
  self:HandleShowDeath()
end

function BP_NewBreakableItem_C:PlayBreakFx()
  local Meshs = TArray(UStaticMeshComponent)
  self.Mesh:GetChildrenComponents(true, Meshs)
  for i = 1, Meshs:Length() do
    local Mesh = Meshs:GetRef(i)
    if Mesh:Cast(UStaticMeshComponent) then
      Mesh:SetCastShadow(false)
    end
  end
end

local BreakSoundEvents = {
  Pot = "event:/sfx/common/scene/break/single/Ceramic",
  StoneFracture = "event:/sfx/common/scene/break/single/StoneFracture",
  Wood = "event:/sfx/common/scene/break/single/Wood",
  PotInWood = "event:/sfx/common/scene/break/single/PotInWood"
}

function BP_NewBreakableItem_C:PlayBreakSound()
  if self.SoundEvent then
    AudioManager(self):PlayFMODSound(self, nil, self.SoundEvent)
  else
    print(_G.LogTag, "\231\160\180\231\162\142\231\137\169" .. self:GetName() .. "\230\151\160\229\175\185\229\186\148\230\146\173\230\148\190\231\154\132\233\159\179\230\149\136")
  end
end

function BP_NewBreakableItem_C:SetHollowAttribute()
  self.EnbaleHollow = true
end

function BP_NewBreakableItem_C:GetFXMesh()
  local Meshs = TArray(UStaticMeshComponent)
  self.Mesh:GetChildrenComponents(true, Meshs)
  if Meshs:Length() < 1 then
    return self.Mesh
  end
  local Index = math.random(Meshs:Length())
  return Meshs[Index]
end

function BP_NewBreakableItem_C:CheckUnitNeedStorage()
  return false
end

function BP_NewBreakableItem_C:IsInDefeat()
  return false
end

function BP_NewBreakableItem_C:OnEMActorDestroy(DestroyReason)
  if not rawget(self, "bRemoveTickLod") then
    MiscUtils.RemoveTickLodActor(ESignificanceTag.None, self, ETickObjectFlag.FLAG_ALL)
    rawset(self, "bRemoveTickLod", true)
  end
end

function BP_NewBreakableItem_C:ReceiveEndPlay(reason)
  EventManager:RemoveEvent(EventID.OnBattleReady, self)
  self.Overridden.ReceiveEndPlay(self, reason)
end

AssembleComponents(BP_NewBreakableItem_C)
return BP_NewBreakableItem_C
