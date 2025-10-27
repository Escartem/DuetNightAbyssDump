require("UnLua")
local M = {}
local DataModel = require("BluePrints.UI.WBP.PersonInfo.Data.PersonInfoDataModel")
local PersonInfoController = require("BluePrints.UI.WBP.PersonInfo.PersonInfoController")
M._components = {}

function M:InitBaseView()
  local DaVisibleTabs = {
    "UI_PersonalPage_Open",
    "UI_PersonalPage_Friend",
    "UI_PersonalPage_Self"
  }
  self.Com_SortDown:Init(DaVisibleTabs, "LS", self)
  self.Text_DetailTitleTotal:SetText(GText("UI_Bag_Sell_Total"))
  self.Text_PlayTimeDataTitle:SetText(GText("UI_PersonalPage_Recount_TotalTime"))
  self.Text_DetailTitleAchievement:SetText(GText("MAIN_UI_ACHIEVEMENT"))
  self.Title:SetText(GText("UI_Achievement_Title"))
  self:InitDetaildView()
  self:PlayAnimationForward(self.In)
  self.IsCloseing = false
  self:SetFocus()
end

function M:InitDetaildView()
  if not DataModel:GetIsSelf() then
    self.Com_SortDown:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    local VisibleType = DataModel:GetPersonalInfoVisible()
    self.Com_SortDown:SelectItem(VisibleType)
    self.Com_SortDown:BindEventOnSelectionsChanged(self, self.OnSortListSelectionsChanged)
  end
  self.Text_PlayerName:SetText(DataModel:GetPlayerName())
  self.Num_UID:SetText(DataModel:GetPlayerUid())
  self.Text_PlayerCreateTime:SetText(string.format(GText("UI_PersonalPage_Recount_Create"), DataModel:GetAccoutCreateTime()))
  self.Text_PlayTimeData:SetText(DataModel:GetPlayTime() .. "h")
  local CountItemData = DataModel:GetUniqueDatailedDatas()
  for i = 1, #CountItemData do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.Count = CountItemData[i].Count
    Obj.Name = CountItemData[i].Name
    self.List_PlayerData:AddItem(Obj)
  end
  self.Count_Total:SetText(DataModel:GetAchievementCount())
  local AchievementArray = DataModel:GetAchievementArray()
  self.Count_Gold:SetText(AchievementArray[1])
  self.Count_Silver:SetText(AchievementArray[2])
  self.Count_Bronze:SetText(AchievementArray[3])
  DataModel:SortDetailedTabInfo()
  local TabsDatas = DataModel:GetMoreDetailedTabs()
  for i, v in pairs(TabsDatas) do
    local SingleTabInfo = NewObject(UIUtils.GetCommonItemContentClass())
    for index, value in pairs(v) do
      SingleTabInfo[index] = value
    end
    self.List_Data:AddItem(SingleTabInfo)
  end
  if self.ScrollBox:GetScrollOffsetOfEnd() > 1 then
    ScreenPrint("ScrollBox:GetScrollOffsetOfEnd() >1")
  else
    ScreenPrint("ScrollBox:GetScrollOffsetOfEnd() <1")
  end
end

function M:InitMoreDetailedTabs()
  local TabInfos = DataModel:GetMoreDetailedTabs()
  for i = 1, #TabInfos do
    local TabInfo = TabInfos[i]
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.Text_DataTitle:SetText(TabInfo.Title)
  end
end

function M:Construct()
end

function M:BP_GetDesiredFocusTarget()
  return self
end

function M:OnSortListSelectionsChanged(Index)
  ScreenPrint("sortingchange" .. Index)
  DataModel:SetInfoVisibility(Index)
end

function M:IsCanReturn()
  if self.IsCloseing == true then
    return false
  end
  return true
end

function M:OnReturnKeyDown()
  if self:IsCanReturn() == false then
    return
  end
  PersonInfoController:OnCloseDateView()
  self:UnbindAllFromAnimationFinished(self.Out)
  self:BindToAnimationFinished(self.Out, function()
    PersonInfoController:ReallyCloseDateView(self)
  end)
  self:PlayAnimationForward(self.Out)
  self.IsCloseing = true
end

return M
