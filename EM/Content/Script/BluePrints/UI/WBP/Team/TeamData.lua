local GlobalConstant = DataMgr.GlobalConstant

local function IsCanEnterMultiGame(TeamMember)
  if not TeamMember.AvatarStatus then
    Utils.Traceback(WarningTag, LXYTag .. "\233\152\159\228\188\141\230\136\144\229\145\152\230\178\161\230\156\137AvatarStatus\230\149\176\230\141\174\239\188\140\230\151\160\230\179\149\229\136\164\230\150\173\229\143\175\232\129\148\230\156\186,\233\187\152\232\174\164\232\191\148\229\155\158True, \230\156\137\233\151\174\233\162\152\231\154\132\233\152\159\228\188\141\230\136\144\229\145\152\239\188\154" .. TeamMember.Nickname)
    return true
  end
  local Avatar = GWorld:GetAvatar()
  local bSelfInBigWorld = not Avatar:IsInDungeon()
  local bSuccess = true
  if bSuccess then
    for _, StateEnum in ipairs(TeamCommon.CanEnterMultiGameStatus) do
      if Avatar:CheckCanSetStatus(TeamMember.AvatarStatus, StateEnum) then
        PrintTable(TeamMember.AvatarStatus, 1, LXYTag .. "  \233\152\159\228\188\141\230\136\144\229\145\152" .. TeamMember.Nickname .. "\229\143\175\232\191\155\229\133\165\232\129\148\230\156\186\231\138\182\230\128\129, \231\138\182\230\128\129\232\161\168\239\188\154")
        return true
      end
    end
  end
  PrintTable(TeamMember.AvatarStatus, 1, WarningTag .. LXYTag .. "  \233\152\159\228\188\141\230\136\144\229\145\152" .. TeamMember.Nickname .. "\228\184\141\229\143\175\232\191\155\229\133\165\232\129\148\230\156\186\231\138\182\230\128\129, \231\138\182\230\128\129\232\161\168\239\188\154")
  TeamMember.HeadState = TeamCommon.HeadState.CantEnterDungeon
  return false
end

local TeamData = Class()
TeamData.TeamId = 0
TeamData.LeaderId = 0
TeamData.Hostnum = 0
TeamData.Members = nil
TeamData._MemberUids = nil

function TeamData.New(RawTeam, bDsData)
  local NewObj = {}
  setmetatable(NewObj, TeamData)
  NewObj._MemberUids = {}
  NewObj.Members = {}
  for K, V in pairs(RawTeam) do
    if nil == NewObj[K] then
      DebugPrint(ErrorTag, "TeamData New Error!!!: RawTeam not TeamData Instance")
      return nil
    end
    NewObj[K] = V
  end
  for i, Member in ipairs(NewObj.Members) do
    NewObj._MemberUids[Member.Uid] = Member
    Member.HeadState = TeamCommon.HeadState.Normal
    Member.Index = i
    Member.IsCanEnterMultiGame = IsCanEnterMultiGame
  end
  NewObj.New = nil
  NewObj.bDsData = bDsData
  return NewObj
end

function TeamData:IsAnyMemberCanNotEnterDungeon()
  local Uids = {}
  for _, Member in ipairs(self.Members) do
    if not Member:IsCanEnterMultiGame() then
      table.insert(Uids, Member.Uid)
    end
  end
  if #Uids > 0 then
    return true, Uids
  end
  return false
end

function TeamData:SetLeaderId(Uid)
  self.LeaderId = Uid
end

function TeamData:IsLeader(Uid)
  return self.LeaderId == Uid
end

function TeamData:GetLeaderId()
  return self.LeaderId
end

function TeamData:AddMember(Member)
  if self._MemberUids[Member.Uid] then
    DebugPrint(LXYTag, "AddMember Error!!!: Team member Repeat", Member.Uid)
    return
  end
  self._MemberUids[Member.Uid] = Member
  if #self.Members > GlobalConstant.MaxTeamMember.ConstantValue then
    DebugPrint(LXYTag, "AddMember Error!!!: Team member limit exceed")
    return
  end
  Member.IsCanEnterMultiGame = IsCanEnterMultiGame
  table.insert(self.Members, Member)
  Member.Index = #self.Members
  Member.HeadState = TeamCommon.HeadState.Normal
end

function TeamData:_DelMember(Pos)
  if 0 == #self.Members then
    DebugPrint(LXYTag, "_DelMember Error!!!: Team member is empty")
    return
  end
  if not self.Members[Pos] then
    return
  end
  self._MemberUids[self.Members[Pos].Uid] = nil
  table.remove(self.Members, Pos)
  for i, Member in ipairs(self.Members) do
    Member.Index = i
  end
end

function TeamData:DelMemberByUid(Uid)
  local Member, Pos = self:GetMember(Uid)
  if nil == Member then
    return
  end
  self:_DelMember(Pos)
end

function TeamData:GetMember(Uid)
  local Member = self._MemberUids[Uid]
  if not Member then
    DebugPrint(DebugTag, LXYTag, "TeamData GetMember :: Uid not found in Team member list", Uid)
    return nil, 0
  end
  return Member, Member.Index
end

function TeamData:IsMemberExist(Uid)
  return self._MemberUids[Uid]
end

return {TeamData = TeamData}
