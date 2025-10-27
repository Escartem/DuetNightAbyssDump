local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local RewardUtils = require("Utils.RewardUtils")
local WikiEntry = Class("WikiEntry", CustomTypes.CustomAttr)
WikiEntry.__Props__ = {
  WikiEntryId = prop.prop("Int", "client save"),
  UnlockTexts = prop.prop("Int2IntDict", "client save"),
  ReadTexts = prop.prop("Int2IntDict", "client save")
}

function WikiEntry:Init(WikiEntryId)
  self.WikiEntryId = WikiEntryId
end

FormatProperties(WikiEntry)
local WikiEntryDict = Class("WikiEntryDict", CustomTypes.CustomDict)
WikiEntryDict.KeyType = BaseTypes.Int
WikiEntryDict.ValueType = WikiEntry

function WikiEntryDict:NewWikiEntry(WikiEntryId)
  return WikiEntry(WikiEntryId)
end

return {WikiEntry = WikiEntry, WikiEntryDict = WikiEntryDict}
