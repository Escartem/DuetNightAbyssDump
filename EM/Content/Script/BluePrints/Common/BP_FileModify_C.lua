require("UnLua")
require("DataMgr")
local BP_FileModify_C = Class()

function BP_FileModify_C:ModifyAnimRootmotion()
  for _, v in pairs(DataMgr.AnimRootMotion) do
    local data = DataMgr.AnimRootMotion[v.MainID]
    self.Overridden.ModifyAnimRootmotion(self, data.ResourcePath, data.FilePath, data.bEnableRootmotion)
  end
end

return BP_FileModify_C
