require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local MonsterUtils = require("Utils.MonsterUtils")
local WalnutBagController = require("BluePrints.UI.WBP.Walnut.WalnutBag.WalnutBagController")
local WalnutBagModel = WalnutBagController:GetModel()
local TimeUtils = require("Utils.TimeUtils")
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
  Resource = 6
}
local DungeonSelectCache = {}

function M:Construct()
  M.bOpened = true
  M.Super.Construct(self)
  self.Button_Solo:SetText(GText("DUNGEONSINGLE"))
  self.Button_Multi:SetText(GText("DUNGEONMATCH"))
  self.Text_TypeSelect:SetText(GText("UI_Dungeon_Type_List"))
  self.Text_TypeSelect02:SetText(GText("UI_Armory_ShowAttribute"))
  self.Text_Warning:SetText(GText("UI_Warning_CharLevel_Low"))
  self.Button_Multi:BindEventOnClicked(self, self.OnClickMulti)
  self.Button_Solo:BindEventOnClicked(self, self.ShowDialogChar)
  self.Button_DoubleMod:BindEventOnClicked(self, self.ShowDialogChar)
  self.Stats_ListView.BP_OnEntryInitialized:Add(self, self.OnElementEntryInitialized)
  self.ScrollBox_List.OnUserScrolled:Add(self, self.OnUserScrolled)
  self.Button_Type.OnHovered:Add(self, self.OnButtonAttibuteHovered)
  self.Button_Type.OnUnhovered:Add(self, self.OnButtonAttibuteUnhovered)
  self:AddDispatcher(EventID.OnChangeActionPoint, self, self.UpdateActionPoint)
  self:AddDispatcher(EventID.TeamMatchTimingStart, self, self.TeamMatchTimingStart)
  self:AddDispatcher(EventID.TeamMatchTimingEnd, self, self.TeamMatchTimingEnd)
  self:AddDispatcher(EventID.SelectedWalnut, self, self.EnterWalnutDungeon)
  self:AddDispatcher(EventID.OnRefreshDeputeBtn, self, self.RefreshBtnState)
  self:AddDispatcher(EventID.OnDungeonsUpdate, self, self.OnDungeonsUpdate)
  self:AddDispatcher(EventID.CurrentSquadChange, self, self.OnCurrentSquadChange)
  self:AddDispatcher(EventID.FoucsDungeonSelectLevel, self, self.OnSelectCellFocus)
  self:AddDispatcher(EventID.OnDisableEscOnDungeonLoading, self, self.DisableEscOnDungeonLoading)
  self.List_Prop.OnCreateEmptyContent:Bind(self, self.CreateAndAddEmptyItem)
  self.List_Event.OnCreateEmptyContent:Bind(self, self.CreateEventAndAddEmptyItem)
  self.HB_Cost:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:AddInputMethodChangedListen()
  self.List_Prop:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.List_Prop:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.List_Prop:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.List_Prop:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.List_Monster:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.List_Monster:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.List_Monster:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.List_Monster:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.List_Event:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.List_Event:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.List_Event:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.List_Event:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.WB_EliteProp:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.WB_EliteProp:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.WB_EliteProp:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.WB_EliteProp:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.IsFocusProp = false
  self.IsFocus_Monster = false
  self.IsFocusEliteProp = false
  self.SquadId = 1
  self.MaxMonNum = 2
  self.WalnutId = nil
  self.Mobile = "Mobile" == CommonUtils.GetDeviceTypeByPlatformName(self)
  self.Gamepad = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
  self.FocusTypeName = nil
  self.PressedKeys = {}
  self.Cost:SetVisibility(ESlateVisibility.Collapsed)
  self.Group_Double:SetVisibility(ESlateVisibility.Collapsed)
  self.HB_Counsume:SetVisibility(ESlateVisibility.Collapsed)
  if self.Arrow_Up then
    self.Arrow_Up:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Arrow_Down then
    self.Arrow_Down:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Btn_Qa:Init({
    OwnerWidget = self,
    PopupID = 100241,
    ClickCallback = function()
      UIManager(self):ShowCommonPopupUI(100241)
    end
  })
  self.StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
end

function M:Destruct()
  M.Super.Destruct(self)
  M.bOpened = false
  M.SelectedDungeonId = nil
  self.Button_Multi:UnBindEventOnClickedByObj(self)
  self.Button_Solo:UnBindEventOnClickedByObj(self)
  self.Button_DoubleMod:UnBindEventOnClickedByObj(self)
end

function M:InitLevelList(DungeonList, SelectDungeonId, DeputeType, WalnutId)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "Play_DeputeDetail", nil)
  self:SetFocus()
  self.MonsterIdToItem = {}
  self.TypeTable = {}
  self.TypeTableKeys = {}
  self.HB_Type:ClearChildren()
  self.CurrentTabIdx = 1
  self.SelectCell = nil
  self.FirstEnter = true
  if not DeputeType then
    self.DeputeType = Const.DeputeType.RegularDepute
  else
    self.DeputeType = DeputeType
  end
  if WalnutId then
    self.WalnutId = WalnutId
  end
  if SelectDungeonId then
    DungeonSelectCache = {}
  end
  if not DungeonList then
    return
  end
  self.ActionPointId = DataMgr.ResourceSType2Resource.ActionPoint[1]
  local IsNightFlight = self.DeputeType == Const.DeputeType.NightFlightManualDepute
  local SubTabList = {
    {
      Text = GText("UI_DUNGEON_ObtainType"),
      Id = IsNightFlight and 1 or 2
    },
    {
      Text = GText("UI_DUNGEON_MonsterType"),
      Id = IsNightFlight and 2 or 3
    }
  }
  self.ObtainTabId = IsNightFlight and 2 or 1
  self.MonsterTabId = IsNightFlight and 3 or 2
  if IsNightFlight then
    table.insert(SubTabList, 1, {
      Text = GText("UI_Dungeon_SpecialMonster"),
      Id = 1
    })
    self.SpecialMonsterTabId = 1
  end
  self.Tab_Info:Init({
    LeftKey = "A",
    RightKey = "D",
    Tabs = SubTabList,
    ChildWidgetBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabSubItem01.WBP_Com_TabSubItem01'",
    SoundFunc = self.PlayTabSound,
    SoundFuncReceiver = self
  })
  self.Tab_Info:BindEventOnTabSelected(self, self.OnSubTabChanged)
  self.Tab_Info:SelectTab(1)
  self.ScrollBox_List:ClearChildren()
  self.ScrollBox_List:ScrollToStart()
  self.ScrollBox_List:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Wrap)
  self.ScrollBox_List:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.ScrollBox_List:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.ScrollBox_List:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.ScrollBox_List:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.WB_EliteProp:ClearChildren()
  self.WB_EliteProp:SetVisibility(ESlateVisibility.Collapsed)
  self.Bg_Consume:SetVisibility(ESlateVisibility.Collapsed)
  if self.DeputeType == Const.DeputeType.WalnutDepute then
    if not self.WalnutTypeData then
      return
    end
    self.Panel_Walnut:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.HB_WalnutCost:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Button_Solo:SetText(GText("UI_Walnut_Choice"))
    if self.WalnutTypeTextColor then
      local Text_WalnutMat = self.Text_Walnut:GetDynamicFontMaterial()
      Text_WalnutMat:SetVectorParameterValue("MainColor", self.WalnutTypeTextColor)
    end
    local Icon = LoadObject(self.WalnutTypeData.TypeIcon)
    self.Icon_Walnut:SetBrushResourceObject(Icon)
    self.Text_Walnut:SetText(GText(self.WalnutTypeData.Name))
    self.Text_WalnutCost:SetText(GText("UI_Walnut_Dungeon_Available"))
    self.Panel_WalnutTime:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_WalnutTime:SetText(GText("UI_Walnut_Dungeon_Refresh"))
    self.LeftTimeDict = WalnutBagModel:GetDungeonNextRefreshTime()
    if self:IsExistTimer("UpdateTimeContent") then
      self:RemoveTimer("UpdateTimeContent")
    end
    self:UpdateTimeCountDown()
    self:AddTimer(1.0, self.UpdateTimeCountDown, true, 0, "UpdateTimeContent", true)
  else
    self.Panel_Walnut:SetVisibility(ESlateVisibility.Collapsed)
    self.HB_WalnutCost:SetVisibility(ESlateVisibility.Collapsed)
    self.Panel_WalnutTime:SetVisibility(ESlateVisibility.Collapsed)
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if self.DeputeType == Const.DeputeType.DeputeWeekly then
    self.HB_Weekly:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Bg_Consume:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.WeeklyDungeonRewardLeft = Avatar.WeeklyDungeonRewardLeft
    self.Text_WeeklyDescNumNow:SetText(self.WeeklyDungeonRewardLeft)
    self.Text_WeeklyDescNumTotal:SetText(DataMgr.GlobalConstant.DungeonRewardRefresh.ConstantValue)
    if self.WeeklyDungeonRewardLeft > 0 then
      if self.ColorNowNormal then
        self.Text_WeeklyDescNumNow:SetColorAndOpacity(self.ColorNowNormal)
      else
        self.Text_WeeklyDescNumNow:SetColorAndOpacity(self.ColorNowEmpty)
      end
    end
    self.Text_WeeklyDescNumTitle:SetText(GText("UI_WeeklyDungeon_ChancesRemain"))
  else
    self.HB_Weekly:SetVisibility(ESlateVisibility.Collapsed)
  end
  local LatestUnlockedDungeonId
  for _, DungeonId in pairs(DungeonList) do
    if PageJumpUtils:CheckDungeonCondition(DataMgr.Dungeon[DungeonId].Condition) then
      LatestUnlockedDungeonId = DungeonId
    end
  end
  for i, DungeonId in pairs(DungeonList) do
    local Item = self:CreateWidgetNew("DungeonSelectLevel")
    Item:BindEventOnClicked(self, self.OnClickedLevelCell, Item)
    if self.DeputeType == Const.DeputeType.RegularDepute or self.DeputeType == Const.DeputeType.DeputeWeekly then
      Item:InitDungeonInfo(DungeonId, i, false, self)
    else
      Item:InitDungeonInfo(DungeonId, i, true, self)
    end
    local ShouldSelect = not SelectDungeonId and DungeonId == LatestUnlockedDungeonId or SelectDungeonId == DungeonId or DataMgr.Dungeon2SubDungeon[SelectDungeonId] == DungeonId
    if ShouldSelect then
      if PageJumpUtils:CheckDungeonCondition(DataMgr.Dungeon[DungeonId].Condition) then
        self.SelectCell = Item
        Item.Bg_List.IsSelect = true
        Item.Bg_List:PlayAnimation(Item.Bg_List.Select)
        Item:PlayAnimation(Item.Select)
        self.CurCellDungeonId = SelectDungeonId and DataMgr.Dungeon2SubDungeon[SelectDungeonId] or DungeonId
        self:InitListCellInfo(SelectDungeonId or DungeonId)
      else
        self.Panel_Detail:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
    self.ScrollBox_List:AddChild(Item)
  end
  if self.SelectCell then
    self:SelectCellFocus()
    self.ScrollBox_List:ScrollWidgetIntoView(self.SelectCell, true, EDescendantScrollDestination.Center)
  end
  self.ScrollBox_List:GetChildAt(0):SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.ScrollBox_List:GetChildAt(self.ScrollBox_List:GetChildrenCount() - 1):SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self:PlayAnimation(self.In)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:UpdateUIStyleInPlatform(false)
  end
end

function M:SetWalnutTitleMatColor(WalnutType)
  if 1 == WalnutType then
    self.WalnutTypeTextColor = self.Sx_Text_WalnutTypeTitleMatColor
  elseif 2 == WalnutType then
    self.WalnutTypeTextColor = self.Zl_Text_WalnutTypeTitleMatColor
  else
    self.WalnutTypeTextColor = self.Hl_Text_WalnutTypeTitleMatColor
  end
end

function M:UpdateTimeCountDown()
  local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(self.LeftTimeDict)
  self.Time_Refresh:SetTimeText("UI_Walnut_Dungeon_Refresh", RemainTimeDict)
end

function M:SetPanelDetails(Idx)
  self.Com_Btn_Details:UnBindEventOnClickedByObj(self)
  if Idx == self.ObtainTabId then
    self.Com_Btn_Details:BindEventOnClicked(self, self.OpenRewardDetails)
    self.Text_Details:SetText(GText("UI_CTL_Details"))
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      self.Switch_Details_Icon:SetActiveWidgetIndex(2)
      self.Key_Details_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Key_Details_GamePad:CreateCommonKey({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "Down"}
        }
      })
    else
      self.Switch_Details_Icon:SetActiveWidgetIndex(1)
      if not self.Mobile then
        self.Key_Details_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  else
    self.Com_Btn_Details:BindEventOnClicked(self, self.OpenCommanderDetails)
    self.Text_Details:SetText(GText("UI_Dungeon_More"))
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      self.Switch_Details_Icon:SetActiveWidgetIndex(2)
      self.Key_Details_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Key_Details_GamePad:CreateCommonKey({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "Down"}
        }
      })
    else
      self.Switch_Details_Icon:SetActiveWidgetIndex(0)
      if not self.Mobile then
        self.Key_Details_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  end
end

function M:OnSubTabChanged(TabWidget)
  self.CurrentTabIdx = TabWidget.Idx
  self:PlayAnimation(self.Switch_Tab)
  if TabWidget.Idx == self.ObtainTabId then
    self.List_Prop:SetVisibility(ESlateVisibility.Visible)
    self.List_Monster:SetVisibility(ESlateVisibility.Collapsed)
    self.List_Event:SetVisibility(ESlateVisibility.Collapsed)
    self:SetPanelDetailsVis(ESlateVisibility.SelfHitTestInvisible)
    self.WB_EliteProp:SetVisibility(ESlateVisibility.Collapsed)
    if self.CurrentFocusType == "List" then
      self.List_Prop:SetFocus()
      self:UpdatKeyDisplay("RewardWidget")
    end
    self.Btn_Area.OnClicked:Add(self, self.OpenIntro)
    self:SetPanelDetails(TabWidget.Idx)
  elseif TabWidget.Idx == self.MonsterTabId then
    self.List_Prop:SetVisibility(ESlateVisibility.Collapsed)
    self.List_Monster:SetVisibility(ESlateVisibility.Visible)
    self.List_Event:SetVisibility(ESlateVisibility.Collapsed)
    self:SetPanelDetailsVis(ESlateVisibility.Collapsed)
    self.WB_EliteProp:SetVisibility(ESlateVisibility.Collapsed)
    if self.CurrentFocusType == "List" then
      self.List_Monster:SetFocus()
      self:UpdatKeyDisplay("RewardWidget")
    end
  elseif self.TitleEventTabId and TabWidget.Idx == self.TitleEventTabId then
    self.List_Event:SetVisibility(ESlateVisibility.Visible)
    self.List_Prop:SetVisibility(ESlateVisibility.Collapsed)
    self.List_Monster:SetVisibility(ESlateVisibility.Collapsed)
    self:SetPanelDetailsVis(ESlateVisibility.Collapsed)
    self.WB_EliteProp:SetVisibility(ESlateVisibility.Collapsed)
    if self.CurrentFocusType == "List" then
      self.List_Event:SetFocus()
      self:UpdatKeyDisplay("EventWidget")
    end
  end
  self:SetNightFlightManualText_MoreHide(TabWidget.Idx)
end

function M:IsShowKeyMore()
  if self.CurrentTabIdx == self.SpecialMonsterTabId then
    return self.MonNum and self.MonNum > self.MaxMonNum
  end
  return self.CurrentTabIdx == self.ObtainTabId
end

function M:ItemMenuAnchorChanged(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if bIsOpen then
    self:UpdatKeyDisplay("")
  else
    self:UpdatKeyDisplay("SelfWidget")
    self:SelectCellFocus()
  end
end

function M:SetNightFlightManualText_MoreHide(Idx)
  if self.DeputeType == Const.DeputeType.NightFlightManualDepute and Idx == self.SpecialMonsterTabId then
    self:SetNightFlightManualEliteProp(self.CurSelectedDungeonId)
    if self.MonNum and self.MonNum > self.MaxMonNum then
      self:SetPanelDetails(Idx)
      self:SetPanelDetailsVis(ESlateVisibility.SelfHitTestInvisible)
      self.List_Prop:SetVisibility(ESlateVisibility.Collapsed)
      self.List_Monster:SetVisibility(ESlateVisibility.Collapsed)
    else
      self:SetPanelDetailsVis(ESlateVisibility.Collapsed)
      self.List_Prop:SetVisibility(ESlateVisibility.Collapsed)
      self.List_Monster:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.WB_EliteProp:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if self.CurrentFocusType == "List" and self.WB_EliteProp:GetChildAt(0) then
      self.WB_EliteProp:GetChildAt(0):SetFocus()
    end
  end
end

function M:SetNightFlightManualRewardView(DungeonRewardView)
  self.DungeonRewardView = DungeonRewardView
end

function M:SetNightFlightManualEliteProp(DungeonId)
  self.WB_EliteProp:ClearChildren()
  self.MonsterWeaknessIconCache = {}
  local MonIds = DataMgr.ModDungeon2Monster[DungeonId]
  if not MonIds or 0 == #MonIds then
    DebugPrint("SL No monsters found for DungeonId:", DungeonId)
    return
  end
  self.MonNum = CommonUtils.TableLength(MonIds)
  local Num = math.min(self.MonNum, 2)
  for i = 1, Num do
    local Id = MonIds[i]
    local Item = self:CreateWidgetNew("DeputeEliteInfo")
    local WeaknessIcon = self:GetMonsterWeaknessIcon(Id)
    Item:InitItemContent(Id, WeaknessIcon, self, self.DungeonRewardView)
    self.WB_EliteProp:AddChild(Item)
  end
  if self.WB_EliteProp:GetChildrenCount() <= 1 then
    local Item = self:CreateWidgetNew("DeputeEliteInfo")
    Item:InitItemContent()
    self.WB_EliteProp:AddChild(Item)
  end
  if 1 == self.WB_EliteProp:GetChildrenCount() then
    self.WB_EliteProp:GetChildAt(0):SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    self.WB_EliteProp:GetChildAt(0):SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    self.WB_EliteProp:GetChildAt(0):SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  elseif 2 == self.WB_EliteProp:GetChildrenCount() and self.WB_EliteProp:GetChildAt(1).Id then
    self.WB_EliteProp:GetChildAt(0):SetNavigationRuleExplicit(EUINavigation.Right, self.WB_EliteProp:GetChildAt(1))
    self.WB_EliteProp:GetChildAt(0):SetNavigationRuleExplicit(EUINavigation.Left, self.WB_EliteProp:GetChildAt(1))
    self.WB_EliteProp:GetChildAt(1):SetNavigationRuleExplicit(EUINavigation.Left, self.WB_EliteProp:GetChildAt(0))
    self.WB_EliteProp:GetChildAt(1):SetNavigationRuleExplicit(EUINavigation.Right, self.WB_EliteProp:GetChildAt(0))
    self.WB_EliteProp:GetChildAt(0):SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    self.WB_EliteProp:GetChildAt(1):SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  end
end

function M:GetMonsterWeaknessIcon(MonsterId)
  local MonsterWeaknessIcon = self.MonsterWeaknessIconCache or {}
  self.MonsterWeaknessIconCache = MonsterWeaknessIcon
  if MonsterWeaknessIcon[MonsterId] then
    return MonsterWeaknessIcon[MonsterId]
  end
  local AllBuffs = MonsterUtils.GetRealMonsterBuffs(self.CurSelectedDungeonId, MonsterId)
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

function M:SetWalnutType(WalnutTypeData)
  self.WalnutTypeData = WalnutTypeData
end

function M:OnClickedLevelCell(LevelCell)
  if self.SelectCell ~= nil then
    self.SelectCell:PlayAnimationReverse(self.SelectCell.Select)
    local SubCell = self.SelectCell.Bg_List
    SubCell:StopAllAnimations()
    SubCell:PlayAnimation(SubCell.Normal)
    SubCell.IsSelect = false
  end
  self.SelectCell = LevelCell
  self.TypeTable = {}
  self.TypeTableKeys = {}
  self.HB_Type:ClearChildren()
  self.LastMarkType = nil
  self.CurCellDungeonId = LevelCell.DungeonId
  self:InitListCellInfo(LevelCell.DungeonId)
end

function M:OnTypeClicked(TypeId, bDefault)
  DungeonSelectCache[self.CurCellDungeonId] = TypeId
  local DungeonAttribute = DataMgr.Dungeon[TypeId].AttributeType
  self.DungeonAttribute = DungeonAttribute
  self:SetElementIcon(DungeonAttribute)
  self:IsShowAttributeTips()
  self.TypeTable[TypeId]:OnClicked(bDefault)
  if self.LastMarkType and self.LastMarkType ~= self.TypeTable[TypeId] then
    self.LastMarkType.IsSelect = false
    self.LastMarkType:PlayAnimation(self.LastMarkType.Normal)
  end
  self.LastMarkType = self.TypeTable[TypeId]
  self.CurSelectedDungeonId = TypeId
  M.SelectedDungeonId = TypeId
  self:RefreshLevelCellContent(TypeId)
end

function M:IsShowAttributeTips()
  if not self.DungeonAttribute then
    return
  end
  local CurrentCharId = self.DefaultList.CurrentCharId
  if CurrentCharId then
    local CharAttributeType = DataMgr.BattleChar[CurrentCharId].Attribute
    if DataMgr.Attribute[CharAttributeType].CounterType ~= self.DungeonAttribute then
      for ID, Config in pairs(DataMgr.Attribute) do
        if Config.CounterType == self.DungeonAttribute then
          local TipsText = string.format(GText("UI_Squad_Elemental_Weakness"), GText("UI_Attr_" .. Config.ID .. "_Name"))
          self.Text_Warning_Attribute:SetText(TipsText)
          break
        end
      end
      self.Panel_WarningHint_Attribute:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    else
      self.Panel_WarningHint_Attribute:SetVisibility(ESlateVisibility.Collapsed)
    end
  else
    self.Panel_WarningHint_Attribute:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:InitListCellInfo(DungeonId)
  if self.SelectCell then
    self:SelectCellFocus()
  end
  local Dungeon2SubDungeon = DataMgr.Dungeon2SubDungeon
  self.CurSelectedDungeonId = DungeonId
  M.SelectedDungeonId = DungeonId
  self.HasTypeSelect = false
  self.Stats:SetRenderOpacity(0)
  self:RefreshDeputeEvent(DungeonId)
  if not self.TitleEventTabId and self.List_Event:GetNumItems() > 0 then
    local SubTabList = self.Tab_Info.Tabs
    local Id = #self.Tab_Info.Tabs + 1
    table.insert(SubTabList, Id, {
      Text = GText("UI_Dungeon_Title_Event"),
      Id = Id
    })
    self.TitleEventTabId = Id
    self.Tab_Info:UpdateTabs(SubTabList)
  end
  self.Tab_Info:SelectTab(1)
  local bSquad = DataMgr.Dungeon[self.CurSelectedDungeonId].Squad
  if bSquad then
    self.DefaultList:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local DungeonType = DataMgr.Dungeon[self.CurSelectedDungeonId].DungeonType
    local bDisablePhantom = "Rouge" == DungeonType or false
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local SquadId = Avatar.DungeonSquad[DungeonType] and Avatar.DungeonSquad[DungeonType] or 0
      self.DefaultList:Init(self, bDisablePhantom, SquadId, self.CurSelectedDungeonId)
    end
  else
    self.DefaultList:SetVisibility(ESlateVisibility.Collapsed)
  end
  if Dungeon2SubDungeon[DungeonId] then
    self.List_Type:SetVisibility(ESlateVisibility.Visible)
    self.Panel_Type:SetVisibility(ESlateVisibility.Visible)
    if not self.Mobile then
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        self.Key_Qa_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      else
        self.Key_Qa_GamePad:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
    local SubDungeonList = DataMgr.Dungeon[Dungeon2SubDungeon[DungeonId]].SubDungeonId
    local SubDungeonData = {}
    table.insert(SubDungeonData, Dungeon2SubDungeon[DungeonId])
    if not SubDungeonList then
      DebugPrint("ZDX SubDungeonList is nil")
      return
    end
    for k, v in pairs(SubDungeonList) do
      table.insert(SubDungeonData, v)
      if not DataMgr.Dungeon[v].AttributeType then
        DebugPrint("ZDX Dungeon AttributeType is nil")
      end
    end
    table.sort(SubDungeonData, function(A, B)
      local PriorityA = DataMgr.Attribute[DataMgr.Dungeon[A].AttributeType].DisplayPriority
      local PriorityB = DataMgr.Attribute[DataMgr.Dungeon[B].AttributeType].DisplayPriority
      return PriorityA < PriorityB
    end)
    for k, v in pairs(SubDungeonData) do
      local Item = self:CreateWidgetNew("DeputeTypeIcon")
      Item:InitContent(DataMgr.Dungeon[v].AttributeType)
      Item.Button_Area.OnClicked:Add(self, function()
        self:OnTypeClicked(v)
      end)
      Item.Select = true
      self.HB_Type:AddChild(Item)
      self.TypeTable[v] = Item
      table.insert(self.TypeTableKeys, v)
    end
    self:OnTypeClicked(DungeonSelectCache[self.CurSelectedDungeonId] or self.CurSelectedDungeonId, true)
    self.HasTypeSelect = true
  else
    self.List_Type:SetVisibility(ESlateVisibility.Collapsed)
    self.Panel_Type:SetVisibility(ESlateVisibility.Collapsed)
    self.Panel_WarningHint_Attribute:SetVisibility(ESlateVisibility.Collapsed)
    self:RefreshLevelCellContent(self.CurSelectedDungeonId)
  end
  local IsNightFlight = self.DeputeType == Const.DeputeType.NightFlightManualDepute
  if not IsNightFlight then
    self.Group_TimeTips:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  local CfgDrop = DataMgr.DoubleModDrop and DataMgr.DoubleModDrop[CommonConst.DoubleModDropEventID]
  if not CfgDrop then
    self.Group_TimeTips:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  local IsDoubleModDungeon, IsEliteRushDungeon = self:CheckDungeonType(DungeonId)
  if not IsDoubleModDungeon and not IsEliteRushDungeon then
    self.Group_TimeTips:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.IsDoubleMod = self:IsDoubleMod()
  if not self.IsDoubleMod then
    self.Group_TimeTips:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.Group_TimeTips:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Bg_Consume:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  local DropInfo = self:GetDoubleModDropData() or {}
  local IsElite = EMCache:Get("Is_DoubleMod_SwitchTab", true) or false
  local TitleKey = IsElite and "UI_Event_ModDrop_ChallengeRemain" or "UI_Event_ModDrop_DropRemain"
  self.Text_TimeTipsTitle:SetText(GText(TitleKey))
  local MdConst = DataMgr.ModDropConstant or {}
  local DailyFree = MdConst.DailyFreeTicketAmount and MdConst.DailyFreeTicketAmount.ConstantValue or 0
  local DailyMod = MdConst.DailyModDungeonAmount and MdConst.DailyModDungeonAmount.ConstantValue or 0
  local CfgValue = IsElite and DailyFree or DailyMod
  local UsedTimes = IsElite and (DropInfo.EliteRushTimes or 0) or DropInfo.DropTimes or 0
  local Remaining = math.max(0, math.floor(CfgValue - UsedTimes))
  local TextValue = Remaining <= 0 and "<Warning>0</>/" .. CfgValue or Remaining .. "/" .. CfgValue
  self.Text_Times:SetText(TextValue)
  self.Text_ModUpNum:SetVisibility(IsElite and UE4.ESlateVisibility.Collapsed or UE4.ESlateVisibility.SelfHitTestInvisible)
  if not IsElite then
    local BonusConst = MdConst.EventBonus and MdConst.EventBonus.ConstantValue or 0
    local BonusPct = math.floor(BonusConst / 100)
    self.Text_ModUpNum:SetText("+" .. BonusPct .. "%")
  end
end

function M:RefreshLevelCellContent(DungeonId)
  if not DungeonId then
    DebugPrint("ZDX DungeonId is nil")
    return
  end
  local DungeonData = DataMgr.Dungeon[DungeonId]
  self.List_Prop:ClearListItems()
  self.List_Monster:ClearListItems()
  self.Title_Level:SetText(GText(DungeonData.DungeonName))
  self.Text_Summary:SetText(GText(DungeonData.DungeonDes))
  self.Text_Description:SetText(GText(DungeonData.DungeonContent))
  self.Btn_Check.Btn_Click.OnClicked:Add(self, self.OpenDetails)
  self.Btn_Detail:SetVisibility(ESlateVisibility.Collapsed)
  if DungeonData.AttributeType then
    self.Type:SetVisibility(ESlateVisibility.Visible)
    self.Icon_Type:SetBrushResourceObject(LoadObject(DataMgr.Attribute[DungeonData.AttributeType].Icon))
  else
    self.Type:SetVisibility(ESlateVisibility.Collapsed)
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self:PlayAnimation(self.Switch_Type)
  self:RefreshMonsterInfoList(DungeonId)
  self:RefreshRewardInfoList(DungeonId)
  self:RefreshBtnState()
  if self.DeputeType == Const.DeputeType.NightFlightManualDepute and self.CurrentTabIdx == self.SpecialMonsterTabId then
    self:SetNightFlightManualEliteProp(DungeonId)
  end
  self:SetNightFlightManualText_MoreHide(self.CurrentTabIdx)
  self.Btn_Qa.Btn_Click.OnClicked:Add(self, self.OpenIntro)
  self.Panel_WarningHint:SetVisibility(ESlateVisibility.Collapsed)
  if self.DefaultList.CurrentCharLevel <= DataMgr.Dungeon[self.CurSelectedDungeonId].DungeonLevel - DataMgr.GlobalConstant.TaskWarningLevel.ConstantValue then
    self.Panel_WarningHint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  local DungeonUIBG = DungeonData and DungeonData.DungeonUIBG or Const.DungeonBgBluePrint
  if self.DungeonUIBG and self.DungeonUIBG == DungeonUIBG then
    return
  end
  self.DungeonUIBG = DungeonUIBG
  local Item = UIManager(self):CreateWidget(DungeonUIBG)
  if self.DeputeType == Const.DeputeType.RegularDepute then
    self.Panel_Bg:ClearChildren()
  else
    local ChildrenCount = self.Panel_Bg:GetChildrenCount()
    if ChildrenCount >= 2 then
      self.Panel_Bg:RemoveChildAt(0)
    end
    local OldItem = ChildrenCount > 0 and self.Panel_Bg:GetChildAt(0) or nil
    if OldItem then
      self:AddDelayFrameFunc(function()
        if OldItem and OldItem:IsValid() then
          self.Panel_Bg:RemoveChild(OldItem)
        end
      end, 8, "RemoveOldDungeonBG")
    end
  end
  if Item then
    self.Panel_Bg:AddChild(Item)
    if Item.Loop then
      Item:PlayAnimation(Item.Loop, 0, 0)
    end
    Item.Slot:SetHorizontalAlignment(EHorizontalAlignment.HAlign_Fill)
    Item.Slot:SetVerticalAlignment(EVerticalAlignment.VAlign_Fill)
    if Item.In then
      if self.DeputeType == Const.DeputeType.RegularDepute and self.FirstEnter then
        Item:PlayAnimation(Item.In)
      elseif self.DeputeType ~= Const.DeputeType.RegularDepute then
        Item:PlayAnimation(Item.In)
      end
    end
    if self.DeputeType == Const.DeputeType.RegularDepute then
      self.FirstEnter = false
    end
  else
    DebugPrint("SL DungeonUIBG Create Failed")
  end
end

function M:CheckDungeonType(DungeonId)
  local CfgDrop = DataMgr.DoubleModDrop and DataMgr.DoubleModDrop[CommonConst.DoubleModDropEventID]
  if not DungeonId or not CfgDrop then
    return false, false
  end
  local DungeonIds = CfgDrop.ModDungeonId or {}
  local EliteRushDungeonIds = CfgDrop.EliteRushDungeonId or {}
  local IsDoubleModDungeon = false
  for _, V in pairs(DungeonIds) do
    if DungeonId == V then
      IsDoubleModDungeon = true
      break
    end
  end
  local IsEliteRushDungeon = false
  if not IsDoubleModDungeon then
    for _, V in pairs(EliteRushDungeonIds) do
      if DungeonId == V then
        IsEliteRushDungeon = true
        break
      end
    end
  end
  return IsDoubleModDungeon, IsEliteRushDungeon
end

function M:OpenRewardDetails()
  AudioManager(self):PlayUISound(self, "event:/ui/common/tip_show_click", nil, nil)
  local Params = {}
  Params.RewardList = self.RewardList
  
  function Params.CloseBtnCallbackFunction()
    self:SelectCellFocus()
  end
  
  Params.AutoFocus = true
  Params.Checked = self.Com_CheckBox_LeftText:IsChecked()
  local UI = UIManager(self):ShowCommonPopupUI(100156, Params)
end

function M:OpenCommanderDetails()
  local Params = {}
  Params.DungeonId = self.CurSelectedDungeonId
  Params.Parent = self
  Params.AutoFocus = true
  local UI = UIManager(self):ShowCommonPopupUI(100155, Params)
end

function M:RefreshRewardInfoList(DungeonId)
  assert(DataMgr.Dungeon[DungeonId], "\229\137\175\230\156\172\228\191\161\230\129\175\228\184\141\229\173\152\229\156\168:" .. DungeonId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local FirstRewardList
  if not Avatar.Dungeons[DungeonId] or not Avatar.Dungeons[DungeonId].IsPass then
    local RewardInfo = DataMgr.Reward[DataMgr.Dungeon[DungeonId].FirstCompleteReward]
    if RewardInfo then
      FirstRewardList = {}
      local RewardIds = RewardInfo.Id or {}
      local RewardCounts = RewardInfo.Count or {}
      local RewardTypes = RewardInfo.Type or {}
      for i = 1, #RewardIds do
        local ItemId = RewardIds[i]
        local Count = RewardUtils:GetCount(RewardCounts[i])
        local Icon = ItemUtils.GetItemIcon(ItemId, RewardTypes[i])
        local Rarity = ItemUtils.GetItemRarity(ItemId, RewardTypes[i])
        local ItemType = RewardTypes[i]
        local RewardContent = {
          Id = ItemId,
          Type = ItemType,
          ItemCount = Count,
          Icon = Icon,
          Rarity = Rarity,
          bFirst = true,
          DropType = "FirstReward"
        }
        table.insert(FirstRewardList, RewardContent)
      end
    end
  end
  local RewardList = RewardUtils:GetRewardViewInfoById(DataMgr.Dungeon[DungeonId].DungeonRewardView)
  
  local function SortFunc(A, B)
    if A.Rarity == B.Rarity then
      if TypeSort[A.Type] and TypeSort[B.Type] then
        if TypeSort[A.Type] == TypeSort[B.Type] then
          return A.Id < B.Id
        end
        return TypeSort[A.Type] < TypeSort[B.Type]
      end
      return A.Id < B.Id
    end
    return A.Rarity > B.Rarity
  end
  
  if FirstRewardList then
    table.sort(FirstRewardList, SortFunc)
  end
  table.sort(RewardList, SortFunc)
  self.RewardList = {}
  if FirstRewardList then
    for _, v in ipairs(FirstRewardList) do
      table.insert(self.RewardList, v)
    end
  end
  for _, v in ipairs(RewardList) do
    table.insert(self.RewardList, v)
  end
  local CheckBoxIsChecked = self.Com_CheckBox_LeftText:IsChecked()
  for _, ItemData in ipairs(self.RewardList) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = ItemData.Id
    Content.Icon = ItemUtils.GetItemIconPath(ItemData.Id, ItemData.Type)
    Content.ParentWidget = self
    Content.ItemType = ItemData.Type
    Content.Rarity = ItemData.Rarity or 1
    Content.IsShowDetails = true
    Content.UIName = "DeputeDetail"
    if ItemData.bFirst then
      Content.BonusType = 2
    end
    local BaseCount = ItemData.ItemCount or nil
    if ItemData.Quantity then
      if #ItemData.Quantity > 1 then
        Content.MaxCount = ItemData.Quantity[2]
      end
      BaseCount = ItemData.Quantity[1] or nil
    end
    if BaseCount then
      if CheckBoxIsChecked and not ItemData.bFirst then
        Content.Count = BaseCount * 2
      else
        Content.Count = BaseCount
      end
    end
    self.List_Prop:AddItem(Content)
  end
  if self:IsExistTimer(self.NextFrameListEmpty) then
    self:RemoveTimer(self.NextFrameListEmpty)
  end
  self.NextFrameListEmpty = self:AddTimer(0.01, function()
    local len = self.List_Prop:GetNumItems()
    for i = 1, len do
      local entryWidget = UE4.URuntimeCommonFunctionLibrary.GetEntryWidgetFromItem(self.List_Prop, i - 1)
      if entryWidget then
        entryWidget:BindEvents(self, {
          OnMenuOpenChanged = self.OnStuffMenuOpenChanged
        })
      end
    end
    local RewardItemUIs = self.List_Prop:GetDisplayedEntryWidgets()
    self.List_Prop:RequestFillEmptyContent()
  end, false, 0, "DeputeDetailListView")
end

function M:CreateEventAndAddEmptyItem()
  local Content = NewObject(UIUtils.GetCommonItemContentClass())
  Content.IsEmpty = true
  return Content
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
  self.MenuOpen = bIsOpen
  if bIsOpen then
    self.Button_Multi:SetPCVisibility(true)
    self.Button_Solo:SetPCVisibility(true)
    self.Button_DoubleMod:SetPCVisibility(true)
    self:UpdatKeyDisplay("")
    self.Switch_Details_Icon:SetActiveWidgetIndex(self.CurrentTabIdx == self.ObtainTabId and 0 or 1)
  else
    self.Button_Multi:SetPCVisibility(false)
    self.Button_Solo:SetPCVisibility(false)
    self.Button_DoubleMod:SetPCVisibility(true)
    self:UpdatKeyDisplay("RewardWidget")
    self.List_Prop:SetFocus()
    self.Switch_Details_Icon:SetActiveWidgetIndex(2)
  end
end

function M:RefreshDeputeEvent(DungeonId)
  local uniqueEventTypeSet = {}
  for _, EventData in pairs(DataMgr.DungeonRandomEvent) do
    for _, Id in ipairs(EventData.Dungeons) do
      if Id == DungeonId then
        uniqueEventTypeSet[EventData.EventType] = true
        break
      end
    end
  end
  local UniqueEventTypeList = {}
  for EventType, _ in pairs(uniqueEventTypeSet) do
    table.insert(UniqueEventTypeList, EventType)
  end
  self.List_Event:ClearListItems()
  for Index = 1, #UniqueEventTypeList do
    local eventType = UniqueEventTypeList[Index]
    local Icon = DataMgr.DungeonRandomEventType[eventType] and DataMgr.DungeonRandomEventType[eventType].Icon
    local Des = DataMgr.DungeonRandomEventType[eventType] and DataMgr.DungeonRandomEventType[eventType].Des
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Id = Index
    Content.Icon = Icon
    Content.Des = Des
    self.List_Event:AddItem(Content)
  end
  if self:IsExistTimer(self.NextEventFrameListEmpty) then
    self:RemoveTimer(self.NextEventFrameListEmpty)
  end
  self.NextEventFrameListEmpty = self:AddTimer(0.01, function()
    self.List_Event:RequestFillEmptyContent()
  end, false, 0, "List_EventDeputeDetailListView")
end

function M:OnClickedCell(LvCell)
  if self.SelectLvTabCell ~= nil then
    self.SelectLvTabCell:OnCellUnSelect()
  end
  self.SelectLvTabCell = LvCell
  LvCell:SelectCell()
end

function M:RefreshMonsterInfoList(DungeonId)
  local DungeonInfo = DataMgr.Dungeon[DungeonId]
  if not (DungeonInfo and DungeonInfo.DungeonMonsters) or 0 == #DungeonInfo.DungeonMonsters then
    DebugPrint("ZDX DungeonMonster is nil")
    return
  end
  local DisplayMonsters = CommonUtils.DeepCopy(DungeonInfo.DungeonMonsters)
  table.sort(DisplayMonsters, MonsterUtils.CompareMonsters)
  self.MonsterWeaknessIcon = {}
  self:InitMonsterWeakness(DungeonId)
  for _, MonsterId in ipairs(DisplayMonsters) do
    local MonsterData = DataMgr.Monster[MonsterId]
    if MonsterData and not MonsterData.IsNotRelease then
      local Content = NewObject(self.MonsterItemContentClass)
      Content.ParentWidget = self
      Content.MonsterId = MonsterId
      Content.DisableSelect = true
      Content.SoundEvent = "event:/ui/common/click_mid"
      Content.WeaknessIcon = self.MonsterWeaknessIcon[MonsterId]
      self.List_Monster:AddItem(Content)
    end
  end
end

function M:InitMonsterWeakness(DungeonId)
  assert(DungeonId, "dungeon id is nil")
  local DungeonInfo = DataMgr.Dungeon[DungeonId]
  assert(DungeonInfo, string.format("dungeon id [%d] is wrong, cant find dungeonInfo", DungeonId))
  local MonsterBuff = DungeonInfo.MonsterBuff
  local Monsters = DungeonInfo.DungeonMonsters
  if MonsterBuff then
    for _, MonsterId in ipairs(Monsters) do
      if type(MonsterId) == "number" then
        local AllBuffs = MonsterUtils.GetRealMonsterBuffs(DungeonId, MonsterId)
        for _, BuffId in ipairs(AllBuffs) do
          local BuffInfo = DataMgr.Buff[BuffId]
          if BuffInfo and BuffInfo.WeaknessType then
            local HasWeakness = not not BuffInfo.WeaknessType
            if HasWeakness then
              local WeaknessIcon = DataMgr.DamageType[BuffInfo.WeaknessType].WeaknessIcon
              if WeaknessIcon then
                self.MonsterWeaknessIcon[MonsterId] = self.MonsterWeaknessIcon[MonsterId] or {}
                self.MonsterWeaknessIcon[MonsterId][WeaknessIcon] = true
              end
            end
          end
        end
      end
    end
  end
end

function M:ShowDialogChar()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local bIsInTeam = Avatar:IsInTeam()
  if not bIsInTeam and Avatar.Chars[Avatar.CurrentChar] and Avatar.Chars[Avatar.CurrentChar].CharId == 3201 and DataMgr.Dungeon[self.CurSelectedDungeonId].DungeonType == "Hijack" then
    local Param = {
      RightCallbackObj = self,
      RightCallbackFunction = self.OnClickSolo
    }
    UIManager(self):ShowCommonPopupUI(100106, Param, self)
  elseif self.DeputeType == Const.DeputeType.DeputeWeekly and self.WeeklyDungeonRewardLeft <= 0 then
    local IsDeputeWeeklyNum = EMCache:Get("Is_DeputeWeeklyNum", true) or false
    local IsNoMorePrompts = self:CheckNeedShowWindow()
    if IsDeputeWeeklyNum and IsNoMorePrompts then
      self:OnClickSolo()
    else
      self:ShowConfirmWindow(true)
    end
  else
    if self.DeputeType == Const.DeputeType.DeputeWeekly then
      local Dungeon = Avatar.Dungeons[self.CurSelectedDungeonId]
      local bPassCount = Dungeon and 1 == Dungeon.PassCount or false
      if not bPassCount then
        self:ShowFirstDeputeWeeklyConfirmWindow(true)
      else
        self:OnClickSolo()
      end
      return
    end
    self:OnClickSolo()
  end
end

function M:ShowFirstDeputeWeeklyConfirmWindow(bIsSolo)
  local CommonDialogParams = {}
  
  function CommonDialogParams.RightCallbackFunction(_, Data)
    if bIsSolo then
      self:OnClickSolo()
    else
      self:TryEnterMultiDungeon()
    end
  end
  
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:ShowCommonPopupUI(100238, CommonDialogParams, self)
end

function M:ShowConfirmWindow(bIsSolo)
  local CommonDialogParams = {}
  
  function CommonDialogParams.RightCallbackFunction(_, Data)
    if bIsSolo then
      self:OnClickSolo()
    else
      self:TryEnterMultiDungeon()
    end
    self:UpdateSelectedInfo(Data)
  end
  
  function CommonDialogParams.LeftCallbackFunction(_, Data)
    self:UpdateSelectedInfo(Data)
  end
  
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:ShowCommonPopupUI(100211, CommonDialogParams, self)
end

function M:UpdateSelectedInfo(Data)
  local IsSelected = Data.SelectHint.IsSelected
  local CurTimestamp = TimeUtils.NowTime()
  EMCache:Set("Is_DeputeWeeklyNum", IsSelected, true)
  EMCache:Set("IsWeeklyDungeonTimestamp", CurTimestamp, true)
end

function M:CheckNeedShowWindow()
  local IsNoMorePrompts = false
  if TimeUtils then
    local CachedTimestamp = EMCache:Get("IsWeeklyDungeonTimestamp", true)
    IsNoMorePrompts = TimeUtils.IsTimestampInCurrentWeek(CachedTimestamp)
  end
  return IsNoMorePrompts
end

function M:OnClickSolo()
  self.IsSoloStart = true
  self.MultiWalnut = false
  self.MultiTicket = false
  if not self.CurSelectedDungeonId then
    DebugPrint("ZDX CurSelectedDungeonId is nil")
    return
  end
  if not PageJumpUtils:CheckDungeonCondition(DataMgr.Dungeon[self.CurSelectedDungeonId].Condition) then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Tosat_Level_Locked"))
    return
  end
  if self:IsAnimationPlaying(self.Out_Loading) then
    return
  end
  local DungeonData = DataMgr.Dungeon[self.CurSelectedDungeonId]
  if DungeonData.TicketId and 0 ~= #DungeonData.TicketId or DungeonData.NoTicketEnter then
    local Avatar = GWorld:GetAvatar()
    if not Avatar then
      return
    end
    local bIsInTeam = Avatar:IsInTeam()
    if not bIsInTeam then
      self:OpenTicketDialog(self.CurSelectedDungeonId)
      return
    end
  end
  if self.DungeonCost and self.MyActionPoint < self.DungeonCost then
    UIUtils.ShowActionRecover(self)
    return
  end
  local Avatar = GWorld:GetAvatar()
  local bIsInTeam = Avatar:IsInTeam()
  if bIsInTeam then
    self.IsSoloStart = false
    TeamController:GetModel().bPressedSolo = true
    if self.WalnutId then
      TeamController:GetModel().WalnutId = self.WalnutId
    end
    self:TryEnterDungeon(Avatar, self.CurSelectedDungeonId, CommonConst.DungeonNetMode.Standalone, function(RetCode, ...)
      local bCanEnter = self.HandleEnterDungeonRetCode(RetCode, ...)
      if bCanEnter then
        UIManager(self):LoadUINew("DungeonMatchTimingBar", self.CurSelectedDungeonId, Const.DUNGEON_MATCH_BAR_STATE.SPONSOR_WAITING_CONFIRM, false)
      end
    end)
    self:RefreshBtnState()
  else
    if DungeonData.IsWalnutDungeon then
      local WalnutChoiceUI = UIManager(self):LoadUINew("WalnutChoice", CommonConst.WalnutUser.Depute, self.CurSelectedDungeonId)
      if self.WalnutId then
        WalnutChoiceUI:SelectWalnutById(self.WalnutId)
      end
      return
    end
    self:EnterStandalone()
  end
end

function M:OnClickMulti()
  self.IsSoloStart = false
  self.MultiWalnut = false
  self.MultiTicket = false
  if not self.CurSelectedDungeonId then
    DebugPrint("ZDX CurSelectedDungeonId is nil")
    return
  end
  local Avatar = GWorld:GetAvatar()
  assert(Avatar, "NO AVATAR")
  if self.DeputeType == Const.DeputeType.DeputeWeekly and self.WeeklyDungeonRewardLeft <= 0 then
    local IsDeputeWeeklyNum = EMCache:Get("Is_DeputeWeeklyNum", true) or false
    local IsNoMorePrompts = self:CheckNeedShowWindow()
    if IsDeputeWeeklyNum and IsNoMorePrompts then
      self:TryEnterMultiDungeon()
      return
    else
      self:ShowConfirmWindow(false)
      return
    end
  elseif self.DeputeType == Const.DeputeType.DeputeWeekly then
    local Dungeon = Avatar.Dungeons[self.CurSelectedDungeonId]
    local bPassCount = Dungeon and 1 == Dungeon.PassCount or false
    if not bPassCount then
      self:ShowFirstDeputeWeeklyConfirmWindow(false)
    else
      self:TryEnterMultiDungeon()
    end
    return
  end
  local DungeonData = DataMgr.Dungeon[self.CurSelectedDungeonId]
  if DungeonData.TicketId and 0 ~= #DungeonData.TicketId or DungeonData.NoTicketEnter then
    local bIsInTeam = Avatar:IsInTeam()
    if not bIsInTeam then
      self.MultiTicket = true
      self:OpenTicketDialog(self.CurSelectedDungeonId)
      return
    end
  end
  if not Avatar:CheckUIUnlocked("Match") then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText(DataMgr.UIUnlockRule.Match.UIUnlockDesc))
    return
  end
  if not PageJumpUtils:CheckDungeonCondition(DataMgr.Dungeon[self.CurSelectedDungeonId].Condition) then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Tosat_Level_Locked"))
    return
  end
  if self:IsAnimationPlaying(self.Out_Loading) then
    return
  end
  if self.DungeonCost and self.MyActionPoint < self.DungeonCost then
    UIUtils.ShowActionRecover(self)
    return
  end
  local DungeonData = DataMgr.Dungeon[self.CurSelectedDungeonId]
  local bIsInTeam = Avatar:IsInTeam()
  if not bIsInTeam and DungeonData.IsWalnutDungeon then
    self.MultiWalnut = true
    local WalnutChoiceUI = UIManager(self):LoadUINew("WalnutChoice", CommonConst.WalnutUser.Depute, self.CurSelectedDungeonId)
    if self.WalnutId then
      WalnutChoiceUI:SelectWalnutById(self.WalnutId)
    end
    return
  end
  self:TryEnterMultiDungeon()
end

function M:TryEnterMultiDungeon()
  TeamController:GetModel().bPressedMulti = true
  local Avatar = GWorld:GetAvatar()
  assert(Avatar, "NO AVATAR")
  self:TryEnterDungeon(Avatar, self.CurSelectedDungeonId, CommonConst.DungeonNetMode.DedicatedServer, function(RetCode, ...)
    local bCanEnter = self.HandleEnterDungeonRetCode(RetCode, ...)
    DebugPrint("gmy@WBP_Play_DeputeDetail_C M:OnClickMulti", bCanEnter)
    if bCanEnter then
      local bIsInTeam = Avatar:IsInTeam()
      if bIsInTeam then
        UIManager(self):LoadUINew("DungeonMatchTimingBar", self.CurSelectedDungeonId, Const.DUNGEON_MATCH_BAR_STATE.SPONSOR_WAITING_CONFIRM, true)
      else
        UIManager(self):LoadUINew("DungeonMatchTimingBar", self.CurSelectedDungeonId, Const.DUNGEON_MATCH_BAR_STATE.WAITING_MATCHING_WITH_CANCEL, true)
      end
    end
  end, self.TicketId)
  self:RefreshBtnState()
end

function M:EnterWalnutDungeon()
  if self.IsSoloStart then
    self:EnterStandalone()
  end
  if self.MultiWalnut then
    self:TryEnterMultiDungeon()
  end
end

function M:EnterTicketDungeon(TicketId)
  if self.IsSoloStart then
    self:EnterStandalone(TicketId)
  end
  if self.MultiTicket then
    if -1 ~= TicketId then
      self.TicketId = TicketId
    end
    self:TryEnterMultiDungeon()
  end
end

function M:EnterStandalone(TicketId)
  if self.DungeonCost and self.MyActionPoint < self.DungeonCost then
    UIUtils.ShowActionRecover(self)
    return
  end
  local Avatar = GWorld:GetAvatar()
  if -1 ~= TicketId then
    self.TicketId = TicketId
  end
  local StyleOfPlay = UIManager(self):GetUI("StyleOfPlay")
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_click_enter_level", nil, nil)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self:TryEnterDungeon(Avatar, self.CurSelectedDungeonId, CommonConst.DungeonNetMode.Standalone, function(RetCode, ...)
      local bRetCode = self.HandleEnterDungeonRetCode(RetCode, ...)
      if not bRetCode then
        local StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
        if StyleOfPlay then
          StyleOfPlay:PlayAnimation(StyleOfPlay.In)
        end
        self:PlayAnimation(self.In)
      end
    end, self.TicketId)
  else
    WorldTravelSubsystem(self):ChangeDungeonByDungeonId(self.CurSelectedDungeonId, CommonConst.DungeonNetMode.Standalone)
  end
end

function M:OnBtnCheckClicked()
  if not self:IsAnimationPlaying(self.Out) then
    UIManager(self):LoadUINew("MonsterDetailInfo", self.CurSelectedDungeonId, self)
  end
end

function M:SelectMonsterInfoItem(MonsterId)
  UIManager(self):LoadUINew("MonsterDetailInfo", self.CurSelectedDungeonId, self, MonsterId)
end

function M:SetElementIcon(ElementType)
  if ElementType then
    self.Type:SetVisibility(ESlateVisibility.Visible)
  else
    self.Type:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  local IconPath = DataMgr.Attribute[ElementType].Icon
  local Icon = LoadObject(IconPath)
  self.Icon_Type:SetBrushResourceObject(Icon)
  self.Stats_ListView:ClearListItems()
  local ElmtTypes, ElmtNames = UIUtils.GetAllElementTypes()
  for idx, Type in ipairs(ElmtTypes) do
    self.Stats_ListView:AddItem(self:NewElmtIconContent(Type, ElmtNames[idx], Type == ElementType))
  end
end

function M:NewElmtIconContent(ElmtType, ElmtName, IsSelected)
  local Obj = NewObject(self.AttributeContentClass)
  local IconPath = DataMgr.Attribute[ElmtType].Icon
  Obj.Icon = LoadObject(IconPath)
  Obj.Text = GText(ElmtName)
  Obj.IsSelected = IsSelected
  return Obj
end

function M:OnElementEntryInitialized(Content, Widget)
  if Content.IsSelected then
    Widget.Bg_On:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    Widget.Bg_On:SetVisibility(ESlateVisibility.Collapsed)
  end
  Widget.Image_Attribute:SetBrushResourceObject(Content.Icon)
  Widget.Stats_Name:SetText(Content.Text)
end

function M:OnButtonAttibuteHovered()
  self.IsOpenAttibute = true
  self:StopAnimation(self.Tips_In)
  self:PlayAnimation(self.Tips_In)
end

function M:OnButtonAttibuteUnhovered()
  self.IsOpenAttibute = false
  self:StopAnimation(self.Tips_In)
  self:PlayAnimationReverse(self.Tips_In)
end

function M:OnUserScrolled()
  if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" then
    return
  end
  UIUtils.UpdateScrollBoxArrow(self.ScrollBox_List, self.List_ArrowTop, self.List_ArrowBottom)
end

function M:OpenDetails()
  UIManager(self):LoadUINew("ItemInformation", {
    Name = DataMgr.Dungeon[self.CurSelectedDungeonId].DungeonName,
    Desc = DataMgr.Dungeon[self.CurSelectedDungeonId].DungeonContent
  }, "LevelDatail")
end

function M:OnReturnKeyDown()
  AudioManager(self):SetEventSoundParam(self, "Play_DeputeDetail", {ToEnd = 1})
  if not self:IsAnimationPlaying(self.Out) then
    self:SetVisibility(ESlateVisibility.HitTestInvisible)
    self:PlayAnimation(self.Out)
  end
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    self:RemoveFromParent()
    local PlayEntry = UIManager(self):GetUIObj("StyleOfPlay")
    PlayEntry.SubUI[PlayEntry.CurTabId] = nil
    if self.IsFromJump then
      if PlayEntry.IsHome then
        PlayEntry:SwitchCamera()
        PlayEntry:PlayNPCAnim(21000502)
      else
        UIManager(self):SwitchUINpcCamera(false, "StyleOfPlay", PlayEntry.NpcId, {
          bDestroyNpc = true,
          IsHaveInOutAnim = PlayEntry.IsNeedPlayNpcAnim
        })
      end
      PlayEntry:OnReturnKeyDown()
    else
      PlayEntry:OpenSubUI("NewDeputeRoot")
    end
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  local ActiveWidgetIndex = IsUseKeyAndMouse and 0 or 1
  if not IsUseKeyAndMouse and (self:HasFocusedDescendants() or self:HasAnyUserFocus()) then
    local isInvisible = self.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible
    local isNotShown = not self.DefaultList.IsShow
    if isInvisible and isNotShown or not isInvisible then
      self:SelectCellFocus()
    end
  elseif self.Image_Select and self.Image_Select:GetRenderOpacity() > 0 then
    self:PlayAnimation(self.UnHover)
  end
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

function M:UpdatKeyDisplay(FocusTypeName)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  local StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
  if not StyleOfPlay then
    return
  end
  if self.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and self.DefaultList.IsShow then
    return
  end
  self.FocusTypeName = FocusTypeName
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
            ClickCallback = self.OnReturnKeyDown,
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
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
    self:UpdateUIStyleInPlatform(true)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Tab_Info:UpdateUIStyleInPlatform(true)
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      self.Button_Multi:SetPCVisibility(true)
      self.Button_Solo:SetPCVisibility(true)
      self.Button_DoubleMod:SetPCVisibility(true)
    end
    self.DefaultList:ApplyPcUiLayout()
  elseif "SelfWidget" == FocusTypeName then
    local BottomKeyInfo = {}
    if self.Panel_Type:GetVisibility() == ESlateVisibility.Visible then
      BottomKeyInfo = {
        {
          GamePadInfoList = {
            {Type = "Add"},
            GamePadSubKeyInfoList = {
              {
                Type = "Img",
                ImgShortPath = "Up",
                Owner = self
              },
              {
                Type = "Img",
                ImgShortPath = "X",
                Owner = self
              }
            }
          },
          Desc = GText("UI_CTL_CheckProperty"),
          bLongPress = false
        },
        {
          GamePadInfoList = {
            {Type = "Add"},
            GamePadSubKeyInfoList = {
              {
                Type = "Img",
                ImgShortPath = "Up",
                Owner = self
              },
              {
                Type = "Img",
                ImgShortPath = "Y",
                Owner = self
              }
            }
          },
          Desc = GText("UI_CTL_DeputeInfo"),
          bLongPress = false
        }
      }
    else
      BottomKeyInfo = {
        {
          GamePadInfoList = {
            {Type = "Add"},
            GamePadSubKeyInfoList = {
              {
                Type = "Img",
                ImgShortPath = "Up",
                Owner = self
              },
              {
                Type = "Img",
                ImgShortPath = "Y",
                Owner = self
              }
            }
          },
          Desc = GText("UI_CTL_DeputeInfo"),
          bLongPress = false
        }
      }
    end
    table.insert(BottomKeyInfo, {
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
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    })
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      self:UpdateUIStyleInPlatform(false)
      StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Tab_Info:UpdateUIStyleInPlatform(true)
      self.Button_Multi:SetPCVisibility(false)
      self.Button_Solo:SetPCVisibility(false)
      self.Button_DoubleMod:SetPCVisibility(false)
      self.IsFocusProp = false
      self.IsFocus_Monster = false
      self.IsFocusEliteProp = false
      self.DefaultList:InitWidgetInfoInGamePad()
    end
  elseif "EventWidget" == FocusTypeName then
    local BottomKeyInfo = {
      {
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
    }
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
    self:UpdateUIStyleInPlatform(true)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif "EliteProp" == FocusTypeName then
    local BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "LS",
            Owner = self
          }
        },
        Desc = GText("UI_Controller_CheckReward"),
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
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
    self:UpdateUIStyleInPlatform(true)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif "MenuAnchor" == FocusTypeName then
    local BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_CloseTips"),
        bLongPress = false
      }
    }
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
    self:UpdateUIStyleInPlatform(true)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    local BottomKeyInfo = {}
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
    self:UpdateUIStyleInPlatform(true)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.KeyImg_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    StyleOfPlay.ComTab.WBP_Com_Tab_ResourceBar.Tip_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Tab_Info:UpdateUIStyleInPlatform(false)
  end
end

function M:SetPanelDetailsVis(SlateVisibility)
  self.Panel_Details:SetVisibility(SlateVisibility)
end

function M:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if IsUseKeyAndMouse then
    self.Key_Check_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    self.Com_Key_More:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Key_Qa_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    self.Com_CheckBox_LeftText.Com_KeyImg:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_LT:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_LR:SetVisibility(ESlateVisibility.Collapsed)
    self.Btn_Qa:SetVisibility(ESlateVisibility.Visible)
    self:SetPanelDetailsVis(self:IsShowKeyMore() and ESlateVisibility.SelfHitTestInvisible or ESlateVisibility.Collapsed)
    if self.List_Type:GetVisibility() == ESlateVisibility.Visible then
      self.Key_Qa_GamePad:SetVisibility(ESlateVisibility.Collapsed)
    end
  else
    if self.List_Type:GetVisibility() == ESlateVisibility.Visible then
      self.Btn_Qa:SetVisibility(ESlateVisibility.Collapsed)
      self.Key_Qa_GamePad:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Key_Qa_GamePad:CreateCommonKey({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "Up"},
          {Type = "Img", ImgShortPath = "B"}
        },
        Type = "Add"
      })
    end
    self:SetPanelDetailsVis(self:IsShowKeyMore() and ESlateVisibility.SelfHitTestInvisible or ESlateVisibility.Collapsed)
    self.Key_LT:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Key_LT:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LB"}
      }
    })
    self.Key_LR:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Key_LR:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RB"}
      }
    })
    self.Com_Key_More:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Com_Key_More:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      },
      bLongPress = false,
      Desc = GText("UI_Controller_Check")
    })
  end
  self:SetPanelDetails(self.CurrentTabIdx)
end

function M:HandleKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    if self.DisableEsc and self.DisableEsc == true then
      return IsEventHandled
    end
    if self.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and self.DefaultList.IsShow then
      self.DefaultList:OnCloseSquadGamepad()
    else
      self:OnReturnKeyDown()
    end
  elseif "A" == InKeyName then
    if self.Tab_Info then
      self.Tab_Info:TabToLeft()
      IsEventHandled = true
    end
  elseif "D" == InKeyName and self.Tab_Info then
    self.Tab_Info:TabToRight()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:OnGamePadDown(InKeyName)
  DebugPrint("SL OnGamePadDown is InKeyName Detail", InKeyName)
  local IsEventHandled = false
  self.PressedKeys[InKeyName] = true
  local IsDpadUp = true == self.PressedKeys[Const.GamepadDPadUp]
  if "Gamepad_FaceButton_Right" == InKeyName then
    self.PressedKeys.Gamepad_DPad_Up = nil
    self.PressedKeys.Gamepad_FaceButton_Right = nil
    self.Image_Select:SetRenderOpacity(0)
    if self.Image_Select:GetRenderOpacity() > 0 then
      self:PlayAnimation(self.UnHover)
    end
    if IsDpadUp then
      UIManager(self):ShowCommonPopupUI(100241)
      return true
    end
    if self.SelectCell then
      local btnArea = self.SelectCell.Bg_List and self.SelectCell.Bg_List.Button_Area
      if btnArea and not btnArea:HasAnyUserFocus() then
        self:SelectCellFocus()
        IsEventHandled = true
      else
        if self.IsOpenAttibute then
          self:OnButtonAttibuteUnhovered()
        else
          self:OnReturnKeyDown()
        end
        IsEventHandled = true
      end
    end
    if self.DefaultList and self.DefaultList.IsShow and self.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
      self.DefaultList:OnCloseSquadGamepad()
      self:UpdatKeyDisplay("SelfWidget")
      IsEventHandled = true
    end
  end
  if self.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and self.DefaultList.IsShow then
    return IsEventHandled
  end
  if "Gamepad_LeftTrigger" == InKeyName or "Gamepad_RightTrigger" == InKeyName then
    if self.Tab_Info then
      self.Tab_Info:Handle_KeyEventOnGamePad(InKeyName)
      IsEventHandled = true
    end
  elseif "Gamepad_RightShoulder" == InKeyName then
    if self.Key_LR:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
      self:OnTypeItemPadRight()
      IsEventHandled = true
    end
  elseif "Gamepad_LeftShoulder" == InKeyName then
    if self.Key_LT:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
      self:OnTypeItemPadLeft()
      IsEventHandled = true
    end
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    if self.FocusTypeName ~= "RewardWidget" then
      if IsDpadUp then
        if not self.IsOpenAttibute then
          self:OnButtonAttibuteHovered()
        end
      elseif self.Button_Multi:GetVisibility() == ESlateVisibility.Visible then
        self:OnClickMulti()
      end
      IsEventHandled = true
    end
  elseif "Gamepad_FaceButton_Top" == InKeyName then
    if self.FocusTypeName ~= "RewardWidget" then
      self.PressedKeys.Gamepad_DPad_Up = nil
      self.PressedKeys.Gamepad_FaceButton_Top = nil
      if IsDpadUp then
        self:OpenDetails()
      elseif self.Button_DoubleMod:GetVisibility() == ESlateVisibility.Visible and self.Button_DoubleMod:IsBtnForbidden() then
        self:OnForbiddenDoubleModBtnClicked()
      else
        self:ShowDialogChar()
      end
      IsEventHandled = true
    end
  elseif "Gamepad_LeftThumbstick" == InKeyName then
    if "SelectCell" ~= self.CurrentFocusType then
      return IsEventHandled
    elseif "SelectCell" == self.CurrentFocusType then
      if self.CurrentTabIdx == self.ObtainTabId then
        self.List_Prop:SetFocus()
        self:UpdatKeyDisplay("RewardWidget")
      elseif self.CurrentTabIdx == self.MonsterTabId then
        self.List_Monster:SetFocus()
        self:UpdatKeyDisplay("RewardWidget")
      elseif self.CurrentTabIdx == self.SpecialMonsterTabId then
        self.WB_EliteProp:GetChildAt(0):SetFocus()
        self:UpdatKeyDisplay("EliteProp")
      elseif self.CurrentTabIdx == self.TitleEventTabId then
        self.List_Event:SetFocus()
        self:UpdatKeyDisplay("EventWidget")
      end
      self:PlayAnimation(self.Hover)
      self.CurrentFocusType = "List"
      if self.StyleOfPlay then
        self.StyleOfPlay.IsKeyEventOnGamePad = false
      end
      IsEventHandled = true
    end
  end
  return IsEventHandled
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadUp(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadUp(InKeyName)
  local IsEventHandled = false
  self.PressedKeys[InKeyName] = false
  if "Gamepad_FaceButton_Left" == InKeyName and self.IsOpenAttibute then
    self:OnButtonAttibuteUnhovered()
  end
  return IsEventHandled
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if self.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible and self.DefaultList.IsShow then
    return UWidgetBlueprintLibrary.UnHandled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  self.PressedKeys[InKeyName] = true
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_DPad_Up" == InKeyName then
      IsEventHandled = true
    elseif "Gamepad_DPad_Down" == InKeyName then
      if self.CurrentTabIdx == self.SpecialMonsterTabId and not self.MenuOpen then
        if self.MonNum and self.MonNum > self.MaxMonNum then
          self:OpenCommanderDetails()
          IsEventHandled = true
        end
      elseif self.CurrentTabIdx == self.ObtainTabId and not self.MenuOpen then
        self:OpenRewardDetails()
        IsEventHandled = true
      end
      IsEventHandled = true
    elseif "Gamepad_DPad_Right" == InKeyName and not self:IsFocusList() then
      if self.DefaultList:GetVisibility() ~= ESlateVisibility.SelfHitTestInvisible then
        return IsEventHandled
      end
      if not self.DefaultList.IsShow then
        local IsChecked = not self.DefaultList.Preview.Switch_Summon:GetChecked()
        self.DefaultList.Preview.Switch_Summon:SetChecked(IsChecked)
        local Avatar = GWorld:GetAvatar()
        if not Avatar then
          IsEventHandled = true
          return
        end
        Avatar:SwitchSquadAutoPhantom(IsChecked)
        IsEventHandled = true
      end
    elseif "Gamepad_DPad_Left" == InKeyName and not self:IsFocusList() then
      if self.DefaultList:GetVisibility() ~= ESlateVisibility.SelfHitTestInvisible then
        return IsEventHandled
      end
      if not self.DefaultList.IsShow then
        self.DefaultList.Preview:OpenDefaultMenuAnchor()
        self:UpdatKeyDisplay("MenuAnchor")
        IsEventHandled = true
      end
    end
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnTypeItemPadLeft()
  if not self.LastMarkType then
    return
  end
  local CurrentIndex = self:GetItemIndex()
  if CurrentIndex and CurrentIndex > 1 then
    self:SelectTypeItemByIndex(CurrentIndex - 1)
  end
end

function M:OnTypeItemPadRight()
  if not self.LastMarkType then
    return
  end
  local CurrentIndex = self:GetItemIndex()
  if CurrentIndex and CurrentIndex < #self.TypeTableKeys then
    self:SelectTypeItemByIndex(CurrentIndex + 1)
  end
end

function M:SelectTypeItemByIndex(Index)
  local TargetKey = self.TypeTableKeys[Index]
  if TargetKey then
    self:OnTypeClicked(TargetKey)
  end
end

function M:GetItemIndex()
  for Index, Key in ipairs(self.TypeTableKeys) do
    if self.TypeTable[Key] == self.LastMarkType then
      return Index
    end
  end
  return nil
end

function M:SelectCellFocus()
  self:UpdatKeyDisplay("SelfWidget")
  if not self.SelectCell.Bg_List.Button_Area:HasAnyUserFocus() then
    self.SelectCell.Bg_List.Button_Area:SetFocus()
    if self.StyleOfPlay then
      self.StyleOfPlay.IsKeyEventOnGamePad = true
    end
  end
end

function M:OnSelectCellFocus()
  if self.Image_Select then
    self.Image_Select:SetRenderOpacity(0)
  end
  self.CurrentFocusType = "SelectCell"
  if self.CurrentFocusType ~= "SelectCell" and self.Gamepad then
    self:UpdatKeyDisplay("SelfWidget")
  end
end

function M:IsFocusList()
  return self.CurrentFocusType == "List"
end

function M:OnForbiddenRightBtnClicked()
  UIManager(self):ShowUITip(UIConst.Tip_CommonToast, "UI_REGISTER_COMINGSOON")
end

function M:OnForbiddenLeftBtnClicked()
  if self.IsComMissing and self.DefaultList:GetVisibility() == ESlateVisibility.SelfHitTestInvisible then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, "UI_Squad_Miss_Challenge")
  end
end

function M:OnForbiddenDoubleModBtnClicked()
  if self.IsDoubleMod and self.ContinuousCombat then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, "UI_Event_ModDrop_Exhausted")
  end
end

function M:ShowIntro()
end

function M:OpenIntro()
end

function M:UpdateActionPoint(ActionPointID)
end

function M:OnDungeonsUpdate()
  if self.DeputeType == Const.DeputeType.WalnutDepute then
    local Params = {}
    
    function Params.RightCallbackFunction()
      self:OnReturnKeyDown()
    end
    
    UIManager(self):ShowCommonPopupUI(100157, Params)
    local WalnutChoice = UIManager(self):GetUI("WalnutChoice")
    if WalnutChoice then
      WalnutChoice:Close()
    end
  end
end

function M:OnCurrentSquadChange(SquadId, IsComMissing)
  self.SquadId = SquadId
  self.IsComMissing = IsComMissing
  self:IsShowAttributeTips()
  if self.DefaultList.CurrentCharLevel <= DataMgr.Dungeon[self.CurSelectedDungeonId].DungeonLevel - DataMgr.GlobalConstant.TaskWarningLevel.ConstantValue then
    self.Panel_WarningHint:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_WarningHint:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:RefreshBtnState(bInIsMatching)
  DebugPrint("gmy@WBP_Play_DeputeDetail_C M:RefreshBtnState", bInIsMatching)
  if not self.CurSelectedDungeonId then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local UIUnlockRuleId = DataMgr.UIUnlockRule.Match.UIUnlockRuleId
  local bIsUnlock = Avatar:CheckUIUnlocked(UIUnlockRuleId) or false
  local DungeonData = DataMgr.Dungeon[self.CurSelectedDungeonId]
  if not DungeonData then
    return
  end
  local IsComMissing = self.IsComMissing or false
  local IsMultiDungeon = DungeonData.IsMultiDungeon and true or false
  local found = false
  if Avatar.CdnHideData and Avatar.CdnHideData.dungeon then
    for _, Data in pairs(Avatar.CdnHideData.dungeon) do
      for __, ConfigName in pairs(Data.gameCtrlDungeon or {}) do
        if "multidungeon" == ConfigName then
          IsMultiDungeon = Data.config and true or false
          found = true
          break
        end
      end
      if found then
        break
      end
    end
  end
  local IsMatching = bInIsMatching
  if nil == IsMatching then
    IsMatching = self:IsMatching()
  end
  self.ContinuousCombat = EMCache:Get("Is_DoubleMod_SwitchTab", true) or false
  local _, IsEliteRushDungeon = self:CheckDungeonType(self.CurSelectedDungeonId)
  local ShowDouble = not IsMultiDungeon and self.IsDoubleMod and IsEliteRushDungeon and self.ContinuousCombat
  local RemainOK = true
  if ShowDouble then
    local DoubleModDropInfo = self:GetDoubleModDropData() or {}
    local ConfigValue = DataMgr.ModDropConstant.DailyFreeTicketAmount and DataMgr.ModDropConstant.DailyFreeTicketAmount.ConstantValue or 0
    local UsedTimes = DoubleModDropInfo.EliteRushTimes or 0
    local Remaining = math.floor(ConfigValue - UsedTimes)
    RemainOK = Remaining > 0
  end
  local Sig = table.concat({
    tostring(self.CurSelectedDungeonId),
    tostring(IsMatching),
    tostring(bIsUnlock),
    tostring(IsMultiDungeon),
    tostring(self.DeputeType),
    tostring(IsComMissing),
    tostring(ShowDouble or false),
    tostring(RemainOK)
  }, "|")
  if self._Btn_sig == Sig then
    return
  end
  self._Btn_sig = Sig
  DebugPrint("SL@WBP_Play_DeputeDetail_C M:RefreshBtnState")
  if self.DeputeType == Const.DeputeType.WalnutDepute then
    self.Button_Solo:SetText(GText("UI_Walnut_Choice"))
  else
    self.Button_Solo:SetText(GText("DUNGEONSINGLE"))
  end
  if IsMatching then
    self.Button_Multi:ForbidBtn(true)
    self.Button_Solo:ForbidBtn(true)
    self.Button_Multi:UnBindEventOnClickedByObj(self)
    self.Button_Solo:UnBindEventOnClickedByObj(self)
    self.Button_Multi:BindForbidStateExecuteEvent(self, function()
    end)
    self.Button_Solo:BindForbidStateExecuteEvent(self, function()
    end)
  else
    if not IsMultiDungeon then
      self.Button_Multi:SetVisibility(ESlateVisibility.Collapsed)
      if ShowDouble then
        self.Button_Solo:SetVisibility(ESlateVisibility.Collapsed)
        self.Button_DoubleMod:SetVisibility(ESlateVisibility.Visible)
        self.Button_DoubleMod:SetText(GText("UI_Event_ModDrop_ChallengeStart"))
        self.Button_DoubleMod:ForbidBtn(not RemainOK and self.ContinuousCombat or false)
      else
        self.Button_DoubleMod:SetVisibility(ESlateVisibility.Collapsed)
        self.Button_Solo:SetText(GText("UI_Ticket_Choose"))
        self.Button_Solo:SetVisibility(ESlateVisibility.Visible)
      end
    else
      self.Button_Multi:SetVisibility(bIsUnlock and ESlateVisibility.Visible or ESlateVisibility.Collapsed)
    end
    self.Button_Multi:ForbidBtn(not IsMultiDungeon)
    self.Button_Multi:UnBindEventOnClickedByObj(self)
    self.Button_Solo:UnBindEventOnClickedByObj(self)
    self.Button_Solo:ForbidBtn(false)
    self.Button_Multi:SetDefaultGamePadImg("X")
    self.Button_Solo:SetDefaultGamePadImg("Y")
    self.Button_DoubleMod:SetDefaultGamePadImg("Y")
    self.Button_Multi:BindEventOnClicked(self, self.OnClickMulti)
    self.Button_Solo:BindEventOnClicked(self, self.ShowDialogChar)
    self.Button_Multi:BindForbidStateExecuteEvent(self, self.OnForbiddenRightBtnClicked)
    self.Button_DoubleMod:BindForbidStateExecuteEvent(self, self.OnForbiddenDoubleModBtnClicked)
  end
  if IsComMissing then
    self.Button_Multi:ForbidBtn(true)
    self.Button_Solo:ForbidBtn(true)
    self.Button_Multi:UnBindEventOnClickedByObj(self)
    self.Button_Solo:UnBindEventOnClickedByObj(self)
    self.Button_Solo:BindForbidStateExecuteEvent(self, self.OnForbiddenLeftBtnClicked)
    self.Button_Multi:BindForbidStateExecuteEvent(self, self.OnForbiddenLeftBtnClicked)
  end
end

function M:IsMatching()
  return TeamController:GetModel():IsMatching()
end

function M:OpenTicketDialog(DungeonId)
  local CommonDialog = UIManager(self):ShowCommonPopupUI(100123, {
    DungeonId = self.CurSelectedDungeonId,
    RightCallbackObj = self,
    RightCallbackFunction = function(Obj, PackageData)
      self:EnterTicketDungeon(PackageData.Content_1.TicketId)
    end,
    ForbiddenRightCallbackObj = self,
    AutoFocus = true
  }, self)
end

function M:PlayTabSound()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
end

function M:TryEnterDungeon(Avatar, DungeonId, DungeonNetMode, OtherCallback, TicketId)
  if self:DoCheckCanEnterDungeon(Avatar, DungeonId) then
    DebugPrint("gmy@M:TryEnterDungeon ", Avatar, DungeonId, DungeonNetMode, OtherCallback, TicketId)
    if self.DefaultList:GetVisibility() == ESlateVisibility.Collapsed then
      Avatar:EnterDungeon(DungeonId, DungeonNetMode, OtherCallback, TicketId)
    else
      Avatar:EnterDungeon(DungeonId, DungeonNetMode, OtherCallback, TicketId, self.SquadId)
    end
  else
    TeamController:GetModel().bPressedSolo = false
    TeamController:GetModel().bPressedMulti = false
  end
end

function M.HandleEnterDungeonRetCode(RetCode, ...)
  DebugPrint("gmy@M.EnterDungeonCallback RetCode", RetCode)
  if RetCode == ErrorCode.RET_SUCCESS then
    return true
  else
    TeamController:DoWhenEnterDungeonCheckFailed(RetCode, ...)
    EventManager:FireEvent(EventID.TeamMatchTimingEnd)
    return false
  end
end

function M:DoCheckCanEnterDungeon(Avatar, DungeonId)
  if not TeamController:DoCheckCanEnterDungeon(DungeonId) then
    DebugPrint("gmy@M:DoCheckCanEnterDungeon bTeammateNotReady")
    return false
  end
  return true
end

function M:TeamMatchTimingStart(arg)
  TeamController:GetModel().bPressedSolo = true
  TeamController:GetModel().bPressedMulti = true
  self:RefreshBtnState(arg)
end

function M:TeamMatchTimingEnd(arg)
  TeamController:GetModel().bPressedSolo = false
  TeamController:GetModel().bPressedMulti = false
  self:RefreshBtnState(arg)
end

function M:DisableEscOnDungeonLoading()
  self.DisableEsc = true
end

AssembleComponents(M)
return M
