require("UnLua")
local M = Class({
  "BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C",
  "BluePrints.Common.TimerMgr"
})

function M:StartInteractive(PlayerActor)
  self.PlayerEid = PlayerActor.Eid
  local Owner = self:GetOwner()
  Owner:OpenMechanism(PlayerActor.Eid)
end

function M:EndInteractive(PlayerActor)
  if 0 == self.PlayerEid then
    return
  end
  self.PlayerEid = 0
  local Owner = self:GetOwner()
  Owner:CloseMechanism(PlayerActor.Eid, true)
end

function M:ForceEndInteractive(PlayerActor)
  local Owner = self:GetOwner()
  Owner:ForceCloseMechanism(PlayerActor.Eid, true)
end

function M:IsCanInteractive(PlayerActor)
  return false
end

function M:ReceiveBeginPlay()
  self.MontageName = "Interactive_02_Montage"
end

return M
