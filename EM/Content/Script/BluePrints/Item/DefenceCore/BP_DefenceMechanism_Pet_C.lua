require("UnLua")
local M = Class({
  "BluePrints/Item/DefenceCore/BP_DefenceMechanism_C"
})

function M:GetCanOpen()
  self.CanOpen = true
end

function M:AuthorityInitInfo(Info)
  M.Super.AuthorityInitInfo(self, Info)
  self.IsPetDefenceMechanism = true
end

function M:GetGuidePos()
  return self:K2_GetActorLocation() + self.GuidePos.RelativeLocation
end

return M
