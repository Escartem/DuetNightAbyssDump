local TeamDatas = require("BluePrints.UI.WBP.Team.TeamData")
local TeamData = TeamDatas.TeamData
local StrLib = require("BluePrints.Common.DataStructure")
local Deque = StrLib.Deque
local GlobalConstant = DataMgr.GlobalConstant
local M = Class("BluePrints.Common.MVC.Model")

function M:Init()
  M.Super.Init(self)
  self.TeamData = nil
  self.TeamDataBackup = nil
  self.InviteRecvQueue = Deque.New()
  self.InviteSendBox = {}
  self.InviteTable = {}
  self.CachedRecoveryTeamInfo = nil
end

function M:SetTeam(Team, bDsData)
  if nil == Team then
    if GWorld:IsStandAlone() then
      self.TeamData = nil
    elseif not self.TeamData.bDsData then
      self.TeamData = nil
    end
    if not self.TeamData then
      Utils.Traceback("\233\152\159\228\188\141\232\162\171\231\189\174\231\169\186\228\186\134, TeamData is nil")
      ChatController:GetModel():ClearReddotCount(ChatCommon.ChannelDef.InTeam)
      ChatController:GetModel():ClearMessage(ChatCommon.ChannelDef.InTeam)
    end
    self.TeamDataBackup = nil
    return
  end
  self.TeamData = TeamData.New(Team, bDsData)
end

function M:GetTeam()
  if not self.TeamData then
    DebugPrint(DebugTag, LXYTag, "GetTeam !!! TeamData is nil")
    return
  end
  return self.TeamData
end

function M:AddTeamMember(Member)
  if self.TeamDataBackup then
    self.TeamDataBackup:AddMember(Member)
  end
  if self.TeamData and not self.TeamData.bDsData then
    self.TeamData:AddMember(Member)
  end
end

function M:DelTeamMember(Param)
  if self.TeamDataBackup then
    local Uid
    if type(Param) == "number" then
      Uid = Param
    else
      Uid = Param.Uid
    end
    local Member, Pos = self:GetTeamMember(Uid)
    if Member then
      self.TeamData:_DelMember(Pos)
    end
    self:_RealDelTeamMember(self.TeamDataBackup, Param)
  elseif self.TeamData and not self.TeamData.bDsData then
    self:_RealDelTeamMember(self.TeamData, Param)
  end
end

function M:_RealDelTeamMember(Team, Param)
  if type(Param) == "number" then
    local Uid = Param
    if self:IsMemberExist(Uid) then
      Team:DelMemberByUid(Uid)
    end
  else
    local Member = Param
    if self:IsMemberExist(Member.Uid) then
      Team:DelMemberByUid(Member.Uid)
    end
  end
end

function M:DelTeamMemberWithDs(Eid)
  if not self.TeamData then
    return
  end
  if not self.TeamData.bDsData then
    return
  end
  self:_RealDelTeamMember(self.TeamData, Eid)
end

function M:AddTeamMemberWithDs(WorldContext, Eid, PlayerState)
  if not self.TeamData then
    return
  end
  if not self.TeamData.bDsData then
    return
  end
  if self:IsMemberExist(Eid) then
    return
  end
  if not PlayerState then
    for i, TeampPlayerState in pairs(GameState(WorldContext).PlayerArray) do
      if Eid == TeampPlayerState.Eid then
        PlayerState = TeampPlayerState
        break
      end
    end
  end
  local Member = {
    Uid = Eid,
    Eid = CommonUtils.Str2ObjId(PlayerState.AvatarEidStr),
    Nickname = PlayerState.PlayerName,
    Char = {
      CharId = PlayerState.CharId,
      Level = PlayerState.CharLevel
    },
    MeleeWeapon = {
      WeaponId = PlayerState.MeleeWeaponId,
      Level = PlayerState.MeleeWeaponLevel
    },
    RangedWeapon = {
      WeaponId = PlayerState.RangedWeaponId,
      Level = PlayerState.RangedWeaponLevel
    },
    Level = PlayerState.PlayerLevel,
    IsInDungeon = true,
    IsOnline = not PlayerState.bIsEMInactive,
    PlayerState = PlayerState,
    HeadIconId = PlayerState.HeadIconId,
    HeadFrameId = PlayerState.HeadFrameId,
    HeadState = PlayerState.bIsEMInactive and TeamCommon.HeadState.Offline or TeamCommon.HeadState.Normal,
    bDsData = true
  }
  self.TeamData:AddMember(Member)
  return true
end

function M:SetTeamBackup(Team)
  if nil == Team then
    DebugPrint(LXYTag, "\230\184\133\231\169\186\233\152\159\228\188\141\229\164\135\228\187\189")
    self.TeamDataBackup = nil
  else
    PrintTable(Team, 1, LXYTag .. "\232\174\190\231\189\174\233\152\159\228\188\141\229\164\135\228\187\189")
    self.TeamDataBackup = TeamData.New(Team)
  end
end

function M:GetTeamBackup()
  DebugPrint(LXYTag, "\232\142\183\229\143\150\233\152\159\228\188\141\229\164\135\228\187\189")
  return self.TeamDataBackup
end

function M:CreateTeamDataWithDs(WorldContext)
  if GWorld:IsStandAlone() then
    return
  end
  DebugPrint("TeamSyncDebug   CreateTeamDataWithDs")
  self:SetTeamBackup(self:GetTeam())
  local DsTeamData = {
    Members = {},
    LeaderId = 0
  }
  self:SetTeam(DsTeamData, true)
  for i, PlayerState in pairs(GameState(WorldContext).PlayerArray) do
    local Eid = PlayerState.Eid
    self:AddTeamMemberWithDs(WorldContext, Eid, PlayerState)
  end
end

function M:DestoryTeamDataWithDs()
  DebugPrint("TeamSyncDebug  TeamModel DestoryTeamDataWithDs")
  if not self:GetTeam() then
    return
  end
  if not self.TeamData.bDsData then
    return
  end
  self:SetTeam(self.TeamDataBackup)
  self:SetTeamBackup(nil)
end

function M:GetTeamMember(Uid)
  if self.TeamDataBackup then
    local Member, Pos = self.TeamDataBackup:GetMember(Uid)
    if Member then
      return Member, Pos
    end
  end
  if self.TeamData then
    return self.TeamData:GetMember(Uid)
  end
  return nil, 0
end

function M:IsMemberExist(Uid)
  if self.TeamDataBackup and self.TeamDataBackup:IsMemberExist(Uid) then
    return true
  end
  if self.TeamData and self.TeamData:IsMemberExist(Uid) then
    return true
  end
  return false
end

function M:SetTeadLeaderId(Uid)
  if self.TeamDataBackup then
    self.TeamDataBackup:SetLeaderId(Uid)
    return
  end
  if self.TeamData then
    self.TeamData:SetLeaderId(Uid)
  end
end

function M:GetTeamLeaderId()
  if self.TeamDataBackup then
    return self.TeamDataBackup:GetLeaderId()
  end
  if self.TeamData then
    return self.TeamData:GetLeaderId()
  end
  return nil
end

function M:IsTeamLeader(Uid)
  if not GWorld:IsStandAlone() then
    return false
  end
  if self.TeamDataBackup then
    return self.TeamDataBackup:IsLeader(Uid)
  end
  if self.TeamData then
    return self.TeamData:IsLeader(Uid)
  end
  return false
end

function M:PushInviteInfo(InviteInfo)
  if self.InviteTable[InviteInfo.Uid] then
    return
  end
  self.InviteTable[InviteInfo.Uid] = 1
  if self.InviteRecvQueue:Size() >= GlobalConstant.TeamInviteMax.ConstantValue then
    DebugPrint(ErrorTag, "PushInviteInfo Error !!! InviteQueue is full")
    return
  end
  DebugPrint(LXYTag, "\231\187\132\233\152\159\233\130\128\232\175\183QueuePush", InviteInfo.Nickname)
  self.InviteRecvQueue:PushFront(InviteInfo)
end

function M:PopInviteInfo()
  if self.InviteRecvQueue:IsEmpty() then
    DebugPrint(DebugTag, "PopInviteInfo: InviteQueue is empty")
    return false
  end
  local InviteInfo = self.InviteRecvQueue:PopBack()
  self.InviteTable[InviteInfo.Uid] = nil
  Utils.Traceback(LXYTag .. "  \231\187\132\233\152\159\233\130\128\232\175\183QueuePop  " .. InviteInfo.Nickname)
  return true
end

function M:GetBackInviteInfo()
  if self.InviteRecvQueue:IsEmpty() then
    DebugPrint(LXYTag, "GetBackInviteInfo: InviteQueue is empty")
    return
  end
  return self.InviteRecvQueue:Back()
end

function M:CleanInviteInfo()
  self.InviteRecvQueue:Init()
  self.InviteTable = {}
end

function M:IsInviteExist(InviteInfo)
  return self.InviteTable[InviteInfo.Uid]
end

function M:GetTeamOrientation()
  return self:GetAvatar().TeamOrientation
end

function M:AddSentInvite(Uid, TimerKey)
  self.InviteSendBox[Uid] = TimerKey
end

function M:DelSentInvite(Uid)
  self.InviteSendBox[Uid] = nil
end

function M:GetInviteSendBox()
  return self.InviteSendBox
end

function M:GetOwnerEidOfUnknowEid(WorldContext, Eid)
  local GameState = GameState(WorldContext)
  for i, PhantomState in pairs(GameState.PhantomArray) do
    if PhantomState.Eid == Eid then
      return PhantomState.OwnerEid, Eid
    end
  end
  DebugPrint(LXYTag, ErrorTag, "\233\173\133\229\189\177\229\189\146\229\177\158\228\191\161\230\129\175\229\156\168PhantomState\233\135\140\230\178\161\230\156\137\229\136\157\229\167\139\229\140\150")
  local Entity = Battle(WorldContext):GetEntity(Eid)
  local PlayerEid = Entity.PhantomOwner and Entity.PhantomOwner.Eid or nil
  if not PlayerEid then
    DebugPrint(LXYTag, ErrorTag, "\231\148\154\232\135\179\233\173\133\229\189\177Entity\231\154\132PhantomOwner\228\185\159\230\178\161\230\156\137\229\136\157\229\167\139\229\140\150")
    PlayerEid = Entity:GetInitLogicComp().PhantomOwnerEid or Entity.InitFinalInfo.PhantomOwnerEid
    if not PlayerEid then
      DebugPrint(LXYTag, ErrorTag, "\233\173\133\229\189\177\232\191\152\230\152\175\230\139\191\228\184\141\229\136\176PhantomOwner!!!!\232\191\153\230\152\175\232\166\129\233\128\188\230\136\145\229\142\187\230\148\185PhantomCharacter\239\188\159\239\188\159\239\188\159!!")
      return nil, Eid
    end
  end
  return PlayerEid, Eid
end

function M:Destory()
  self:CleanNowDungeonId()
  M.Super.Destory(self)
end

function M:IsTeammateByAvatarEid(AvatarEid)
  local Team = self:GetTeam()
  if not Team or not Team.Members then
    return false
  end
  if type(AvatarEid) == "string" and CommonUtils.IsObjIdStr(AvatarEid) then
    AvatarEid = CommonUtils.Str2ObjId(AvatarEid)
  end
  for _, Member in ipairs(Team.Members) do
    if Member.Eid == AvatarEid then
      return true
    end
  end
  return false
end

function M:IsYourself(Uid)
  if not GWorld:IsStandAlone() then
    local SelfEid = GWorld:GetMainPlayer().Eid
    if SelfEid then
      return Uid == GWorld:GetMainPlayer().Eid
    end
    local SelfMember = self:GetTeamMember(Uid)
    if SelfMember and self:GetAvatar() then
      return SelfMember.Nickname == self:GetAvatar().Nickname
    end
  else
    return Uid == self:GetAvatar().Uid
  end
  return false
end

function M:IsMatching()
  local MatchTimingBar = UIManager(self):GetUIObj("DungeonMatchTimingBar")
  DebugPrint("gmy@TeamModel:IsMatching", MatchTimingBar, self.bPressedMulti, self.bPressedSolo, (MatchTimingBar or self.bPressedMulti or self.bPressedSolo) and true)
  return (MatchTimingBar or self.bPressedMulti or self.bPressedSolo) and true
end

function M:CacheNowDungeonId(DungeonId)
  self.DungeonId = DungeonId
end

function M:GetNowDungeonId()
  if not self.DungeonId then
    Utils.Traceback(ErrorCode, LXYTag .. "\232\129\148\230\156\186\230\138\149\231\165\168\229\143\145\231\148\159\229\136\176\232\191\155\229\133\165\229\137\175\230\156\172\230\156\159\233\151\180\239\188\140\229\137\175\230\156\172ID\231\188\147\229\173\152\230\137\141\230\152\175\230\156\137\230\149\136\231\154\132\239\188\140\231\142\176\229\156\168\230\152\175nil")
    return nil
  end
  return self.DungeonId
end

function M:CleanNowDungeonId()
  self.DungeonId = nil
end

return M
