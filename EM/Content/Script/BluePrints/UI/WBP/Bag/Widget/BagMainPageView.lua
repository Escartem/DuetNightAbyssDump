require("UnLua")
local BagCommon = require("BluePrints.UI.WBP.Bag.BagCommon")
local M = {}

function M:PlayInAnim()
  if self.OwnerPlayer == nil or not UE4.UKismetSystemLibrary.IsValid(self.OwnerPlayer) then
    self.OwnerPlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  end
  self:RefreshOtherInfo()
  self:InitTabInfo()
  self:InitListenEvent()
  self:PlayAnimationForward(self.In)
end

function M:PlayOutAnim()
  AudioManager(self):SetEventSoundParam(self, BagCommon.MainUIName, {ToEnd = 1})
  if self.Panel_Detail.IsSkillTipsOpened then
    self.Common_Skill_Effect_Tips_PC:PlayOutAnim()
  end
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimationForward(self.Out)
  self:DoRecoverCamera()
end

function M:CheckIsCanCloseSelf()
  if self:IsAnimationPlaying(self.In) then
    return false
  end
  return true
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnUpdateBagItem, self, self.OnUpdateBagItemByAction)
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

function M:RefreshAllStuffCount()
  local AllItemCount = self.List_Item:GetNumItems()
  for i = 0, AllItemCount - 1 do
    local ItemObj = self.List_Item:GetItemAt(i)
    if ItemObj then
      local StuffServerData = self:GetStuffServerData(ItemObj.Uuid, "Resource")
      if ItemObj.SelfWidget then
        ItemObj.SelfWidget:SetCount(StuffServerData.Count)
      else
        ItemObj.Count = StuffServerData.Count
      end
    end
  end
end

function M:RefreshOtherInfo()
  self.Text_Empty:SetText(GText("UI_BAG_EMPTY"))
  self.Text_Empty_World:SetText(EnText("UI_BAG_EMPTY"))
  self.Text_Empty_Search:SetText(GText("Backpack_SiftEmpty"))
  self.Filter:BindEventOnSelectionsChanged(self, self.BindEventOnSelectionsChanged)
  self.Filter:BindEventOnSortTypeChanged(self, self.BindEventOnSortTypeChanged)
  self.Filter.Btn_SortType:SetNavigationRuleExplicit(EUINavigation.Right, self.Sift)
  self.Sift:BindEventOnSelectionsChanged(self, self.OnSiftSelectionsChanged)
  self.Sift.Img_Key_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Sift:BindEventOnAddedToFocusPath(self, self.OnSiftAddedToFocusPath)
  self.Sift:BindEventOnRemovedFromFocusPath(self, self.OnSiftRemovedFromFocusPath)
  self:AddLSFocusTarget(nil, {
    self.Filter,
    self.Sift
  })
  self.Button_Sell:SetGamePadImg("X")
  self.Button_Sell:BindEventOnClicked(self, self.EnterToSpecialState)
  self.Button_DetailClose.OnClicked:Add(self, self.OnClickBlank)
  self.Panel_Detail.Btn_Locked:BindEventOnClicked(self, self.ClickToUnlockStuff)
  self.Panel_Detail:InitCommonInfo()
  self.List_Item.BP_OnItemSelectionChanged:Add(self, self.OnSelectStuffItemChanged)
end

function M:EnterToSpecialState()
  if self.CurTabId == BagCommon.ItemTypeToTabId.MeleeWeapon or self.CurTabId == BagCommon.ItemTypeToTabId.RangedWeapon then
    self:EnterWeaponResolveState()
  else
    self:EnterStuffSellState()
  end
end

function M:RefreshDetailView(StuffConfigData)
  if self.BagCurState == BagCommon.AllBagState.NormalState then
    if self.CurTabId == BagCommon.ItemTypeToTabId.MeleeWeapon or self.CurTabId == BagCommon.ItemTypeToTabId.RangedWeapon or self.CurTabId == BagCommon.ItemTypeToTabId.Mod then
      self.Panel_Detail:UpdateBottomSingleBtnInfo("WeaponAndMod", self.OnClickGoToAmory, self)
    elseif self.CurTabId == BagCommon.ItemTypeToTabId.ReadItem then
      local function WrapReadFunc()
        UIManager(self):LoadUINew("ItemInformation", StuffConfigData.ResourceId, "Read", self, true)
      end
      
      self.Panel_Detail:UpdateBottomSingleBtnInfo("Read", WrapReadFunc, self)
    elseif self.CurTabId == BagCommon.ItemTypeToTabId.FishItem then
      local function WrapFishFunc()
        local Params = {
          FishResourceId = StuffConfigData.ResourceId
        }
        PageJumpUtils:JumpToAnglingMap(Params)
      end
      
      self.Panel_Detail:UpdateBottomSingleBtnInfo("Fish", WrapFishFunc, self, "AnglingMap")
    elseif self.CurTabId == BagCommon.ItemTypeToTabId.ConsumableItem then
      local function WrapConsumeFunc()
        self:OnClickGoToUseConsume(StuffConfigData)
      end
      
      self.Panel_Detail:UpdateBottomSingleBtnInfo("ConsumableItem", WrapConsumeFunc, self)
    else
      self.Panel_Detail:UpdateBottomSingleBtnInfo("Other", nil, self)
    end
  else
    self.Panel_Detail:UpdateBottomSingleBtnInfo("Other", nil, self)
  end
  self.Panel_Detail:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function M:RefreshItemViewByItemCount(AllItemCount, SiftItemCount)
  self:RefreshButtonInfoInDiffTab()
  if AllItemCount <= 0 then
    self.GameInputModeSubsystem:SetNavigateWidgetVisibility(false)
    self.Panel_Detail:SetVisibility(UE4.ESlateVisibility.Hidden)
    self.Panel_Content:SetRenderOpacity(0.0)
    self.Panel_Content:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  elseif SiftItemCount <= 0 then
    self.Panel_Content:SetRenderOpacity(1.0)
    self.Panel_Content:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Empty_Search:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Panel_Content:SetRenderOpacity(1.0)
    self.Panel_Content:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Empty_Search:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:RecoverAllItemsStyle()
  local AllItemCount = self.List_Item:GetNumItems()
  for i = 0, AllItemCount - 1 do
    local ItemObj = self.List_Item:GetItemAt(i)
    ItemObj.IsSelect = false
    if ItemObj and ItemObj.StuffType ~= "EmptyGrid" then
      ItemObj.StateTagInfo = {Name = "Normal"}
      if ItemObj.SelfWidget then
        ItemObj.SelfWidget:SetStuffStyleByStateTag(ItemObj)
        ItemObj.SelfWidget:SetSelected(false)
        ItemObj.AddNum = 0
      end
    end
  end
end

function M:AfterFillDataInfo()
  local AllItemCount = self.List_Item:GetNumItems()
  if AllItemCount > 0 and self.BagCurState ~= BagCommon.AllBagState.NormalState then
    if self.BagCurState == BagCommon.AllBagState.ChooseSaleState then
      for i = 0, AllItemCount - 1 do
        local ItemObj = self.List_Item:GetItemAt(i)
        if self.DesireSaleStuffObjList[ItemObj.Uuid] ~= nil then
          self.DesireSaleStuffObjList[ItemObj.Uuid] = ItemObj
        end
      end
    elseif self.BagCurState == BagCommon.AllBagState.WeaponResolveState then
      for i = 0, AllItemCount - 1 do
        local ItemObj = self.List_Item:GetItemAt(i)
        if nil ~= self.DesireResolveWeaponList[ItemObj.Uuid] then
          self.DesireResolveWeaponList[ItemObj.Uuid] = ItemObj
        end
      end
    end
    self:UpdateAllItemsStyle(false)
  end
  if self.CurTabId == BagCommon.ItemTypeToTabId.MeleeWeapon then
  elseif self.CurTabId == BagCommon.ItemTypeToTabId.RangedWeapon then
  elseif self.CurTabId == BagCommon.ItemTypeToTabId.Mod then
  elseif self.CurTabId == BagCommon.ItemTypeToTabId.Resource then
  elseif self.CurTabId == BagCommon.ItemTypeToTabId.TaskItem then
  else
    if self.CurTabId == BagCommon.ItemTypeToTabId.ReadItem then
    else
    end
  end
  self.NeedSelectStuffId = nil
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
      if self.BagCurState == BagCommon.AllBagState.ChooseSaleState then
        IsNeedGrey = 0 ~= ItemObj.LockType or -1 == ItemObj.Price or ItemObj.StuffType ~= BagCommon.StuffType.Mod and self:GetIsStuffIsEquiped(ItemObj)
        if not IsNeedGrey then
          NotChooseExtraData = {
            ItemObj.Count,
            ItemObj.Price,
            ItemObj.CoinId
          }
        end
      elseif self.BagCurState == BagCommon.AllBagState.WeaponResolveState then
        IsNeedGrey = 0 ~= ItemObj.LockType or -1 == ItemObj.Price or self:GetIsStuffIsEquiped(ItemObj)
        if not IsNeedGrey then
          NotChooseExtraData = {
            ItemObj.Count,
            ItemObj.Price,
            ItemObj.CoinId
          }
        end
      end
      local IsInChooseList = self.DesireSaleStuffObjList[ItemObj.Uuid] ~= nil or nil ~= self.DesireResolveWeaponList[ItemObj.Uuid]
      if IsInChooseList then
        local SellPageMainUI = UIManager(self):GetUI(BagCommon.BagStuffSelectUIName)
        
        local function RemoveStuffCallback()
          EventManager:FireEvent(EventID.OnRemoveBagItemInList, ItemObj.Uuid)
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

function M:OnRefreshSaleSelectNum(StuffUuid, CurNum)
  local TargetItem = self.DesireSaleStuffObjList[StuffUuid]
  if IsValid(TargetItem) then
    if TargetItem.StateTagInfo and TargetItem.StateTagInfo.ExtraData then
      TargetItem.StateTagInfo.ExtraData[1] = CurNum
    end
    if TargetItem.SelfWidget then
      TargetItem.SelfWidget:SetSelectNum(Utils.FormatNumber(CurNum, true))
    end
  end
end

function M:OnHorizontalListViewResizeDone(NewViewportSizeX, SizeX)
  local EmptySlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.HB_Empty)
  local Offsets = EmptySlot:GetOffsets()
  Offsets.Right = NewViewportSizeX - SizeX - Offsets.Left
  EmptySlot:SetOffsets(Offsets)
end

function M:RefreshListViewEmptyGrid(ListViewObj, CurItemCount, ListViewSize)
  if nil == ListViewSize then
    ListViewSize = UIManager(self):GetWidgetRenderSize(ListViewObj)
  end
  local ListSizeX, ItemSizeX = ListViewSize.X, ListViewObj:GetEntryWidth()
  local ListSizeY, ItemSizeY = ListViewSize.Y, ListViewObj:GetEntryHeight()
  local XCount, YCount = 0, 0
  local ScrollBarSize = ListViewObj.ScrollBarDesireSize
  XCount = math.floor((ListSizeX - ScrollBarSize) / ItemSizeX)
  local RawYCount = ListSizeY / ItemSizeY
  YCount = math.ceil(RawYCount - 0.05)
  DebugPrint("RefreshListViewEmptyGrid TileViewCount", RawYCount, YCount)
  ListViewObj:SetScrollbarVisibility(UIConst.VisibilityOp.Hidden)
  if YCount - RawYCount > 0.05 or ListViewObj:GetNumItems() > XCount * YCount then
    ListViewObj:SetControlScrollbarInside(true)
  end
  if CommonUtils.GetDeviceTypeByPlatformName() == CommonConst.CLIENT_DEVICE_TYPE.MOBILE and ListViewObj.bControlScrollbarInside then
    ListViewObj:SetControlScrollbarInside(false)
    ListViewObj:SetScrollbarVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  local EmptyItemNum = 0
  if CurItemCount - XCount * YCount <= 0 then
    EmptyItemNum = XCount * YCount - CurItemCount
    ListViewObj:SetEmptyGridItemCount(EmptyItemNum)
  end
  return EmptyItemNum, XCount, YCount
end

function M:GetEmptyItemCountInLastLine(ListViewObj, CurItemCount)
  local CurMaxItemCount = ListViewObj:GetScrollOffsetOfEnd()
  local EmptyItemNum = math.floor(CurMaxItemCount - CurItemCount)
  ListViewObj:SetEmptyGridItemCount(EmptyItemNum)
  return EmptyItemNum
end

return M
