require("UnLua")
local M = Class()

function M:Construct()
  local LevelMap = UIManager(self):GetUI("LevelMap")
  LevelMap.LevelMap_World:AddAreaPoint(self.RegionId, self)
end

function M:OnClickButton()
end

return M
