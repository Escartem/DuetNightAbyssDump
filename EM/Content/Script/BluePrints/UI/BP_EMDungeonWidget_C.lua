local M = Class({
  "BluePrints.Common.StageTimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:AddTimer(Interval, Func, IsLoop, Delay, Key, IsRealTime, ...)
  return M.Super.AddTimer(self, Interval, Func, IsLoop, Delay, Key, IsRealTime, UE4.ETickingGroup.TG_EndPhysics, ...)
end

return M
