require("Unlua")
require("Const")
local M = Class()

function M:Initialize_Lua()
  self.SystemEnableState = 2
  self.CacheFrameDeltaSeconds = 0.033333
  self.bDebugBonesTrans = false
  self.bDebugCachedTrans = false
  self.DebugCacheTransType = 4
  self.BodyFilterBoneName = "Spine_02"
end

return M
