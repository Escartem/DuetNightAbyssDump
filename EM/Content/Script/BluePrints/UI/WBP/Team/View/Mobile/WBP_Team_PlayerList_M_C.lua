require("UnLua")
local TeamModel = TeamController:GetModel()
local M = Class({
  "BluePrints.UI.WBP.Team.View.WBP_Team_PlayerList_Base"
})

function M:InitUIInfo(Name, bInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, bInUIMode, EventList, ...)
  self.Block:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:AddTeammateUI(Member, ItemUI, Index, bAnim)
  M.Super.AddTeammateUI(self, Member, ItemUI, Index, bAnim)
  self.Teammate2UI[Member.Uid]:SetOnMenuOpenChangeCb(function(bOpen)
    if bOpen then
      self.Block:SetVisibility(UIConst.VisibilityOp.Visibility)
    else
      self.Block:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end)
end

function M:Close()
  local BattleMainUI = UIManager(self):GetUIObj(DataMgr.SystemUI.BattleMain.UIName)
  if IsValid(BattleMainUI) and BattleMainUI.IsInit then
    BattleMainUI.Team:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  M.Super.Close(self)
end

function M:_UpdateMemberTag(Uid)
  if TeamModel:IsYourself(Uid) then
    self.Teammate2UI[Uid]:UpdateTag()
  elseif self.Teammate2UI[Uid] then
    self.Teammate2UI[Uid]:UpdateTag()
  end
end

return M
