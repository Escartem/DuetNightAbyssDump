require("UnLua")
local M = Class({
  "BluePrints/Item/CombatProp/BP_CombatPropBase_C"
})

function M:OnBreakCountDown(SourceEid)
  if not self:CheckTag() then
    return
  end
  M.Super.OnBreakCountDown(self, SourceEid)
  self:ChangeState("Hit", SourceEid)
end

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  self.Trigger.OnComponentBeginOverlap:Add(self, self.CollisionBeginOverlap)
  self.Trigger.OnComponentEndOverlap:Add(self, self.CollisionEndOverlap)
  self.Trigger:SetCollisionProfileName("OnlyPlayer", true)
end

function M:CollisionBeginOverlap(Component, OtherActor)
  if not OtherActor.IsPlayer or not OtherActor:IsPlayer() then
    return
  end
  local TagObject = OtherActor:GetPlayerLevelTagObject()
  TagObject.OnAddLevelTag:Add(self, self.OnPlayerTagChange)
  TagObject.OnRemoveLevelTag:Add(self, self.OnPlayerTagChange)
  self.Player = OtherActor
  if not self:CheckTag() then
    return
  end
  self:ChangeState("TriggerBox")
end

function M:CollisionEndOverlap(Component, OtherActor)
  if not OtherActor.IsPlayer or not OtherActor:IsPlayer() then
    return
  end
  local TagObject = OtherActor:GetPlayerLevelTagObject()
  TagObject.OnAddLevelTag:Remove(self, self.OnPlayerTagChange)
  TagObject.OnRemoveLevelTag:Remove(self, self.OnPlayerTagChange)
  self.Player = nil
  if not self:CheckTag() then
    return
  end
  self:ChangeState("LeaveTriggerBox")
end

function M:CheckTag()
  if not self.bCheckTag then
    return true
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if IsValid(Player) then
    local Res = self:CheckPlayerLevelTag(Player)
    return Res
  end
  return false
end

function M:CheckPlayerIn()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if self.Player == Player then
    return true
  end
  return false
end

function M:OnPlayerTagChange(Tag, Time)
  if not self.Player or not self:CheckTag() then
    return
  end
  self:ChangeState("TriggerBox")
end

function M:ReceiveEndPlay()
  if self.Player then
    local TagObject = self.Player:GetPlayerLevelTagObject()
    TagObject.OnAddLevelTag:Remove(self, self.OnPlayerTagChange)
    TagObject.OnRemoveLevelTag:Remove(self, self.OnPlayerTagChange)
  end
end

return M
