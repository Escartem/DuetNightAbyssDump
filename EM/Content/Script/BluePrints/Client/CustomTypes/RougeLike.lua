local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local RougeServerBuild = Class("RougeServerBuild", CustomTypes.CustomAttr)
RougeServerBuild.__Props__ = {
  Id = prop.prop("Int", "save"),
  RoomType = prop.prop("IntSet", ""),
  RoomCount = prop.prop("Int", "save"),
  bTriggered = prop.prop("Bool", "save", true)
}
FormatProperties(RougeServerBuild)

function RougeServerBuild:Init(Id)
  self.Id = Id
  self:InitRoomType()
  local Info = DataMgr.RougeLikeServerBuild[Id]
  self.RoomCount = Info.RoomCount
  self.bTriggered = false
end

function RougeServerBuild:InitRoomType()
  local Info = DataMgr.RougeLikeServerBuild[self.Id]
  local RoomType = Info.RoomType
  if not RoomType then
    self.RoomType:AddElement(0)
  else
    for i = 1, #RoomType do
      self.RoomType:AddElement(Info.RoomType[i])
    end
  end
end

function RougeServerBuild:CanEffect(RoomType)
  if self.RoomType:IsEmpty() then
    self:InitRoomType()
  end
  if self.RoomType:HasElement(0) then
    return not self:IsFinishEffect()
  end
  if self.RoomType:HasElement(RoomType) then
    return not self:IsFinishEffect()
  end
  return false
end

function RougeServerBuild:TriggerEffect(bRoomEnd)
  if not self.bTriggered then
    self.bTriggered = true
  end
  if not bRoomEnd then
    return
  end
  if self.RoomCount <= 0 then
    return
  end
  self.RoomCount = self.RoomCount - 1
end

function RougeServerBuild:IsFinishEffect()
  return 0 == self.RoomCount and self.bTriggered
end

local RougeServerBuildList = Class("RougeServerBuildList", CustomTypes.CustomList)
RougeServerBuildList.ValueType = RougeServerBuild
local RougeServerBuildTotalList = Class("RougeServerBuildTotalList", CustomTypes.CustomList)
RougeServerBuildTotalList.ValueType = RougeServerBuildList
local IndependentServerBuild = Class("IndependentServerBuild", CustomTypes.CustomDict)
IndependentServerBuild.KeyType = BaseTypes.Str
IndependentServerBuild.ValueType = RougeServerBuild
local RougeServerBuildInfo = Class("RougeServerBuildInfo", CustomTypes.CustomAttr)
RougeServerBuildInfo.__Props__ = {
  RougeServerBuild = prop.prop("RougeServerBuildTotalList", "save"),
  CurrentIndex = prop.prop("Int", "save", 1),
  IndependentServerBuild = prop.prop("IndependentServerBuild", "save")
}
FormatProperties(RougeServerBuildInfo)

function RougeServerBuildInfo:Init(ServerBuild)
  if not ServerBuild then
    return
  end
  for i = 1, #ServerBuild do
    local EffectList = ServerBuild[i]
    local TotalList = RougeServerBuildList()
    for j = 1, #EffectList do
      TotalList:Append(RougeServerBuild(EffectList[j]))
    end
    self.RougeServerBuild:Append(TotalList)
  end
end

function RougeServerBuildInfo:IsFinishAllEffects()
  return self.CurrentIndex > self.RougeServerBuild:Length()
end

local RougeServerBuildManager = Class("RougeServerBuildManager", CustomTypes.CustomDict)
RougeServerBuildManager.KeyType = BaseTypes.Str
RougeServerBuildManager.ValueType = RougeServerBuildInfo

function RougeServerBuildManager:AddServerBuild(Tag, ServerBuild)
  self:AddValue(Tag, RougeServerBuildInfo(ServerBuild))
end

function RougeServerBuildManager:RemoveServerBuild(Tag)
  self:RemoveValue(Tag)
end

function RougeServerBuildManager:AddIndependentServerBuild(SourceTag, Tag, ServerBuild)
  if not self[SourceTag] then
    return
  end
  local IndependentServerBuild = self[SourceTag].IndependentServerBuild
  local ServerBuild = RougeServerBuild(ServerBuild)
  IndependentServerBuild:AddValue(Tag, ServerBuild)
  return ServerBuild
end

function RougeServerBuildManager:RemoveIndependentServerBuild(SourceTag, Tag)
  if not self[SourceTag] then
    return
  end
  local IndependentServerBuild = self[SourceTag].IndependentServerBuild
  IndependentServerBuild:RemoveValue(Tag)
end

local RougeAwardInfo = Class("RougeAwardInfo", CustomTypes.CustomAttr)
RougeAwardInfo.__Props__ = {
  Level = prop.prop("Int", "save", 1),
  bActive = prop.prop("Bool", "save", true),
  bEffected = prop.prop("Bool", "save", true)
}
FormatProperties(RougeAwardInfo)

function RougeAwardInfo:Init(Level, EffectStartRoomIndex)
  self.Level = Level
  self.EffectStartRoomIndex = EffectStartRoomIndex
end

function RougeAwardInfo:SetEffectDuration(Duration, RoomType)
  self.EffectDuration = Duration
  self.EffectRoomType:Clear()
  for i = 1, #RoomType do
    self.EffectRoomType:AddElement(RoomType[i])
  end
end

function RougeAwardInfo:IsRoomValid(RoomType)
  if 0 == self.EffectRoomType:IsEmpty() then
    return true
  end
  if self.EffectRoomType:HasElement(0) then
    return true
  end
  if self.EffectRoomType:HasElement(RoomType) then
    return true
  end
  return false
end

function RougeAwardInfo:Dump()
  local Data = self:all_dump(self)
  return Data
end

local RougeAwardDict = Class("RougeAwardDict", CustomTypes.CustomDict)
RougeAwardDict.KeyType = BaseTypes.Int
RougeAwardDict.ValueType = RougeAwardInfo

function RougeAwardDict:AddAward(AwardId, Level, RoomIndex)
  local AwardInfo = RougeAwardInfo(Level, RoomIndex)
  self:AddValue(AwardId, AwardInfo)
  return AwardInfo
end

function RougeAwardDict:RemoveAward(AwardId)
  local AwardInfo = self:Get(AwardId)
  self:RemoveValue(AwardId)
  return AwardInfo
end

function RougeAwardDict:Dump()
  local Data = {}
  for k, v in pairs(self._inner) do
    Data[k] = v:Dump()
  end
  return Data
end

local AutoUpgrade = Class("AutoUpgrade", CustomTypes.CustomAttr)
AutoUpgrade.__Props__ = {
  Level = prop.prop("Int", "save", 1),
  Rarity = prop.prop("IntSet", "save")
}
FormatProperties(AutoUpgrade)

function AutoUpgrade:Init(Level, Rarity)
  self.Level = Level
  for i = 1, #Rarity do
    self.Rarity:AddElement(Rarity[i])
  end
end

local AutoUpgradeDict = Class("AutoUpgradeDict", CustomTypes.CustomDict)
AutoUpgradeDict.KeyType = BaseTypes.Str
AutoUpgradeDict.ValueType = AutoUpgrade

function AutoUpgradeDict:AddAutoUpgrade(Tag, Level, Rarity)
  self:AddValue(Tag, AutoUpgrade(Level, Rarity))
end

function AutoUpgradeDict:RemoveAutoUpgrade(Tag)
  self:RemoveValue(Tag)
end

local DeathCounter = Class("DeathCounter", CustomTypes.CustomAttr)
DeathCounter.__Props__ = {
  SourceTag = prop.prop("Str", "save"),
  Count = prop.prop("Int", "save", 0),
  TargetCount = prop.prop("Int", "save"),
  MonsterType = prop.prop("Str", "save"),
  ServerBuild = prop.prop("Int", "save")
}
FormatProperties(DeathCounter)

function DeathCounter:Init(SourceTag, MonsterType, Count, ServerBuild)
  self.SourceTag = SourceTag
  self.TargetCount = Count
  self.MonsterType = MonsterType
  self.ServerBuild = ServerBuild
end

local DeathCounterDict = Class("DeathCounterDict", CustomTypes.CustomDict)
DeathCounterDict.KeyType = BaseTypes.Str
DeathCounterDict.ValueType = DeathCounter

function DeathCounterDict:AddDeathCounter(Tag, MonsterType, Count, ServerBuild)
  self:AddValue(Tag, DeathCounter(Tag, MonsterType, Count, ServerBuild))
end

function DeathCounterDict:RemoveDeathCounter(Tag)
  self:RemoveValue(Tag)
end

local GroupWeightRate = Class("GroupWeightRate", CustomTypes.CustomAttr)
GroupWeightRate.__Props__ = {
  GroupIds = prop.prop("IntSet", "save"),
  WeightRate = prop.prop("Float", "save", 1.0)
}
FormatProperties(GroupWeightRate)

function GroupWeightRate:Init(GroupIds, WeightRate)
  for i = 1, #GroupIds do
    self.GroupIds:AddElement(GroupIds[i])
  end
  self.WeightRate = WeightRate
end

local GroupWeightRateDict = Class("GroupWeightRateDict", CustomTypes.CustomDict)
GroupWeightRateDict.KeyType = BaseTypes.Str
GroupWeightRateDict.ValueType = GroupWeightRate

function GroupWeightRateDict:AddGroupWeightRate(Tag, GroupIds, WeightRate)
  self:AddValue(Tag, GroupWeightRate(GroupIds, WeightRate))
end

function GroupWeightRateDict:RemoveGroupWeightRate(Tag)
  self:RemoveValue(Tag)
end

local RougeLike = Class("RougeLike", CustomTypes.CustomAttr)
RougeLike.__Props__ = {
  SeasonId = prop.prop("Int", "save"),
  DifficultyId = prop.prop("Int", "save"),
  DungeonSid = prop.prop("ObjId", "save"),
  RoomIndex = prop.prop("Int", "save", 0),
  RoomId = prop.prop("Int", "save", -1),
  PassRooms = prop.prop("IntList", "save"),
  RandomRooms = prop.prop("IntList", "save"),
  RandomBlessings = prop.prop("IntList", "save"),
  RandomBlessingId = prop.prop("Int", "save"),
  RandomTreasures = prop.prop("IntList", "save"),
  RandomTreasureId = prop.prop("Int", "save"),
  MaxRefreshTime = prop.prop("Str2IntDict", "save"),
  RefreshTime = prop.prop("Int", "save"),
  Blessings = prop.prop("RougeAwardDict", "save"),
  Treasures = prop.prop("RougeAwardDict", "save"),
  Shop = prop.prop("RougeLikeShop.RougeLikeShopDict", "save"),
  Score = prop.prop("Str2IntDict", "save"),
  DungeonInfo = prop.prop("Str", "save"),
  GameInfo = prop.prop("Str", "save"),
  PlayerSliceInfo = prop.prop("StrList", "save"),
  EventId = prop.prop("Int", "save", 0),
  StoryId = prop.prop("Int", "save", 0),
  bCanTriggerStory = prop.prop("Int", "save", 1),
  bStoryTriggered = prop.prop("Int", "save", 0),
  StoryHistory = prop.prop("Int2IntDict", "save"),
  TokenExtraRate = prop.prop("Str2FloatDict", "save"),
  EndPointsExtraRate = prop.prop("Str2FloatDict", "save"),
  ShopDiscount = prop.prop("Str2FloatDict", "save"),
  RecoverTimes = prop.prop("Str2IntDict", "save"),
  RecoverCost = prop.prop("Str2IntDict", "save"),
  RecoverTagQueue = prop.prop("StrList", "save"),
  ExtraTreasureList = prop.prop("IntList", "save"),
  ExtraBlessingList = prop.prop("IntList", "save"),
  ModifiedChoiceNumber = prop.prop("Str2IntDict", "save"),
  ModifiedChoiceNumberStack = prop.prop("StrList", "save"),
  bRandomChoice = prop.prop("StrSet", "save"),
  bDisableGetToken = prop.prop("StrSet", "save"),
  OverrideRefreshCost = prop.prop("Str2IntDict", "save"),
  OverrideRefreshTimes = prop.prop("Str2IntDict", "save"),
  RefreshRate = prop.prop("Str2FloatDict", "save"),
  MRTAutoUpgrade = prop.prop("AutoUpgradeDict", "save"),
  DeathCounter = prop.prop("DeathCounterDict", "save"),
  OverrideBlessingMRTLimitRarity = prop.prop("Str2IntListDict", "save"),
  OverrideBlessingMRTLimitRarityTagStack = prop.prop("StrList", "save"),
  OverrideTreasureMRTLimitRarity = prop.prop("Str2IntListDict", "save"),
  OverrideTreasureMRTLimitRarityTagStack = prop.prop("StrList", "save"),
  BlessingGroupWeightRate = prop.prop("GroupWeightRateDict", "save"),
  TreasureGroupWeightRate = prop.prop("GroupWeightRateDict", "save"),
  ServerBuildManager = prop.prop("RougeServerBuildManager", "save"),
  TMRewardIndex = prop.prop("Int", "save", 1),
  TokenId = prop.getter("Data", "TokenId"),
  TalentId = prop.getter("Data", "TalentId"),
  OuterShopTokenId = prop.getter("Data", "OuterShopTokenId")
}

function RougeLike:Init(SeasonId, DifficultyId)
  self.SeasonId = SeasonId
  self.DifficultyId = DifficultyId
  self:AddMaxRefreshTime(self:GenTag("Default"), DataMgr.RougeLikeSeason[SeasonId].MRTLimitTimes)
  self.DungeonSid = GWorld.IdManager.GenId()
end

function RougeLike:Data()
  return DataMgr.RougeLikeSeason[self.SeasonId]
end

function RougeLike:EnterRoom(RoomId)
  if self.RoomId == RoomId then
    return ErrorCode.RET_ROUGELIKE_ROOM_REPEAT
  end
  if not CommonUtils.HasValue(self.RandomRooms, RoomId) then
    return ErrorCode.RET_ROUGELIKE_ROOM_CANNOT_ENTER
  end
  if self.StoryId > 0 then
    return ErrorCode.RET_ROUGELIKE_STORY_NOT_FINISH
  end
  self.RoomId = RoomId
  self.RoomIndex = self.RoomIndex + 1
  self.EventId = 0
  self.bStoryTriggered = 0
  self:SetShopCanRefresh()
  return ErrorCode.RET_SUCCESS
end

function RougeLike:GetCurrentRoomType()
  if -1 == self.RoomId then
    return 0
  end
  local RoomInfo = DataMgr.RougeLikeRoom[self.RoomId]
  if not RoomInfo then
    return 0
  end
  return RoomInfo.RoomType
end

function RougeLike:PassRoom(Time)
  if self.RoomIndex == self.PassRooms:Length() then
    return ErrorCode.RET_ROUGELIKE_ROOM_PASS_REPEAT
  end
  self.PassRooms:Append(self.RoomId)
  local ScoreInfo = DataMgr.RougeLikeRoom[self.RoomId]
  self:UpdateScore(self:GenTag("PassRoom", self.RoomId), ScoreInfo.EndPointsBase)
  local ExtraScore = ScoreInfo.EndPointsExtras
  if not ExtraScore then
    ExtraScore = 0
  else
    ExtraScore = ExtraScore - math.floor(Time)
  end
  if ExtraScore < 0 then
    ExtraScore = 0
  end
  self:UpdateScore(self:GenTag("PassRoomExtra", self.RoomId), ExtraScore)
  return ErrorCode.RET_SUCCESS
end

function RougeLike:GenTag(...)
  return table.concat({
    ...
  }, "_")
end

function RougeLike:SplitTag(Tag)
  local result = {}
  for str in string.gmatch(Tag, "([^_]+)") do
    table.insert(result, str)
  end
  return result
end

function RougeLike:AddMaxRefreshTime(Tag, Count)
  self.MaxRefreshTime:AddValue(Tag, Count)
end

function RougeLike:RemoveMaxRefreshTime(Tag)
  self.MaxRefreshTime:RemoveValue(Tag)
end

function RougeLike:GetMaxRefreshTime()
  local count = 0
  for _, v in pairs(self.MaxRefreshTime) do
    count = count + v
  end
  return count
end

function RougeLike:GetRefreshCost()
  local SortedTags = {}
  for k, v in pairs(self.OverrideRefreshCost) do
    local bInserted = false
    for i = 1, #SortedTags do
      local CompKey = SortedTags[i]
      local CompValue = self.OverrideRefreshCost[CompKey]
      if v < CompValue then
        table.insert(SortedTags, i, k)
        bInserted = true
        break
      end
    end
    if not bInserted then
      table.insert(SortedTags, k)
    end
  end
  local LeftTime = self.RefreshTime
  local Index = 1
  local CostTag
  while LeftTime >= 0 do
    CostTag = SortedTags[Index]
    if not CostTag then
      break
    end
    local TagTime = self.OverrideRefreshTimes[CostTag]
    LeftTime = LeftTime - TagTime
    Index = Index + 1
  end
  local OriginCost = self.OverrideRefreshCost[CostTag]
  OriginCost = OriginCost or DataMgr.RougeLikeSeason[self.SeasonId].MRTCost
  return math.ceil(OriginCost * self:GetRefreshRate())
end

function RougeLike:GetRefreshRate()
  local rate = 1
  for _, v in pairs(self.RefreshRate) do
    rate = rate * v
  end
  return rate
end

function RougeLike:ResetRandomRooms(RandomRooms)
  self.RandomRooms:Clear()
  if not RandomRooms then
    return
  end
  for i = 1, #RandomRooms do
    self.RandomRooms:Append(RandomRooms[i])
  end
end

function RougeLike:ResetRandomBlessings(RandomBlessings, RandomBlessingId)
  self.RandomBlessings:Clear()
  self.RandomBlessingId = RandomBlessingId or -1
  if not RandomBlessings then
    return
  end
  local len = #RandomBlessings
  if 0 == #RandomBlessings then
    return
  end
  for i = 1, len do
    self.RandomBlessings:Append(RandomBlessings[i])
  end
end

function RougeLike:ResetRandomTreasures(RandomTreasures, RandomTreasureId)
  self.RandomTreasures:Clear()
  self.RandomTreasureId = RandomTreasureId or -1
  if not RandomTreasures then
    return
  end
  local len = #RandomTreasures
  if 0 == #RandomTreasures then
    return
  end
  for i = 1, len do
    self.RandomTreasures:Append(RandomTreasures[i])
  end
end

function RougeLike:SetShopCanRefresh(bRefresh)
  if nil ~= bRefresh and false == bRefresh then
    self.bShopRefresh = 0
  else
    self.bShopRefresh = 1
  end
end

function RougeLike:ResetShop()
  self.Shop:Clear()
end

function RougeLike:NewShop(ShopRandomId, Blessings, Treasures, Items)
  local ShopInfo = self.Shop:NewShop(Blessings, Treasures, Items)
  self.Shop[ShopRandomId] = ShopInfo
end

function RougeLike:DumpShop()
  local result = {}
  for k, v in pairs(self.Shop) do
    result[k] = {
      ShopBlessing = v.ShopBlessing,
      ShopTreasure = v.ShopTreasure,
      ShopItem = v.ShopItem
    }
  end
  return result
end

function RougeLike:UpdateScore(Tag, Value)
  if not Value then
    self.Score:RemoveValue(Tag)
  else
    self.Score:AddValue(Tag, Value)
  end
end

function RougeLike:GetScore()
  local fv = 0
  for _, v in pairs(self.Score) do
    fv = fv + v
  end
  return fv
end

function RougeLike:GetTokenExtraRate()
  local rate = 1
  for _, v in pairs(self.TokenExtraRate) do
    rate = rate + v
  end
  return math.max(rate, 0)
end

function RougeLike:GetEndPointsExtraRate()
  local rate = 1
  for _, v in pairs(self.EndPointsExtraRate) do
    rate = rate + v
  end
  return math.max(rate, 0)
end

function RougeLike:GetShopDiscount()
  local rate = 1
  for _, v in pairs(self.ShopDiscount) do
    rate = rate * v
  end
  return math.max(rate, 0)
end

function RougeLike:GetModifiedChoiceNumber()
  local number = -1
  local len = self.ModifiedChoiceNumberStack:Length()
  if len > 0 then
    number = self.ModifiedChoiceNumber:Get(self.ModifiedChoiceNumberStack:Get(len))
  end
  return number
end

function RougeLike:GetOverrideMRTLimitRarity(AwardType, DefaultLimitRarity)
  local LimitRarityKey = "Override" .. AwardType .. "MRTLimitRarity"
  local LimitRarity = self[LimitRarityKey]
  local LimitRarityTagStack = self[LimitRarityKey .. "TagStack"]
  if LimitRarityTagStack:IsEmpty() then
    return DefaultLimitRarity
  end
  local Len = LimitRarityTagStack:Length()
  local Rarity = LimitRarity:Get(LimitRarityTagStack:Get(Len))
  local ret = {}
  for i = 1, Rarity:Length() do
    ret[i] = Rarity:Get(i)
  end
  return ret
end

function RougeLike:GetGroupWeightRate(AwardType, GroupId)
  local BaseRate = 1
  local GroupWeight = self[AwardType .. "GroupWeightRate"]
  for _, attr in pairs(GroupWeight) do
    if attr.GroupIds:HasElement(GroupId) then
      BaseRate = BaseRate * attr.WeightRate
    end
  end
  return BaseRate
end

function RougeLike:IsRandomChoice()
  return not self.bRandomChoice:IsEmpty()
end

function RougeLike:IsCanGetToken()
  return self.bDisableGetToken:IsEmpty()
end

function RougeLike:SaveDungeonInfo(PlayerInfo, SquadInfo, CommonCombatInfo)
  local DungeonInfo = {
    PlayerInfo,
    SquadInfo,
    CommonCombatInfo
  }
  self.DungeonInfo = SerializeUtils:Serialize(DungeonInfo)
end

function RougeLike:GetDungeonInfo()
  return table.unpack(SerializeUtils:UnSerialize(self.DungeonInfo))
end

function RougeLike:SavePlayerSliceInfo(SliceInfo)
  self.PlayerSliceInfo:Append(SliceInfo)
end

function RougeLike:SetCanTriggerStory(bCanTrigger)
  self.bCanTriggerStory = bCanTrigger and 1 or 0
end

function RougeLike:CanTriggerStory()
  return 1 == self.bCanTriggerStory
end

function RougeLike:IsStoryEventFinished()
  return 0 == self.StoryId and 1 == self.bStoryTriggered
end

function RougeLike:CheckAllFrontEvent(FrontEvents)
  if not FrontEvents then
    return true
  end
  
  local function CheckConditionUnit(EventDict)
    for EventCondition, IndexCondition in pairs(EventDict) do
      local SelectIndex = self.StoryHistory:Get(EventCondition)
      if not SelectIndex then
        return false
      end
      local bInCondition = false
      for i = 1, #IndexCondition do
        local v = IndexCondition[i]
        if 0 == v or v == SelectIndex then
          bInCondition = true
          break
        end
      end
      if not bInCondition then
        return false
      end
    end
    return true
  end
  
  for i = 1, #FrontEvents do
    if CheckConditionUnit(FrontEvents[i]) then
      return true
    end
  end
  return false
end

FormatProperties(RougeLike)
local RougeLikeDict = Class("RougeLikeDict", CustomTypes.CustomDict)
RougeLikeDict.KeyType = BaseTypes.Int
RougeLikeDict.ValueType = RougeLike

function RougeLikeDict:NewRougeLike(SeasonId, DifficultyId)
  return RougeLike(SeasonId, DifficultyId)
end

return {
  RougeAwardInfo = RougeAwardInfo,
  RougeLike = RougeLike,
  RougeLikeDict = RougeLikeDict,
  RougeServerBuild = RougeServerBuild,
  RougeServerBuildList = RougeServerBuildList,
  RougeServerBuildTotalList = RougeServerBuildTotalList,
  RougeServerBuildInfo = RougeServerBuildInfo,
  RougeServerBuildManager = RougeServerBuildManager,
  RougeAwardDict = RougeAwardDict,
  DeathCounterDict = DeathCounterDict,
  AutoUpgradeDict = AutoUpgradeDict,
  IndependentServerBuild = IndependentServerBuild,
  AutoUpgrade = AutoUpgrade,
  DeathCounter = DeathCounter,
  GroupWeightRateDict = GroupWeightRateDict,
  GroupWeightRate = GroupWeightRate
}
