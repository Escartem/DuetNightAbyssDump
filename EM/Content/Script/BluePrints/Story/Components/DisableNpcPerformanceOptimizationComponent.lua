local FDisableNpcPerformanceOptimizationComponent = {}

function FDisableNpcPerformanceOptimizationComponent:New()
  local DisableNpcPerformanceOptimizationComponent = setmetatable({}, {__index = FDisableNpcPerformanceOptimizationComponent})
  return DisableNpcPerformanceOptimizationComponent
end

function FDisableNpcPerformanceOptimizationComponent:Execute()
  local UnitBudgetMgr = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UE4.UUnitBudgetAllocatorSubsystem)
  DebugPrint("Talk:\229\133\179\233\151\173Npc\228\188\152\229\140\150", UnitBudgetMgr)
  if UnitBudgetMgr then
    UnitBudgetMgr:ShowAllNpcEnable(true)
  end
end

function FDisableNpcPerformanceOptimizationComponent:Resume()
  local UnitBudgetMgr = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UE4.UUnitBudgetAllocatorSubsystem)
  DebugPrint("Talk:\230\129\162\229\164\141Npc\228\188\152\229\140\150", UnitBudgetMgr)
  if UnitBudgetMgr then
    UnitBudgetMgr:ShowAllNpcEnable(false)
  end
end

return FDisableNpcPerformanceOptimizationComponent
