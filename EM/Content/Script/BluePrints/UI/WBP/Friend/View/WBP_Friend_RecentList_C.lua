require("UnLua")
local FriendController = require("BluePrints.UI.WBP.Friend.FriendController")
local FriendModel = FriendController:GetModel()
local FriendCommon = require("BluePrints.UI.WBP.Friend.FriendCommon")
local M = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.UI.WBP.Friend.View.Base.WBP_Friend_ListBase"
})

function M:Construct()
  M.Super.Construct(self)
  self.MyListView = self.List_Recent
  self.Text_Empty_Recent:SetText(GText("UI_Friend_RecentEmpty"))
  FriendController:RegisterEvent(self, function(self, Reason, ...)
    if Reason == FriendCommon.EventId.RefreshMatchFriendUI then
      self:RefreshList(true)
    end
  end)
  self:AddInputMethodChangedListen()
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self:RefreshNavigationRule()
end

function M:GetListData()
  self.ListDatas = {}
  local RecentMatchhList = FriendModel:GetRecentMatchDict()
  for K, V in pairs(RecentMatchhList) do
    table.insert(self.ListDatas, K)
  end
end

function M:SetupListContent(Uid, Content)
  local Dict = FriendModel:GetRecentMatchDict()
  local PersonnelData = Dict[Uid]
  Content.Data = PersonnelData.Info
  Content.Type = FriendCommon.FriendTabType.RecentMatch
end

function M:InitWidget(Parent)
  self.Parent = Parent
  FriendController:SendRefreshMatchFriend()
end

function M:OnRefreshListBegin()
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
end

function M:OnListEmpty()
  self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
end

function M:Destruct()
  self:ClearListItems()
  FriendController:UnRegisterEvent(self)
  self:RemoveInputMethodChangedListen()
  M.Super.Destruct(self)
end

function M:OnRefreshListEnd()
  self:RefreshNavigationRule()
  self.MyListView:SetFocus()
end

return M
