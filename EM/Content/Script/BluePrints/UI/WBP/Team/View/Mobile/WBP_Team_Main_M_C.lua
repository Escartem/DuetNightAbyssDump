require("UnLua")
local MaxTeammate = TeamCommon.MaxTeamMembers - 1
local Rule = FSlateChildSize()
Rule.SizeRule = UE.ESlateSizeRule.Fill
Rule.Value = 1.0
local M = Class({
  "BluePrints.UI.WBP.Team.View.WBP_Team_Main_Base"
})

function M:AppendToParent(ParentWidget)
  if ParentWidget then
    self.IsAddingToParent = true
    ParentWidget:AddChildToOverlay(self)
    self.IsAddingToParent = false
  end
end

function M:AddTeammateUI(Member, bAnim, HeadUI, Index)
  if not HeadUI then
    if self.WB_Player:GetChildrenCount() < MaxTeammate then
      HeadUI = self:CreateWidgetNew(DataMgr.WidgetUI.TeamHead.UIName)
      self.WB_Player:AddChild(HeadUI)
    else
      HeadUI = self.WB_Player:GetChildAt(self.TeammateCount)
      HeadUI:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    self.Teammate2UI[Member.Uid] = HeadUI
    self.TeammateCount = self.TeammateCount + 1
  end
  HeadUI:Init(TeamCommon.HeadUser.Team, self, Member, Member.Index, bAnim)
  if self.bBattle then
    local IsNeedCancelHitTest = not GWorld:IsStandAlone() or GameState(self).PlayerArray:Num() > 1
    if IsNeedCancelHitTest then
      HeadUI:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    else
      HeadUI.Head_Team:BindOnClickEvent(function()
        self:OpenTeam()
      end)
      HeadUI:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
  local Slot = UWidgetLayoutLibrary.SlotAsHorizontalBoxSlot(self.WB_Player)
  if self.TeammateCount < MaxTeammate then
    Rule.SizeRule = UE.ESlateSizeRule.Automatic
    Slot:SetSize(Rule)
    if bAnim then
      self:PlayMove(true)
    end
  elseif self.TeammateCount >= MaxTeammate then
    Rule.SizeRule = UE.ESlateSizeRule.Fill
    Slot:SetSize(Rule)
    self.Panel_Add:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:DelTeammateUI(Uid)
  local DelIndex = self.Teammate2UI[Uid].Index
  if self.TeammateCount >= MaxTeammate then
    local Slot = UWidgetLayoutLibrary.SlotAsHorizontalBoxSlot(self.WB_Player)
    Rule.SizeRule = UE.ESlateSizeRule.Automatic
    Slot:SetSize(Rule)
    self:PlayMove()
  end
  for _, HeadUI in pairs(self.Teammate2UI) do
    if DelIndex < HeadUI.Index then
      HeadUI:PlayMove()
    end
  end
  if not self.bBattle and DelIndex < self.Head_My.Index then
    self.Head_My.Index = self.Head_My.Index - 1
    self.Head_My:UpdateTag()
  end
  self.Teammate2UI[Uid]:OnTeammateDelete()
  self.Teammate2UI[Uid] = nil
  self.TeammateCount = self.TeammateCount - 1
  if self.TeammateCount < MaxTeammate then
    self.Panel_Add:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:OpenTeam()
  local BattleMain = UIManager(self):GetUIObj("BattleMain")
  if nil ~= BattleMain and type(BattleMain.OpenTeamInfo) == "function" then
    BattleMain.Team:SetVisibility(UE4.ESlateVisibility.Collapsed)
    BattleMain:OpenTeamInfo()
  end
end

function M:OnInitAddBtn()
  self.Btn_Add.Panel_Img:SetActiveWidgetIndex(1)
  self.Btn_Add:BindOnClickEvent(function()
    if IsValid(FriendController:GetView(self)) then
      TeamController:ShowToast(GText("UI_Team_InFriend"))
    else
      FriendController:OpenView(self, FriendCommon.FriendTabType.MyFriend)
    end
  end)
end

return M
