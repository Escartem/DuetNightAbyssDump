require("UnLua")
local MonsterUtils = require("Utils.MonsterUtils")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
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
  self:AddInputMethodChangedListen()
  self.Btn_Goto.Button_Area.OnClicked:Add(self, self.OnClicked)
  self.Btn_DoubleMod.Button_Area.OnClicked:Add(self, self.OnClicked)
  self.List_Reward:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.List_Reward:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.List_Reward:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.List_Reward:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.Btn_Goto.bAutoButtonChange = false
  self.Btn_DoubleMod.bAutoButtonChange = false
  self.List_Reward.OnCreateEmptyContent:Bind(self, self.CreateAndAddEmptyItem)
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.IsEmpty = Content.IsEmpty
  if not self.IsEmpty then
    self.Root = Content.Root
    self.Parent = Content.Parent
    self.DungeonData = Content.DungeonData
    self.MonRewardData = Content.MonRewardData
    self.DoubleMod = Content.Parent.DoubleMod
    self.ContinuousCombat = Content.Parent.ContinuousCombat
  end
  self:InitItemContent()
end

function M:InitItemContent()
  self.Group_NightBookItem:SetRenderOpacity(0)
  self.Mobile = "Mobile" == CommonUtils.GetDeviceTypeByPlatformName(self)
  self.IsEnter = false
  if self.IsEmpty then
    self.WS_Item:SetActiveWidgetIndex(1)
    self:PlayAnimation(self.In)
    self.bIsFocusable = false
    self:SetVisibility(ESlateVisibility.HitTestInvisible)
    return
  end
  self.bIsFocusable = true
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.WS_Item:SetActiveWidgetIndex(0)
  self.List_Reward:ClearListItems()
  local InputType = UIUtils.UtilsGetCurrentInputType()
  local IsGamepad = InputType == ECommonInputType.Gamepad
  self.List_Reward:SetVisibility(IsGamepad and ESlateVisibility.HitTestInvisible or ESlateVisibility.SelfHitTestInvisible)
  if self.MonRewardData then
    self:PlayAnimation(self.In)
    local IsLocked = not PageJumpUtils:CheckDungeonCondition(self.MonRewardData.Condition)
    self.IsUnLocked = IsLocked
    self:PlayAnimation(IsLocked and self.Locked or self.Normal)
    self.Btn_Goto:ForbidBtn(IsLocked)
    self.Btn_DoubleMod:ForbidBtn(IsLocked)
    local MonsterData = DataMgr.Monster[self.MonRewardData.MonsterUnitId]
    local MonsterInfo = {
      WeaknessIcon = self:GetMonsterWeaknessIcon(self.MonRewardData.MonsterUnitId)
    }
    self.DeputeMonsterTab:SetBasicData(self.MonRewardData.MonsterUnitId, MonsterInfo)
    self.DeputeMonsterTab:SetVisibility(ESlateVisibility.HitTestInvisible)
    self.Text_MonsterTitleName:SetText(GText(MonsterData.UnitName))
    self.Text_MonsterTitleDesc:SetText(GText("UI_Dungeon_MonsterReward"))
    self.Btn_Goto.Text_Button:SetText(GText("UI_GameEvent_Goto"))
    self.Btn_DoubleMod.Text_Button:SetText(GText("UI_GameEvent_Goto"))
    if self.DoubleMod then
      local IsDoubleModDungeon = false
      local DoubleModDrop = DataMgr.DoubleModDrop and DataMgr.DoubleModDrop[CommonConst.DoubleModDropEventID]
      local ModDungeonIds = DoubleModDrop and DoubleModDrop.ModDungeonId
      if ModDungeonIds and self.MonRewardData and self.MonRewardData.DungeonList then
        local DungeonId = self.MonRewardData.DungeonList[1]
        for _, ModDungeonId in pairs(ModDungeonIds) do
          if DungeonId == ModDungeonId then
            IsDoubleModDungeon = true
            break
          end
        end
      end
      local ConfigValue = DataMgr and DataMgr.ModDropConstant and DataMgr.ModDropConstant.EventBonus and DataMgr.ModDropConstant.EventBonus.ConstantValue or 0
      local BonusText = "+" .. math.floor(ConfigValue / 100) .. "%"
      self.Text_DoubleModSign:SetText(BonusText)
      if self.ContinuousCombat then
        self.Group_DoubleModSign:SetVisibility(ESlateVisibility.Collapsed)
        self.WS_Btn:SetActiveWidgetIndex(1)
        self.VX_EffectBG:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      elseif IsDoubleModDungeon then
        self.Group_DoubleModSign:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.WS_Btn:SetActiveWidgetIndex(0)
        self.VX_EffectBG:SetVisibility(ESlateVisibility.Collapsed)
      else
        self.WS_Btn:SetActiveWidgetIndex(0)
        self.Group_DoubleModSign:SetVisibility(ESlateVisibility.Collapsed)
        self.VX_EffectBG:SetVisibility(ESlateVisibility.Collapsed)
      end
    else
      self.WS_Btn:SetActiveWidgetIndex(0)
      self.Group_DoubleModSign:SetVisibility(ESlateVisibility.Collapsed)
      self.VX_EffectBG:SetVisibility(ESlateVisibility.Collapsed)
    end
    self:RefreshRewardInfoList(self.MonRewardData.DungeonRewardView)
    if IsGamepad then
      self.Btn_Goto:SetPCVisibility(true)
      self.Btn_DoubleMod:SetPCVisibility(true)
    end
  end
end

function M:GetMonsterWeaknessIcon(MonsterId)
  local MonsterWeaknessIcon = self.MonsterWeaknessIconCache or {}
  self.MonsterWeaknessIconCache = MonsterWeaknessIcon
  if MonsterWeaknessIcon[MonsterId] then
    return MonsterWeaknessIcon[MonsterId]
  end
  local AllBuffs = MonsterUtils.GetRealMonsterBuffs(self.MonRewardData.DungeonList[1], MonsterId)
  for _, BuffId in ipairs(AllBuffs) do
    local BuffInfo = DataMgr.Buff[BuffId]
    if BuffInfo and BuffInfo.WeaknessType then
      local WeaknessIcon = DataMgr.DamageType[BuffInfo.WeaknessType] and DataMgr.DamageType[BuffInfo.WeaknessType].WeaknessIcon
      if WeaknessIcon then
        MonsterWeaknessIcon[MonsterId] = MonsterWeaknessIcon[MonsterId] or {}
        MonsterWeaknessIcon[MonsterId][WeaknessIcon] = true
      end
    end
  end
  return MonsterWeaknessIcon[MonsterId]
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self.Btn_Goto:SetPCVisibility(true)
    self.Btn_DoubleMod:SetPCVisibility(true)
    if self.Com_Reward then
      self.Com_Reward:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.List_Reward:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if self.IsEnter then
      self:PlayAnimation(self.Unhover)
    end
  else
    self.List_Reward:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

function M:OnClicked()
  if self.IsUnLocked or self:IsAnimationPlaying(self.In) then
    PageJumpUtils:CheckDungeonCondition(self.MonRewardData.Condition, true)
    return
  end
  local Item = UIManager(self):GetUIObj("StyleOfPlay")
  Item.IsOpenSelectLevel = false
  local SelectLevel = Item:OpenSubUI("DungeonSelect")
  local DungeonList = self.MonRewardData.DungeonList
  SelectLevel:SetNightFlightManualRewardView(self.MonRewardData.DungeonRewardView)
  SelectLevel:InitLevelList(DungeonList, nil, Const.DeputeType.NightFlightManualDepute, nil)
  Item:InitOtherPageTab({
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {Type = "Add"},
          GamePadSubKeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "Up",
              Owner = SelectLevel
            },
            {
              Type = "Img",
              ImgShortPath = "Y",
              Owner = SelectLevel
            }
          }
        },
        Desc = GText("UI_CTL_DeputeInfo"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = SelectLevel.OnReturnKeyDown,
            Owner = SelectLevel
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = SelectLevel
          }
        },
        Desc = GText("UI_BACK")
      }
    },
    OwnerPanel = SelectLevel,
    BackCallback = SelectLevel.OnReturnKeyDown,
    StyleName = "Text",
    TitleName = GText("UI_Dungeon_Tab_ModDungeon")
  }, nil, true)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if self.IsEmpty then
    return
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:OnClicked()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  self.IsEnter = true
  if self.IsUnLocked or self.Mobile or self.IsEmpty or self:IsAnimationPlaying(self.In) or UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad or not self.IsEmpty then
  end
end

function M:OnMouseLeave(MyGeometry, MouseEvent)
  self.IsEnter = false
  if self.IsUnLocked or self.Mobile or self.IsEmpty or self:IsAnimationPlaying(self.In) or UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Unhover)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and not self.IsEmpty then
    self.Com_Reward:SetVisibility(ESlateVisibility.Collapsed)
    self.Btn_Goto:SetPCVisibility(true)
    self.Btn_DoubleMod:SetPCVisibility(true)
  end
end

function M:RefreshRewardInfoList(DungeonReward)
  if not DungeonReward then
    DebugPrint("SL DungeonReward is nil")
    return
  end
  local RewardList = RewardUtils:GetRewardViewInfoById(DungeonReward)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  for _, ItemData in pairs(RewardList) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = ItemData.Id
    Content.Icon = ItemUtils.GetItemIconPath(ItemData.Id, ItemData.Type)
    Content.ParentWidget = self
    Content.ItemType = ItemData.Type
    Content.Rarity = ItemData.Rarity or 1
    Content.IsShowDetails = true
    Content.UIName = "StyleOfPlay"
    Content.bAsyncLoadIcon = true
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
    self.List_Reward:RequestFillEmptyContent()
  end, false, 0, "DeputeDetailListView")
end

function M:CreateAndAddEmptyItem()
  local Content = NewObject(UIUtils.GetCommonItemContentClass())
  Content.Id = 0
  return Content
end

function M:OnStuffMenuOpenChanged(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if bIsOpen then
    self:UpdatKeyDisplay("")
    self.Btn_Goto:SetPCVisibility(true)
    self.Btn_DoubleMod:SetPCVisibility(true)
  else
    self.Btn_Goto:SetPCVisibility(true)
    self.Btn_DoubleMod:SetPCVisibility(true)
    self:UpdatKeyDisplay("RewardWidget")
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
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
  if "Gamepad_LeftThumbstick" == InKeyName then
    local RewardItemUIs = self.List_Reward:GetDisplayedEntryWidgets()
    if not RewardItemUIs[1]:HasAnyUserFocus() then
      self.List_Reward:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.List_Reward:NavigateToIndex(0)
      self.Parent.bFocusList_Reward = true
      self:UpdatKeyDisplay("RewardWidget")
      if not self.IsEmpty then
        self.Btn_Goto:SetPCVisibility(true)
        self.Btn_DoubleMod:SetPCVisibility(true)
      end
      IsEventHandled = true
    else
      self:SetFocus()
      self.Parent.bFocusList_Reward = false
      self:UpdatKeyDisplay("SelfWidget")
      self.List_Reward:SetVisibility(ESlateVisibility.HitTestInvisible)
      IsEventHandled = true
    end
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    local RewardItemUIs = self.List_Reward:GetDisplayedEntryWidgets()
    for i = 1, RewardItemUIs:Length() do
      if RewardItemUIs[i]:HasFocusedDescendants() or RewardItemUIs[i]:HasAnyUserFocus() then
        self:SetFocus()
        self.Parent.bFocusList_Reward = false
        self:UpdatKeyDisplay("SelfWidget")
        self.List_Reward:SetVisibility(ESlateVisibility.HitTestInvisible)
        IsEventHandled = true
        break
      end
    end
  else
    local RewardItemUIs = self.List_Reward:GetDisplayedEntryWidgets()
    for i = 1, RewardItemUIs:Length() do
      if RewardItemUIs[i]:HasFocusedDescendants() or RewardItemUIs[i]:HasAnyUserFocus() then
        IsEventHandled = true
        break
      end
    end
  end
  return IsEventHandled
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:UpdatKeyDisplay("FocusSelfWidget")
    if not self.IsEmpty then
      self.Btn_Goto:SetPCVisibility(false)
      self.Btn_DoubleMod:SetPCVisibility(false)
    end
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:UpdatKeyDisplay(FocusTypeName)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  self.Parent:UpdatKeyDisplay()
  local StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
  if not StyleOfPlay then
    return
  end
  if "RewardWidget" == FocusTypeName then
    local BottomKeyInfo = {
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
      },
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
    self.Com_Reward:SetVisibility(ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if self.Root then
      self.Root.DeputeTab:UpdateUIStyleInPlatform(false)
    end
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
  elseif "SelfWidget" == FocusTypeName or "FocusSelfWidget" == FocusTypeName then
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
    self.Com_Reward:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Com_Reward:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      }
    })
    StyleOfPlay.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    StyleOfPlay.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.Root and self.Root.DeputeTab then
      local bIsOther = "SelfWidget" ~= FocusTypeName
      self.Root.DeputeTab:UpdateUIStyleInPlatform(true, bIsOther)
    end
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
  else
    local BottomKeyInfo = {}
    StyleOfPlay.ComTab.Left_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.Right_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if self.Root then
      self.Root.DeputeTab:UpdateUIStyleInPlatform(false)
    end
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
  end
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.In and self.IsEnter then
    if self.IsUnLocked or self.Mobile or self.IsEmpty or UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
      return
    end
    self:StopAllAnimations()
    self:PlayAnimation(self.Hover)
  end
end

return M
