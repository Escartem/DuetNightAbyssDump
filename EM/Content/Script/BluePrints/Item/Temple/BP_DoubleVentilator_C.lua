local M = Class("BluePrints.Item.BP_CombatItemBase_C")

function M:ActiveCombat(bFromGameMode)
  DebugPrint("ActiveCombat BP_DoubleVentilator_C ==========================")
  self.IsOpen = true
end

function M:InactiveCombat(bFromGameMode)
  DebugPrint("InactiveCombat BP_DoubleVentilator_C =============================")
  self.IsOpen = false
end

function M:ResetInfo()
  self:InactiveCombat()
end

function M:ReceiveTick(DeltaSeconds)
  self.Overridden.ReceiveTick(self, DeltaSeconds)
end

return M
