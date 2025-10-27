local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local MonthlyCard = Class("MonthlyCard", CustomTypes.CustomAttr)
MonthlyCard.__Props__ = {
  CardId = prop.prop("Int", "client save"),
  BuyTime = prop.prop("IntList", "client save"),
  BeginTime = prop.getter("Data", "BeginTime"),
  EndTime = prop.getter("Data", "EndTime"),
  BuyReward = prop.getter("Data", "BuyReward"),
  DailyReward = prop.getter("Data", "DailyReward"),
  UniqueReward = prop.getter("Data", "UniqueReward")
}

function MonthlyCard:Init(CardId)
  self.CardId = CardId
end

function MonthlyCard:Data()
  return DataMgr.MonthlyCard[self.CardId]
end

FormatProperties(MonthlyCard)
local MonthlyCardDict = Class("MonthlyCardDict", CustomTypes.CustomDict)
MonthlyCardDict.KeyType = BaseTypes.Int
MonthlyCardDict.ValueType = MonthlyCard

function MonthlyCardDict:NewMonthlyCard(CardId)
  local MonthlyCard = MonthlyCard(CardId)
  return MonthlyCard
end

local MonthlyCardDailyReward = Class("MonthlyCardDailyReward", CustomTypes.CustomAttr)
MonthlyCardDailyReward.__Props__ = {
  CardId = prop.prop("Int", "save"),
  DailyRewardId = prop.prop("Int", "save"),
  GotTimes = prop.prop("Int", "save")
}

function MonthlyCardDailyReward:Init(CardId, DailyRewardId, GotTimes)
  self.CardId = CardId
  self.DailyRewardId = DailyRewardId
  self.GotTimes = GotTimes
end

FormatProperties(MonthlyCardDailyReward)
local MonthlyCardDailyRewardList = Class("MonthlyCardDailyRewardList", CustomTypes.CustomList)
MonthlyCardDailyRewardList.ValueType = MonthlyCardDailyReward

function MonthlyCardDailyRewardList:NewMonthlyCardDailyReward(CardId, DailyRewardId, GotTimes)
  local MonthlyCardDailyReward = MonthlyCardDailyReward(CardId, DailyRewardId, GotTimes)
  return MonthlyCardDailyReward
end

return {
  MonthlyCard = MonthlyCard,
  MonthlyCardDict = MonthlyCardDict,
  MonthlyCardDailyReward = MonthlyCardDailyReward,
  MonthlyCardDailyRewardList = MonthlyCardDailyRewardList
}
