local M = {}
local EEntertainmentState = {
  None = -1,
  Main = 0,
  SwitchCharacter = 1,
  Topic = 2,
  Invitation = 3
}
local EPartyTopicState = {
  None = 0,
  NotMeetLastPartyTopic = 1,
  NotMeetCondition = 2,
  NotMeetResource = 3,
  RedeemResource = 4,
  CanUnlockPartyTopic = 5,
  CanStartPartyTopic = 6,
  CanReviewPartyTopic = 7
}
local EDisableTopicParty = {}

function M:IsSystemShowRedDot()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", "\232\142\183\229\143\150\232\167\146\232\137\178\228\191\161\230\129\175\229\164\177\232\180\165\239\188\140avatar \228\184\186\231\169\186\227\128\130")
    return false
  end
  for I, Char in pairs(Avatar.Chars) do
    if self:IsCharacterShowRedDot(Char.CharId) then
      return true
    end
  end
  return false
end

function M:IsDisableTopicParty(CharacterId)
  local NativePartyNPCData = DataMgr.PartyNpc[CharacterId]
  if not NativePartyNPCData then
    return true
  end
  return not NativePartyNPCData.bEnableParty
end

function M:IsCharacterShowRedDot(CharacterId)
  if nil == CharacterId then
    UStoryLogUtils:PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", "\232\142\183\229\143\150\232\167\146\232\137\178\228\191\161\230\129\175\229\164\177\232\180\165\239\188\140character id \228\184\186\231\169\186\227\128\130")
    return false
  end
  local PartyNPCData = DataMgr.PartyNpc[CharacterId]
  if nil == PartyNPCData then
    return false
  end
  local PartyTopicList = PartyNPCData.PartyTopicList
  if nil == PartyTopicList then
    UStoryLogUtils:PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", string.format("\232\142\183\229\143\150\232\167\146\232\137\178\228\191\161\230\129\175\229\164\177\232\180\165\239\188\140PartyNpc \232\161\168 Id\239\188\154%d \231\154\132 party topic list \229\173\151\230\174\181\228\184\186\231\169\186\227\128\130", CharacterId))
    return false
  end
  if self:IsDisableTopicParty(CharacterId) then
    return false
  end
  for PartyTopicLevel, PartyTopicId in pairs(PartyTopicList) do
    if self:IsPartyTopicShowRedDot(CharacterId, PartyTopicLevel, PartyTopicId) then
      return true
    end
  end
  return false
end

function M:GetPriorityCharacterId()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    UStoryLogUtils:PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", "\232\142\183\229\143\150\232\167\146\232\137\178\228\191\161\230\129\175\229\164\177\232\180\165\239\188\140avatar \228\184\186\231\169\186\227\128\130")
    return
  end
  local SojournsGameInstanceSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, USojournsGameInstanceSubsystem)
  local SystemGuideId = DataMgr.GlobalConstant.InvitationGuideId
  local SpecialCharacterId = DataMgr.GlobalConstant.InvitationSpecialCharacterId
  SystemGuideId = SystemGuideId and SystemGuideId.ConstantValue
  SpecialCharacterId = SpecialCharacterId and SpecialCharacterId.ConstantValue
  if SystemGuideId then
    local Guide = Avatar.SystemGuides:Get(SystemGuideId)
    if SojournsGameInstanceSubsystem and SojournsGameInstanceSubsystem.bSpecialGuide or Guide and not Guide:IsFinished() then
      return SpecialCharacterId
    end
  end
end

function M:IsSpecialSelectCharacter()
  local SojournsGameInstanceSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, USojournsGameInstanceSubsystem)
  if SojournsGameInstanceSubsystem and SojournsGameInstanceSubsystem.bSpecialGuide then
    local SpecialCharacterId = DataMgr.GlobalConstant.InvitationSpecialCharacterId
    SpecialCharacterId = SpecialCharacterId and SpecialCharacterId.ConstantValue
    return true
  end
end

function M:IsPartyTopicShowRedDot(CharacterId, PartyTopicLevel, PartyTopicId)
  if nil == CharacterId then
    UStoryLogUtils:PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", "\232\142\183\229\143\150\232\175\157\233\162\152\231\186\162\231\130\185\230\152\175\229\144\166\230\152\190\231\164\186\229\164\177\232\180\165\239\188\140character id \228\184\186\231\169\186\227\128\130")
    return false
  end
  if nil == PartyTopicLevel then
    UStoryLogUtils:PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", "\232\142\183\229\143\150\232\175\157\233\162\152\231\186\162\231\130\185\230\152\175\229\144\166\230\152\190\231\164\186\229\164\177\232\180\165\239\188\140party topic level \228\184\186\231\169\186\227\128\130")
    return false
  end
  if nil == PartyTopicId then
    UStoryLogUtils:PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", "\232\142\183\229\143\150\232\175\157\233\162\152\231\186\162\231\130\185\230\152\175\229\144\166\230\152\190\231\164\186\229\164\177\232\180\165\239\188\140party topic id \228\184\186\231\169\186\227\128\130")
    return false
  end
  local PartyTopicData = DataMgr.PartyTopic[PartyTopicId]
  if nil == PartyTopicData then
    UStoryLogUtils:PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", string.format("\232\142\183\229\143\150\232\175\157\233\162\152\231\186\162\231\130\185\230\152\175\229\144\166\230\152\190\231\164\186\229\164\177\232\180\165\239\188\140\230\156\170\229\156\168 PartyTopic \232\161\168\230\137\190\229\136\176 Id\239\188\154%d \231\154\132\230\149\176\230\141\174\227\128\130", PartyTopicId))
    return false
  end
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    UStoryLogUtils:PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\179\187\231\187\159\233\148\153\232\175\175", "\232\142\183\229\143\150\232\167\146\232\137\178\228\191\161\230\129\175\229\164\177\232\180\165\239\188\140avatar \228\184\186\231\169\186\227\128\130")
    return false
  end
  local PartyTopic = Avatar:GetPartyTopic(CharacterId, PartyTopicLevel)
  if PartyTopic and PartyTopic:IsLocked() == false and PartyTopic:IsCompleted() == true then
    return false
  end
  local LastPartyTopic = Avatar:GetPartyTopic(CharacterId, PartyTopicLevel - 1)
  if LastPartyTopic and false == LastPartyTopic:IsCompleted() then
    return false
  end
  local ConditionId = PartyTopicData.ConditionId
  if nil ~= ConditionId and false == ConditionUtils.CheckCondition(Avatar, ConditionId) then
    return false
  end
  local PartyTopicConsume = PartyTopicData.PartyTopicConsume
  if nil ~= PartyTopicConsume and PartyTopic and PartyTopic:IsLocked() and false == Avatar:CheckEnough(PartyTopicConsume) then
    return false
  end
  return true
end

M.EEntertainmentState = EEntertainmentState
M.EPartyTopicState = EPartyTopicState
return M
