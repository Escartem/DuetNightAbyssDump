require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local Info = (...)
  self.DefaultFishingSpotId = Info.FishingSpotId
  self.DefaultFishResourceId = Info.FishResourceId
  if not self.DefaultFishResourceId then
    self.DefaultFishId = Info.FishId
  else
    self.DefaultFishId = DataMgr.ResourceId2FishId[self.DefaultFishResourceId]
    self.DefaultFishingSpotId = self:GetFishSpotId(self.DefaultFishId)
  end
  if not self.DefaultFishId then
    self.DefaultFishId = 101
  end
  if not self.DefaultFishingSpotId then
    GWorld.logger.error("\230\178\161\230\156\137\230\137\190\229\136\176\233\146\147\233\177\188\231\130\185\230\149\176\230\141\174\239\188\140\233\177\188id\239\188\154" .. self.DefaultFishId .. "\239\188\140\232\175\183\230\163\128\230\159\165\233\177\188\231\130\185\232\161\168\231\154\132\233\177\188\231\177\187\229\136\151\232\161\168")
    self.DefaultFishingSpotId = 10010101
  end
  self.RegionPointId = DataMgr.FishingSpot[self.DefaultFishingSpotId].RegionPointId
  self.SpotList = {}
  self:InitCommonWidget()
  self.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile"
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshInfoByInputTypeChange)
  self.CurMode = self.GameInputModeSubsystem:GetCurrentInputType()
  self:RefreshInfoByInputTypeChange(self.CurMode)
  if self.DeviceInPc then
    self.Key_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "AnglingMapOpen", nil)
end

function M:InitCommonWidget()
  self:InitCommonTab()
  self:UpdateFishMapItem()
  self.BtnText:SetText(GText("UI_Fishing_TrackFishingSpot"))
  self.BtnText:BindEventOnClicked(self, self.OnClickTrackSpot)
  self.BtnText:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  end)
  self.BtnText:SetGamePadImg("Y")
  if self.DeviceInPc then
    self.Key_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
  end
  self.Btn_Click.OnClicked:Add(self, self.OnClickReward)
  self.Text_Tips:SetText(GText("UI_Wiki_Reward_Title"))
  self:CheckCompleteAchieveCount()
end

function M:InitCommonTab()
  local TabList = {}
  for SpotId, Data in pairs(DataMgr.FishingSpot) do
    if Data.ShowInFishMap then
      local IconPath = Data.IconPath or "/Game/UI/Texture/Dynamic/Atlas/Tab/T_Tab_Angling01.T_Tab_Angling01"
      local Tab = {
        Text = GText(Data.FishingSpotName),
        ShowRedDot = false,
        IsNew = false,
        IconPath = IconPath,
        IsLocked = false,
        IsForbidden = false,
        LockReasonText = GText("UI_RegionMap_MaxMark"),
        SpotId = SpotId
      }
      table.insert(TabList, Tab)
    end
  end
  table.sort(TabList, function(a, b)
    return a.SpotId < b.SpotId
  end)
  local CurrentTabId = 1
  self.CurrentTabIndex = 1
  for i, v in pairs(TabList) do
    v.TabId = CurrentTabId
    self.SpotList[CurrentTabId] = v.SpotId
    if v.SpotId == self.DefaultFishingSpotId then
      self.CurrentTabIndex = CurrentTabId
    end
    CurrentTabId = CurrentTabId + 1
  end
  self.Com_Tab:Init({
    LeftKey = "Q",
    RightKey = "E",
    Tabs = TabList,
    PlatformName = "PC",
    DynamicNode = {
      "Back",
      "BottomKey",
      "Tip"
    },
    OwnerPanel = self,
    BackCallback = self.OnClickReturn,
    StyleName = "Text",
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnClickReturn,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    },
    TitleName = GText("UI_Fishing_FishBook")
  })
  self.Com_Tab:BindEventOnTabSelected(self, self.OnTabChanged)
  self.Com_Tab:SelectTab(self.CurrentTabIndex)
end

function M:UpdateFishMapItem()
  self.List_Item:ClearListItems()
  local SpotId = self.SpotList[self.CurrentTabIndex]
  if not DataMgr.FishingSpot[SpotId] or not DataMgr.FishingSpot[SpotId].FishId then
    GWorld.logger.error("\233\177\188\231\130\185" .. SpotId .. "\230\178\161\230\156\137\230\149\176\230\141\174\239\188\140\230\136\150\232\128\133\230\178\161\230\156\137\233\177\188\231\154\132\230\149\176\230\141\174")
    return
  end
  local List = {}
  for i, FishId in ipairs(DataMgr.FishingSpot[SpotId].FishId) do
    local ResourceId = DataMgr.Fish[FishId].ResourceId
    local Rarity = ItemUtils.GetItemRarity(ResourceId, "Resource")
    table.insert(List, {
      FishId = FishId,
      Rarity = Rarity,
      Idx = i
    })
    print(_G.LogTag, "LXZ UpdateFishMapItem", FishId)
  end
  table.sort(List, function(a, b)
    if a.Rarity == b.Rarity then
      return a.Idx < b.Idx
    else
      return a.Rarity > b.Rarity
    end
  end)
  for i, FishTable in pairs(List) do
    print(_G.LogTag, "LXZ UpdateFishMapItem11", FishTable.FishId)
    local Content = self:NewMapContent(FishTable.FishId)
    if Content then
      self.List_Item:AddItem(Content)
    end
  end
end

function M:OnTabChanged(TabWidget)
  self.CurrentTabIndex = TabWidget.Idx
  self:UpdateFishMapItem()
end

function M:OnClickTrackSpot()
  local SpotId = self.SpotList[self.CurrentTabIndex]
  self.RegionPointId = DataMgr.FishingSpot[SpotId].RegionPointId
  if not self.RegionPointId then
    GWorld.logger.error("LXZ OnClickTrackSpot \233\177\188\231\130\185\228\184\141\229\173\152\229\156\168\229\156\176\229\155\190\229\155\190\230\160\135\231\188\150\229\143\183\239\188\140 \233\177\188\231\130\185Id:", self.DefaultFishingSpotId)
    return
  end
  local ConditionId = DataMgr.RegionPoint[self.RegionPointId].UnlockConditionId
  local Avatar = GWorld:GetAvatar()
  if ConditionId and Avatar and not ConditionUtils.CheckCondition(Avatar, ConditionId) then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("UI_Fishing_FishingSpotLocked"))
    return
  end
  local SubRegionId = DataMgr.RegionPoint[self.RegionPointId].SubRegion
  local RegionId = DataMgr.SubRegion[SubRegionId].RegionId
  if RegionId then
    print(_G.LogTag, "LXZ OnClickTrackSpot", SubRegionId, RegionId, self.RegionPointId, self.RegionPointId)
    UIManager(self):LoadUINew("LevelMapMain", false, RegionId, "RegionPoint", self.RegionPointId)
  end
end

function M:OnClickReturn(TabWidget)
  AudioManager(self):SetEventSoundParam(self, "AnglingMapOpen", {ToEnd = 1})
  self:Close()
end

function M:OnClickReward(TabWidget)
  print(_G.LogTag, "LXZ OnClickReward")
  local ConfigData = {
    Items = {},
    ShowIcon = false,
    IconPath = "",
    Text_Total = GText("UI_Fishing_FishingBookTotal"),
    NumMax = 0,
    NowNum = 1,
    ReceiveAllCallBack = self.GetAllRewards,
    ReceiveAllParam = {},
    ReceiveButtonText = GText("UI_Fishing_GetReward"),
    SortType = 2
  }
  local AchievementList = DataMgr.FishingAchievement
  local List = {}
  for i, v in pairs(AchievementList) do
    table.insert(List, v)
  end
  table.sort(List, function(a, b)
    return a.FishingAchievementId < b.FishingAchievementId
  end)
  local TabId = 1
  local CompleteAchive = 0
  for i, v in pairs(List) do
    local Item = self:CreateArchieveTable(v.FishingAchievementId, v, TabId)
    table.insert(ConfigData.Items, Item)
    TabId = TabId + 1
    if Item.CanReceive or Item.RewardsGot then
      CompleteAchive = CompleteAchive + 1
    end
  end
  ConfigData.NumMax = TabId - 1
  ConfigData.NowNum = CompleteAchive
  UIManager(self):ShowCommonPopupUI(100178, {
    ConfigData = ConfigData,
    CloseBtnCallbackObj = self,
    CloseBtnCallbackFunction = self.CheckCompleteAchieveCount
  }, self)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  print(_G.LogTag, "LXZ OnKeyDown", InKeyName)
  if "Escape" == InKeyName or "Gamepad_FaceButton_Right" == InKeyName then
    self:OnClickReturn()
  elseif "Gamepad_FaceButton_Top" == InKeyName then
    self:OnClickTrackSpot()
  elseif "Gamepad_LeftThumbstick" == InKeyName then
    self:OnClickReward()
  elseif UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    self.Com_Tab:Handle_KeyEventOnGamePad(InKeyName)
  else
    self.Com_Tab:Handle_KeyEventOnPC(InKeyName)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:GetRewards(Content)
  print(_G.LogTag, "LXZ Avatar\229\143\145\229\165\150", Content.ConfigData.ReceiveParm.AchievementId)
  local AchievementId = Content.ConfigData.ReceiveParm.AchievementId
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function CallBack(Ret, Reward)
      local FishiAchv = Avatar.FishAchvs[AchievementId]
      
      Content.ConfigData.CanReceive = FishiAchv:IsComplete() and FishiAchv:CanRecvReward()
      Content.ConfigData.RewardsGot = not FishiAchv:CanRecvReward()
      Content.SelfWidget:RefreshBtn(0 == Ret)
      local HaveReWardToGet = false
      for i = 0, Content.Owner.List_Item:GetNumItems() - 1 do
        local Item = Content.Owner.List_Item:GetItemAt(i)
        local AchievementId = Item.ConfigData.AchievementId
        local FishiAchv = Avatar.FishAchvs[AchievementId]
        local CanReceive = FishiAchv:IsComplete() and FishiAchv:CanRecvReward()
        if CanReceive then
          HaveReWardToGet = true
        end
      end
      Content.SelfWidget.Owner:RefreshButton(HaveReWardToGet)
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Reward, false, nil, self, false)
    end
    
    Avatar:GetFishAchvReward(AchievementId, CallBack)
  end
end

function M:GetAllRewards(ReceiveAllParam)
  print(_G.LogTag, "LXZ Avatar\229\133\168\233\131\168\229\143\145\229\165\150", ReceiveAllParam.AchievementId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local function CallBack(Ret, Reward)
      local HaveReWardToGet = false
      
      for i = 0, ReceiveAllParam.SelfWidget.List_Item:GetNumItems() - 1 do
        local Item = ReceiveAllParam.SelfWidget.List_Item:GetItemAt(i)
        local AchievementId = Item.ConfigData.AchievementId
        local FishiAchv = Avatar.FishAchvs[AchievementId]
        local CanReceive = FishiAchv:IsComplete() and FishiAchv:CanRecvReward()
        print(_G.LogTag, "LXZ Avatar\229\133\168\233\131\168\229\143\145\229\165\150 cb 1", AchievementId, CanReceive, ReceiveAllParam.SelfWidget.List_Item:GetNumItems())
        if CanReceive then
          HaveReWardToGet = true
        end
        Item.ConfigData.CanReceive = CanReceive
        Item.ConfigData.RewardsGot = FishiAchv:IsComplete() and not FishiAchv:CanRecvReward()
        if Item.SelfWidget then
          Item.SelfWidget:RefreshBtn(not CanReceive)
        end
      end
      UIUtils.ShowGetItemPageAndOpenBagIfNeeded(nil, nil, nil, Reward, false, nil, self, false)
      ReceiveAllParam.SelfWidget:RefreshButton(HaveReWardToGet)
    end
    
    Avatar:GetAllFishAchvReward(CallBack)
  end
end

function M:NewMapContent(FishId)
  local Class = LoadClass("/Game/UI/WBP/Angling/Widget/Angling_FishMap_Item_Content.Angling_FishMap_Item_Content")
  local Obj = NewObject(Class)
  Obj.FishId = FishId
  return Obj
end

function M:GetRewardsIcons(RewardId)
  local Res = {}
  local RewardInfo = DataMgr.Reward[RewardId]
  for i, v in pairs(RewardInfo.Id) do
    local Obj = self:GetRewardIcon(RewardInfo, i)
    table.insert(Res, Obj)
  end
  return Res
end

function M:GetRewardIcon(RewardInfo, RewardIndex)
  local Type = RewardInfo.Type[RewardIndex]
  local Id = RewardInfo.Id[RewardIndex]
  print(_G.LogTag, "LXZ GetRewardIcon", RewardIndex, Id, ItemUtils.GetItemRarity(Id, Type))
  local ItemData = DataMgr[Type][Id]
  local Class = LoadClass("/Game/UI/UI_PC/Common/Common_Item_subsize_PC_Content.Common_Item_subsize_PC_Content_C")
  local Res = {
    ItemType = Type,
    ItemId = Id,
    Count = RewardUtils:GetCount(RewardInfo.Count[RewardIndex]),
    Rarity = ItemUtils.GetItemRarity(Id, Type)
  }
  return Res
end

function M:CreateArchieveTable(AchievementId, Data, TabId)
  local Item = {
    ItemId = TabId,
    CanReceive = true,
    RewardsGot = false,
    InProgress = true,
    Rewards = {},
    Nums = 1,
    NotreachText = "UI_GameEvent_ToBeFinished",
    Hint = string.gsub(GText(Data.Describe), "#1", Data.Target),
    ReceiveCallBack = self.GetRewards,
    LeftAligned = false,
    ReceiveParm = {AchievementId = AchievementId},
    NotShowNum = true,
    AchievementId = AchievementId,
    ReceiveButtonText = GText("UI_Achievement_GetReward")
  }
  Item.Rewards = self:GetRewardsIcons(Data.RewardId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local FishiAchv = Avatar.FishAchvs[AchievementId]
    Item.CanReceive = FishiAchv:IsComplete() and FishiAchv:CanRecvReward()
    Item.RewardsGot = not FishiAchv:CanRecvReward()
    print(_G.LogTag, "LXZ CreateArchieveTable", AchievementId, FishiAchv:IsComplete(), FishiAchv:CanRecvReward())
  end
  return Item
end

function M:CheckCompleteAchieveCount()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Count = 0
  local CanReceiveCount = 0
  local CompleteCount = 0
  local AchievementList = DataMgr.FishingAchievement
  for AchievementId, Data in pairs(AchievementList) do
    local FishiAchv = Avatar.FishAchvs[AchievementId]
    if FishiAchv:IsComplete() then
      CompleteCount = CompleteCount + 1
      if FishiAchv:CanRecvReward() then
        CanReceiveCount = CanReceiveCount + 1
      end
    end
    Count = Count + 1
  end
  print(_G.LogTag, "LXZ CheckCompleteAchieveCount000", CanReceiveCount)
  if CanReceiveCount > 0 then
    self:PlayAnimation(self.Reward_Remind)
    self.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self:PlayAnimation(self.No_Reward)
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Text_Num:SetText(CompleteCount .. "/" .. Count)
end

function M:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
  self.CurMode = CurInputDevice
  if CurInputDevice == ECommonInputType.MouseAndKeyboard and self.DeviceInPc then
    self.Key_GamePad:SetVisibility(ESlateVisibility.Collapsed)
  elseif CurInputDevice == ECommonInputType.Gamepad and self.DeviceInPc then
    self.Key_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif CurInputDevice == ECommonInputType.Touch then
  end
end

function M:GetFishSpotId(FishId)
  local Data = DataMgr.Fish2FishingSpot[FishId]
  if not Data then
    return
  end
  for SpotId, Weight in pairs(Data) do
    local SpotData = DataMgr.FishingSpot[SpotId]
    if SpotData then
      return SpotId
    end
  end
  return
end

return M
