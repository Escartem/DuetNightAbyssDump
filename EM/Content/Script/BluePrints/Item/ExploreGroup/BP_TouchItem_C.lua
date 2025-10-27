local M = Class("BluePrints/Item/BP_CombatItemBase_C")

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  if not self.ToughRange then
    return
  end
  self.bTouched = false
  self.ToughRange.OnComponentBeginOverlap:Add(self, self.OnStartTough)
  self.ToughRange.OnComponentEndOverlap:Add(self, self.OnEndTough)
  self.ToughRange:SetCollisionProfileName("OnlyPlayer", true)
end

function M:OnStartTough(Component, OtherActor, OtherComp)
  print(_G.LogTag, "LXZ OnStartTough", OtherComp:GetName(), OtherActor:GetName())
  if self.bTouched or not self.bCanTouch then
    self.bTouched = true
    return
  end
  self.bTouched = true
  self:ChangeState("TriggerBox")
end

function M:OnEndTough(Component, OtherActor, OtherComp)
  if not self.bTouched or not self.bCanTouch then
    self.bTouched = false
    return
  end
  self.bTouched = false
end

function M:OnExploreStoneShowEnd()
  if not self.ShowEndCallback then
    return
  end
  self:ShowEndCallback()
end

function M:ReceiveBeginPlay()
  if not self.ToughRange then
    return
  end
  self.ToughRange:SetCollisionEnabled(0)
end

return M
