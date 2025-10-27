require("UnLua")
local UIUtils = require("Utils.UIUtils")
local WalnutBagController = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController")
local WalnutBagModel = WalnutBagController:GetModel()
local WalnutBagCommon = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagCommon")
local M = Class("BluePrints.Common.TimerMgr")

function M:GetListData()
  local Dict = WalnutBagModel:GetAllWalnutDict(self.CurTabId - 1, self.SearchKeyWords, self.bShowNotHaveState)
  self.ListDatas = {}
  for index, value in ipairs(Dict) do
    table.insert(self.ListDatas, value)
  end
  table.sort(self.ListDatas, function(A, B)
    local IsAHave = A.Count > 0
    local IsBHave = B.Count > 0
    if IsAHave and not IsBHave then
      return true
    elseif IsBHave and not IsAHave then
      return false
    else
      if A.Rarity == B.Rarity then
        return A.Id < B.Id
      end
      return A.Rarity > B.Rarity
    end
  end)
end

function M:SetupListContent(ItemIndex, ItemInfo, Content)
  local ItemId = ItemInfo.Id
  local WalnutConfigData = DataMgr.Walnut[ItemId]
  local TabConfigData = DataMgr.WalnutType[WalnutConfigData.WalnutType]
  Content.Id = ItemId
  Content.Icon = WalnutConfigData.Icon
  Content.Count = ItemInfo.Count
  Content.Rarity = WalnutConfigData.Rarity
  Content.WalnutType = WalnutConfigData.WalnutType
  Content.ItemType = WalnutBagCommon.WalnutTypeName
  Content.Price = WalnutConfigData.ResourceValue or -1
  Content.CoinId = WalnutConfigData.ResourceToCoinType or -1
  Content.ConsumeRecord = WalnutBagModel:GetWalnutConsumeRecordById(ItemId)
  Content.bShowNotHaveStyle = true
  if WalnutBagModel:CheckIsNeedShowNewDot(ItemId) then
    Content.RedDotType = UIConst.RedDotType.NewRedDot
  end
  Content.UnHandleMouseDown = true
  Content.bDisableCommonClick = true
  Content.ParentWidget = self
  Content.Uuid = tostring(ItemId)
end

function M:RefreshList(bAnimation, FromSrc)
  if nil == bAnimation then
    bAnimation = true
  end
  if not IsValid(self.List_Item) then
    assert(false, "WalnutBagListBase:MyListView is invalid")
  end
  if bAnimation then
    self:_StopListFramingInAnim()
  else
    self.List_Item:SetRenderOpacity(1)
  end
  self:OnRefreshListBegin()
  self:GetListData()
  self.List_Item:ClearListItems()
  self.ItemId2Index = {}
  if 0 == #self.ListDatas then
    self:OnListEmpty(FromSrc)
    self:OnRefreshListEnd()
    return
  end
  self:OnListFillWith(FromSrc)
  self:AddTimer(0.01, function()
    self:OnRefreshListLater(bAnimation)
    self:OnRefreshListEnd()
    if bAnimation then
      self.List_Item:ScrollToTop()
    end
  end, false, 0, "OnRefreshListLater", true)
end

function M:OnRefreshListLater(bAnimation)
  local ItemUIs = self.List_Item:GetDisplayedEntryWidgets()
  local ListItemNum = self.List_Item:GetNumItems()
  if 0 == ItemUIs:Length() then
    return
  end
  local RestCount = 0
  local MaxCount = UIUtils.GetTileViewContentMaxCount(self.List_Item)
  if ListItemNum > MaxCount then
    local ColumnsPerRow = UIUtils.GetTileViewContentMaxCount(self.List_Item, "X") or 1
    if ColumnsPerRow <= 0 then
      ColumnsPerRow = 1
    end
    local Remainder = ListItemNum % ColumnsPerRow
    if 0 ~= Remainder then
      RestCount = ColumnsPerRow - Remainder
    else
      RestCount = 0
    end
  else
    RestCount = MaxCount - ItemUIs:Length()
  end
  for i = 1, RestCount do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Icon = nil
    Content.Parent = self
    self.List_Item:AddItem(Content)
  end
  if bAnimation then
    AudioManager(self):PlayUISound(self, "event:/ui/common/refresh_item_list", nil, nil)
    self._ListAnimTimerKeys = UIUtils.PlayListViewFramingInAnimation(self, self.List_Item, {
      Interval = 0.01,
      Callback = function()
      end
    })
  end
end

function M:OnRefreshListBegin()
end

function M:OnRefreshListEnd()
  if not self.InputBox:HasUserFocusedDescendants(self:GetOwningPlayer()) then
    self:SetFocus()
  end
  self:JumpToSelectItem()
end

function M:JumpToSelectItem()
  local AllItemCount = self.List_Item:GetNumItems()
  if AllItemCount > 0 and self.NeedSelectGridIndex >= 0 then
    local SelectItem = self.List_Item:GetItemAt(self.NeedSelectGridIndex)
    self.List_Item:ScrollIndexIntoView(self.NeedSelectGridIndex)
    self:OnListItemSelected(SelectItem)
  end
  self.NeedSelectItemId = nil
end

function M:OnListEmpty(FromSrc)
  if FromSrc == WalnutBagCommon.AllOptionName.SearchClick or FromSrc == WalnutBagCommon.AllOptionName.ShowNotHaveClick or self.SearchKeyWords ~= "" then
    self.HB_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Panel_Empty_Search:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Panel_ItemList:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.HB_Empty:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Panel_ItemList:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnListFillWith(FromSrc)
  self.HB_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_ItemList:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Panel_Empty_Search:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.NeedSelectGridIndex = -1
  for Index, ItemInfo in ipairs(self.ListDatas) do
    if "ShowHaveWalnutOnly" == FromSrc and ItemInfo.Count <= 0 then
    else
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      self:SetupListContent(Index, ItemInfo, Content)
      self.ItemId2Index[ItemInfo.Id] = Index
      if self.NeedSelectItemId ~= nil and self.NeedSelectItemId == ItemInfo.Id then
        self.NeedSelectGridIndex = Index - 1
      end
      self.List_Item:AddItem(Content)
    end
  end
end

function M:_StopListFramingInAnim()
  local Params = {UIState = self}
  if self._ListAnimTimerKeys then
    Params.TimerKeys = self._ListAnimTimerKeys
  end
  UIUtils.StopListViewFramingInAnimation(self.List_Item, Params)
end

function M:RefreshListItem(Data, bForceAll)
  if nil == bForceAll then
    bForceAll = true
  end
  if not self.ItemId2Index then
    DebugPrint(ErrorTag, "WalnutBagListBase:ItemId2Index is nil")
    return
  end
  local Index = self.ItemId2Index[Data.ItemId]
  if not Index then
    DebugPrint(ErrorTag, "WalnutBagListBase:ItemId2Index is not Contains Uid")
    return
  end
  local Item = self.List_Item:GetItemAt(Index - 1)
  Item.Data = Data
  if IsValid(Item.UI) then
    Item.UI:OnListItemObjectSet(Item)
  end
  if bForceAll then
    self:OnRefreshListLater(false)
  end
end

function M:RefreshWalnutSaleItemSelect(StuffData, Num)
  if self.BagSellState and self.DesireSaleWalnutObjList[StuffData.Id] ~= nil then
    local SellPageMainUI = UIManager(self):GetUI("WalnutSelectToList")
    if SellPageMainUI then
      SellPageMainUI:AddWalnutItemToList(StuffData, Num)
    end
  end
end

return M
