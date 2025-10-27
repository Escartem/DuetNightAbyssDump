local M = Class()

function M:EnterTriggerBoxChecker(Params, EnteredTriggerBox, EnteredActor)
  return Params.UnitId == EnteredActor.UnitId
end

return M
