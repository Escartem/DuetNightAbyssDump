local TimeUtils = require("Utils.TimeUtils")
local RougeConst = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.RougeConst")
local ReddotManager = require("BluePrints.UI.Reddot.ReddotManager")
local WBP_Rouge_ArchiveMain_C = Class("BluePrints.UI.BP_UIState_C", "BluePrints.UI.BP_EMUserWidget_C")

function WBP_Rouge_ArchiveMain_C:Construct()
  self.DataModel = require("BluePrints.UI.UI_PC.RougeLike.RougeAchive.Rouge_Archive_DataModel")
  self.DataModel:InitData(GWorld:GetAvatar())
  self.ArchiveEntries = {
    [RougeConst.ArchiveType.Treasure] = self.Archive_TreasureItem,
    [RougeConst.ArchiveType.Blessing] = self.Archive_BlessItem,
    [RougeConst.ArchiveType.Event] = self.Archive_EventItem,
    [RougeConst.ArchiveType.Story] = self.Archive_StoryItem
  }
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self:InitView()
end

function WBP_Rouge_ArchiveMain_C:Init()
  self:InitTable()
  self.Archive_EventItem:SetFocus()
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "RougeArchive", nil)
end

function WBP_Rouge_ArchiveMain_C:InitView()
  self:InitReddot()
  for Type, Widget in pairs(self.ArchiveEntries) do
    local ArchiveData = self.DataModel:GetArchiveDataByArchiveType(Type)
    ArchiveData.ParentWidget = self
    ArchiveData.OnEntryClicked = self.OnArchiveEntryClicked
    ArchiveData.OnEntryHovered = self.OnArchiveEntryHovered
    Widget:InitView(Type, ArchiveData)
  end
  self:RefreshOpInfoByInputDevice()
  self.ArchiveRewardBtn:InitView(self.DataModel)
  self.ArchiveRewardBtn:HideItemNum()
  self.ArchiveRewardBtn.Btn_Collect.OnClicked:Add(self, self.OpenReward)
end

function WBP_Rouge_ArchiveMain_C:OpenReward()
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_small", nil, nil)
  local Params = self:MakeRewardData()
  UIManager(self):ShowCommonPopupUI(100173, Params, self)
end

function WBP_Rouge_ArchiveMain_C:GetAllRewards(ReceiveAllParm)
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
      ReceiveAllParm.SelfWidget:RefreshReddotInfo()
    end
    
    Avatar:GetRougeLikeManualReward(CallBack, ReceiveAllParm.SelfWidget.Type, -1)
  end
end

function WBP_Rouge_ArchiveMain_C:GetReward(Content)
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

function WBP_Rouge_ArchiveMain_C:MakeRewardData()
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

function WBP_Rouge_ArchiveMain_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = CurInputDevice or UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = CurGamepadName or UIUtils.UtilsGetCurrentGamepadName()
  if self.CurInputDeviceType == UE4.ECommonInputType.Gamepad then
    self:InitGamepadView()
  elseif self.CurInputDeviceType == UE4.ECommonInputType.MouseAndKeyboard then
    self:InitKeyboardView()
  end
  self.Super.RefreshOpInfoByInputDevice(self, self.CurInputDeviceType, self.CurGamepadName)
end

function WBP_Rouge_ArchiveMain_C:InitGamepadView()
  if UIUtils.HasAnyFocus(self) then
    self.Archive_EventItem:SetFocus()
  end
end

function WBP_Rouge_ArchiveMain_C:InitKeyboardView()
end

function WBP_Rouge_ArchiveMain_C:InitReddot()
  ReddotManager.AddListener("RougeArchiveReward", self, self.OnArchiveRewardReddotChange)
  ReddotManager.AddListener("RougeArchiveTreasure", self, self.OnTreasureReddotChange)
  ReddotManager.AddListener("RougeArchiveBlessing", self, self.OnBlessingReddotChange)
  ReddotManager.AddListener("RougeArchiveEvent", self, self.OnRoomReddotChange)
  ReddotManager.AddListener("RougeArchiveStory", self, self.OnStoryEventReddotChange)
  self.DataModel:UpdateArchiveRewardReddot()
end

function WBP_Rouge_ArchiveMain_C:OnArchiveRewardReddotChange(Count)
  DebugPrint("Tianyi@ OnArchiveRewardReddotChange", Count)
  self.ArchiveRewardBtn:SetReddot(Count > 0)
end

function WBP_Rouge_ArchiveMain_C:OnNewDotChange(ArchiveType, Count)
  self.ArchiveEntries[ArchiveType]:OnReddotChange(Count > 0)
end

function WBP_Rouge_ArchiveMain_C:OnTreasureReddotChange(Count)
  DebugPrint("Tianyi@ OnTreasureReddotChange", Count)
  self:OnNewDotChange(RougeConst.ArchiveType.Treasure, Count)
end

function WBP_Rouge_ArchiveMain_C:OnBlessingReddotChange(Count)
  DebugPrint("Tianyi@ OnBlessingReddotChange", Count)
  self:OnNewDotChange(RougeConst.ArchiveType.Blessing, Count)
end

function WBP_Rouge_ArchiveMain_C:OnRoomReddotChange(Count)
  DebugPrint("Tianyi@ OnRoomReddotChange", Count)
  self:OnNewDotChange(RougeConst.ArchiveType.Event, Count)
end

function WBP_Rouge_ArchiveMain_C:OnStoryEventReddotChange(Count)
  DebugPrint("Tianyi@ OnStoryEventReddotChange", Count)
  self:OnNewDotChange(RougeConst.ArchiveType.Story, Count)
end

function WBP_Rouge_ArchiveMain_C:OnRewardReddotChange(Count)
  DebugPrint("Tianyi@ OnRewardReddotChange", Count)
end

function WBP_Rouge_ArchiveMain_C:InitTable()
  self.TabConfigData = {
    TitleName = GText("System_Name_Rouge_Index"),
    LeftKey = "Q",
    RightKey = "E",
    Tabs = {},
    DynamicNode = {"Back", "BottomKey"},
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.OnReturnKeyDown,
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("PROLOGUE_SELECTGUN_TIP_4"),
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
    }
  }
  self.Root:InitOtherPageTab(self.TabConfigData, nil, true, self, self.ChangeBranch)
end

function WBP_Rouge_ArchiveMain_C:OnArchiveEntryClicked(ArchiveType)
  DebugPrint("Tianyi@ OnArchiveEntryClicked, ", ArchiveType)
  if ArchiveType == RougeConst.ArchiveType.Treasure then
    local Treasure = UIManager(self):LoadUINew("RougeBag", "Treasure", self.DataModel)
    Treasure.GuideParent = self
    AudioManager(self):PlayUISound(nil, "event:/ui/roguelike/btn_black_mid_click", nil, nil)
  elseif ArchiveType == RougeConst.ArchiveType.Blessing then
    local Blessing = UIManager(self):LoadUINew("RougeBag", "Blessing", self.DataModel)
    Blessing.GuideParent = self
    AudioManager(self):PlayUISound(nil, "event:/ui/roguelike/btn_black_mid_click", nil, nil)
  elseif ArchiveType == RougeConst.ArchiveType.Event then
    local ArchiveEvent = self.Root:OpenSubUI("RougeArchiveEvent")
    ArchiveEvent:InitUIInfo(self.DataModel.Manuals[RougeConst.ArchiveType.Event], self.DataModel)
    AudioManager(self):PlayUISound(nil, "event:/ui/roguelike/btn_black_mid_click", nil, nil)
  elseif ArchiveType == RougeConst.ArchiveType.Story then
    local ArchiveStory = self.Root:OpenSubUI("RougeArchiveStory")
    ArchiveStory:InitUIInfo(self.DataModel.Manuals[RougeConst.ArchiveType.Story], self.DataModel)
    AudioManager(self):PlayUISound(nil, "event:/ui/roguelike/btn_black_mid_click", nil, nil)
  end
end

function WBP_Rouge_ArchiveMain_C:OnArchiveEntryHovered(ArchiveType)
  if ArchiveType == RougeConst.ArchiveType.Treasure then
    AudioManager(self):PlayUISound(nil, "event:/ui/roguelike/handbook_btn_hover_small", nil, nil)
  elseif ArchiveType == RougeConst.ArchiveType.Blessing then
    AudioManager(self):PlayUISound(nil, "event:/ui/roguelike/handbook_btn_hover_small", nil, nil)
  elseif ArchiveType == RougeConst.ArchiveType.Event then
    AudioManager(self):PlayUISound(nil, "event:/ui/roguelike/handbook_btn_hover_event", nil, nil)
  elseif ArchiveType == RougeConst.ArchiveType.Story then
    AudioManager(self):PlayUISound(nil, "event:/ui/roguelike/handbook_btn_hover_story", nil, nil)
  end
end

function WBP_Rouge_ArchiveMain_C:OnReturnKeyDown()
  ReddotManager.RemoveAllListener("RougeArchiveTreasure")
  ReddotManager.RemoveAllListener("RougeArchiveBlessing")
  ReddotManager.RemoveAllListener("RougeArchiveEvent")
  ReddotManager.RemoveAllListener("RougeArchiveStoryEvent")
  if not self:IsAnyAnimationPlaying() then
    local WidgetUI = self.Root:OpenSubUI("RougeMain")
    self.Root.IsOpenSelectLevel = false
    WidgetUI:InitTable()
  end
end

function WBP_Rouge_ArchiveMain_C:HandleKeyDown(MyGeometry, InKeyEvent)
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

function WBP_Rouge_ArchiveMain_C:SwitchOut()
  AudioManager(self):SetEventSoundParam(self, "RougeArchive", {ToEnd = 1})
end

function WBP_Rouge_ArchiveMain_C:Destruct()
  AudioManager(self):SetEventSoundParam(self, "RougeArchive", {ToEnd = 1})
end

return WBP_Rouge_ArchiveMain_C
