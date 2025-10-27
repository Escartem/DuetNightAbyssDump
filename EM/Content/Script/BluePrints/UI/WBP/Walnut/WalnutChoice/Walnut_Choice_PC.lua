require("UnLua")
local WalnutBagController = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController")
local WalnutBagModel = WalnutBagController:GetModel()
local TeamController = require("BluePrints.UI.WBP.Team.TeamController")
local TeamModel = TeamController:GetModel()
local M = Class("BluePrints.UI.BP_UIState_C")

function M:T()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  if not TeamModel:IsYourself(Uid) and Avatar.Walnuts.WalnutId then
    WalnutBagModel:SetLastSelectWalnutId(self.CurrentDungeonId, Avatar.Walnuts.WalnutId)
  end
end

return M
