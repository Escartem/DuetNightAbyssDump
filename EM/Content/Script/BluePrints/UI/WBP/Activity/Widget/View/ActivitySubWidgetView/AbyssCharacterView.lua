require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Init(ActivityConfigData, PageConfigData, PlayerAvatar)
  self.Text_Title:SetText(GText("Abyss_CharReward_Title"))
  local AbyssSeasonId = PlayerAvatar.CurrentAbyssSeasonId
  local AbyssSeasonConfig = DataMgr.AbyssSeasonList[AbyssSeasonId]
  local CharId = AbyssSeasonConfig.CharId
  local CharConfig = DataMgr.Char[CharId]
  self.Text_Name:SetText(GText(CharConfig.CharName))
  local Icon = LoadObject(CharConfig.Icon)
  self.Icon_Head:SetBrushFromTexture(Icon)
end

return M
