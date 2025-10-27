require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.IsSelect = false
  self.Button_Area.OnClicked:Add(self, self.OnClicked)
  self.Button_Area.OnPressed:Add(self, self.OnPressed)
  self.Button_Area.OnReleased:Add(self, self.OnReleased)
  self.Button_Area.OnHovered:Add(self, self.OnHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnUnhovered)
end

function M:InitContent(DamageType)
  self:PlayAnimation(self.Normal)
  self.Type = DamageType
  local Icon = LoadObject(DataMgr.Attribute[DamageType].Icon)
  self.Icon_Type:SetBrushResourceObject(Icon)
end

function M:OnClicked(bDefault)
  if self.IsSelect then
    return
  end
  self.IsSelect = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  if not bDefault then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small_crystal", nil, nil)
  end
  if self.Type then
    self:PlayAnimation(self[self.Type])
  end
end

function M:OnPressed()
  if self.IsSelect then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnReleased()
end

function M:OnHovered()
  if self.IsSelect then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnUnhovered()
  if self.IsSelect then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Unhover)
end

return M
