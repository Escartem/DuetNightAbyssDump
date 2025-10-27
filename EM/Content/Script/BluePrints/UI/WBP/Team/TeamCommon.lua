local TeamCommon = {
  HeadUIName = "TeamInSystem",
  TipUIName = "TeamInviteTip",
  InfoUIName = "TeamBattleInfo",
  CommonHead = "CommonHead",
  EventId = {
    TeamInvite = "TeamInvite",
    TeamAgreeInvite = "TeamAgreeInvite",
    TeamLeave = "TeamLeave",
    TeamChangeLeader = "TeamChangeLeader",
    TeamKickMember = "TeamKickMember",
    TeamBeRefused = "TeamBeRefused",
    TeamBeAgreed = "TeamBeAgreed",
    TeamOnAddPlayer = "TeamOnAddPlayer",
    TeamOnDelPlayer = "TeamOnDelPlayer",
    TeamOnChangeLeader = "TeamOnChangeLeader",
    TeamOnInit = "TeamOnInit",
    TeamOnDsDie = "TeamOnDsDie",
    TeamOnVoteAgreed = "TeamOnVoteEnter",
    TeamOnVoteStart = "TeamOnStartVote",
    TeamOnVoteRefused = "TeamOnVoteRefused",
    TeamOnVoteInvalid = "TeamOnVoteInvalid",
    TeamOnVoteEntering = "TeamOnVoteEntering",
    TeamOnVoteAbort = "TeamOnVoteAbort",
    TeamOnMemberChange = "TeamOnMemberChange",
    TeamInviteWaiting = "TeamInviteWaiting",
    DsTeamOnDelPlayer = "DsTeamOnDelPlayer",
    DsTeamOnAddPlayer = "DsTeamOnAddPlayer",
    OnEnterSingelGame = "OnEnterSingelGame",
    OnEnterMultiGame = "OnEnterMultiGame",
    TeamInviteFailed = "TeamInviteFailed"
  },
  LoopTimerInterval = 0.05,
  HeadUser = {
    Team = "Team",
    Vote = "Vote",
    Walnut = "Walnut"
  },
  KickConfirmDialog = 100107,
  LeaveConfirmDialog = 100108,
  MeleeWeaponIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Team_Melee.T_Battle_Team_Melee",
  RangedWeaponIconPath = "/Game/UI/Texture/Dynamic/Atlas/Battle/T_Battle_Team_Ranged.T_Battle_Team_Ranged",
  Dead = "T_Dead_",
  Normal = "T_Normal_",
  HeadState = {
    Offline = 1,
    Normal = 2,
    WaitingEnter = 3,
    VoteEnter = 4,
    CantEnterDungeon = 5,
    VoteRefused = 6
  },
  MaxTeamMembers = DataMgr.GlobalConstant.MaxTeamMember.ConstantValue,
  CanEnterMultiGameStatus = {
    CommonConst.AvatarStatus.Matching,
    CommonConst.AvatarStatus.EnterMultiDungeon
  },
  ResetHeadStateTime = 2,
  InStatusShouldDeleteInvite = {
    CommonConst.AvatarStatus.InSingleDungeon,
    CommonConst.AvatarStatus.InRougeLike,
    CommonConst.AvatarStatus.InTrainingGround,
    CommonConst.AvatarStatus.InSpecialQuest,
    CommonConst.AvatarStatus.InHardBoss,
    CommonConst.AvatarStatus.InExploreChanllenge
  }
}
_G.TeamCommon = TeamCommon
return TeamCommon
