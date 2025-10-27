require("UnLua")
local BP_PassiveEffectBase_C = Class({
  "BluePrints.Combat.Components.SkillLevelInterface",
  "BluePrints.Common.TimerMgr"
})

function BP_PassiveEffectBase_C:ReceiveBeginPlay()
  rawset(self, "BattleEvent", self.BattleEvent)
end

function BP_PassiveEffectBase_C:SetPassiveOwner(PassiveOwner)
  self.SavedPassiveOwner = PassiveOwner
  self:CheckInitSuccess()
end

function BP_PassiveEffectBase_C:SetPassiveEffectsReady()
  self:RemoveTimer(self.InitHandle)
  self:CheckInitSuccess()
end

function BP_PassiveEffectBase_C:CheckInitSuccess()
  if not IsValid(self.SavedPassiveOwner) then
    return
  end
  if not self.SavedPassiveOwner.InitSuccess then
    return
  end
  if not self.InitSuccess then
    self.PassiveOwner = self.SavedPassiveOwner
    self.Overridden.ReceiveBeginPlay(self)
    self.InitSuccess = true
    self:RemoveTimer(self.InitHandle)
  end
end

function BP_PassiveEffectBase_C:Destroy()
  self:RemoveTimer(self.InitHandle)
  self:K2_DestroyActor()
end

return BP_PassiveEffectBase_C
