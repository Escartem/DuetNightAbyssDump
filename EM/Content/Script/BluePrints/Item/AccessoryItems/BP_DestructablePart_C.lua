require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local UIUtils = require("Utils.UIUtils")
local GMVariable = require("BluePrints.UI.GMInterface.GMVariable")
local BP_DestructablePart_C = Class("BluePrints.Combat.Skill.BP_MechanismSummon_C")
local ConstInitCompleteNum = 2

function BP_DestructablePart_C:ReceiveBeginPlay()
  self.Overridden.ReceiveBeginPlay(self)
  self.AlreadyReplicatedNum = 0
end

function BP_DestructablePart_C:InitInfoFromComponent(Owner, InfoSceneComp)
  if IsAuthority(self) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    self.Eid = GameMode:GetBattleEid()
  end
  if not Battle(self) then
    return
  end
  Battle(self):AddEntity(self.Eid, self)
  self.LastEid = self.Eid
  self.PartId = InfoSceneComp.PartId
  self.AttachmentName = InfoSceneComp.SocketName
  self:AttachWhenReady(Owner)
  self.InitSuccess = true
  self.ServerInitSuccess = true
  self.IsDestructablePart = true
  self:SetBool("IsDestructPart", true)
end

function BP_DestructablePart_C:GetBattleInfo()
  self.BattleCharInfo = DataMgr.BattleMonster[self.InfoId]
end

function BP_DestructablePart_C:InitInfo(Owner, AttachmentName, TableInfo)
  if IsAuthority(self) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    self.Eid = GameMode:GetBattleEid()
  end
  if not Battle(self) then
    return
  end
  Battle(self):AddEntity(self.Eid, self)
  self.LastEid = self.Eid
  self.PartId = TableInfo.PartId
  self.AttachmentName = AttachmentName
  self.InitSuccess = true
  self.ServerInitSuccess = true
  self:AttachWhenReady(Owner)
  self.IsDestructablePart = true
  self:SetBool("IsDestructPart", true)
end

function BP_DestructablePart_C:AttachWhenReady(Owner)
  local DirectSource = Owner
  if IsAuthority(self) then
    self:SetDirectSource(Owner and Owner.Eid)
    self:SetCamp(Owner:GetCamp())
  end
  if not IsAuthority(self) then
    DirectSource = self:GetDirectSource()
  end
  if DirectSource then
    DirectSource:RegisterAttachment(self.AttachmentName, self)
  end
  if IsAuthority(self) and DirectSource then
    self:SetAttr("MaxHp", DirectSource:GetAttr("MaxHp") * self.HpPercent)
    self:SetAttr("Hp", self:GetAttr("MaxHp"))
    self:CalcHpPercent()
    self:SetAttr("DEF", 0)
  end
  if not IsStandAlone(self) and not MiscUtils.IsSimulatedProxy(self) then
    return
  end
  self:InitUIWidgetComponent()
  if IsValid(self.BillboardComponent) then
    self.BillboardComponent:K2_AttachToComponent(self.ItemMesh, self.AttachmentName, UE4.EAttachmentRule.SnapToTarget, UE4.EAttachmentRule.SnapToTarget, UE4.EAttachmentRule.SnapToTarget)
    self.BillboardComponent:InitBossPlaceBillBoard(self, "BossPlace")
  end
end

function BP_DestructablePart_C:OnDamaged(DamageEvent)
  if not self.TransferDamage or not IsAuthority(self) then
    return
  end
  self:TryTransferDamage(self:GetDirectSource(), DamageEvent)
end

function BP_DestructablePart_C:OnDead()
  print(_G.LogTag, "OnDead!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
  self:Deactivate()
  local DirectSource = self:GetDirectSource()
  print(_G.LogTag, "OnDeadGZJY")
  if DirectSource and DirectSource.DestructableBodyMgr then
    DirectSource:OnPartBreak(self.AttachmentName)
  end
end

function BP_DestructablePart_C:Activate()
  print(_G.LogTag, "BP_DestructablePart_C:Activate")
  self:SetDead(false, 0, 0, 0)
  self.IsActivated = true
  self:SetAttr("Hp", self:GetAttr("MaxHp"))
  self:CalcHpPercent()
  self:SetActorHideTag("Deactivate", false)
  self:SetActorEnableCollision(not self.DisableCollision)
end

function BP_DestructablePart_C:Deactivate()
  print(_G.LogTag, "BP_DestructablePart_C:Deactivate")
  self.IsActivated = false
  self:SetActorHideTag("Deactivate", true)
  self:SetActorEnableCollision(false)
end

function BP_DestructablePart_C:OnRep_ServerInitSuccess()
  self.IsDestructablePart = true
  self:SetBool("IsDestructPart", true)
end

function BP_DestructablePart_C:OnRep_PartId()
  self.AlreadyReplicatedNum = self.AlreadyReplicatedNum + 1
  if self.AlreadyReplicatedNum >= ConstInitCompleteNum then
    self:AttachWhenReady()
  end
end

function BP_DestructablePart_C:OnRep_AttachmentName()
  self.AlreadyReplicatedNum = self.AlreadyReplicatedNum + 1
  if self.AlreadyReplicatedNum >= ConstInitCompleteNum then
    self:AttachWhenReady()
  end
end

function BP_DestructablePart_C:Destroy()
  if not IsValid(self) then
    return
  end
  Battle(self):RemoveEntity(self.Eid)
  self:K2_DestroyActor()
end

return BP_DestructablePart_C
