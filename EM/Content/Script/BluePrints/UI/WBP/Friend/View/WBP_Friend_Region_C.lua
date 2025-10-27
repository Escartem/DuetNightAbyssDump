require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.UI.WBP.Friend.View.Base.WBP_Friend_ListBase"
})
local FriendController = require("BluePrints.UI.WBP.Friend.FriendController")
local FriendModel = FriendController:GetModel()
local FriendCommon = require("BluePrints.UI.WBP.Friend.FriendCommon")

function M:OnTeamMainFocusChanged(bFocused)
  for _, Entry in pairs(self.MyListView:GetDisplayedEntryWidgets()) do
    Entry:OnTeamMainFocusChanged(bFocused)
  end
  local Visibility = bFocused and "Collapsed" or "SelfHitTestInvisible"
  local KeyWidgets = {
    self.Com_Input.Group_ControllerChoose,
    self.Com_Input.Group_ControllerControl,
    self.Button_Refresh.Key_GamePad,
    self.Button_Search.Key_GamePad
  }
  for _, KeyWidget in ipairs(KeyWidgets) do
    KeyWidget:SetVisibility(UIConst.VisibilityOp[Visibility])
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self:RefreshNavigationRule()
end

function M:Construct()
  M.Super.Construct(self)
  self.MyListView = self.List_AddFriend
  self.Panel_Search:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Refresh:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Title:SetVisibility(UIConst.VisibilityOp.Collapsed)
  FriendController:RegisterEvent(self, function(self, Reason, ...)
    if Reason == FriendCommon.EventId.AddFriend then
      local Uid = (...)
      local Dict = FriendModel:GetRegionDict()
      local Data = Dict[Uid]
      if not Data then
        assert(false, "FriendCommon.Reason.AddFriend::Data nil is impossible")
      end
      self:RefreshListItem(Data, false)
    end
  end)
  self:AddInputMethodChangedListen()
end

function M:Destruct()
  FriendController:UnRegisterEvent(self)
  self:RemoveInputMethodChangedListen()
  M.Super.Destruct(self)
end

function M:InitWidget(Parent)
  self.Parent = Parent
  self:RefreshList()
  self:SetKeyboardFocus()
  self.Text_Empty:SetText(GText("No_Blueprints") .. GText("UI_Friend_Region"))
end

function M:GetListData()
  local Dict = FriendModel:GetRegionFriendDict()
  self.ListDatas = {}
  for K, V in pairs(Dict) do
    table.insert(self.ListDatas, K)
  end
  self.WS_Type:SetActiveWidgetIndex(0 == #self.ListDatas and 1 or 0)
end

function M:SetupListContent(Uid, Content)
  local Dict = FriendModel:GetRegionFriendDict()
  Content.Data = Dict[Uid]
  Content.Type = FriendCommon.FriendTabType.RegionFriend
end

function M:OnRefreshListEnd()
  self:RefreshNavigationRule()
  self.MyListView:SetFocus()
end

function M:Destruct()
  self:ClearListItems()
  M.Super.Destruct(self)
end

return M
