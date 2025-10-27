require("UnLua")
local M = Class({
  "BluePrints.Item.BP_CombatItemBase_C"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  local CorrectDirection = self.UnitParams.CorrectDirection
  if "X" == CorrectDirection then
    self:SetPanelCorrectDirction(0)
  elseif "-X" == CorrectDirection then
    self:SetPanelCorrectDirction(1)
  elseif "Y" == CorrectDirection then
    self:SetPanelCorrectDirction(2)
  elseif "-Y" == CorrectDirection then
    self:SetPanelCorrectDirction(3)
  elseif "Z" == CorrectDirection then
    self:SetPanelCorrectDirction(4)
  elseif "-Z" == CorrectDirection then
    self:SetPanelCorrectDirction(5)
  end
end

return M
