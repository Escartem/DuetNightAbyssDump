require("Unlua")
local M = Class("BluePrints.Item.Mechanism.BP_PrologueDoor")

function M:ReceiveBeginPlay()
  M.Super.ReceiveBeginPlay(self)
  if not self.InitSuccess then
    self:InitActorInfo()
  end
end

return M
