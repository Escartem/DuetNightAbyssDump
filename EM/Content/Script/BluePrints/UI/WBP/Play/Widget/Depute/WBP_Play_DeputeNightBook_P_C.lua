require("UnLua")
local EMCache = require("EMCache.EMCache")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
M._components = {
  "BluePrints.UI.WBP.Play.Widget.Depute.DoubleModDropView"
}
local TypeSort = {
  Char = 1,
  Weapon = 2,
  Mod = 3,
  Draft = 4,
  Reward = 5,
  Resource = 6,
  Drop = 7
}

function M:Construct()
  M.Super.Construct(self)
  self.IsPC = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
  self.IsMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  self.bFocusList_Reward = false
  self.bFocusDownList_Reward = false
  self.List_NightBookItem:ClearListItems()
  self.Btn_More.Btn_Click.OnClicked:Add(self, self.OpenRewardDetails)
  self:AddDispatcher(EventID.NightBookSpecialRightUp, self, self.OnNightBookSpecialRightUp)
  self:AddDispatcher(EventID.DoubleModSwitchTab, self, self.OnDoubleModSwitchTab)
  self:AddDispatcher(EventID.OnActivityTimeOpen, self, self.OnActivityTimeOpen)
  self:AddDispatcher(EventID.OnActivityTimeOpenClose, self, self.OnActivityTimeOpenClose)
  self:AddInputMethodChangedListen()
  
  function self.Btn_Qa.SoundFunc()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  end
  
  self.SelectCellIndex = 0
  self.DoubleMod = self:IsDoubleMod()
  self.Btn_Qa:BindEventOnClicked(self, self.OnTips)
  if self.IsMobile then
    return
  end
  self.Controller_KeyImgTop:SetVisibility(ESlateVisibility.Collapsed)
  self.Controller_KeyImgBottom:SetVisibility(ESlateVisibility.Collapsed)
  self:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.List_Reward:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.List_Reward:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.List_Reward:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.List_Reward:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.List_NightBookItem:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.List_NightBookItem:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.List_NigheBookTab:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    function()
      local RewardItemUIs = self.List_NightBookItem:GetDisplayedEntryWidgets()
      RewardItemUIs[1].List_Reward:SetVisibility(ESlateVisibility.HitTestInvisible)
      self.List_NightBookItem:NavigateToIndex(0)
      return self.List_NightBookItem
    end
  })
end

function M:Destruct()
  M.Super.Destruct(self)
  self:PlayAnimation(self.Out)
end

function M:NightBookFocusReceived(bInIsMatching)
end

function M:InitContent(Root)
  self.ContinuousCombat = EMCache:Get("Is_DoubleMod_SwitchTab", true) or false
  self.Root = Root
  self.Text_More:SetText(GText("UI_GACHA_DETAIL"))
  self.Text_MonsterTitleName:SetText(GText("UI_Dungeon_Title_RewardList"))
  self:RefreshData()
end

function M:RefreshData()
  self.HB_ActivityTab:SetVisibility(self.DoubleMod and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
  self.List_NigheBookTab:ClearListItems()
  self.SelectCellContent = nil
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
  if self.DoubleMod then
    self.DoubleModDropInfo = self:GetDoubleModDropData()
    local IsElite = self.ContinuousCombat
    local TitleKey = IsElite and "UI_Event_ModDrop_ChallengeRemain" or "UI_Event_ModDrop_DropRemain"
    self.Text_TimeTipsTitle:SetText(GText(TitleKey))
    local ConfigValue = 0
    if IsElite then
      ConfigValue = DataMgr and DataMgr.ModDropConstant and DataMgr.ModDropConstant.DailyFreeTicketAmount and DataMgr.ModDropConstant.DailyFreeTicketAmount.ConstantValue or 0
    else
      ConfigValue = DataMgr and DataMgr.ModDropConstant and DataMgr.ModDropConstant.DailyModDungeonAmount and DataMgr.ModDropConstant.DailyModDungeonAmount.ConstantValue or 0
    end
    ConfigValue = tonumber(ConfigValue) or 0
    local UsedTimes = IsElite and self.DoubleModDropInfo.EliteRushTimes or self.DoubleModDropInfo.DropTimes
    UsedTimes = tonumber(UsedTimes) or 0
    local Remaining = math.floor(ConfigValue - UsedTimes)
    local TextValue = Remaining <= 0 and "<Warning>0</>" .. "/" .. ConfigValue or Remaining .. "/" .. ConfigValue
    self.Text_Times:SetText(TextValue)
    self.Text_ModUpNum:SetVisibility(IsElite and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
    local BonusConst = DataMgr.ModDropConstant.EventBonus and DataMgr.ModDropConstant.EventBonus.ConstantValue or 0
    local BonusPercent = math.floor((tonumber(BonusConst) or 0) / 100)
    self.Text_ModUpNum:SetText("+" .. BonusPercent .. "%")
    local TextModUp = IsElite and "UI_Event_ModDrop_LotsOfElites" or "UI_Event_ModDrop_DropDes_1"
    self.Text_ModUp:SetText(GText(TextModUp))
  end
  self.ModSelectDungeon = self.ContinuousCombat and DataMgr.EliteRushSelectDungeon or DataMgr.ModSelectDungeon
  local SortedDungeonData = {}
  for _, DungeonData in pairs(self.ModSelectDungeon) do
    table.insert(SortedDungeonData, DungeonData)
  end
  table.sort(SortedDungeonData, function(A, B)
    return A.Sequence < B.Sequence
  end)
  self:UpdatKeyDisplay()
  local UnlockedMaxIndex = 0
  for i, DungeonData in ipairs(SortedDungeonData) do
    if PageJumpUtils:CheckDungeonCondition(DungeonData.Condition) then
      UnlockedMaxIndex = i
    end
  end
  for i, DungeonData in ipairs(SortedDungeonData) do
    local Content = NewObject(self.LevelCellContentClass)
    Content.DungeonData = DungeonData
    Content.List_NightBookItem = self.List_NightBookItem
    Content.Parent = self
    Content.Root = self.Root
    Content.Index = i
    local Level = tonumber(string.match(DungeonData.Name or "", "_(%d+)$"))
    Content.Level = Level
    if i == UnlockedMaxIndex and 0 == self.SelectCellIndex then
      self.SelectCellIndex = i
    end
    self.List_NigheBookTab:AddItem(Content)
  end
  if not SortedDungeonData[self.SelectCellIndex] then
    self.SelectCellIndex = UnlockedMaxIndex
  end
  self.List_NigheBookTab:ScrollIndexIntoView(self.SelectCellIndex - 1)
  if self.Root.JumpNightBooKTabName then
    self:SetClickedCell(self.Root.JumpNightBooKTabName)
  end
end

function M:SetClickedCell(TabName)
  self:AddTimer(0.1, function()
    for i = 0, self.List_NigheBookTab:GetNumItems() - 1 do
      local Content = self.List_NigheBookTab:GetItemAt(i)
      if PageJumpUtils:CheckDungeonCondition(Content.DungeonData.Condition) and TabName == Content.DungeonData.Name and Content.UI then
        self:OnClickedCell(Content)
        break
      end
    end
  end)
end

function M:OnClickedCell(Content)
  if self.SelectCellContent ~= nil and self.SelectCellContent.UI then
    self.SelectCellContent.UI.IsSelect = false
    self.SelectCellContent.UI:OnCellUnSelect()
  end
  self.SelectCellContent = Content
  self.SelectCellIndex = self.SelectCellContent.Index
  self.List_NigheBookTab:NavigateToIndex(self.SelectCellContent.Index - 1)
  Content.UI:SelectCell()
  Content.UI:RefreshDungeonRewards()
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  local ActiveWidgetIndex = IsUseKeyAndMouse and 0 or 1
  if IsUseKeyAndMouse then
    self.bFocusList_Reward = false
    self.bFocusDownList_Reward = false
    self.Bg_border:SetVisibility(ESlateVisibility.Collapsed)
  else
  end
  self:UpdatKeyDisplay()
end

function M:UpdatKeyDisplay()
  local StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
  if not StyleOfPlay then
    return
  end
  local BottomKeyInfo = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.Root.CloseSelf,
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
      Desc = GText("UI_BACK")
    }
  }
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if self.bFocusList_Reward or self.bFocusDownList_Reward then
      self.Btn_More:SetVisibility(ESlateVisibility.Collapsed)
      BottomKeyInfo = {
        {
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "A",
              Owner = self
            }
          },
          Desc = GText("UI_Controller_CheckDetails"),
          bLongPress = false
        }
      }
      self.Key_DeputeNight:SetVisibility(ESlateVisibility.Collapsed)
      self.DoubleMod_SwitchTab.Key_01:SetVisibility(ESlateVisibility.Collapsed)
      self.WS_Qa:SetActiveWidgetIndex(0)
      self.Key_Qa:SetVisibility(ESlateVisibility.Collapsed)
      if not self.MenuOpen and self.bFocusDownList_Reward then
        self.Key_More_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.Key_More_GamePad:CreateCommonKey({
          KeyInfoList = {
            {Type = "Img", ImgShortPath = "Menu"}
          }
        })
      else
        self.Key_More_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      end
      StyleOfPlay.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
      StyleOfPlay.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
      StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
      StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Root.DeputeTab:UpdateUIStyleInPlatform(false)
    else
      self.Btn_More:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Key_More_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      self.Key_DeputeNight:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Key_DeputeNight:CreateCommonKey({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "X"}
        }
      })
      if self.DoubleMod then
        self.DoubleMod_SwitchTab.Key_01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.DoubleMod_SwitchTab.Key_01:CreateCommonKey({
          KeyInfoList = {
            {Type = "Img", ImgShortPath = "Y"}
          }
        })
        self.WS_Qa:SetActiveWidgetIndex(1)
        if not self.bFocusList_Reward then
          self.Key_Qa:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
          self.Key_Qa:CreateCommonKey({
            KeyInfoList = {
              {Type = "Img", ImgShortPath = "Menu"}
            }
          })
        else
          self.Key_Qa:SetVisibility(ESlateVisibility.Collapsed)
        end
      end
      StyleOfPlay.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      StyleOfPlay.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      if self.Root and self.Root.DeputeTab then
        self.Root.DeputeTab:UpdateUIStyleInPlatform(true)
      end
    end
    local Visibility = self.bFocusList_Reward and ESlateVisibility.Collapsed or ESlateVisibility.SelfHitTestInvisible
    self.Bg_border:SetVisibility(self.bFocusDownList_Reward and ESlateVisibility.SelfHitTestInvisible or ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.Left_GamePad:SetVisibility(Visibility)
    StyleOfPlay.ComTab.Right_GamePad:SetVisibility(Visibility)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(Visibility)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(Visibility)
    if self.MenuOpen then
      BottomKeyInfo = {}
      StyleOfPlay.ComTab.Left_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      StyleOfPlay.ComTab.Right_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    end
  else
    if self.IsPC then
      self.Key_More_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      self.Key_DeputeNight:SetVisibility(ESlateVisibility.Collapsed)
      self.WS_Qa:SetActiveWidgetIndex(0)
      self.Key_Qa:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.Btn_More:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.DoubleMod_SwitchTab.Key_01:SetVisibility(ESlateVisibility.Collapsed)
  end
  StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
end

function M:GetAllModSelectRewards(CurrentLevel)
  local RewardIdSet = {}
  local FinalRewardList = {}
  local SelectDungeonData = self.ModSelectDungeon[CurrentLevel]
  local MonRewardIdList = SelectDungeonData.MonRewardIdList
  for _, MonRewardId in pairs(MonRewardIdList) do
    local MonRewardData = DataMgr.ModDungeonMonReward[MonRewardId]
    if MonRewardData then
      for _, DungeonId in pairs(MonRewardData.DungeonList) do
        local DungeonData = DataMgr.Dungeon[DungeonId]
        if DungeonData then
          local RewardId = DungeonData.DungeonRewardView
          if RewardId and not RewardIdSet[RewardId] then
            RewardIdSet[RewardId] = true
            table.insert(FinalRewardList, RewardId)
          end
        end
      end
    end
  end
  return FinalRewardList
end

function M:RefreshRewardInfoList(Level)
  self.RewardLists = {}
  self.List_Reward:ClearListItems()
  local DungeonRewards = self:GetAllModSelectRewards(Level)
  if not DungeonRewards then
    DebugPrint("SL DungeonReward is nil")
    return
  end
  local IdSet = {}
  local AllRewards = {}
  for _, DungeonReward in pairs(DungeonRewards) do
    local RawList = RewardUtils:GetRewardViewInfoById(DungeonReward)
    for _, v in pairs(RawList) do
      table.insert(AllRewards, v)
    end
  end
  table.sort(AllRewards, function(A, B)
    if A.Rarity == B.Rarity then
      return A.Id < B.Id
    end
    return A.Rarity > B.Rarity
  end)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for _, ItemData in ipairs(AllRewards) do
    if not IdSet[ItemData.Id] then
      IdSet[ItemData.Id] = true
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      table.insert(self.RewardLists, ItemData)
      Content.Id = ItemData.Id
      Content.Icon = ItemUtils.GetItemIconPath(ItemData.Id, ItemData.Type)
      Content.ParentWidget = self
      Content.ItemType = ItemData.Type
      Content.Rarity = ItemData.Rarity or 1
      Content.IsShowDetails = true
      Content.UIName = "StyleOfPlay"
      if ItemData.DropType then
        Content.bRare = DataMgr.DropProbType[ItemData.DropType].IsRareItem
      end
      if ItemData.Quantity then
        Content.Count = ItemData.Quantity[1]
        Content.MaxCount = ItemData.Quantity[2] or nil
      end
      Content.bShadow = false
      if Content.ItemType == "Mod" then
        local ModModel = ModController:GetModel()
        Content.bShadow = ModModel:GetModCountById(Content.Id) <= 0
      elseif Content.ItemType == "Walnut" then
        local WalnutsInBag = Avatar.Walnuts.WalnutBag
        Content.bShadow = (WalnutsInBag[Content.Id] or 0) <= 0
      end
      self.List_Reward:AddItem(Content)
    end
  end
  if self:IsExistTimer(self.NextFrameListEmpty) then
    self:RemoveTimer(self.NextFrameListEmpty)
  end
  self.NextFrameListEmpty = self:AddTimer(0.01, function()
    local len = self.List_Reward:GetNumItems()
    for i = 1, len do
      local entryWidget = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Reward, i - 1)
      if entryWidget then
        entryWidget:BindEvents(self, {
          OnMenuOpenChanged = self.OnStuffMenuOpenChanged
        })
      end
    end
    local RewardItemUIs = self.List_Reward:GetDisplayedEntryWidgets()
    local RestCount = UIUtils.GetListViewContentMaxCount(self.List_Reward, RewardItemUIs, true) - RewardItemUIs:Length()
    for i = 1, RestCount do
      self:CreateAndAddEmptyItem()
    end
  end, false, 0, "DeputeNightBookListView")
end

function M:CreateAndAddEmptyItem()
  local Content = NewObject(UIUtils.GetCommonItemContentClass())
  Content.Id = 0
  return Content
end

function M:OpenRewardDetails()
  AudioManager(self):PlayUISound(self, "event:/ui/common/tip_show_click", nil, nil)
  local Params = {}
  Params.RewardList = self.RewardLists
  local UI = UIManager(self):ShowCommonPopupUI(100156, Params)
end

function M:OnDoubleModSwitchTab()
  self.ContinuousCombat = EMCache:Get("Is_DoubleMod_SwitchTab", true) or false
  self:RefreshData()
end

function M:OnActivityTimeOpen()
  self.DoubleMod = self:IsDoubleMod()
  AudioManager(self):PlayUISound(self, "event:/ui/common/tip_show_click", nil, nil)
  self.ContinuousCombat = EMCache:Get("Is_DoubleMod_SwitchTab", true) or false
  self:RefreshData()
end

function M:OnActivityTimeOpenClose()
  AudioManager(self):PlayUISound(self, "event:/ui/common/tip_show_click", nil, nil)
  self.ContinuousCombat = EMCache:Set("Is_DoubleMod_SwitchTab", nil, true)
  self:RefreshData()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if not UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
  elseif UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if "Gamepad_FaceButton_Left" == InKeyName then
    local RewardItemUIs = self.List_Reward:GetDisplayedEntryWidgets()
    if not RewardItemUIs[1]:HasAnyUserFocus() then
      self.List_Reward:NavigateToIndex(0)
      self.bFocusDownList_Reward = true
    else
      self.List_NigheBookTab:NavigateToIndex(self.SelectCellContent.Index - 1)
      self.bFocusDownList_Reward = false
    end
    self:UpdatKeyDisplay()
    IsEventHandled = true
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    local RewardItemUIs = self.List_Reward:GetDisplayedEntryWidgets()
    for i = 1, RewardItemUIs:Length() do
      if RewardItemUIs[i]:HasFocusedDescendants() or RewardItemUIs[i]:HasAnyUserFocus() then
        self.List_NigheBookTab:NavigateToIndex(self.SelectCellContent.Index - 1)
        self.bFocusList_Reward = false
        self.bFocusDownList_Reward = false
        self:UpdatKeyDisplay()
        IsEventHandled = true
        break
      end
    end
  elseif InKeyName == Const.GamepadFaceButtonUp and not self.bFocusList_Reward and self.DoubleMod then
    self.DoubleMod_SwitchTab:OnClicked()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:OnNightBookSpecialRightUp()
  if self.bFocusList_Reward then
    return
  end
  if self:HasFocusedDescendants() or self:HasAnyUserFocus() then
    if self.Key_More_GamePad:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
      if self.bFocusDownList_Reward and not self.MenuOpen then
        self:OpenRewardDetails()
      end
    elseif self.Key_Qa:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
      self:OnTips()
    end
  end
end

function M:OnTips()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  end
  local DropTotalTimes = DataMgr.ModDropConstant.DailyFreeTicketAmount.ConstantValue or 0
  local EliteRushTotalTimes = DataMgr.ModDropConstant.DailyModDungeonAmount.ConstantValue or 0
  local Params = {
    LongText = string.format(GText(DataMgr.CommonPopupUIContext[100237].PopoverText), EliteRushTotalTimes, DropTotalTimes)
  }
  UIManager(self):ShowCommonPopupUI(100237, Params, self)
end

function M:OnStuffMenuOpenChanged(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  self.MenuOpen = bIsOpen
  self:UpdatKeyDisplay()
end

AssembleComponents(M)
return M
