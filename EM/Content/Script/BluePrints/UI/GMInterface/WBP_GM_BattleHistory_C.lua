require("UnLua")
local GMFunctionLibrary = require("BluePrints.UI.GMInterface.GMFunctionLibrary")
local EMCache = require("EMCache.EMCache")
local GM_BattleHistory_C = Class("BluePrints.UI.GMInterface.WBP_GM_Menu_Base_C")

function GM_BattleHistory_C:OnLoaded()
  DebugPrint("Tianyi@ battle history menu onloaded")
  self.Tags = Const.BattleHistoryTags
  self.BannedRecordTags = {}
  self.BannedPrintTags = self.BannedPrintTags and self.BannedPrintTags or {}
  self:InitRecordFilter()
  self:InitPrintFilter()
  self.BtnPrintHistory_Normal.OnClicked:Clear()
  self.BtnPrintHistory_Normal.OnClicked:Add(self, self.PrintBattleHistory_Normal)
  self.BtnPrintHistory_Verbose.OnClicked:Clear()
  self.BtnPrintHistory_Verbose.OnClicked:Add(self, self.PrintBattleHistory_Verbose)
  self.BtnSelectAll_PrintTags.OnClicked:Clear()
  self.BtnSelectAll_PrintTags.OnClicked:Add(self, self.SelectAllPrintTags)
  self.BtnUnSelectAll_PrintTags.OnClicked:Clear()
  self.BtnUnSelectAll_PrintTags.OnClicked:Add(self, self.UnSelectAllPrintTags)
  self.BtnSelectAll_RecordTags.OnClicked:Clear()
  self.BtnSelectAll_RecordTags.OnClicked:Add(self, self.SelectAllRecordTags)
  self.BtnUnSelectAll_RecordTags.OnClicked:Clear()
  self.BtnUnSelectAll_RecordTags.OnClicked:Add(self, self.UnSelectAllRecordTags)
  self.BtnClearHistory.OnClicked:Clear()
  self.BtnClearHistory.OnClicked:Add(self, self.ClearHistory)
end

function GM_BattleHistory_C:SelectAllPrintTags()
  for _, TagObj in pairs(self.TagPrintFilter:GetListItems()) do
    TagObj.IsChecked = true
  end
  local DisplayedWidgets = self.TagPrintFilter:GetDisplayedEntryWidgets()
  for _, Widget in pairs(DisplayedWidgets) do
    Widget:SetChecked(true)
  end
  self:UpdateData()
end

function GM_BattleHistory_C:UnSelectAllPrintTags()
  for _, TagObj in pairs(self.TagPrintFilter:GetListItems()) do
    TagObj.IsChecked = false
  end
  local DisplayedWidgets = self.TagPrintFilter:GetDisplayedEntryWidgets()
  for _, Widget in pairs(DisplayedWidgets) do
    Widget:SetChecked(false)
  end
  self:UpdateData()
end

function GM_BattleHistory_C:SelectAllRecordTags()
  for _, TagObj in pairs(self.TagRecordFilter:GetListItems()) do
    TagObj.IsChecked = true
  end
  local DisplayedWidgets = self.TagRecordFilter:GetDisplayedEntryWidgets()
  for _, Widget in pairs(DisplayedWidgets) do
    Widget:SetChecked(true)
  end
  self:UpdateData()
end

function GM_BattleHistory_C:UnSelectAllRecordTags()
  for _, TagObj in pairs(self.TagRecordFilter:GetListItems()) do
    TagObj.IsChecked = false
  end
  local DisplayedWidgets = self.TagRecordFilter:GetDisplayedEntryWidgets()
  for _, Widget in pairs(DisplayedWidgets) do
    Widget:SetChecked(false)
  end
  self:UpdateData()
end

function GM_BattleHistory_C:InitRecordFilter()
  self.TagRecordFilter:ClearListItems()
  self.BannedRecordTags = EMCache:Get("BannedRecordTags") or {}
  for _, Tag in ipairs(self.Tags) do
    local TagObj = NewObject(UIUtils.GetCommonItemContentClass())
    TagObj.Name = Tag
    TagObj.UI = self
    
    function TagObj.Callback(TagName, IsChecked)
      self:OnRecordItemClicked(TagName, IsChecked)
    end
    
    if self.BannedRecordTags == nil or not self.BannedRecordTags[Tag] then
      TagObj.IsChecked = true
    end
    self.TagRecordFilter:AddItem(TagObj)
  end
end

function GM_BattleHistory_C:InitPrintFilter()
  self.TagPrintFilter:ClearListItems()
  for _, Tag in ipairs(self.Tags) do
    local TagObj = NewObject(UIUtils.GetCommonItemContentClass())
    TagObj.Name = Tag
    TagObj.UI = self
    
    function TagObj.Callback(TagName, IsChecked)
      self:OnPrintItemClicked(TagName, IsChecked)
    end
    
    TagObj.IsChecked = true
    self.TagPrintFilter:AddItem(TagObj)
  end
end

function GM_BattleHistory_C:UpdateData()
  for _, TagObj in pairs(self.TagRecordFilter:GetListItems()) do
    if TagObj.IsChecked then
      self.BannedRecordTags[TagObj.Name] = nil
    else
      self.BannedRecordTags[TagObj.Name] = true
    end
  end
  for _, TagObj in pairs(self.TagPrintFilter:GetListItems()) do
    if TagObj.IsChecked then
      self.BannedPrintTags[TagObj.Name] = nil
    else
      self.BannedPrintTags[TagObj.Name] = true
    end
  end
  EMCache:Set("BannedRecordTags", self.BannedRecordTags)
  Battle(self):InitBannedRecordTags()
end

function GM_BattleHistory_C:OnRecordItemClicked(TagName, IsChecked)
  self:UpdateData()
end

function GM_BattleHistory_C:OnPrintItemClicked(TagName, IsChecked)
  self:UpdateData()
end

function GM_BattleHistory_C:PrintBattleHistory_Normal(Verbose)
  self:_PrintBattleHistory(UE4.EBattleRecordVerbosity.Normal)
end

function GM_BattleHistory_C:PrintBattleHistory_Verbose()
  self:_PrintBattleHistory(UE4.EBattleRecordVerbosity.Verbose)
end

function GM_BattleHistory_C:_PrintBattleHistory(Verbose)
  local Filter = UE4.FBattleHistoryFilter()
  local ShouldPrint = false
  Filter.Verbosity = Verbose
  if next(self.BannedPrintTags) then
    for _, Tag in ipairs(self.Tags) do
      if not self.BannedPrintTags[Tag] then
        Filter.TargetTags:Add(Tag)
        ShouldPrint = true
      end
    end
  else
    ShouldPrint = true
  end
  if not ShouldPrint then
    DebugPrint("Tianyi@ \230\178\161\230\156\137\229\139\190\233\128\137\228\187\187\228\189\149\230\160\135\231\173\190\239\188\140\228\184\141\232\191\155\232\161\140\230\136\152\230\150\151\232\174\176\229\189\149\230\137\147\229\141\176!")
    return
  end
  Battle(self):BP_PrintBattleHistory(Filter)
end

function GM_BattleHistory_C:ClearHistory()
  Battle(self):ClearBattleHistory()
end

return GM_BattleHistory_C
