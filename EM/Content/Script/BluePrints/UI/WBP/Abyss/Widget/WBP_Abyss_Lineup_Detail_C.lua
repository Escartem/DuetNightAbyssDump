local WBP_Abyss_Lineup_Detail = Class("BluePrints.UI.BP_EMUserWidget_C")
WBP_Abyss_Lineup_Detail._components = {
  "BluePrints.Common.DelayFrameComponent"
}
local ESlotName = require("BluePrints.UI.UI_PC.Abyss.WBP_Abyss_Lineup_C").ESlotName
local EDirection = require("BluePrints.UI.UI_PC.Abyss.WBP_Abyss_Lineup_C").EDirection
local DungeonName = {
  [1] = GText("Abyss_DungeonA"),
  [2] = GText("Abyss_DungeonB")
}
local GamepadIcons = {
  "Controller_MonsterInfo"
}

function WBP_Abyss_Lineup_Detail:InitGamepadKeys()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self.Icon_Key_MonsterInfo:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Menu"}
    }
  })
  self.Entry_Tip.Icon_Key_Entry:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "View"}
    }
  })
end

function WBP_Abyss_Lineup_Detail:Construct()
  self.IsExpanded = false
  self.DungeonIndex = -1
  self.Slots = {
    [ESlotName.Char] = self.Character,
    [ESlotName.Pet] = self.Pet,
    [ESlotName.RangedWeapon] = self.Weapon_Range,
    [ESlotName.MeleeWeapon] = self.Weapon_Melee,
    [ESlotName.Phantom1] = self.Head_Phantom01,
    [ESlotName.PhantomWeapon1] = self.Weapon_Phantom01,
    [ESlotName.Phantom2] = self.Head_Phantom02,
    [ESlotName.PhantomWeapon2] = self.Weapon_Phantom02
  }
  self.CollapsedSlot = self.Character_Collapsed
  self.CurSlotName = ESlotName.Null
  self.Btn_Clear:SetText(GText("ModFilter_ClearAll"))
  self.Btn_Mod:SetText(GText("UI_SHOP_SUBTAB_NAME_MOD"))
  self.Text_Phantom01:SetText(GText("UI_STAT_Sigil") .. " 1")
  self.Text_Phantom02:SetText(GText("UI_STAT_Sigil") .. " 2")
  self.Btn_Entry = self.Entry_Tip.Btn_Entry
  self.List_Entry = self.Entry_Tip.List_Entry
  self:BindPanelBtns()
  self:ForbidBtn(true)
  self:BindButtonPerformances()
  self:InitGamepadKeys()
end

function WBP_Abyss_Lineup_Detail:BindPanelBtns()
  self.Btn_Entry:UnBindEventOnClickedByObj(self)
  self.Btn_Entry:BindEventOnClicked(self, self.ShowEntryPanel)
  self.Btn_MonsterInfo:UnBindEventOnClickedByObj(self)
  self.Btn_MonsterInfo:BindEventOnClicked(self, self.ShowMonsterInfo)
  self.Btn_MonsterInfo:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  end)
  self.Btn_Clear:UnBindEventOnClickedByObj(self)
  self.Btn_Clear:BindEventOnClicked(self, self.OnClearBtnClicked)
  self.Btn_Clear:BindForbidStateExecuteEvent(self, self.OnForbiddenClicked)
  self.Btn_Mod:UnBindEventOnClickedByObj(self)
  self.Btn_Mod:BindEventOnClicked(self, self.OnModBtnClicked)
  self.Btn_Mod:BindForbidStateExecuteEvent(self, self.OnForbiddenClicked)
end

function WBP_Abyss_Lineup_Detail:Destruct()
  self.Btn_MonsterInfo:UnBindEventOnClickedByObj(self)
  self.Btn_Entry:UnBindEventOnClickedByObj(self)
  self.Btn_Clear:UnBindEventOnClickedByObj(self)
  self.Btn_Mod:UnBindEventOnClickedByObj(self)
  self:UnBindButtonPerformances()
end

function WBP_Abyss_Lineup_Detail:Init(DungeonIndex, LineupPage, DungeonId, IsExpanded)
  self.IsExpanded = false
  self.Name = DungeonName[DungeonIndex]
  self.Text_LevelName:SetText(self.Name)
  self.DungeonIndex = DungeonIndex
  self.LineupPage = LineupPage
  if IsExpanded then
    self.IsExpanded = true
    LineupPage:SetDetailPanelLocation(DungeonIndex, true)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Expand_Normal)
  else
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Fold_Normal)
  end
  self:InitSlots()
  self:InitDungeonInfo(DungeonId)
  self:InitListEntry()
  self:SetProgressAndAttribute()
end

function WBP_Abyss_Lineup_Detail:SetProgressAndAttribute()
  if not self.LineupPage then
    return
  end
  local AbyssId, LevelIndex = self.LineupPage.AbyssId, self.LineupPage.LevelIndex
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    DebugPrint("WBP_Abyss_Lineup_DetailL:SetProgressText, \233\133\141\231\189\174\233\157\162\230\157\191\229\136\157\229\167\139\229\140\150\229\164\177\232\180\165\239\188\140Avatar\230\151\160\230\149\136")
    return
  end
  local AbyssInfo = Avatar.Abysses[AbyssId]
  if not AbyssInfo then
    DebugPrint("lhr@WBP_Abyss_Select_C:InitLevelInfo, AbyssId", AbyssId, "\229\175\185\229\186\148\231\154\132\232\181\155\229\173\163\228\184\141\229\173\152\229\156\168")
    return
  end
  local LevelInfo = AbyssInfo.AbyssLevelList[LevelIndex]
  if not LevelInfo then
    DebugPrint("lhr@WBP_Abyss_Select_C:InitLevelInfo, LevelIndex", LevelIndex, "\229\175\185\229\186\148\231\154\132\229\133\179\229\141\161\228\184\141\229\173\152\229\156\168")
    return
  end
  self.AbyssId = AbyssId
  self.LevelId = LevelInfo.AbyssLevelId
  local Now, All = 0, LevelInfo["DungeonReward" .. self.DungeonIndex]
  local AbyssProgress = LevelInfo.MaxLockedTeamProgress
  if LevelInfo.IsTeamLocked and AbyssProgress then
    Now = AbyssProgress[self.DungeonIndex]
  end
  self.Text_Now:SetText(Now)
  self.Text_All:SetText(All)
  local AttributeType = DataMgr.AbyssLevel[LevelInfo.AbyssLevelId]["AttributeType" .. self.DungeonIndex]
  local Attributes = {}
  if AttributeType then
    Attributes = string.split(AttributeType, ",")
    self.Attribute1:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Attribute1:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self.List_Attribute_Expand:ClearListItems()
  self.List_Attribute_Fold:ClearListItems()
  local FoldPath = "/Game/UI/Texture/Dynamic/Atlas/Armory/"
  local Prefix = "T_Armory_"
  for _, Attribute in pairs(Attributes) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    local AttributeName = Prefix .. Attribute
    Obj.IconPath = FoldPath .. AttributeName .. "." .. AttributeName
    self.List_Attribute_Expand:AddItem(Obj)
    self.List_Attribute_Fold:AddItem(Obj)
  end
end

function WBP_Abyss_Lineup_Detail:InitDungeonInfo(DungeonId)
  local DungeonInfo = DataMgr.AbyssDungeon[DungeonId]
  if not DungeonInfo then
    DebugPrint("lhr@WBP_Abyss_Lineup_Detail:InitDungeonInfo\229\164\177\232\180\165\239\188\140 DungeonIndex\229\175\185\229\186\148\231\154\132\229\164\167\231\167\152\229\162\131\229\137\175\230\156\172\228\191\161\230\129\175\228\184\141\229\173\152\229\156\168")
    return
  end
  self.DungeonInfo = DungeonInfo
end

function WBP_Abyss_Lineup_Detail:InitListEntry()
  self.List_Entry:ClearListItems()
  local AbyssBuffs = DataMgr.AbyssBuff
  local DungeonEntries = self.DungeonInfo.AbyssBuffID
  if not DungeonEntries then
    DebugPrint("lhr@WBP_Abyss_Lineup_Detail:InitListEntry \229\164\167\231\167\152\229\162\131\229\137\175\230\156\172\231\154\132\232\175\141\230\157\161\229\136\151\232\161\168\228\184\141\229\173\152\229\156\168")
    return
  end
  for _, EntryId in pairs(DungeonEntries) do
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.IconPath = AbyssBuffs[EntryId].Icon
    self.List_Entry:AddItem(Obj)
  end
end

function WBP_Abyss_Lineup_Detail:InitSlots()
  for SlotName, Slot in pairs(self.Slots) do
    Slot:Init(SlotName, self.LineupPage, self.DungeonIndex, self.IsExpanded)
    if SlotName == ESlotName.Phantom1 or SlotName == ESlotName.Phantom2 then
      Slot.WeaponSlot = self.Slots[SlotName + 1]
    end
    if SlotName == ESlotName.PhantomWeapon1 or SlotName == ESlotName.PhantomWeapon2 then
      Slot:SetForbidden(true)
    end
  end
  self.CollapsedSlot:Init(ESlotName.Char, self.LineupPage, self.DungeonIndex, self.IsExpanded)
  self.Slots[ESlotName.Char].CollapsedSlot = self.CollapsedSlot
end

function WBP_Abyss_Lineup_Detail:UpdateSlot(SelectedSlot, Content)
  if not Content then
    self:ClearSlot(SelectedSlot)
  else
    self.Slots[SelectedSlot]:Update(Content)
    if SelectedSlot == ESlotName.PhantomWeapon1 or SelectedSlot == ESlotName.PhantomWeapon2 then
      self:SetWeaponType(SelectedSlot, Content.Tag)
    end
    self:ForbidBtn(false)
  end
end

function WBP_Abyss_Lineup_Detail:SelectSlot(SlotName, bPlaySound, bNotToList)
  if self.Slots[SlotName] then
    self.Slots[SlotName]:OnBtnClicked(not bPlaySound, bNotToList)
  else
    if SlotName == ESlotName.Null then
      return
    end
    DebugPrint("lhr@WBP_Abyss_Lineup_Detail:SelectSlot, SlotName\229\175\185\229\186\148\231\154\132\230\167\189\228\189\141\228\184\141\229\173\152\229\156\168")
  end
end

function WBP_Abyss_Lineup_Detail:CheckSlot(SlotName)
  if self.Slots[SlotName] then
    self.Slots[SlotName]:SetIsChecked(true)
  end
end

function WBP_Abyss_Lineup_Detail:UnSelectSlot(SlotName)
  if self.Slots[SlotName] then
    self.Slots[SlotName]:SetIsChecked(false)
  end
end

function WBP_Abyss_Lineup_Detail:ClearAllSlots(bInit)
  if self.LineupPage then
    if not bInit then
      self.LineupPage:RemoveTeamIcons(self.DungeonIndex)
    end
  else
    DebugPrint("lhr@WBP_Abyss_Lineup_Detail:ClearAllSlots, \233\152\181\229\174\185\233\157\162\230\157\191\229\164\177\230\149\136")
    return nil
  end
  local ret = false
  local NewSelectedSlot
  for _, Slot in pairs(self.Slots) do
    if Slot:Clear() then
      ret = true
      if Slot.WeaponSlot and self.LineupPage.CurSlotName == Slot.WeaponSlot.SlotName then
        NewSelectedSlot = Slot
      end
    end
  end
  if not bInit and NewSelectedSlot then
    NewSelectedSlot:OnBtnClicked()
  end
  self:ForbidBtn(true)
  return ret
end

function WBP_Abyss_Lineup_Detail:ClearSlot(SlotName)
  if self.Slots[SlotName] then
    self.Slots[SlotName]:Clear()
  end
  if self:IsEmpty() then
    self:ForbidBtn(true)
  end
end

function WBP_Abyss_Lineup_Detail:ForbidBtn(bForbid)
  bForbid = bForbid or false
  if self.bForbidBtn ~= nil then
    self.bForbidBtn = bForbid
    return
  end
  self.bForbidBtn = bForbid
  self:AddDelayFrameFunc(function()
    self.Btn_Clear:ForbidBtn(self.bForbidBtn)
    self.Btn_Mod:ForbidBtn(self.bForbidBtn)
    self.bForbidBtn = nil
  end, 2)
end

function WBP_Abyss_Lineup_Detail:IsEmpty()
  local Ret = true
  for _, Slot in pairs(self.Slots) do
    if not Slot.IsEmpty then
      Ret = false
      break
    end
  end
  return Ret
end

function WBP_Abyss_Lineup_Detail:GetCurrentUuid(SlotName)
  if self.Slots[SlotName] then
    return self.Slots[SlotName].Uuid
  end
end

function WBP_Abyss_Lineup_Detail:GetWeaponType(SlotName)
  if SlotName ~= ESlotName.PhantomWeapon1 and SlotName ~= ESlotName.PhantomWeapon2 then
    return nil
  end
  return self.Slots[SlotName].WeaponType
end

function WBP_Abyss_Lineup_Detail:SetWeaponType(SlotName, Type)
  self.Slots[SlotName].WeaponType = Type
end

function WBP_Abyss_Lineup_Detail:ExpandPanel()
  if self.IsExpanded == true then
    return
  end
  if self.LineupPage then
    self.LineupPage:SetDetailPanelLocation(self.DungeonIndex, false)
  else
    DebugPrint("lhr@WBP_Abyss_Lineup_Detail:ExpandPanel, \233\152\181\229\174\185\233\157\162\230\157\191\229\164\177\230\149\136")
  end
  for _, Slot in pairs(self.Slots) do
    Slot:Expand()
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Expand)
  self.IsExpanded = true
end

function WBP_Abyss_Lineup_Detail:CollapsePanel()
  if self.IsExpanded == false then
    return
  end
  for _, Slot in pairs(self.Slots) do
    Slot:Collapse()
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Fold)
  self.IsExpanded = false
end

function WBP_Abyss_Lineup_Detail:ShowMonsterInfo()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManger = GameInstance:GetGameUIManager()
  if UIManger then
    local MonsterInfoPanel = UIManger:LoadUI(UIConst.LoadInConfig, "MonsterDetailInfo", self.LineupPage.Root:GetZOrder())
    MonsterInfoPanel:InitPanel(nil, self.DungeonInfo)
    MonsterInfoPanel.Parent = self.LineupPage
  end
end

function WBP_Abyss_Lineup_Detail:ShowEntryPanel()
  local ConfigData = {
    Type = self.DungeonIndex,
    AbyssId = self.AbyssId,
    LevelId = self.LevelId
  }
  local New = UIManager(self):LoadUINew("AbyssEntry", ConfigData)
end

function WBP_Abyss_Lineup_Detail:OnClearBtnClicked()
  local ret = self:ClearAllSlots()
  if ret and self.LineupPage then
    if self.LineupPage.Saved then
      self.LineupPage.Btn_Save:SetForbidden(false)
    end
    self.LineupPage.Saved = false
  end
end

local SlotOrder = {
  [1] = "Char",
  [2] = "MeleeWeapon",
  [3] = "RangedWeapon",
  [4] = "Phantom1",
  [5] = "PhantomWeapon1",
  [6] = "Phantom2",
  [7] = "PhantomWeapon2"
}

function WBP_Abyss_Lineup_Detail:OnModBtnClicked()
  local ZOrder = self.LineupPage.Root:GetZOrder()
  local Target = self.ComparedTarget or self.Target
  local TabExInfos = {}
  local Uuids = {}
  local Type = "Null"
  local Tag = "Null"
  if self.LineupPage.CurDungeonPanel.DungeonIndex == self.DungeonIndex then
    Type = self.LineupPage:GetCurModType()
  end
  for EName, SlotName in ipairs(SlotOrder) do
    local Slot = self.Slots[EName]
    if Slot and not Slot.IsEmpty then
      if EName == self.LineupPage.CurSlotName then
        Tag = SlotName
        if "MeleeWeapon" == Tag then
          Tag = "Melee"
        elseif "RangedWeapon" == Tag then
          Tag = "Ranged"
        end
      end
      table.insert(Uuids, Slot.Uuid)
      if "Char" == SlotName then
        local MainChar = GWorld:GetAvatar().Chars[Slot.Uuid]
        if MainChar then
          for _, Uuid in ipairs(MainChar.UWeaponEids or {}) do
            table.insert(Uuids, Uuid)
          end
        end
      end
      if "Phantom1" == SlotName or "Phantom2" == SlotName then
        TabExInfos[Slot.Uuid] = {
          TeamIdx = self.DungeonIndex,
          Tag = SlotName
        }
      end
      if "PhantomWeapon1" == SlotName or "PhantomWeapon2" == SlotName then
        local OwnerCharUuid = self.Slots[ESlotName[string.gsub(SlotName, "Weapon", "")]].Uuid
        TabExInfos[Slot.Uuid] = {
          Tag = SlotName,
          OwnerChar = GWorld:GetAvatar().Chars[OwnerCharUuid],
          IsPhantom = true
        }
      end
    end
  end
  if "Null" == Tag then
    for EName, SlotName in ipairs(SlotOrder) do
      local Slot = self.Slots[EName]
      if Slot and not Slot.IsEmpty then
        Tag = SlotName
        if "MeleeWeapon" == Tag then
          Tag = "Melee"
        elseif "RangedWeapon" == Tag then
          Tag = "Ranged"
        end
        Type = self.LineupPage:GetModType(EName)
        break
      end
    end
  end
  local FakeReplaceChar = {
    BattleData = function()
      return {}
    end
  }
  local ModUI = ModController:OpenView(ModCommon.AbyssMod, Type, Tag, Uuids, TabExInfos, {
    Func = self.OnModClosed,
    Obj = self
  }, ModCommon.MainUICase.Normal, FakeReplaceChar)
  if ModUI then
    if "Melee" == Tag or "Ranged" == Tag then
      Tag = Tag .. "Weapon"
    end
    ModUI.List_Role:NavigateToIndex(ESlotName[Tag] - 1)
  end
end

function WBP_Abyss_Lineup_Detail:OnPreviewButtonClicked()
  if self.LineupPage then
    self.LineupPage:SelectDungeon(self.DungeonIndex, false)
  else
    DebugPrint("lhr@WBP_Abyss_Lineup_Detail:OnPreviewButtonClicked, \233\152\181\229\174\185\233\157\162\230\157\191\229\164\177\230\149\136")
  end
end

function WBP_Abyss_Lineup_Detail:OnForbiddenClicked()
  UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("Abyss_Party_ConditionsAreNot"))
end

function WBP_Abyss_Lineup_Detail:GetDesiredFocusTarget()
  return self.Slots[self.LineupPage.CurSlotName]
end

function WBP_Abyss_Lineup_Detail:OnModClosed(...)
  self.LineupPage.SetFocusTimer = self.LineupPage:AddTimer(0.4, function()
    self.LineupPage:SetFocusTarget()
  end, nil, nil, nil, true)
end

function WBP_Abyss_Lineup_Detail:ClearListenEvent()
  self.Btn_Clear:UnBindInputMethodChangedDelegate()
  self.Btn_Mod:UnBindInputMethodChangedDelegate()
end

function WBP_Abyss_Lineup_Detail:ResetListenEvent()
  self.Btn_Clear:BindInputMethodChangedDelegate()
  self.Btn_Mod:BindInputMethodChangedDelegate()
end

function WBP_Abyss_Lineup_Detail:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    for _, IconName in pairs(GamepadIcons) do
      if self[IconName] then
        self[IconName]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    end
    self.Entry_Tip.Controller_Entry:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Clear:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Clear:SetIconPanelVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_Mod:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Mod:SetIconPanelVisibility(UIConst.VisibilityOp.Collapsed)
  else
    for _, IconName in pairs(GamepadIcons) do
      if self[IconName] then
        self[IconName]:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
    self.Entry_Tip.Controller_Entry:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_Clear:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_Clear:SetIconPanelVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Mod:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_Mod:SetIconPanelVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function WBP_Abyss_Lineup_Detail:BP_GetDesiredFocusTarget()
  return self.Slots[ESlotName.Char]
end

function WBP_Abyss_Lineup_Detail:BindButtonPerformances()
  self.Btn_Preview.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Preview.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Preview.OnReleased:Add(self, self.OnBtnReleased)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Preview.OnHovered:Add(self, self.OnBtnHovered)
    self.Btn_Preview.OnUnhovered:Add(self, self.OnBtnUnhovered)
  end
end

function WBP_Abyss_Lineup_Detail:UnBindButtonPerformances()
  if not self.Btn_Preview then
    return
  end
  self.Btn_Preview.OnClicked:Clear()
  self.Btn_Preview.OnPressed:Clear()
  self.Btn_Preview.OnReleased:Clear()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Preview.OnHovered:Clear()
    self.Btn_Preview.OnUnhovered:Clear()
  end
end

function WBP_Abyss_Lineup_Detail:SwitchNormalAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function WBP_Abyss_Lineup_Detail:PlayButtonClickSound()
  AudioManager(self):PlayUISound(self, "event:/ui/activity/drama_challenge_type_select_btn_click", nil, nil)
end

function WBP_Abyss_Lineup_Detail:PlayButtonClickAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Click)
end

function WBP_Abyss_Lineup_Detail:OnBtnClicked()
  self:PlayButtonClickSound()
  self:PlayButtonClickAnimation()
  self:OnPreviewButtonClicked()
end

function WBP_Abyss_Lineup_Detail:PlayButtonPressAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function WBP_Abyss_Lineup_Detail:OnBtnPressed()
  self.IsPressing = true
  self:PlayButtonPressAnim()
end

function WBP_Abyss_Lineup_Detail:PlayButtonHoverAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Hover)
end

function WBP_Abyss_Lineup_Detail:OnBtnHovered()
  self.IsHovering = true
  self:PlayButtonHoverAnim()
end

function WBP_Abyss_Lineup_Detail:SetBtnHovered(IsHovered)
  if IsHovered then
    self:OnBtnHovered()
  else
    self:OnBtnUnhovered()
  end
end

function WBP_Abyss_Lineup_Detail:PlayButtonReleaseButHoverAnim()
  self:StopAllAnimations()
  self:PlayButtonHoverAnim()
end

function WBP_Abyss_Lineup_Detail:PlayButtonReleaseAndUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function WBP_Abyss_Lineup_Detail:OnBtnReleased()
  self.IsPressing = false
  if not self.IsHovering then
    self:PlayButtonReleaseAndUnHoverAnim()
  else
    self:PlayButtonReleaseButHoverAnim()
  end
end

function WBP_Abyss_Lineup_Detail:PlayButtonUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function WBP_Abyss_Lineup_Detail:OnBtnUnhovered()
  self.IsHovering = false
  if not self.IsPressing then
    self:PlayButtonUnHoverAnim()
  end
end

AssembleComponents(WBP_Abyss_Lineup_Detail)
return WBP_Abyss_Lineup_Detail
