local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded()
  self:PlayAnimation(self.In)
  self.Text_Toast:SetText(GText("UI_Alert_100"))
  self:AddTimer(3, self.PlayOutAnim)
end

function M:PlayOutAnim()
  local _, Proxy = UWidgetAnimationPlayCallbackProxy.CreatePlayAnimationProxyObject(nil, self, self.Out, 0, 1, 0)
  Proxy.Finished:Add(self, self.Close)
end

return M
