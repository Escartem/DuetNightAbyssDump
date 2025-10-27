local WikiCommon = require("BluePrints.UI.WBP.Wiki.WikiCommon")
local EMCache = require("EMCache.EMCache")
local M = Class("BluePrints.Common.MVC.Model")

function M:Init()
  M.Super.Init(self)
  self.AllGuideNotes = DataMgr.WikiMain or {}
  self.Categories = {}
  self.NewStateListeners = {}
  self:InitCategories()
  self:InitNewStateStructure()
end

function M:Destory()
  self:SaveNewStateToCache()
  M.Super.Destory(self)
end

function M:GetWikiSubType(tabId)
  local WikiSubType = DataMgr.WikiSubType or {}
  if not tabId then
    return {}
  end
  if tabId == WikiCommon.CategoryType.All then
    return WikiSubType
  end
  local subTypes = {}
  for id, data in pairs(WikiSubType) do
    if data.MainType == tabId - 1 then
      subTypes[id] = data
    end
  end
  return subTypes
end

function M:GetWikiTextByEntryId(entryId)
  local WikiText = DataMgr.WikiText or {}
  local entryTexts = {}
  for id, textData in pairs(WikiText) do
    if textData.EntryId == entryId then
      entryTexts[id] = textData
    end
  end
  table.sort(entryTexts, function(a, b)
    return a.TextId < b.TextId
  end)
  return entryTexts
end

function M:GetEntriesBySubType(tabId)
  local wikiData = DataMgr.WikiMain or {}
  local entriesBySubType = {}
  for entryId, entryData in pairs(wikiData) do
    local mainType = entryData.MainType
    local subType = entryData.SubType
    local mappedTabId = mainType + 1
    if tabId == WikiCommon.CategoryType.All or mappedTabId == tabId then
      entriesBySubType[subType] = entriesBySubType[subType] or {}
      entriesBySubType[subType][entryId] = {
        entryId = entryId,
        EntryTitle = entryData.EntryTitle,
        MainType = mainType,
        SubType = subType,
        AssociatedEntry1 = entryData.AssociatedEntry1
      }
    end
  end
  return entriesBySubType
end

function M:GetTextNum(tabId)
  local NumNow, NumAll = 0, 0
  if self.AllGuideNotes then
    for _, entryData in pairs(self.AllGuideNotes) do
      if tabId == WikiCommon.CategoryType.All or entryData.MainType + 1 == tabId then
        NumAll = NumAll + 1
      end
    end
  end
  local UnlockedWikiNotes = self:GetUnlockedWikiEntryIds()
  if UnlockedWikiNotes then
    for entryId, _ in pairs(UnlockedWikiNotes) do
      local notes = self.AllGuideNotes or {}
      local entryData = notes[entryId]
      if entryData and (tabId == WikiCommon.CategoryType.All or entryData.MainType + 1 == tabId) then
        NumNow = NumNow + 1
      end
    end
  end
  return NumNow, NumAll
end

function M:GetUnlockedWikiEntryIds()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local UnlockedWikiNotes = Avatar.WikiEntries
  if not UnlockedWikiNotes then
    return {}
  end
  return UnlockedWikiNotes
end

function M:GetUnlockTexts()
  local UnlockedWikiNotes = self:GetUnlockedWikiEntryIds() or {}
  local UnlockTexts = {}
  for entryId, entryData in pairs(UnlockedWikiNotes) do
    if entryData.Props and entryData.Props.UnlockTexts then
      for textId, value in pairs(entryData.Props.UnlockTexts) do
        UnlockTexts[textId] = value
      end
    end
  end
  return UnlockTexts
end

function M:InitCategories()
  self.Categories = {}
  self.Categories[1] = {
    WikiNotes = {}
  }
  if self.AllGuideNotes then
    for _, Content in pairs(self.AllGuideNotes) do
      local TabID = Content.MainType + 1
      if not self.Categories[TabID] then
        self.Categories[TabID] = {
          WikiNotes = {}
        }
      end
    end
  else
    DebugPrint(TXTTag, "AllGuideNotes is nil")
  end
end

function M:InitNewStateStructure()
  self.NewStateStructure = {
    Tabs = {},
    SubTypes = {},
    Entries = {},
    Texts = {}
  }
  self:LoadNewStateFromCache()
end

function M:LoadNewStateFromCache()
  local cachedState = EMCache:Get("WikiNewState", true)
  if cachedState then
    cachedState.Tabs = cachedState.Tabs or {}
    cachedState.SubTypes = cachedState.SubTypes or {}
    cachedState.Entries = cachedState.Entries or {}
    cachedState.Texts = cachedState.Texts or {}
    self.NewStateStructure = cachedState
  end
end

function M:SaveNewStateToCache()
  EMCache:Set("WikiNewState", self.NewStateStructure, true)
end

function M:GetCategories()
  return self.Categories
end

function M:GetCategoryWikiNotes(categoryId)
  if not self.Categories[categoryId] then
    return {}
  end
  return self.Categories[categoryId].WikiNotes or {}
end

function M:SortAndFilterEntries(entries)
  if not entries or CommonUtils.Size(entries) <= 0 then
    return {}
  end
  local unlockedEntries = self:GetUnlockedWikiEntryIds()
  local sortedEntries = {}
  for entryId, entryData in pairs(entries) do
    if unlockedEntries and unlockedEntries[entryId] then
      table.insert(sortedEntries, {
        entryId = entryId,
        entryData = entryData,
        isNew = self:IsEntryNew(entryId)
      })
    end
  end
  table.sort(sortedEntries, function(a, b)
    if a.isNew ~= b.isNew then
      return a.isNew
    end
    return tonumber(a.entryId) < tonumber(b.entryId)
  end)
  return sortedEntries
end

function M:FilterEntriesByUnlock(entries)
  if not entries then
    return {}
  end
  local unlockedEntries = self:GetUnlockedWikiEntryIds()
  if not unlockedEntries then
    return entries
  end
  local filteredEntries = {}
  for entryId, entryData in pairs(entries) do
    if unlockedEntries[entryId] then
      filteredEntries[entryId] = entryData
    end
  end
  return filteredEntries
end

function M:HasUnlockedText(entryId)
  local unlockedTexts = self:GetUnlockTexts()
  if not unlockedTexts then
    return false
  end
  local entryTexts = self:GetWikiTextByEntryId(entryId)
  for textId, _ in pairs(entryTexts) do
    if unlockedTexts[textId] then
      return true
    end
  end
  return false
end

function M:SortTextsByTextId(entryTexts)
  local textArray = {}
  for _, textData in pairs(entryTexts) do
    table.insert(textArray, textData)
  end
  table.sort(textArray, function(a, b)
    return tonumber(a.TextId) < tonumber(b.TextId)
  end)
  return textArray
end

function M:GetReadableDialogueEntries(entryIds)
  if not entryIds then
    return {}
  end
  local readableEntries = {}
  local unlockedEntries = self:GetUnlockedWikiEntryIds()
  local unlockedTexts = self:GetUnlockTexts()
  if not unlockedEntries or not unlockedTexts then
    return {}
  end
  for _, entryId in pairs(entryIds) do
    if unlockedEntries[entryId] and self:HasUnlockedText(entryId) then
      local notes = self.AllGuideNotes or {}
      local entryData = notes[entryId]
      if entryData then
        readableEntries[entryId] = entryData
      end
    end
  end
  return readableEntries
end

function M:AddNewStateListener(listener, callback)
  self.NewStateListeners[listener] = callback
end

function M:RemoveNewStateListener(listener)
  self.NewStateListeners[listener] = nil
end

function M:NotifyNewStateChanged(subTypeId, tabId)
  for _, callback in pairs(self.NewStateListeners) do
    callback(subTypeId, tabId)
  end
end

function M:IsTextNew(textId)
  if not self.NewStateStructure or not self.NewStateStructure.Texts then
    return false
  end
  return self.NewStateStructure.Texts[textId]
end

function M:IsEntryNew(entryId)
  return self.NewStateStructure.Entries[entryId] == true
end

function M:IsSubTypeNew(subTypeId)
  return self.NewStateStructure.SubTypes[subTypeId] == true
end

function M:IsTabNew(tabId)
  return self.NewStateStructure.Tabs[tabId] == true
end

function M:MarkTextAsNew(textId, entryId)
  local entryData = self.AllGuideNotes[entryId]
  if not entryData then
    return
  end
  local subTypeId = entryData.SubType
  local tabId = entryData.MainType + 1
  self.NewStateStructure.Texts[textId] = true
  self.NewStateStructure.Entries[entryId] = true
  self.NewStateStructure.SubTypes[subTypeId] = true
  self.NewStateStructure.Tabs[tabId] = true
  self.NewStateStructure.Tabs[1] = true
  self:SaveNewStateToCache()
end

function M:MarkTextAsRead(textId)
  if not self.NewStateStructure or not self.NewStateStructure.Texts then
    return
  end
  self.NewStateStructure.Texts[textId] = false
  self:SaveNewStateToCache()
end

function M:ClearEntryNewState(entryId)
  local entryData = self.AllGuideNotes[entryId]
  if not entryData then
    return
  end
  local subTypeId = entryData.SubType
  local tabId = entryData.MainType + 1
  self.NewStateStructure.Entries[entryId] = false
  for textId, _ in pairs(self.NewStateStructure.Texts) do
    if self:GetTextEntryId(textId) == entryId then
      self.NewStateStructure.Texts[textId] = false
    end
  end
  self:UpdateParentNewStates()
  self:SaveNewStateToCache()
  self:NotifyNewStateChanged(subTypeId, tabId)
end

function M:UpdateParentNewStates()
  for entryId, _ in pairs(self.NewStateStructure.Entries) do
    local hasNewText = false
    for textId, isNew in pairs(self.NewStateStructure.Texts) do
      if self:GetTextEntryId(textId) == entryId and isNew then
        hasNewText = true
        break
      end
    end
    self.NewStateStructure.Entries[entryId] = hasNewText
  end
  for subTypeId, _ in pairs(self.NewStateStructure.SubTypes) do
    local hasNewEntry = false
    for entryId, isNew in pairs(self.NewStateStructure.Entries) do
      if self:GetEntrySubTypeId(entryId) == subTypeId and isNew then
        hasNewEntry = true
        break
      end
    end
    self.NewStateStructure.SubTypes[subTypeId] = hasNewEntry
  end
  local hasAnyTabNew = false
  for tabId, _ in pairs(self.NewStateStructure.Tabs) do
    if tabId ~= WikiCommon.CategoryType.All then
      local hasNewSubType = false
      for subTypeId, isNew in pairs(self.NewStateStructure.SubTypes) do
        if self:GetSubTypeTabId(subTypeId) == tabId and isNew then
          hasNewSubType = true
          break
        end
      end
      self.NewStateStructure.Tabs[tabId] = hasNewSubType
      if hasNewSubType then
        hasAnyTabNew = true
      end
    end
  end
  self.NewStateStructure.Tabs[WikiCommon.CategoryType.All] = hasAnyTabNew
end

function M:UpdateEntranceRedDot(entranceWidget)
  if not entranceWidget then
    return
  end
  local categoryConfigs = {
    {
      widget = "WBP_Encyclopedia_Culture",
      type = WikiCommon.CategoryType.Civilization
    },
    {
      widget = "WBP_Encyclopedia_Influence",
      type = WikiCommon.CategoryType.Faction
    },
    {
      widget = "WBP_Encyclopedia_Personage",
      type = WikiCommon.CategoryType.Character
    },
    {
      widget = "WBP_Encyclopedia_Terroir",
      type = WikiCommon.CategoryType.Customs
    }
  }
  for _, config in pairs(categoryConfigs) do
    local isNew = self:IsTabNew(config.type)
    if entranceWidget[config.widget] then
      local Visible = isNew and UIConst.VisibilityOp.Visible or UIConst.VisibilityOp.Hidden
      if entranceWidget[config.widget].New and IsValid(entranceWidget[config.widget].New) then
        entranceWidget[config.widget].New:SetVisibility(Visible)
      end
    end
  end
end

function M:GetTextEntryId(textId)
  return math.floor(textId / 100)
end

function M:GetEntrySubTypeId(entryId)
  local entryData = self.AllGuideNotes[entryId]
  return entryData and entryData.SubType
end

function M:GetSubTypeTabId(subTypeId)
  local WikiSubType = DataMgr.WikiSubType
  for _, data in pairs(WikiSubType) do
    if data.SubType == subTypeId then
      return data.MainType + 1
    end
  end
  return nil
end

function M:GetWikiRewardList()
  local rewardItems = {}
  for Id, rewardData in pairs(DataMgr.WikiReward) do
    table.insert(rewardItems, rewardData)
  end
  table.sort(rewardItems, function(a, b)
    return a.RewardProgress < b.RewardProgress
  end)
  return rewardItems
end

return M
