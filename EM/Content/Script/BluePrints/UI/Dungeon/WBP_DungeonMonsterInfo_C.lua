require("UnLua")
local MonsterUtils = require("Utils.MonsterUtils")
local CommonUtils = require("Utils.CommonUtils")
local M = Class("BluePrints.UI.BP_UIState_C")
local MONSTER_BOSS_ICON = "/Game/UI/Texture/Static/Atlas/Play/T_Play_BossMonster.T_Play_BossMonster"
local MONSTER_ELITE_ICON = "/Game/UI/Texture/Static/Atlas/Play/T_Play_EliteMonster.T_Play_EliteMonster"
local MONSTER_INFO_WEAKNESS_ITEM = "/Game/UI/WBP/Play/Widget/Depute/MonsterInfo_Tab_Item_Content.MonsterInfo_Tab_Item_Content"
local MONSTER_INFO_TAB_ITEM = "/Game/UI/WBP/Play/Widget/Depute/MonsterInfo_Tab_Item_Content.MonsterInfo_Tab_Item_Content"

function M:Construct()
  self.Super.Construct(self)
  self.MonsterIdToIndex = {}
  self.MonsterIdToItem = {}
  self.MonsterWeaknessIcon = {}
  self.Button_Back.OnClicked:Add(self, self.OnButtonBackClicked)
  self.Arrow_Left.OnClicked:Add(self, self.OnBtnArrowLeftClicked)
  self.Arrow_Right.OnClicked:Add(self, self.OnBtnArrowRightClicked)
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local DungeonId, Parent, SelectMonster = ...
  self.Parent = Parent
  self.SelectMonster = SelectMonster
  if DungeonId then
    self:InitPanel(DungeonId)
  end
end

function M:Destruct()
  self.Super.Destruct(self)
  self.Button_Back.OnClicked:Clear()
  self.Arrow_Left.OnClicked:Clear()
  self.Arrow_Right.OnClicked:Clear()
end

function M:Tick(MyGeometry, DeltaTime)
  if self.SelectMonster then
    self:TryMoveMonsterInfo(self.MonsterIdToIndex[self.SelectMonster] - 1)
    self.SelectMonster = nil
  end
  if self.NeedSelectMonsterId and self.MonsterIdToItem[self.NeedSelectMonsterId] then
    local TabWidget = self.MonsterIdToItem[self.NeedSelectMonsterId]
    TabWidget:ForceToSelection()
    self.NeedSelectMonsterId = nil
  end
end

function M:InitPanel(DungeonId, DungeonInfo)
  self.NowDungeonId = DungeonId
  self.NowDungeonInfo = DungeonInfo
  self.NowSelectingIndex = 1
  self.Text_Tips:SetText(GText("UI_TRAIN_CLOSE"))
  self:InitMonsterWeakness()
  self:RefreshMonsterList()
  self:InitKeys()
  self:SetFocus()
  self:PlayOpenAnim()
end

function M:InitKeys()
  self.Key_Return:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Esc"}
    },
    bLongPress = false,
    Desc = GText("UI_BACK")
  })
  self.Key_Left:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "Q"}
    }
  })
  self.Key_Right:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "E"}
    }
  })
  self.Key_Left_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LB"}
    }
  })
  self.Key_Right_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RB"}
    }
  })
  self.Key_Check_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RV"}
    },
    Desc = GText("UI_Controller_Slide")
  })
  self.Key_Close_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_Controller_Close")
  })
  self.Key_Return:AddExecuteLogic(self, self.OnButtonBackClicked)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.Key_Left:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Key_Right:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Key_Return:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:RefreshMonsterList()
  local DungeonId = self.NowDungeonId
  local DungeonInfo = {}
  if self.NowDungeonInfo then
    DungeonInfo = self.NowDungeonInfo
    assert(DungeonInfo.DungeonMonsters, "Given DungeonInfo is wrong, Dungeon monsters config nil")
  else
    assert(DungeonId, "dungeon id is nil")
    DungeonInfo = DataMgr.Dungeon[DungeonId]
    assert(DungeonInfo, string.format("Dungeon id [%d] is wrong, cant find dungeonInfo", DungeonId))
    assert(DungeonInfo.DungeonMonsters, string.format("Dungeon monsters config nil, id [%d]", DungeonId))
  end
  local Monsters = DungeonInfo.DungeonMonsters
  local DisplayMonsters = CommonUtils.DeepCopy(Monsters)
  table.sort(DisplayMonsters, self.CompareMonsters)
  self.List_Tab:ClearListItems()
  local Class = LoadClass(MONSTER_INFO_TAB_ITEM)
  for index, id in ipairs(DisplayMonsters) do
    self.MonsterIdToIndex[id] = index
    local Content = NewObject(Class)
    Content.MonsterId = id
    Content.ParentWidget = self
    if not self.SelectMonster then
      Content.bIsDefaultSelected = 1 == index
    end
    Content.WeaknessIcon = self.MonsterWeaknessIcon[id]
    Content.SoundEvent = "event:/ui/common/click_level_02"
    self.List_Tab:AddItem(Content)
  end
  if not self.SelectMonster then
    self.SelectMonster = DisplayMonsters[1]
  end
  self.DisplayMonsters = DisplayMonsters
  self:CheckDisplayMonsters(DisplayMonsters)
end

function M:OnButtonBackClicked()
  if self:IsAnimationPlaying(self.Out) or self:IsAnimationPlaying(self.In) then
    return
  end
  self:PlayCloseAnim()
end

function M:TryMoveMonsterInfo(OffsetIndex)
  if not self.SelectMonster then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  end
  local WillIndex = OffsetIndex + self.NowSelectingIndex
  local MaxIndex = #self.DisplayMonsters
  if WillIndex < 1 or WillIndex > MaxIndex then
    return
  end
  self.NowSelectingIndex = WillIndex
  self:PlaySwitchAnim(OffsetIndex)
  self.List_Tab:ScrollIndexIntoView(WillIndex - 1)
  self:AddTimer(0.01, function()
    self:SelectMonsterInfoByIndex(WillIndex)
  end)
end

function M:CallMoveAnim(OffsetIndex)
end

function M:InitMonsterWeakness()
  local DungeonId = self.NowDungeonId
  local DungeonInfo = {}
  if self.NowDungeonInfo then
    DungeonInfo = self.NowDungeonInfo
    assert(DungeonInfo.DungeonMonsters, "Given DungeonInfo is wrong, Dungeon monsters config nil")
  else
    assert(DungeonId, "dungeon id is nil")
    DungeonInfo = DataMgr.Dungeon[DungeonId]
    assert(DungeonInfo, string.format("Dungeon id [%d] is wrong, cant find dungeonInfo", DungeonId))
    assert(DungeonInfo.DungeonMonsters, string.format("Dungeon monsters config nil, id [%d]", DungeonId))
  end
  local MonsterBuff = DungeonInfo.MonsterBuff
  local Monsters = DungeonInfo.DungeonMonsters
  if MonsterBuff then
    for _, MonsterId in ipairs(Monsters) do
      if type(MonsterId) == "number" then
        local AllBuffs = MonsterUtils.GetRealMonsterBuffs(DungeonId, MonsterId, self.NowDungeonInfo)
        for _, BuffId in ipairs(AllBuffs) do
          local BuffInfo = DataMgr.Buff[BuffId]
          if BuffInfo and BuffInfo.WeaknessType then
            local WeaknessType = BuffInfo.WeaknessType
            local DamageTypeInfo = DataMgr.DamageType[WeaknessType]
            if DamageTypeInfo and DamageTypeInfo.WeaknessIcon then
              self.MonsterWeaknessIcon[MonsterId] = self.MonsterWeaknessIcon[MonsterId] or {}
              self.MonsterWeaknessIcon[MonsterId][DamageTypeInfo.WeaknessIcon] = WeaknessType
            end
          end
        end
      end
    end
  end
  self.Text_Weakness:SetText(GText("Mon_Guide_Weakness_Label"))
end

function M:SelectMonsterInfoByIndex(index)
  local MonsterId = self.DisplayMonsters[index]
  if MonsterId then
    self:SelectMonsterInfoItem(MonsterId)
  end
end

function M:SelectMonsterInfoItem(MonsterId)
  local MonsterInfo = DataMgr.Monster[MonsterId]
  self.NowSelectingIndex = self.MonsterIdToIndex[MonsterId]
  if MonsterInfo then
    local bIsBoss = MonsterUtils.IsBoss(MonsterId)
    local bIsElite = MonsterUtils.IsElite(MonsterId)
    local bIsNormal = not bIsElite and not bIsBoss
    local ImagePath = MonsterInfo.Icon
    local MonsterName = GText(MonsterInfo.UnitName)
    local MonsterDescription = GText(MonsterUtils.GetDescriptionDetail(MonsterId))
    self.Monster_Name:SetText(MonsterName or "")
    self.Text_Content:SetText(MonsterDescription or "")
    local MonsterIcon = LoadObject(string.format("Texture2D'%s'", ImagePath))
    local ImgMat = self.Icon_Monster_Head:GetDynamicMaterial()
    ImgMat:SetTextureParameterValue("MainTex", MonsterIcon)
    if bIsNormal then
      self.Icon_Monster_Type:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Icon_Monster_Type:SetVisibility(UE4.ESlateVisibility.Visible)
      local MonsterTypeIcon
      if bIsBoss then
        MonsterTypeIcon = LoadObject(string.format("%s", MONSTER_BOSS_ICON))
      else
        MonsterTypeIcon = LoadObject(string.format("%s", MONSTER_ELITE_ICON))
      end
      self.Icon_Monster_Type:SetBrushResourceObject(MonsterTypeIcon)
    end
    local Class = LoadClass(MONSTER_INFO_WEAKNESS_ITEM)
    local MonsterWeaknessIcons = self:GetMonsterWeaknessIcons(MonsterId)
    if next(MonsterWeaknessIcons) then
      self.Panel_Weakness:SetVisibility(UE4.ESlateVisibility.Visible)
      self.List_Weak:ClearListItems()
      for Index, MonsterWeaknessIcon in ipairs(MonsterWeaknessIcons) do
        local Content = NewObject(Class)
        Content.WeaknessIcon = MonsterWeaknessIcon
        self.List_Weak:AddItem(Content)
      end
    else
      self.Panel_Weakness:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    local TabWidget = self.MonsterIdToItem[MonsterId]
    if TabWidget then
      TabWidget:ForceToSelection()
    else
      self.NeedSelectMonsterId = MonsterId
    end
    self:RefreshArrows()
    self:RefreshScrollGamepadVisibility()
  end
end

function M:RefreshArrows()
  local TotalCount = #self.DisplayMonsters
  if TotalCount <= 2 then
    self.Arrow_Left:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Arrow_Right:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif 1 == self.NowSelectingIndex then
    self.Arrow_Left:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Arrow_Right:SetVisibility(UE4.ESlateVisibility.Visible)
  elseif self.NowSelectingIndex == TotalCount then
    self.Arrow_Left:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Arrow_Right:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Arrow_Left:SetVisibility(UE4.ESlateVisibility.Visible)
    self.Arrow_Right:SetVisibility(UE4.ESlateVisibility.Visible)
  end
end

function M:GetMonsterWeaknessIcons(MonsterId)
  local IconSet = self.MonsterWeaknessIcon[MonsterId]
  local IconList = {}
  if IconSet then
    for Icon, WeaknessType in pairs(IconSet) do
      table.insert(IconList, {Icon = Icon, WeaknessType = WeaknessType})
    end
    table.sort(IconList, MonsterUtils.SortWeaknessTypeIcon)
  end
  local SortedIconList = {}
  for _, v in ipairs(IconList) do
    table.insert(SortedIconList, v.Icon)
  end
  return SortedIconList
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:PlayCloseAnim()
  elseif "Q" == InKeyName then
    self:TryMoveMonsterInfo(-1)
  elseif "E" == InKeyName then
    self:TryMoveMonsterInfo(1)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:SetTabItemSelection(Item)
  if self.SelectingItem and self.SelectingItem ~= Item then
    self.SelectingItem:CancelTabSelect()
  end
  self.SelectingItem = Item
end

function M:CheckDisplayMonsters(DisplayMonsters)
  if DisplayMonsters then
    local MonsterCount = #DisplayMonsters
    if MonsterCount <= 1 then
      self.Key_Left:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Key_Right:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Key_Left:SetVisibility(UE4.ESlateVisibility.Visible)
      self.Key_Right:SetVisibility(UE4.ESlateVisibility.Visible)
    end
  end
end

function M.CompareMonsters(LeftId, RightId)
  if MonsterUtils.IsBoss(LeftId) and not MonsterUtils.IsBoss(RightId) then
    return true
  elseif not MonsterUtils.IsBoss(LeftId) and MonsterUtils.IsBoss(RightId) then
    return false
  elseif MonsterUtils.IsElite(LeftId) and not MonsterUtils.IsElite(RightId) then
    return true
  elseif not MonsterUtils.IsElite(LeftId) and MonsterUtils.IsElite(RightId) then
    return false
  else
    local LeftPriority = MonsterUtils.GetPriority(LeftId)
    local RightPriority = MonsterUtils.GetPriority(RightId)
    if LeftPriority == RightPriority then
      return LeftId < RightId
    else
      return LeftPriority < RightPriority
    end
  end
end

function M:Close()
  assert(self.Parent, "Parent or GrandParent is nil")
  self.Parent.bIsFocusable = true
  self.Parent:SetFocus()
  self.Super.Close(self)
end

function M:OnBtnArrowLeftClicked()
  self:TryMoveMonsterInfo(-1)
end

function M:OnBtnArrowRightClicked()
  self:TryMoveMonsterInfo(1)
end

function M:PlayOpenAnim()
  self.CanvasPanelRoot:SetRenderOpacity(1.0)
  self:PlayAnimation(self.In)
end

function M:PlayCloseAnim()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
  self:PlayAnimation(self.Out)
end

function M:PlaySwitchAnim()
  self:PlayAnimation(self.Switch)
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    self:Close()
  end
end

function M:InitInputSettings()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  DebugPrint("gmy@WBP_DungeonMonsterInfo_C M:OnUpdateUIStyleByInputTypeChange", CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
    self.UsingGamepad = false
    self:RefreshKeyView()
  else
    self.UsingGamepad = true
    self.GameInputModeSubsystem:SetNavigateWidgetVisibility(false)
    self:RefreshGamepadView()
  end
end

function M:RefreshGamepadView()
  self.WidgetSwitcher_L:SetActiveWidgetIndex(1)
  self.WidgetSwitcher_R:SetActiveWidgetIndex(1)
  self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
  self.Key_Return:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:RefreshKeyView()
  self.WidgetSwitcher_L:SetActiveWidgetIndex(0)
  self.WidgetSwitcher_R:SetActiveWidgetIndex(0)
  self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
  self.Key_Return:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
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
  if InKeyName == Const.GamepadFaceButtonRight then
    self:Close()
    IsEventHandled = true
  elseif InKeyName == Const.GamepadLeftShoulder then
    self:TryMoveMonsterInfo(-1)
    IsEventHandled = true
  elseif InKeyName == Const.GamepadRightShoulder then
    self:TryMoveMonsterInfo(1)
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
  if "Gamepad_RightY" == InKeyName then
    local CurScrollOffset = self.EMScrollBox_1:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.EMScrollBox_1:GetScrollOffsetOfEnd())
    self.EMScrollBox_1:SetScrollOffset(ScrollOffset)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:RefreshScrollGamepadVisibility()
  self:AddTimer(0.1, function()
    local bCanScroll = UIUtils.CheckScrollBoxCanScroll(self.EMScrollBox_1)
    if bCanScroll then
      self.Key_Check_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Key_Check_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end)
end

return M
