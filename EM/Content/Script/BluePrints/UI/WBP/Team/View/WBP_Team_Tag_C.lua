require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  TeamController:RegisterEvent(self, function(self, EventId, ...)
    if EventId == TeamCommon.EventId.DsTeamOnDelPlayer then
      self:UpdateIndex()
    elseif EventId == TeamCommon.EventId.TeamOnDelPlayer then
      self:UpdateIndex()
    end
  end)
end

function M:Destruct()
  TeamController:UnRegisterEvent(self)
end

function M:UpdateIndex()
  if not self.TeamMemberUid then
    DebugPrint(Warning, LXYTag, "WBP_Team_Tag_C \230\178\161\230\156\137\233\152\159\228\188\141\230\136\144\229\145\152\231\154\132Uid\239\188\140\228\184\141\231\159\165\233\129\147\231\161\174\229\136\135\231\154\132\231\180\162\229\188\149\229\143\152\230\155\180")
    return
  end
  local TeamMember = TeamController:GetModel():GetTeamMember(self.TeamMemberUid)
  if not TeamMember then
    return
  end
  self:SetPosText(TeamMember.Index)
end

function M:SetPosText(NewIndex)
  if NewIndex == self.PosIdx then
    DebugPrint(LXYTag, "WBP_Team_Tag_C \233\152\159\228\188\141\230\136\144\229\145\152\231\180\162\229\188\149\230\178\161\230\156\137\229\143\152\229\140\150\239\188\140\228\184\141\230\155\180\230\150\176\231\180\162\229\188\149", NewIndex, self.PosIdx)
    return
  end
  self.PosIdx = NewIndex
  self.Num_Player:SetText(string.format("%sP", self.PosIdx))
end

function M:Init(bCaption, Pos, TeamMemberUid)
  self.IsCaption = bCaption
  self.TeamMemberUid = TeamMemberUid
  self:SetPosText(Pos)
  if self.IsCaption then
    self:PlayAnimation(self.Captain)
  else
    self:PlayAnimation(self.Normal)
  end
end

function M:SetDeadState(bDead)
  if bDead then
    self:PlayAnimation(self.Dead)
  else
    self:Init(self.IsCaption, self.PosIdx, self.TeamMemberUid)
  end
end

return M
