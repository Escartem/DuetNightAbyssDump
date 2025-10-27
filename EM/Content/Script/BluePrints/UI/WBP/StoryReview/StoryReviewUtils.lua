local ReviewCutShowData

local function InitAvatarReviewData()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if not Avatar.ReviewDataList then
    Avatar.ReviewDataList = {}
    Avatar.ReviewDataMap = {}
  end
end

local function IsAddDialogueData(DialogueId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if Avatar.ReviewDataMap and Avatar.ReviewDataMap[DialogueId] then
    return false, true
  end
  return true
end

local DialogueData = {}

function DialogueData:InitReviewData(Info)
  self.DialogueStyle = Info.DialogueStyle
  self.DialogueId = Info.DialogueId
  self.SpeakerName = Info.SpeakerName
end

function DialogueData:InsertDialogueData(DialogueId, SpeakerName)
  if not self.DialogueInfo then
    self.DialogueInfo = {}
  end
  table.insert(self.DialogueInfo, {DialogueId = DialogueId, SpeakerName = SpeakerName})
end

local OptionData = {}

function OptionData:InitReviewData(Info)
  self.DialogueStyle = Info.DialogueStyle
  self.Options = Info.Options
  self.PreOptions = {}
  local PreOptions = Info.PreOptions or {}
  for Key, v in pairs(PreOptions) do
    self.PreOptions[Key] = true
  end
  self.HighLightDialogueId = Info.HighLightDialogueId
  self.RegionName = Info.RegionName
  self.AddValue = Info.AddValue
  self.ImpressionConfigId = Info.ImpressionConfigId
  self.PlayerValue = Info.PlayerValue
  self.SuccessCheckData = Info.SuccessCheckData or {}
  self.FailCheckData = Info.FailCheckData or {}
end

function OptionData:InsertCheckData(CheckRes, CheckValue)
  if CheckRes then
    table.insert(self.SuccessCheckData, CheckValue)
  else
    table.insert(self.FailCheckData, CheckValue)
  end
end

local function HandleReviewData(Data, Info, Avatar, DialogueId)
  Data:InitReviewData(Info)
  table.insert(Avatar.ReviewDataList, Data)
  if DialogueId then
    Avatar.ReviewDataMap[DialogueId] = Data
  end
  if #Avatar.ReviewDataList > DataMgr.GlobalConstant.ReviewDialogueMax.ConstantValue then
    local RemoveData = Avatar.ReviewDataList[1]
    local UniqueId = RemoveData.DialogueId or RemoveData.HighLightDialogueId
    if UniqueId then
      Avatar.ReviewDataMap[UniqueId] = nil
    end
    table.remove(Avatar.ReviewDataList, 1)
  end
end

local function AddDialogueDataWithTalk(DialogueId, SpeakerName)
  if not IsAddDialogueData(DialogueId) then
    return
  end
  local Avatar = GWorld:GetAvatar()
  InitAvatarReviewData()
  if ReviewCutShowData then
    ReviewCutShowData:InsertDialogueData(DialogueId, SpeakerName)
    Avatar.ReviewDataMap[DialogueId] = true
    return
  end
  local Info = {
    DialogueStyle = SpeakerName and "Talk" or "Voiceover",
    DialogueId = DialogueId,
    SpeakerName = SpeakerName
  }
  local Data = CommonUtils.CopyTable(DialogueData)
  HandleReviewData(Data, Info, Avatar, DialogueId)
end

local function AddDialogueDataWithBlackScreen(DialogueId)
  if not IsAddDialogueData(DialogueId) then
    return
  end
  local Avatar = GWorld:GetAvatar()
  InitAvatarReviewData()
  local Info = {
    DialogueStyle = "BlackScreen",
    DialogueId = DialogueId
  }
  local Data = CommonUtils.CopyTable(DialogueData)
  HandleReviewData(Data, Info, Avatar, DialogueId)
end

local function AddOptionWithNormal(Options, HighLightDialogueId, PreOptions)
  if not IsAddDialogueData(HighLightDialogueId) then
    return
  end
  local Avatar = GWorld:GetAvatar()
  InitAvatarReviewData()
  local Info = {
    DialogueStyle = "Normal",
    Options = Options,
    PreOptions = PreOptions,
    HighLightDialogueId = HighLightDialogueId
  }
  local Data = CommonUtils.CopyTable(OptionData)
  HandleReviewData(Data, Info, Avatar, HighLightDialogueId)
end

local function AddOptionWithImpressionValue(ImpressionConfigId, AddValue, Options, HighLightDialogueId, PreOptions)
  if not IsAddDialogueData(HighLightDialogueId) then
    return
  end
  local Avatar = GWorld:GetAvatar()
  InitAvatarReviewData()
  local Info = {
    DialogueStyle = "ImpressionValue",
    ImpressionConfigId = ImpressionConfigId,
    Options = Options,
    PreOptions = PreOptions,
    HighLightDialogueId = HighLightDialogueId,
    AddValue = AddValue
  }
  local Data = CommonUtils.CopyTable(OptionData)
  HandleReviewData(Data, Info, Avatar, HighLightDialogueId)
end

local function AddOptionWithImpressionCheck(ImpressionConfigId, PlayerValue, Options, HighLightDialogueId, PreOptions)
  local bCanAdd, bAlreadyExist = IsAddDialogueData(HighLightDialogueId)
  if not bCanAdd then
    if bAlreadyExist then
      local Avatar = GWorld:GetAvatar()
      return Avatar.ReviewDataMap[HighLightDialogueId]
    end
    return
  end
  local Avatar = GWorld:GetAvatar()
  InitAvatarReviewData()
  local Info = {
    DialogueStyle = "ImpressionCheck",
    ImpressionConfigId = ImpressionConfigId,
    Options = Options,
    PreOptions = PreOptions,
    HighLightDialogueId = HighLightDialogueId,
    PlayerValue = PlayerValue
  }
  local Data = CommonUtils.CopyTable(OptionData)
  HandleReviewData(Data, Info, Avatar, HighLightDialogueId)
  return Data
end

local function OpenCutShowReview(StartReview)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  ReviewCutShowData = nil
  if not StartReview then
    return
  end
  InitAvatarReviewData()
  local Info = {DialogueStyle = "CutShow"}
  ReviewCutShowData = CommonUtils.CopyTable(DialogueData)
  HandleReviewData(ReviewCutShowData, Info, Avatar)
end

local function GetReviewDataList()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return {}
  end
  InitAvatarReviewData()
  return Avatar.ReviewDataList
end

local CurrentQuestChainId = -1

local function ClearAllReviewData(QuestChainId)
  if CurrentQuestChainId == QuestChainId then
    return
  end
  CurrentQuestChainId = QuestChainId
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  Avatar.ReviewDataList = {}
  Avatar.ReviewDataMap = {}
end

local StoryReviewUtils = {
  AddDialogueDataWithTalk = AddDialogueDataWithTalk,
  AddDialogueDataWithBlackScreen = AddDialogueDataWithBlackScreen,
  AddOptionWithNormal = AddOptionWithNormal,
  AddOptionWithImpressionValue = AddOptionWithImpressionValue,
  AddOptionWithImpressionCheck = AddOptionWithImpressionCheck,
  GetReviewDataList = GetReviewDataList,
  ClearAllReviewData = ClearAllReviewData,
  OpenCutShowReview = OpenCutShowReview
}
return StoryReviewUtils
