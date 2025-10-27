require("UnLua")
local M = Class({
  "BluePrints.Item.BP_CombatItemBase_C",
  "BluePrints.Common.TimerMgr"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.ChestInteractiveComponent:InitInteractiveComponent(self.Data.InteractiveId)
  self.ChestInteractiveComponent.bCanUsed = false
  self.CurBomb = nil
end

function M:AuthorityInitInfo(Info)
  M.Super.AuthorityInitInfo(self, Info)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:GetDungeonComponent():AddBombLaunchPad(self.ManualItemId)
end

function M:ResetInfo()
  self.ChestInteractiveComponent.bCanUsed = false
  self.CurBomb = nil
end

function M:ReceiveBeginPlay()
  self.Super.ReceiveBeginPlay(self)
  self.Sphere.OnComponentBeginOverlap:Add(self, self.OnBeginOverlap)
  self.Sphere.OnComponentEndOverlap:Add(self, self.OnEndOverlap)
end

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  EventManager:AddEvent(EventID.OnPlayerGetAttachBomb, self, self.OnPlayerGetAttachBomb)
  EventManager:AddEvent(EventID.OnPlayerEndAttachBomb, self, self.OnPlayerEndAttachBomb)
end

function M:OnBeginOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex, bFromSweep, SweepResult)
  if OtherActor.IsTouchBomb and not self.CurBomb and OtherActor.OnDetach then
    self.CurBomb = OtherActor
    OtherActor:OnDetach()
    OtherActor:K2_SetActorLocation(self.Point:K2_GetComponentLocation(), false, nil, false)
    self:ChangeState("Manual", 0, self.Data.FirstStateId)
    self.ChestInteractiveComponent.bCanUsed = true
    self:OnSetBomb()
    self:PlaySound("event:/sfx/common/scene/shenmiao/ball_set")
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode then
      GameMode:GetDungeonComponent():CheckCanInteractiveBomb()
    end
  end
end

function M:OnEndOverlap(OverlappedComponent, OtherActor, OtherComp, OtherBodyIndex)
  if self.CurBomb and OtherActor == self.CurBomb then
    self.CurBomb = nil
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode then
      GameMode:GetDungeonComponent():ChangeAllBombToNormal()
    end
  end
end

function M:GetCanOpen()
  self.CanOpen = true
end

function M:ActiveCombat()
  M.Super.ActiveCombat(self)
  self.ChestInteractiveComponent.bCanUsed = false
  if self.CurBomb then
    self.CurBomb:OnPadLanuch(self.Offset)
    self:OnLaunchBomb()
    self:PlaySound("event:/sfx/common/scene/shenmiao/ball_shot")
  end
end

function M:OnPlayerGetAttachBomb()
  if self.ChestInteractiveComponent.bCanUsed then
    self.ChestInteractiveComponent.bCanUsed = false
  end
end

function M:OnPlayerEndAttachBomb()
  if not self.ChestInteractiveComponent.bCanUsed and self.CurBomb then
    self.ChestInteractiveComponent.bCanUsed = true
  end
end

return M
