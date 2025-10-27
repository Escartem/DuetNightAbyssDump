require("UnLua")
local M = Class()

function M:LoadMonsterExpTips(ShowNumber, OvalEdgeScreenPos)
  UIManager(self):LoadUI(UIConst.MONSTEREXPTIPS, "MonsterExpWord", UIConst.ZORDER_FOR_COMMON_TIP, ShowNumber, OvalEdgeScreenPos)
end

return M
