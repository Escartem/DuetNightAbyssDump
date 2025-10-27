require("UnLua")
local M = Class()

function M:UploadDungeonAchievement(PlayerEids)
  local Info = TArray(0)
  for i, j in pairs(PlayerEids) do
    Info:Add(j)
  end
  self:OnUploadDungeonAchievement(Info)
end

return M
