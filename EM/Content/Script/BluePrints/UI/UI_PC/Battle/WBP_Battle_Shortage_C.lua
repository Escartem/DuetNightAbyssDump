require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")

function M:InitConfig(Owner, IconPath, BuffId)
  self.Owner = Owner
  self.Eid = Owner.Eid
  self.ShowBuffId = BuffId
  if IconPath then
    self.Icon_Shortage:SetBrushResourceObject(LoadObject(IconPath))
  end
  self:SetVisibility(ESlateVisibility.Collapsed)
end

return M
