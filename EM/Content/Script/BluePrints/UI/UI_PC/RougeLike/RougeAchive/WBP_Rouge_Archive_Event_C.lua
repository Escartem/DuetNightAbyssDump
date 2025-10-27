require("UnLua")
local RougeConst = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.RougeConst")
local ReddotManager = require("BluePrints.UI.Reddot.ReddotManager")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local EntryScale = FVector2D(0, 0)
local OriginSize = FVector2D(278, 545)
local AspectBase = 1.7777777777777777

function M:Construct()
  M.Super.Construct(self)
  self.List_Item.OnListViewScrolled:Add(self, self._OnListItemScrolled)
  self.List_Item.OnMouseButtonUp:Add(self, self.OnListItemReleased)
  self.PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
  self.List_Item:ClearListItems()
  self._bListEntryInitialized = false
  self._bMoveOff = false
  self.CurSelectIndex = nil
  self.CurSelectItem = nil
  self._ApplyEntryTimer = nil
  self.CenterPadding = 0
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
end

function M:OnListItemReleased()
  local Scrolloffset = self.List_Item:GetScrollOffset()
  local FullFillCount = self.List_Item:GetFullFillItemCount()
  local RealIndex = self.CurSelectIndex + FullFillCount
  local RealOffset = Scrolloffset + self.CenterPadding
  if math.abs(RealOffset - RealIndex) < 1 then
    self:SelectItem(self.CurSelectIndex, true)
  end
end

function M:_CalcEntryScale(Entry, ItemOffset)
  local FullFillCount = self.List_Item:GetFullFillItemCount()
  local EntryCoord = Entry.Index - (ItemOffset - FullFillCount)
  if math.abs(Entry.Index - self.CurSelectIndex) > math.ceil(FullFillCount / 2) then
    if Entry.Index > self.CurSelectIndex then
      EntryCoord = Entry.Index - self.MaxNum - (ItemOffset - FullFillCount)
    elseif Entry.Index < self.CurSelectIndex then
      EntryCoord = Entry.Index + self.MaxNum - (ItemOffset - FullFillCount)
    end
  end
  local mid = (FullFillCount - 1) / 2
  local VPSize = UE4.UWidgetLayoutLibrary.GetViewportSize(self)
  local Aspect = VPSize.X / VPSize.Y
  local Scale = 1
  if EntryCoord <= mid then
    local k1 = 1 / (1.4 * FullFillCount)
    local b1 = 1
    Scale = EntryCoord * k1 + b1
  elseif EntryCoord > mid then
    local k2 = -1 / (1.4 * FullFillCount)
    local b2 = 1.61 - 0.1 * (Aspect / AspectBase)
    Scale = EntryCoord * k2 + b2
  end
  if Scale < 1 then
    Scale = 1
  end
  return Scale
end

function M:_ApplyEntryScale(ItemOffset)
  ItemOffset = ItemOffset or self.List_Item:GetScrollOffset()
  for i, Entry in pairs(self.List_Item:GetDisplayedEntryWidgets()) do
    local Scale = self:_CalcEntryScale(Entry, ItemOffset)
    EntryScale.X = Scale
    EntryScale.Y = Scale
    Entry.Group_Item:SetRenderScale(EntryScale)
    local Slot = UWidgetLayoutLibrary.SlotAsCanvasSlot(Entry.Group_Item)
    local Size = FVector2D(OriginSize.X * Scale, OriginSize.Y)
    Slot:SetSize(Size)
  end
end

function M:_OnListItemScrolled(ItemOffset, DistanceRemaining)
  local bInitTimer = false
  if not self._ApplyEntryTimer then
    local _, Key = self:AddTimer(0.03, self._ApplyEntryScale, true, 0, nil, true)
    self._ApplyEntryTimer = Key
    bInitTimer = true
  end
  if self.bSelecting then
    return
  end
  if not self.CenterPadding then
    return
  end
  local FullFillCount = self.List_Item:GetFullFillItemCount()
  local RealIndex = self.CurSelectIndex + FullFillCount
  local RealOffset = ItemOffset + self.CenterPadding
  if math.abs(RealOffset - RealIndex) >= 1 then
    if RealIndex < RealOffset then
      local One = bInitTimer and 0 or 1
      self:SelectItem(self.CurSelectIndex + One)
    else
      self:SelectItem(self.CurSelectIndex - 1)
    end
  end
end

function M:Destruct()
  M.Super.Destruct(self)
  if self._ApplyEntryTimer then
    self:RemoveTimer(self._ApplyEntryTimer)
    self._ApplyEntryTimer = nil
  end
  self.CenterPadding = 0
  self.List_Item.OnMouseButtonUp:Clear()
  self.List_Item.OnListViewScrolled:Clear()
end

function M:InitUIInfo(EventInfo, DataModel)
  self.CenterPadding = 0
  self.bGamepadReady = false
  self.DataModel = DataModel
  self:InitReddot()
  self:Construct()
  self:InitTab()
  self.EventInfo = EventInfo
  self:ResortEventData(self.EventInfo)
  self:InitEventItems()
  self:InitBtns()
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "SwitchArchiveEvent", nil)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:InitGamepadView()
    self:AddTimer(self.In:GetEndTime() * 1.8, function()
      self.List_Item:SetFocus()
      self.bGamepadReady = true
    end)
  end
  self:AddInputMethodChangedListen()
end

function M:InitReddot()
  ReddotManager.AddListener("RougeArchiveReward", self, self.OnArchiveRewardReddotChange)
end

function M:OnArchiveRewardReddotChange(Count)
  DebugPrint("Tianyi@ OnArchiveRewardReddotChange", Count)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("RougeArchiveReward")
  if CacheDetail[RougeConst.ArchiveType.Event] then
    Count = #CacheDetail[RougeConst.ArchiveType.Event]
  end
  self.ArchiveRewardBtn:SetReddot(Count > 0)
end

function M:InitTab()
  local TabConfigData = {
    PlatformName = self.PlatformName,
    TitleName = GText("RLArchive_EventTitle"),
    DynamicNode = {"Back", "BottomKey"},
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.OnReturnKeyDown,
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    }
  }
  self.Root:InitOtherPageTab(TabConfigData, nil, true, self, nil)
end

function M:ResortEventData(EventInfo)
  self.SeriesList = {}
  for _, Data in pairs(DataMgr.RLRoomStorySeries) do
    if 1 == Data.RLArchiveType then
      if not self.SeriesList[Data.RLArchiveSeriesId] then
        self.SeriesList[Data.RLArchiveSeriesId] = {}
      end
      self.SeriesList[Data.RLArchiveSeriesId].Data = Data
    end
  end
  for _, Data in pairs(EventInfo.Data) do
    if Data.IsUnlocked then
      self.SeriesList[Data.Data.RLArchiveSeriesId].IsUnlocked = true
      self.SeriesList[Data.Data.RLArchiveSeriesId].UnlockNum = (self.SeriesList[Data.Data.RLArchiveSeriesId].UnlockNum or 0) + 1
    end
    self.SeriesList[Data.Data.RLArchiveSeriesId].TotalNum = (self.SeriesList[Data.Data.RLArchiveSeriesId].TotalNum or 0) + 1
    if Data.IsNew then
      self.SeriesList[Data.Data.RLArchiveSeriesId].IsNew = true
    end
    if not self.SeriesList[Data.Data.RLArchiveSeriesId].SubItems then
      self.SeriesList[Data.Data.RLArchiveSeriesId].SubItems = {}
    end
    local RLArchiveSubId = Data.Data.RLArchiveSubId
    local RoomId
    for _, Data in pairs(DataMgr.RougeLikeRoom) do
      if Data.RLArchiveSubId == RLArchiveSubId then
        RoomId = Data.RoomId
      end
    end
    table.insert(self.SeriesList[Data.Data.RLArchiveSeriesId].SubItems, {
      EventId = RoomId,
      IsUnlocked = Data.IsUnlocked,
      IsNew = Data.IsNew,
      Name = Data.Data.Name or Data.Data.EventName,
      RLArchiveSubIdSort = Data.Data.RLArchiveSubIdSort
    })
    local OrderedList = {}
    for _, Data in pairs(self.SeriesList[Data.Data.RLArchiveSeriesId].SubItems) do
      table.insert(OrderedList, Data)
    end
    table.sort(OrderedList, function(a, b)
      return a.RLArchiveSubIdSort < b.RLArchiveSubIdSort
    end)
    self.SeriesList[Data.Data.RLArchiveSeriesId].SubItems = OrderedList
  end
  local OrderedList = {}
  for Id, Data in pairs(self.SeriesList) do
    Data.Id = Id
    table.insert(OrderedList, Data)
  end
  table.sort(OrderedList, function(a, b)
    return a.Id < b.Id
  end)
  self.SeriesList = OrderedList
  local FirstIndex
  for Index, Data in ipairs(self.SeriesList) do
    if Data.IsUnlocked and not FirstIndex then
      FirstIndex = Index - 1
    end
  end
  FirstIndex = FirstIndex or 0
  self.CurSelectIndex = FirstIndex
  self.MaxNum = #self.SeriesList
end

function M:InitEventItems()
  for Index, Data in ipairs(self.SeriesList) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.IsUnlocked = Data.IsUnlocked
    Obj.IsNew = Data.IsNew
    Obj.Index = Index - 1
    Obj.Data = Data
    Obj.SubItems = Data.SubItems
    Obj.UnlockNum = Data.UnlockNum or 0
    Obj.TotalNum = Data.TotalNum or 0
    Obj.Parent = self
    self.List_Item:AddItem(Obj)
  end
  self.List_Item:SetIsEnableScrollAnimation(false)
  self.List_Item:RequestLoopListInit()
  self.List_Item:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:AddTimer(self.In:GetEndTime() * 0.5, function()
    self.List_Item:SetVisibility(UIConst.VisibilityOp.Visible)
    self.List_Item:SetIsEnableScrollAnimation(true)
    self:_CalcCenterPadding()
    self:SelectItem(self.CurSelectIndex, true)
  end)
end

function M:InitBtns()
  self.Btn_Left.Btn.OnClicked:Add(self, self.SwitchLeft)
  self.Btn_Right.Btn.OnClicked:Add(self, self.SwitchRight)
  self.Btn_Click.Group_PriceBG:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_Click.Panel_Group_Currency:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_Click.Text_BtnTitle:SetText(GText("UI_RLArchiveTitle_Review"))
  self.Btn_Click.Btn_Click.OnClicked:Add(self, function()
    self:OpenItem()
    AudioManager(self):PlayUISound(self, "event:/ui/roguelike/confirm_btn_click", nil, nil)
  end)
  self.Btn_Click.Btn_Click.OnHovered:Add(self, function()
    AudioManager(self):PlayUISound(self, "event:/ui/roguelike/confirm_btn_hover", nil, nil)
  end)
  self.Btn_Click.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
  self.ArchiveRewardBtn.Btn_Collect.OnClicked:Add(self, self.OpenReward)
  self.ArchiveRewardBtn:InitView(self.DataModel)
  self.ArchiveRewardBtn:SetItemNum(RougeConst.ArchiveType.Event)
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  if not self.bGamepadReady then
    return UIUtils.Unhandle
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_LeftX" == InKeyName then
    local AnalogX = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
    DebugPrint(LXYTag, "AnalogValue ", AnalogX, self._bMoveOff)
    if AnalogX > 0.9 and self._bMoveOff == false then
      self:SwitchRight()
      self._bMoveOff = true
    elseif AnalogX < -0.9 and self._bMoveOff == false then
      self:SwitchLeft()
      self._bMoveOff = true
    elseif math.abs(AnalogX) < 0.5 and self._bMoveOff then
      self._bMoveOff = false
    end
    return UIUtils.Handled
  end
  return UIUtils.Unhandle
end

function M:SwitchLeft()
  local LastCurSelectIndex = self.CurSelectIndex
  if 0 == LastCurSelectIndex then
    LastCurSelectIndex = self.MaxNum
  end
  if LastCurSelectIndex > 0 then
    self:SelectItem(LastCurSelectIndex - 1, true)
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
  end
end

function M:SwitchRight()
  local LastCurSelectIndex = self.CurSelectIndex
  if LastCurSelectIndex == self.MaxNum - 1 then
    LastCurSelectIndex = -1
  end
  if LastCurSelectIndex < self.MaxNum - 1 then
    self:SelectItem(LastCurSelectIndex + 1, true)
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
  end
end

function M:_CalcCenterPadding()
  self.CenterPadding = 0
  local ListSizeX = UIManager():GetWidgetRenderSize(self.List_Item).X
  local OneItem = self.List_Item:GetDisplayedEntryWidgets():GetRef(1)
  local ItemWidth = UIManager():GetWidgetRenderSize(OneItem).X
  local VPSize = UE4.UWidgetLayoutLibrary.GetViewportSize(self)
  local Aspect = VPSize.X / VPSize.Y
  DebugPrint("WBP_Rougelike_Archive_Event_P_C,,_CalcCenterPadding ", Aspect / AspectBase)
  self.CenterPadding = ListSizeX / ItemWidth / 2 - 0.4 - 0.4 * (Aspect / AspectBase)
end

function M:SelectItem(Index, bAdjustScale)
  self.bSelecting = true
  local FullFillCount = self.List_Item:GetFullFillItemCount()
  local RealIndex = Index + FullFillCount
  if FullFillCount < math.abs(self.CurSelectIndex - Index) then
    if Index < self.CurSelectIndex then
      self.List_Item:SetCurrentScrollOffset(self.CurSelectIndex - self.MaxNum + FullFillCount - self.CenterPadding)
    elseif Index > self.CurSelectIndex then
      self.List_Item:SetCurrentScrollOffset(self.CurSelectIndex + self.MaxNum + FullFillCount - self.CenterPadding)
    end
    self:_InnerSelectItem(Index, RealIndex)
  else
    self:_InnerSelectItem(Index, RealIndex)
  end
end

function M:_InnerSelectItem(Index, RealIndex)
  self.List_Item:SetSelectedIndex(RealIndex)
  self.List_Item:SetScrollOffset(RealIndex - self.CenterPadding)
  self.CurSelectItem = self.List_Item:GetItemAt(RealIndex)
  self.CurSelectIndex = Index
  self.Btn_Click.Btn_Click:SetForbidden(not self.CurSelectItem.IsUnlocked)
  self.bSelecting = false
end

function M:ChooseItem(Index, Item)
  if self.CurSelectIndex ~= Index then
    self:AddTimer(0.5, function()
      self:OpenItem()
    end)
  else
    self:OpenItem()
  end
  self:SelectItem(Index)
end

function M:OpenItem()
  if not self.CurSelectItem then
    return
  end
  if not self.CurSelectItem.IsUnlocked then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("RLArchive_EventUnlock"))
    return
  end
  local FirstUnlockId
  for _, Data in ipairs(self.CurSelectItem.SubItems) do
    if Data.IsUnlocked and not FirstUnlockId then
      FirstUnlockId = Data.EventId
      break
    end
  end
  UIManager(self):LoadUINew("Rouge_Event_Main", {
    FirstUnlockId,
    nil,
    self.CurSelectItem.SubItems
  })
end

function M:RefreshOpInfoByInputDevice(CurInputType, CurGamepadName)
  DebugPrint("@zyh OnUpdateUIStyleByInputTypeChange")
  self.Super.RefreshOpInfoByInputDevice(self, CurInputType, CurGamepadName)
  if CurInputType == UE4.ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function M:InitGamepadView()
  if UIUtils.HasAnyFocus(self.Root) then
    self.List_Item:SetFocus()
  end
  self.Btn_Click.Key_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Click.ImageSlot:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:InitKeyboardView()
  self.Btn_Click.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Click.ImageSlot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:OnReturnKeyDown()
  self.Btn_Left.Btn.OnClicked:Clear()
  self.Btn_Right.Btn.OnClicked:Clear()
  self.Btn_Click.Btn_Click.OnClicked:Clear()
  self.ArchiveRewardBtn.Btn_Collect.OnClicked:Clear()
  AudioManager(self):SetEventSoundParam(self, "SwitchArchiveEvent", {ToEnd = 1})
  if not self:IsAnyAnimationPlaying() then
    local WidgetUI = self.Root:OpenSubUI("RougeArchiveMain")
    self.Root.IsOpenSelectLevel = false
    WidgetUI:InitTable()
    WidgetUI.Archive_EventItem:SetFocus()
  end
end

function M:OpenReward()
  local Params = self:MakeRewardData()
  Params.ConfigData.Type = RougeConst.ArchiveType.Event
  UIManager(self):ShowCommonPopupUI(100173, Params, self)
end

function M:GetAllRewards(ReceiveAllParm)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function CallBack(Ret, Reward)
      local HaveReWardToGet = false
      
      for i = 0, ReceiveAllParm.SelfWidget.List_Item:GetNumItems() - 1 do
        local Item = ReceiveAllParm.SelfWidget.List_Item:GetItemAt(i)
        local CurrentNum = ReceiveAllParm.DataModel:GetUnlockedItemNum(Item.Type)
        local CanReceive = CurrentNum >= Item.ConfigData.Num
        local IsGot = Avatar.RougeLike:IsManualRewardGot(Item.ConfigData.Type, Item.ConfigData.ItemId)
        if CanReceive and not IsGot then
          HaveReWardToGet = true
        end
        Item.ConfigData.CanReceive = CanReceive
        Item.ConfigData.RewardsGot = IsGot
        if Item.SelfWidget then
          Item.SelfWidget:RefreshBtn(IsGot)
        end
      end
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Reward, false, function()
        ReceiveAllParm.SelfWidget:SetFocus()
      end, ReceiveAllParm.SelfWidget)
      ReceiveAllParm.SelfWidget:RefreshReddotInfo()
      ReceiveAllParm.SelfWidget:RefreshButton(HaveReWardToGet)
    end
    
    Avatar:GetRougeLikeManualReward(CallBack, ReceiveAllParm.SelfWidget.Type, -1)
  end
end

function M:GetReward(Content)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function Callback(Errorcode, Rewards)
      local HaveReWardToGet = false
      
      for i = 0, Content.Owner.List_Item:GetNumItems() - 1 do
        local Item = Content.Owner.List_Item:GetItemAt(i)
        if Item then
          local CurrentNum = Content.ConfigData.ReceiveParm.DataModel:GetUnlockedItemNum(self.Content.Type)
          local CanReceive = CurrentNum >= Content.ConfigData.Num
          local IsGot = Avatar.RougeLike:IsManualRewardGot(Item.ConfigData.Type, Item.ConfigData.ItemId)
          if CanReceive and not IsGot then
            HaveReWardToGet = true
          end
          Item.ConfigData.CanReceive = CanReceive
          Item.ConfigData.RewardsGot = IsGot
          if Item.SelfWidget then
            Item.SelfWidget:RefreshBtn(IsGot)
          end
        end
      end
      Content.SelfWidget:RefreshReddotInfo()
      Content.Owner:RefreshButton(HaveReWardToGet)
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Rewards, false, function()
        Content.SelfWidget:SetFocus()
      end, Content.SelfWidget)
    end
    
    Avatar:GetRougeLikeManualReward(Callback, Content.SelfWidget.Type, Content.SelfWidget.ItemId)
  end
end

function M:MakeRewardData()
  local Avatar = GWorld:GetAvatar()
  local Params = {}
  Params.ConfigData = {}
  Params.ConfigData.TabInfo = {}
  Params.ConfigData.Items = {}
  Params.ConfigData.HasTab = true
  local SortedArchiveInfo = {}
  for _, Data in pairs(DataMgr.RLArchiveInfo) do
    table.insert(SortedArchiveInfo, Data)
  end
  table.sort(SortedArchiveInfo, function(a, b)
    return a.RLArchiveType < b.RLArchiveType
  end)
  Params.ConfigData.Datas = {}
  for Index, ArchiveInfo in ipairs(SortedArchiveInfo) do
    local TabItem = {}
    TabItem.Index = Index
    TabItem.Type = ArchiveInfo.RLArchiveType
    TabItem.Title = ArchiveInfo.RLArchiveTitle
    TabItem.RewardId = ArchiveInfo.RewardId
    TabItem.ReddotName = "RougeArchiveReward"
    TabItem.IconPath = ArchiveInfo.RewardTabIconPath
    TabItem.IsShowIcon = true
    table.insert(Params.ConfigData.TabInfo, TabItem)
    local RewardData = {}
    RewardData.ShowIcon = false
    RewardData.NowNum = self.DataModel:GetUnlockedItemNum(ArchiveInfo.RLArchiveType)
    RewardData.NumMax = self.DataModel:GetTotalItemNum(ArchiveInfo.RLArchiveType)
    RewardData.ReceiveAllCallBack = self.GetAllRewards
    RewardData.ReceiveAllParam = {
      DataModel = self.DataModel
    }
    RewardData.Type = ArchiveInfo.RLArchiveType
    RewardData.Text_Total = string.format(GText("UI_ModGuideBook_Task_Collecting"))
    RewardData.ReceiveButtonText = GText("UI_Archive_CollectionClaimAll")
    local Items = {}
    local CurIndex = 1
    local Step = ArchiveInfo.RLArchiveStep
    while CurIndex * Step <= RewardData.NumMax do
      local Item = {}
      Item.ItemId = CurIndex
      local CurrentNum = self.DataModel:GetUnlockedItemNum(ArchiveInfo.RLArchiveType)
      Item.CanReceive = CurrentNum >= CurIndex * Step
      Item.Type = ArchiveInfo.RLArchiveType
      Item.RewardsGot = Avatar.RougeLike:IsManualRewardGot(ArchiveInfo.RLArchiveType, Item.ItemId)
      Item.NotreachText = GText("UI_Archive_CollectionInProgress")
      Item.Hint = string.format(GText("UI_Archive_CollectionTarget"), CurIndex * Step)
      Item.ReddotName = "RougeArchiveReward"
      Item.ReceiveButtonText = GText("UI_Archive_CollectionClaim")
      Item.Num = CurIndex * Step
      Item.ReceiveCallBack = self.GetReward
      Item.ReceiveParm = {
        DataModel = self.DataModel
      }
      local Rewards = {}
      local RewardItemId = ArchiveInfo.RewardId
      local RewardInfo = DataMgr.Reward[RewardItemId]
      if RewardInfo then
        local Ids = RewardInfo.Id or {}
        local RewardCount = RewardInfo.Count or {}
        local TableName = RewardInfo.Type or {}
        for i = 1, #Ids do
          local ItemId = Ids[i]
          local Count = RewardUtils:GetCount(RewardCount[i])
          local Rarity = ItemUtils.GetItemRarity(ItemId, TableName[i])
          local ItemType = TableName[i]
          local RewardContent = {
            ItemType = ItemType,
            ItemId = ItemId,
            Count = Count,
            Rarity = Rarity
          }
          table.insert(Rewards, RewardContent)
        end
      end
      Item.Rewards = Rewards
      CurIndex = CurIndex + 1
      table.insert(Items, Item)
    end
    RewardData.Items = Items
    Params.ConfigData.Datas[ArchiveInfo.RLArchiveType] = RewardData
  end
  Params.ConfigData.Type = Params.ConfigData.TabInfo[1].Type
  Params.ConfigData.ReddotName = "RougeArchiveReward"
  return Params
end

function M:HandleKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == Const.GamepadRightThumbstick then
      self:OpenReward()
    end
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    self:OnReturnKeyDown()
  end
  return IsEventHandled
end

return M
