require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:SetIcon(IconPath)
  self.Icon_Ability:SetBrushResourceObject(LoadObject(IconPath))
end

function M:SetDispathchColor(DispatchTag, bIsLocked)
  local AnimName = UIUtils.GetDispathchColorNameByType(DispatchTag)
  if "Special" == AnimName then
    if bIsLocked then
      self:PlayAnimation(self.NoActive_Special)
    else
      self:PlayAnimation(self[AnimName])
    end
    return
  elseif bIsLocked then
    self:PlayAnimation(self.No_Active)
  else
    self:PlayAnimation(self.Active)
  end
  self:PlayAnimation(self[AnimName])
end

return M
