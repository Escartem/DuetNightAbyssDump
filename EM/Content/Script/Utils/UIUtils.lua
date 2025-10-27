require("UnLua")
local EMCache = require("EMCache.EMCache")
local StrLib = require("BluePrints.Common.DataStructure")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local TimeUtils = require("Utils.TimeUtils")
local RewardBox = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local SkillUtils = require("Utils.SkillUtils")
local Utils = require("Utils")
local MiscUtils = require("Utils.MiscUtils")
local BagCommon = require("BluePrints.UI.WBP.Bag.BagCommon")
local Deque = StrLib.Deque
local UIUtils = Class()
UIUtils._components = {
  "BluePrints.Combat.Components.UIHitFeedbackComponent"
}
UIUtils.Handled = UE4.UWidgetBlueprintLibrary.Handled()
UIUtils.Handle = UIUtils.Handled
UIUtils.Unhandled = UE4.UWidgetBlueprintLibrary.Unhandled()

function UIUtils.ShowGotItemTipsUI(TableTypeName, ItemId, ItemCount, AdditionalParam)
  local ItemData = DataMgr[TableTypeName][ItemId]
  if not ItemData or not ItemData.Icon then
    return
  end
  local GameInstance = GWorld.GameInstance
  local Player = UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local UIManager = GameInstance:GetGameUIManager()
  local PickUpCache = EMCache:Get("PickUp", true) or {}
  local IsSpecialReward = false
  if "Pet" == TableTypeName then
    IsSpecialReward = true
  end
  if ("Resource" == TableTypeName or "Mod" == TableTypeName) and ItemData.Type ~= "Ordinary" then
    IsSpecialReward = true
  end
  if ItemData.UseEffectType ~= "GetResource" and ItemData.UseEffectType ~= "GetWeapon" and ItemData.UseEffectType ~= "GetMod" or "Pet" == TableTypeName then
    local BattleMain = UIManager:GetUIObj("BattleMain")
    if not BattleMain then
      DebugPrint("ZDX BattleMain is nil")
      return
    end
    local PickUpUI
    local bNew = nil == PickUpCache[TableTypeName] or nil == PickUpCache[TableTypeName][ItemId]
    if bNew or IsSpecialReward then
      if BattleMain.Pos_SpecialDrops and not BattleMain.Pos_SpecialDrops:HasAnyChildren() then
        PickUpUI = UIManager:_CreateWidgetNew("BattleSpecialDrops")
        BattleMain.Pos_SpecialDrops:AddChildToOverlay(PickUpUI)
      elseif BattleMain.Pos_Drops then
        PickUpUI = BattleMain.Pos_SpecialDrops:GetChildAt(0)
      end
      if PickUpUI then
        if PickUpUI.bShowing and "Pet" ~= PickUpUI.ItemType and PickUpUI.ItemType == TableTypeName and PickUpUI.ItemId == ItemId then
          PickUpUI.ItemCount = PickUpUI.ItemCount + ItemCount
          PickUpUI.Text_Num:SetText(PickUpUI.ItemCount)
          return
        end
        if PickUpUI.ItemDataInfoDict[TableTypeName] and PickUpUI.ItemDataInfoDict[TableTypeName][ItemId] and not PickUpUI.ItemDataInfoDict[TableTypeName][ItemId].IsNew then
          PickUpUI.ItemDataInfoDict[TableTypeName][ItemId].ItemCount = PickUpUI.ItemDataInfoDict[TableTypeName][ItemId].ItemCount + ItemCount
        else
          PickUpUI.UITopTipsList:PushBack({ItemId = ItemId, ItemType = TableTypeName})
          if not PickUpUI.ItemDataInfoDict[TableTypeName] then
            PickUpUI.ItemDataInfoDict[TableTypeName] = {}
          end
          if not PickUpUI.ItemDataInfoDict[TableTypeName][ItemId] then
            PickUpUI.ItemDataInfoDict[TableTypeName][ItemId] = {
              ItemId = ItemId,
              ItemType = TableTypeName,
              ItemCount = ItemCount,
              IsNew = bNew,
              AdditionalParam = AdditionalParam
            }
          end
        end
      end
      if nil == PickUpCache[TableTypeName] then
        PickUpCache[TableTypeName] = {}
      end
      if nil == PickUpCache[TableTypeName][ItemId] then
        PickUpCache[TableTypeName][ItemId] = 1
        EMCache:Set("PickUp", PickUpCache, true)
      end
      PickUpUI:PopSpecialDropQueue()
    end
    if not IsSpecialReward and not bNew then
      BattleMain:SetSubSystemVisibility("Pos_Drops", ESlateVisibility.SelfHitTestInvisible)
      if BattleMain.Pos_Drops and not BattleMain.Pos_Drops:HasAnyChildren() then
        PickUpUI = UIManager:_CreateWidgetNew("BattleNormalDrops")
        BattleMain.Pos_Drops:AddChildToOverlay(PickUpUI)
      elseif BattleMain.Pos_Drops then
        PickUpUI = BattleMain.Pos_Drops:GetChildAt(0)
      end
      if PickUpUI then
        table.insert(PickUpUI.TickWaitingList, {
          ItemId = ItemId,
          ItemCount = ItemCount,
          TableName = TableTypeName
        })
        PickUpUI:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
    end
  end
end

function UIUtils.ShowHudReward(TitleText, RewardInfoList)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local RewardUI = UIManager:LoadUINew("CommonHudReward", TitleText, RewardInfoList)
  RewardUI:InitRewardInfo(TitleText, RewardInfoList)
  return RewardUI
end

function UIUtils.ShowHudRewardConvert(TitleText, Rewards)
  local List = {}
  for Types, Table in pairs(Rewards) do
    local Type = Types
    Type = string.match(Type, "^(.*)s$") or Type
    for Id, v in pairs(Table) do
      local Count = 0
      for SourceType, Num in pairs(v) do
        Count = Count + Num
      end
      table.insert(List, {
        ItemId = Id,
        ItemType = Type,
        Count = Count,
        Rarity = ItemUtils.GetItemRarity(Id, Type)
      })
    end
  end
  return UIUtils.ShowHudReward(TitleText, List)
end

function UIUtils.ShowGetItemPage(ItemType, ItemId, Count, PurchaseRewards, bSpecial, func, ParentWidget, IsReAttachFocusToPage, bOnlyItemPage)
  local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
  local Flow = FlowManager:CreateFlow("GetItemPage")
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  Flow.OnBegin:Add(Flow, function()
    local UIName = bSpecial and "GetItemPageSP" or "GetItemPage"
    UIUtils.ShowGetItemPageInternal(ItemType, ItemId, Count, PurchaseRewards, bSpecial, func, ParentWidget, IsReAttachFocusToPage, bOnlyItemPage)
    UIManager:AddFlow(UIName, Flow)
  end)
  FlowManager:AddFlow(Flow)
end

function UIUtils.ShowGetItemPageInternal(ItemType, ItemId, Count, PurchaseRewards, bSpecial, func, ParentWidget, IsReAttachFocusToPage, bOnlyItemPage)
  ItemType = ItemType or -1
  ItemId = ItemId or -1
  Count = Count or -1
  func = func or -1
  ParentWidget = ParentWidget or -1
  IsReAttachFocusToPage = IsReAttachFocusToPage or false
  local SystemUIName = "GetItemPage"
  if bSpecial then
    SystemUIName = "GetItemPageSP"
  end
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  
  local function ShowFinish()
    UIManager:LoadUINew(SystemUIName, ItemType, ItemId, Count, PurchaseRewards, func, ParentWidget, IsReAttachFocusToPage)
  end
  
  if PurchaseRewards then
    UIUtils.ShowGetCharWeaponPage(PurchaseRewards, ShowFinish, nil, nil, bOnlyItemPage)
  else
    local TargetTable = {}
    TargetTable[ItemType .. "s"] = {
      [ItemId] = Count
    }
    UIUtils.ShowGetCharWeaponPage(TargetTable, ShowFinish, nil, nil, bOnlyItemPage)
  end
end

function UIUtils.ShowGetCharWeaponPage(TargetTable, CallbackFunc, ParentWidget, bGacha, bOnlyItemPage)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  local ShowSort = {
    {
      ShowType = CommonConst.DataType.Skin,
      UIName = "GetCharPage"
    },
    {
      ShowType = CommonConst.DataType.Char,
      UIName = "GetCharPage"
    },
    {
      ShowType = CommonConst.DataType.WeaponSkin,
      UIName = "GetWeaponPage"
    },
    {
      ShowType = CommonConst.DataType.Weapon,
      UIName = "GetWeaponPage"
    },
    {
      ShowType = CommonConst.DataType.Resource,
      UIName = "GetCharPage"
    }
  }
  local AsyncFunc = coroutine.create(function()
    local co = coroutine.running()
    for _, ShowData in ipairs(ShowSort) do
      local ShowType = ShowData.ShowType
      local TargetList
      if TargetTable then
        TargetList = TargetTable[ShowType .. "s"]
      end
      if bOnlyItemPage then
        TargetList = nil
      end
      if TargetList and next(TargetList) then
        local ShowTargetList = {}
        for Id, Count in pairs(TargetList) do
          local NeedInsert = true
          if ShowType == CommonConst.DataType.Resource and not ItemUtils.CheckGestureItemResourceNeedDisplay(Id) then
            NeedInsert = false
          end
          if ShowType == CommonConst.DataType.Skin and not ItemUtils.CheckGestureSkinNeedDisplay(Id) then
            NeedInsert = false
          end
          if NeedInsert then
            if bGacha then
              for i = 1, Count do
                table.insert(ShowTargetList, Id)
              end
            else
              table.insert(ShowTargetList, Id)
            end
          end
        end
        if ShowTargetList and next(ShowTargetList) then
          local ShowTargetParams = {
            TargetIdList = ShowTargetList,
            TargetType = ShowType,
            CallbackObj = self,
            CallbackFunc = function()
              coroutine.resume(co)
            end,
            bGacha = bGacha
          }
          UIManager:LoadUINew(ShowData.UIName, ShowTargetParams)
          coroutine.yield()
        end
      end
    end
    if CallbackFunc then
      CallbackFunc(ParentWidget)
    end
  end)
  coroutine.resume(AsyncFunc)
end

function UIUtils.ShowGetItemPageAndOpenBagIfNeeded(ItemType, ItemId, Count, PurchaseRewards, bSpecial, func, ParentWidget, IsReAttachFocusToPage)
  local needOpenBag = false
  local OpenBagId
  if PurchaseRewards and PurchaseRewards.Resources then
    for Id, resource in pairs(PurchaseRewards.Resources) do
      local RewardData = DataMgr.Resource[Id]
      if RewardData and RewardData.MaterialClassify == BagCommon.ItemTypeToTabId.ConsumableItem then
        needOpenBag = true
        OpenBagId = tostring(Id)
      end
    end
  elseif ItemId then
    local RewardData = DataMgr.Resource[ItemId]
    if RewardData and RewardData.MaterialClassify == BagCommon.ItemTypeToTabId.ConsumableItem then
      needOpenBag = true
      OpenBagId = tostring(ItemId)
    end
  end
  
  local function callback()
    if needOpenBag then
      local Params = {}
      Params.LeftCallbackFunction = func
      
      function Params.RightCallbackFunction(Obj, Result, PopUI)
        UIUtils.OpenSystem(2, false, BagCommon.ItemTypeToTabId.ConsumableItem, OpenBagId)
      end
      
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      UIManager:ShowCommonPopupUI(100250, Params)
    elseif func then
      func()
    end
  end
  
  UIUtils.ShowGetItemPage(ItemType, ItemId, Count, PurchaseRewards, bSpecial, callback, ParentWidget, IsReAttachFocusToPage)
end

function UIUtils.GetCommonDragDropOperationClass()
  if not UIUtils._DragDropOperationClass then
    UIUtils._DragDropOperationClass = MiscUtils.LazyLoadClass("/Game/UI/Blueprint/CommonDragDropOperation.CommonDragDropOperation_C", true)
  end
  return UIUtils._DragDropOperationClass:get()
end

function UIUtils.GetCommonItemContentClass()
  if not UIUtils._ItemObjectClass then
    UIUtils._ItemObjectClass = MiscUtils.LazyLoadClass("/Game/UI/Blueprint/CommonItemContent.CommonItemContent_C", true)
  end
  return UIUtils._ItemObjectClass:get()
end

function UIUtils.GetMaxScrollOffsetOfListView(ListView)
  local ItemUIs = ListView:GetDisplayedEntryWidgets()
  if 0 == ItemUIs:Length() then
    return 0
  end
  local ItemSize = UIManager(ListView):GetWidgetRenderSize(ItemUIs:GetRef(1))
  local ListSize = UIManager(ListView):GetWidgetRenderSize(ListView)
  if 0 == ListSize then
    ListView:ForceLayoutPrepass()
    ListSize = UIManager:GetWidgetRenderSize(ListView)
  end
  local ItemNum = ListView:GetNumItems()
  local MaxScrollOffset = 0
  if ListView.Orientation == EOrientation.Orient_Horizontal then
    MaxScrollOffset = ((ItemNum - 1) * ListView.EntrySpacing + ItemNum * ItemSize.X - ListSize.X) / ItemSize.X
  elseif ListView.Orientation == EOrientation.Orient_Vertical then
    MaxScrollOffset = ((ItemNum - 1) * ListView.EntrySpacing + ItemNum * ItemSize.Y - ListSize.Y) / ItemSize.Y
  end
  return MaxScrollOffset
end

local CountPad = 0.05

function UIUtils.GetListViewContentMaxCount(ListView, ItemUIs, bDontChangeScrollbar, bDontSetEmptyGridItemCount)
  if not ListView:IsVisible() then
    Utils.Traceback(WarningTag, LXYTag .. "UIUtils.GetListViewContentMaxCount\239\188\154ListView\229\191\133\233\161\187\230\152\175\229\143\175\232\167\129\231\154\132")
    return 0
  end
  ItemUIs = ItemUIs or ListView:GetDisplayedEntryWidgets()
  if 0 == ItemUIs:Length() then
    Utils.Traceback(WarningTag, LXYTag .. "UIUtils.GetListViewContentMaxCount\239\188\154ListView\229\191\133\233\161\187\229\133\136\231\148\159\230\136\144\228\184\128\228\184\170ItemUI\230\137\141\232\131\189\229\135\134\231\161\174\232\174\161\231\174\151\228\184\170\230\149\176")
    return 0
  end
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local ListSize = UIManager:GetWidgetRenderSize(ListView)
  local Parent = ListView:GetParent()
  if Parent:Cast(UScrollBox) then
    ListSize = UIManager:GetWidgetRenderSize(Parent)
  end
  local ItemSize = UIManager:GetWidgetRenderSize(ItemUIs:GetRef(1).WidgetTree.RootWidget)
  if ListView.Orientation == EOrientation.Orient_Horizontal then
    ListSize, ItemSize = ListSize.X, ItemSize.X + ListView.EntrySpacing
  elseif ListView.Orientation == EOrientation.Orient_Vertical then
    ListSize, ItemSize = ListSize.Y, ItemSize.Y + ListView.EntrySpacing
  end
  local RawCount = ListSize / ItemSize - ListView.EntrySpacing / ItemSize
  local Count = math.ceil(RawCount - CountPad)
  if bDontChangeScrollbar then
    ListView:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
  else
    ListView:SetScrollbarVisibility(UIConst.VisibilityOp.Hidden)
  end
  if ListView.SetControlScrollbarInside then
    ListView:SetControlScrollbarInside(false)
  end
  local CurItemCount = ListView:GetNumItems()
  if (not (not (Count - RawCount > CountPad) or bDontChangeScrollbar) or Count < CurItemCount) and ListView.SetControlScrollbarInside then
    ListView:SetControlScrollbarInside(true)
  end
  if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" and ListView.bControlScrollbarInside then
    if ListView.SetControlScrollbarInside then
      ListView:SetControlScrollbarInside(false)
    end
    ListView:SetScrollbarVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if CurItemCount > 0 then
    local EmptyItemNum = not bDontSetEmptyGridItemCount and math.max(0, Count - CurItemCount) or 0
    ListView:SetEmptyGridItemCount(EmptyItemNum)
  else
    DebugPrint(ErrorTag, "GetListViewContentMaxCount: \229\189\147\229\137\141\229\136\151\232\161\168\230\178\161\230\156\137\229\161\171\229\133\133\232\191\135Item, \232\175\183\230\137\139\229\138\168\232\176\131\231\148\168\229\136\151\232\161\168\231\154\132SetEmptyGridItemCount\230\157\165\232\174\190\231\189\174\231\169\186\230\128\129\230\160\188\229\173\144\230\149\176")
  end
  DebugPrint("ListViewCount", RawCount, Count)
  return Count
end

function UIUtils.GetTileViewContentMaxCount(TileView, Option, bDontChangeScrollbar, bDontSetEmptyGridItemCount)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local ListSize = UIManager:GetWidgetRenderSize(TileView)
  local Parent = TileView:GetParent()
  if Parent:Cast(UScrollBox) then
    ListSize = UIManager:GetWidgetRenderSize(Parent)
  end
  local ListSizeX, ItemSizeX = ListSize.X, TileView:GetEntryWidth()
  local ListSizeY, ItemSizeY = ListSize.Y, TileView:GetEntryHeight()
  local XCount, YCount = 0, 0
  if bDontChangeScrollbar then
    TileView:SetScrollbarVisibility(ESlateVisibility.Collapsed)
  else
    TileView:SetScrollbarVisibility(ESlateVisibility.Hidden)
  end
  if TileView.SetControlScrollbarInside then
    TileView:SetControlScrollbarInside(false)
  end
  if TileView.Orientation == EOrientation.Orient_Horizontal then
    local RawXCount = ListSizeX / ItemSizeX
    XCount = math.ceil(RawXCount - CountPad)
    if XCount - RawXCount > CountPad and not bDontChangeScrollbar and TileView.SetControlScrollbarInside then
      TileView:SetControlScrollbarInside(true)
    end
    YCount = 1
  elseif TileView.Orientation == EOrientation.Orient_Vertical then
    local ScrollBarSize = TileView.ScrollBarDesireSize
    XCount = math.floor((ListSizeX - ScrollBarSize) / ItemSizeX)
    local RawYCount = ListSizeY / ItemSizeY
    YCount = math.ceil(RawYCount - CountPad)
    DebugPrint("TileViewCount", RawYCount, YCount)
    if YCount - RawYCount > CountPad and not bDontChangeScrollbar and TileView.SetControlScrollbarInside then
      TileView:SetControlScrollbarInside(true)
    end
  end
  if TileView:GetNumItems() > XCount * YCount and TileView.SetControlScrollbarInside then
    TileView:SetControlScrollbarInside(true)
  end
  if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" and TileView.bControlScrollbarInside then
    if TileView.SetControlScrollbarInside then
      TileView:SetControlScrollbarInside(false)
    end
    TileView:SetScrollbarVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  local CurItemCount = TileView:GetNumItems()
  if CurItemCount > 0 then
    local EmptyItemNum = 0
    if not bDontSetEmptyGridItemCount then
      if CurItemCount - XCount * YCount <= 0 then
        EmptyItemNum = XCount * YCount - CurItemCount
      else
        EmptyItemNum = XCount - CurItemCount % XCount
      end
    end
    TileView:SetEmptyGridItemCount(EmptyItemNum)
  else
    DebugPrint(ErrorTag, "GetTileViewContentMaxCount: \229\189\147\229\137\141\229\136\151\232\161\168\230\178\161\230\156\137\229\161\171\229\133\133\232\191\135Item, \232\175\183\230\137\139\229\138\168\232\176\131\231\148\168\229\136\151\232\161\168\231\154\132SetEmptyGridItemCount\230\157\165\232\174\190\231\189\174\231\169\186\230\128\129\230\160\188\229\173\144\230\149\176")
  end
  if not Option then
    return XCount * YCount
  elseif "X" == Option then
    return XCount
  elseif "Y" == Option then
    return YCount
  elseif "XY" == Option then
    return XCount, YCount
  end
  assert(false, "UIUtils.GetTileViewContentMaxCount: Option\229\143\130\230\149\176\233\148\153\232\175\175")
end

function UIUtils.PlayListViewFramingInAnimation(UIState, ListView, Params)
  Params = Params or {
    Interval = nil,
    AnimName = nil,
    Visiblity = nil,
    Callback = nil,
    ListViewOpacity = nil,
    bInteractableInAnim = nil
  }
  local Interval = Params.Interval ~= nil and 0 ~= Params.Interval and Params.Interval or 0.0333
  local AnimName = nil ~= Params.AnimName and Params.AnimName or "In"
  local TimerKeys = Deque.New()
  ListView:SetRenderOpacity(0)
  if Params.bInteractableInAnim == false then
    ListView:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
  local _, TimerKey = UIState:AddTimer(0.01, function()
    ListView:SetRenderOpacity(Params.ListViewOpacity or 1)
    local DisplayedEntries = ListView:GetDisplayedEntryWidgets()
    local NumPerLine = 1
    if ListView:IsA(UTileView) and ListView.GetNumItemsPerLine then
      NumPerLine = ListView:GetNumItemsPerLine()
    end
    local ColunmCount = math.floor(DisplayedEntries:Num() / NumPerLine)
    for i = 1, ColunmCount do
      local LineWidgets = {}
      local VisitedCount = (i - 1) * NumPerLine
      for j = 1, NumPerLine do
        local Entry = DisplayedEntries:GetRef(VisitedCount + j)
        Entry:StopAnimation(Entry[AnimName])
        Entry:SetVisibility(UIConst.VisibilityOp.Collapsed)
        table.insert(LineWidgets, Entry)
      end
      local _, TimerKey
      _, TimerKey = UIState:AddTimer(i * Interval, function()
        local Visiblity = Params.Visibility ~= nil and Params.Visibility or UIConst.VisibilityOp.Visible
        for _, Entry in ipairs(LineWidgets) do
          Entry:SetVisibility(Visiblity)
          Entry:StopAllAnimations()
          Entry:PlayAnimation(Entry[AnimName])
        end
        TimerKeys:PopFront()
        if TimerKeys:IsEmpty() then
          if Params.bInteractableInAnim == false then
            ListView:SetVisibility(UIConst.VisibilityOp.Visible)
          end
          if Params.Callback then
            Params.Callback()
          end
        end
      end, false, 0, nil, true)
      TimerKeys:PushBack(TimerKey)
    end
    TimerKeys:PopFront()
  end, false, 0, nil, true)
  TimerKeys:PushBack(TimerKey)
  return TimerKeys
end

function UIUtils.StopListViewFramingInAnimation(ListView, Params)
  Params = Params or {
    UIState = nil,
    TimerKeys = nil,
    Visibility = UIConst.VisibilityOp.Visible
  }
  ListView:SetRenderOpacity(0)
  local DisplayedEntries = ListView:GetDisplayedEntryWidgets()
  for i = 1, DisplayedEntries:Length() do
    local Entry = DisplayedEntries:GetRef(i)
    if Entry.Normal then
      Entry:PlayAnimationForward(Entry.Normal, 10000)
    end
    Entry:SetVisibility(Params.Visibility and Params.Visibility or UIConst.VisibilityOp.Visible)
  end
  if not Params.TimerKeys or not Params.UIState then
    return
  end
  for _, TimerKey in ipairs(Params.TimerKeys:ToArr()) do
    if Params.UIState:IsExistTimer(TimerKey) then
      Params.UIState:RemoveTimer(TimerKey, true)
    end
  end
end

function UIUtils.UpdateListReddot(ListView, List_FrontRedDot, List_BackRedDot, List_FrontNew, List_BackNew, ReddotAndNewCalFunc)
  if not ListView then
    return
  end
  local PartialStart = TArray(UObject)
  local FullyVisible = TArray(UObject)
  local PartialEnd = TArray(UObject)
  ListView:GetEntryWidgetsVisibilityState(PartialStart, FullyVisible, PartialEnd)
  PartialStart = PartialStart:ToTable()
  FullyVisible = FullyVisible:ToTable()
  PartialEnd = PartialEnd:ToTable()
  local AllItems = ListView:GetListItems():ToTable()
  if 0 == #AllItems then
    return
  end
  
  local function GetWidgetContentArray(widgets)
    local result = {}
    for _, w in ipairs(widgets) do
      if w.Content then
        table.insert(result, w.Content)
      end
    end
    return result
  end
  
  local PartiallyOutOfStartItems = GetWidgetContentArray(PartialStart)
  local FullyVisibleItems = GetWidgetContentArray(FullyVisible)
  local PartiallyOutOfEndItems = GetWidgetContentArray(PartialEnd)
  
  local function GetItemIndex(Item)
    for i, v in ipairs(AllItems) do
      if v == Item then
        return i
      end
    end
    return nil
  end
  
  local TopIndex = 1
  local BottomIndex = #AllItems
  if #FullyVisibleItems > 0 or #PartiallyOutOfStartItems > 0 or #PartiallyOutOfEndItems > 0 then
    local TopItem = PartiallyOutOfStartItems[1] or FullyVisibleItems[1] or PartiallyOutOfEndItems[1]
    local BottomItem = PartiallyOutOfEndItems[#PartiallyOutOfEndItems] or FullyVisibleItems[#FullyVisibleItems] or PartiallyOutOfStartItems[#PartiallyOutOfStartItems]
    
    local function GetIndexByItem(Item)
      for i, v in ipairs(AllItems) do
        if v == Item then
          return i
        end
      end
      return nil
    end
    
    TopIndex = TopItem and GetIndexByItem(TopItem) or 1
    BottomIndex = BottomItem and GetIndexByItem(BottomItem) or #AllItems
  end
  local FullyOutOfStartItems = {}
  local FullyOutOfEndItems = {}
  for i, item in ipairs(AllItems) do
    if TopIndex and i < TopIndex then
      table.insert(FullyOutOfStartItems, item)
    elseif BottomIndex and i > BottomIndex then
      table.insert(FullyOutOfEndItems, item)
    end
  end
  local FrontIndicatorItems = {}
  for _, v in ipairs(FullyOutOfStartItems) do
    table.insert(FrontIndicatorItems, v)
  end
  for _, v in ipairs(PartiallyOutOfStartItems) do
    table.insert(FrontIndicatorItems, v)
  end
  local BackIndicatorItems = {}
  for _, v in ipairs(FullyOutOfEndItems) do
    table.insert(BackIndicatorItems, v)
  end
  local bHasFrontReddot, bHasBackReddot = false, false
  local bHasFrontNew, bHasBackNew = false, false
  
  local function CheckIndicators(ItemList)
    for _, item in ipairs(ItemList) do
      local hasRed, hasNew = false, false
      if ReddotAndNewCalFunc then
        hasRed, hasNew = ReddotAndNewCalFunc(item)
      end
      local idx = GetItemIndex(item)
      if idx and TopIndex and BottomIndex then
        if idx <= TopIndex then
          if hasRed then
            bHasFrontReddot = true
          end
          if hasNew and not hasRed then
            bHasFrontNew = true
          end
        elseif idx >= BottomIndex then
          if hasRed then
            bHasBackReddot = true
          end
          if hasNew and not hasRed then
            bHasBackNew = true
          end
        end
      end
    end
  end
  
  CheckIndicators(FrontIndicatorItems)
  CheckIndicators(BackIndicatorItems)
  local FrontAnim = "Loop_T"
  local BackAnim = "Loop_D"
  if ListView.Orientation == UE.EOrientation.Orient_Horizontal then
    FrontAnim = "Loop_L"
    BackAnim = "Loop_R"
  end
  
  local function SetListIndicator(Widget, bVisible, AnimName)
    if not Widget then
      return
    end
    local AnimObject = Widget[AnimName]
    if bVisible then
      Widget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      if AnimObject and not Widget:IsAnimationPlaying(AnimObject) then
        Widget:PlayAnimation(AnimObject, 0, 0)
      end
    else
      Widget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  
  SetListIndicator(List_FrontRedDot, bHasFrontReddot, FrontAnim)
  SetListIndicator(List_FrontNew, not bHasFrontReddot and bHasFrontNew, FrontAnim)
  SetListIndicator(List_BackRedDot, bHasBackReddot, BackAnim)
  SetListIndicator(List_BackNew, not bHasBackReddot and bHasBackNew, BackAnim)
end

function UIUtils.UpdateScrollBoxReddot(TargetScrollBox, ScrollBox_FrontRedDot, ScrollBox_BackRedDot, ScrollBox_FrontNew, ScrollBox_BackNew, ReddotAndNewCalFunc)
  if not TargetScrollBox then
    return
  end
  local OutFullyOutOfStartArray = TArray(UObject)
  local OutPartiallyOutOfStartArray = TArray(UObject)
  local OutFullyVisibleArray = TArray(UObject)
  local OutPartiallyOutOfEndArray = TArray(UObject)
  local OutFullyOutOfEndArray = TArray(UObject)
  TargetScrollBox:GetChildWidgetsPosInScrollBox(OutFullyOutOfStartArray, OutPartiallyOutOfStartArray, OutFullyVisibleArray, OutPartiallyOutOfEndArray, OutFullyOutOfEndArray)
  local bHasFrontReddot = false
  local bHasBackReddot = false
  local bHasFrontNew = false
  local bHasBackNew = false
  
  local function CalbHas(TargetTable)
    local HasReddot = false
    local HasNew = false
    for _, Widget in pairs(TargetTable) do
      local bHasReddot, bHasNew
      if nil ~= ReddotAndNewCalFunc then
        bHasReddot, bHasNew = ReddotAndNewCalFunc(Widget)
      else
        bHasReddot, bHasNew = false, false
      end
      if bHasReddot then
        HasReddot = true
      end
      if bHasNew then
        HasNew = true
      end
    end
    return HasReddot, HasNew
  end
  
  local TableHasReddot = false
  local TableHasNew = false
  TableHasReddot, TableHasNew = CalbHas(OutFullyOutOfStartArray:ToTable())
  if TableHasReddot then
    bHasFrontReddot = true
  end
  if TableHasNew then
    bHasFrontNew = true
  end
  TableHasReddot, TableHasNew = CalbHas(OutPartiallyOutOfStartArray:ToTable())
  if TableHasReddot then
    bHasFrontReddot = true
  end
  if TableHasNew then
    bHasFrontNew = true
  end
  TableHasReddot, TableHasNew = CalbHas(OutFullyOutOfEndArray:ToTable())
  if TableHasReddot then
    bHasBackReddot = true
  end
  if TableHasNew then
    bHasBackNew = true
  end
  local FrontAnim = "Loop_T"
  local BackAnim = "Loop_D"
  if TargetScrollBox.Orientation == EOrientation.Orient_Horizontal then
    FrontAnim = "Loop_L"
    BackAnim = "Loop_R"
  end
  
  local function SetListIndicator(Widget, bVisible, AnimName)
    if not Widget then
      return
    end
    local AnimObject = Widget[AnimName]
    if bVisible then
      Widget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      if AnimObject and not Widget:IsAnimationPlaying(AnimObject) then
        Widget:PlayAnimation(AnimObject, 0, 0)
      end
    else
      Widget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  
  print("lgc@ :", "bHasFrontReddot", tostring(bHasFrontReddot), "bHasBackReddot", tostring(bHasBackReddot), "bHasFrontNew", tostring(bHasFrontNew), "bHasBackNew", tostring(bHasBackNew))
  if ScrollBox_FrontRedDot then
    SetListIndicator(ScrollBox_FrontRedDot, bHasFrontReddot, FrontAnim)
  end
  if ScrollBox_FrontNew then
    local showTopNew = not bHasFrontReddot and bHasFrontNew
    SetListIndicator(ScrollBox_FrontNew, showTopNew, FrontAnim)
  end
  if ScrollBox_BackRedDot then
    SetListIndicator(ScrollBox_BackRedDot, bHasBackReddot, BackAnim)
  end
  if ScrollBox_BackNew then
    local showBottomNew = not bHasBackReddot and bHasBackNew
    SetListIndicator(ScrollBox_BackNew, showBottomNew, BackAnim)
  end
end

function UIUtils.UpdateScrollBoxArrow(ScrollBox, List_ArrowTop, List_ArrowBottom)
  if not ScrollBox then
    return
  end
  local Offset = ScrollBox:GetScrollOffset()
  local EndOffset = ScrollBox:GetScrollOffsetOfEnd()
  if List_ArrowTop then
    if Offset > 0 then
      List_ArrowTop:SetVisibility(ESlateVisibility.Visible)
    else
      List_ArrowTop:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
  if List_ArrowBottom then
    if Offset == EndOffset then
      List_ArrowBottom:SetVisibility(ESlateVisibility.Collapsed)
    else
      List_ArrowBottom:SetVisibility(ESlateVisibility.Visible)
    end
  end
end

function UIUtils.UpdateListArrow(ListView, List_ArrowTop, List_ArrowBottom)
  if not ListView then
    return
  end
  local DisplayedWidgets = ListView:GetDisplayedEntryWidgets():ToTable()
  local ListItems = ListView:GetListItems():ToTable()
  if 0 == #DisplayedWidgets or 0 == #ListItems then
    if List_ArrowTop then
      List_ArrowTop:SetVisibility(ESlateVisibility.Collapsed)
    end
    if List_ArrowBottom then
      List_ArrowBottom:SetVisibility(ESlateVisibility.Collapsed)
    end
    return
  end
  local VisibleIndexMin = 100000
  local VisibleIndexMax = -1
  for _, Widget in ipairs(DisplayedWidgets) do
    local ItemObject = Widget.Content
    local Index = ListView:GetIndexForItem(ItemObject)
    if Index then
      VisibleIndexMin = math.min(VisibleIndexMin, Index)
      VisibleIndexMax = math.max(VisibleIndexMax, Index)
    end
  end
  if List_ArrowTop then
    local bShowTopArrow = VisibleIndexMin > 0
    List_ArrowTop:SetVisibility(bShowTopArrow and ESlateVisibility.Visible or ESlateVisibility.Collapsed)
  end
  if List_ArrowBottom then
    local bShowBottomArrow = VisibleIndexMax < #ListItems - 1
    List_ArrowBottom:SetVisibility(bShowBottomArrow and ESlateVisibility.Visible or ESlateVisibility.Collapsed)
  end
end

function UIUtils.UpdateListArrowAndReddot(ListView, List_FrontRedDot, List_BackRedDot, List_ArrowTop, List_ArrowBottom, ReddotCalFunc)
  if not ListView then
    return
  end
  local TargetList = ListView
  local PartialStart = TArray(UObject)
  local FullyVisible = TArray(UObject)
  local PartialEnd = TArray(UObject)
  ListView:GetEntryWidgetsVisibilityState(PartialStart, FullyVisible, PartialEnd)
  PartialStart = PartialStart:ToTable()
  FullyVisible = FullyVisible:ToTable()
  PartialEnd = PartialEnd:ToTable()
  local ListItems = ListView:GetListItems():ToTable()
  if 0 == #ListItems then
    return
  end
  
  local function GetWidgetContentArray(widgets)
    local result = {}
    for _, w in ipairs(widgets) do
      if w.Content then
        table.insert(result, w.Content)
      end
    end
    return result
  end
  
  local PartiallyOutOfStartItems = GetWidgetContentArray(PartialStart)
  local FullyVisibleItems = GetWidgetContentArray(FullyVisible)
  local PartiallyOutOfEndItems = GetWidgetContentArray(PartialEnd)
  
  local function GetItemIndex(Item)
    for i, v in ipairs(ListItems) do
      if v == Item then
        return i
      end
    end
    return nil
  end
  
  table.sort(PartiallyOutOfStartItems, function(a, b)
    return GetItemIndex(a) < GetItemIndex(b)
  end)
  table.sort(PartiallyOutOfEndItems, function(a, b)
    return GetItemIndex(a) > GetItemIndex(b)
  end)
  local TopIndex = 1
  local BottomIndex = #ListItems
  if #FullyVisibleItems > 0 or #PartiallyOutOfStartItems > 0 or #PartiallyOutOfEndItems > 0 then
    local TopItem = PartiallyOutOfStartItems[1] or FullyVisibleItems[1] or PartiallyOutOfEndItems[1]
    local BottomItem = PartiallyOutOfEndItems[1] or FullyVisibleItems[#FullyVisibleItems] or PartiallyOutOfStartItems[1]
    TopIndex = TopItem and GetItemIndex(TopItem) or 1
    BottomIndex = BottomItem and GetItemIndex(BottomItem) or #ListItems
  end
  local FullyOutOfStartItems = {}
  local FullyOutOfEndItems = {}
  for i, item in ipairs(ListItems) do
    if TopIndex and i < TopIndex then
      table.insert(FullyOutOfStartItems, item)
    elseif BottomIndex and i > BottomIndex then
      table.insert(FullyOutOfEndItems, item)
    end
  end
  local FrontIndicatorItems = {}
  for _, v in ipairs(FullyOutOfStartItems) do
    table.insert(FrontIndicatorItems, v)
  end
  for _, v in ipairs(PartiallyOutOfStartItems) do
    table.insert(FrontIndicatorItems, v)
  end
  local BackIndicatorItems = {}
  for _, v in ipairs(FullyOutOfEndItems) do
    table.insert(BackIndicatorItems, v)
  end
  local bHasFrontReddot, bHasBackReddot = false, false
  
  local function CheckIndicators(ItemList)
    for _, item in ipairs(ItemList) do
      local hasRed = false, false
      if ReddotCalFunc then
        hasRed = ReddotCalFunc(item)
      end
      local idx = GetItemIndex(item)
      if idx and TopIndex and BottomIndex then
        if idx <= TopIndex then
          if hasRed then
            bHasFrontReddot = true
          end
        elseif idx >= BottomIndex and hasRed then
          bHasBackReddot = true
        end
      end
    end
  end
  
  CheckIndicators(FrontIndicatorItems)
  CheckIndicators(BackIndicatorItems)
  if not FullyVisible or #FullyVisible <= 3 then
    if List_FrontRedDot then
      List_FrontRedDot:SetVisibility(ESlateVisibility.Collapsed)
    end
    if List_BackRedDot then
      List_BackRedDot:SetVisibility(ESlateVisibility.Collapsed)
    end
    if List_ArrowTop then
      List_ArrowTop:SetVisibility(ESlateVisibility.Collapsed)
    end
    if List_ArrowBottom then
      List_ArrowBottom:SetVisibility(ESlateVisibility.Collapsed)
    end
    return
  end
  if not ListItems or 0 == #ListItems then
    if List_FrontRedDot then
      List_FrontRedDot:SetVisibility(ESlateVisibility.Collapsed)
    end
    if List_BackRedDot then
      List_BackRedDot:SetVisibility(ESlateVisibility.Collapsed)
    end
    if List_ArrowTop then
      List_ArrowTop:SetVisibility(ESlateVisibility.Collapsed)
    end
    if List_ArrowBottom then
      List_ArrowBottom:SetVisibility(ESlateVisibility.Collapsed)
    end
    return
  end
  if #FullyVisible >= #ListItems then
    if List_FrontRedDot then
      List_FrontRedDot:SetVisibility(ESlateVisibility.Collapsed)
    end
    if List_BackRedDot then
      List_BackRedDot:SetVisibility(ESlateVisibility.Collapsed)
    end
    if List_ArrowTop then
      List_ArrowTop:SetVisibility(ESlateVisibility.Collapsed)
    end
    if List_ArrowBottom then
      List_ArrowBottom:SetVisibility(ESlateVisibility.Collapsed)
    end
    return
  end
  local FrontAnim = "Loop_T"
  local BackAnim = "Loop_D"
  if TargetList.Orientation == EOrientation.Orient_Horizontal then
    FrontAnim = "Loop_L"
    BackAnim = "Loop_R"
  end
  
  local function SetListIndicator(Widget, bVisible, AnimName)
    if not Widget then
      return
    end
    local AnimObject = Widget[AnimName]
    if bVisible then
      Widget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      if AnimObject and not Widget:IsAnimationPlaying(AnimObject) then
        Widget:PlayAnimation(AnimObject, 0, 0)
      end
    else
      Widget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  
  local bShowTopArrow = TopIndex > 1
  local bShowBottomArrow = BottomIndex < #ListItems - 1
  if List_FrontRedDot then
    SetListIndicator(List_FrontRedDot, bHasFrontReddot, FrontAnim)
  end
  if List_ArrowTop then
    local bShowArrow = bShowTopArrow and not bHasFrontReddot
    List_ArrowTop:SetVisibility(bShowArrow and ESlateVisibility.Visible or ESlateVisibility.Collapsed)
  end
  if List_BackRedDot then
    SetListIndicator(List_BackRedDot, bHasBackReddot, BackAnim)
  end
  if List_ArrowBottom then
    local bShowArrow = bShowBottomArrow and not bHasBackReddot
    List_ArrowBottom:SetVisibility(bShowArrow and ESlateVisibility.Visible or ESlateVisibility.Collapsed)
  end
end

function UIUtils.BindScrollBoxReddotAndNewClickEvent(TargetScrollBox, ScrollBox_FrontRedDot, ScrollBox_BackRedDot, ScrollBox_FrontNew, ScrollBox_BackNew, ReddotAndNewCalFunc)
  if not TargetScrollBox then
    return
  end
  
  local function BindClickEvent(indicator, isFront, isReddot)
    if not indicator or not indicator.Btn_Click then
      return
    end
    indicator.Btn_Click.OnClicked:Clear()
    indicator.Btn_Click.OnHovered:Clear()
    indicator.Btn_Click.OnHovered:Add(TargetScrollBox, function()
      AudioManager(indicator):PlayUISound(nil, "event:/ui/common/red_point_out_bound", nil, nil)
    end)
    indicator.Btn_Click.OnClicked:Add(TargetScrollBox, function()
      AudioManager(indicator):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
      local OutFullyOutOfStartArray = TArray(UObject)
      local OutPartiallyOutOfStartArray = TArray(UObject)
      local OutFullyVisibleArray = TArray(UObject)
      local OutPartiallyOutOfEndArray = TArray(UObject)
      local OutFullyOutOfEndArray = TArray(UObject)
      TargetScrollBox:GetChildWidgetsPosInScrollBox(OutFullyOutOfStartArray, OutPartiallyOutOfStartArray, OutFullyVisibleArray, OutPartiallyOutOfEndArray, OutFullyOutOfEndArray)
      local targetWidgets = {}
      if isFront then
        for _, widget in ipairs(OutFullyOutOfStartArray:ToTable()) do
          table.insert(targetWidgets, widget)
        end
        for _, widget in ipairs(OutPartiallyOutOfStartArray:ToTable()) do
          table.insert(targetWidgets, widget)
        end
        for _, widget in ipairs(targetWidgets) do
          local bHasReddot, bHasNew = ReddotAndNewCalFunc(widget)
          if isReddot and bHasReddot or not isReddot and bHasNew then
            TargetScrollBox:ScrollWidgetIntoView(widget, true)
            return
          end
        end
      else
        for _, widget in ipairs(OutPartiallyOutOfEndArray:ToTable()) do
          table.insert(targetWidgets, widget)
        end
        for _, widget in ipairs(OutFullyOutOfEndArray:ToTable()) do
          table.insert(targetWidgets, widget)
        end
        for i = #targetWidgets, 1, -1 do
          local widget = targetWidgets[i]
          local bHasReddot, bHasNew = ReddotAndNewCalFunc(widget)
          if isReddot and bHasReddot or not isReddot and bHasNew then
            TargetScrollBox:ScrollWidgetIntoView(widget, true)
            return
          end
        end
      end
    end)
  end
  
  BindClickEvent(ScrollBox_FrontRedDot, true, true)
  BindClickEvent(ScrollBox_BackRedDot, false, true)
  BindClickEvent(ScrollBox_FrontNew, true, false)
  BindClickEvent(ScrollBox_BackNew, false, false)
  
  local function PlayNormalAnim(Target)
    if Target and Target.Normal and Target.PlayAnimation then
      Target:PlayAnimation(Target.Normal)
    end
  end
  
  PlayNormalAnim(ScrollBox_FrontRedDot)
  PlayNormalAnim(ScrollBox_BackRedDot)
  PlayNormalAnim(ScrollBox_FrontNew)
  PlayNormalAnim(ScrollBox_BackNew)
end

function UIUtils.GetListViewEntryItemsVisibilityState(ListView, OutFullyOutOfStartArray, OutPartiallyOutOfStartArray, OutFullyVisibleArray, OutPartiallyOutOfEndArray, OutFullyOutOfEndArray)
  if not ListView then
    return
  end
  for i = #OutFullyOutOfStartArray, 1, -1 do
    table.remove(OutFullyOutOfStartArray, i)
  end
  for i = #OutPartiallyOutOfStartArray, 1, -1 do
    table.remove(OutPartiallyOutOfStartArray, i)
  end
  for i = #OutFullyVisibleArray, 1, -1 do
    table.remove(OutFullyVisibleArray, i)
  end
  for i = #OutPartiallyOutOfEndArray, 1, -1 do
    table.remove(OutPartiallyOutOfEndArray, i)
  end
  for i = #OutFullyOutOfEndArray, 1, -1 do
    table.remove(OutFullyOutOfEndArray, i)
  end
  local AllItems = ListView:GetListItems():ToTable()
  if 0 == #AllItems then
    return
  end
  local PartialStart = TArray(UObject)
  local FullyVisible = TArray(UObject)
  local PartialEnd = TArray(UObject)
  ListView:GetEntryWidgetsVisibilityState(PartialStart, FullyVisible, PartialEnd)
  
  local function GetWidgetContentArray(widgets)
    local result = {}
    for _, w in ipairs(widgets) do
      if w.Content then
        table.insert(result, w.Content)
      end
    end
    return result
  end
  
  local PartiallyOutOfStartItems = GetWidgetContentArray(PartialStart:ToTable())
  local FullyVisibleItems = GetWidgetContentArray(FullyVisible:ToTable())
  local PartiallyOutOfEndItems = GetWidgetContentArray(PartialEnd:ToTable())
  
  local function GetItemIndex(Item)
    for i, v in ipairs(AllItems) do
      if v == Item then
        return i
      end
    end
    return nil
  end
  
  local TopIndex = 1
  local BottomIndex = #AllItems
  if #FullyVisibleItems > 0 or #PartiallyOutOfStartItems > 0 or #PartiallyOutOfEndItems > 0 then
    local TopItem = PartiallyOutOfStartItems[1] or FullyVisibleItems[1] or PartiallyOutOfEndItems[1]
    local BottomItem = PartiallyOutOfEndItems[#PartiallyOutOfEndItems] or FullyVisibleItems[#FullyVisibleItems] or PartiallyOutOfStartItems[#PartiallyOutOfStartItems]
    TopIndex = TopItem and GetItemIndex(TopItem) or 1
    BottomIndex = BottomItem and GetItemIndex(BottomItem) or #AllItems
  end
  for i, item in ipairs(AllItems) do
    if i < TopIndex then
      table.insert(OutFullyOutOfStartArray, item)
    elseif i > BottomIndex then
      table.insert(OutFullyOutOfEndArray, item)
    else
      local found = false
      for _, visibleItem in ipairs(PartiallyOutOfStartItems) do
        if visibleItem == item then
          table.insert(OutPartiallyOutOfStartArray, item)
          found = true
          break
        end
      end
      if not found then
        for _, visibleItem in ipairs(FullyVisibleItems) do
          if visibleItem == item then
            table.insert(OutFullyVisibleArray, item)
            found = true
            break
          end
        end
      end
      if not found then
        for _, visibleItem in ipairs(PartiallyOutOfEndItems) do
          if visibleItem == item then
            table.insert(OutPartiallyOutOfEndArray, item)
            found = true
            break
          end
        end
      end
    end
  end
end

function UIUtils.BindListViewReddotAndNewClickEvent(TargetListView, ListView_FrontRedDot, ListView_BackRedDot, ListView_FrontNew, ListView_BackNew, ReddotAndNewCalFunc)
  if not TargetListView then
    return
  end
  
  local function BindClickEvent(indicator, isFront, isReddot)
    if not indicator or not indicator.Btn_Click then
      return
    end
    indicator.Btn_Click.OnClicked:Clear()
    indicator.Btn_Click.OnHovered:Clear()
    indicator.Btn_Click.OnHovered:Add(TargetListView, function()
      AudioManager(indicator):PlayUISound(nil, "event:/ui/common/red_point_out_bound", nil, nil)
    end)
    indicator.Btn_Click.OnClicked:Add(TargetListView, function()
      AudioManager(indicator):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
      local OutFullyOutOfStartArray = {}
      local OutPartiallyOutOfStartArray = {}
      local OutFullyVisibleArray = {}
      local OutPartiallyOutOfEndArray = {}
      local OutFullyOutOfEndArray = {}
      UIUtils.GetListViewEntryItemsVisibilityState(TargetListView, OutFullyOutOfStartArray, OutPartiallyOutOfStartArray, OutFullyVisibleArray, OutPartiallyOutOfEndArray, OutFullyOutOfEndArray)
      local targetItems = {}
      if isFront then
        for _, item in ipairs(OutFullyOutOfStartArray) do
          table.insert(targetItems, item)
        end
        for _, item in ipairs(OutPartiallyOutOfStartArray) do
          table.insert(targetItems, item)
        end
        for _, item in ipairs(targetItems) do
          local bHasReddot, bHasNew = ReddotAndNewCalFunc(item)
          if isReddot and bHasReddot or not isReddot and bHasNew then
            TargetListView:ScrollItemIntoViewWithAnim(item, true, UE4.EDescendantScrollDestination.TopOrLeft)
            return
          end
        end
      else
        for _, item in ipairs(OutPartiallyOutOfEndArray) do
          table.insert(targetItems, item)
        end
        for _, item in ipairs(OutFullyOutOfEndArray) do
          table.insert(targetItems, item)
        end
        for i = #targetItems, 1, -1 do
          local item = targetItems[i]
          local bHasReddot, bHasNew = ReddotAndNewCalFunc(item)
          if isReddot and bHasReddot or not isReddot and bHasNew then
            TargetListView:ScrollItemIntoViewWithAnim(item, true, UE4.EDescendantScrollDestination.BottomOrRight)
            return
          end
        end
      end
    end)
  end
  
  BindClickEvent(ListView_FrontRedDot, true, true)
  BindClickEvent(ListView_BackRedDot, false, true)
  BindClickEvent(ListView_FrontNew, true, false)
  BindClickEvent(ListView_BackNew, false, false)
  
  local function PlayNormalAnim(Target)
    if Target and Target.Normal and Target.PlayAnimation then
      Target:PlayAnimation(Target.Normal)
    end
  end
  
  PlayNormalAnim(ListView_FrontRedDot)
  PlayNormalAnim(ListView_BackRedDot)
  PlayNormalAnim(ListView_FrontNew)
  PlayNormalAnim(ListView_BackNew)
end

function UIUtils.OpenSystem(SystemId, Option, ...)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not Player or not IsValid(Player) then
    return
  end
  local SystemData = DataMgr.MainUI[SystemId]
  local SystemUIName
  if SystemData and SystemData.SystemUIName then
    SystemUIName = SystemData.SystemUIName
  else
    return
  end
  local NeedAnimation = false
  if SystemData.ShowCondition then
    NeedAnimation = true
  end
  if SystemData and UIUtils.CheckCdnHide(SystemUIName, true) then
    return
  end
  local SystemUI = DataMgr.SystemUI[SystemUIName]
  if not UIUtils.CheckSystemCanOpen(SystemUI) then
    return
  end
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local MenuUI = UIManager:GetUI(UIConst.MenuWorld)
  local IsEscMenu = false
  if type(Option) == "boolean" then
    IsEscMenu = true
  elseif type(Option) == "string" then
    MenuUI[Option] = true
  end
  local UIUnlockRuleName = SystemData.UIUnlockRuleName
  if SystemId == CommonConst.ArmoryEnterId then
    local bInSkillAndSafeToCancel = Player:CharacterInTag("Skill") and Player:IsSafeToCancelSkill()
    if Player:CanEnterInteractive() and (Player:CharacterInTag("Idle") or bInSkillAndSafeToCancel) and Player.PlayerAnimInstance and (Player.PlayerAnimInstance.IdletagName == "0" or Player.PlayerAnimInstance.IdletagName == "EmoIdle") then
      if UIUtils.CheckSystemIsUnlock(SystemUIName, UIUnlockRuleName, IsEscMenu, NeedAnimation, ...) and bInSkillAndSafeToCancel then
        Player:StopSkill(UE.ESkillStopReason.ArmoryCancel)
      end
    elseif not IsEscMenu then
      UIManager:ShowUITip(UIConst.Tip_CommonTop, GText("UI_Toast_Armory_Forbid"))
    else
      UIManager:ShowUITip(UIConst.Tip_CommonToast, GText("UI_Toast_Armory_Forbid"))
    end
  elseif "NpcSwitchMain" == SystemUIName then
    if Player:IsSeating() then
      UIManager:ShowUITip(UIConst.Tip_CommonTop, GText("UI_Toast_NpcSwitch_Forbid"))
    else
      UIUtils.CheckSystemIsUnlock(SystemUIName, UIUnlockRuleName, IsEscMenu, ...)
    end
  elseif "ShopMain" == SystemUIName then
    UIUtils.CheckSystemIsUnlock(SystemUIName, UIUnlockRuleName, IsEscMenu, NeedAnimation, nil, nil, nil, "Shop")
  else
    UIUtils.CheckSystemIsUnlock(SystemUIName, UIUnlockRuleName, IsEscMenu, NeedAnimation, ...)
  end
end

function UIUtils.CheckSystemCanOpen(SystemUI)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if SystemUI and SystemUI.CombatconditionIdList ~= nil then
    local IsConditionSuccess, TargetConditionIdx = true
    for i, v in ipairs(SystemUI.CombatconditionIdList) do
      local TraceInfo = "From Guide_Touch:Init"
      if not Battle(Player):CheckConditionNew(v, Player, nil, TraceInfo) then
        IsConditionSuccess = false
        TargetConditionIdx = i
        break
      end
    end
    if not IsConditionSuccess then
      if SystemUI.ConditiontextList and nil ~= SystemUI.ConditiontextList[TargetConditionIdx] then
        DebugPrint("The UI Load in fail, Because Combatcondition is not met, The CombatconditionId is", SystemUI.CombatconditionIdList[TargetConditionIdx])
        UIManager:ShowUITip(UIConst.Tip_CommonTop, GText(SystemUI.ConditiontextList[TargetConditionIdx]))
      end
      return false
    end
  end
  return true
end

function UIUtils.CheckSystemIsUnlock(SystemUIName, UIUnlockRuleName, IsEscMenu, NeedAnimation, ...)
  local Param1, Param2, Param3, Param4, Param5 = ...
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if UIUnlockRuleName then
    local UIUnlockRule = DataMgr.UIUnlockRule
    local UIUnlockRuleId = UIUnlockRule[UIUnlockRuleName].UIUnlockRuleId
    local OpenDescs = UIUnlockRule[UIUnlockRuleName].OpenSystemDesc
    local OpenConditionId = UIUnlockRule[UIUnlockRuleName].OpenConditionId
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local bUnlocked = Avatar:CheckUIUnlocked(UIUnlockRuleId)
      if bUnlocked then
        local IsCanOpen, FailedIdIndex = Avatar:CheckSystemUICanOpen(UIUnlockRuleId)
        if IsCanOpen then
          UIUtils.FinalOpenSystem(SystemUIName, IsEscMenu, NeedAnimation, Param1, Param2, Param3, Param4, Param5)
          return true
        elseif #OpenConditionId == #OpenDescs then
          for _, Value in pairs(FailedIdIndex) do
            UIManager:ShowUITip(UIConst.Tip_CommonToast, OpenDescs[Value])
          end
        else
          UIManager:ShowUITip(UIConst.Tip_CommonToast, OpenDescs[1])
        end
      else
        UIManager:ShowUITip(UIConst.Tip_CommonToast, UIUnlockRule[UIUnlockRuleName].UIUnlockDesc)
      end
    end
  else
    UIUtils.FinalOpenSystem(SystemUIName, IsEscMenu, NeedAnimation, ...)
    return true
  end
  return false
end

function UIUtils.FinalOpenSystem(SystemUIName, IsEscMenu, NeedAnimation, ...)
  local Params = {
    ...
  }
  if "AnnouncementMain" == SystemUIName then
    UIUtils.FinalOpenSystemInternal(SystemUIName, IsEscMenu, NeedAnimation, table.unpack(Params))
  else
    local FlowManager = USubsystemBlueprintLibrary.GetWorldSubsystem(GWorld.GameInstance, UGameFlowManager)
    local Flow = FlowManager:CreateFlow("OpenSystemUI")
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    Flow.OnBegin:Add(Flow, function()
      local ExistUIObj = UIManager:GetUI(SystemUIName)
      if IsValid(ExistUIObj) then
        DebugPrint("JLY \231\179\187\231\187\159ui\233\135\141\229\164\141\230\137\147\229\188\128\239\188\140\232\175\183\230\163\128\230\159\165\233\128\187\232\190\145, Name is ", SystemUIName)
        FlowManager:RemoveFlow(Flow)
      else
        UIUtils.FinalOpenSystemInternal(SystemUIName, IsEscMenu, NeedAnimation, table.unpack(Params))
        UIManager:AddFlow(SystemUIName, Flow)
      end
    end)
    FlowManager:AddFlow(Flow)
  end
end

function UIUtils.FinalOpenSystemInternal(SystemUIName, IsEscMenu, NeedAnimation, ...)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if IsEscMenu then
    if "AnnouncementMain" == SystemUIName then
      local AnnouncementUtils = require("BluePrints.UI.WBP.Announcement.AnnounceUtils")
      local MenuUI = UIManager:GetUI(UIConst.MenuWorld)
      AnnouncementUtils:OpenAnnouncementMain(AnnounceCommon.ShowTag.InGame, nil, nil, MenuUI)
      return
    end
    UIManager:LoadUINew(SystemUIName, ...)
    return
  else
    local BattleMainUI = UIManager:GetUI("BattleMain")
    if nil ~= BattleMainUI and nil ~= BattleMainUI.Char_Skill and type(BattleMainUI.Char_Skill.HandleEventByInterrupt) == "function" then
      BattleMainUI.Char_Skill:HandleEventByInterrupt()
    end
    if nil ~= BattleMainUI and not IsEscMenu and NeedAnimation then
      BattleMainUI:PlayOutAnim()
      local UI = UIManager:LoadUINew(SystemUIName, ...)
      if nil == UI then
        BattleMainUI:TryRecoverUI()
      else
      end
    else
      UIManager:LoadUINew(SystemUIName, ...)
    end
  end
end

function UIUtils.OpenEsc()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if Player and Player.SkillFeature then
    return
  end
  if Player:GetESCMenuForbiddenState() then
    return
  end
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local Avatar = GWorld:GetAvatar()
  local SystemUIConfig = DataMgr.SystemUI[UIConst.CommonSetUP]
  if SystemUIConfig and SystemUIConfig.Params.BlockedUIName then
    for _, UIName in ipairs(SystemUIConfig.Params.BlockedUIName) do
      local BlockedUI = UIManager:GetUIObj(UIName)
      if BlockedUI and BlockedUI:IsPlayingAnimation() then
        return
      end
    end
  end
  if UIUtils.IsMenuWorld() then
    UIManager:LoadUINew(UIConst.MenuWorld)
  else
    UIManager:LoadUINew(UIConst.MenuLevel)
  end
end

function UIUtils.IsMenuWorld()
  local DungeonId = GWorld.GameInstance:GetCurrentDungeonId()
  local Avatar = GWorld:GetAvatar()
  if Avatar and DungeonId and DungeonId <= 0 then
    local InHardBoss = Avatar:IsInHardBoss()
    local SpecialQuestChange = false
    local SpecialQuestConfig = DataMgr.SpecialQuestConfig[Avatar.SpecialQuestId]
    if SpecialQuestConfig and SpecialQuestConfig.UniversalConfigId then
      local UniversalConfig = DataMgr.UniversalConfig[SpecialQuestConfig.UniversalConfigId]
      if UniversalConfig and UniversalConfig.IfChangeESC then
        SpecialQuestChange = true
      end
    end
    if InHardBoss or Avatar.SpecialQuestId and SpecialQuestChange then
      return false
    else
      return true
    end
  else
    return false
  end
end

function UIUtils.PlayBattleMainInAnim()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattleMainUI = UIManager:GetUI("BattleMain")
  if nil ~= BattleMainUI then
    BattleMainUI:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    BattleMainUI:TryRecoverUI()
  end
end

function UIUtils.CheckAndPlayBattleMainInAnim(UIName)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BattleMainUI = UIManager:GetUI("BattleMain")
  if nil ~= BattleMainUI then
    local IsPlayInAnimSucc = BattleMainUI:UnLoadSystem(UIName)
    if IsPlayInAnimSucc then
      BattleMainUI:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

function UIUtils.PlayCommonBtnSe(context)
  UE4.UFMODBlueprintStatics.PlayEvent2D(nil, UE4.UFMODBlueprintStatics.FindEventbyName("event:/ui/common/click"))
end

function UIUtils.PlayCommonForbiddenBtnSe(context)
  UE4.UFMODBlueprintStatics.PlayEvent2D(nil, UE4.UFMODBlueprintStatics.FindEventbyName("event:/ui/common/click_btn_disable"))
end

function UIUtils.GetAllElementTypes()
  if not UIUtils.ElementTypes then
    UIUtils.ElementTypes = {}
    UIUtils.ElementTypeNames = {}
    local list = {}
    for id, value in pairs(DataMgr.Attribute) do
      if value.DisplayPriority then
        table.insert(list, value)
      end
    end
    table.sort(list, function(a, b)
      return a.DisplayPriority < b.DisplayPriority
    end)
    for index, value in ipairs(list) do
      table.insert(UIUtils.ElementTypes, value.ID)
      table.insert(UIUtils.ElementTypeNames, "UI_Attr_" .. value.ID .. "_Name")
    end
  end
  return UIUtils.ElementTypes, UIUtils.ElementTypeNames
end

function UIUtils.GetAllWeaponTags()
  if not UIUtils.MeleeTags or not UIUtils.RangedTags then
    UIUtils.MeleeTags = {}
    UIUtils.MeleeTagNames = {}
    UIUtils.RangedTags = {}
    UIUtils.RangedTagNames = {}
    local list = {}
    for WeaponTag, value in pairs(DataMgr.WeaponTag) do
      if value.WeaponTagfilter == "MeleeType" then
        table.insert(UIUtils.MeleeTags, WeaponTag)
      elseif value.WeaponTagfilter == "RangedType" then
        table.insert(UIUtils.RangedTags, WeaponTag)
      end
    end
    table.sort(UIUtils.MeleeTags)
    table.sort(UIUtils.RangedTags)
    for _, WeaponTag in ipairs(UIUtils.MeleeTags) do
      table.insert(UIUtils.MeleeTagNames, DataMgr.WeaponTag[WeaponTag].WeaponTagTextmap or "")
    end
    for _, value in ipairs(UIUtils.RangedTags) do
      table.insert(UIUtils.RangedTagNames, DataMgr.WeaponTag[value].WeaponTagTextmap or "")
    end
  end
  return UIUtils.MeleeTags, UIUtils.MeleeTagNames, UIUtils.RangedTags, UIUtils.RangedTagNames
end

function UIUtils.CanApplyWeaponSkin(WeaponId, SkinApplicationType)
  local Data = DataMgr.Weapon[WeaponId]
  if Data and Data.SkinApplicationType then
    for key, value in pairs(Data.SkinApplicationType) do
      if value == SkinApplicationType then
        return true
      end
    end
  end
  return false
end

function UIUtils.ShowDungeonRewardUI(Rewards, Reason, TableTypeName)
  if not Rewards then
    return
  end
  if not IsStandAlone(GWorld.GameInstance) and not IsClient(GWorld.GameInstance) then
    return
  end
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  if TalkContext:HasHiddenGameUI() then
    table.insert(GWorld.GameInstance.CacheShowRewardUIParams, {
      Rewards,
      Reason,
      TableTypeName
    })
    return
  end
  for ItemId, Count in pairs(Rewards) do
    if "table" == type(Count) then
      Count = RewardBox:GetCount(Count)
    end
    UIUtils.ShowGotItemTipsUI(TableTypeName, ItemId, Count)
  end
end

function UIUtils.OnGetRewardShowUI(Rewards, Reason)
  UIUtils.ShowDungeonRewardUI(Rewards.Resources, Reason, "Resource")
  UIUtils.ShowDungeonRewardUI(Rewards.Weapons, Reason, "Weapon")
  UIUtils.ShowDungeonRewardUI(Rewards.Mods, Reason, "Mod")
end

function UIUtils.GenRougeBlessingDesc(BlessingId, ModLevel, ComparedGradeLevel)
  local ItemData = DataMgr.RougeLikeBlessing[BlessingId]
  local ModData = DataMgr.Mod[ItemData.BlessingMod]
  local DescStr = GText(ItemData.Desc)
  if ItemData then
    for i, Attr in pairs(ModData.AddAttrs or {}) do
      local AttrConf = DataMgr.AttrConfig[Attr.AttrName]
      if not AttrConf then
      else
        local OldValue, OldValStr = UIUtils.GenRougeModAttrData(Attr, ModLevel, AttrConf, ItemData.BlessingMod)
        local index = string.find(OldValStr, "%%", 1)
        if index then
          OldValStr = OldValStr .. "%"
        end
        if ComparedGradeLevel then
          local ComparedValue, ComparedValueStr = UIUtils.GenRougeModAttrData(Attr, ComparedGradeLevel, AttrConf, ItemData.BlessingMod)
          if index then
            ComparedValueStr = ComparedValueStr .. "%"
          end
          if OldValStr ~= ComparedValueStr then
            OldValStr = OldValStr .. "->" .. ComparedValueStr
          end
        end
        DescStr = string.gsub(DescStr, "#" .. i, OldValStr)
      end
    end
    DescStr = UIUtils.GenRougeModPassiveEffectDesc(DescStr, ModData, ModLevel, ComparedGradeLevel, false, true)
  end
  return DescStr
end

function UIUtils.GenRougeBlessingSimpleDesc(BlessingId)
  local ItemData = DataMgr.RougeLikeBlessing[BlessingId]
  local DescStr = GText(ItemData.SimpleDesc)
  return DescStr
end

function UIUtils.GenRougeModPassiveEffectDesc(Desc, ModConf, BaseLevel, ExpectLevel, CastTo, ForbidFormat)
  if not ArmoryUtils then
    ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
  end
  ExpectLevel = nil == ExpectLevel and BaseLevel or ExpectLevel
  for i, DescValue in pairs(ModConf.DescValues or {}) do
    local Percent = string.match(DescValue, "%%") or ""
    local ValStr = ArmoryUtils:_ModAttrGrowDesc2(DescValue, BaseLevel, BaseLevel, Percent, CastTo, ForbidFormat) or ""
    ValStr = "" == ValStr and ArmoryUtils:_SkillGrowDesc(DescValue, BaseLevel, BaseLevel, Percent, CastTo, ForbidFormat) or ValStr
    if ExpectLevel then
      local ComparedValStr = ArmoryUtils:_ModAttrGrowDesc2(DescValue, ExpectLevel, ExpectLevel, Percent, CastTo, ForbidFormat) or ""
      ComparedValStr = "" == ComparedValStr and ArmoryUtils:_SkillGrowDesc(DescValue, ExpectLevel, ExpectLevel, Percent, CastTo, ForbidFormat) or ComparedValStr
      if ValStr ~= ComparedValStr then
        ValStr = ValStr .. "->" .. ComparedValStr
      end
    end
    Desc = string.gsub(Desc, "$" .. i, ValStr)
  end
  return Desc
end

function UIUtils.GenRougeTreasureDesc(TreasureId)
  if not ArmoryUtils then
    ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
  end
  local ItemData = DataMgr.RougeLikeTreasure[TreasureId]
  if ItemData then
    local DescStr = GText(ItemData.Desc)
    local ModData = DataMgr.Mod[ItemData.TreasureMod]
    if not ItemData.ServerBuild and not ItemData.ClientBuild and not ModData then
      local String = tostring(TreasureId) .. "\229\143\183\229\174\157\231\137\169\228\184\141\230\152\175ServerBuild\228\184\142ClientBuild\239\188\140\228\189\134Mod\230\149\176\230\141\174\228\184\186\231\169\186\232\175\183\231\173\150\229\136\146\230\163\128\230\159\165"
      UE.ARougeLikeManager.ShowRougeLikeError(String)
    end
    if ModData then
      for i, Attr in pairs(ModData.AddAttrs or {}) do
        local AttrConf = DataMgr.AttrConfig[Attr.AttrName]
        if not AttrConf then
        else
          local OldValue, OldValStr = UIUtils.GenRougeModAttrData(Attr, 0, AttrConf, ItemData.TreasureMod)
          local Percent = string.match(OldValStr, "%%") or ""
          DescStr = string.gsub(DescStr, "#" .. i, OldValStr .. Percent)
        end
      end
      DescStr = UIUtils.GenRougeModPassiveEffectDesc(DescStr, ModData, 0, nil, false, true)
    end
    DescStr = UIUtils.GenRougeServerDesc(DescStr, ItemData, 0)
    return DescStr
  else
    local String = tostring(TreasureId) .. "\229\143\183\229\174\157\231\137\169\230\149\176\230\141\174\228\184\186\231\169\186\232\175\183\231\173\150\229\136\146\230\163\128\230\159\165"
    UE.ARougeLikeManager.ShowRougeLikeError(String)
  end
end

function UIUtils.GenRougeServerDesc(Desc, TreasureConf, BaseLevel)
  for i, DescValue in pairs(TreasureConf.ServerBuildValue or {}) do
    local Percent = string.match(DescValue, "%%") or ""
    local ValStr = ""
    ValStr = SkillUtils.CalcSkillDesc(DescValue, BaseLevel) .. Percent
    Desc = string.gsub(Desc, "@" .. i, ValStr)
  end
  return Desc
end

function UIUtils.GetRealCurrentTreasureGroupNum(TreasureId)
  local Num = 0
  if UE.ARougeLikeManager then
    local TreasureGroupData = DataMgr.TreasureGroup
    local TreasureData = DataMgr.RougeLikeTreasure
    if not TreasureData[TreasureId] or not TreasureData[TreasureId].TreasureGroup then
      return 0
    end
    local GroupId = TreasureData[TreasureId].TreasureGroup
    if not TreasureGroupData[GroupId] then
      return 0
    end
    for _, value in pairs(TreasureGroupData[GroupId].ActivateNeed) do
      if UE.ARougeLikeManager.IsTreasureExist(GWorld.GameInstance, value) then
        Num = Num + 1
      end
    end
    return Num
  end
  return Num
end

function UIUtils.GetCurrentTreasureGroupNum(TreasureId)
  local Num = 0
  if UE.ARougeLikeManager then
    local TreasureGroupData = DataMgr.TreasureGroup
    local TreasureData = DataMgr.RougeLikeTreasure
    if not TreasureData[TreasureId] or not TreasureData[TreasureId].TreasureGroup then
      return 0
    end
    local GroupId = TreasureData[TreasureId].TreasureGroup
    if not TreasureGroupData[GroupId] then
      return 0
    end
    for _, value in pairs(TreasureGroupData[GroupId].ActivateNeed) do
      if value ~= TreasureId and UE.ARougeLikeManager.IsTreasureExist(GWorld.GameInstance, value) then
        Num = Num + 1
      end
    end
    return Num
  end
  return Num
end

function UIUtils.GetTreasureGroupNum(TreasureId)
  local Num = 0
  if UE.ARougeLikeManager then
    local TreasureGroupData = DataMgr.TreasureGroup
    local TreasureData = DataMgr.RougeLikeTreasure
    if not TreasureData[TreasureId] or not TreasureData[TreasureId].TreasureGroup then
      return 0
    end
    local GroupId = TreasureData[TreasureId].TreasureGroup
    if not TreasureGroupData[GroupId] or not TreasureGroupData[GroupId].ActivateNeed then
      return 0
    end
    Num = #TreasureGroupData[GroupId].ActivateNeed
    return Num
  end
  return Num
end

function UIUtils.GenRougeTreasureSimpleDesc(TreasureId)
  local ItemData = DataMgr.RougeLikeTreasure[TreasureId]
  local DescStr = GText(ItemData.SimpleDesc)
  return DescStr
end

function UIUtils.GenRougeTalentDesc(TalentId)
  local ItemData = DataMgr.RougeLikeTalent[TalentId]
  local ModData = DataMgr.Mod[ItemData.TalentMod]
  local DescStr = GText(ItemData.Desc)
  if ItemData then
    if ModData then
      for i, Attr in pairs(ModData.AddAttrs or {}) do
        local AttrConf = DataMgr.AttrConfig[Attr.AttrName]
        if not AttrConf then
        else
          local OldValue, OldValStr = UIUtils.GenRougeModAttrData(Attr, 0, AttrConf, ItemData.TalentMod)
          local Percent = string.match(OldValStr, "%%") or ""
          DescStr = string.gsub(DescStr, "#" .. i, OldValStr .. Percent)
        end
      end
      DescStr = UIUtils.GenRougeModPassiveEffectDesc(DescStr, ModData, 0)
    end
    DescStr = UIUtils.GenRougeServerDesc(DescStr, ItemData, 0)
  end
  return DescStr
end

function UIUtils.GetLeftTimeStrStyle1(EndTime, StartTime)
  if EndTime <= TimeUtils.NowTime() then
    return "TimeOut"
  end
  local FixEndTime = URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(EndTime)
  local FixStartTime = URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(StartTime or TimeUtils.NowTime())
  local RemainTime = UKismetMathLibrary.Subtract_DateTimeDateTime(FixEndTime, FixStartTime)
  local RemainTimeStr = ""
  local TimeCount = 0
  if UKismetMathLibrary.GetDays(RemainTime) > 0 then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_DAY"), UKismetMathLibrary.GetDays(RemainTime))
  end
  if UKismetMathLibrary.GetHours(RemainTime) > 0 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_HOUR"), UKismetMathLibrary.GetHours(RemainTime))
  end
  if UKismetMathLibrary.GetMinutes(RemainTime) > 0 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_MINUTE"), UKismetMathLibrary.GetMinutes(RemainTime))
  end
  if UKismetMathLibrary.GetSeconds(RemainTime) > 0 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    RemainTimeStr = RemainTimeStr .. string.format(GText("UI_SHOP_REMAINTIME_SECOND"), UKismetMathLibrary.GetSeconds(RemainTime))
  end
  return RemainTimeStr
end

function UIUtils.GetLeftTimeStrStyle2(EndTime, StartTime)
  if nil == EndTime or EndTime <= TimeUtils.NowTime() then
    return {
      {TimeType = "Min", TimeValue = 0},
      {TimeType = "Sec", TimeValue = 0}
    }, 0
  end
  local FixEndTime = URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(EndTime)
  local FixStartTime = URuntimeCommonFunctionLibrary.GetDateTimeFromUnixTime(StartTime or TimeUtils.NowTime())
  local RemainTime = UKismetMathLibrary.Subtract_DateTimeDateTime(FixEndTime, FixStartTime)
  local RemainTimeDict = {}
  local TimeCount = 0
  local LeftDayTime = UKismetMathLibrary.GetDays(RemainTime)
  if LeftDayTime > 0 then
    TimeCount = TimeCount + 1
    table.insert(RemainTimeDict, {TimeType = "Day", TimeValue = LeftDayTime})
  end
  local LeftHourTime = UKismetMathLibrary.GetHours(RemainTime)
  if LeftHourTime > 0 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    table.insert(RemainTimeDict, {TimeType = "Hour", TimeValue = LeftHourTime})
  end
  local LeftMinuteTime = UKismetMathLibrary.GetMinutes(RemainTime)
  if TimeCount <= 1 then
    TimeCount = TimeCount + 1
    table.insert(RemainTimeDict, {TimeType = "Min", TimeValue = LeftMinuteTime})
  end
  local LeftSecondTime = UKismetMathLibrary.GetSeconds(RemainTime)
  if LeftSecondTime > 0 and TimeCount < 2 or 1 == TimeCount then
    TimeCount = TimeCount + 1
    table.insert(RemainTimeDict, {TimeType = "Sec", TimeValue = LeftSecondTime})
  end
  return RemainTimeDict, TimeCount
end

function UIUtils.GenRougeModAttrData(ModAttrConf, ModLevel, AttrConf, ModId)
  if not ArmoryUtils then
    ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
  end
  local IsRate = ModAttrConf.Rate ~= nil
  local Value = ArmoryUtils:CalcModAttrByLevel(ModAttrConf, ModLevel, nil, ModId)
  local ValueStr = CommonUtils.AttrValueToString(AttrConf, Value, IsRate, true)
  return Value, ValueStr
end

function UIUtils.SwitchGuideHead(RawName, MID)
  local Path = "/Game/UI/Blueprint/EMUIFunctionLibrary"
  local UIFunctionLibClass = LoadClass(Path)
  if UIFunctionLibClass then
    return UIFunctionLibClass.SwitchGuideHead(RawName, MID)
  else
    DebugPrint("Error: UIFunctionLibClass\228\184\141\229\173\152\229\156\168\239\188\140\232\183\175\229\190\132", Path)
    return false
  end
end

function UIUtils.ShowActionRecover(Obj)
end

function UIUtils.GetCharName(Character)
  if Character:IsPlayer() then
    return Character:GetNickName()
  elseif Character:IsPhantom() then
    local CurRoleId = Character.CurrentRoleId
    return GText(DataMgr.BattleChar[CurRoleId].CharName)
  end
  return "nil"
end

function UIUtils.UtilsGetCurrentInputType()
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
  if IsValid(GameInputModeSubsystem) then
    return GameInputModeSubsystem:GetCurrentInputType()
  end
  return ECommonInputType.MouseAndKeyboard
end

function UIUtils.IsKeyboardInput()
  local InputType = UIUtils.UtilsGetCurrentInputType()
  return InputType == UE4.ECommonInputType.MouseAndKeyboard and CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
end

function UIUtils.IsGamepadInput()
  local InputType = UIUtils.UtilsGetCurrentInputType()
  return InputType == UE4.ECommonInputType.Gamepad
end

function UIUtils.IsMobileInput()
  return CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
end

function UIUtils.UtilsGetCurrentGamepadName()
  if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" then
    return "Generic"
  end
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(GWorld.GameInstance)
  if IsValid(GameInputModeSubsystem) then
    return GameInputModeSubsystem:GetCurrentGamepadName()
  end
  return "Generic"
end

function UIUtils.UtilsGetKeyIconPathInGamepad(KeyIconName, GamepadName)
  if nil == GamepadName then
    GamepadName = UIUtils.UtilsGetCurrentGamepadName()
  end
  local FixPath, ImgPath
  local ReplaceKey = string.gsub(KeyIconName, " ", "_")
  if "PS" == GamepadName then
    FixPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Key/PS5/T_Key_%s.T_Key_%s'"
  else
    FixPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Key/XBOX/T_Key_%s.T_Key_%s'"
  end
  ImgPath = string.format(FixPath, ReplaceKey, ReplaceKey)
  return ImgPath
end

function UIUtils.UtilsGetKeyIconPathInGamepadByInstruction(KeyIconName, GamepadName)
  if nil == GamepadName then
    GamepadName = UIUtils.UtilsGetCurrentGamepadName()
  end
  local FixPath, ImgPath
  local ReplaceKey = string.gsub(KeyIconName, " ", "_")
  if "PS" == GamepadName then
    FixPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Instruction/PS5/T_Key_%s.T_Key_%s'"
  else
    FixPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Instruction/XBOX/T_Key_%s.T_Key_%s'"
  end
  ImgPath = string.format(FixPath, ReplaceKey, ReplaceKey)
  return ImgPath
end

function UIUtils.GetNoneAccessoryIconPath()
  return "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Forbid.T_Armory_Forbid"
end

function UIUtils.TrySubReddotCacheDetail(Id, ReddotName)
  local CacheKey = tostring(Id)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(ReddotName)
  if CacheDetail and CacheDetail[CacheKey] then
    CacheDetail[CacheKey] = false
    ReddotManager.DecreaseLeafNodeCount(ReddotName)
  end
end

function UIUtils.TryAddReddotCacheDetail(Id, ReddotName)
  local CacheKey = tostring(Id)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(ReddotName)
  if CacheDetail and not CacheDetail[CacheKey] then
    CacheDetail[CacheKey] = true
    ReddotManager.IncreaseLeafNodeCount(ReddotName)
  end
end

function UIUtils.TrySubReddotCacheDetailNumber(Id, ReddotName)
  local CacheKey = Id
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(ReddotName)
  if CacheDetail and CacheDetail[CacheKey] then
    CacheDetail[CacheKey] = false
    ReddotManager.DecreaseLeafNodeCount(ReddotName)
  end
end

function UIUtils.TryAddReddotCacheDetailNumber(Id, ReddotName)
  local CacheKey = Id
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(ReddotName)
  if CacheDetail and not CacheDetail[CacheKey] then
    CacheDetail[CacheKey] = true
    ReddotManager.IncreaseLeafNodeCount(ReddotName)
  end
end

function UIUtils.SetReddotTreeLeafNodeCount(ReddotName, Count)
  local Node = ReddotManager.GetTreeNode(ReddotName)
  assert(Node, "[jiangtianyi]ReddotManager.SetReddotTreeLeafNodeCount: Failed to find leaf node " .. ReddotName)
  local CurrentCount = Node.Count
  if Count < CurrentCount then
    ReddotManager.DecreaseLeafNodeCount(ReddotName, CurrentCount - Count)
  elseif Count > CurrentCount then
    ReddotManager.IncreaseLeafNodeCount(ReddotName, Count - CurrentCount)
  end
end

function UIUtils.GetExcelWeaponTagString(CharId)
  local Data = DataMgr.BattleChar[CharId]
  local ExcelWeaponTags = Data and Data.ExcelWeaponTags
  if ExcelWeaponTags then
    local TagString
    if type(ExcelWeaponTags) == "table" then
      TagString = GText(DataMgr.WeaponTag[ExcelWeaponTags[1]].WeaponTagTextmap)
      for i = 2, #ExcelWeaponTags do
        TagString = TagString .. "/" .. GText(DataMgr.WeaponTag[ExcelWeaponTags[i]].WeaponTagTextmap)
      end
    else
      TagString = GText(DataMgr.WeaponTag[ExcelWeaponTags].WeaponTagTextmap)
    end
    return TagString
  end
end

function UIUtils.GetExcelWeaponTags(CharId)
  local Data = DataMgr.BattleChar[CharId]
  local ExcelWeaponTags = Data and Data.ExcelWeaponTags
  local Tags = {}
  if ExcelWeaponTags then
    if type(ExcelWeaponTags) == "table" then
      table.insert(Tags, ExcelWeaponTags[1])
      for i = 2, #ExcelWeaponTags do
        table.insert(Tags, ExcelWeaponTags[i])
      end
    else
      table.insert(Tags, ExcelWeaponTags)
    end
    return Tags
  end
end

function UIUtils.GetDispathchColorNameByType(Type)
  if "Battle" == Type then
    return "Red"
  elseif "Collect" == Type or "Mine" == Type or "Fish" == Type or "Pet" == Type then
    return "Blue"
  elseif "Benefit" == Type or "Morality" == Type or "Wisdom" == Type or "Empathy" == Type or "Chaos" == Type then
    return "Green"
  elseif "Workaholic" == Type or "Rigorous" == Type or "Skilled" == Type or "Lucky" == Type then
    return "Special"
  end
end

function UIUtils.NumberToChinese(Num)
  local ChineseNums = {
    "\233\155\182",
    "\228\184\128",
    "\228\186\140",
    "\228\184\137",
    "\229\155\155",
    "\228\186\148",
    "\229\133\173",
    "\228\184\131",
    "\229\133\171",
    "\228\185\157"
  }
  return ChineseNums[Num + 1]
end

function UIUtils.GenAbyssEntryDesc(Desc, EntryConf, BaseLevel, ExpectLevel)
  if not ArmoryUtils then
    ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
  end
  ExpectLevel = nil == ExpectLevel and BaseLevel or ExpectLevel
  for i, DescValue in pairs(EntryConf or {}) do
    local Percent = string.match(DescValue, "%%") or ""
    local ValStr = IsModAttr2 and ArmoryUtils:_ModAttrGrowDesc2(DescValue, BaseLevel, BaseLevel, Percent) or ""
    ValStr = "" == ValStr and SkillUtils.CalcSkillDesc(DescValue, BaseLevel) .. Percent or ValStr
    if ExpectLevel then
      local ComparedValStr = IsModAttr2 and ArmoryUtils:_ModAttrGrowDesc2(DescValue, ExpectLevel, ExpectLevel, Percent) or ""
      ComparedValStr = "" == ComparedValStr and SkillUtils.CalcSkillDesc(DescValue, BaseLevel) .. Percent or ComparedValStr
      if ValStr ~= ComparedValStr then
        ValStr = ValStr .. "->" .. ComparedValStr
      end
    end
    Desc = string.gsub(Desc, "#" .. i, ValStr)
  end
  return Desc
end

function UIUtils.GenerateArmoryPreviewParamsBySquadInfo(InOutParams, SquadInfo)
  local ModUuid = 1
  
  local function InitTargetModInfo(TargetInfo, Target)
    if not TargetInfo.ModData then
      return
    end
    local ModSlotPolarity = Target and Target.ModSlotPolarity or {}
    TargetInfo.ModSuitIndex = 1
    TargetInfo.SlotData = {}
    for i, value in ipairs(TargetInfo.ModData) do
      value.Uuid = ModUuid
      TargetInfo.SlotData[i] = {
        SlotId = i,
        Polarity = ModSlotPolarity[i] or -1,
        ModEid = ModUuid
      }
      ModUuid = ModUuid + 1
    end
  end
  
  local Avatar = InOutParams.Avatar or GWorld:GetAvatar()
  local AvatarBattleInfo = AvatarUtils:GetDefaultBattleInfo(Avatar, SquadInfo) or {}
  InitTargetModInfo(AvatarBattleInfo.RoleInfo, SquadInfo.Char)
  InOutParams.PreviewCharInfos = {
    AvatarBattleInfo.RoleInfo
  }
  InitTargetModInfo(AvatarBattleInfo.MeleeWeapon, SquadInfo.MeleeWeapon)
  InitTargetModInfo(AvatarBattleInfo.RangedWeapon, SquadInfo.RangedWeapon)
  InOutParams.PreviewWeaponInfos = {
    AvatarBattleInfo.MeleeWeapon,
    AvatarBattleInfo.RangedWeapon
  }
  InOutParams.PreviewUWeaponInfos = {}
  if AvatarBattleInfo.UltraWeapons then
    for i, value in ipairs(AvatarBattleInfo.UltraWeapons) do
      InitTargetModInfo(value, SquadInfo.UltraWeapons[i])
      table.insert(InOutParams.PreviewUWeaponInfos, value)
    end
  end
  return InOutParams
end

function UIUtils.LoadSkillIconById(SkillId)
  local SkillData = DataMgr.Skill[SkillId]
  local Data = SkillData and SkillData[1] and SkillData[1][0]
  local Icon
  if Data then
    local IconName = Data.SkillBtnIcon
    if IconName then
      Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Skill/T_" .. IconName .. ".T_" .. IconName)
    end
  end
  Icon = Icon or LoadObject("/Game/UI/Texture/Dynamic/Atlas/Skill/T_Skill_Heitao_Skill01.T_Skill_Heitao_Skill01")
  return Icon
end

function UIUtils.CalcWidgetCenter(Widget)
  local Geometry = Widget:GetTickSpaceGeometry()
  local LocalCenter = USlateBlueprintLibrary.GetLocalSize(Geometry) / 2
  return USlateBlueprintLibrary.LocalToAbsolute(Geometry, LocalCenter)
end

function UIUtils.CheckScrollBoxCanScroll(Widget)
  local Offset = Widget:GetScrollOffsetOfEnd()
  return Offset > 5
end

function UIUtils.ScrollBoxByGamepad(ScrollBox, InAnalogInputEvent, Velocity, DeadZone)
  Velocity = Velocity or 20
  DeadZone = DeadZone or 5
  local DeltaOffset = -1 * UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * Velocity
  if DeadZone > math.abs(DeltaOffset) then
    return
  end
  local CurrentOffset = ScrollBox:GetScrollOffset()
  local OffsetToEnd = ScrollBox:GetScrollOffsetOfEnd()
  local NextOffset = math.clamp(CurrentOffset + DeltaOffset, 0, OffsetToEnd)
  ScrollBox:SetScrollOffset(NextOffset)
end

function UIUtils.HasAnyFocus(Widget)
  return Widget:HasAnyUserFocus() or Widget:HasFocusedDescendants()
end

function UIUtils.GetIconListByActionName(ActionName)
  local GamepadLayout = EMCache:Get("GamepadLayout") or tonumber(DataMgr.Option.GamepadPreset.DefaultValue)
  local IconList
  local ActionData = DataMgr.GamepadMap[ActionName]
  if ActionData then
    IconList = ActionData.GamepadIcon[GamepadLayout]
  else
    print(_G.ErrorTag, ActionName, "\239\188\154\230\173\164Action\230\178\161\230\156\137\229\175\185\229\186\148\231\154\132\233\148\174\228\189\141\239\188\140\232\175\183\230\163\128\230\159\165\230\139\188\229\134\153\230\136\150\230\163\128\230\159\165GamepadSet\232\161\168\233\135\140\230\152\175\229\144\166\230\156\137\229\161\171\229\134\153")
  end
  if not IconList then
    print(_G.ErrorTag, ActionName, "\239\188\154\231\155\174\229\137\141\231\154\132\233\162\132\232\174\190\230\150\185\230\161\136\230\178\161\230\156\137\229\175\185\229\186\148\231\154\132\233\148\174\228\189\141\239\188\140\232\175\183\230\163\128\230\159\165GamepadSet\232\161\168\233\135\140\230\152\175\229\144\166\230\156\137\229\161\171\229\134\153")
  else
    return IconList
  end
end

function UIUtils.GetIconListByActionNameAndSetNum(ActionName, Num)
  local ActionData = DataMgr.GamepadMap[ActionName]
  if ActionData then
    return ActionData.GamepadIcon[Num]
  end
end

function UIUtils.GetTextFont(TextWidget)
  assert(TextWidget:IsA(UTextLayoutWidget), "UIUtils.GetTextFont, \233\148\153\232\175\175\239\188\140\229\143\130\230\149\176TextWidget\229\191\133\233\161\187\230\152\175\230\150\135\230\156\172\230\142\167\228\187\182")
  local Font
  if TextWidget:IsA(URichTextBlock) then
    if TextWidget.bOverrideDefaultStyle then
      Font = TextWidget.DefaultTextStyleOverride.Font
    else
      Font = TextWidget.DefaultTextStyle.Font
    end
  elseif TextWidget:IsA(UTextBlock) then
    Font = TextWidget.Font
  elseif TextWidget:IsA(UMultiLineEditableText) then
    Font = TextWidget.WidgetStyle.Font
  elseif TextWidget:IsA(UMultiLineEditableTextBox) then
    Font = TextWidget.WidgetStyle.Font
  end
  if not Font then
    GWorld.logger.error("UIUtils.GetTextFont \229\143\130\230\149\176TextWidget\230\152\175\228\184\141\230\148\175\230\140\129\231\154\132\230\150\135\230\156\172\230\150\135\230\156\172\230\142\167\228\187\182\239\188\140\229\133\182\228\187\150\230\150\135\230\156\172\230\142\167\228\187\182\231\177\187\229\158\139\230\156\137\233\156\128\232\166\129\231\154\132\229\134\141\232\128\131\232\153\145\230\137\169\229\177\149")
  end
  return Font
end

function UIUtils.CheckCdnHide(UIName, ShowToast)
  local Avatar = GWorld:GetAvatar()
  local UIData = {}
  if Avatar and Avatar.CdnHideData and Avatar.CdnHideData.game_ui then
    UIData = Avatar.CdnHideData.game_ui
  else
    return false
  end
  for _, MainUIConfig in pairs(DataMgr.MainUI) do
    if UIName == MainUIConfig.SystemUIName then
      for __, Data in pairs(UIData) do
        if Data.config == false then
          for ___, HideUIName in pairs(Data.gameCtrlGameUI) do
            if HideUIName == MainUIConfig.Name then
              UIUtils.ShowMainUIFobidToast(MainUIConfig)
              return true
            end
          end
        end
      end
    end
  end
  return false
end

function UIUtils.ShowMainUIFobidToast(MainUIConfig)
  if MainUIConfig.UIUnlockRuleName then
    local UIUnlockRule = DataMgr.UIUnlockRule
    local OpenDescs = UIUnlockRule[MainUIConfig.UIUnlockRuleName].OpenSystemDesc
    if OpenDescs and ShowToast then
      local UIManager = GWorld.GameInstance:GetGameUIManager()
      if UIManager then
        UIManager:ShowUITip(UIConst.Tip_CommonToast, OpenDescs[1])
      end
    end
  end
end

function UIUtils.CalcOnelineTextDesireHeight(TextWidget)
  assert(TextWidget:IsA(UTextLayoutWidget), "UIUtils.CalcOnelineTextDesireHeight, \233\148\153\232\175\175\239\188\140\229\143\130\230\149\176TextWidget\229\191\133\233\161\187\230\152\175\230\150\135\230\156\172\230\142\167\228\187\182")
  local Font = UIUtils.GetTextFont(TextWidget)
  if not Font then
    return
  end
  local FontHeight = UUIFunctionLibrary.GetFontHeight(Font) * TextWidget.LineHeightPercentage
  local OnelineDesireHeight = TextWidget.Margin.Top + TextWidget.Margin.Bottom + FontHeight
  return OnelineDesireHeight
end

function UIUtils.SetTextJustificationByLineCount(TextWidget, bForceCenter, ExpectLine, Justifications)
  assert(TextWidget:IsA(UTextLayoutWidget), "UIUtils.LayoutTextByLineRule, \233\148\153\232\175\175\239\188\140\229\143\130\230\149\176TextWidget\229\191\133\233\161\187\230\152\175\230\150\135\230\156\172\230\142\167\228\187\182")
  local DesireHeight = TextWidget:GetDesiredSize().Y
  if 0 == DesireHeight then
    TextWidget:ForceLayoutPrepass()
    DesireHeight = TextWidget:GetDesiredSize().Y
  end
  if 0 == DesireHeight then
    GWorld.logger.error("UIUtils.LayoutTextByLineRule \229\143\130\230\149\176TextWidget\230\178\161\230\156\137\231\187\152\229\136\182\229\174\140\230\136\150\232\128\133\232\135\170\232\186\171\233\171\152\229\186\166\229\176\177\230\152\1750\239\188\140\230\151\160\230\179\149\229\136\164\230\150\173\228\187\128\228\185\136\230\151\182\229\128\153\232\175\165\230\141\162\232\161\140")
    return
  end
  ExpectLine = ExpectLine or 1
  Justifications = Justifications or {
    ETextJustify.Center,
    ETextJustify.Left
  }
  if bForceCenter then
    for _, Justification in ipairs(Justifications) do
      if Justification == ETextJustify.Center then
        TextWidget:SetJustification(Justification)
        return
      end
    end
  end
  local Factor = 0.5
  if UIUtils.IsGamepadInput() then
    local Text = TextWidget:GetText()
    if string.match(Text, "<img.-%s*></>") then
      Factor = 1
    end
  end
  local OnelineDesireHeight = UIUtils.CalcOnelineTextDesireHeight(TextWidget)
  if DesireHeight <= OnelineDesireHeight * (ExpectLine + Factor) then
    TextWidget:SetJustification(Justifications[1])
  else
    TextWidget:SetJustification(Justifications[2])
  end
end

function UIUtils.LoadPreviewSkillDetails(Parent, Params)
  if not Parent then
    return
  end
  Params = Params or {}
  local UIConfig = DataMgr.SystemUI.SkillDetails
  local GameInstance = GWorld.GameInstance
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  local CharInfo = {}
  if not IsStandAlone(Player) then
    local Avatar = GWorld:GetAvatar()
    for _, Value in pairs(Avatar.Chars) do
      if Value.CharId == Player.CurrentRoleId then
        CharInfo = AvatarUtils:GetCharBattleInfo(Avatar, Value, Value.ModSuitIndex).RoleInfo
        break
      end
    end
  else
    CharInfo = CommonUtils.CopyTable(Player.InfoForInit)
  end
  CharInfo.ModSuitIndex = CharInfo.ModSuitIndex or 1
  CharInfo.SlotData = CharInfo.SlotData or {}
  for index, value in ipairs(CharInfo.ModData or {}) do
    CharInfo.SlotData[index] = CharInfo.SlotData[index] or {}
    local SlotData = CharInfo.SlotData[index]
    SlotData.SlotId = SlotData.SlotId or index
    SlotData.Polarity = SlotData.Polarity or -1
    if not value.Uuid or value.Uuid == "" or 0 == value.Uuid or -1 == value.Uuid then
      value.Uuid = index
    end
    if not SlotData.ModEid or "" == SlotData.ModEid or 0 == SlotData.ModEid or -1 == SlotData.ModEid then
      SlotData.ModEid = value.Uuid
    end
  end
  UIManager(Parent):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, Parent:GetZOrder(), {
    OnClosedObj = Parent,
    OnClosedCallback = Params.OnClosedCallback,
    PreviewCharInfo = CharInfo,
    IsPreviewMode = true
  })
end

function UIUtils.GenRougeCombatTermDesc(SkillDesc, Terms)
  local results = {SkillDesc}
  UIUtils.AddHyperLink(results, Terms, 1)
  local DescText = ""
  for index, value in ipairs(results) do
    DescText = DescText .. value
  end
  return DescText
end

function UIUtils.AddHyperLink(StrArray, Terms, TermIdx)
  if TermIdx > #Terms then
    return
  end
  local Term = GText(DataMgr.CombatTerm[Terms[TermIdx]].CombatTerm)
  local LStr, RStr, bSuccess = UKismetStringLibrary.Split(StrArray[#StrArray], Term)
  if not bSuccess then
    UIUtils.AddHyperLink(StrArray, Terms, TermIdx + 1)
  else
    StrArray[#StrArray] = LStr
    UIUtils.AddHyperLink(StrArray, Terms, TermIdx + 1)
    table.insert(StrArray, "<H_Under>" .. Term .. "</>")
    table.insert(StrArray, RStr)
    UIUtils.AddHyperLink(StrArray, Terms, TermIdx)
  end
end

function UIUtils.AddPositioningTagToPanel(Panel, CharId)
  if not Panel or not CharId then
    return
  end
  local WidgetCount = 0
  local Data = DataMgr.BattleChar[CharId]
  if Data and Data.Positioning then
    local IconWidget = Panel:GetChildAt(0)
    if not IconWidget then
      return
    end
    local UIManager = UIManager(Panel)
    local IconWidgetClass = UGameplayStatics.GetObjectClass(IconWidget)
    for _, value in pairs(Data.Positioning) do
      local PData = DataMgr.Positioning[value]
      if PData then
        IconWidget = Panel:GetChildAt(WidgetCount)
        if not IconWidget then
          IconWidget = UIManager:CreateWidget(IconWidgetClass)
          Panel:AddChild(IconWidget)
        end
        if PData.Icon then
          IconWidget:SetIcon(LoadObject(PData.Icon))
        end
        WidgetCount = WidgetCount + 1
      end
    end
  end
  if WidgetCount > 0 then
    Panel:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    local Start, End = WidgetCount, Panel:GetChildrenCount() - 1
    for i = End, Start, -1 do
      Panel:RemoveChildAt(i)
    end
  else
    Panel:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function UIUtils.GetCharMiniIconPath(CharId)
  local PhantomGuideIconImg = "T_Normal_" .. DataMgr.BattleChar[CharId].GuideIconImg
  return "Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Mini/" .. PhantomGuideIconImg .. "." .. PhantomGuideIconImg .. "'"
end

function UIUtils.OpenPopupToArmory(OtherPopupParms)
  local function OpenArmoryFromPopup(Obj, Data, DialogWidget)
    DialogWidget.ClickResult = true
  end
  
  local function OnDialogClosedCallback(Obj, Data, DialogWidget)
    if DialogWidget.ClickResult == true then
      DebugPrint("OpenArmoryFromPopup")
      PageJumpUtils:JumpToTargetPageByJumpId(52)
      local ArmoryMain = UIManager(self):GetUIObj("ArmoryMain")
      if ArmoryMain then
        UIManager(self):GetUIObj("ArmoryMain").OnCloseDelegate = {
          nil,
          function()
            UIUtils:OpenPopupToArmory()
          end,
          self
        }
      else
        ScreenPrint("\230\178\161\230\156\137\230\137\190\229\136\176\229\134\155\230\162\176\229\186\147\231\149\140\233\157\162\239\188\140\229\133\179\233\151\173\231\149\140\233\157\162\229\144\142\228\184\141\228\188\154\230\137\147\229\188\128\229\188\185\231\170\151\227\128\130")
      end
    end
  end
  
  local Parms = {
    RightCallbackFunction = OpenArmoryFromPopup,
    RightCallbackObj = self,
    OnCloseCallbackFunction = OnDialogClosedCallback
  }
  UIManager(self):ShowCommonPopupUI(100217, Parms, self)
end

function UIUtils.CalculateHoleTitle(TitleBefore, TitleAfter)
  local TitleBeforeText, TitleAfterText
  if -1 ~= TitleBefore and DataMgr.Title[TitleBefore] then
    TitleBeforeText = DataMgr.Title[TitleBefore].Name or nil
  end
  if -1 ~= TitleAfter and DataMgr.Title[TitleAfter].Name then
    TitleAfterText = DataMgr.Title[TitleAfter].Name or nil
  end
  TitleBeforeText = TitleBeforeText and (GText(TitleBeforeText) or "")
  TitleAfterText = TitleAfterText and (GText(TitleAfterText) or "")
  local WholeTitle = (TitleBeforeText or "") .. (TitleAfterText or "")
  return WholeTitle
end

function UIUtils.GetSortedTitleTable()
  local Avatar = GWorld:GetAvatar()
  local PrefixTitles = {}
  local SuffixTitles = {}
  local AllTitles = Avatar.Titles
  for index, value in pairs(AllTitles) do
    if DataMgr.Title[index] then
      local TitleData = DataMgr.Title[index]
      local TitleContent = {
        Name = TitleData.Name,
        TitleID = TitleData.TitleID
      }
      if TitleData.IfSuffix then
        table.insert(SuffixTitles, TitleContent)
      else
        table.insert(PrefixTitles, TitleContent)
      end
    end
  end
  return PrefixTitles, SuffixTitles
end

function UIUtils:SetTextColorInMaterialByRarity(UI, Text, Rarity)
  local FontMaterial = Text:GetDynamicFontMaterial()
  if 5 == Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", UI.Img_Text_5)
  elseif 4 == Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", UI.Img_Text_4)
  elseif 3 == Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", UI.Img_Text_3)
  elseif 2 == Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", UI.Img_Text_2)
  elseif 1 == Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", UI.Img_Text_1)
  else
    FontMaterial:SetTextureParameterValue("IconTex", UI.Img_Text_0)
  end
end

function UIUtils.SetTitle(TitleWidget, TitleInfo)
  if TitleWidget then
    TitleWidget:ClearChildren()
    TitleWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    return
  end
  if not TitleInfo then
    return
  end
  local PrefixId = TitleInfo.TitleBefore
  local SuffixId = TitleInfo.TitleAfter
  local TitleFrameId = TitleInfo.TitleFrame
  if (not PrefixId or PrefixId <= 0) and (not SuffixId or SuffixId <= 0) then
    return
  end
  TitleWidget:SetVisibility(UIConst.VisibilityOp.Visible)
  local GameInstance = GWorld.GameInstance
  local UIManager = GameInstance:GetGameUIManager()
  if UIManager and UIManager.LoadTitleFrameWidget then
    local TitleFrameWidget = UIManager:LoadTitleFrameWidget(TitleFrameId or -1)
    if TitleFrameWidget then
      local SlotWidget = TitleWidget:AddChild(TitleFrameWidget)
      if SlotWidget then
        if TitleFrameWidget.SetTitleContent then
          TitleFrameWidget:SetTitleContent(PrefixId, SuffixId)
        elseif TitleFrameWidget.SetTitle then
          TitleFrameWidget:SetTitle(PrefixId, SuffixId)
        elseif TitleFrameWidget.SetEmpty and (not PrefixId or PrefixId <= 0) and (not SuffixId or SuffixId <= 0) then
          TitleFrameWidget:SetEmpty()
        end
      end
    end
  end
end

AssembleComponents(UIUtils)
return UIUtils
