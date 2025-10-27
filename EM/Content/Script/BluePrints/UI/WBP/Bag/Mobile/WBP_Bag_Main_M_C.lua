require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local EMCache = require("EMCache.EMCache")
local StuffIconObject = require("BluePrints.UI.WBP.Bag.Widget.BagStuffIconObject")
local BagCommon = require("BluePrints.UI.WBP.Bag.BagCommon")
local WBP_Bag_Main_M_C = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.UI.WBP.Bag.BagBase"
})
WBP_Bag_Main_M_C._components = {
  "BluePrints.UI.UIComponent.CoroutineComponent",
  "BluePrints.UI.UI_PC.Common.LSFocusComp",
  "BluePrints.UI.WBP.Bag.Widget.BagMainPageView",
  "BluePrints.UI.UI_PC.Common.HorizontalListViewResizeComp"
}

function WBP_Bag_Main_M_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.OwnerPlayer = nil
  self.NpcId = BagCommon.NpcId
  self.NeedSelectStuffId = nil
  self.NeedSelectGridIndex = -1
  self.CurTabId = nil
  self.IsNeedPlayNpcAnim = true
  self.BagCurState = BagCommon.AllBagState.NormalState
  self.LoadMode = "FrameBlocking"
  self.ElmtTypes, self.Filters2 = UIUtils.GetAllElementTypes()
  self.IsLoadCompleted = false
  self.DesireSaleStuffObjList = {}
  self.DesireResolveWeaponList = {}
  self.AllTabInfo = {}
  self.CurSelectGridIndex = 1
  self.CurSelectStuffContent = nil
  self.CurFocusWidget = nil
end

function WBP_Bag_Main_M_C:Construct()
  self.Super.Construct(self)
  self:InitMultiSelectWidget()
end

function WBP_Bag_Main_M_C:OnFocusReceived(MyGeometry, InFocusEvent)
  self:RefreshBottomKeyInfo()
  return WBP_Bag_Main_M_C.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function WBP_Bag_Main_M_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", BagCommon.MainUIName, nil)
  self.CurTabId, self.NeedSelectStuffId, self.OwnerPlayer = ...
  self.OpenKey = CommonUtils:GetActionMappingKeyName("OpenBag")
  self.CurPlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
  if self.OwnerPlayer == nil or not UE4.UKismetSystemLibrary.IsValid(self.OwnerPlayer) then
    self.OwnerPlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  end
  if self.LoadMode == "FrameBlocking" then
    self:InitCoroutine(true)
  end
  self:SwitchToNpcCamera(true)
  self:PlayInAnim()
end

function WBP_Bag_Main_M_C:ReceiveEnterState(StackAction)
  self.Super.ReceiveEnterState(self, StackAction)
  if 1 == StackAction then
    self:UpdatePageInfoFromStackAction()
  end
end

function WBP_Bag_Main_M_C:ReceiveExitState(StackAction)
  self.Super.ReceiveExitState(self, StackAction)
  if 0 == StackAction then
    local SellPageMainUI = UIManager(self):GetUI(BagCommon.BagStuffSelectUIName)
    if nil ~= SellPageMainUI then
      SellPageMainUI:PlayOutAnim()
    end
  end
end

function WBP_Bag_Main_M_C:SwitchToNpcCamera(bNpcCamera)
  if bNpcCamera then
    UIManager(self):SwitchUINpcCamera(bNpcCamera, BagCommon.MainUIName, self.NpcId, {
      IsHaveInOutAnim = self.IsNeedPlayNpcAnim
    })
  else
    UIManager(self):SwitchUINpcCamera(bNpcCamera, BagCommon.MainUIName, self.NpcId, {
      bDestroyNpc = true,
      IsHaveInOutAnim = self.IsNeedPlayNpcAnim
    })
  end
end

function WBP_Bag_Main_M_C:Close()
  EMCache:Set(BagCommon.BagCacheDataName, self.CurTabId, true)
  local SellPageMainUI = UIManager(self):GetUIObj(BagCommon.BagStuffSelectUIName)
  if nil ~= SellPageMainUI then
    SellPageMainUI:Close()
  end
  self.List_Item:ClearListItems()
  self:CleanCoroutine()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if IsValid(PlayerCharacter) and PlayerCharacter.IsInAir then
    self.IsNeedPlayNpcAnim = false
  end
  self:SwitchToNpcCamera()
  self.Super.Close(self)
end

function WBP_Bag_Main_M_C:Destruct()
  self:HorizontalListViewResize_TearDown()
  self.Super.Destruct(self)
  if self.GoToArmoryWhenClose then
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    if PlayerCharacter:CanEnterInteractive() then
      UIManager(self):LoadUINew("ArmoryMain")
    end
  end
end

function WBP_Bag_Main_M_C:Tick(MyGeometry, InDeltaTime)
  self.Overridden.Tick(self, MyGeometry, InDeltaTime)
  if self.LoadMode ~= "FrameBlocking" or self.IsLoadCompleted == true then
    return
  end
  self.IsLoadCompleted = self:StartCoroutine()
end

function WBP_Bag_Main_M_C:GetStuffServerData(StuffUnitId, StuffType, FishInfo)
  local PlayerAvatar = GWorld:GetAvatar()
  local StuffServerData
  if nil == PlayerAvatar then
    return StuffServerData
  end
  if StuffType == BagCommon.StuffType.Weapon then
    StuffUnitId = self:GetStuffObjId(StuffUnitId)
    StuffServerData = PlayerAvatar.Weapons[StuffUnitId]
  elseif StuffType == BagCommon.StuffType.Mod then
    StuffUnitId = self:GetStuffObjId(StuffUnitId)
    StuffServerData = PlayerAvatar.Mods[StuffUnitId]
  elseif StuffType == BagCommon.StuffType.Resource then
    if type(StuffUnitId) == "string" then
      if string.find(StuffUnitId, "_") then
        local StuffUnitIdList = Split(StuffUnitId, "_")
        StuffUnitId = math.tointeger(StuffUnitIdList[1])
      else
        StuffUnitId = math.tointeger(StuffUnitId)
      end
    end
    StuffServerData = PlayerAvatar.Resources[StuffUnitId]
    if FishInfo then
      local PlayerBagFish = PlayerAvatar.FishSizes[StuffUnitId]
      if PlayerBagFish and PlayerBagFish.FishSize2Count then
        local FishCount = PlayerBagFish.FishSize2Count[FishInfo.Size]
        StuffServerData.Count = FishCount
        StuffServerData.FishInfo = {
          Size = FishInfo.Size,
          Count = FishCount
        }
      end
    end
  end
  return StuffServerData
end

function WBP_Bag_Main_M_C:InitTabInfo()
  for key, BagTabData in pairs(DataMgr.BagTab) do
    table.insert(self.AllTabInfo, {
      Text = GText(BagTabData.TabName),
      IconPath = BagTabData.Icon,
      TabId = key,
      SortId = BagTabData.Sequence,
      ItemDefaultCapcity = BagTabData.TabDefaultSlot
    })
  end
  self.Tab_Bag:Init({
    Tabs = self.AllTabInfo,
    DynamicNode = {
      "ResourceBar"
    },
    StyleName = "Image",
    OwnerPanel = self,
    TitleName = GText("MAIN_UI_BAG"),
    BackCallback = self.OnReturnKeyDown
  })
  self.Tab_Bag:BindEventOnTabSelected(self, self.TabBagItemClick)
  self.AllStuffData = {}
  self.FilteredStuffData = {}
  self:AddDelayFrameFunc(function()
    local BagSelectTabId = self.CurTabId
    if nil == BagSelectTabId then
      BagSelectTabId = EMCache:Get(BagCommon.BagCacheDataName, true)
    end
    if self.BagCurState == BagCommon.AllBagState.NormalState then
      if nil ~= BagSelectTabId then
        self.Tab_Bag:SelectTabById(BagSelectTabId)
      else
        self.Tab_Bag:SelectTabById(BagCommon.DefaultSelectTabId)
      end
    end
  end, 2, "BagInitTabInfo")
end

function WBP_Bag_Main_M_C:OnSiftSelectionsChanged(SelectedItems, ItemDatas)
  self.SelectedSiftItems = SelectedItems
  self.SiftItemDatas = ItemDatas
  self:RefreshStuffListItem(true)
end

function WBP_Bag_Main_M_C:FillPlayerDataByTypeInFrame(TabId, NeedDelayJump)
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    DebugPrint("Avatar is nil, Not Connect to Server")
    return
  end
  local PlayerStuffs, AllWeaponCount = nil, 0
  self.NeedSelectGridIndex = -1
  if TabId == BagCommon.ItemTypeToTabId.MeleeWeapon or TabId == BagCommon.ItemTypeToTabId.RangedWeapon then
    PlayerStuffs = Avatar.Weapons
  elseif TabId == BagCommon.ItemTypeToTabId.Mod then
    PlayerStuffs = Avatar.Mods
  else
    PlayerStuffs = Avatar.Resources
  end
  if nil ~= PlayerStuffs then
    local ReasultStuffData, IsMultiData = {}, false
    for Id, StuffServerData in pairs(PlayerStuffs) do
      local StuffData
      if TabId == BagCommon.ItemTypeToTabId.MeleeWeapon or TabId == BagCommon.ItemTypeToTabId.RangedWeapon then
        AllWeaponCount = AllWeaponCount + 1
        if TabId == BagCommon.ItemTypeToTabId.MeleeWeapon and StuffServerData:HasTag("Melee") or TabId == BagCommon.ItemTypeToTabId.RangedWeapon and StuffServerData:HasTag("Ranged") then
          StuffData = StuffIconObject:GetWeaponStuffData(StuffServerData, self, self.OnListSelectStuffClicked)
        end
        if nil ~= StuffData then
          StuffData.IsEquipped = self:GetIsStuffIsEquiped(StuffData)
        end
      elseif TabId == BagCommon.ItemTypeToTabId.Mod then
        StuffData = StuffIconObject:GetModStuffData(StuffServerData, self, self.OnListSelectStuffClicked)
        if nil ~= StuffData then
          StuffData.IsEquipped = self:GetIsStuffIsEquiped(StuffData)
        end
      else
        local StuffConfigData = StuffServerData:Data()
        if StuffConfigData and StuffConfigData.MaterialClassify == TabId then
          if TabId == BagCommon.ItemTypeToTabId.FishItem then
            IsMultiData = true
            local PlayerBagFish = Avatar.FishSizes[StuffConfigData.ResourceId]
            if PlayerBagFish and PlayerBagFish.FishSize2Count then
              StuffData = {}
              IsMultiData = true
              for key, value in pairs(PlayerBagFish.FishSize2Count) do
                StuffServerData.FishInfo = {Size = key, Count = value}
                local TempStuffData = StuffIconObject:GetItemStuffData(StuffServerData, self, self.OnListSelectStuffClicked)
                table.insert(StuffData, TempStuffData)
              end
            else
              IsMultiData = false
              StuffData = StuffIconObject:GetItemStuffData(StuffServerData, self, self.OnListSelectStuffClicked)
            end
          else
            IsMultiData = false
            StuffData = StuffIconObject:GetItemStuffData(StuffServerData, self, self.OnListSelectStuffClicked)
          end
        end
      end
      if nil ~= StuffData then
        if IsMultiData then
          for index, value in ipairs(StuffData) do
            table.insert(ReasultStuffData, value)
          end
        else
          table.insert(ReasultStuffData, StuffData)
        end
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
      local ListViewSize = UIManager(self):GetWidgetRenderSize(self.OverLay_List)
      local EmptyGridCount, RowCount, ColCount = self:RefreshListViewEmptyGrid(self.List_Item, #FinalStuffData, ListViewSize)
      local bNeedShowWarningDialog = AllWeaponCount >= BagCommon.MaxWeaponCount
      self:AddCompletedCallback(self.OnFrameLoadCompleted, self, false, RowCount * ColCount, bNeedShowWarningDialog)
      for Index = 1, EmptyGridCount do
        table.insert(FinalStuffData, {
          Uuid = "",
          StuffType = "EmptyGrid",
          StuffCount = 0,
          StuffIcon = nil,
          ParentWidget = self
        })
      end
      for i, OrderStuffData in ipairs(FinalStuffData) do
        if self.CurTabId == TabId then
          if self.BagCurState == BagCommon.AllBagState.ChooseSaleState then
            OrderStuffData.IsSelect = false
          elseif nil ~= self.NeedSelectStuffId then
            OrderStuffData.IsSelect = OrderStuffData.Uuid == self.NeedSelectStuffId
          end
          if OrderStuffData.IsSelect then
            self.NeedSelectGridIndex = math.max(i - 1, 0)
          end
          OrderStuffData.GridIndex = i
          OrderStuffData.AnimNameWithCreate = i <= RowCount * ColCount and "In_OnlyOpacity" or nil
          local StuffObj = StuffIconObject:CreateBagItemContent(OrderStuffData)
          self.List_Item:AddItem(StuffObj)
          if 0 == i % 11 then
            coroutine.yield()
          end
        end
      end
      if EmptyGridCount <= 0 then
        EmptyGridCount = self:GetEmptyItemCountInLastLine(self.List_Item, #FinalStuffData)
        for Index = 1, EmptyGridCount do
          local EmptyStuffData = {
            Uuid = "",
            StuffType = "EmptyGrid",
            StuffCount = 0,
            StuffIcon = nil,
            ParentWidget = self
          }
          EmptyStuffData.IsSelect = false
          EmptyStuffData.GridIndex = Index + #FinalStuffData
          EmptyStuffData.AnimNameWithCreate = nil
          local StuffObj = StuffIconObject:CreateBagItemContent(EmptyStuffData)
          self.List_Item:AddItem(StuffObj)
        end
      end
    else
      self:JumpToSelectItem(NeedDelayJump)
    end
  end
end

function WBP_Bag_Main_M_C:OnFrameLoadCompleted(NeedDelayJump, AnimGridCount, bNeedShowWarningDialog)
  local AllItemCount = self.List_Item:GetNumItems()
  for i = 0, AllItemCount - 1 do
    if AnimGridCount < i then
      break
    end
    local ItemObj = self.List_Item:GetItemAt(i)
    if ItemObj then
      ItemObj.AnimNameWithCreate = false
    end
  end
  self.OverLay_List:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  UIUtils.GetTileViewContentMaxCount(self.List_Item)
  self:JumpToSelectItem(NeedDelayJump)
  self.NeedSelectStuffId = nil
  if bNeedShowWarningDialog then
    local LastWeaponTooMoreWarningTimeStamp = EMCache:Get(BagCommon.LastWeaponTooMoreWarningTimeStamp, true)
    if LastWeaponTooMoreWarningTimeStamp and LastWeaponTooMoreWarningTimeStamp > TimeUtils.TimestampLastClock(0) then
      self:SetFocus_Lua()
    else
      local CommonDialog = UIManager(self):GetUIObj("CommonDialog")
      if nil == CommonDialog then
        local ConfirmParams = {}
        
        function ConfirmParams.RightCallbackFunction(_, Data)
          local NowTime = TimeUtils.NowTime()
          EMCache:Set(BagCommon.LastWeaponTooMoreWarningTimeStamp, NowTime, true)
        end
        
        self.List_Item:BP_CancelScrollIntoView()
        UIManager(self):ShowCommonPopupUI(100227, ConfirmParams, self)
      else
        self:SetFocus_Lua()
      end
    end
  else
    self:SetFocus_Lua()
  end
end

function WBP_Bag_Main_M_C:RefreshDetail(GridIndex, StuffUuid)
  if -1 == GridIndex or self.CurSelectStuffContent == nil then
    self.List_Item:BP_ClearSelection()
    self.Panel_Detail:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  local StuffServerData
  if self.CurTabId == BagCommon.ItemTypeToTabId.MeleeWeapon or self.CurTabId == BagCommon.ItemTypeToTabId.RangedWeapon then
    StuffServerData = self:GetStuffServerData(StuffUuid, BagCommon.StuffType.Weapon)
  elseif self.CurTabId == BagCommon.ItemTypeToTabId.Mod then
    StuffServerData = self:GetStuffServerData(StuffUuid, BagCommon.StuffType.Mod)
  else
    StuffServerData = self:GetStuffServerData(StuffUuid, BagCommon.StuffType.Resource, self.CurSelectStuffContent.FishInfo)
  end
  if nil == StuffServerData then
    DebugPrint("WBP_Bag_Main_M_C== RefreshDetail Error, StuffServerData is nil, StuffUuid is ", StuffUuid)
    return
  end
  local StuffConfigData = StuffServerData:Data()
  local DetailPanelAnim = "Refresh"
  if not self.Panel_Detail:IsVisible() then
    DetailPanelAnim = "In"
  end
  self.Panel_Detail:RefreshInfoByData(self.CurSelectStuffContent, StuffServerData, StuffConfigData, self, DetailPanelAnim)
  self:RefreshDetailView(StuffConfigData)
end

function WBP_Bag_Main_M_C:EnterStuffSellState()
  if not self.Button_Sell:IsVisible() then
    DebugPrint("WBP_Bag_Main_P_C===EnterStuffSellState not Success, Because Button_Sell is not Visible!!")
    return
  end
  local TitleName = GText("UI_BAG_Sell")
  if self.CurTabId == BagCommon.ItemTypeToTabId.Mod then
    TitleName = GText("UI_Bag_ModExtract")
    self.HB_Check:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self:StartMultiSelectWidget()
  elseif self.CurTabId == BagCommon.ItemTypeToTabId.FishItem then
    self.HB_Check:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self:StartMultiSelectWidget()
  end
  self.Tab_Bag:EnterViewSingleMode(TitleName)
  self.BagCurState = BagCommon.AllBagState.ChooseSaleState
  self.DesireSaleStuffObjList = {}
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil ~= UIManager then
    local SelectStuffDatas
    if self.CurSelectStuffContent then
      if self:CheckIsCanAddToSaleList(self.CurSelectStuffContent, false) then
        local StuffUuid = self.CurSelectStuffContent.Uuid
        local StuffServerData = self:GetStuffServerData(StuffUuid, self.CurSelectStuffContent.StuffType, self.CurSelectStuffContent.FishInfo)
        if self.CurTabId == BagCommon.ItemTypeToTabId.Mod then
          SelectStuffDatas = StuffIconObject:GetModStuffData(StuffServerData, nil, "ClickChooseStuff")
        else
          if self.CurSelectStuffContent.FishInfo then
            StuffServerData.FishInfo = self.CurSelectStuffContent.FishInfo
          end
          SelectStuffDatas = StuffIconObject:GetItemStuffData(StuffServerData, nil, "ClickChooseStuff")
        end
        local StuffStateTagInfo = {
          Name = "IsToChoose",
          ExtraData = {
            1,
            SelectStuffDatas.StuffCount,
            SelectStuffDatas.Price,
            SelectStuffDatas.CoinId,
            self.RemoveBagItemInList
          }
        }
        self.CurSelectStuffContent.StateTagInfo = StuffStateTagInfo
        if self.CurSelectStuffContent.SelfWidget then
          self.CurSelectStuffContent.SelfWidget:SetStuffStyleByStateTag(self.CurSelectStuffContent)
        end
        self.DesireSaleStuffObjList[StuffUuid] = self.CurSelectStuffContent
      elseif self.CurSelectStuffContent.SelfWidget then
        self.CurSelectStuffContent.SelfWidget:SetSelected(false)
      else
        self.CurSelectStuffContent.IsSelect = false
      end
    end
    if self:IsAnimationPlaying(self.Sell_Close) then
      self:StopAnimation(self.Sell_Close)
    end
    self:PlayAnimation(self.Sell)
    UIManager:LoadUI(UIConst.BAGSTUFFSALESELECTMOBILE, BagCommon.BagStuffSelectUIName, BagCommon.BagSellPageZOrder, self, self.LeaveStuffSellState, self.RemoveItemSaleState, self.RealToSaleItems, SelectStuffDatas, BagCommon.BagItemSelectOpMode.SellMode)
  end
  self:CancelStuffClickAndHideDetail()
  self:UpdateAllItemsStyle(false)
end

function WBP_Bag_Main_M_C:LeaveStuffSellState()
  self.Tab_Bag:LeaveViewSingleMode()
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self:ResetMultiSelectWidget()
  self.BagCurState = BagCommon.AllBagState.NormalState
  self:RecoverAllItemsStyle()
  self:CancelStuffClickAndHideDetail()
  self:SetFocus_Lua()
  if self:IsAnimationPlaying(self.Sell) then
    self:StopAnimation(self.Sell)
  end
  self:PlayAnimation(self.Sell_Close)
end

function WBP_Bag_Main_M_C:RealToSaleItems(AllStuffContentList, AllStuffSellInfo)
  self:RecoverAllItemsStyle()
  local PlayerAvatar = GWorld:GetAvatar()
  local ModList, ResourceList = {}, {}
  local IntegerUuid
  for k, v in pairs(AllStuffContentList) do
    local StuffUuid = self:GetStuffObjId(v.Uuid)
    if v.StuffType == BagCommon.StuffType.Mod then
      ModList[StuffUuid] = {
        Count = AllStuffSellInfo[k],
        CurrentModCount = v.Count
      }
    elseif v.StuffType == BagCommon.StuffType.Resource then
      IntegerUuid = v.UnitId
      if BagCommon:IsFishResource(IntegerUuid) then
        ResourceList[IntegerUuid] = ResourceList[IntegerUuid] or {}
        table.insert(ResourceList[IntegerUuid], {
          Count = AllStuffSellInfo[k],
          Size = v.FishInfo.Size
        })
      else
        ResourceList[IntegerUuid] = {
          Count = AllStuffSellInfo[k],
          CurrentResourceCount = v.Count
        }
      end
    end
  end
  if not IsEmptyTable(ModList) then
    PlayerAvatar:ModBulkDecompose(ModList)
  end
  if not IsEmptyTable(ResourceList) then
    if BagCommon:IsFishResource(IntegerUuid) then
      PlayerAvatar:ResourceBulkSaleFish(ResourceList)
    else
      PlayerAvatar:ResourceBulkSale(ResourceList)
    end
  end
end

function WBP_Bag_Main_M_C:EnterWeaponResolveState()
  if not self.Button_Sell:IsVisible() then
    DebugPrint("WBP_Bag_Main_P_C===EnterWeaponResolveState not Success, Because Button_Sell is not Visible!!")
    return
  end
  self.Tab_Bag:EnterViewSingleMode(GText("UI_Bag_Decompose"))
  self.HB_Check:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  self:StartMultiSelectWidget()
  self.BagCurState = BagCommon.AllBagState.WeaponResolveState
  self.DesireResolveWeaponList = {}
  local SelectStuffDatas
  if self.CurSelectStuffContent then
    if self:CheckIsCanAddToSaleList(self.CurSelectStuffContent, false) then
      local StuffUuid = self.CurSelectStuffContent.Uuid
      local StuffServerData = self:GetStuffServerData(StuffUuid, self.CurSelectStuffContent.StuffType)
      SelectStuffDatas = StuffIconObject:GetWeaponStuffData(StuffServerData, nil, "ClickChooseStuff")
      
      local function RemoveWeaponCallback()
        EventManager:FireEvent(EventID.OnRemoveBagItemInList, StuffUuid)
      end
      
      local StuffStateTagInfo = {
        Name = "IsToChoose",
        ExtraData = {
          1,
          SelectStuffDatas.StuffCount,
          SelectStuffDatas.Price,
          SelectStuffDatas.CoinId,
          RemoveWeaponCallback
        }
      }
      self.CurSelectStuffContent.StateTagInfo = StuffStateTagInfo
      if self.CurSelectStuffContent.SelfWidget then
        self.CurSelectStuffContent.SelfWidget:SetStuffStyleByStateTag(self.CurSelectStuffContent)
      end
      self.DesireResolveWeaponList[StuffUuid] = self.CurSelectStuffContent
    elseif self.CurSelectStuffContent.SelfWidget then
      self.CurSelectStuffContent.SelfWidget:SetSelected(false)
    else
      self.CurSelectStuffContent.IsSelect = false
    end
  end
  self:CancelStuffClickAndHideDetail()
  if self:IsAnimationPlaying(self.Sell_Close) then
    self:StopAnimation(self.Sell_Close)
  end
  self:PlayAnimation(self.Sell)
  UIManager(self):LoadUI(UIConst.BAGSTUFFSALESELECTMOBILE, BagCommon.BagStuffSelectUIName, BagCommon.BagSellPageZOrder, self, self.LeaveWeaponResolveState, self.RemoveWeaponResolveState, self.RealToResolveWeapon, SelectStuffDatas, BagCommon.BagItemSelectOpMode.ResolveMode)
  self:UpdateAllItemsStyle(false)
end

function WBP_Bag_Main_M_C:LeaveWeaponResolveState()
  self.Tab_Bag:LeaveViewSingleMode()
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  self:ResetMultiSelectWidget()
  self.BagCurState = BagCommon.AllBagState.NormalState
  self.DesireResolveWeaponList = {}
  self:RecoverAllItemsStyle()
  self:CancelStuffClickAndHideDetail()
  self:SetFocus_Lua()
  if self:IsAnimationPlaying(self.Sell) then
    self:StopAnimation(self.Sell)
  end
  self:PlayAnimation(self.Sell_Close)
end

function WBP_Bag_Main_M_C:RealToResolveWeapon(AllWeaponContentList)
  self:RecoverAllItemsStyle()
  local PlayerAvatar = GWorld:GetAvatar()
  local AllWeaponUuid = {}
  for k, v in pairs(AllWeaponContentList) do
    local WeaponUuid = self:GetStuffObjId(v.Uuid)
    table.insert(AllWeaponUuid, WeaponUuid)
  end
  PlayerAvatar:WeaponBulkBreakDown(AllWeaponUuid)
end

function WBP_Bag_Main_M_C:UpdateNpcDialogue(DialogueId)
  if nil == DialogueId then
    self.Panel_Dialogue:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    local DialogueInfo = DataMgr.NPCDialogue[DialogueId]
    if nil ~= DialogueInfo then
      self.Text_Dialogue:SetText(GText(DialogueInfo.Content))
      self.Panel_Dialogue:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Panel_Dialogue:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function WBP_Bag_Main_M_C:RefreshBottomKeyInfo(FocusTypeName)
  FocusTypeName = FocusTypeName or "DefaultWidget"
  if self.CurFocusWidget == FocusTypeName then
    return
  end
  self.CurFocusWidget = FocusTypeName
end

function WBP_Bag_Main_M_C:UpdateUIStyleInPlatform(IsUseGamePad)
end

function WBP_Bag_Main_M_C:TabBagItemClick(TabWidget)
  local TabId = TabWidget:GetTabId()
  self.CurTabId = TabId
  self.Sift:Close()
  self.SiftModelId = BagCommon.SiftModelIds[self.CurTabId]
  if self.Sift then
    self.Sift:SetSiftModelId(self.SiftModelId)
  end
  if self.CurTabId ~= BagCommon.ItemTypeToTabId.MeleeWeapon and self.CurTabId ~= BagCommon.ItemTypeToTabId.RangedWeapon and self.CurTabId ~= BagCommon.ItemTypeToTabId.Mod and self.CurTabId ~= BagCommon.ItemTypeToTabId.Resource then
    self.Sift:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Sift:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.Button_Sell:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Filter:Init(self, BagCommon.SortFilters[self.CurTabId or BagCommon.ItemTypeToTabId.Resource], CommonConst.DESC)
  self.Panel_Detail:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.OverLay_List:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  self:FillWithListViewData(TabId, true)
end

function WBP_Bag_Main_M_C:OnListSelectStuffClicked(Content)
  if Content.Type == "EmptyGrid" then
    return
  end
  local GridIndex, StuffUuid, AddNum = Content.GridIndex, Content.Uuid, Content.AddNum
  self:ClickChooseStuff(GridIndex, StuffUuid, AddNum)
end

function WBP_Bag_Main_M_C:ClickChooseStuff(GridIndex, StuffUuid, AddNum)
  if self.BagCurState == BagCommon.AllBagState.NormalState and IsValid(self.CurSelectStuffContent) and self.CurSelectStuffContent.Uuid == StuffUuid then
    return
  end
  self.CurSelectGridIndex = GridIndex
  if IsValid(self.CurSelectStuffContent) then
    if self.CurSelectStuffContent.SelfWidget then
      self.CurSelectStuffContent.SelfWidget:SetSelected(false)
    else
      self.CurSelectStuffContent.IsSelect = false
    end
  end
  self.CurSelectStuffContent = self.List_Item:GetItemAt(math.max(GridIndex - 1, 0))
  if self.CurSelectStuffContent and self.CurSelectStuffContent.SelfWidget then
    self.CurSelectStuffContent.SelfWidget:SetSelected(true)
  end
  self:RefreshDetail(GridIndex, StuffUuid)
  self:RefreshSaleItemSelect(StuffUuid, GridIndex, AddNum)
  self:RefreshResolveWeaponSelect(StuffUuid, GridIndex)
end

function WBP_Bag_Main_M_C:CancelStuffClickAndHideDetail()
  self.CurSelectStuffContent = nil
  self:RefreshDetail(-1, nil)
  self.Panel_Detail.Panel_Button:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Bag_Main_M_C:OnKeyDown(MyGeometry, InKeyEvent)
  if CommonUtils:IfExistSystemGuideUI(self) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadButtonDown(InKeyName)
  elseif InKeyName == self.OpenKey then
    IsEventHandled = true
    self:OnTryToCloseMainPage()
  else
    IsEventHandled = self.Tab_Bag:Handle_KeyEventOnTouch(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Bag_Main_M_C:OnGamePadButtonDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    IsEventHandled = self:Handle_KeyDownOnGamePad()
  else
    IsEventHandled = self.Tab_Bag:Handle_KeyEventOnGamePad(InKeyName)
  end
  return IsEventHandled
end

function WBP_Bag_Main_M_C:Handle_KeyDownOnGamePad()
  return true
end

function WBP_Bag_Main_M_C:OnReturnKeyDown()
  local SellPageMainUI = UIManager(self):GetUI(BagCommon.BagStuffSelectUIName)
  if nil ~= SellPageMainUI then
    SellPageMainUI:PlayOutAnim()
    return
  end
  if self:CheckIsCanCloseSelf() then
    self:PlayOutAnim()
  end
end

function WBP_Bag_Main_M_C:OnTryToCloseMainPage()
  local SellPageMainUI = UIManager(self):GetUI(BagCommon.BagStuffSelectUIName)
  if nil ~= SellPageMainUI then
    return
  end
  if self:CheckIsCanCloseSelf() then
    self:PlayOutAnim()
  end
end

AssembleComponents(WBP_Bag_Main_M_C)
return WBP_Bag_Main_M_C
