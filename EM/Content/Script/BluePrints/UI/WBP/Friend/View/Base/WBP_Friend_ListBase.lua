require("UnLua")
local UIUtils = require("Utils.UIUtils")
local M = Class("BluePrints.Common.TimerMgr")

function M:OnTeamMainFocusChanged(bFocused)
  for _, Entry in pairs(self.MyListView:GetDisplayedEntryWidgets()) do
    Entry:OnTeamMainFocusChanged(bFocused)
  end
  if bFocused then
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  elseif 0 == #self.ListDatas then
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
  end
end

function M:GetListData()
  self.ListDatas = nil
  assert(false, "WBP_Friend_ListBase:GetListData is not yet implemented")
end

function M:SetupListContent(Uid, Content)
  assert(false, "WBP_Friend_ListBase:NewListItem is not yet implemented")
end

function M:RefreshList(bAnimation)
  if nil == bAnimation then
    bAnimation = true
  end
  if not IsValid(self.MyListView) then
    assert(false, "WBP_Friend_ListBase:MyListView is invalid")
  end
  self.MyListView:SetScrollbarVisibility(UIConst.VisibilityOp.Visible)
  if not bAnimation then
    self.MyListView:SetRenderOpacity(1)
  end
  self:OnRefreshListBegin()
  self:GetListData()
  self.MyListView:ClearListItems()
  self.Uid2Index = {}
  if 0 == #self.ListDatas then
    self:OnListEmpty()
    self:OnRefreshListEnd()
    return
  end
  for Index, Uid in pairs(self.ListDatas) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    self:SetupListContent(Uid, Content)
    self.Uid2Index[Uid] = Index
    self.MyListView:AddItem(Content)
  end
  self.MyListView:SetRenderOpacity(0)
  self:RemoveTimer(self.NextFrameForListPadding)
  local _, Key = self:AddTimer(0.2, function()
    self:OnRefreshListLater(bAnimation)
    self:OnRefreshListEnd()
    self.MyListView:SetRenderOpacity(1)
    if bAnimation then
      self.MyListView:ScrollToTop()
      self.MyListView:RequestPlayEntriesAnim()
    end
  end, false, 0, nil, true)
  self.NextFrameForListPadding = Key
end

function M:OnRefreshListLater(bAnimation)
  local ItemUIs = self.MyListView:GetDisplayedEntryWidgets()
  if 0 == ItemUIs:Length() then
    return
  end
  local RestCount = UIUtils.GetListViewContentMaxCount(self.MyListView, ItemUIs, false, true) - ItemUIs:Length()
  if RestCount <= 0 then
    self.MyListView:SetScrollbarVisibility(UIConst.VisibilityOp.Visible)
  else
    self.MyListView:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
    self.MyListView:SetControlScrollbarInside(false)
  end
end

function M:OnRefreshListBegin()
end

function M:OnRefreshListEnd()
end

function M:OnListEmpty()
end

function M:OnAnimationFinished(InAnim)
  if InAnim == self.Auto_In then
    self:OnLoaded()
  end
end

function M:RefreshListItem(Data, bForceAll)
  if nil == bForceAll then
    bForceAll = true
  end
  if not self.Uid2Index then
    DebugPrint(ErrorTag, "WBP_Friend_ListBase:Uid2Index is nil")
    return
  end
  local Index = self.Uid2Index[Data.Uid]
  if not Index then
    DebugPrint(ErrorTag, "WBP_Friend_ListBase:Uid2Index is not Contains Uid")
    return
  end
  local Item = self.MyListView:GetItemAt(Index - 1)
  Item.Data = Data
  if IsValid(Item.UI) then
    Item.UI:OnListItemObjectSet(Item)
  end
  if bForceAll then
    self:OnRefreshListLater(false)
  end
end

function M:ClearListItems()
  self:RemoveTimer(self.NextFrameForListPadding)
  if self.MyListView then
    self.MyListView:ClearListItems()
  end
end

function M:BP_GetDesiredFocusTarget()
  if self.IsMyListEmpty or self.IsMyListEmpty == nil then
    return self
  else
    self.MyListView:SetFocus()
    return self.MyListView
  end
end

function M:RefreshNavigationRule()
  if not FriendController:IsGamepad() then
    return
  end
  local displayedWidgets = self.MyListView:GetDisplayedEntryWidgets()
  if not self.GameInputModeSubsystem then
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  end
  self.MyListView:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.MyListView:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local FriendMain = UIManager:GetUIObj("FriendMain")
  if self.ListDatas == nil or 0 == #self.ListDatas then
    if self:HasAnyFocus() then
      self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
      self:SetFocus()
    end
    self.NavigateWidgetOpacity = 0
    self.IsMyListEmpty = true
    if FriendMain then
      FriendMain:ShowPlayerInfoBtn(false)
    end
    return
  else
    if self:HasAnyFocus() then
      self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
      self.MyListView:SetFocus()
    end
    self.NavigateWidgetOpacity = 1
    self.IsMyListEmpty = false
    if FriendMain then
      FriendMain:ShowPlayerInfoBtn(true)
    end
  end
end

return M
