require("UnLua")
local WBP_ModArchive_Recommend_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.DelayFrameComponent"
})

function WBP_ModArchive_Recommend_C:Construct()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
end

function WBP_ModArchive_Recommend_C:OnSelected(Params)
  if Params then
    self.Owner = Params.Owner
  end
  self:SetFocus()
  self.HasSelected = true
  self.Avatar = GWorld:GetAvatar()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
  if self.CurInputDeviceType == ECommonInputType.GamePad then
    self.Owner:SwitchComKeyTipsState(3)
  else
    self.Owner:SwitchComKeyTipsState(1)
  end
  self.Recommends = DataMgr.ModGuideBookBuild
  self:SetVisibility(ESlateVisibility.Visibility)
  self.Avatar = GWorld:GetAvatar()
  self:SortRecommends()
  self:CheckHasMod()
  self:InitTab()
end

function WBP_ModArchive_Recommend_C:InitTab()
  local Tabs = {}
  for i, v in ipairs(DataMgr.ModGuideBookBuildTab) do
    local Tab = {
      Text = GText(v.Name),
      Idx = i
    }
    table.insert(Tabs, Tab)
  end
  local ConfigData = {
    Owner = self,
    ChildWidgetName = "TabSubTextItem",
    Tabs = Tabs,
    SoundFuncReceiver = self,
    SoundFunc = self.TabClickSoundFunc
  }
  self.RecommendTab:Init(ConfigData)
  self.RecommendTab:BindEventOnTabSelected(self, self.OnTabSelected)
  self.RecommendTab:SelectTab(1)
  self.TabNum = #Tabs
end

function WBP_ModArchive_Recommend_C:SortRecommends()
  self.Keys = {}
  for BuildId, _ in pairs(self.Recommends) do
    table.insert(self.Keys, BuildId)
  end
  
  local function SortFunc(a, b)
    local RecommendInfoA = self.Recommends[a]
    local aInfo = {}
    aInfo.Id = RecommendInfoA.BuildId
    aInfo.HasThis = false
    if RecommendInfoA.TargetType == "Char" then
      local Info = DataMgr.Char[RecommendInfoA.TargetId]
      aInfo.Rarity = Info.CharRarity
      for _, Char in pairs(self.Avatar.Chars) do
        if Char.CharId == RecommendInfoA.TargetId then
          aInfo.HasThis = true
          break
        end
      end
    elseif RecommendInfoA.TargetType == "Weapon" then
      local Info = DataMgr.Weapon[RecommendInfoA.TargetId]
      aInfo.Rarity = Info.WeaponRarity
      for _, Weapon in pairs(self.Avatar.Weapons) do
        if Weapon.WeaponId == RecommendInfoA.TargetId then
          aInfo.HasThis = true
          break
        end
      end
    end
    local RecommendInfoB = self.Recommends[b]
    local bInfo = {}
    bInfo.Id = RecommendInfoB.BuildId
    bInfo.HasThis = false
    if RecommendInfoB.TargetType == "Char" then
      local Info = DataMgr.Char[RecommendInfoB.TargetId]
      bInfo.Rarity = Info.CharRarity
      for _, Char in pairs(self.Avatar.Chars) do
        if Char.CharId == RecommendInfoB.TargetId then
          bInfo.HasThis = true
          break
        end
      end
    elseif RecommendInfoB.TargetType == "Weapon" then
      local Info = DataMgr.Weapon[RecommendInfoB.TargetId]
      bInfo.Rarity = Info.WeaponRarity
      for _, Weapon in pairs(self.Avatar.Weapons) do
        if Weapon.WeaponId == RecommendInfoB.TargetId then
          bInfo.HasThis = true
          break
        end
      end
    end
    if aInfo.HasThis ~= bInfo.HasThis then
      return aInfo.HasThis
    end
    if aInfo.Rarity ~= bInfo.Rarity then
      return aInfo.Rarity > bInfo.Rarity
    end
    if aInfo.Id ~= bInfo.Id then
      return aInfo.Id < bInfo.Id
    end
  end
  
  table.sort(self.Keys, SortFunc)
end

function WBP_ModArchive_Recommend_C:OnTabSelected(Idx)
  self.FirstSelected = true
  local NextTab = self.RecommendTab:GetCurrentTabIndex()
  self.CurTab = NextTab
  self:InitRecommends()
end

function WBP_ModArchive_Recommend_C:InitRecommends()
  self.List_Recommend:ClearListItems()
  local Index = 0
  for k, v in ipairs(self.Keys) do
    local RecommendInfo = self.Recommends[v]
    if RecommendInfo.TabId == self.CurTab then
      local HasThis = false
      if RecommendInfo.TargetType == "Char" then
        for _, Char in pairs(self.Avatar.Chars) do
          if Char.CharId == RecommendInfo.TargetId then
            HasThis = true
            break
          end
        end
      elseif RecommendInfo.TargetType == "Weapon" then
        for _, Weapon in pairs(self.Avatar.Weapons) do
          if Weapon.WeaponId == RecommendInfo.TargetId then
            HasThis = true
            break
          end
        end
      end
      if HasThis then
        Index = Index + 1
        local Content = NewObject(UIUtils.GetCommonItemContentClass())
        Content.Owner = self
        Content.Index = Index
        Content.TargetType = RecommendInfo.TargetType
        Content.TargetId = RecommendInfo.TargetId
        Content.ModList = RecommendInfo.ModList
        Content.DesList = RecommendInfo.DesList
        Content.InterfaceJumpId = RecommendInfo.InterfaceJumpId
        self.List_Recommend:AddItem(Content)
      end
    end
  end
  self.Widgets = {}
  self.List_Recommend:NavigateToIndex(0)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:AddDelayFrameFunc(function()
      if self.Widgets and self.Widgets[1] then
        self.Widgets[1]:SetFocus()
        self.CurWidget = self.Widgets[1]
        self.List_Recommend:SetSelectedIndex(0)
        self.CurWidget:SetGamepadBtnState(true)
      end
    end, 5, "SelectFirstTab")
  end
end

function WBP_ModArchive_Recommend_C:UpdateListWidgets(Widget)
  self.Widgets[Widget.Info.Index] = Widget
end

function WBP_ModArchive_Recommend_C:CheckHasMod()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.ModStates = {}
  for i, v in pairs(self.Recommends) do
    local ModList = v.ModList
    for k = 1, #ModList do
      self.ModStates[ModList[k]] = false
    end
  end
  for _, Mod in pairs(Avatar.Mods) do
    if false == self.ModStates[Mod.ModId] then
      self.ModStates[Mod.ModId] = true
    end
  end
end

function WBP_ModArchive_Recommend_C:RefreshInfo()
  self:SetFocus()
  self:InitRecommends()
end

function WBP_ModArchive_Recommend_C:OnSelectionChanged(Item, IsSelected)
  if Item and Item.SelfWidget and self.CurWidget and Item.SelfWidget ~= self.CurWidget then
    DebugPrint("zwjkjkjk OnSelectionChanged", Item.SelfWidget:GetName())
    self.CurWidget:OnDeSelected()
    self.CurWidget = Item.SelfWidget
  end
end

function WBP_ModArchive_Recommend_C:TabClickSoundFunc()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_03", nil, nil)
end

function WBP_ModArchive_Recommend_C:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    DebugPrint("zwk    Key_IsGamepadKey", InKeyName)
    IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
  else
    DebugPrint("zwk    Key_IsPC", InKeyName)
    IsEventHandled = self:Handle_OnPCDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_ModArchive_Recommend_C:Handle_OnPCDown(InKeyName)
  if "A" == InKeyName then
    self.RecommendTab:TabToLeft()
    return true
  elseif "D" == InKeyName then
    self.RecommendTab:TabToRight()
    return true
  end
  return false
end

function WBP_ModArchive_Recommend_C:Handle_OnGamePadDown(InKeyName)
  DebugPrint("zwkkk  Handle_OnGamePadDown", InKeyName, self:GetName())
  if "Gamepad_DPad_Up" == InKeyName or "Gamepad_LeftStick_Up" == InKeyName then
    return true
  elseif "Gamepad_RightThumbstick" == InKeyName then
    return true
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    return true
  elseif "Gamepad_LeftTrigger" == InKeyName then
    self.RecommendTab:TabToLeft()
    return true
  elseif "Gamepad_RightTrigger" == InKeyName then
    self.RecommendTab:TabToRight()
    return true
  end
  return false
end

function WBP_ModArchive_Recommend_C:OnGamepadReturnKeyDown(Index)
  DebugPrint("123123321 OnGamepadReturnKeyDown")
  if not self.SelectingModItem then
    self.Owner:OnClose()
  end
  self.List_Recommend:SetFocus()
  self.List_Recommend:SetSelectedIndex(Index - 1)
  if self.Owner then
    self.Owner:HideTabKey(false)
    self.Owner:SwitchComKeyTipsState(3)
  end
  local Item = self.List_Recommend:BP_GetSelectedItem()
  if Item and Item.SelfWidget then
    Item.SelfWidget:SetGamepadBtnState(true)
    Item.SelfWidget:SetFocus()
  end
  self.SelectingModItem = false
end

function WBP_ModArchive_Recommend_C:OnGamepadEnterKeyDown()
  DebugPrint("123123321 OnGamepadEnterKeyDown")
  if self.Owner then
    self.Owner:HideTabKey(true)
    self.Owner:SwitchComKeyTipsState(2)
  end
  local Item = self.List_Recommend:BP_GetSelectedItem()
  if not Item or Item.SelfWidget then
  end
  self.SelectingModItem = true
end

function WBP_ModArchive_Recommend_C:OnMenuOpenChanged(bIsOpen)
  if not self.Owner then
    return
  end
  if self.CurInputDeviceType ~= ECommonInputType.GamePad then
    return
  end
  self.Owner:OnTipsOpenChanged(bIsOpen)
  if not bIsOpen then
    self.Owner:HideTabKey(true)
    self.Owner:SwitchComKeyTipsState(2)
  end
  if bIsOpen then
    self.RecommendTab.Key_Left:SetVisibility(ESlateVisibility.Hidden)
    self.RecommendTab.Key_Right:SetVisibility(ESlateVisibility.Hidden)
  else
    self.RecommendTab.Key_Left:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.RecommendTab.Key_Right:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_ModArchive_Recommend_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("zwkkk   RefreshOpInfoByInputDevice ", CurInputDevice, CurGamepadName, self:GetName())
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
end

return WBP_ModArchive_Recommend_C
