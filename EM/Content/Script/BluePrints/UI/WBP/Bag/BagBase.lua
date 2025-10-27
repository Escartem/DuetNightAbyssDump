require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local StuffIconObject = require("BluePrints.UI.WBP.Bag.Widget.BagStuffIconObject")
local BagCommon = require("BluePrints.UI.WBP.Bag.BagCommon")
local M = Class()

function M:InitMultiSelectWidget()
  for key, value in pairs(BagCommon.RarityColorInfo) do
    local ConfigData = {
      ColorName = key,
      Rarity = value,
      ClickCallback = self.ToSelectBagItemWithRarity,
      OwnerWidget = self
    }
    self[key]:Init(ConfigData)
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == CommonConst.CLIENT_DEVICE_TYPE.PC then
    self.Key_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
  self.Text_MultiSelect:SetText(GText("UI_Bag_Sell_Batch"))
  self.CheckBox_Retain:BindEventOnClicked({
    Inst = self,
    Func = self.OnRetainOneCheckStateChanged
  })
  self.Text_Retain:SetText(GText("UI_Bag_RemainOne"))
  self.CheckBox_Ignore:BindEventOnClicked({
    Inst = self,
    Func = self.OnIgnoreEquipedCheckStateChanged
  })
  self.Text_Ignore:SetText(GText("UI_Bag_IgnoreEquipped"))
  self.CheckBox_Retain:HideKey(true)
  self.CheckBox_Ignore:HideKey(true)
end

function M:StartMultiSelectWidget()
  for key, value in pairs(BagCommon.RarityColorInfo) do
    self[key]:Start()
  end
end

function M:ResetMultiSelectWidget()
  for key, value in pairs(BagCommon.RarityColorInfo) do
    self[key]:Reset()
  end
end

function M:ToSelectBagItemWithRarity(IsChecked, Rarity)
  local AllItemCount, ResultList = self.List_Item:GetNumItems(), {}
  local SellPageMainUI = UIManager(self):GetUI(BagCommon.BagStuffSelectUIName)
  for i = 0, AllItemCount - 1 do
    local ItemObj = self.List_Item:GetItemAt(i)
    if ItemObj and ItemObj.Rarity == Rarity then
      if IsChecked then
        local RetData = self:TryToAddItemToTargetListWithRarity(ItemObj, SellPageMainUI)
        local IsReserveOne, IsCanAdd = self.CheckBox_Retain:IsChecked(), true
        if IsReserveOne and RetData and RetData.StuffCount <= 1 then
          IsCanAdd = false
        end
        if IsCanAdd then
          table.insert(ResultList, RetData)
        end
      else
        local bIsNeedRemove = self:TryToRemoveItemToTargetListWithRarity(ItemObj)
        if bIsNeedRemove then
          table.insert(ResultList, ItemObj.Uuid)
        end
      end
    end
  end
  if SellPageMainUI then
    if IsChecked then
      SellPageMainUI:MultiAddBagItemToList(ResultList)
    else
      SellPageMainUI:MultiRemoveBagItemInList(ResultList)
    end
  end
end

function M:FilterStuffDataBySift(StuffItems)
  if not self.SelectedSiftItems or next(self.SelectedSiftItems) == nil then
    return StuffItems
  end
  local FilteredItems = {}
  for _, StuffItem in ipairs(self.AllStuffData) do
    if self:IsStuffItemMatchedWithSift(StuffItem) then
      table.insert(FilteredItems, StuffItem)
    end
  end
  self.FilteredStuffData = FilteredItems
  return FilteredItems
end

function M:OnSiftAddedToFocusPath()
  self.Filter.Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnSiftRemovedFromFocusPath()
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self.Filter.Controller:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:IsStuffItemMatchedWithSift(StuffItem)
  local fieldMapping = {}
  local SiftModelId = self.SiftModelId
  local SubIds = DataMgr.SiftModel[SiftModelId].SubId
  for i, SiftId in ipairs(SubIds) do
    local SiftData = DataMgr.SiftDimens[SiftId]
    local field = SiftData.SelectionField[1]
    fieldMapping[i] = "WeaponRarity" == field and "Rarity" or field
  end
  
  local function getFieldValueByIndex(StuffItem, index)
    local fieldName = fieldMapping[index]
    if "WeaponTag" == fieldName then
      return StuffItem.SiftTag
    elseif "FilterTag" == fieldName then
      return StuffItem.FilterTag
    else
      local fieldValue = StuffItem[fieldName]
      if "Level" == fieldName and type(fieldValue) == "number" and fieldValue > 1 then
        fieldValue = 1
      end
      if "bAura" == fieldName then
        if StuffItem.bAura then
          fieldValue = 1
        else
          fieldValue = 0
        end
      end
      if type(fieldValue) == "number" then
        return tostring(fieldValue)
      else
        return fieldValue
      end
    end
  end
  
  for i, SiftItem in pairs(self.SelectedSiftItems) do
    local fieldValue = getFieldValueByIndex(StuffItem, i)
    if fieldValue then
      local matched = false
      local siftValues = {}
      for _, index in pairs(SiftItem) do
        local siftValue = self.SiftItemDatas[i].SelectionDatas[index]
        if siftValue then
          table.insert(siftValues, siftValue)
        end
      end
      if "FilterTag" == fieldMapping[i] then
        for _, tagValue in ipairs(fieldValue) do
          for _, siftValue in ipairs(siftValues) do
            if tagValue == siftValue then
              matched = true
              break
            end
          end
          if matched then
            break
          end
        end
      elseif "WeaponTag" == fieldMapping[i] then
        for tagValue, _ in pairs(fieldValue) do
          for _, siftValue in ipairs(siftValues) do
            if tagValue == siftValue then
              matched = true
              break
            end
          end
          if matched then
            break
          end
        end
      else
        for _, siftValue in ipairs(siftValues) do
          if fieldValue == siftValue then
            matched = true
            break
          end
        end
      end
      if not matched then
        return false
      end
    else
      return false
    end
  end
  return true
end

function M:SortAllItemsByType(StuffDataTable)
  local Filter1Idx, SortType = self.Filter:GetSortInfos()
  self:SortItemContents(StuffDataTable, BagCommon.SortFilters[self.CurTabId][Filter1Idx], SortType)
  return StuffDataTable
end

function M:SortItemContents(InOutArr, Key, SortType)
  local OrderBy, SortFunc
  if self.CurTabId == BagCommon.ItemTypeToTabId.MeleeWeapon or self.CurTabId == BagCommon.ItemTypeToTabId.RangedWeapon then
    OrderBy = {
      "Level",
      "SortPriority",
      "StuffId"
    }
    
    function SortFunc(a, b)
      if a.IsEquipped and not b.IsEquipped then
        return true
      end
      if not a.IsEquipped and b.IsEquipped then
        return false
      end
      return self:GetFinalSortResult(a, b, OrderBy, SortType, 1, 3)
    end
  elseif self.CurTabId == BagCommon.ItemTypeToTabId.Mod then
    OrderBy = {
      "ApplicationType",
      "Rarity",
      "Level",
      "Price",
      "StuffId"
    }
    if "UI_Select_Unique" == Key then
      OrderBy[1] = "Rarity"
      OrderBy[2] = "ApplicationType"
    elseif "UI_Select_Level" == Key then
      OrderBy[1] = "Level"
      OrderBy[2] = "ApplicationType"
      OrderBy[3] = "Rarity"
    elseif "UI_Select_Price" == Key then
      OrderBy[1] = "Price"
      OrderBy[2] = "ApplicationType"
      OrderBy[3] = "Rarity"
      OrderBy[4] = "Level"
    end
    
    function SortFunc(a, b)
      if a.IsEquipped and not b.IsEquipped then
        return true
      end
      if not a.IsEquipped and b.IsEquipped then
        return false
      end
      return self:GetFinalSortResult(a, b, OrderBy, SortType, 1, 5)
    end
  elseif self.CurTabId == BagCommon.ItemTypeToTabId.Resource then
    OrderBy = {
      "Rarity",
      "Price",
      "StuffId"
    }
    if "UI_Select_Price" == Key then
      OrderBy[1] = "Price"
      OrderBy[2] = "Rarity"
      OrderBy[3] = "StuffId"
    end
    
    function SortFunc(a, b)
      return self:GetFinalSortResult(a, b, OrderBy, SortType, 1, 3)
    end
  elseif self.CurTabId == BagCommon.ItemTypeToTabId.ConsumableItem then
    OrderBy = {
      "Rarity",
      "ConsumableType",
      "StuffId"
    }
    
    function SortFunc(a, b)
      a.ConsumableType = BagCommon.ConsumableItemTypeSortWeight[a.UseEffectType] or 1
      b.ConsumableType = BagCommon.ConsumableItemTypeSortWeight[b.UseEffectType] or 1
      return self:GetFinalSortResult(a, b, OrderBy, SortType, 1, 3)
    end
  else
    OrderBy = {"Rarity", "StuffId"}
    
    function SortFunc(a, b)
      return self:GetFinalSortResult(a, b, OrderBy, SortType, 1, 2)
    end
  end
  table.sort(InOutArr, SortFunc)
end

function M:GetFinalSortResult(CompareA, ComPareB, OrderBy, SortType, StartIndex, MaxDepth)
  if StartIndex == MaxDepth then
    if SortType == CommonConst.ASC then
      return CompareA[OrderBy[StartIndex]] < ComPareB[OrderBy[StartIndex]]
    else
      return CompareA[OrderBy[StartIndex]] > ComPareB[OrderBy[StartIndex]]
    end
  end
  if CompareA[OrderBy[StartIndex]] == ComPareB[OrderBy[StartIndex]] then
    return self:GetFinalSortResult(CompareA, ComPareB, OrderBy, SortType, StartIndex + 1, MaxDepth)
  elseif SortType == CommonConst.ASC then
    return CompareA[OrderBy[StartIndex]] < ComPareB[OrderBy[StartIndex]]
  else
    return CompareA[OrderBy[StartIndex]] > ComPareB[OrderBy[StartIndex]]
  end
end

function M:FillWithListViewData(TabId, NeedDelayJumpToItem)
  if self.LoadMode == "FrameBlocking" then
    if self:IsExistTimer("DelayToLoadItemByFrame") then
      self:RemoveTimer("DelayToLoadItemByFrame")
    end
    self:AddTimer(self.TimeToDelayLoad, function()
      self:RemoveCoroutineTask(self.FillPlayerDataByTypeInFrame)
      self.IsLoadCompleted = false
      self.List_Item:BP_ClearSelection()
      self.List_Item:ClearListItems()
      self:AddCoroutineTask(self.FillPlayerDataByTypeInFrame, self, TabId, NeedDelayJumpToItem)
    end, false, 0, "DelayToLoadItemByFrame")
    self:HorizontalListViewResize_SetUp(self.Panel_Content, self.List_Item, 0)
  else
    self.IsLoadCompleted = true
    self.List_Item:BP_ClearSelection()
    self.List_Item:ClearListItems()
    self:FillPlayerDataByType(TabId, NeedDelayJumpToItem)
  end
end

function M:FillPlayerDataByType(TabId, NeedDelayJump)
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    DebugPrint("Avatar is nil, Not Connect to Server")
    return
  end
  local PlayerStuffs
  self.NeedSelectGridIndex = -1
  if TabId == BagCommon.ItemTypeToTabId.MeleeWeapon or TabId == BagCommon.ItemTypeToTabId.RangedWeapon then
    PlayerStuffs = Avatar.Weapons
  elseif TabId == BagCommon.ItemTypeToTabId.Mod then
    PlayerStuffs = Avatar.Mods
  else
    PlayerStuffs = Avatar.Resources
  end
  if nil ~= PlayerStuffs then
    local ReasultStuffData = {}
    for Id, StuffServerData in pairs(PlayerStuffs) do
      local StuffData
      if TabId == BagCommon.ItemTypeToTabId.MeleeWeapon or TabId == BagCommon.ItemTypeToTabId.RangedWeapon then
        if TabId == BagCommon.ItemTypeToTabId.MeleeWeapon and StuffServerData:HasTag("Melee") or TabId == BagCommon.ItemTypeToTabId.RangedWeapon and StuffServerData:HasTag("Ranged") then
          StuffData = StuffIconObject:GetWeaponStuffData(StuffServerData, self)
        end
        if nil ~= StuffData then
          StuffData.IsEquipped = self:GetIsStuffIsEquiped(StuffData)
        end
      elseif TabId == BagCommon.ItemTypeToTabId.Mod then
        StuffData = StuffIconObject:GetModStuffData(StuffServerData, self)
        if nil ~= StuffData then
          StuffData.IsEquipped = self:GetIsStuffIsEquiped(StuffData)
        end
      else
        local StuffConfigData = StuffServerData:Data()
        if StuffConfigData and StuffConfigData.MaterialClassify == TabId then
          StuffData = StuffIconObject:GetItemStuffData(StuffServerData, self)
        end
      end
      if nil ~= StuffData then
        table.insert(ReasultStuffData, StuffData)
      end
    end
    self.AllStuffData = ReasultStuffData
    ReasultStuffData = self:FilterStuffDataBySift(self.AllStuffData)
    local FinalStuffData = {}
    if #ReasultStuffData > 1 then
      FinalStuffData = self:SortAllItemsByType(ReasultStuffData)
    else
      FinalStuffData = ReasultStuffData
    end
    local BagItemCount = #self.AllStuffData
    self:RefreshItemViewByItemCount(BagItemCount, #FinalStuffData)
    if #FinalStuffData > 0 then
      for i, OrderStuffData in ipairs(FinalStuffData) do
        if nil ~= self.NeedSelectStuffId then
          OrderStuffData.IsSelect = OrderStuffData.Uuid == self.NeedSelectStuffId
        else
          OrderStuffData.IsSelect = false
        end
        if OrderStuffData.IsSelect then
          self.NeedSelectGridIndex = math.max(i - 1, 0)
        end
        OrderStuffData.GridIndex = i
        local StuffObj = StuffIconObject:CreateBagItemContent(OrderStuffData)
        self.List_Item:AddItem(StuffObj)
        if nil ~= self.DesireSaleStuffObjList[StuffObj.Uuid] then
          self.DesireSaleStuffObjList[StuffObj.Uuid] = StuffObj
        end
        if nil ~= self.DesireResolveWeaponList[StuffObj.Uuid] then
          self.DesireResolveWeaponList[StuffObj.Uuid] = StuffObj
        end
      end
      self:AddTimer(0.01, function()
        local BagItemUIs = self.List_Item:GetDisplayedEntryWidgets()
        local BagItemCount = BagItemUIs:Length()
        local AllFillCount = UIUtils.GetTileViewContentMaxCount(self.List_Item)
        local EmptyCount = AllFillCount - BagItemCount
        if EmptyCount <= 0 then
          return
        end
        for i = 1, EmptyCount do
          local BagItemContent = StuffIconObject:CreateBagItemContent({
            Uuid = "",
            StuffType = "EmptyGrid",
            GridIndex = BagItemCount + i,
            StuffCount = 0,
            IsSelected = false,
            StuffIcon = nil,
            ParentWidget = self
          })
          self.List_Item:AddItem(BagItemContent)
        end
        self.List_Item:SetEmptyGridItemCount(EmptyCount)
        local VisibilityTag = EmptyCount > 0 and "Collapsed" or "Visible"
        self.List_Item:SetScrollbarVisibility(UIConst.VisibilityOp[VisibilityTag])
      end)
    end
  end
  self:JumpToSelectItem(NeedDelayJump)
end

function M:JumpToSelectItem(NeedDelay)
  if NeedDelay then
    self:AddDelayFrameFunc(function()
      self:RealToJumpToSelectItem()
    end, 2, "RealToJumpToSelectItem")
  else
    self:RealToJumpToSelectItem()
  end
end

function M:RealToJumpToSelectItem()
  local AllItemCount = self.List_Item:GetNumItems()
  if self.BagCurState == BagCommon.AllBagState.NormalState and AllItemCount > 0 and self.NeedSelectGridIndex >= 0 then
    self.CurSelectGridIndex = self.NeedSelectGridIndex + 1
    self.CurSelectStuffContent = self.List_Item:GetItemAt(self.NeedSelectGridIndex)
    if IsValid(self.CurSelectStuffContent) and not self.CurSelectStuffContent.IsSelect then
      if self.CurSelectStuffContent.SelfWidget then
        self.CurSelectStuffContent.SelfWidget:SetSelected(true)
      else
        self.CurSelectStuffContent.IsSelect = true
      end
    end
    if self.CurSelectStuffContent.StuffType ~= "EmptyGrid" then
      self.List_Item:SetSelectedIndex(self.NeedSelectGridIndex)
      self.List_Item:ScrollIndexIntoView(self.NeedSelectGridIndex)
      self:RefreshDetail(self.CurSelectGridIndex, self.CurSelectStuffContent.Uuid)
    else
      self:RefreshDetail(-1, nil)
    end
  elseif not self.Panel_Detail:IsVisible() then
    self.CurSelectGridIndex = -1
    self.CurSelectStuffContent = nil
    self.List_Item:ScrollIndexIntoView(0)
  end
  self:AfterFillDataInfo()
end

function M:CheckIsCanAddToSaleList(CurStuffContent, bIsShowToast, IsFromAutoSelect)
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
    elseif self:GetIsStuffIsEquiped(CurStuffContent) then
      if CurStuffContent.StuffType == BagCommon.StuffType.Mod then
        if self.CheckBox_Ignore:IsChecked() and IsFromAutoSelect then
          ShowTextId = 7012
        end
      else
        ShowTextId = 7012
      end
    end
  end
  if ShowTextId and bIsShowToast then
    UIManager(self):ShowError(ShowTextId, nil, UIConst.Tip_CommonToast)
  end
  return nil == ShowTextId
end

function M:CheckIsCanAddToResolveList(CurStuffContent, bIsShowToast)
  local PlayerAvatar = GWorld:GetAvatar()
  if nil == PlayerAvatar then
    return false
  end
  if nil == CurStuffContent then
    CurStuffContent = self.CurSelectStuffContent
  end
  local ShowTextId
  if nil ~= CurStuffContent then
    if 0 ~= CurStuffContent.LockType then
      ShowTextId = 7010
    elseif self:GetIsStuffIsEquiped(CurStuffContent) then
      ShowTextId = 7012
    end
  end
  if ShowTextId and bIsShowToast then
    UIManager(self):ShowError(ShowTextId, nil, UIConst.Tip_CommonToast)
  end
  return nil == ShowTextId
end

function M:GetStuffSaleCondition()
  return self.CheckBox_Retain:IsChecked(), self.CheckBox_Ignore:IsChecked()
end

function M:RefreshSaleItemSelect(StuffUuid, GridIndex, AddNum)
  if self.BagCurState == BagCommon.AllBagState.ChooseSaleState then
    local StuffServerData = self:GetStuffServerData(self.CurSelectStuffContent.Uuid, self.CurSelectStuffContent.StuffType, self.CurSelectStuffContent.FishInfo)
    if not self:CheckIsCanAddToSaleList(nil, true) then
      return
    end
    local SaleObj = self.DesireSaleStuffObjList[StuffUuid]
    if SaleObj then
      if AddNum > 0 then
        local SellPageMainUI = UIManager(self):GetUI(BagCommon.BagStuffSelectUIName)
        if SellPageMainUI then
          local ExtraData = SaleObj.StateTagInfo.ExtraData
          local CurCount, MaxCount = ExtraData[1], ExtraData[2]
          local NewCount = CurCount + AddNum
          local FinalCount = math.min(NewCount, MaxCount)
          if CurCount <= FinalCount then
            local DeltaNum = FinalCount - CurCount
            ExtraData[1] = FinalCount
            SellPageMainUI:UpdateItemNumFromList(SaleObj, DeltaNum)
          end
        end
      else
        DebugPrint("Stuff is in Sale list, removing...")
        EventManager:FireEvent(EventID.OnRemoveBagItemInList, StuffUuid)
      end
      return
    end
    local StuffData = {}
    if self.CurTabId == BagCommon.ItemTypeToTabId.Mod then
      StuffData = StuffIconObject:GetModStuffData(StuffServerData, nil, "ClickChooseStuff")
    else
      StuffData = StuffIconObject:GetItemStuffData(StuffServerData, nil, "ClickChooseStuff")
    end
    
    local function RemoveStuffCallback()
      EventManager:FireEvent(EventID.OnRemoveBagItemInList, StuffUuid)
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
    self.CurSelectStuffContent.StateTagInfo = StuffStateTagInfo
    if self.CurSelectStuffContent.SelfWidget then
      self.CurSelectStuffContent.SelfWidget:SetStuffStyleByStateTag(self.CurSelectStuffContent)
    end
    self.DesireSaleStuffObjList[StuffUuid] = self.CurSelectStuffContent
    EventManager:FireEvent(EventID.OnAddBagItemToList, StuffData)
  end
end

function M:RefreshResolveWeaponSelect(StuffUuid, GridIndex)
  if self.BagCurState == BagCommon.AllBagState.WeaponResolveState then
    if not self:CheckIsCanAddToResolveList(nil, true) then
      return
    end
    if self.DesireResolveWeaponList[StuffUuid] ~= nil then
      return
    end
    
    local function RemoveWeaponCallback()
      EventManager:FireEvent(EventID.OnRemoveBagItemInList, StuffUuid)
    end
    
    local StuffServerData = self:GetStuffServerData(self.CurSelectStuffContent.Uuid, self.CurSelectStuffContent.StuffType)
    local StuffData = StuffIconObject:GetWeaponStuffData(StuffServerData, nil, "ClickChooseStuff")
    local StuffStateTagInfo = {
      Name = "IsToChoose",
      ExtraData = {
        1,
        StuffData.StuffCount,
        StuffData.Price,
        StuffData.CoinId,
        RemoveWeaponCallback
      }
    }
    self.CurSelectStuffContent.StateTagInfo = StuffStateTagInfo
    if self.CurSelectStuffContent.SelfWidget then
      self.CurSelectStuffContent.SelfWidget:SetStuffStyleByStateTag(self.CurSelectStuffContent)
    end
    self.DesireResolveWeaponList[StuffUuid] = self.CurSelectStuffContent
    EventManager:FireEvent(EventID.OnAddBagItemToList, StuffData)
  end
end

function M:RemoveItemSaleState(StuffId)
  local StuffContent = self.DesireSaleStuffObjList[StuffId]
  if not IsValid(StuffContent) then
    return
  end
  local StuffStateTagInfo = {
    Name = "Normal",
    ExtraData = {
      StuffContent.Count,
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
  if StuffContent.StuffType == BagCommon.StuffType.Mod then
    local IsCurInModTab = self.CurTabId == BagCommon.ItemTypeToTabId.Mod
    IsNeedCancelSelect = self.CurSelectStuffContent ~= nil and StuffContent.Uuid == self.CurSelectStuffContent.Uuid
  elseif StuffContent.StuffType == BagCommon.StuffType.Resource then
    local StuffConfigData = DataMgr.Resource[StuffContent.UnitId]
    IsNeedCancelSelect = self.CurTabId == StuffConfigData.MaterialClassify and self.CurSelectStuffContent ~= nil and StuffContent.Uuid == self.CurSelectStuffContent.Uuid
  end
  self.DesireSaleStuffObjList[StuffId] = nil
  if IsNeedCancelSelect then
    self.List_Item:BP_ClearSelection()
  end
end

function M:RemoveWeaponResolveState(StuffUuid)
  local StuffContent = self.DesireResolveWeaponList[StuffUuid]
  if not IsValid(StuffContent) then
    return
  end
  local StuffStateTagInfo = {
    Name = "Normal",
    ExtraData = {
      StuffContent.Count,
      StuffContent.Price,
      StuffContent.CoinId
    }
  }
  StuffContent.StateTagInfo = StuffStateTagInfo
  StuffContent.IsSelect = false
  if StuffContent.SelfWidget and StuffContent.Uuid == StuffUuid then
    StuffContent.SelfWidget:SetSelected(false)
    StuffContent.SelfWidget:SetStuffStyleByStateTag(StuffContent)
  end
  local IsCurInWeaponTab = self.CurTabId == BagCommon.ItemTypeToTabId.MeleeWeapon or self.CurTabId == BagCommon.ItemTypeToTabId.RangedWeapon
  local IsNeedCancelSelect = IsCurInWeaponTab and self.CurSelectStuffContent ~= nil and StuffContent.Uuid == self.CurSelectStuffContent.Uuid
  self.DesireResolveWeaponList[StuffUuid] = nil
  if IsNeedCancelSelect then
    self.List_Item:BP_ClearSelection()
  end
end

function M:TryToAddItemToTargetListWithRarity(StuffContent)
  local StuffType = StuffContent.ItemType
  local StuffUuid = StuffContent.Uuid
  local StuffServerData = self:GetStuffServerData(StuffContent.Uuid, StuffType, StuffContent.FishInfo)
  local StuffData
  
  local function RemoveStuffCallback()
    EventManager:FireEvent(EventID.OnRemoveBagItemInList, StuffUuid)
  end
  
  if StuffType == BagCommon.StuffType.Weapon then
    if self:CheckIsCanAddToResolveList(StuffContent, false) and self.DesireResolveWeaponList[StuffUuid] == nil then
      StuffData = StuffIconObject:GetWeaponStuffData(StuffServerData, nil, "ClickChooseStuff")
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
      StuffContent.StateTagInfo = StuffStateTagInfo
      if StuffContent.SelfWidget then
        StuffContent.SelfWidget:SetStuffStyleByStateTag(StuffContent)
      end
      self.DesireResolveWeaponList[StuffUuid] = StuffContent
    end
  elseif self:CheckIsCanAddToSaleList(StuffContent, false, true) and nil == self.DesireSaleStuffObjList[StuffUuid] then
    local NowAddToSaleListCount = 0
    if self.CurTabId == BagCommon.ItemTypeToTabId.Mod then
      StuffData = StuffIconObject:GetModStuffData(StuffServerData, nil, "ClickChooseStuff")
      if self.CheckBox_Retain:IsChecked() then
        NowAddToSaleListCount = StuffData.StuffCount - 1
      else
        NowAddToSaleListCount = StuffData.StuffCount
      end
    else
      StuffData = StuffIconObject:GetItemStuffData(StuffServerData, nil, "ClickChooseStuff")
      NowAddToSaleListCount = StuffData.StuffCount
    end
    if NowAddToSaleListCount > 0 then
      local StuffStateTagInfo = {
        Name = "IsToChoose",
        ExtraData = {
          NowAddToSaleListCount,
          StuffData.StuffCount,
          StuffData.Price,
          StuffData.CoinId,
          RemoveStuffCallback
        }
      }
      StuffContent.StateTagInfo = StuffStateTagInfo
      if StuffContent.SelfWidget then
        StuffContent.SelfWidget:SetStuffStyleByStateTag(StuffContent)
      end
      self.DesireSaleStuffObjList[StuffUuid] = StuffContent
    end
  end
  return StuffData
end

function M:TryToRemoveItemToTargetListWithRarity(StuffContent)
  local StuffType = StuffContent.StuffType
  local StuffUuid = StuffContent.Uuid
  local bIsNeedRemove = false
  if StuffType == BagCommon.StuffType.Weapon then
    if self.DesireResolveWeaponList[StuffUuid] then
      local StuffStateTagInfo = {
        Name = "Normal",
        ExtraData = {
          StuffContent.Count,
          StuffContent.Price,
          StuffContent.CoinId
        }
      }
      StuffContent.StateTagInfo = StuffStateTagInfo
      StuffContent.IsSelect = false
      if StuffContent.SelfWidget then
        StuffContent.SelfWidget:SetSelected(false)
        StuffContent.SelfWidget:SetStuffStyleByStateTag(StuffContent)
      end
      local IsCurInWeaponTab = self.CurTabId == BagCommon.ItemTypeToTabId.MeleeWeapon or self.CurTabId == BagCommon.ItemTypeToTabId.RangedWeapon
      local IsNeedCancelSelect = IsCurInWeaponTab and self.CurSelectStuffContent ~= nil and StuffContent.Uuid == self.CurSelectStuffContent.Uuid
      self.DesireResolveWeaponList[StuffUuid] = nil
      if IsNeedCancelSelect then
        self.List_Item:BP_ClearSelection()
      end
      bIsNeedRemove = true
    end
  elseif self.DesireSaleStuffObjList[StuffUuid] then
    local StuffStateTagInfo = {
      Name = "Normal",
      ExtraData = {
        StuffContent.Count,
        StuffContent.Price,
        StuffContent.CoinId
      }
    }
    StuffContent.StateTagInfo = StuffStateTagInfo
    StuffContent.IsSelect = false
    if StuffContent.SelfWidget then
      StuffContent.SelfWidget:SetSelected(false)
      StuffContent.SelfWidget:SetStuffStyleByStateTag(StuffContent)
    end
    local IsNeedCancelSelect = false
    if StuffContent.StuffType == BagCommon.StuffType.Mod then
      local IsCurInModTab = self.CurTabId == BagCommon.ItemTypeToTabId.Mod
      IsNeedCancelSelect = self.CurSelectStuffContent ~= nil and StuffContent.Uuid == self.CurSelectStuffContent.Uuid
    elseif StuffContent.StuffType == BagCommon.StuffType.Resource then
      local StuffConfigData = DataMgr.Resource[StuffContent.UnitId]
      IsNeedCancelSelect = self.CurTabId == StuffConfigData.MaterialClassify and self.CurSelectStuffContent ~= nil and StuffContent.Uuid == self.CurSelectStuffContent.Uuid
    end
    self.DesireSaleStuffObjList[StuffUuid] = nil
    if IsNeedCancelSelect then
      self.List_Item:BP_ClearSelection()
    end
    bIsNeedRemove = true
  end
  return bIsNeedRemove
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  local IsUseGamePad = CurInputType == ECommonInputType.Gamepad and self:IsCanChangeToGamePadViewMode()
  self.Panel_Detail:UpdateUIStyleInPlatform(IsUseGamePad)
  self:UpdateUIStyleInPlatform(IsUseGamePad)
  if IsUseGamePad and self.BagCurState == BagCommon.AllBagState.ChooseSaleState then
    self:RefreshBottomKeyInfo("ChooseSaleState")
  end
end

function M:IsCanChangeToGamePadViewMode()
  if self.CurFocusWidget == "DefaultWidget" then
    return true
  else
    local PlayerController = self:GetOwningPlayer()
    if self.BagCurState == BagCommon.AllBagState.NormalState then
      if self.Filter:HasUserFocus(PlayerController) then
        return false
      elseif self.Sift:HasUserFocus(PlayerController) then
        return false
      end
    elseif self.Yellow:HasUserFocus(PlayerController) then
      return false
    elseif self.Purple:HasUserFocus(PlayerController) then
      return false
    elseif self.Blue:HasUserFocus(PlayerController) then
      return false
    elseif self.Green:HasUserFocus(PlayerController) then
      return false
    elseif self.Grey:HasUserFocus(PlayerController) then
      return false
    end
    if self.Panel_Detail:IsVisible() and self.Panel_Detail:IsInGamePadViewAccessKey() then
      return false
    end
    return true
  end
end

function M:GetIsStuffIsEquiped(SelectStuffContent)
  local PlayerAvatar = GWorld:GetAvatar()
  SelectStuffContent = SelectStuffContent or self.CurSelectStuffContent
  local IsEquiped = false
  if SelectStuffContent.StuffType == BagCommon.StuffType.Weapon then
    local WeaponUuid = self:GetStuffObjId(SelectStuffContent.Uuid)
    if WeaponUuid == PlayerAvatar.MeleeWeapon or WeaponUuid == PlayerAvatar.RangedWeapon then
      IsEquiped = true
    end
  elseif SelectStuffContent.StuffType == BagCommon.StuffType.Mod then
    local StuffServerData = self:GetStuffServerData(SelectStuffContent.Uuid, BagCommon.StuffType.Mod)
    if nil ~= StuffServerData and StuffServerData.Count > 0 and (StuffServerData.WeaponUuids:Length() > 0 or StuffServerData.CharUuids:Length() > 0) then
      IsEquiped = true
    end
  end
  return IsEquiped
end

function M:BindEventOnSelectionsChanged(Filter1, Filter2, Filter3, SortType)
  self:RefreshStuffListItem(true)
end

function M:BindEventOnSortTypeChanged(SortType)
  self:RefreshStuffListItem(false)
end

function M:RefreshStuffListItem(IsFilterSelectionsChanged)
  self.IsFilterSelectionsChanged = IsFilterSelectionsChanged
  self:ReGenerateBagList()
end

function M:ReGenerateBagList()
  self:CancelStuffClickAndHideDetail()
  self.List_Item:BP_ClearSelection()
  self.List_Item:ClearListItems()
  if self.LoadMode == "FrameBlocking" then
    self:RemoveCoroutineTask(self.FillPlayerDataByTypeInFrame)
    self.IsLoadCompleted = false
    self:AddCoroutineTask(self.FillPlayerDataByTypeInFrame, self, self.CurTabId)
  else
    self:FillPlayerDataByType(self.CurTabId)
  end
end

function M:OnSelectStuffItemChanged(SelectItem, bIsSelect)
  if not SelectItem then
    return
  end
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    if self.BagCurState == BagCommon.AllBagState.NormalState then
      self:OnListSelectStuffClicked(SelectItem)
    elseif self.BagCurState == BagCommon.AllBagState.ChooseSaleState or self.BagCurState == BagCommon.AllBagState.WeaponResolveState then
      local SellPageMainUI = UIManager(self):GetUI(BagCommon.BagStuffSelectUIName)
      if nil ~= SellPageMainUI then
        SellPageMainUI:TryToHoverToItemOnNavigation(SelectItem)
      end
      if self.BagCurState == BagCommon.AllBagState.ChooseSaleState or BagCommon.AllBagState.WeaponResolveState then
        if SelectItem.bMinus then
          self.HoverItem = SelectItem
          self:RefreshBottomKeyInfo("ChooseSaleState")
        else
          self:RefreshBottomKeyInfo("NoRemoveSelect")
        end
      end
    end
  end
end

function M:GetStuffObjId(StuffUuid)
  local FinalObjId = StuffUuid
  if type(FinalObjId) == "string" and CommonUtils.IsObjIdStr(FinalObjId) then
    FinalObjId = CommonUtils.Str2ObjId(FinalObjId)
  end
  return FinalObjId
end

function M:UpdatePageInfoFromStackAction()
  if IsValid(self.CurSelectStuffContent) then
    if self.CurSelectStuffContent.SelfWidget then
      self.CurSelectStuffContent.SelfWidget:SetSelected(false)
    else
      self.CurSelectStuffContent.IsSelect = false
    end
    self.NeedSelectStuffId = self.CurSelectStuffContent.Uuid
  end
  self:FillWithListViewData(self.CurTabId, true)
  self:RefreshBottomKeyInfo()
  self:UpdateUIStyleInPlatform(self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad)
end

function M:SetFocus_Lua()
  if UIManager(self):IsHaveMenuAnchorOpen() then
    return
  end
  local CommonDialog = UIManager(self):GetUIObj("CommonDialog")
  if nil ~= CommonDialog then
    return
  end
  local ComSortFullScreen = UIManager(self):GetUIObj("ComSortFullScreen")
  if nil ~= ComSortFullScreen then
    return
  end
  self:RefreshBottomKeyInfo()
  local AllItemCount = self.List_Item:GetNumItems()
  if AllItemCount > 0 then
    self.List_Item:SetFocus()
  else
    self:SetFocus()
  end
end

function M:BP_GetDesiredFocusTarget()
  local DesiredFocusTarget
  if nil == DesiredFocusTarget then
    local SellPageMainUI = UIManager(self):GetUI(BagCommon.BagStuffSelectUIName)
    if nil ~= SellPageMainUI then
      DesiredFocusTarget = SellPageMainUI:GetGetDesiredFocusTarget_Lua()
    end
  end
  if nil == DesiredFocusTarget then
    local AllItemCount = self.List_Item:GetNumItems()
    if AllItemCount > 0 then
      DesiredFocusTarget = self.List_Item
    else
      DesiredFocusTarget = self
    end
  end
  return DesiredFocusTarget
end

function M:RefreshButtonInfoInDiffTab()
  local BagTabData, bIsShowSellBtn = DataMgr.BagTab[self.CurTabId], false
  if BagTabData and BagTabData.HideSell then
    bIsShowSellBtn = true
  end
  if bIsShowSellBtn then
    self.Button_Sell:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    if self.CurTabId == BagCommon.ItemTypeToTabId.MeleeWeapon or self.CurTabId == BagCommon.ItemTypeToTabId.RangedWeapon then
      self.Button_Sell:SetText(GText("UI_Bag_Decompose"))
    elseif self.CurTabId == BagCommon.ItemTypeToTabId.Mod then
      self.Button_Sell:SetText(GText("UI_Bag_ModExtract"))
    else
      self.Button_Sell:SetText(GText("UI_BAG_Sell"))
    end
    self.Button_Sell:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:OnRetainOneCheckStateChanged(IsChecked)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  local NeedUpdateList, NeedRemoveList
  if IsChecked then
    for key, StuffContent in pairs(self.DesireSaleStuffObjList) do
      local StuffStateTagInfo = StuffContent.StateTagInfo
      if StuffStateTagInfo.ExtraData then
        if 1 == StuffStateTagInfo.ExtraData[2] then
          self:RemoveItemSaleState(key)
          if nil ~= NeedRemoveList then
            table.insert(NeedRemoveList, key)
          else
            NeedRemoveList = {key}
          end
        elseif StuffStateTagInfo.ExtraData[1] > 1 then
          StuffStateTagInfo.ExtraData[1] = StuffStateTagInfo.ExtraData[1] - 1
          if StuffContent.SelfWidget then
            StuffContent.SelfWidget:SetStuffStyleByStateTag(StuffContent)
          end
          if nil ~= NeedUpdateList then
            table.insert(NeedUpdateList, StuffContent)
          else
            NeedUpdateList = {StuffContent}
          end
        end
      end
    end
  else
  end
  local SellPageMainUI = UIManager(self):GetUI(BagCommon.BagStuffSelectUIName)
  if NeedUpdateList and SellPageMainUI then
    SellPageMainUI:UpdateItemInfoFromList(NeedUpdateList)
  end
  if NeedRemoveList and SellPageMainUI then
    SellPageMainUI:MultiRemoveBagItemInList(NeedRemoveList)
  end
end

function M:OnIgnoreEquipedCheckStateChanged(IsChecked)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  local NeedRemoveList
  if IsChecked then
    for key, StuffContent in pairs(self.DesireSaleStuffObjList) do
      if self:GetIsStuffIsEquiped(StuffContent) then
        self:RemoveItemSaleState(key)
        if nil ~= NeedRemoveList then
          table.insert(NeedRemoveList, key)
        else
          NeedRemoveList = {key}
        end
      end
    end
  else
  end
  local SellPageMainUI = UIManager(self):GetUI(BagCommon.BagStuffSelectUIName)
  if NeedRemoveList and SellPageMainUI then
    SellPageMainUI:MultiRemoveBagItemInList(NeedRemoveList)
  end
end

function M:OnClickGoToAmory()
  self.IsNeedPlayNpcAnim = false
  self.GoToArmoryWhenClose = true
  self:Close()
end

function M:ReClickGoToUseConsume()
  if not self.CurSelectStuffContent then
    return
  end
  local StuffUuid = self.CurSelectStuffContent.Uuid
  local StuffType = self.CurSelectStuffContent.StuffType
  local StuffServerData = self:GetStuffServerData(StuffUuid, StuffType)
  if StuffServerData then
    local StuffConfigData = StuffServerData:Data()
    self:OnClickGoToUseConsume(StuffConfigData)
  end
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
  self:AddTimer(0.01, function()
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  end)
end

function M:OnClickGoToUseConsume(StuffConfigData)
  self.CurrentChooseInfo = nil
  local CommonDialogParams = {}
  CommonDialogParams.OptionalItemsList = {}
  local UseEffectType, ExtraString, OptCount = StuffConfigData.UseEffectType, ""
  if UseEffectType then
    local ResultData = {}
    if type(self["GenerateDataWith_" .. UseEffectType]) == "function" then
      ResultData, ExtraString, OptCount = self["GenerateDataWith_" .. UseEffectType](self, StuffConfigData.ResourceId, StuffConfigData.UseParam)
    end
    CommonDialogParams.OptionalItemsList = ResultData
  end
  if UseEffectType == CommonConst.ResUseEffectType.SelectGeneralSkin then
    DebugPrint("gmy@BagBase M:OnClickGoToUseConsume", StuffConfigData.UseParam)
    UIManager(self):LoadUINew("CharSkinPreview", nil, {
      Type = "SkinSelect",
      SkinOptRewardId = StuffConfigData.UseParam,
      ResourceId = StuffConfigData.ResourceId
    })
    return
  end
  CommonDialogParams.Title = GText(StuffConfigData.ResourceName)
  if "ResourcePack" == UseEffectType then
    CommonDialogParams.Tips = {
      string.format(ExtraString, "\230\157\144\230\150\153\229\140\133", 1, 1, 1)
    }
  elseif "SelectResource" == UseEffectType then
    CommonDialogParams.Tips = {
      string.format(ExtraString, GText(StuffConfigData.ResourceName), 0, OptCount, 2)
    }
  else
    CommonDialogParams.Tips = {
      string.format(GText("UI_Consumable_Choose"), ExtraString)
    }
  end
  CommonDialogParams.AutoFocus = true
  CommonDialogParams.DontCloseWhenRightBtnClicked = true
  CommonDialogParams.FunctionCallbackObj = self
  CommonDialogParams.ChooseCallbackFunction = self.TryToChooseConsumableItems
  CommonDialogParams.RightGamepadImg = EKeys.X.KeyName
  CommonDialogParams.ParentWidget = self
  
  function CommonDialogParams.RightCallbackFunction(_, FirstData, FirstPopUIWidget)
    local ConfirmParams, TargetStuffName, PopConfirmUIId = {}, "", 100210
    if "SelectWeapon" == UseEffectType then
      if self.CurrentChooseInfo then
        TargetStuffName = self.CurrentChooseInfo.ChooseName
      end
      ConfirmParams.ShortText = string.format(GText("UI_Consumable_Choose_Confirm"), TargetStuffName)
    elseif "SelectCharacter" == UseEffectType then
      local GradeLevel = 0
      if self.CurrentChooseInfo then
        TargetStuffName = self.CurrentChooseInfo.ChooseName
        GradeLevel = CommonDialogParams.OptionalItemsList[self.CurrentChooseInfo.ChooseIndex].GradeLevel or 0
      end
      local MaxGradeLevel = DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue
      if GradeLevel >= MaxGradeLevel then
        ConfirmParams.ShortText = string.format(GText("UI_Consumable_CardLevel_Max"), TargetStuffName)
      else
        ConfirmParams.ShortText = string.format(GText("UI_Consumable_Choose_Confirm"), TargetStuffName)
      end
    elseif "SelectPet" == UseEffectType then
      if self.CurrentChooseInfo then
        TargetStuffName = self.CurrentChooseInfo.ChooseName
      end
      ConfirmParams.ShortText = string.format(GText("UI_Consumable_Choose_Confirm"), TargetStuffName)
    elseif "SelectResource" == UseEffectType then
    elseif "ResourcePack" == UseEffectType then
      self.ConsumeCount = self.CurrentChooseInfo.ConsumeCount or 1
    end
    if "ResourcePack" == UseEffectType then
      FirstPopUIWidget.DontFocusParentWidget = true
      FirstPopUIWidget:RemoveFirstItemInPopupQueue()
      FirstPopUIWidget:OnCloseBtnClicked()
      self:ConfirmDealWithConsumablePacks(UseEffectType)
    elseif "SelectResource" == UseEffectType then
      FirstPopUIWidget.DontFocusParentWidget = true
      FirstPopUIWidget:RemoveFirstItemInPopupQueue()
      FirstPopUIWidget:OnCloseBtnClicked()
      self:ConfirmDealWithConsumableResource(UseEffectType)
    elseif ConfirmParams.ShortText then
      FirstPopUIWidget.DontFocusParentWidget = true
      ConfirmParams.AutoFocus = true
      
      function ConfirmParams.RightCallbackFunction(_, Data, PopUIWidget)
        PopUIWidget:RemoveFirstItemInPopupQueue()
        self:ConfirmDealWithConsumableItems(UseEffectType, StuffConfigData.UseParam)
      end
      
      ConfirmParams.DontFocusParentWidget = true
      UIManager(self):ShowCommonPopupUI_Interrupt(PopConfirmUIId, ConfirmParams, self)
    else
      FirstPopUIWidget.DontFocusParentWidget = false
      self:ConfirmDealWithConsumableItems(UseEffectType, StuffConfigData.UseParam)
    end
  end
  
  if "ResourcePack" == UseEffectType then
    UIManager(self):ShowCommonPopupUI(100207, CommonDialogParams, self)
  elseif "SelectResource" == UseEffectType then
    UIManager(self):ShowCommonPopupUI(100208, CommonDialogParams, self)
  else
    UIManager(self):ShowCommonPopupUI(100209, CommonDialogParams, self)
  end
end

function M:TryToChooseConsumableItems(CurrentChooseInfo)
  self.CurrentChooseInfo = CurrentChooseInfo
end

function M:ConfirmDealWithConsumableItems(UseEffectType, UseParam)
  local PlayerAvatar = GWorld:GetAvatar()
  if nil == PlayerAvatar then
    DebugPrint("ConfirmDealWithConsumableItems PlayerAvatar is nil, Not Connect to Server")
    return
  end
  if nil == self.CurrentChooseInfo then
    DebugPrint("ConfirmDealWithConsumableItems error, CurrentChooseInfo is nil")
    return
  end
  DebugPrint("Now ConfirmDealWithConsumableItems The ChooseId is ", self.CurrentChooseInfo.ChooseId)
  local ResourceId, OptionalId, OptIdxList
  ResourceId, OptionalId = self.CurrentChooseInfo.ResourceId, self.CurrentChooseInfo.OptionalId
  local OptIndex = 1
  for Index, Id in pairs(DataMgr.OptReward[UseParam].Id) do
    if Id == self.CurrentChooseInfo.ChooseId then
      OptIndex = Index
      break
    end
  end
  OptIdxList = {OptIndex}
  
  local function DealWithConsumableItemsCallback()
    local OptionalItemsDataConfig = DataMgr.OptReward[OptionalId]
    if "SelectWeapon" == UseEffectType then
      local WeaponChooseId = OptionalItemsDataConfig.Id[OptIdxList[1]]
      if WeaponChooseId then
        UIUtils.ShowGetItemPage(BagCommon.StuffType.Weapon, WeaponChooseId, 1)
      end
      local AllItemCount = self.List_Item:GetNumItems()
      for i = 0, AllItemCount - 1 do
        local ItemObj = self.List_Item:GetItemAt(i)
        if ItemObj and ItemObj.StuffId == ResourceId then
          local StuffServerData = self:GetStuffServerData(ItemObj.Uuid, BagCommon.StuffType.Resource)
          if nil == StuffServerData or type(StuffServerData.Count) == "number" and StuffServerData.Count <= 0 then
            self.List_Item:RemoveItem(ItemObj)
            local EmptyStuffObj = StuffIconObject:CreateBagItemContent({
              Uuid = "",
              StuffType = "EmptyGrid",
              StuffCount = 0,
              StuffIcon = nil,
              ParentWidget = self
            })
            self.List_Item:AddItem(EmptyStuffObj)
            self.List_Item:AddEmptyGridItemCount(1)
            self.NeedSelectGridIndex = 0
            self:JumpToSelectItem(false)
            self:RefreshAllGridIndex()
          else
            ItemObj.Count = StuffServerData.Count
            if ItemObj.SelfWidget then
              ItemObj.SelfWidget:SetCount(StuffServerData.Count)
            end
          end
        end
      end
      if self.Panel_Detail:IsVisible() then
        self.Panel_Detail:UpdateItemNumber()
      end
    elseif "SelectCharacter" == UseEffectType then
      local CharChooseId = OptionalItemsDataConfig.Id[OptIdxList[1]]
      if CharChooseId then
        UIUtils.ShowGetItemPage("Char", CharChooseId, 1)
      end
      local AllItemCount = self.List_Item:GetNumItems()
      for i = 0, AllItemCount - 1 do
        local ItemObj = self.List_Item:GetItemAt(i)
        if ItemObj and ItemObj.StuffId == ResourceId then
          local StuffServerData = self:GetStuffServerData(ItemObj.Uuid, BagCommon.StuffType.Resource)
          if nil == StuffServerData or type(StuffServerData.Count) == "number" and StuffServerData.Count <= 0 then
            self.List_Item:RemoveItem(ItemObj)
            local EmptyStuffObj = StuffIconObject:CreateBagItemContent({
              Uuid = "",
              StuffType = "EmptyGrid",
              StuffCount = 0,
              StuffIcon = nil,
              ParentWidget = self
            })
            self.List_Item:AddItem(EmptyStuffObj)
            self.List_Item:AddEmptyGridItemCount(1)
            self.NeedSelectGridIndex = 0
            self:JumpToSelectItem(false)
            self:RefreshAllGridIndex()
          else
            ItemObj.Count = StuffServerData.Count
            if ItemObj.SelfWidget then
              ItemObj.SelfWidget:SetCount(StuffServerData.Count)
            end
          end
        end
      end
      if self.Panel_Detail:IsVisible() then
        self.Panel_Detail:UpdateItemNumber()
      end
    elseif "SelectPet" == UseEffectType then
      local PetChooseId = OptionalItemsDataConfig.Id[OptIdxList[1]]
      if PetChooseId then
        local GameInstance = GWorld.GameInstance
        local UIManager = GameInstance:GetGameUIManager()
        local SystemUIName = "GetItemPage"
        UIManager:LoadUINew(SystemUIName, BagCommon.OptionalItemType.Pet, PetChooseId, 1, PurchaseRewards, -1, -1)
      end
      local AllItemCount = self.List_Item:GetNumItems()
      for i = 0, AllItemCount - 1 do
        local ItemObj = self.List_Item:GetItemAt(i)
        if ItemObj and ItemObj.StuffId == ResourceId then
          local StuffServerData = self:GetStuffServerData(ItemObj.Uuid, BagCommon.StuffType.Resource)
          if nil == StuffServerData or type(StuffServerData.Count) == "number" and StuffServerData.Count <= 0 then
            self.List_Item:RemoveItem(ItemObj)
            local EmptyStuffObj = StuffIconObject:CreateBagItemContent({
              Uuid = "",
              StuffType = "EmptyGrid",
              StuffCount = 0,
              StuffIcon = nil,
              ParentWidget = self
            })
            self.List_Item:AddItem(EmptyStuffObj)
            self.List_Item:AddEmptyGridItemCount(1)
            self.NeedSelectGridIndex = 0
            self:JumpToSelectItem(false)
            self:RefreshAllGridIndex()
          else
            ItemObj.Count = StuffServerData.Count
            if ItemObj.SelfWidget then
              ItemObj.SelfWidget:SetCount(StuffServerData.Count)
            end
          end
        end
      end
      if self.Panel_Detail:IsVisible() then
        self.Panel_Detail:UpdateItemNumber()
      end
    end
  end
  
  PlayerAvatar:UseOptResourceInBag(ResourceId, OptIdxList, DealWithConsumableItemsCallback)
  self.CurrentChooseInfo = nil
end

function M:ConfirmDealWithConsumableResource(UseEffectType)
  local PlayerAvatar = GWorld:GetAvatar()
  if nil == PlayerAvatar then
    DebugPrint("ConfirmDealWithConsumableItems PlayerAvatar is nil, Not Connect to Server")
    return
  end
  if nil == self.CurrentChooseInfo then
    DebugPrint("ConfirmDealWithConsumableItems error, CurrentChooseInfo is nil")
    return
  end
  DebugPrint("Now ConfirmDealWithConsumableItems The ChooseId is ", self.CurrentChooseInfo.ChooseId)
  local ResourceId, OptionalId, OptIdxList, OptionalList, Count = nil, nil, nil, {}, 0
  if type(self.CurrentChooseInfo) == "table" and "SelectResource" == UseEffectType then
    local k, v = next(self.CurrentChooseInfo)
    ResourceId, OptionalId = v.ResourceId, v.OptionalId
    OptIdxList = {}
    for k, v in pairs(self.CurrentChooseInfo) do
      for i = 1, v.ConsumeCount do
        table.insert(OptIdxList, v.ChooseIndex)
        Count = Count + 1
      end
      OptionalList[v.ChooseId] = v.ConsumeCount
    end
  else
    ResourceId, OptionalId = self.CurrentChooseInfo.ResourceId, self.CurrentChooseInfo.OptionalId
    if "table" == type(self.CurrentChooseInfo.ChooseIndex) then
      OptIdxList = self.CurrentChooseInfo.ChooseIndex
    else
      OptIdxList = {
        self.CurrentChooseInfo.ChooseIndex
      }
    end
  end
  
  local function DealWithConsumableItemsCallback()
    local OptionalItemsDataConfig = DataMgr.OptReward[OptionalId]
    local AllRewards = {
      Resources = {}
    }
    for k, v in pairs(OptionalItemsDataConfig.Id) do
      if OptionalList[v] and OptionalList[v] > 0 then
        AllRewards.Resources[v] = OptionalList[v] * OptionalItemsDataConfig.Count[k]
      end
    end
    UIManager(self):LoadUINew("GetItemPage", nil, nil, nil, AllRewards, nil, self, true)
    local AllItemCount = self.List_Item:GetNumItems()
    for i = 0, AllItemCount - 1 do
      local ItemObj = self.List_Item:GetItemAt(i)
      if ItemObj and ItemObj.StuffId == ResourceId then
        local StuffServerData = self:GetStuffServerData(ItemObj.Uuid, BagCommon.StuffType.Resource)
        if nil == StuffServerData or type(StuffServerData.Count) == "number" and StuffServerData.Count <= 0 then
          self.List_Item:RemoveItem(ItemObj)
          local EmptyStuffObj = StuffIconObject:CreateBagItemContent({
            Uuid = "",
            StuffType = "EmptyGrid",
            StuffCount = 0,
            StuffIcon = nil,
            ParentWidget = self
          })
          self.List_Item:AddItem(EmptyStuffObj)
          self.List_Item:AddEmptyGridItemCount(1)
          self.NeedSelectGridIndex = 0
          self:JumpToSelectItem(false)
          self:RefreshAllGridIndex()
        else
          ItemObj.Count = StuffServerData.Count
          if ItemObj.SelfWidget then
            ItemObj.SelfWidget:SetCount(StuffServerData.Count)
          end
        end
      end
    end
    if self.Panel_Detail:IsVisible() then
      self.Panel_Detail:UpdateItemNumber()
    end
  end
  
  PlayerAvatar:UseOptResourceInBag(ResourceId, OptIdxList, DealWithConsumableItemsCallback)
  self.CurrentChooseInfo = nil
end

function M:ConfirmDealWithConsumablePacks(UseEffectType)
  local PlayerAvatar = GWorld:GetAvatar()
  if nil == PlayerAvatar then
    DebugPrint("ConfirmDealWithConsumableItems PlayerAvatar is nil, Not Connect to Server")
    return
  end
  local ResourceId = self.CurrentChooseInfo.ResourceId
  local OptionalId = self.CurrentChooseInfo.OptionalId
  local ConsumeCount = self.CurrentChooseInfo.ConsumeCount or 1
  
  local function DealWithConsumableItemsCallback()
    local OptionalItemsDataConfig = DataMgr.Reward[OptionalId]
    local Count = self.ConsumeCount
    local ResourcePackChooseId = OptionalItemsDataConfig.Id
    local AllRewards = {
      Resources = {}
    }
    for k, v in pairs(OptionalItemsDataConfig.Id) do
      AllRewards.Resources[v] = OptionalItemsDataConfig.Count[k][1] * Count
    end
    UIManager(self):LoadUINew("GetItemPage", nil, nil, nil, AllRewards, nil, self, true)
    local AllItemCount = self.List_Item:GetNumItems()
    for i = 0, AllItemCount - 1 do
      local ItemObj = self.List_Item:GetItemAt(i)
      if ItemObj and ItemObj.StuffId == ResourceId then
        local StuffServerData = self:GetStuffServerData(ItemObj.Uuid, BagCommon.StuffType.Resource)
        if nil == StuffServerData or type(StuffServerData.Count) == "number" and StuffServerData.Count <= 0 then
          self.List_Item:RemoveItem(ItemObj)
          local EmptyStuffObj = StuffIconObject:CreateBagItemContent({
            Uuid = "",
            StuffType = "EmptyGrid",
            StuffCount = 0,
            StuffIcon = nil,
            ParentWidget = self
          })
          self.List_Item:AddItem(EmptyStuffObj)
          self.List_Item:AddEmptyGridItemCount(1)
          self.NeedSelectGridIndex = 0
          self:JumpToSelectItem(false)
          self:RefreshAllGridIndex()
        else
          ItemObj.Count = StuffServerData.Count
          if ItemObj.SelfWidget then
            ItemObj.SelfWidget:SetCount(StuffServerData.Count)
          end
        end
      end
    end
    if self.Panel_Detail:IsVisible() then
      self.Panel_Detail:UpdateItemNumber()
    end
  end
  
  PlayerAvatar:UseResourceInBag(ResourceId, ConsumeCount, DealWithConsumableItemsCallback)
end

function M:GenerateDataWith_SelectWeapon(ResourceId, UseParam)
  local ResultData, OptionalItemsDataConfig = {}, DataMgr.OptReward[UseParam]
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    DebugPrint("GenerateDataWith_SelectWeapon Avatar is nil, Not Connect to Server")
    return ResultData
  end
  if OptionalItemsDataConfig then
    for index, value in ipairs(OptionalItemsDataConfig.Id) do
      local RewardObject = {}
      RewardObject.HaveCountNumber = 0
      for Uuid, StuffServerData in pairs(Avatar.Weapons) do
        if StuffServerData.WeaponId == value then
          RewardObject.HaveCountNumber = RewardObject.HaveCountNumber + 1
          if nil == RewardObject.GradeLevel or StuffServerData.GradeLevel > RewardObject.GradeLevel then
            RewardObject.GradeLevel = StuffServerData.GradeLevel
            RewardObject.IsMaxGradeLevel = DataMgr.WeaponCardLevel[value].CardLevelMax == StuffServerData.GradeLevel
          end
        end
      end
      local WeaponConfigData = DataMgr.Weapon[value]
      local BattleWeaponInfo, AttributeIcon = DataMgr.BattleWeapon[value]
      if BattleWeaponInfo then
        for _, Tag in pairs(BattleWeaponInfo.WeaponTag) do
          local TagInfo = DataMgr.WeaponTag[Tag]
          if TagInfo and TagInfo.WeaponTagfilter and TagInfo.Icon then
            AttributeIcon = TagInfo.Icon
            break
          end
        end
      end
      RewardObject.ResourceId = ResourceId
      RewardObject.OptionalId = UseParam
      RewardObject.StuffId = value
      RewardObject.StuffIcon = WeaponConfigData.Icon
      RewardObject.StuffName = GText(WeaponConfigData.WeaponName)
      RewardObject.StuffType = BagCommon.OptionalItemType.Weapon
      RewardObject.Rarity = WeaponConfigData.WeaponRarity or 1
      RewardObject.AttrIcon = AttributeIcon
      RewardObject.UIName = BagCommon.MainUIName
      RewardObject.ParentWidget = self
      table.insert(ResultData, RewardObject)
    end
  end
  return ResultData, GText("UI_SHOP_SUBTAB_NAME_WEAPON")
end

function M:GenerateDataWith_SelectCharacter(ResourceId, UseParam)
  local ResultData, OptionalItemsDataConfig = {}, DataMgr.OptReward[UseParam]
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return ResultData
  end
  if OptionalItemsDataConfig then
    for index, value in ipairs(OptionalItemsDataConfig.Id) do
      local RewardObject = {}
      RewardObject.HaveCountNumber = 0
      for Uuid, StuffServerData in pairs(Avatar.Chars or {}) do
        if StuffServerData.CharId == value then
          RewardObject.HaveCountNumber = RewardObject.HaveCountNumber + 1
          if nil == RewardObject.GradeLevel or StuffServerData.GradeLevel > RewardObject.GradeLevel then
            RewardObject.GradeLevel = StuffServerData.GradeLevel
          end
          local CharPieceId = DataMgr.Char[value].CharPieceId
          RewardObject.Count = Avatar:GetResourceNum(CharPieceId)
        end
      end
      local CharacterConfigData = DataMgr.Char[value]
      local BattleCharInfo, AttributeIcon = DataMgr.BattleChar[value]
      if BattleCharInfo then
        local Attribute = BattleCharInfo.Attribute
        AttributeIcon = DataMgr.Attribute[Attribute] and DataMgr.Attribute[Attribute].Icon
      end
      RewardObject.ResourceId = ResourceId
      RewardObject.OptionalId = UseParam
      RewardObject.StuffId = value
      RewardObject.StuffIcon = CharacterConfigData.Icon
      RewardObject.StuffName = GText(CharacterConfigData.CharName)
      RewardObject.StuffType = BagCommon.OptionalItemType.Avatar
      RewardObject.Rarity = CharacterConfigData.CharRarity
      RewardObject.AttrIcon = AttributeIcon
      RewardObject.Attribute = BattleCharInfo.Attribute
      RewardObject.UIName = BagCommon.MainUIName
      RewardObject.ParentWidget = self
      table.insert(ResultData, RewardObject)
    end
  end
  return ResultData, GText("UI_Armory_Char")
end

function M:GenerateDataWith_SelectPet(ResourceId, UseParam)
  local ResultData, OptionalItemsDataConfig = {}, DataMgr.OptReward[UseParam]
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return ResultData
  end
  if OptionalItemsDataConfig then
    for index, value in ipairs(OptionalItemsDataConfig.Id) do
      local RewardObject = {}
      RewardObject.HaveCountNumber = 0
      for Uuid, StuffServerData in pairs(Avatar.Pets or {}) do
        if StuffServerData.PetId == value then
          RewardObject.HaveCountNumber = RewardObject.HaveCountNumber + 1
          if nil == RewardObject.GradeLevel or StuffServerData.BreakNum > RewardObject.GradeLevel then
            RewardObject.GradeLevel = StuffServerData.BreakNum
          end
        end
      end
      local PetConfigData = DataMgr.Pet[value]
      RewardObject.ResourceId = ResourceId
      RewardObject.Premium = PetConfigData.Premium
      RewardObject.OptionalId = UseParam
      RewardObject.StuffId = value
      RewardObject.StuffIcon = PetConfigData.Icon
      RewardObject.StuffName = GText(PetConfigData.Name)
      RewardObject.StuffType = BagCommon.OptionalItemType.Pet
      RewardObject.Rarity = PetConfigData.Rarity or 1
      RewardObject.UIName = BagCommon.MainUIName
      RewardObject.ParentWidget = self
      table.insert(ResultData, RewardObject)
    end
  end
  return ResultData, GText("MAIN_UI_PET")
end

function M:GenerateDataWith_SelectResource(ResourceId, UseParam)
  local ResultData, OptionalItemsDataConfig, OptCount = {}, DataMgr.OptReward[UseParam]
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return ResultData
  end
  if OptionalItemsDataConfig then
    OptCount = Avatar.Resources[ResourceId].Count
    for index, value in ipairs(OptionalItemsDataConfig.Id) do
      local RewardObject = {}
      RewardObject.HaveCountNumber = 0
      for Uuid, StuffServerData in pairs(Avatar.Resources or {}) do
        if StuffServerData.ResourceId == value then
          RewardObject.HaveCountNumber = RewardObject.HaveCountNumber + 1
        end
      end
      local ResourceConfigData = DataMgr.Resource[value]
      RewardObject.ResourceId = ResourceId
      RewardObject.OptionalId = UseParam
      RewardObject.StuffId = value
      RewardObject.StuffCount = Avatar.Resources[value] and Avatar.Resources[value].Count or 0
      RewardObject.StuffIcon = ResourceConfigData.Icon
      RewardObject.StuffName = GText(ResourceConfigData.ResourceName)
      RewardObject.StuffType = "SelectResource"
      RewardObject.Rarity = ResourceConfigData.Rarity or 1
      RewardObject.UIName = BagCommon.MainUIName
      RewardObject.ParentWidget = self
      RewardObject.Count = OptionalItemsDataConfig.Count[index]
      RewardObject.OptCount = OptCount
      table.insert(ResultData, RewardObject)
    end
  end
  return ResultData, GText("UI_Consumable_Effect_ResourcePack"), OptCount
end

function M:GenerateDataWith_ResourcePack(ResourceId, UseParam)
  local ResultData, OptionalItemsDataConfig, OptCount = {}, DataMgr.Reward[UseParam]
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return ResultData
  end
  if OptionalItemsDataConfig then
    OptCount = Avatar.Resources[ResourceId].Count
    for index, value in ipairs(OptionalItemsDataConfig.Id) do
      local RewardObject = {}
      RewardObject.HaveCountNumber = 0
      for Uuid, StuffServerData in pairs(Avatar.Resources or {}) do
        if StuffServerData.ResourceId == value then
          RewardObject.HaveCountNumber = RewardObject.HaveCountNumber + 1
        end
      end
      local ResourceConfigData = DataMgr.Resource[value]
      RewardObject.ResourceId = ResourceId
      RewardObject.OptionalId = UseParam
      RewardObject.StuffId = value
      RewardObject.StuffIcon = ResourceConfigData.Icon
      RewardObject.StuffName = GText(ResourceConfigData.ResourceName)
      RewardObject.StuffType = "ResourcePack"
      RewardObject.Rarity = ResourceConfigData.Rarity or 1
      RewardObject.UIName = BagCommon.MainUIName
      RewardObject.ParentWidget = self
      RewardObject.Count = OptionalItemsDataConfig.Count[index][1] or 1
      RewardObject.OptCount = OptCount
      table.insert(ResultData, RewardObject)
    end
  end
  local ResourcePackText = GText("UI_Consumable_Effect_ResourcePack"), OptCount
  return ResultData, ResourcePackText
end

function M:ClickToUnlockStuff()
  local PlayerAvatar = GWorld:GetAvatar()
  if nil == PlayerAvatar then
    DebugPrint("PlayerAvatar is nil, Not Connect to Server")
    return
  end
  if nil == self.CurSelectStuffContent then
    DebugPrint("ClickToUnlockStuff error, CurSelectStuffContent is nil")
    return
  end
  if self.CurTabId == BagCommon.ItemTypeToTabId.Mod then
    local StuffServerData = self:GetStuffServerData(self.CurSelectStuffContent.Uuid, self.CurSelectStuffContent.StuffType)
    if nil ~= StuffServerData and StuffServerData.IsOriginal == true then
      UIManager(self):ShowError(7013, nil, UIConst.Tip_CommonToast)
      return
    end
  end
  if nil ~= self.CurSelectStuffContent and -1 == self.CurSelectStuffContent.Price then
    UIManager(self):ShowError(7014, nil, UIConst.Tip_CommonToast)
    return
  end
  if self.CurSelectStuffContent and 0 ~= self.CurSelectStuffContent.LockType then
    UIManager(self):ShowCommonPopupUI_Old(100019, self, self.RealToUnLockItems)
  elseif self.CurSelectStuffContent.StuffType == BagCommon.StuffType.Weapon then
    local WeaponUuid = self:GetStuffObjId(self.CurSelectStuffContent.Uuid)
    PlayerAvatar:LockResourceInBag(CommonConst.AllType.Weapon, WeaponUuid)
    self:BlockAllUIInput(true)
  elseif self.CurSelectStuffContent.StuffType == BagCommon.StuffType.Mod then
    local ModUuid = self:GetStuffObjId(self.CurSelectStuffContent.Uuid)
    PlayerAvatar:LockResourceInBag(CommonConst.AllType.Mod, ModUuid)
    self:BlockAllUIInput(true)
  elseif self.CurSelectStuffContent.StuffType == BagCommon.StuffType.Resource then
    local StuffUnitId = self.CurSelectStuffContent.UnitId
    if BagCommon:IsFishResource(StuffUnitId) then
      PlayerAvatar:LockResourceInBag(CommonConst.AllType.Resource, StuffUnitId, self.CurSelectStuffContent.FishInfo.Size)
    else
      PlayerAvatar:LockResourceInBag(CommonConst.AllType.Resource, StuffUnitId)
    end
    self:BlockAllUIInput(false)
  end
end

function M:OnClickBlank()
  if not self.Panel_Detail:IsVisible() then
    return
  end
  if IsValid(self.CurSelectStuffContent) then
    if self.CurSelectStuffContent.SelfWidget then
      self.CurSelectStuffContent.SelfWidget:SetSelected(false)
    else
      self.CurSelectStuffContent.IsSelect = false
    end
  end
  self:CancelStuffClickAndHideDetail()
end

function M:RealToUnLockItems()
  local PlayerAvatar = GWorld:GetAvatar()
  if self.CurSelectStuffContent then
    if self.CurSelectStuffContent.StuffType == BagCommon.StuffType.Weapon then
      local StuffUuid = self:GetStuffObjId(self.CurSelectStuffContent.Uuid)
      PlayerAvatar:UnLockResourceInBag(CommonConst.AllType.Weapon, StuffUuid)
    elseif self.CurSelectStuffContent.StuffType == BagCommon.StuffType.Mod then
      local StuffUuid = self:GetStuffObjId(self.CurSelectStuffContent.Uuid)
      PlayerAvatar:UnLockResourceInBag(CommonConst.AllType.Mod, StuffUuid)
    else
      local StuffUnitId = self.CurSelectStuffContent.UnitId
      if BagCommon:IsFishResource(StuffUnitId) then
        PlayerAvatar:UnLockResourceInBag(CommonConst.AllType.Resource, StuffUnitId, self.CurSelectStuffContent.FishInfo.Size)
      else
        PlayerAvatar:UnLockResourceInBag(CommonConst.AllType.Resource, StuffUnitId)
      end
    end
  end
end

function M:OnUpdateBagItemByAction(OpAction, ErrCode, ...)
  if not ErrorCode:Check(ErrCode, UIConst.Tip_CommonToast) then
    return
  end
  if "StateChange" == OpAction then
    self:BlockAllUIInput(false)
    local StuffUnitId = (...)
    local StuffServerData
    if self.CurTabId == BagCommon.ItemTypeToTabId.MeleeWeapon or self.CurTabId == BagCommon.ItemTypeToTabId.RangedWeapon then
      StuffServerData = self:GetStuffServerData(StuffUnitId, BagCommon.StuffType.Weapon)
    elseif self.CurTabId == BagCommon.ItemTypeToTabId.Mod then
      StuffServerData = self:GetStuffServerData(StuffUnitId, BagCommon.StuffType.Mod)
    else
      StuffServerData = self:GetStuffServerData(StuffUnitId, BagCommon.StuffType.Resource)
    end
    if StuffServerData and StuffServerData:IsLock() then
      UIManager(self):ShowError(7006, nil, UIConst.Tip_CommonToast)
    else
      UIManager(self):ShowError(7007, nil, UIConst.Tip_CommonToast)
    end
    self:RefreshDetail(self.CurSelectGridIndex, self.CurSelectStuffContent.Uuid)
    local AllItemCount = self.List_Item:GetNumItems()
    local NeedEqualStuffUnitId = ""
    if type(StuffUnitId) == "number" then
      NeedEqualStuffUnitId = tostring(StuffUnitId)
    else
      NeedEqualStuffUnitId = self:GetStuffObjId(StuffUnitId)
    end
    for i = 0, AllItemCount - 1 do
      local ItemObj = self.List_Item:GetItemAt(i)
      if ItemObj and ItemObj.Uuid == NeedEqualStuffUnitId then
        local LockType = StuffServerData:IsLock() and 1 or 0
        ItemObj.LockType = LockType
        if ItemObj.SelfWidget then
          ItemObj.SelfWidget:SetLock(LockType)
        end
        break
      end
    end
  elseif "FishStateChange" == OpAction then
    self:BlockAllUIInput(false)
    local FishResourceId, FishSize = ...
    local IsLocked = BagCommon:IsFishResourceLocked(FishResourceId, FishSize)
    if IsLocked then
      UIManager(self):ShowError(7006, nil, UIConst.Tip_CommonToast)
    else
      UIManager(self):ShowError(7007, nil, UIConst.Tip_CommonToast)
    end
    self:RefreshDetail(self.CurSelectGridIndex, self.CurSelectStuffContent.Uuid)
    for i = 0, self.List_Item:GetNumItems() - 1 do
      local ItemObj = self.List_Item:GetItemAt(i)
      if ItemObj and ItemObj.Uuid == self.CurSelectStuffContent.Uuid then
        ItemObj.LockType = IsLocked and 1 or 0
        if ItemObj.SelfWidget then
          ItemObj.SelfWidget:SetLock(ItemObj.LockType)
        end
        break
      end
    end
  elseif "WeaponBulkBreakDown" == OpAction then
    if self.CurTabId == BagCommon.ItemTypeToTabId.MeleeWeapon or self.CurTabId == BagCommon.ItemTypeToTabId.RangedWeapon then
      local _, ResolveWeaponSucc = ...
      local SellCount, IsNeedRefreshAll = 0, false
      for i, v in ipairs(ResolveWeaponSucc) do
        local WeaponUnitId = v
        local NeedRemoveObj = self.DesireResolveWeaponList[WeaponUnitId]
        if NeedRemoveObj then
          self.List_Item:RemoveItem(NeedRemoveObj)
          SellCount = SellCount + 1
        else
          IsNeedRefreshAll = true
        end
      end
      if IsNeedRefreshAll then
        self:ReGenerateBagList()
      else
        for i = 1, SellCount do
          local EmptyStuffObj = StuffIconObject:CreateBagItemContent({
            Uuid = "",
            StuffType = "EmptyGrid",
            StuffCount = 0,
            StuffIcon = nil,
            ParentWidget = self
          })
          self.List_Item:AddItem(EmptyStuffObj)
          self.List_Item:AddEmptyGridItemCount(1)
        end
        self.NeedSelectGridIndex = 0
        self:JumpToSelectItem(false)
        self:RefreshAllGridIndex()
      end
    end
    self.Tab_Bag:UpdateResource()
  elseif UE4.UKismetStringLibrary.EndsWith(OpAction, "Sale", ESearchCase.CaseSensitive) then
    local SellCount, IsNeedRefreshAll, bIsIgnore = 0, false, false
    if "ModBulkSale" == OpAction and self.CurTabId == BagCommon.ItemTypeToTabId.Mod then
      local DecomposeSuccStuff, DecomposeModSucc = ...
      for i, v in ipairs(DecomposeModSucc) do
        local StuffUnitId = v
        local StuffServerData = self:GetStuffServerData(StuffUnitId, BagCommon.StuffType.Mod)
        if nil == StuffServerData or "number" == type(StuffServerData.Count) and StuffServerData.Count <= 0 then
          local NeedRemoveObj = self.DesireSaleStuffObjList[StuffUnitId]
          if NeedRemoveObj then
            self.List_Item:RemoveItem(NeedRemoveObj)
            SellCount = SellCount + 1
          else
            IsNeedRefreshAll = true
          end
        else
          local NeedUpdateObj = self.DesireSaleStuffObjList[StuffUnitId]
          if NeedUpdateObj then
            NeedUpdateObj.Count = StuffServerData.Count
            if NeedUpdateObj.SelfWidget then
              NeedUpdateObj.SelfWidget:SetCount(StuffServerData.Count)
              NeedUpdateObj.SelfWidget:SetName(StuffServerData.Count)
            end
          end
        end
      end
    elseif "ResourceBulkSale" == OpAction then
      local SaleItemSucc, SaleItemFail = ...
      for k, v in pairs(SaleItemSucc) do
        local StuffUnitId = k
        local StuffServerData = self:GetStuffServerData(StuffUnitId, BagCommon.StuffType.Resource)
        if StuffServerData then
          local StuffConfigData = StuffServerData:Data()
          if StuffConfigData.MaterialClassify ~= self.CurTabId then
            bIsIgnore = true
            break
          end
        end
        if nil == StuffServerData or "number" == type(StuffServerData.Count) and StuffServerData.Count <= 0 then
          local NeedRemoveObj = self.DesireSaleStuffObjList[tostring(StuffUnitId)]
          if NeedRemoveObj then
            self.List_Item:RemoveItem(NeedRemoveObj)
            SellCount = SellCount + 1
          else
            IsNeedRefreshAll = true
          end
        else
          local NeedUpdateObj = self.DesireSaleStuffObjList[tostring(StuffUnitId)]
          if NeedUpdateObj then
            NeedUpdateObj.Count = StuffServerData.Count
            if NeedUpdateObj.SelfWidget then
              NeedUpdateObj.SelfWidget:SetCount(StuffServerData.Count)
            end
          end
        end
      end
    elseif "FishResourceBulkSale" == OpAction then
      local SaleFishResources, SaleFishPrice = ...
      local Avatar = GWorld:GetAvatar()
      for ResourceId, FishInfos in pairs(SaleFishResources) do
        if type(FishInfos) ~= "table" then
          break
        end
        local StuffServerData = self:GetStuffServerData(ResourceId, BagCommon.StuffType.Resource)
        if StuffServerData then
          local StuffConfigData = StuffServerData:Data()
          if StuffConfigData.MaterialClassify ~= self.CurTabId then
            bIsIgnore = true
            break
          end
        end
        local PlayerBagFish = Avatar.FishSizes[ResourceId]
        for _, FishInfo in ipairs(FishInfos) do
          local FishCount
          if PlayerBagFish and PlayerBagFish.FishSize2Count then
            FishCount = PlayerBagFish.FishSize2Count[FishInfo.Size]
          end
          local FishStuffId = ResourceId .. "_" .. FishInfo.Size
          local FishSaleStuffObj = self.DesireSaleStuffObjList[FishStuffId]
          if nil == FishCount or type(FishCount) == "number" and 0 == FishCount then
            if FishSaleStuffObj then
              self.List_Item:RemoveItem(FishSaleStuffObj)
              SellCount = SellCount + 1
            else
              IsNeedRefreshAll = true
            end
          elseif FishSaleStuffObj then
            FishSaleStuffObj.Count = FishCount
            if FishSaleStuffObj.SelfWidget then
              FishSaleStuffObj.SelfWidget:SetCount(FishCount)
            end
          end
        end
      end
    end
    if not bIsIgnore then
      if IsNeedRefreshAll then
        self:ReGenerateBagList()
      else
        for i = 1, SellCount do
          local EmptyStuffObj = StuffIconObject:CreateBagItemContent({
            Uuid = "",
            StuffType = "EmptyGrid",
            StuffCount = 0,
            StuffIcon = nil,
            ParentWidget = self
          })
          self.List_Item:AddItem(EmptyStuffObj)
          self.List_Item:AddEmptyGridItemCount(1)
        end
        self.NeedSelectGridIndex = 0
        self:JumpToSelectItem(false)
        self:RefreshAllGridIndex()
      end
    end
    self.Tab_Bag:UpdateResource()
  elseif "ReceiveStuffItem" == OpAction then
    local GetItemStuffId, GetItemCount, PackRewards = ...
    local AllItemCount = self.List_Item:GetNumItems()
    for i = 0, AllItemCount - 1 do
      local ItemObj = self.List_Item:GetItemAt(i)
      if ItemObj and ItemObj.StuffId == GetItemStuffId then
        local StuffServerData = self:GetStuffServerData(ItemObj.Uuid, BagCommon.StuffType.Resource)
        ItemObj.Count = StuffServerData.Count
        if ItemObj.SelfWidget then
          ItemObj.SelfWidget:SetCount(StuffServerData.Count)
        end
      end
    end
    if self.Panel_Detail:IsVisible() then
      self.Panel_Detail:UpdateItemNumber()
    end
  elseif "UseStuffItem" == OpAction then
    local GetItemStuffId = (...)
    local AllItemCount, IsNeedRemoveItem = self.List_Item:GetNumItems(), false
    for i = 0, AllItemCount - 1 do
      local ItemObj = self.List_Item:GetItemAt(i)
      if ItemObj and ItemObj.StuffId == GetItemStuffId then
        local StuffServerData = self:GetStuffServerData(ItemObj.Uuid, BagCommon.StuffType.Resource)
        if StuffServerData then
          ItemObj.Count = StuffServerData.Count
          if ItemObj.SelfWidget then
            ItemObj.SelfWidget:SetCount(StuffServerData.Count)
          end
        else
          IsNeedRemoveItem = true
          self.List_Item:RemoveItem(ItemObj)
        end
      end
    end
    if IsNeedRemoveItem then
      self.NeedSelectGridIndex = 0
      self:JumpToSelectItem(false)
      self:RefreshAllGridIndex()
    elseif self.Panel_Detail:IsVisible() then
      self.Panel_Detail:UpdateItemNumber()
    end
  end
end

return M
