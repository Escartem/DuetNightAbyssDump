local BP_PassiveEffectClient_C = Class("BluePrints.Common.TimerMgr")

function BP_PassiveEffectClient_C:ReceiveBeginPlay()
  if not self.Owner or not self.Owner.InitSuccess then
    self.InitTimerHandle = self:AddTimer(0.1, self.TryInit, true)
    return
  end
  self:Init()
end

function BP_PassiveEffectClient_C:TryInit()
  if not self.Owner or not self.Owner.InitSuccess then
    return
  end
  self:Init()
end

function BP_PassiveEffectClient_C:Init()
  self.PassiveOwner = self.Owner
  self.PassiveOwner.PassiveEffectClient = self
  self.Overridden.ReceiveBeginPlay(self)
  self:RemoveTimer(self.InitTimerHandle)
  self.InitTimerHandle = nil
end

return BP_PassiveEffectClient_C
