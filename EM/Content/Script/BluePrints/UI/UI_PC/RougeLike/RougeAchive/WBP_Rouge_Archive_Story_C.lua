require("UnLua")
local RougeConst = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.RougeConst")
local ReddotManager = require("BluePrints.UI.Reddot.ReddotManager")
local M = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.PlatformName = CommonUtils.GetDeviceTypeByPlatformName(self)
  self.List_Item:ClearListItems()
  self.CurSelectItem = nil
  self.CurSelectSubItem = nil
  self.CurSelectIndex = nil
  self.LastSelectIndex = nil
  self.Group_Img:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
  self.Text_Empty:SetText(GText("RLArchive_StoryUnlock"))
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
end

function M:InitUIInfo(StoryInfo, DataModel)
  self.DataModel = DataModel
  self:InitReddot()
  self:Construct()
  self:InitTab()
  self:InitBtns()
  self.StoryInfo = StoryInfo
  self:ResortStoryData(self.StoryInfo)
  self:InitStoryItems()
  self:PlayAnimation(self.In)
  self:AddDispatcher(EventID.CloseFromArchiveStory, self, self.ReturnToArchive)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "SwitchArchiveStory", nil)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:AddDelayFrameFunc(function()
      self:InitGamepadView()
    end, 4)
  end
  self:AddInputMethodChangedListen()
end

function M:InitReddot()
  ReddotManager.AddListener("RougeArchiveReward", self, self.OnArchiveRewardReddotChange)
end

function M:OnArchiveRewardReddotChange(Count)
  DebugPrint("Tianyi@ OnArchiveRewardReddotChange", Count)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("RougeArchiveReward")
  if CacheDetail[RougeConst.ArchiveType.Story] then
    Count = #CacheDetail[RougeConst.ArchiveType.Story]
  end
  self.ArchiveRewardBtn:SetReddot(Count > 0)
end

function M:InitTab()
  local TabConfigData = {
    PlatformName = self.PlatformName,
    TitleName = GText("RLArchive_StoryTitle"),
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

function M:ResortStoryData(StoryInfo)
  self.SeriesList = {}
  for Id, Data in pairs(DataMgr.RLRoomStorySeries) do
    if 2 == Data.RLArchiveType then
      if not self.SeriesList[Data.RLArchiveSeriesId] then
        self.SeriesList[Data.RLArchiveSeriesId] = {}
      end
      self.SeriesList[Data.RLArchiveSeriesId].Data = Data
    end
  end
  for _, Data in pairs(StoryInfo.Data) do
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
    table.insert(self.SeriesList[Data.Data.RLArchiveSeriesId].SubItems, {
      StoryId = Data.Data.RLArchiveSubId,
      IsUnlocked = Data.IsUnlocked,
      IsNew = Data.IsNew,
      Name = Data.Data.EventName,
      Data = Data.Data,
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
  self.CurSelectIndex = FirstIndex
end

function M:InitStoryItems()
  for Index, Data in ipairs(self.SeriesList) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.IsUnlocked = Data.IsUnlocked
    Obj.IsNew = Data.IsNew
    Obj.Index = Index - 1
    Obj.UnlockNum = Data.UnlockNum or 0
    Obj.TotalNum = Data.TotalNum or 0
    Obj.Data = Data
    Obj.ItemId = Data.Data.RLArchiveSeriesId
    Obj.SubItems = Data.SubItems
    Obj.Parent = self
    self.List_Item:AddItem(Obj)
  end
  self:AddDelayFrameFunc(function()
    self:SetAllNavigationRule()
  end, 2)
end

function M:SetAllNavigationRule()
  local ItemNum = self.List_Item:GetNumItems()
  for Index = 0, ItemNum - 1 do
    local Item = self.List_Item:GetItemAt(Index).UI
    Item.List_SubItem:SetNavigationRuleExplicit(EUINavigation.Up, Item.Btn_Click)
    if self.List_Item:GetItemAt(Index + 1) then
      Item.List_SubItem:SetNavigationRuleExplicit(EUINavigation.Down, self.List_Item:GetItemAt(Index + 1).UI.Btn_Click)
    end
  end
end

function M:InitBtns()
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
  self.Btn_Click.Btn_Click:SetForbidden(true)
  self.Btn_Click.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
  self.ArchiveRewardBtn.Btn_Collect.OnClicked:Add(self, self.OpenReward)
  self.ArchiveRewardBtn:InitView(self.DataModel)
  self.ArchiveRewardBtn:SetItemNum(RougeConst.ArchiveType.Story)
end

function M:HoverSeries(Item)
  self:ChangeBackGround(Item, Item.IsUnlocked)
  self.Btn_Click:SetVisibility(ESlateVisibility.Collapsed)
  if self.LastSelectIndex and Item.Index ~= self.LastSelectIndex then
    self.List_Item:GetItemAt(self.LastSelectIndex).UI.List_SubItem:BP_ClearSelection()
  end
  if Item.IsUnlocked then
    self.Root:UpdateOtherPageTab({
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_CTL_Squad_Expand"),
        bLongPress = false
      },
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
    })
  else
    self.Root:UpdateOtherPageTab({
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
    })
  end
end

function M:ChooseSeries(Index, Item)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and self.LastSelectIndex and self.LastSelectIndex ~= Index then
    self.List_Item:GetItemAt(self.LastSelectIndex).UI:OnItemLoseSelection()
  end
  self.CurSelectIndex = Index
  self.CurSelectItem = Item
  self.CurSelectSubItem = nil
  self.List_Item:SetSelectedIndex(Index)
  self:ChangeBackGround(Item, Item.IsUnlocked)
  self.Btn_Click:SetVisibility(ESlateVisibility.Collapsed)
  self.LastSelectIndex = Index
  self:PlayAnimation(self.Change)
  self:PlayAnimation(self.Change_Title)
end

function M:ChooseItem(Item)
  self.Btn_Click:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:SelectItem(Item)
  self.DataModel:MarkArchiveItemSeened(RougeConst.ArchiveType.Story, Item.StoryId)
  self.DataModel:UpdateArchiveReddot(RougeConst.ArchiveType.Story)
  self:ChangeBackGround(Item, Item.IsUnlocked)
  self:PlayAnimation(self.Change_Title)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:AddDelayFrameFunc(function()
      Item.Btn_Click:SetFocus()
    end, 4)
  end
end

function M:SelectItem(Item)
  self.Btn_Click.Btn_Click:SetForbidden(not Item.IsUnlocked)
  self.CurSelectIndex = nil
  self.Root:UpdateOtherPageTab({
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
  })
  self.CurSelectSubItem = Item
  self.CurSelectItem = nil
end

function M:ChangeBackGround(Item, IsUnlocked)
  if IsUnlocked then
    if self.Group_Img:GetVisibility() == ESlateVisibility.Collapsed then
      self.Group_Empty:SetVisibility(ESlateVisibility.Collapsed)
      self.Group_Img:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
    local EventMainIconPath = Item.Data.SeriesMainIcon or Item.Data.Data.SeriesMainIcon
    local EventMainIcon = LoadObject(EventMainIconPath)
    local StoryMat = self.Image_Story:GetDynamicMaterial()
    StoryMat:SetTextureParameterValue("MainTex", EventMainIcon)
    local StoryName = Item.Data.EventName or Item.Data.Data.SeriesName
    self.Text_ImageTitle:SetText(GText(StoryName))
  elseif self.Group_Empty:GetVisibility() == ESlateVisibility.Collapsed then
    self.Group_Empty:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Group_Img:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OpenItem()
  if not self.CurSelectSubItem then
    return
  end
  if self.CurSelectSubItem.IsUnlocked then
    self:PlayAnimation(self.Hide)
    local RLArchiveSubId = self.CurSelectSubItem.Data.RLArchiveSubId
    local StoryId
    for _, Data in pairs(DataMgr.RougeLikeStoryEvent) do
      if Data.RLArchiveSubId == RLArchiveSubId then
        StoryId = Data.Id
      end
    end
    UIManager(self):LoadUINew("Rouge_Event_Main", {
      nil,
      StoryId,
      true
    })
    self:AddTimer(self.Hide:GetEndTime(), self:SetVisibility(UIConst.VisibilityOp.Collapsed))
  end
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
    if self.CurSelectSubItem then
      self.CurSelectSubItem.Btn_Click:SetFocus()
    elseif self.CurSelectItem then
      self.CurSelectItem.Btn_Click:SetFocus()
    end
  end
  self.Btn_Click.Key_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Click.ImageSlot:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:InitKeyboardView()
  self.Btn_Click.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_Click.ImageSlot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:ReturnToArchive()
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:PlayAnimationReverse(self.Hide)
end

function M:OnReturnKeyDown()
  self.Btn_Click.Btn_Click.OnClicked:Remove(self, self.OpenItem)
  self:RemoveAllDispatcher()
  AudioManager(self):SetEventSoundParam(self, "SwitchArchiveStory", {ToEnd = 1})
  if not self:IsAnyAnimationPlaying() then
    local WidgetUI = self.Root:OpenSubUI("RougeArchiveMain")
    self.Root.IsOpenSelectLevel = false
    WidgetUI:InitTable()
    WidgetUI.Archive_StoryItem:SetFocus()
  end
end

function M:OpenReward()
  local Params = self:MakeRewardData()
  Params.ConfigData.Type = RougeConst.ArchiveType.Story
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
        local CurrentNum = Content.ConfigData.ReceiveParm.DataModel:GetUnlockedItemNum(self.Content.Type)
        local CanReceive = CurrentNum >= Content.ConfigData.Num
        local IsGot = Avatar.RougeLike:IsManualRewardGot(Item.SelfWidget.Type, Item.SelfWidget.ItemId)
        if CanReceive and not IsGot then
          HaveReWardToGet = true
        end
        Item.ConfigData.CanReceive = CanReceive
        Item.ConfigData.RewardsGot = IsGot
        if Item.SelfWidget then
          Item.SelfWidget:RefreshBtn(IsGot)
        end
      end
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
      Item.ReceiveButtonText = GText("UI_Archive_CollectionClaim")
      Item.ReddotName = "RougeArchiveReward"
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
