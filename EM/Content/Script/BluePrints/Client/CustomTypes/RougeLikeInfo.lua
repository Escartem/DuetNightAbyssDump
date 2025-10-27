local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local RougeLikeInfo = Class("RougeLikeInfo", CustomTypes.CustomAttr)
RougeLikeInfo.__Props__ = {
  RougeLikeSeasons = prop.prop("RougeLike.RougeLikeDict", "save"),
  LastSeasonId = prop.prop("Int", "save", -1),
  InProgress = prop.prop("Int", "client"),
  Talent = prop.prop("Int2IntDict", "client save"),
  TalentTotalPoint = prop.prop("Int", "client save", 0),
  ProgressingSeasonId = prop.prop("Int", "client save"),
  ProgressingDifficultyId = prop.prop("Int", "client"),
  WeeklyTotalScore = prop.prop("Int", "client save", 0),
  WeeklyRewardId = prop.prop("Int", "client save", -1),
  WeeklyRewardGot = prop.prop("Int2IntDict", "client save"),
  Manual = prop.prop("Int2IntSetDict", "client save"),
  ManualRewardGot = prop.prop("Int2IntSetDict", "client save"),
  LastPassRoom = prop.prop("Int", "client save", 0),
  Contract = prop.prop("Int2IntDict", "client save"),
  PassCount = prop.prop("Int2IntDict", "client save")
}

function RougeLikeInfo:EnterDump(SeasonId, bHighestDifficulty)
  local res = {}
  local RougeLikeSeason = self.RougeLikeSeasons[SeasonId]
  res.SeasonId = SeasonId
  res.DifficultyId = RougeLikeSeason.DifficultyId
  res.RoomIndex = RougeLikeSeason.RoomIndex
  res.RoomId = RougeLikeSeason.RoomId
  res.PassRooms = RougeLikeSeason.PassRooms
  res.RandomRooms = RougeLikeSeason.RandomRooms
  res.RandomBlessings = RougeLikeSeason.RandomBlessings
  res.RandomTreasures = RougeLikeSeason.RandomTreasures
  res.Blessings = RougeLikeSeason.Blessings:Dump()
  res.Treasures = RougeLikeSeason.Treasures:Dump()
  res.MaxRefreshTime = RougeLikeSeason:GetMaxRefreshTime()
  res.RefreshTime = RougeLikeSeason.RefreshTime
  res.RefreshCost = RougeLikeSeason:GetRefreshCost()
  res.Shop = RougeLikeSeason:DumpShop()
  res.EventId = RougeLikeSeason.EventId
  res.Talent = self.Talent
  res.TokenExtraRate = RougeLikeSeason:GetTokenExtraRate()
  res.EndPointsExtraRate = RougeLikeSeason:GetEndPointsExtraRate()
  res.ShopDiscount = RougeLikeSeason:GetShopDiscount()
  res.StoryId = RougeLikeSeason.StoryId
  res.CanGetToken = RougeLikeSeason:IsCanGetToken()
  if bHighestDifficulty then
    res.Contract = self.Contract
  end
  return res
end

function RougeLikeInfo:FinishDump(RougeLike)
  local res = {}
  RougeLike = RougeLike or self.RougeLikeSeasons[self.ProgressingSeasonId]
  if not RougeLike then
    return res
  end
  res.Blessings = RougeLike.Blessings:Dump()
  res.Treasures = RougeLike.Treasures:Dump()
  res.PassRooms = RougeLike.PassRooms
  return res
end

function RougeLikeInfo:GetSeason(SeasonId)
  return self.RougeLikeSeasons[SeasonId]
end

function RougeLikeInfo:NewRougeLike(SeasonId, Difficulty, PlayerInfo, SquadInfo, CommonCombatInfo)
  local Session = self.RougeLikeSeasons:NewRougeLike(SeasonId, Difficulty)
  Session:SaveDungeonInfo(PlayerInfo, SquadInfo, CommonCombatInfo)
  self.RougeLikeSeasons[SeasonId] = Session
  return Session
end

function RougeLikeInfo:ClearRougeLike(SeasonId)
  if self.RougeLikeSeasons[SeasonId] then
    self.RougeLikeSeasons[SeasonId] = nil
  end
end

function RougeLikeInfo:IsInProgress()
  return 1 == self.InProgress
end

function RougeLikeInfo:GetHeatSum()
  local HeatSum = 0
  for k, v in pairs(self.Contract) do
    local HeatValue = DataMgr.RougeLikeContract[k].HeatValue or 0
    HeatSum = HeatSum + HeatValue * v
  end
  return HeatSum
end

function RougeLikeInfo:GetContractRate(SeasonId)
  local PointContractRate = DataMgr.RougeLikeSeason[SeasonId].PointContractRate or 0
  local HeatSum = self:GetHeatSum()
  return HeatSum * PointContractRate + 1
end

function RougeLikeInfo:SetPass(DifficultyId)
  local PreCount = self.PassCount[DifficultyId] or 0
  self.PassCount[DifficultyId] = PreCount + 1
  return 0 == PreCount
end

function RougeLikeInfo:IsManualUnlocked(ManualType, Key)
  return self.Manual:HasElement(ManualType, Key)
end

function RougeLikeInfo:IsManualRewardGot(ManualType, Index)
  return self.ManualRewardGot:HasElement(ManualType, Index)
end

FormatProperties(RougeLikeInfo)
return {RougeLikeInfo = RougeLikeInfo}
