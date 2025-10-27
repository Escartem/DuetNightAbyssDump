require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local M = Class("BluePrints.UI.BP_UIState_C")
local ReddotManager = require("BluePrints.UI.Reddot.ReddotManager")
local RougeConst = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.RougeConst")

function M:Construct()
  M.Super.Construct(self)
  self.CurInputDeviceType = nil
end

function M:Destruct()
  self:ClearListenEvent()
  M.Super.Destruct(self)
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.RougeGuideName, self.DataModel = ...
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "RougeBagOpenSound", nil)
  self.Text_RougeCheckDetail_Empry:SetText(GText("UI_Rougelike_NoItem"))
  self:InitListenEvent()
  if self.RougeGuideName then
    self:InitGuideView()
  else
    self:InitBagTabInfo()
  end
  self:InitOffsetSize()
end

function M:ReceiveEnterState(StackAction)
  self.Super.ReceiveEnterState(self, StackAction)
end

function M:ReceiveExitState(StackAction)
  self.Super.ReceiveExitState(self, StackAction)
end

function M:InitListenEvent()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  local IsGamePad = CurInputDevice == ECommonInputType.Gamepad
  local PreviousInputDeviceType = self.CurInputDeviceType
  self.CurInputDeviceType = CurInputDevice
  if IsGamePad and PreviousInputDeviceType then
    if self.RougeGuideName == nil then
      if self.bFocusOnSuit then
        self:FocusOnSuitInfo()
      else
        self:FocusOnPanel()
      end
    else
      self:FocusOnPanel()
    end
  end
  if IsGamePad then
    if self.RougeGuideName == nil and self.CurItemType == "Blessing" then
      self:SetButtomGamePadTipVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    self:SetButtomGamePadTipVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:InitBagTabInfo()
  self.HB_TotalText:SetVisibility(ESlateVisibility.Collapsed)
  self.MainTabData = DataMgr.RougeBagTab
  self.MainTabMap = {}
  local TabList = {}
  for _, TabData in pairs(self.MainTabData) do
    local MainTab = {
      Text = GText(TabData.MainTabName),
      TabId = TabData.MainTabId,
      IconPath = TabData.Icon
    }
    table.insert(TabList, MainTab)
  end
  table.sort(TabList, function(a, b)
    return a.TabId < b.TabId
  end)
  for _, Tab in ipairs(TabList) do
    table.insert(self.MainTabMap, Tab.TabId)
  end
  local SubTabDict = {}
  local SubTabMapIdx = {}
  for SubTabId, Data in MiscUtils.PairsByKeys(DataMgr.RougeBagSubTab) do
    if not SubTabDict[Data.MainTabId] then
      SubTabDict[Data.MainTabId] = 1
    else
      SubTabDict[Data.MainTabId] = SubTabDict[Data.MainTabId] + 1
    end
    SubTabMapIdx[SubTabId] = SubTabDict[Data.MainTabId]
  end
  self.Common_Tab:Init({
    LeftKey = "Q",
    RightKey = "E",
    Tabs = TabList,
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    },
    OwnerPanel = self,
    BackCallback = self.CloseSelf
  })
  self.Common_Tab:UpdateTopTitle(GText("UI_RougeBag_Name"))
  self.Common_Tab:BindEventOnTabSelected(self, self.OnMainTabChanged)
  self.Common_Tab:SelectTab(1)
  self:InitTipsInfo()
end

function M:InitTipsInfo()
  if self.CurInputDeviceType == ECommonInputType.Touch then
    return
  end
  if self.Key_GamePad_Bottom then
    self.Key_GamePad_Bottom:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
end

function M:InitOffsetSize()
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Touch then
    local CanvasSlot = self.VB_Item.Slot
    local Offset = CanvasSlot:GetOffsets()
    Offset.Left = self.RougeGuideName == nil and self.InGameLeft or self.InArchiveLeft
    CanvasSlot:SetOffsets(Offset)
  end
end

function M:UpdateGroupInfo()
  self.List_BottomTab:ClearListItems()
  for _, v in pairs(DataMgr.BlessingGroup) do
    local Content = NewObject(self.GroupInfoContentClass)
    Content.GroupId = v.GroupId
    Content.Parent = self
    Content.SuitFocusChanged = self.SuitFocusChanged
    self.List_BottomTab:AddItem(Content)
  end
end

function M:OnMainTabChanged(TabWidget)
  local MainTabId = self.MainTabMap[TabWidget.Idx]
  if not MainTabId then
    return
  end
  self:CleanTimer()
  self.CurItemType = DataMgr.RougeBagTab[MainTabId].Type
  if self.CurItemType == "Blessing" then
    self:UpdateGroupInfo(self.List_BottomTab, self.GroupInfoContentClass)
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      self:SetButtomGamePadTipVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    self.List_BottomTab:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif self.CurItemType == "Treasure" then
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      self:SetButtomGamePadTipVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self.List_BottomTab:SetVisibility(ESlateVisibility.Collapsed)
  end
  local SubTabList = {}
  self.SubTabMap = {}
  for _, RougeBagSubTabData in MiscUtils.PairsByKeys(DataMgr.RougeBagSubTab) do
    if RougeBagSubTabData.MainTabId == MainTabId then
      local SubTab = {
        Text = GText(RougeBagSubTabData.SubTabName),
        IconPath = RougeBagSubTabData.SubTabIcon,
        TabId = RougeBagSubTabData.SubTabId,
        Data = RougeBagSubTabData
      }
      table.insert(SubTabList, SubTab)
    end
  end
  table.sort(SubTabList, function(a, b)
    return a.TabId < b.TabId
  end)
  for _, Tab in ipairs(SubTabList) do
    table.insert(self.SubTabMap, Tab.Data)
  end
  if 0 == #SubTabList then
    self:UpdateRougeBagDetail()
  end
  self.SelectItem = nil
  self.SubTabList = SubTabList
  self.Tab:Init({
    Tabs = SubTabList,
    SoundFunc = self.PlayTabSound,
    SoundFuncReceiver = self
  })
  self.Tab:BindEventOnTabSelected(self, self.OnSubTabChanged)
  self.Tab:SelectTab(1)
  for i = 1, #SubTabList do
    local CurrentTab = self.Tab.ScrollBox_Tab:GetChildAt(i - 1)
    CurrentTab:SetNavigationRuleCustom(UE4.EUINavigation.Right, {
      self,
      function()
        if self.List_Item:GetVisibility() == UIConst.VisibilityOp.Collapsed then
          return CurrentTab
        else
          return self.List_Item:NavigateToIndex(0)
        end
      end
    })
  end
end

function M:OnSubTabChanged(TabWidget)
  local SubTabData = self.SubTabMap[TabWidget.Idx]
  if not SubTabData then
    return
  end
  self:CleanTimer()
  self.CurGroupId = SubTabData.Group
  if self.RougeGuideName then
    self:UpdateRougeGuideDetail(self.CurGroupId)
  else
    self:UpdateRougeBagDetail(self.CurGroupId, true)
  end
end

function M:UpdateRougeBagDetail(CurGroupId)
  local RougeLikeManager = GWorld.RougeLikeManager
  if not RougeLikeManager then
    DebugPrint("ZDX RougeLikeManager is nil!")
    return
  end
  self.ItemType = self.CurItemType .. "s"
  self.ShopItemType = "Shop" .. self.CurItemType
  local RarityName = self.CurItemType .. "Rarity"
  local IdName = self.CurItemType .. "Id"
  local DataName = "RougeLike" .. self.CurItemType
  local ItemList = RougeLikeManager[self.ItemType]
  local Data = DataMgr[DataName]
  local ItemDataList = {}
  if CurGroupId then
    self.Group_Tab:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.Group_Tab:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  for Id, Level in pairs(ItemList) do
    local GroupId = Data[Id][self.CurItemType .. "Group"]
    local ItemData = setmetatable({}, {
      __index = Data[Id]
    })
    if not CurGroupId or 0 == CurGroupId or CurGroupId == GroupId then
      table.insert(ItemDataList, {
        ItemId = ItemData[IdName],
        ItemType = self.CurItemType,
        Rarity = ItemData[RarityName]
      })
    end
  end
  self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  self.List_Item:SetVisibility(ESlateVisibility.Collapsed)
  self.CatalogueScroll:SetVisibility(ESlateVisibility.Collapsed)
  if 0 == #ItemDataList then
    self.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:AddTimer(0.01, function()
      self:FocusOnPanel()
    end)
    return
  end
  table.sort(ItemDataList, function(a, b)
    local RarityA, RarityB = a.Rarity, b.Rarity
    if RarityA == RarityB then
      local IdA, IdB = a.ItemId, b.ItemId
      return IdA > IdB
    end
    return RarityA > RarityB
  end)
  if self.CurItemType == "Treasure" then
    self:InitTreasureSuitList(ItemDataList)
  else
    self:InitBlessingList(ItemDataList)
  end
end

function M:InitTreasureSuitList(ItemDataList)
  self.CatalogueScroll:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.List_SuitItem:DisableScroll(true)
  local SuitList = {}
  for i = 1, #ItemDataList do
    local ItemId = ItemDataList[i].ItemId
    local TreasureDataMgr = DataMgr.RougeLikeTreasure
    local TreasureGroupDataMgr = DataMgr.TreasureGroup
    local GroupId = TreasureDataMgr[ItemId].TreasureGroup
    local GroupKey = TreasureGroupDataMgr[GroupId] and TreasureGroupDataMgr[GroupId].GroupId or -1
    SuitList[GroupKey] = SuitList[GroupKey] or {}
    table.insert(SuitList[GroupKey], {
      ItemId = ItemId,
      ItemType = ItemDataList[i].ItemType,
      RougeGuideName = self.RougeGuideName,
      DataModel = self.DataModel
    })
  end
  local Keys = {}
  for GroupId, _ in pairs(SuitList) do
    table.insert(Keys, GroupId)
  end
  table.sort(Keys, function(a, b)
    return b < a
  end)
  self.List_SuitItem:ClearListItems()
  for Index, GroupId in ipairs(Keys) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.GroupId = GroupId
    Content.Items = SuitList[GroupId]
    Content.DataModel = self.DataModel
    Content.IsGuide = self.RougeGuideName ~= nil
    Content.Index = Index - 1
    Content.Owner = self
    self.List_SuitItem:AddItem(Content)
  end
  for i = 0, self.List_SuitItem:GetNumItems() - 1 do
    local Item = self.List_SuitItem:GetItemAt(i)
  end
  self:AddTimer(0.01, function()
    self:PlayTreasureSuitListFramingIn()
  end)
end

function M:InitBlessingList(ItemDataList)
  self.List_Item:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.List_Item:ClearListItems()
  for i = 1, #ItemDataList do
    local Content = NewObject(self.BagItemContentClass)
    Content.ItemId = ItemDataList[i].ItemId
    Content.ShopItemType = ItemDataList[i].ItemType
    Content.RougeGuideName = self.RougeGuideName
    Content.DataModel = self.DataModel
    Content.RougeItemFocusChanged = self.RougeItemFocusChanged
    Content.Parent = self
    self.List_Item:AddItem(Content)
  end
  self:AddTimer(0.01, function()
    self:PlayBlessingListFramingIn()
  end)
end

function M:PlayBlessingListFramingIn()
  self.List_Item:SetVisibility(UIConst.VisibilityOp.Visible)
  self.List_Item:RequestPlayEntriesAnim()
  self:FocusOnPanel()
end

function M:PlayTreasureSuitListFramingIn()
  self.CatalogueScroll:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.List_SuitItem:RequestPlayEntriesAnim()
  self:FocusOnPanel()
end

function M:PlayTabSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
end

function M:CloseSelf()
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:PlayAnimation(self.Out)
  AudioManager(self):SetEventSoundParam(self, "RougeBagOpenSound", {ToEnd = 1})
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    self:Close()
  end
end

function M:Close()
  self.Super.Close(self)
  if self.GuideParent then
    self.GuideParent:InitTable()
    if self.RougeGuideName == "Treasure" then
      self.GuideParent.Archive_TreasureItem:SetFocus()
    else
      self.GuideParent.Archive_BlessItem:SetFocus()
    end
  end
end

function M:InitGuideView()
  self:InitGuideTabInfo()
  self:InitRougeGuide()
  self:InitReward()
  self:InitReddot()
end

function M:InitGuideTabInfo()
  self.HB_TotalText:SetVisibility(ESlateVisibility.Collapsed)
  self.Common_Tab:Init({
    LeftKey = "NotShow",
    RightKey = "NotShow",
    DynamicNode = {"Back", "BottomKey"},
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    },
    OwnerPanel = self,
    BackCallback = self.CloseSelf
  })
  local TitleText = "RLArchive_" .. self.RougeGuideName .. "Title"
  self.Common_Tab:UpdateTopTitle(GText(TitleText))
end

function M:InitRougeGuide()
  local RougeGuideId
  self:CleanTimer()
  self.List_BottomTab:SetVisibility(ESlateVisibility.Collapsed)
  if self.RougeGuideName == "Blessing" then
    RougeGuideId = 1
  elseif self.RougeGuideName == "Treasure" then
    RougeGuideId = 0
  end
  if not RougeGuideId then
    return
  end
  local SubTabList = {}
  self.SubTabMap = {}
  for _, RougeGuideSubTabData in MiscUtils.PairsByKeys(DataMgr.RougeBagSubTab) do
    if RougeGuideSubTabData.MainTabId == RougeGuideId then
      local SubTab = {
        Text = GText(RougeGuideSubTabData.SubTabName),
        IconPath = RougeGuideSubTabData.SubTabIcon,
        TabId = RougeGuideSubTabData.SubTabId,
        Data = RougeGuideSubTabData
      }
      table.insert(SubTabList, SubTab)
    end
  end
  table.sort(SubTabList, function(a, b)
    return a.TabId < b.TabId
  end)
  for _, Tab in ipairs(SubTabList) do
    table.insert(self.SubTabMap, Tab.Data)
  end
  if 0 == #SubTabList then
    self:UpdateRougeGuideDetail()
  end
  self.SelectItem = nil
  self.SubTabList = SubTabList
  self.Tab:Init({
    Tabs = SubTabList,
    SoundFunc = self.PlayTabSound,
    SoundFuncReceiver = self
  })
  self.Tab:BindEventOnTabSelected(self, self.OnSubTabChanged)
  self.Tab:SelectTab(1)
  for i = 1, #SubTabList do
    local CurrentTab = self.Tab.ScrollBox_Tab:GetChildAt(i - 1)
    CurrentTab:SetNavigationRuleCustom(UE4.EUINavigation.Right, {
      self,
      function()
        if self.List_Item:GetVisibility() == UIConst.VisibilityOp.Collapsed then
          return CurrentTab
        else
          return self.List_Item:NavigateToIndex(0)
        end
      end
    })
  end
end

function M:InitReward()
  self.ArchiveRewardBtn:InitView(self.DataModel)
  self.ArchiveRewardBtn:SetItemNum(RougeConst.ArchiveType[self.RougeGuideName])
  self.ArchiveRewardBtn:SetVisibility(ESlateVisibility.Visible)
  self.ArchiveRewardBtn.Btn_Collect.OnClicked:Add(self, self.OpenReward)
end

function M:OpenReward()
  local Type = RougeConst.ArchiveType.Treasure
  if self.RougeGuideName == "Blessing" then
    Type = RougeConst.ArchiveType.Blessing
  end
  local Params = self:MakeRewardData()
  Params.ConfigData.Type = Type
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

function M:InitReddot()
  ReddotManager.AddListener("RougeArchiveReward", self, self.OnArchiveRewardReddotChange)
end

function M:OnArchiveRewardReddotChange(Count)
  DebugPrint("Tianyi@ OnArchiveRewardReddotChange", Count)
  local Type = RougeConst.ArchiveType.Treasure
  if self.RougeGuideName == "Blessing" then
    Type = RougeConst.ArchiveType.Blessing
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("RougeArchiveReward")
  if CacheDetail[Type] then
    Count = #CacheDetail[Type]
  end
  self.ArchiveRewardBtn:SetReddot(Count > 0)
end

function M:UpdateRougeGuideDetail(CurGroupId)
  local IdName = self.RougeGuideName .. "Id"
  local DataName = "RougeLike" .. self.RougeGuideName
  local Data = DataMgr[DataName]
  local ItemDataList = {}
  if CurGroupId then
    self.Group_Tab:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.Group_Tab:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  for Id, Value in pairs(Data) do
    local GroupId = Value[self.RougeGuideName .. "Group"]
    local RLArchiveId = Value.RLArchiveId
    local ItemData = setmetatable({}, {
      __index = Data[Id]
    })
    if (not CurGroupId or 0 == CurGroupId or CurGroupId == GroupId) and nil ~= RLArchiveId then
      table.insert(ItemDataList, {
        ItemId = ItemData[IdName],
        ItemType = self.RougeGuideName,
        RLArchiveId = RLArchiveId
      })
    end
  end
  self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  self.List_Item:SetVisibility(ESlateVisibility.Collapsed)
  self.CatalogueScroll:SetVisibility(ESlateVisibility.Collapsed)
  self.List_Item:ScrollToTop()
  if 0 == #ItemDataList then
    self.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:AddTimer(0.01, function()
      self:FocusOnPanel()
    end)
    return
  end
  table.sort(ItemDataList, function(a, b)
    local ArchiveA, ArchiveB = a.RLArchiveId, b.RLArchiveId
    return ArchiveA < ArchiveB
  end)
  if self.RougeGuideName == "Treasure" then
    self:InitTreasureSuitList(ItemDataList)
  else
    self:InitBlessingList(ItemDataList)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:Handle_KeyDownEventOnGamePad(InKeyName)
  else
    IsEventHandled = self:Handle_KeyDownEventOnPC(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:Handle_KeyDownEventOnPC(InKeyName)
  local IsEventHandled = false
  if "Escape" == InKeyName then
    if not UIManager(self):GetUIObj("CommonDialog") then
      IsEventHandled = true
      self:CloseSelf()
    end
  elseif "Q" == InKeyName then
    IsEventHandled = true
    self.Common_Tab:TabToLeft()
  elseif "E" == InKeyName then
    IsEventHandled = true
    self.Common_Tab:TabToRight()
  elseif "A" == InKeyName then
  elseif "D" == InKeyName then
  end
  return IsEventHandled
end

function M:Handle_KeyDownEventOnGamePad(InKeyName)
  local IsEventHandled = false
  if "Gamepad_FaceButton_Right" == InKeyName then
    IsEventHandled = true
    if self.bFocusOnSuit then
      self:FocusOnPanel()
    else
      self:CloseSelf()
    end
  elseif "Gamepad_LeftShoulder" == InKeyName then
    IsEventHandled = true
    self.Common_Tab:TabToLeft()
  elseif "Gamepad_RightShoulder" == InKeyName then
    IsEventHandled = true
    self.Common_Tab:TabToRight()
  elseif InKeyName == Const.GamepadLeftThumbstick then
    IsEventHandled = true
    if not self.bFocusOnSuit then
      self:FocusOnSuitInfo()
    end
  elseif InKeyName == Const.GamepadRightThumbstick then
    if self.RougeGuideName then
      IsEventHandled = true
      self:OpenReward()
    else
      IsEventHandled = true
      self.Common_Tab:Handle_KeyEventOnGamePad(InKeyName)
    end
  end
  return IsEventHandled
end

function M:FocusOnPanel()
  if self.RougeGuideName == nil and not self:HasFocusedDescendants() and not self:HasAnyUserFocus() then
    return
  end
  if self.Group_Tab:GetVisibility() == UIConst.VisibilityOp.Collapsed then
    if self.CurItemType == "Treasure" or self.RougeGuideName == "Treasure" then
      if self.CatalogueScroll:GetVisibility() == UIConst.VisibilityOp.Collapsed then
        self:SetFocus()
      else
        self.List_SuitItem:NavigateToIndex(0)
      end
    elseif self.List_Item:GetVisibility() == UIConst.VisibilityOp.Collapsed then
      self:SetFocus()
    else
      self.List_Item:NavigateToIndex(0)
    end
  else
    self.SubTabList[self.Tab.CurrentTab].UI:SetFocus()
  end
end

function M:FocusOnSuitInfo()
  if not self:HasFocusedDescendants() and not self:HasAnyUserFocus() then
    return
  end
  self.List_BottomTab:NavigateToIndex(0)
end

function M:SuitFocusChanged(bFocusOnSuit)
  self.bFocusOnSuit = bFocusOnSuit
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    if bFocusOnSuit or self.CurItemType == "Treasure" then
      self:SetButtomGamePadTipVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self:SetButtomGamePadTipVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
end

function M:RougeItemFocusChanged(bFocusOnItem)
  self:AddTimer(0.01, function()
    if false == bFocusOnItem then
      for i = 0, self.List_Item:GetNumItems() - 1 do
        local Item = self.List_Item:GetItemAt(i)
        if Item.Focused then
          bFocusOnItem = true
          break
        end
      end
    end
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      if bFocusOnItem then
        self.Common_Tab:UpdateBottomKeyInfo({
          {
            GamePadInfoList = {
              {
                Type = "Img",
                ImgShortPath = "A",
                Owner = self
              }
            },
            Desc = GText("UI_Controller_Check"),
            bLongPress = false
          },
          {
            KeyInfoList = {
              {
                Type = "Text",
                Text = "Esc",
                ClickCallback = self.CloseSelf,
                Owner = self
              }
            },
            GamePadInfoList = {
              {
                Type = "Img",
                ImgShortPath = "B",
                ClickCallback = self.CloseSelf,
                Owner = self
              }
            },
            Desc = GText("UI_BACK")
          }
        })
      else
        self.Common_Tab:UpdateBottomKeyInfo({
          {
            KeyInfoList = {
              {
                Type = "Text",
                Text = "Esc",
                ClickCallback = self.CloseSelf,
                Owner = self
              }
            },
            GamePadInfoList = {
              {
                Type = "Img",
                ImgShortPath = "B",
                ClickCallback = self.CloseSelf,
                Owner = self
              }
            },
            Desc = GText("UI_BACK")
          }
        })
      end
    end
  end)
end

function M:SetButtomGamePadTipVisibility(Visibility)
  if self.CurInputDeviceType == ECommonInputType.Touch then
    return
  end
  if self.Key_GamePad_Bottom then
    self.Key_GamePad_Bottom:SetVisibility(Visibility)
  end
end

return M
