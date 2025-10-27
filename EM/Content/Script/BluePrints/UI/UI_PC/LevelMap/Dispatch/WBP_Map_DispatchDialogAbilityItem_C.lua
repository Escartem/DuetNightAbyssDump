require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  local Icon = LoadObject(Content.Info.Icon)
  self.Icon_Ability.Icon_Ability:SetBrushResourceObject(Icon)
  self:SetColor(Content.Info.DispatchTag)
  self.Text_Name:SetText(GText(Content.Info.Name))
  self.Text_Describe:SetText(GText(Content.Info.Description))
end

function M:SetColor(Type)
  local Data = DataMgr.CharDispatchTag[Type].IsBuff
  if Data then
    self.Icon_Ability:PlayAnimation(self.Icon_Ability.Special)
  else
    local ColorName = UIUtils.GetDispathchColorNameByType(Type)
    if ColorName then
      self.Icon_Ability:PlayAnimation(self.Icon_Ability.Active)
      self.Icon_Ability:PlayAnimation(self.Icon_Ability[ColorName])
    end
  end
end

return M
