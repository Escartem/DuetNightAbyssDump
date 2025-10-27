local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local Component = {}
Component.EnhanceWidgetMap = {
  [CommonConst.ArmoryType.Weapon] = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Intensify/WBP_Armory_Enhance.WBP_Armory_Enhance'"
}

function Component:InitEnhanceComp(...)
  local User, Target, SubWidget = ...
  if not SubWidget then
    self:Close()
    return
  end
  self:InitTab(GText("UI_WeaponStrength_Name") .. "/" .. GText(self.Target:GetName()))
  self.CardLevelWidget = SubWidget
  self.TargetWeapon = Target
  local Data = DataMgr.WeaponCardLevel[self.Target.WeaponId]
  self.MaxGradeLevel = Data and Data.CardLevelMax or 5
  self.MaxItemCount = self.MaxGradeLevel
  if self.bListExpand then
    self:OnExpandList(false, true)
  end
  self.Selective_Listing:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:AddDispatcher(EventID.OnUpdateBagItem, self, self.OnBagItemLockedOrUnlocked)
  self:AddDispatcher(EventID.OnAutoClaimWeaponBreakCollectReward, self, self.OnAutoClaimWeaponBreakCollectReward)
  self.Selective_Listing:SetEmptyStateText(GText("UI_WeaponStrength_NoResource"))
  self.Text_Limit:SetText(GText("UI_WeaponStrength_Max"))
  self:ShowWarning(false)
  local WidgetPath = Component.EnhanceWidgetMap[User]
  local Params = {
    Parent = self,
    Target = self.TargetWeapon,
    Type = self.CardLevelWidget.Type,
    Tag = self.CardLevelWidget.Tag
  }
  self:InitIntensify(WidgetPath, Params)
  self.IntensifyWidget:BindEvents(self, {
    OnConsumedItemChanged = self.OnChosenItemChanged,
    OnWeaponGradeLevelUp = self.RefreshListComp,
    OnEntryInitialized = self.OnEntryInitialized
  })
  self.Btn_Auto:BindEventOnClicked(self, self.OnAutoFillBtnClicked)
  self.Btn_Enhance:BindEventOnClicked(self, self.OnEnhanceBtnClicked)
  self:InitEnhanceUI()
  self:InitPanelInfo()
  self:OnChosenItemChanged(self.IntensifyWidget:GetChosenContents())
  self:RefreshListComp()
  self:SetFocus()
  self.InitTimer = self:AddTimer(0.2, function()
    self:RefreshBaseInfo()
  end)
end

function Component:InitEnhanceUI()
  self.WidgetSwitcher_Mode:SetActiveWidgetIndex(1)
  self.Btn_Auto:SetText(GText("UI_WeaponStrength_Auto"))
  self.Btn_Enhance:SetText(GText("UI_WeaponStrength_Strengthen"))
  self.Btn_Enhance:SetDefaultGamePadImg("Y")
  self.Btn_Auto:SetDefaultGamePadImg("X")
end

function Component:InitIntensify(WidgetPath, Params)
  self.VB_Node:ClearChildren()
  self:CreateIntensifyWidget(WidgetPath, Params)
end

function Component:CreateIntensifyWidget(WidgetPath, Params)
  self.IntensifyWidget = UIManager(self):CreateWidget(WidgetPath, true)
  self.VB_Node:AddChild(self.IntensifyWidget)
  if self.IntensifyWidget then
    Params = Params or {}
    Params.Parent = self
    self.IntensifyWidget:Init(Params)
    self.IntensifyWidget:PlayInAnim()
    if self.IntensifyWidget:IsVisible() then
      self.IntensifyWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    self.CurrentSubUI = self.IntensifyWidget
  end
end

function Component:UpdateAutoButtonText()
  if self.ConsumedContentsArray and #self.ConsumedContentsArray > 0 and self.IsAutoFilled then
    self.Btn_Auto:SetText(GText("UI_WeaponStrength_Clear"))
  else
    self.Btn_Auto:SetText(GText("UI_WeaponStrength_Auto"))
    self.IsAutoFilled = false
  end
end

function Component:UpdateWeaponTagIcon()
  local TargetWeapon = self.Target
  local MeleeTags, MeleeTagNames, RangedTags, RangedTagNames = UIUtils.GetAllWeaponTags()
  local WeaponTags, WeaponTagNames, WeaponTag
  if TargetWeapon:HasTag("Melee") then
    WeaponTags, WeaponTagNames = MeleeTags, MeleeTagNames
  else
    WeaponTags, WeaponTagNames = RangedTags, RangedTagNames
  end
  for _, value in ipairs(WeaponTags) do
    if TargetWeapon:HasTag(value) then
      WeaponTag = value
      break
    end
  end
  if WeaponTag then
    self.Panel_Element:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Panel_Element:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  local WeaponTagData = DataMgr.WeaponTag[WeaponTag]
  if not WeaponTagData then
    return
  end
  local IconPath = WeaponTagData.Icon or ""
  local AttributeIcon = LoadObject(IconPath)
  self.Image_Element:SetBrushResourceObject(AttributeIcon)
  self.Stats_ListView:ClearListItems()
  for idx, Tag in ipairs(WeaponTags) do
    local Data = DataMgr.WeaponTag[Tag]
    self.Stats_ListView:AddItem(self:NewWeaponTagIconContent(Data and Data.Icon, WeaponTagNames[idx], Tag == WeaponTag))
  end
end

function Component:NewWeaponTagIconContent(IconPath, TagName, IsSelected)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.Icon = IconPath or ""
  Obj.Text = GText(TagName)
  Obj.IsSelected = IsSelected
  return Obj
end

function Component:InitPanelInfo()
  self.Panel_Info:SetVisibility(UIConst.VisibilityOp.Visible)
  local TargetWeaponData = self.Target.Props
  local TargetWeaponName = DataMgr.Weapon[TargetWeaponData.WeaponId].WeaponName
  local WeaponRarity = DataMgr.Weapon[TargetWeaponData.WeaponId].WeaponRarity
  self.TextBlock_Name:SetText(GText(TargetWeaponName))
  self:UpdateWeaponTagIcon()
  self:SetStars(WeaponRarity)
end

function Component:DestructComp()
  if self.IntensifyWidget then
    self.IntensifyWidget:BindEvents(nil, nil)
  end
end

function Component:RefreshListComp()
  local Weapons = self.IntensifyWidget:GetAllWeapons()
  local CurrentWeapon = self.IntensifyWidget:GetCurrentWeapon()
  self.ContentsMap = {}
  self.ContentsArray = {}
  self.ChosenContents = {}
  for _, Weapon in pairs(Weapons) do
    local Content = ArmoryUtils:NewCharOrWeaponItemContent(Weapon, CommonConst.ArmoryType.Weapon, self.IntensifyWidget:GetWeaponTag(), true)
    Content.IsEquipped = CurrentWeapon and Weapon.Uuid == CurrentWeapon.Uuid
    Content.LevelCardNum = Weapon.GradeLevel
    self.ContentsMap[Weapon.Uuid] = Content
    table.insert(self.ContentsArray, Content)
  end
  if self.ItemDetailsContent and not self.ContentsMap[self.ItemDetailsContent.Uuid] then
    self:ShowItemDetails(false)
  end
  self:SortSelectiveList(self.ContentsArray)
  self.Selective_Listing:Init(self, {
    ItemContents = self.ContentsArray,
    SortType = CommonConst.DESC,
    OrderByDisplayNames = {
      "UI_LEVEL_SELECT"
    }
  })
end

function Component:OnChosenItemChanged(CardLevelWidgetContents)
  if self.ChosenContents then
    for key, value in pairs(self.ChosenContents) do
      value.IsSelected = false
      if value.SelfWidget then
        value.SelfWidget:SetItemSelect(false)
      end
    end
  end
  self.ChosenContents = {}
  for _, value in pairs(CardLevelWidgetContents) do
    local Content = self.ContentsMap[value.Uuid]
    if Content then
      Content.IsSelected = true
      self.ChosenContents[value.Uuid] = Content
      if Content.SelfWidget then
        Content.SelfWidget:SetItemSelect(true)
      end
    end
  end
end

function Component:CloseComp()
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain and ArmoryMain.WeaponItemContentsMap then
    local ArmoryMainContentMap = ArmoryMain.WeaponItemContentsMap
    for Uuid, _ in pairs(self.ContentsMap) do
      if ArmoryMainContentMap[Uuid] then
        ArmoryUtils:SetReddotRead(ArmoryMainContentMap[Uuid], true)
      end
    end
  end
  if self.InitTimer then
    self:RemoveTimer(self.InitTimer)
    self.InitTimer = nil
  end
end

function Component:SortSelectiveList(InOutContentArray, SortBy, SortType)
  table.sort(InOutContentArray, function(a, b)
    if SortType == CommonConst.ASC then
      return a.Level < b.Level
    else
      return a.Level > b.Level
    end
  end)
end

function Component:OnListItemClicked(Content)
  if not Content.Uuid then
    return
  end
  ArmoryUtils:SetReddotRead(Content, true)
  if self.ChosenContents[Content.Uuid] then
    self.IntensifyWidget:RemoveItem(Content)
  else
    self.IntensifyWidget:AddItemToLast(Content)
  end
  self:OnSelectedItemChanged(Content)
end

function Component:OnSelectedItemChanged(Content)
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    if not self.bItemDetailsShowed or self.ItemDetailsContent ~= Content then
      self:ShowItemDetails(true, Content)
    else
      self:ShowItemDetails(false)
    end
  end
end

function Component:OnEntryInitialized(Content, Widget)
  Widget:UpdateGrey(Content.IsEquipped)
end

function Component:OnListItemInited()
  if self.ChosenContents then
    for key, value in pairs(self.ChosenContents) do
      value.IsSelected = true
      if value.SelfWidget then
        value.SelfWidget:SetItemSelect(true)
      end
    end
  end
end

function Component:OnBackgroundClickedComp()
  if self.bItemDetailsShowed then
    self:ShowItemDetails(false)
  elseif self.bListExpand then
    self:OnExpandList(false, true)
  end
end

function Component:OnDetailLockBtnClickComp()
  self:LockOrUnlockWeapon()
end

function Component:LockOrUnlockWeapon()
  if not self.ItemDetailsContent then
    return
  end
  if self.ItemDetailsContent.IsLocked then
    local function CancelFunc()
      self:SetFocus()
    end
    
    local function ConfirmFunc()
      self:SetFocus()
      local Avatar = GWorld:GetAvatar()
      self:BlockAllUIInput(true)
      Avatar:UnLockResourceInBag(CommonConst.AllType.Weapon, self.ItemDetailsContent.Uuid)
    end
    
    UIManager(self):ShowCommonPopupUI(100019, {
      LeftCallbackFunction = CancelFunc,
      RightCallbackFunction = ConfirmFunc,
      CloseBtnCallbackFunction = CancelFunc
    }, self)
  else
    self:BlockAllUIInput(true)
    local Avatar = GWorld:GetAvatar()
    Avatar:LockResourceInBag(CommonConst.AllType.Weapon, self.ItemDetailsContent.Uuid)
  end
end

function Component:OnBagItemLockedOrUnlocked(OpAction, ErrCode, ...)
  self:BlockAllUIInput(false)
  if not ErrorCode:Check(ErrCode) then
    return
  end
  if "StateChange" == OpAction then
    self.ItemDetailsContent.IsLocked = not self.ItemDetailsContent.IsLocked
    if self.ItemDetailsContent.SelfWidget then
      if self.ItemDetailsContent.IsLocked then
        self.ItemDetailsContent.SelfWidget:SetLock(1)
        self.ItemDetailsContent.LockType = 1
      else
        self.ItemDetailsContent.SelfWidget:SetLock(0)
        self.ItemDetailsContent.LockType = 0
      end
    end
    if self.ItemDetailsWidget then
      if self.ItemDetailsContent.IsLocked then
        self.ItemDetailsWidget.Switcher_Lock:SetActiveWidgetIndex(0)
      else
        self.ItemDetailsWidget.Switcher_Lock:SetActiveWidgetIndex(1)
      end
    end
  end
end

function Component:OnAutoFillBtnClicked()
  if self.IsAutoFilled then
    self.ConsumedContentsMap = {}
    self.ConsumedContentsArray = {}
    self.IntensifyWidget.IsPreviewMode = false
    self.IntensifyWidget:UpdateConsumedItems({})
    self.IsAutoFilled = false
    self:UpdateAutoButtonText()
    self:OnChosenItemChanged({})
    self:RefreshListComp()
    return
  end
  if self.Tag == CommonConst.ArmoryTag.Melee then
    AudioManager(self):PlayUISound(self, "event:/ui/armory/click_select_weapon", nil, nil)
  else
    AudioManager(self):PlayUISound(self, "event:/ui/armory/click_select_gun", nil, nil)
  end
  local KeepNums = {}
  for i = 1, self.MaxGradeLevel + 1 do
    table.insert(KeepNums, 0)
  end
  local AllWeapons = self.IntensifyWidget:GetAllWeapons()
  local CurrentWeapon = self:GetCurrentWeapon()
  local InArr = {}
  for _, value in pairs(AllWeapons) do
    local Level = value.GradeLevel + 1
    if (KeepNums[Level] + 1) * Level <= self.MaxGradeLevel and not value:IsLock() and value ~= CurrentWeapon then
      KeepNums[Level] = KeepNums[Level] + 1
      table.insert(InArr, value)
    end
  end
  if #InArr <= 0 then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Toast_WeaponStrength_NoAuto"))
    return
  end
  table.sort(InArr, function(a, b)
    return a.GradeLevel > b.GradeLevel
  end)
  self.MaxValidGradeLevel = 0
  self.OptimalSolutionWeapons = {}
  self.ConsumedContentsMap = {}
  self.ConsumedContentsArray = {}
  self:DfsCalcConsumedItems(InArr, 1, {}, self.TargetWeapon.GradeLevel)
  for _, Weapon in ipairs(self.OptimalSolutionWeapons) do
    local Obj = ArmoryUtils:NewCharOrWeaponItemContent(Weapon, self.SubWidget.Type, self.SubWidget.Tag)
    Obj.Parent = self
    Obj.IsNew = false
    Obj.bMinus = true
    Obj.OnMouseButtonDownEvent = {
      Obj = self,
      Callback = function()
        self.IntensifyWidget:OnListItemMouseDown(Obj)
      end,
      Params = Obj
    }
    Obj.OnMouseButtonUpEvents = {
      Obj = self,
      Callback = function()
        self.IntensifyWidget:OnListItemMouseUp(Obj)
      end,
      Params = Obj
    }
    Obj.bSyncLoadIcon = true
    table.insert(self.ConsumedContentsArray, Obj)
    self.ConsumedContentsMap[Weapon.Uuid] = Obj
  end
  self.IntensifyWidget.IsPreviewMode = true
  self.IntensifyWidget:UpdateConsumedItems(self.ConsumedContentsArray)
  self.IsAutoFilled = true
  self:OnChosenItemChanged(self.ConsumedContentsArray)
  self:UpdateAutoButtonText()
end

function Component:DfsCalcConsumedItems(InArr, InArrIdx, TempArr, StartLevel)
  if StartLevel > self.MaxGradeLevel then
    return false
  end
  if StartLevel == self.MaxGradeLevel then
    self.MaxValidGradeLevel = StartLevel
    self.OptimalSolutionWeapons = {}
    for _, value in ipairs(TempArr) do
      table.insert(self.OptimalSolutionWeapons, value)
    end
    return true
  end
  if InArrIdx > #InArr then
    if StartLevel > self.MaxValidGradeLevel then
      self.MaxValidGradeLevel = StartLevel
      self.OptimalSolutionWeapons = {}
      for _, value in ipairs(TempArr) do
        table.insert(self.OptimalSolutionWeapons, value)
      end
    end
    return false
  end
  table.insert(TempArr, InArr[InArrIdx])
  if self:DfsCalcConsumedItems(InArr, InArrIdx + 1, TempArr, InArr[InArrIdx].GradeLevel + 1 + StartLevel) then
    return true
  else
    table.remove(TempArr, #TempArr)
    return self:DfsCalcConsumedItems(InArr, InArrIdx + 1, TempArr, StartLevel)
  end
end

function Component:OnEnhanceBtnClicked()
  if not self.ConsumedContentsMap or not next(self.ConsumedContentsMap) then
    return
  end
  local Avatar = GWorld:GetAvatar()
  self.TargetWeapon = Avatar.Weapons[self.TargetWeapon.Uuid]
  local bChosenWeaponHasAssisterId = false
  local bChosenWeaponHasLvup = false
  local PreviewLevel = self.TargetWeapon.GradeLevel
  local ConsumeWeaponUuids = {}
  for _, value in pairs(self.ConsumedContentsMap) do
    table.insert(ConsumeWeaponUuids, value.Uuid)
    local Weapon = Avatar.Weapons[value.Uuid]
    bChosenWeaponHasAssisterId = bChosenWeaponHasAssisterId or Weapon.AssisterId and 0 ~= Weapon.AssisterId
    bChosenWeaponHasLvup = bChosenWeaponHasLvup or Weapon.Level > 1
    PreviewLevel = PreviewLevel + Weapon.GradeLevel + 1
  end
  local Params = {
    RightCallbackFunction = function()
      local function Callback(Ret)
        if Ret == ErrorCode.RET_SUCCESS then
        else
          self:BlockAllUIInput(false)
        end
      end
      
      self:BlockAllUIInput(true)
      Avatar:UpWeaponGradeLevel(self.TargetWeapon.Uuid, self.TargetWeapon.GradeLevel, ConsumeWeaponUuids, Callback)
    end
  }
  local OverflowLevel = PreviewLevel - self.MaxGradeLevel
  if OverflowLevel > 0 then
    Params.ShortText = string.format(GText("UI_WeaponCardLevel_Popup_Overflow"), OverflowLevel)
  elseif bChosenWeaponHasAssisterId then
    Params.ShortText = GText("UI_WeaponCardLevel_Popup_Equiped")
  elseif PreviewLevel > self.TargetWeapon.GradeLevel + #ConsumeWeaponUuids then
    Params.ShortText = string.format(GText("UI_WeaponCardLevel_Popup_HaveMax"), PreviewLevel)
  elseif bChosenWeaponHasLvup then
    Params.ShortText = GText("UI_WeaponCardLevel_Popup_HaveUpgraded")
  else
    Params.ShortText = GText("UI_WeaponCardLevel_Popup_Normal")
  end
  UIManager(self):ShowCommonPopupUI(100089, Params, self)
end

function Component:OnAutoClaimWeaponBreakCollectReward()
  local Params = {
    ShortText = string.format(GText("UI_Weapon_BreakRewardAutoCollect"), self.Target:GetName())
  }
  UIManager(self):ShowCommonPopupUI(100260, Params, self)
end

function Component:UpdateConsumedContents()
  if self.IsAutoFilled then
    self.IsAutoFilled = false
  end
  self:RefreshListComp()
  self.ConsumedContentsMap = {}
  self.ConsumedContentsArray = {}
  self.IntensifyWidget:UpdateConsumedItems({})
end

function Component:GetAllWeapons()
  return self.SubWidget.AllWeapons
end

function Component:GetWeaponTag()
  return self.SubWidget.Tag
end

function Component:GetChosenContents()
  return self.SubWidget.ConsumedContentsArray
end

function Component:GetCurrentWeapon()
  return self.SubWidget.CurrentPlayerWeapon
end

function Component:RefreshOpInfoByInputDeviceComp(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = CurInputDevice
  if CurInputDevice == ECommonInputType.Gamepad then
    self:ReNavigateToListItem()
    local Item = self.Selective_Listing.TileView_Select_Role:GetItemAt(0)
    self.Selective_Listing.Common_Sort_List.Btn_Filter_List:SetNavigationRuleExplicit(EUINavigation.Up, Item)
    for i = 1, 5 do
      local Item = self.CurrentSubUI["Item_" .. i]
      if Item then
        Item:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
        Item:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
      end
    end
    self:ShowCheckBtn(false)
    self:ShowChooseBtn(true)
  end
end

function Component:OnFocusReceivedComp(MyGeometry, InFocusEvent)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:ReNavigateToListItem()
  end
end

function Component:ReNavigateToListItem()
  if self.bListExpand then
    if self.Selective_Listing.TileView_Select_Role:GetNumItems() > 0 then
      local SelectedItem = self.Selective_Listing.TileView_Select_Role:BP_GetSelectedItem()
      if SelectedItem then
        self.Selective_Listing.TileView_Select_Role:BP_NavigateToItem(SelectedItem)
      else
        self.Selective_Listing.TileView_Select_Role:NavigateToIndex(0)
      end
    else
      self.CurrentSubUI.Item_1:SetFocus()
    end
  else
    self.CurrentSubUI.Item_1:SetFocus()
  end
end

function Component:OnKeyDownComp(MyGeometry, InKeyName)
  if InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    self.Btn_Auto:OnBtnClicked()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    self.Btn_Enhance:OnBtnClicked()
  elseif InKeyName == UIConst.GamePadKey.LeftThumb then
    self.Selective_Listing.Common_Sort_List.Btn_Filter_List:SetFocus()
  end
end

return Component
