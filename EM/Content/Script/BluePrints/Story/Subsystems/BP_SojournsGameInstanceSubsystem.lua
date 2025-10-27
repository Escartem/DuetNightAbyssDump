require("UnLua")
local EInvitationState = {
  None = "None",
  Going = "Going",
  Inviting = "Inviting",
  Backing = "Backing",
  Recording = "Recording"
}
local M = Class("BluePrints.Common.TimerMgr")

function M:PostOnInitialize()
  self:TryInitialize()
end

function M:PreOnDeinitialize()
  self.bIsInitialized = false
  if EventManager then
    EventManager:RemoveEvent(EventID.OnGuideStart, self)
    EventManager:RemoveEvent(EventID.OnGuideEnd, self)
  end
end

function M:OnCloseLoading()
  local GameMode = UE.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  local Avatar = GWorld:GetAvatar()
  if not (GameMode and GameMode:IsInRegion() and Avatar) or Avatar:GetCurrentRegionId() ~= self.TargetSubregionId then
    self:StopInvitation()
  end
end

function M:OnInLoading()
  if not self:IsInInvitation() then
    return
  end
  if self.InvitationState ~= EInvitationState.Inviting and self.InvitationState ~= EInvitationState.Backing then
    self:StopInvitation()
    return
  end
end

function M:ListenInterruptInvitataion()
  EventManager:AddEvent(EventID.CloseLoading, self, self.OnCloseLoading)
  EventManager:AddEvent(EventID.InLoading, self, self.OnInLoading)
  EventManager:AddEvent(EventID.OnNetDisconnect, self, self.StopInvitation)
end

function M:ListenEnterOtherRegion()
  EventManager:AddEvent(EventID.OnRegionLoaded, self, self.OnEnterOtherRegion)
end

function M:BeginInvitation(CharacterId, TopicLevel, bIsReview, OnFailed, OnSucceed)
  self:TryInitialize()
  if self:IsInInvitation() then
    DebugPrint(string.format("Error\239\188\154\233\130\128\231\186\166\229\173\144\231\179\187\231\187\159\239\188\154\229\188\128\229\167\139\233\130\128\231\186\166\229\164\177\232\180\165\239\188\140\229\183\178\229\164\132\228\186\142\233\130\128\231\186\166 %s \228\184\173\227\128\130", self.InvitationState))
    return
  end
  local Avatar = GWorld:GetAvatar()
  self.PartyNPCData = DataMgr.PartyNpc[CharacterId]
  assert(self.PartyNPCData, string.format("Error\239\188\154\233\130\128\231\186\166\229\173\144\231\179\187\231\187\159\239\188\154PartyNpc \232\161\168\228\184\141\229\173\152\229\156\168\233\148\174\239\188\154%d\227\128\130", CharacterId))
  local PartyTopicId = self.PartyNPCData.PartyTopicList[TopicLevel]
  self.PartyTopicData = DataMgr.PartyTopic[PartyTopicId]
  assert(self.PartyTopicData, string.format("Error\239\188\154\233\130\128\231\186\166\229\173\144\231\179\187\231\187\159\239\188\154PartyTopic \232\161\168\228\184\141\229\173\152\229\156\168\233\148\174\239\188\154%d\227\128\130", PartyTopicId))
  self.TopicLevel = TopicLevel
  self.bIsReview = bIsReview
  self.InvitationState = EInvitationState.Going
  self:ListenInterruptInvitataion()
  Avatar:StartSojourns(CharacterId, TopicLevel, function(bSuccess, Ret)
    if not bSuccess then
      self:StopInvitation()
      if OnFailed then
        OnFailed()
      end
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\229\143\145\232\181\183\230\156\141\229\138\161\229\153\168\232\191\148\229\155\158\229\164\177\232\180\165", string.format("\233\130\128\231\186\166\230\156\141\229\138\161\229\153\168\232\191\148\229\155\158\229\164\177\232\180\165 \233\130\128\231\186\166ID: %d \233\130\128\231\186\166\231\173\137\231\186\167: %d \233\148\153\232\175\175\231\160\129 %d", CharacterId or -1, TopicLevel or -1, Ret))
      return
    end
    if not self:IsInInvitation() then
      if OnFailed then
        OnFailed()
      end
      return
    end
    if OnSucceed then
      OnSucceed()
    end
    DebugPrint(string.format("\233\130\128\231\186\166\229\173\144\231\179\187\231\187\159\239\188\154\229\188\128\229\167\139\233\130\128\231\186\166 %d %d %s\227\128\130", CharacterId, TopicLevel, tostring(bIsReview)))
    self:ListenEnterOtherRegion()
    self:StartStoryline()
  end)
end

function M:EndInvitation()
  self:TryInitialize()
  if self:IsInInvitation() == false then
    return
  end
  local CharacterId = self.PartyNPCData.CharId
  local TopicLevel = self.TopicLevel
  local bIsReview = self.bIsReview
  DebugPrint(string.format("\233\130\128\231\186\166\229\173\144\231\179\187\231\187\159\239\188\154\231\187\147\230\157\159\233\130\128\231\186\166 %d %d %s\227\128\130", CharacterId, TopicLevel, tostring(bIsReview)))
  self:ClearInvitation()
  local UI = UIManager(self):LoadUINew("Entertainment", CharacterId, TopicLevel)
end

function M:StopInvitation()
  self:TryInitialize()
  if self:IsInInvitation() == false then
    return
  end
  local CharacterId = self.PartyNPCData.CharId
  local TopicLevel = self.TopicLevel
  local bIsReview = self.bIsReview
  DebugPrint(string.format("\233\130\128\231\186\166\229\173\144\231\179\187\231\187\159\239\188\154\229\129\156\230\173\162\233\130\128\231\186\166 %d %d %s\227\128\130", CharacterId, TopicLevel, tostring(bIsReview)))
  self:StopJumpToSubregion()
  self:StopStoryline()
  self:StopBlackScreen()
  self:ClearInvitation()
end

function M:IsInInvitation()
  self:TryInitialize()
  return self.InvitationState ~= EInvitationState.None
end

function M:TryInitialize()
  if self.bIsInitialized then
    return
  end
  self.bIsInitialized = true
  self.InvitationState = EInvitationState.None
  self.PartyNPCData = nil
  self.PartyTopicData = nil
  self.TopicLevel = nil
  self.bIsReview = nil
  self.HomebaseSubregionId = 210101
  self.RecordWaitSeconds = 0.5
  self.TargetSubregionId = nil
  self.StorylinePath = nil
  self.OnStorylineCompleted = nil
  self.BlackScreenHandle = nil
  self.bSpecialGuide = false
  local SystemGuideId = DataMgr.GlobalConstant.InvitationGuideId
  self.ListenSystemGuideId = SystemGuideId and SystemGuideId.ConstantValue
  EventManager:AddEvent(EventID.OnGuideStart, self, self.OnGuideStart)
  EventManager:AddEvent(EventID.OnGuideEnd, self, self.OnGuideEnd)
end

function M:OnGuideStart(Guide)
  if self.ListenSystemGuideId == Guide then
    self.bSpecialGuide = true
  end
end

function M:OnGuideEnd(Guide)
  if self.ListenSystemGuideId == Guide then
    self.bSpecialGuide = false
  end
end

function M:ClearInvitation()
  DebugPrint("\233\130\128\231\186\166\229\173\144\231\179\187\231\187\159\239\188\154\230\184\133\231\144\134\233\130\128\231\186\166")
  self.InvitationState = EInvitationState.None
  local CharacterId = self.PartyNPCData.CharId
  local TopicLevel = self.TopicLevel
  self.PartyNPCData = nil
  self.PartyTopicData = nil
  self.TopicLevel = nil
  self.bIsReview = nil
  EventManager:RemoveEvent(EventID.OnRegionLoaded, self)
  EventManager:RemoveEvent(EventID.CloseLoading, self)
  EventManager:RemoveEvent(EventID.InLoading, self)
  EventManager:RemoveEvent(EventID.OnNetDisconnect, self)
  local Avatar = GWorld:GetAvatar()
  Avatar:ExitSojourns(CharacterId, TopicLevel, function(bSuccess, Ret)
    if not bSuccess then
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\231\187\147\230\157\159\230\156\141\229\138\161\229\153\168\232\191\148\229\155\158\229\164\177\232\180\165", string.format("\233\130\128\231\186\166\230\156\141\229\138\161\229\153\168\232\191\148\229\155\158\229\164\177\232\180\165 \233\130\128\231\186\166ID: %d \233\130\128\231\186\166\231\173\137\231\186\167: %d \233\148\153\232\175\175\231\160\129 %d", CharacterId or -1, TopicLevel or -1, Ret))
    end
  end)
end

function M:OnEnterOtherRegion()
  if not self:IsInInvitation() then
    return
  end
  if self.InvitationState ~= EInvitationState.Inviting then
    return
  end
  self:StartStoryline()
end

function M:StartStoryline()
  local StorylinePath = self.PartyTopicData.PartyTopicTalkId
  
  local function OnCompleted()
    self:CompleteInvite()
  end
  
  local Avatar = GWorld:GetAvatar()
  DebugPrint(string.format("\233\130\128\231\186\166\229\173\144\231\179\187\231\187\159\239\188\154\228\188\160\233\128\129\232\135\179\229\156\176\231\130\185 %d\239\188\140\229\188\128\229\167\139\233\130\128\231\186\166\229\137\167\230\131\133 %s\227\128\130", Avatar.CurrentRegionId, StorylinePath))
  if not StorylinePath then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\130\128\231\186\166\229\173\144\231\179\187\231\187\159\233\148\153\232\175\175", string.format("\233\130\128\231\186\166STL\233\133\141\231\189\174\228\184\186\231\169\186,\232\175\157\233\162\152ID %d", self.PartyTopicData.PartyTopicId))
    OnCompleted()
    return
  end
  self.InvitationState = EInvitationState.Inviting
  self:RunStoryline(StorylinePath, OnCompleted)
end

function M:CompleteInvite()
  local TargetSubregionId = self.HomebaseSubregionId
  DebugPrint(string.format("\233\130\128\231\186\166\229\173\144\231\179\187\231\187\159\239\188\154\233\130\128\231\186\166\229\174\140\230\136\144\239\188\140\232\191\148\229\155\158 %d\227\128\130", TargetSubregionId))
  self.InvitationState = EInvitationState.Backing
  self:JumpToSubregion(TargetSubregionId, function()
    self:BackFromInvite()
    return true
  end)
end

function M:BackFromInvite()
  if self.bIsReview then
    self:EndInvitation()
  else
    self:RecordInvite()
  end
end

function M:RecordInvite()
  local CharacterId = self.PartyNPCData.CharId
  local TopicLevel = self.TopicLevel
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    DebugPrint("Error: \233\130\128\231\186\166\229\173\144\231\179\187\231\187\159\239\188\154\232\174\176\229\189\149\233\130\128\231\186\166\229\164\177\232\180\165\239\188\140Avatar \228\184\186\231\169\186\227\128\130")
    return
  end
  DebugPrint("\233\130\128\231\186\166\229\173\144\231\179\187\231\187\159\239\188\154\232\174\176\229\189\149\233\130\128\231\186\166\227\128\130")
  self.InvitationState = EInvitationState.Recording
  self:StartBlackScreen()
  self:SetPlayerInputEnabled(false)
  Avatar:TriggerPartyTopicComplete(CharacterId, TopicLevel, function(Ret)
    ErrorCode:Check(Ret)
    self:StopBlackScreen()
    self:SetPlayerInputEnabled(true)
    self:EndInvitation()
  end)
end

function M:SetInvitationRegionId(TargetRegionId)
  if not self:IsInInvitation() then
    return
  end
  self.TargetSubregionId = TargetRegionId
end

function M:JumpToSubregion(TargetSubregionId, OnSucceed, OnFailed)
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    DebugPrint("Error: \232\183\179\232\189\172\229\136\176 %d \229\173\144\229\140\186\229\159\159\229\164\177\232\180\165\239\188\140Avatar \228\184\186\231\169\186\227\128\130", TargetSubregionId)
    if OnFailed then
      OnFailed()
    end
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if IsValid(GameMode) == false then
    DebugPrint("Error: \232\183\179\232\189\172\229\136\176 %d \229\173\144\229\140\186\229\159\159\229\164\177\232\180\165\239\188\140GameMode \228\184\186\231\169\186\227\128\130", TargetSubregionId)
    if OnFailed then
      OnFailed()
    end
    return
  end
  self:SetInvitationRegionId(TargetSubregionId)
  Avatar:StartJumpRegion(TargetSubregionId, function()
    self:StopJumpToSubregion(TargetSubregionId)
    if OnSucceed then
      OnSucceed()
    end
  end)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if UIManager then
    local MenuWorld = UIManager:GetUI("MenuWorld")
    if MenuWorld then
      MenuWorld.CloseByChild = true
    end
  end
  GameMode:HandleLevelDeliver(UE4.EModeType.ModeRegion, TargetSubregionId, 1, nil, true)
end

function M:StopJumpToSubregion()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    DebugPrint("Error: \228\184\173\230\150\173\232\183\179\232\189\172 %d \229\173\144\229\140\186\229\159\159\229\164\177\232\180\165\239\188\140Avatar \228\184\186\231\169\186\227\128\130", self.TargetSubregionId)
    return
  end
  Avatar:StopJumpRegion(self.TargetSubregionId)
  self.TargetSubregionId = nil
end

function M:RunStoryline(StorylinePath, OnCompleted)
  self.StorylinePath = StorylinePath
  
  function self.OnStorylineCompleted()
    self:ClearRunStorylineCache()
    if OnCompleted then
      OnCompleted()
    end
  end
  
  GWorld.StoryMgr:RunStory(StorylinePath, nil, nil, self.OnStorylineCompleted, nil, {bIsInvitation = true})
end

function M:StopStoryline()
  local StorylinePath = self.StorylinePath
  local OnCompleted = self.OnStorylineCompleted
  GWorld.StoryMgr:StopStoryline(StorylinePath, OnCompleted)
  self:ClearRunStorylineCache()
end

function M:ClearRunStorylineCache()
  self.StorylinePath = nil
  self.OnStorylineCompleted = nil
end

function M:StartBlackScreen()
  local UIManager = UIManager(self)
  if IsValid(UIManager) == false then
    DebugPrint("Error: \233\130\128\231\186\166\229\173\144\231\179\187\231\187\159\239\188\154\229\188\128\229\167\139\233\187\145\229\177\143\229\164\177\232\180\165\239\188\140UIManager \228\184\186\231\169\186\227\128\130")
    return
  end
  if self.BlackScreenHandle then
    self:StopBlackScreen()
  end
  self.BlackScreenHandle = UIManager:ShowCommonBlackScreen({})
end

function M:StopBlackScreen()
  local UIManager = UIManager(self)
  if IsValid(UIManager) == false then
    DebugPrint("Error: \233\130\128\231\186\166\229\173\144\231\179\187\231\187\159\239\188\154\229\129\156\230\173\162\233\187\145\229\177\143\229\164\177\232\180\165\239\188\140UIManager \228\184\186\231\169\186\227\128\130")
    return
  end
  if self.BlackScreenHandle then
    UIManager:HideCommonBlackScreen(self.BlackScreenHandle)
    self.BlackScreenHandle = nil
  end
end

function M:SetPlayerInputEnabled(bNewEnabled)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if IsValid(PlayerCharacter) == false then
    return
  end
  local UIManager = UIManager(self)
  if IsValid(UIManager) == false then
    return
  end
  local Tag = "Invitation"
  local KeyboardSetName = "Invitation"
  if bNewEnabled then
    PlayerCharacter:RemoveDisableInputTag(Tag)
    UIManager:SetBannedActionCallback(KeyboardSetName, false, Tag)
  else
    PlayerCharacter:AddDisableInputTag(Tag)
    UIManager:SetBannedActionCallback(KeyboardSetName, true, Tag)
  end
end

return M
