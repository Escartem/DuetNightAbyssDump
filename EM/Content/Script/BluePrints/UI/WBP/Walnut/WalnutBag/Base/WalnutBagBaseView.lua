require("UnLua")
local WalnutBagController = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController")
local WalnutBagModel = WalnutBagController:GetModel()
local WalnutBagCommon = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagCommon")
local M = {}

function M:PlayInAnim()
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "WalnutBagMain", nil)
  self:InitTabInfo()
  self:InitListenEvent()
  self:PlayAnimationForward(self.In)
end

function M:PlayOutAnim()
  AudioManager(self):SetEventSoundParam(self, "WalnutBagMain", {ToEnd = 1})
  self:SwitchToNpcCamera()
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimationForward(self.Out)
end

function M:RefreshBaseInfo()
  self.Text_Empty:SetText(GText("UI_BAG_EMPTY"))
  self.Text_Empty_World:SetText(EnText("UI_BAG_EMPTY"))
  self.Text_Empty_Search:SetText(GText("UI_Walnut_Not_Find"))
  self.Text_Empty_World_1:SetText(EnText("UI_Walnut_Not_Find"))
  self.Btn_Sell.Text_Button:SetText(GText("UI_BAG_Sell"))
  self.InputBox:Init({
    Owner = self,
    HintText = GText(GText("UI_Search")),
    FocusKeyName = "LS",
    PasteKeyName = "RS",
    TextLimit = WalnutBagCommon.WalnutSearchMaxLen,
    bLimitSpaces = true,
    Events = {
      OnTextChanged = function(self, Text)
        self.SearchKeyWords = Text
        self:BtnSearchOnClicked()
      end,
      OnTextCommitted = function(self, Text, CommitType)
        self.SearchKeyWords = Text
        if CommitType == ETextCommit.OnEnter then
          self:BtnSearchOnClicked()
        end
      end
    }
  })
  self.List_Item.BP_OnItemClicked:Add(self, self.OnListItemSelected)
  self.List_Item.BP_OnItemSelectionChanged:Add(self, self.OnSelectStuffItemChanged)
  self.Button_DetailClose.OnClicked:Add(self, self.OnClickBlank)
  self.Text_None:SetText(GText("UI_SHOP_NOTOWNED"))
  self.CheckBox_Own:SetIsChecked(false)
  self.CheckBox_Own:BindEventOnClicked({
    Inst = self,
    Func = self.ClickToShowNotHaveWalnutItem
  })
  self.Btn_Sell:BindEventOnClicked(self, self.OnSellButtonClicked)
  self:AddLSFocusTarget(self.CheckBox_Own.Com_KeyImg, self.CheckBox_Own, nil, true)
  self.Walnut_Detail:SetOwner(self)
  self.Btn_Goto:Init(GText("MAIN_UI_WALNUTBAG"), self, WalnutBagModel:GetDungeonNextRefreshTime(), self.GoToStyleOfPlay)
end

function M:InitJumpParams(TabId, ItemId)
  self.NeedSelectTabId = TabId
  self.NeedSelectItemId = ItemId
  self.Tab_WalnutBag:SelectTabById(self.NeedSelectTabId or WalnutBagCommon.DefaultSelectTabId)
end

function M:GoToStyleOfPlay()
  if self.CurSelectContent == nil then
    PageJumpUtils:JumpToStyleOfPlaySubUI("NewDeputeRoot", "Walnut")
  else
    PageJumpUtils:JumpToWalnutDungeonPage(self.CurSelectContent.WalnutType, self.CurSelectContent.Id)
  end
end

function M:SwitchToNpcCamera(bNpcCamera)
  if bNpcCamera then
    UIManager(self):SwitchUINpcCamera(bNpcCamera, "WalnutBagMain", self.NpcId, {IsHaveInOutAnim = true})
  else
    UIManager(self):SwitchUINpcCamera(bNpcCamera, "WalnutBagMain", self.NpcId, {bDestroyNpc = true, IsHaveInOutAnim = false})
  end
end

function M:CheckIsCanCloseSelf()
  if self:IsAnimationPlaying(self.In) then
    return false
  end
  return true
end

function M:OnClickBlank()
  if not self.Walnut_Detail:IsVisible() then
    return
  end
  if IsValid(self.CurSelectContent) then
    if self.CurSelectContent.SelfWidget then
      self.CurSelectContent.SelfWidget:SetSelected(false)
    else
      self.CurSelectContent.IsSelect = false
    end
  end
  self:CancelStuffClickAndHideDetail()
end

function M:CancelStuffClickAndHideDetail()
  if self.CurSelectContent then
    self.CurSelectContent.IsSelect = false
    if self.CurSelectContent.SelfWidget then
      self.CurSelectContent.SelfWidget:SetSelected(false)
    end
  end
  self.CurSelectContent = nil
  self:RefreshDetailPanelView(true)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self:UpdateUIStyleInPlatform(CurInputType == ECommonInputType.Gamepad, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self:UpdateFocusInGamepad()
  end
end

function M:BtnSearchOnClicked()
  self:CancelStuffClickAndHideDetail()
  self:RefreshList(true, WalnutBagCommon.AllOptionName.SearchClick)
end

function M:ClickToShowNotHaveWalnutItem(bIsShowNotHave)
  self:CancelStuffClickAndHideDetail()
  self.bShowNotHaveState = bIsShowNotHave
  self:RefreshList(true, WalnutBagCommon.AllOptionName.ShowNotHaveClick)
end

function M:OnSellButtonClicked()
  self:EnterWalnutSellState()
end

function M:OnListItemSelected(Content, NotAddToSellList)
  NotAddToSellList = NotAddToSellList or false
  if not (Content and Content.Id) or self.CurSelectContent == Content then
    if self.CurSelectContent == Content and self.BagSellState and not NotAddToSellList then
      self:AddItemToSaleList(Content.Id, 1)
    end
    return
  end
  if self.BagSellState then
    if self.DesireSaleWalnutObjList[Content.Id] then
      self:RefreshBottomKeyInfo("WalnutSell")
    else
      self:RefreshBottomKeyInfo("SelectWalnutSell")
    end
  else
    self:RefreshBottomKeyInfo()
  end
  AudioManager(self):PlayItemSound(self, Content.Id, "Click", WalnutBagCommon.WalnutTypeName)
  if self.CurSelectContent then
    self.CurSelectContent.IsSelect = false
    if self.CurSelectContent.SelfWidget then
      self.CurSelectContent.SelfWidget:SetSelected(false)
    end
  end
  self.CurSelectContent = Content
  Content.IsSelect = true
  if Content.SelfWidget then
    Content.SelfWidget:SetSelected(true)
  end
  self:RefreshDetailPanelView()
  self:UpdateReddotView(Content)
  if Content.Count > 0 and not NotAddToSellList then
    local WalnutId, AddNum = Content.Id, 1
    self:AddItemToSaleList(WalnutId, AddNum)
  end
end

function M:AddItemToSaleList(WalnutId, AddNum)
  if self.BagSellState then
    local SellPageMainUI = UIManager(self):GetUI("WalnutSelectToList")
    if self.DesireSaleWalnutObjList[WalnutId] ~= nil then
      local Num
      if SellPageMainUI and self.DesireSaleWalnutObjList[WalnutId].Num + AddNum <= self.DesireSaleWalnutObjList[WalnutId].StuffCount then
        self.DesireSaleWalnutObjList[WalnutId].Num = self.DesireSaleWalnutObjList[WalnutId].Num + AddNum
        Num = self.DesireSaleWalnutObjList[WalnutId].Num
        SellPageMainUI.CurSelectStuffContentInList = self.List_Item:GetItemAt(self.ItemId2Index[WalnutId] - 1)
      end
    else
      local StuffServerData = self:GetWalnutServerData(WalnutId)
      if StuffServerData then
        local StuffData = WalnutBagModel:GetWalnutStuffData(StuffServerData, self, self.OnListItemSelected)
        if not StuffData then
          return
        end
        StuffData.SelfWidget = self.List_Item:GetItemAt(self.ItemId2Index[WalnutId] - 1).SelfWidget
        StuffData.AddNum = AddNum
        StuffData.Id = WalnutId
        StuffData.IsSelect = true
        self.DesireSaleWalnutObjList[WalnutId] = StuffData
        self.DesireSaleWalnutObjList[WalnutId].Num = AddNum
        
        local function RemoveStuffCallback()
          EventManager:FireEvent(EventID.OnRemoveWalnutItemInList, tostring(WalnutId))
        end
        
        local StuffStateTagInfo = {
          Name = "IsToChoose",
          ExtraData = {
            1,
            StuffData.StuffCount,
            StuffData.Price,
            StuffData.CoinId,
            RemoveStuffCallback
          }
        }
        self.CurSelectContent.StateTagInfo = StuffStateTagInfo
        if self.CurSelectContent.SelfWidget then
          self.CurSelectContent.SelfWidget:SetStuffStyleByStateTag(self.CurSelectContent)
        end
        self:RefreshBottomKeyInfo("WalnutSell")
      end
    end
    self:RefreshWalnutSaleItemSelect(self.DesireSaleWalnutObjList[WalnutId], Num or AddNum)
    self:RefreshDetail(self.DesireSaleWalnutObjList[WalnutId].Num, WalnutId)
    self:RefreshItemInfo(self.DesireSaleWalnutObjList[WalnutId].Num, WalnutId)
    SellPageMainUI:OnUpdateCurSelectItemSaleInfo(self.DesireSaleWalnutObjList[WalnutId].Num, true)
  end
end

function M:RemoveItemSaleState(StuffId)
  local IStuffId = math.tointeger(StuffId)
  local StuffContent = self.DesireSaleWalnutObjList[IStuffId]
  local StuffStateTagInfo = {
    Name = "Normal",
    ExtraData = {
      StuffContent.StuffCount,
      StuffContent.Price,
      StuffContent.CoinId
    }
  }
  StuffContent.StateTagInfo = StuffStateTagInfo
  StuffContent.IsSelect = false
  if StuffContent.SelfWidget and StuffContent.Uuid == StuffId then
    StuffContent.SelfWidget:SetSelected(false)
    StuffContent.SelfWidget:SetStuffStyleByStateTag(StuffContent)
  end
  local IsNeedCancelSelect = false
  local StuffConfigData = DataMgr.Resource[StuffContent.UnitId]
  IsNeedCancelSelect = self.CurSelectStuffContent ~= nil and StuffContent.Uuid == self.CurSelectStuffContent.Uuid
  self.DesireSaleWalnutObjList[IStuffId] = nil
  if IsNeedCancelSelect then
    self.List_Item:BP_ClearSelection()
  end
end

function M:RefreshItemInfo(Num, WalnutId)
  local Item = self.List_Item:GetItemAt(self.ItemId2Index[WalnutId] - 1)
  if not Item or not Item.SelfWidget then
    return
  end
  Item.SelfWidget:SetSelectNum(Num, Item.Count)
  self.DesireSaleWalnutObjList[WalnutId].Num = Num
end

function M:RefreshDetail(WalnutId, Index)
end

function M:UpdateSelectInfo(Content)
end

function M:OnSelectStuffItemChanged(SelectItem, bIsSelect)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self:OnListItemSelected(SelectItem, true)
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad and self.BagSellState then
    self.HoverItem = SelectItem
  end
end

function M:UpdateReddotView(Content)
  if Content.RedDotType then
    Content.RedDotType = nil
    if Content.SelfWidget then
      Content.SelfWidget:SetRedDot()
    end
    local RedInfo = self.AllReddotItemsId[Content.WalnutType]
    if RedInfo then
      local FindIndex
      for index, value in ipairs(RedInfo) do
        if value == Content.Id then
          FindIndex = index
          break
        end
      end
      if nil ~= FindIndex then
        table.remove(RedInfo, FindIndex)
      end
      if 0 == #RedInfo then
        self.AllReddotItemsId[Content.WalnutType] = nil
        local TabId = WalnutBagCommon.WalnutItemTypeToTabId[WalnutBagCommon.WalnutItemType[Content.WalnutType]]
        self.Tab_WalnutBag:ShowTabRedDotByTabId(TabId, false)
      end
      if IsEmptyTable(self.AllReddotItemsId) then
        self.Tab_WalnutBag:ShowTabRedDotByTabId(1, false)
      end
      WalnutBagModel:RemoveReddotCount(Content.Id)
    end
  end
end

function M:RefreshAllGridIndex()
  local AllItemCount = self.List_Item:GetNumItems()
  for i = 0, AllItemCount - 1 do
    local ItemObj = self.List_Item:GetItemAt(i)
    if ItemObj then
      ItemObj.GridIndex = i + 1
    end
  end
end

function M:RefreshDetailPanelView(bIsHide)
  if bIsHide then
    self.Walnut_Detail:SetIsNeedPlayResolveAnim(true)
    self.Walnut_Detail:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  self.Walnut_Detail:RefreshItemDetails(self.CurSelectContent)
  self.Walnut_Detail:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function M:OnHorizontalListViewResizeDone(NewViewportSizeX, SizeX)
  local EmptySlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.HB_Empty)
  local Offsets = EmptySlot:GetOffsets()
  Offsets.Right = NewViewportSizeX - SizeX - Offsets.Left
  EmptySlot:SetOffsets(Offsets)
end

function M:SetFocus_Lua()
  self:RefreshBottomKeyInfo()
  local CommonDialog = UIManager(self):GetUIObj("CommonDialog")
  if nil ~= CommonDialog then
    return
  end
  local AllItemCount = self.List_Item:GetNumItems()
  if AllItemCount > 0 or self.BagSellState then
    self.List_Item:SetFocus()
  else
    self:SetFocus()
  end
end

function M:CheckIsCanAddToSaleList(CurStuffContent, bIsShowToast)
  local PlayerAvatar = GWorld:GetAvatar()
  if nil == PlayerAvatar then
    return false
  end
  if nil == CurStuffContent then
    CurStuffContent = self.CurSelectStuffContent
  end
  local ShowTextId
  if nil ~= CurStuffContent then
    if -1 == CurStuffContent.Price then
      ShowTextId = 7014
    elseif 0 ~= CurStuffContent.LockType then
      ShowTextId = 7010
    end
  end
  if ShowTextId and bIsShowToast then
    UIManager(self):ShowError(ShowTextId, nil, UIConst.Tip_CommonToast)
  end
  return nil == ShowTextId
end

function M:ReGenerateBagList()
  self:CancelStuffClickAndHideDetail()
  self.List_Item:BP_ClearSelection()
  self.List_Item:ClearListItems()
  self:RefreshList(true, WalnutBagCommon.AllOptionName.TabClick)
end

function M:UpdateAllItemsStyle(IsNeedDalay)
  if IsNeedDalay then
    if self:IsExistTimer("DelayToSetItemStyle") then
      self:RemoveTimer("DelayToSetItemStyle")
    end
    self:AddTimer(0.1, self.DelayToSetItemStyle, false, 0, "DelayToSetItemStyle")
  else
    self:DelayToSetItemStyle()
  end
end

function M:DelayToSetItemStyle()
  local AllItemCount = self.List_Item:GetNumItems()
  for i = 0, AllItemCount - 1 do
    local ItemObj = self.List_Item:GetItemAt(i)
    if ItemObj and ItemObj.StuffType ~= "EmptyGrid" then
      local IsNeedGrey, NotChooseExtraData = false
      if self.BagSellState then
        IsNeedGrey = -1 == ItemObj.Price
        if not IsNeedGrey then
          NotChooseExtraData = {
            ItemObj.Count,
            ItemObj.Price,
            ItemObj.CoinId
          }
        end
      end
      local IsInChooseList = self.DesireSaleStuffObjList[ItemObj.Uuid] ~= nil
      if IsInChooseList then
        local SellPageMainUI = UIManager(self):GetUI(WalnutBagCommon.WalnutSelectUINames)
        
        local function RemoveStuffCallback()
        end
        
        ItemObj.StateTagInfo = {
          Name = "IsToChoose",
          ExtraData = {
            SellPageMainUI.NeedDealWithStuffCount[ItemObj.Uuid] or 1,
            ItemObj.Count,
            ItemObj.Price,
            ItemObj.CoinId,
            RemoveStuffCallback
          },
          IsShowGrey = IsNeedGrey
        }
      else
        ItemObj.StateTagInfo = {
          Name = "Normal",
          ExtraData = NotChooseExtraData,
          IsShowGrey = IsNeedGrey
        }
      end
      if ItemObj.SelfWidget then
        ItemObj.SelfWidget:SetStuffStyleByStateTag(ItemObj)
      end
    end
  end
end

return M
