require("UnLua")
require("DataMgr")
local MiscUtils = require("Utils.MiscUtils")
local CommonConst = require("CommonConst")
local BP_BreakableItem_C = Class("BluePrints/Item/CombatProp/BP_CombatPropBase_C")

function BP_BreakableItem_C:AuthorityInitInfo(Info)
  if not self.Data then
    return
  end
  BP_BreakableItem_C.Super.AuthorityInitInfo(self, Info)
  self.RewardId = self.Data.RewardId
  self.ModelId = self.ModelId or self.BPModelId
  self.ActiveType = ""
end

function BP_BreakableItem_C:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  if self.UnitId <= 0 or self.UnitType == "" then
    return
  end
  if self.BpBorn and IsAuthority(self) then
    self:InitActorInfo({
      UnitId = self.UnitId,
      UnitType = self.UnitType
    })
  end
end

function BP_BreakableItem_C:InitCombatPropInfo()
end

function BP_BreakableItem_C:ClientInitInfo(Info)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if GameState then
    GameState:TryRegisterFirstSeeMehcanism(self.UnitId, self.Eid)
  end
  if IsValid(self.BillboardComponent) then
    self.BillboardComponent:SetTickMode(ETickMode.Disabled)
  end
  self:InitItemClientInfo()
end

function BP_BreakableItem_C:OnBreakCountDown(SourceEid)
  BP_BreakableItem_C.Super.OnBreakCountDown(self, SourceEid)
  self.Overridden.OnBreakCountDown(self, SourceEid)
end

function BP_BreakableItem_C:InitItemClientInfo()
  self:ItemMeshChildComponentInit()
end

function BP_BreakableItem_C:OnDead(KillMineRoleEid, KillMineSkillId, DeathReason)
  if not self.EnbaleHollow then
    self:SetHollowAttribute()
  end
  self.Super.OnDead(self, KillMineRoleEid, KillMineSkillId, DeathReason)
  if self.EMNavModifierComponent then
    self.EMNavModifierComponent:K2_DestroyComponent(self.EMNavModifierComponent)
  end
end

function BP_BreakableItem_C:HandleShowDeath()
  self:SetActorEnableCollision(false)
  self:PlayBreakFx()
  self:ArtShowDeath()
  self:PlayBreakSound()
  self:AddTimer(self.DelayDestoryTime, function()
    self:EMActorDestroy(EDestroyReason.Breakable)
  end)
end

function BP_BreakableItem_C:ShowDeath(DissolveDuration)
  self:HandleShowDeath()
  if IsDedicatedServer(self) then
    self:ClientHandleShowDeath()
    self:AddTimer(self.DelayDestoryTime, function()
      self:EMActorDestroy(EDestroyReason.Breakable)
    end)
  end
end

function BP_BreakableItem_C:PlayBreakFx()
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

function BP_BreakableItem_C:PlayBreakSound()
  if self.SoundEvent then
    AudioManager(self):PlayFMODSound(self, nil, self.SoundEvent)
  else
    print(_G.LogTag, "\231\160\180\231\162\142\231\137\169" .. self:GetName() .. "\230\151\160\229\175\185\229\186\148\230\146\173\230\148\190\231\154\132\233\159\179\230\149\136")
  end
end

function BP_BreakableItem_C:SetHollowAttribute()
  self.EnbaleHollow = true
end

function BP_BreakableItem_C:GetFXMesh()
  local Meshs = TArray(UStaticMeshComponent)
  self.Mesh:GetChildrenComponents(true, Meshs)
  if Meshs:Length() < 1 then
    return self.Mesh
  end
  local Index = math.random(Meshs:Length())
  return Meshs[Index]
end

function BP_BreakableItem_C:CheckUnitNeedStorage()
  return false
end

function BP_BreakableItem_C:OnEMActorDestroy(DestroyReason)
  BP_BreakableItem_C.Super.OnEMActorDestroy(self, DestroyReason)
  MiscUtils.RemoveTickLodActor(ESignificanceTag.None, self, ETickObjectFlag.FLAG_ALL)
end

return BP_BreakableItem_C
