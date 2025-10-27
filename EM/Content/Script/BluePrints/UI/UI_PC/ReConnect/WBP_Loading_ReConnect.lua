require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
end

function M:ExInit(...)
  self.bDisplayOnly, self.bAsChild = ...
  self:OnLoaded()
end

function M:OnLoaded()
  if not self.bDisplayOnly then
    DebugPrint("gmy@WBP_Loading_ReConnect M:OnLoaded", debug.traceback())
    local NetworkMgr = GWorld.NetworkMgr
    if NetworkMgr then
      NetworkMgr.bUIReConnecting = true
    end
  end
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Common_Loading_PC:PlayAnimationForward(self.Common_Loading_PC.In)
  self.Common_Loading_PC:PlayAnimation(self.Common_Loading_PC.Loop, 0, 0)
end

function M:Close()
  if not self.bDisplayOnly then
    DebugPrint("gmy@WBP_Loading_ReConnect M:Close", debug.traceback())
    local NetworkMgr = GWorld.NetworkMgr
    if NetworkMgr then
      NetworkMgr.bUIReConnecting = false
    end
  end
  if not self.bAsChild then
    self:RealClose()
  else
    self.Common_Loading_PC:StopAllAnimations()
    self:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

return M
