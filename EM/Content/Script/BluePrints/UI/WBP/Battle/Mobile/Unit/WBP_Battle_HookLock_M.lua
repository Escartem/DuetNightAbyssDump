require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Init()
  print(_G.LogTag, "LXZ Init11111")
  Traceback()
  self.Button_Area.OnClicked:Add(self, self.OnClickButton)
  self:BindToAnimationFinished(self.Out, {
    self,
    function()
      print(_G.LogTag, "LXZ Init")
      self:SetVisibility(ESlateVisibility.Collapsed)
    end
  })
  self:Open()
end

function M:OnClickButton()
  if not self.HookComp then
    return
  end
  self.HookComp:StartInteractive(self.Player)
end

function M:Open()
  print(_G.LogTag, "LXZ Init Open")
  self:PlayAnimation(self.In)
end

function M:Close()
  print(_G.LogTag, "LXZ Init Close")
  self:PlayAnimation(self.Out)
  self.Hook = nil
  self.HookComp = nil
  self.Player = nil
  M.Super.Close(self)
end

function M:UpdateOwner(Hook, HookComp, PlayerActor)
  self.Hook = Hook
  self.HookComp = HookComp
  self.Player = PlayerActor
end

return M
