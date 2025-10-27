require("UnLua")
local M = Class("Blueprints.UI.BP_UIState_C")

function M:Initialize(Initializer)
  self.Super.Initialize(self)
end

function M:OnLoaded()
  self.Super.OnLoaded(self)
end

function M:SetPercent(Percent)
  self.Fushu_Bar:SetPercent(Percent)
end

function M:SetRemainTime(LifeTime)
  self.Text_Time:SetText(tostring(math.floor(LifeTime)) .. "s")
end

function M:ShowRemainTime()
  self.Text_Time:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:HideRemainTime()
  self.Text_Time:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnListItemObjectSet(Content)
  Content.SelfWidget = self
  self:SetPercent(Content.Percent)
  if Content.Hide then
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:PlayActiveAnimation()
  self:PlayAnimation(self.To_Active)
end

function M:PlayInActiveAnimation()
  self:PlayAnimation(self.To_Inactive)
end

return M
