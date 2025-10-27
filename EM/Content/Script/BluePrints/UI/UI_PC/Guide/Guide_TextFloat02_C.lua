local Guide_TextFloat02_PC = Class("BluePrints.UI.BP_UIState_C")

function Guide_TextFloat02_PC:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local BuffName, BuffIconPath, BuffChangeInfo, LastTime = ...
  self.Text_Float01:SetText(BuffName)
  local BuffIcon = LoadObject(BuffIconPath)
  self.Img_Icon:SetBrushResourceObject(BuffIcon, false)
  self.Text_Float02:SetText(BuffChangeInfo)
  self:AddTimer(LastTime, self.Close)
  self:PlayAnimation(self.In)
end

function Guide_TextFloat02_PC:Close()
  local _, Proxy = UWidgetAnimationPlayCallbackProxy.CreatePlayAnimationProxyObject(nil, self, self.Out, 0, 1, 0)
  Proxy.Finished:Add(self, self.OnClose_Internal)
end

function Guide_TextFloat02_PC:OnClose_Internal()
  self.Super.Close(self)
end

return Guide_TextFloat02_PC
