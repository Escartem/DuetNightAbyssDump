local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local UpgradeUtils = require("Utils.UpgradeUtils")
local WeaponModel = require("BluePrints.Common.MVC.Model.WeaponModel")
local M = {}

function M:ComponentInitDispatcher()
  self:AddDispatcher(EventID.OnWeaponLevelUp, self, self.OnWeaponUpgraded)
  self:AddDispatcher(EventID.OnWeaponBreakLevelUp, self, self.OnWeaponUpgraded)
  self:AddDispatcher(EventID.OnWeaponGradeLevelUp, self, self.OnWeaponGradeLevelUp)
  self:AddDispatcher(EventID.OnWeaponColorsChanged, self, self.OnWeaponColorsChanged)
  self:AddDispatcher(EventID.OnSwitchWeapon, self, self.OnSwitchWeapon)
  self:AddDispatcher(EventID.OnNewWeaponObtained, self, self.OnNewWeaponObtained)
  self:AddDispatcher(EventID.OnWeaponDeleted, self, self.OnWeaponDeleted)
  self:AddDispatcher(EventID.OnWeaponRewardStateChanged, self, self.OnWeaponRewardStateChanged)
end

function M:Construct()
  self.AllWeaponMainTabNames = {
    ArmoryUtils.ArmoryMainTabNames.Melee,
    ArmoryUtils.ArmoryMainTabNames.Ranged,
    ArmoryUtils.ArmoryMainTabNames.Weapon
  }
  self.WeaponMainFuncName = {
    "Main_InitSubUI",
    "Main_InitKeySetting",
    "Main_OnRoleListItemClicked",
    "Main_SelectRoleListItem",
    "Main_Close",
    "Main_UpdateResourceInfos",
    "Main_PreSubTabChange",
    "Main_PreMainTabChange",
    "Main_OnLockBtnClicked",
    "Main_OnBagItemLockedOrUnlocked",
    "Main_OnBtnIntensifyClicked",
    "Main_OnTableKeyDown",
    "Main_OnTableKeyUp",
    "Main_OnArmoryModClosed",
    "Main_OnUKeyDown",
    "Main_ReceiveEnterState",
    "Main_SetAllReddotRead",
    "Main_UpdateBoxReddot",
    "Main_CreateItemContents",
    "Main_SortItemContents",
    "Main_PreprocessContents",
    "Main_OnLeftThumbstickKeyDown",
    "Main_OnLeftThumbstickKeyUp",
    "Main_OnViewKeyDown",
    "Main_InitRoleList",
    "Main_OnFocusReceived",
    "Main_OnLockKeyDown",
    "Main_UpdateGamepadStyle",
    "Main_JumpToSubPage",
    "Main_OnArmoryTargetStateChanged"
  }
  local WeaponTag = {
    CommonConst.ArmoryTag.Melee,
    CommonConst.ArmoryTag.Ranged
  }
  for _, Tag in pairs(WeaponTag) do
    for _, FuncName in pairs(self.WeaponMainFuncName) do
      self[Tag .. FuncName] = self["Weapon" .. FuncName]
    end
  end
end

function M:MeleeMain_Init()
  self.WeaponTag = CommonConst.ArmoryTag.Melee
  self:WeaponMain_Init()
end

function M:RangedMain_Init()
  self.WeaponTag = CommonConst.ArmoryTag.Ranged
  self:WeaponMain_Init()
end

function M:UWeaponMain_Init()
  self.WeaponTag = CommonConst.ArmoryTag.UWeapon
  self:WeaponMain_Init()
end

function M:CreateMainTabs()
  self:ComponentRegisterUWeaponFunctions()
end

function M:ComponentRegisterUWeaponFunctions()
  for _, Tab in pairs(self.MainTabs) do
    if string.find(Tab.Name, CommonConst.ArmoryTag.UWeapon) then
      for _, FuncName in pairs(self.WeaponMainFuncName) do
        self[Tab.Name .. FuncName] = self["Weapon" .. FuncName]
      end
      self[Tab.Name .. "Main_Init"] = self.UWeaponMain_Init
    end
  end
end

function M:WeaponMain_OnArmoryTargetStateChanged(NewAvatar)
  local _, Weapon = next(NewAvatar.Weapons)
  if nil == Weapon then
    _, Weapon = next(NewAvatar.UWeapons)
  end
  if self.IsPreviewMode or Weapon.WeaponId ~= self[self.ComparedWeaponName].WeaponId then
    return
  end
  self[self.CmpContentName].Target = Weapon
  local CmpContent = self[self.CmpContentName]
  CmpContent.GradeLevel = Weapon.GradeLevel
  CmpContent.LevelCardNum = Weapon.GradeLevel
  CmpContent.Avatar = NewAvatar
  if self.WeaponTag == CommonConst.ArmoryTag.UWeapon then
    self:CharMain_OnArmoryTargetStateChanged(NewAvatar)
    self[self.ComparedWeaponName] = Weapon
    self:UpdateWeaponInfos()
    self:CreateAndSelectSubTab()
  else
    self[self.CmpContentName] = nil
    self:WeaponMain_OnRoleListItemClicked(CmpContent)
  end
end

function M:WeaponMain_Init()
  self.Panel_SubTab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Edit:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:UpdateWeaponTag()
  self:SwitchContentsArray()
  if not self.WeaponItemContentsArray then
    self:WeaponMain_PreprocessContents(self.WeaponTag)
  end
  if self.WeaponTag == CommonConst.ArmoryTag.UWeapon then
    self:UpdateWeaponInfos()
    self:CreateAndSelectSubTab()
  else
    self:InitRoleList()
    self:SelectRoleListItem(self[self.CmpContentName])
  end
  self:PlayAnimation(self.RoleList_In)
  self:UpdateBoxReddot()
end

function M:WeaponMain_JumpToSubPage(SubPageName)
  if not SubPageName or not IsValid(self.CurrentSubUI) then
    return
  end
  if SubPageName == ArmoryUtils.ArmorySubPageName.Mod and self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Attribute then
    self.CurrentSubUI:OnModBtnClicked()
  end
end

function M:UpdateWeaponTag(Type)
  self.WeaponTag = self.WeaponTag or Type or "Weapon"
  self.CurrentWeaponName = "Current" .. self.WeaponTag
  self.ComparedWeaponName = "Compared" .. self.WeaponTag
  self.CurContentName = self.WeaponTag .. "Main_CurContent"
  self.CmpContentName = self.WeaponTag .. "Main_CmpContent"
end

function M:WeaponMain_PreprocessContents(Type, PreprocessParams)
  PreprocessParams = PreprocessParams or {}
  local Uuid = PreprocessParams.SelectedTargetUuid
  local Id = PreprocessParams.SelectedTargetId
  local Index = PreprocessParams.SelectedTargetIndex
  self:UpdateWeaponTag(Type)
  local Avatar = ArmoryUtils:GetAvatar()
  if self.WeaponTag == CommonConst.ArmoryTag.UWeapon then
    local _Avatar, AvatarPrime, AvatarMax
    local CharContent = self.CharMain_CmpContent
    if CharContent then
      _Avatar, AvatarPrime, AvatarMax = CharContent.Avatar, CharContent.AvatarPrime, CharContent.AvatarMax
      Avatar = _Avatar or Avatar
    end
    local UWeaponUuid = self.ComparedChar.UWeaponEids[self.CurMainTab.TabData.UWeaponIdx]
    self[self.CurrentWeaponName] = Avatar.UWeapons[UWeaponUuid]
    self[self.ComparedWeaponName] = self[self.CurrentWeaponName]
    self[self.CurContentName] = {
      Type = CommonConst.ArmoryType.Weapon,
      Tag = CommonConst.ArmoryTag.UWeapon,
      Avatar = _Avatar,
      AvatarPrime = AvatarPrime,
      AvatarMax = AvatarMax
    }
    self[self.CmpContentName] = self[self.CurContentName]
  else
    self:SwitchContentsArray()
    if not self.WeaponItemContentsMap or self.bRecreateContent then
      self:WeaponMain_CreateItemContents()
      self:SwitchContentsArray()
    end
    local ContentArray = self.WeaponItemContentsArray
    local Avatar = ArmoryUtils:GetAvatar()
    if Uuid then
      self[self.ComparedWeaponName] = Avatar.Weapons[Uuid]
    elseif Id then
      for _, value in ipairs(ContentArray) do
        if value.UnitId == Id then
          self[self.ComparedWeaponName] = Avatar.Weapons[value.Uuid] or value.Target
        end
      end
    elseif Index then
      local Content = ContentArray[Index]
      if Content then
        self[self.ComparedWeaponName] = Avatar.Weapons[Content.Uuid] or Content.Target
      end
    end
    local CurrentWeaponUuid = Avatar[self.WeaponTag .. "Weapon"]
    if CurrentWeaponUuid and self.WeaponItemContentsMap[CurrentWeaponUuid] then
      self[self.CurrentWeaponName] = Avatar.Weapons[CurrentWeaponUuid]
    end
    self[self.ComparedWeaponName] = self[self.ComparedWeaponName] or self[self.CurrentWeaponName]
    local CmpWeapon = self[self.ComparedWeaponName]
    if CmpWeapon then
      self[self.ComparedWeaponName] = Avatar.Weapons[CmpWeapon.Uuid] or CmpWeapon
    end
    if self[self.CurrentWeaponName] then
      self:WeaponMain_InitContentState()
      self:WeaponMain_SortItemContents()
    else
      self:WeaponMain_SortItemContents()
      self:WeaponMain_InitContentState()
    end
    CmpWeapon = self[self.ComparedWeaponName]
    if CmpWeapon then
      local CmpContent = self.WeaponItemContentsMap[CmpWeapon.Uuid]
      if CmpContent then
        self[self.ComparedWeaponName] = Avatar.Weapons[CmpWeapon.Uuid] or CmpContent.Target
      else
        self[self.ComparedWeaponName] = nil
      end
      CmpWeapon = self[self.ComparedWeaponName]
      CmpContent = CmpWeapon and self.WeaponItemContentsMap[CmpWeapon.Uuid]
      if CmpContent then
        self[self.ComparedWeaponName] = Avatar.Weapons[CmpWeapon.Uuid] or CmpContent.Target
      else
        self[self.ComparedWeaponName] = nil
      end
    end
    if not self[self.ComparedWeaponName] and ContentArray[1] then
      self[self.ComparedWeaponName] = Avatar[self.WeaponTag .. "Weapon"][ContentArray[1].Uuid] or ContentArray[1].Target
    end
    self:WeaponMain_InitContentState()
  end
end

function M:SwitchContentsArray()
  self.WeaponItemContentsMap = self[self.WeaponTag .. "ItemContentsMap"]
  self.WeaponItemContentsArray = self[self.WeaponTag .. "ItemContentsArray"]
  self.BP_WeaponItemContents = self["BP_" .. self.WeaponTag .. "ItemContents"]
  self.UnownedWeaponContentMap = self[self.WeaponTag .. "UnownedWeaponContentMap"]
  self.WeaponId2Contents = self[self.WeaponTag .. "WeaponId2Contents"]
end

function M:WeaponMain_InitSubUI()
  local Target = self[self.ComparedWeaponName]
  local IsTargetUnowned = ArmoryUtils:GetWeaponByUuid(Target.Uuid) == nil
  local Params = {
    Target = Target,
    Char = self.ComparedChar,
    Type = self[self.CmpContentName].Type,
    Tag = self[self.CmpContentName].Tag,
    IsTargetUnowned = IsTargetUnowned
  }
  if self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Attribute then
    Params.ModSuitIndex = self.Params.ModSuitIndex
    Params.AvatarPrime = self[self.CmpContentName].AvatarPrime
    Params.AvatarMax = self[self.CmpContentName].AvatarMax
  end
  self:DefaultInitSubUI(Params)
  if self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Attribute then
    self:WeaponMain_InitSubUI_Attribute()
  end
end

function M:WeaponMain_ReceiveEnterState()
  self:ResetWeaponData()
  if self.CurSubTab.Name ~= ArmoryUtils.ArmorySubTabNames.Grade then
    self:InitSubUI()
  end
  self:UpdateSubTabReddotByName(ArmoryUtils.ArmorySubTabNames.Grade)
end

function M:WeaponMain_InitSubUI_Attribute()
  if self.CurrentSubUI then
    self.CurrentSubUI:BindEvents(self, {
      OnBtnIntensifyClicked = self.WeaponMain_OnBtnIntensifyClicked,
      OnBtnReplaceClicked = self.WeaponMain_OnBtnReplaceClicked,
      OnForbiddenBtnIntensifyClicked = self.WeaponMain_OnForbiddenBtnIntensifyClicked,
      OnForbiddenBtnReplaceClicked = self.WeaponMain_OnForbiddenBtnReplaceClicked
    })
  end
  self:WeaponMain_UpdatAttributeButton()
end

function M:Component_BeforeClose()
  self:RemoveDispatcher(EventID.OnSwitchWeapon)
end

function M:WeaponMain_UpdatAttributeButton()
  if self.CurSubTab.Name ~= ArmoryUtils.ArmorySubTabNames.Attribute then
    return
  end
  self.AttributeButtonStyleParams = {
    {},
    {}
  }
  if string.find(self.CurMainTab.Name, ArmoryUtils.ArmoryMainTabNames.UWeapon) then
    self.AttributeButtonStyleParams[1].Visibility = UIConst.VisibilityOp.Collapsed
    self.AttributeButtonStyleParams[2].Visibility = UIConst.VisibilityOp.Collapsed
    if self.CurrentChar == self.ComparedChar then
      self.CurrentSubUI:SetOpenModParams(nil)
    else
      self.CurrentSubUI:SetOpenModParams({
        CharUuid = self.ComparedChar.Uuid
      })
    end
  else
    local TargetTable = DataMgr.Weapon
    if self[self.ComparedWeaponName].Level >= TargetTable[self[self.ComparedWeaponName].WeaponId].WeaponMaxLevel then
      self.AttributeButtonStyleParams[1].Text = GText("Max_Level_Achieved")
      self.AttributeButtonStyleParams[1].ForbidBtn = true
    else
      local MaxLevel = UpgradeUtils.GetMaxLevel(self[self.ComparedWeaponName], CommonConst.ArmoryType.Weapon)
      if MaxLevel <= self[self.ComparedWeaponName].Level then
        self.AttributeButtonStyleParams[1].Text = GText("UI_FUNC_BREAKLEVELUP")
      else
        self.AttributeButtonStyleParams[1].Text = GText("UI_FUNC_LEVELUP")
      end
      self.AttributeButtonStyleParams[1].ForbidBtn = false
    end
    self.AttributeButtonStyleParams[1].Visibility = UIConst.VisibilityOp.SelfHitTestInvisible
    self.AttributeButtonStyleParams[2].Visibility = UIConst.VisibilityOp.SelfHitTestInvisible
    if self[self.CurContentName] == self[self.CmpContentName] then
      self.AttributeButtonStyleParams[2].Text = GText("UI_Bag_Equipped")
      self.AttributeButtonStyleParams[2].ForbidBtn = true
    else
      self.AttributeButtonStyleParams[2].Text = GText("UI_Armory_Weapon_Equipe")
      self.AttributeButtonStyleParams[2].ForbidBtn = false
    end
    if self.CurrentChar == self.ComparedChar then
      if self[self.CurContentName] == self[self.CmpContentName] then
        self.CurrentSubUI:SetOpenModParams(nil)
      else
        self.CurrentSubUI:SetOpenModParams({
          [self[self.CmpContentName].Tag .. "Uuid"] = self[self.CmpContentName].Uuid
        })
      end
    else
      self.CurrentSubUI:SetOpenModParams({
        [self[self.CmpContentName].Tag .. "Uuid"] = self[self.CmpContentName].Uuid
      })
    end
  end
  if self.Params.bHideDeployBtn then
    self.AttributeButtonStyleParams[2].Visibility = UIConst.VisibilityOp.Collapsed
  end
  self.CurrentSubUI:UpdateButtonStyle(self.AttributeButtonStyleParams)
end

function M:UpdateWeaponInfos()
  local Data
  self.Stats:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.WeaponTag == ArmoryUtils.ArmoryMainTabNames.UWeapon then
    Data = DataMgr.UWeapon[self[self.ComparedWeaponName].WeaponId]
    self.Tab_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.EMListView_SubTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Panel_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    Data = DataMgr.Weapon[self[self.ComparedWeaponName].WeaponId]
    self.Tab_L:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    if self.IsPreviewMode or not self[self.CmpContentName].IsOwned then
      self.Panel_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Panel_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      if self[self.ComparedWeaponName].IsLock and self[self.ComparedWeaponName]:IsLock() then
        self.Switcher_Lock:SetActiveWidgetIndex(0)
      else
        self.Switcher_Lock:SetActiveWidgetIndex(1)
      end
    end
  end
  if self.bHideBoxBtn or self.IsMultiWeaponTag then
    self.BoxWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.BoxWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self:WeaponMain_UpdateWeaponTagIcon()
  self.TextBlock_Name:SetText(GText(Data.WeaponName))
  self:SetStars(Data.WeaponRarity or 0)
end

function M:WeaponMain_UpdateWeaponTagIcon()
  local TargetWeapon = self[self.ComparedWeaponName]
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

function M:NewWeaponTagIconContent(IconPath, TagName, IsSelected)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  Obj.Icon = IconPath or ""
  Obj.Text = GText(TagName)
  Obj.IsSelected = IsSelected
  return Obj
end

function M:WeaponMain_UpdateBoxReddot()
  local WeaponNode = ReddotManager.GetTreeNode(self.WeaponTag)
  self.Btn_Selective:SetReddot(WeaponNode and WeaponNode.Count > 0, false)
end

function M:WeaponMain_OnRoleListItemClicked(Content)
  if self[self.CmpContentName] == Content then
    return
  end
  local Avatar = ArmoryUtils:GetAvatar()
  self[self.ComparedWeaponName] = Avatar.Weapons[Content.Uuid] or Content.Target
  if self.WeaponTag == ArmoryUtils.ArmoryMainTabNames.UWeapon then
    self:UpdateWeaponInfos()
    self:CreateAndSelectSubTab()
  else
    self:SelectRoleListItem(Content)
  end
end

function M:WeaponMain_SelectRoleListItem(Content)
  if self.bFromArchive then
    ArmoryUtils:SetArchiveReddotRead(Content)
  end
  ArmoryUtils:SetItemIsSelected(self[self.CmpContentName], false)
  ArmoryUtils:SetItemIsSelected(Content, true)
  self[self.CmpContentName] = Content
  self:UpdateWeaponInfos()
  if Content.Avatar then
    self.ActorController:SetAvatar(Content.Avatar)
  end
  self.ActorController:ChangeWeaponModel(self[self.ComparedWeaponName])
  self.ActorController:SetAvatar(ArmoryUtils:GetAvatar())
  self:CreateAndSelectSubTab({
    Weapon = self[self.ComparedWeaponName]
  })
  if Content.IsOwned then
    ArmoryUtils:SetItemReddotRead(Content, true)
    self:AddSubTabReddotListen()
  end
  self:UpdateWeaponCardLevel()
end

function M:UpdateWeaponCardLevel()
  for _, value in ipairs(self.SubTabs) do
    if value.Name == ArmoryUtils.ArmorySubTabNames.Grade then
      value.Number = self[self.ComparedWeaponName].GradeLevel
      local Data = DataMgr.WeaponCardLevel[self[self.ComparedWeaponName].WeaponId]
      local MaxGradeLevel = Data and Data.CardLevelMax or 0
      value.IsMaxLevel = MaxGradeLevel <= value.Number
      local Widget = value.Widget
      if Widget then
        Widget:SetNumber(value.Number)
        Widget:SetIsMaxLevel(value.IsMaxLevel)
      end
      break
    end
  end
end

local function GetMainTabNameByWeaponTag(self, WeaponTag)
  local MainTabName
  if self.WeaponTag == ArmoryUtils.ArmoryMainTabNames.Weapon then
    MainTabName = self.WeaponTag
  else
    MainTabName = WeaponTag
  end
  return MainTabName
end

local function AddContentCommon(self, Obj, MainTabName)
  self["BP_" .. MainTabName .. "ItemContents"]:Add(Obj)
  table.insert(self[MainTabName .. "ItemContentsArray"], Obj)
  self[MainTabName .. "ItemContentsMap"][Obj.Uuid] = Obj
  local VarName = self.WeaponTag .. "WeaponId2Contents"
  self[VarName][Obj.UnitId] = self[VarName][Obj.UnitId] or {}
  self[VarName][Obj.UnitId][Obj.Uuid] = Obj
  self:OnRoleListContentCreated(Obj)
  return Obj
end

local function AddContent(self, Weapon, Content)
  local WeaponTag = Weapon:HasTag("Melee") and "Melee" or "Ranged"
  local MainTabName = GetMainTabNameByWeaponTag(self, WeaponTag)
  if self[MainTabName .. "ItemContentsMap"] == nil then
    return
  end
  local Obj = Content or ArmoryUtils:NewCharOrWeaponItemContent(Weapon, CommonConst.ArmoryType.Weapon, WeaponTag, nil, self.ReddotFrom)
  Obj.LevelCardNum = Weapon.GradeLevel
  Obj.bHideItemLevel = self.bFromArchive
  Obj.IsOwned = true
  return AddContentCommon(self, Obj, MainTabName)
end

local function AddUnownedContent(self, Weapon, Content)
  local WeaponTag = Weapon:HasTag("Melee") and "Melee" or "Ranged"
  local MainTabName = GetMainTabNameByWeaponTag(self, WeaponTag)
  if self[MainTabName .. "ItemContentsMap"] == nil then
    return
  end
  local Obj = Content or ArmoryUtils:NewCharOrWeaponItemContent(Weapon, CommonConst.ArmoryType.Weapon, WeaponTag, true, self.ReddotFrom)
  Obj.HasReward = ArmoryUtils:TryAddWeaponRewardReddot(Weapon.WeaponId)
  Obj.LevelCardNum = Weapon.GradeLevel
  Obj.bHideItemLevel = self.bFromArchive
  Obj.IsOwned = false
  Obj.LockType = 2
  Obj.Level = nil
  self[MainTabName .. "UnownedWeaponContentMap"][Obj.UnitId] = Obj
  return AddContentCommon(self, Obj, MainTabName)
end

local function UnownedContent2Content(self, UnownedContent, Weapon)
  local WeaponTag = Weapon:HasTag("Melee") and "Melee" or "Ranged"
  self[WeaponTag .. "ItemContentsMap"][UnownedContent.Uuid] = nil
  local Obj = ArmoryUtils:NewCharOrWeaponItemContent(Weapon, CommonConst.ArmoryType.Weapon, WeaponTag, nil, self.ReddotFrom)
  self[self.WeaponTag .. "WeaponId2Contents"][UnownedContent.UnitId][UnownedContent.Uuid] = nil
  UnownedContent.Uuid = Obj.Uuid
  self[WeaponTag .. "ItemContentsMap"][UnownedContent.Uuid] = UnownedContent
  self[self.WeaponTag .. "WeaponId2Contents"][UnownedContent.UnitId][UnownedContent.Uuid] = UnownedContent
  UnownedContent.bHideItemLevel = self.bFromArchive
  UnownedContent.IsOwned = true
  UnownedContent.LockType = Obj.LockType
  UnownedContent.Level = Obj.Level
  UnownedContent.IsNew = Obj.IsNew
  UnownedContent.Upgradeable = Obj.Upgradeable
  UnownedContent.RedDotType = Obj.RedDotType
  UnownedContent.Target = nil
  UnownedContent.AvatarPrime = nil
  UnownedContent.AvatarMax = nil
  UnownedContent.Avatar = nil
end

local function RemoveContent(self, WeaponUuid)
  local function RemoveContentByTag(Tag)
    if self[Tag .. "ItemContentsMap"] == nil then
      return
    end
    local Content = self[Tag .. "ItemContentsMap"][WeaponUuid]
    if Content then
      local Content = self[Tag .. "ItemContentsMap"][WeaponUuid]
      self["BP_" .. Tag .. "ItemContents"]:RemoveItem(Content)
      for index, value in ipairs(self[Tag .. "ItemContentsArray"]) do
        if value.Uuid == WeaponUuid then
          table.remove(self[Tag .. "ItemContentsArray"], index)
          break
        end
      end
      self[self.WeaponTag .. "WeaponId2Contents"][Content.UnitId][Content.Uuid] = nil
    end
  end
  
  RemoveContentByTag(ArmoryUtils.ArmoryMainTabNames.Melee)
  RemoveContentByTag(ArmoryUtils.ArmoryMainTabNames.Ranged)
  RemoveContentByTag(ArmoryUtils.ArmoryMainTabNames.Weapon)
end

function M:WeaponMain_CreateItemContents()
  self.WeaponTag = self.WeaponTag or ArmoryUtils.ArmoryMainTabNames.Weapon
  local Avatar = ArmoryUtils:GetAvatar()
  self[self.WeaponTag .. "ItemContentsMap"] = {}
  self[self.WeaponTag .. "ItemContentsArray"] = {}
  self[self.WeaponTag .. "UnownedWeaponContentMap"] = {}
  rawset(self, self.WeaponTag .. "WeaponId2Contents", {})
  self["BP_" .. self.WeaponTag .. "ItemContents"]:Clear()
  local OwnedWeapons = {}
  local RealAvatar = GWorld:GetAvatar()
  if RealAvatar then
    for _, value in pairs(RealAvatar.Weapons) do
      OwnedWeapons[value.WeaponId] = value
    end
  end
  local Weapons = Avatar.Weapons
  if self.Params.WeaponUuids then
    Weapons = {}
    for _, Uuid in ipairs(self.Params.WeaponUuids) do
      if Avatar.Weapons[Uuid] then
        table.insert(Weapons, Avatar.Weapons[Uuid])
      end
    end
  end
  if self.WeaponTag == "Weapon" then
    local WeaponTags = {}
    
    local function InsertLogic(Weapon)
      local WeaponTag = Weapon:HasTag("Melee") and "Melee" or "Ranged"
      if WeaponTag ~= WeaponTags[1] then
        table.insert(WeaponTags, WeaponTag)
      end
      local Content = ArmoryUtils:NewCharOrWeaponItemContent(Weapon, CommonConst.ArmoryType.Weapon, WeaponTag, nil, self.ReddotFrom)
      AddContent(self, Weapon, Content)
      if self.bFromArchive then
        if OwnedWeapons[Content.UnitId] then
          Content.IsOwned = true
        else
          Content.IsOwned = false
        end
      end
    end
    
    if self.DoNotSort and self.IsPreviewMode then
      local WeaponArray = {}
      if self.InitialOrderWeaponUuids then
        for _, value in ipairs(self.InitialOrderWeaponUuids) do
          table.insert(WeaponArray, Weapons[value])
        end
      else
        WeaponArray = Weapons
      end
      for _, Weapon in ipairs(WeaponArray) do
        InsertLogic(Weapon)
      end
    else
      for Uuid, Weapon in pairs(Weapons) do
        InsertLogic(Weapon)
      end
    end
    if #WeaponTags > 1 then
      self.IsMultiWeaponTag = true
    end
  else
    local function InsertLogic(Weapon)
      if Weapon:HasTag(self.WeaponTag) then
        if OwnedWeapons[Weapon.WeaponId] or self.IsPreviewMode then
          return AddContent(self, Weapon)
        else
          return AddUnownedContent(self, Weapon)
        end
      end
    end
    
    if self.DoNotSort and self.IsPreviewMode then
      for _, Weapon in ipairs(Weapons) do
        InsertLogic(Weapon)
      end
    else
      for Uuid, Weapon in pairs(Weapons) do
        InsertLogic(Weapon)
      end
      if self.IsPreviewMode or self.Params.WeaponUuids then
        return
      end
      try({
        exec = function()
          local function ShouldDisplayWeapon(WeaponId)
            local WeaponData = DataMgr.BattleWeapon[WeaponId]
            
            if not WeaponData then
              return
            end
            local WeaponTag = WeaponData.WeaponTag
            if not WeaponTag then
              return
            end
            for _, _Tag in pairs(WeaponTag) do
              if self.WeaponTag == _Tag then
                return true
              end
            end
            return false
          end
          
          ArmoryUtils:DontResetUuid(true)
          for WeaponId, value in pairs(DataMgr.Weapon) do
            if not value.IsNotOpen and not OwnedWeapons[WeaponId] and ShouldDisplayWeapon(WeaponId) then
              local DummyAvatar = ArmoryUtils:CreateNewDummyAvatar(ArmoryUtils.PreviewTargetStates.Prime, {
                WeaponIds = {WeaponId}
              })
              local _, Weapon = next(DummyAvatar.Weapons)
              local Content = InsertLogic(Weapon)
              Content.Target = Weapon
              Content.AvatarPrime = DummyAvatar
              local DummyAvatarMax = ArmoryUtils:CreateNewDummyAvatar(ArmoryUtils.PreviewTargetStates.Max, {
                WeaponIds = {WeaponId}
              })
              Content.AvatarMax = DummyAvatarMax
              Content.Avatar = DummyAvatar
            end
          end
          ArmoryUtils:DontResetUuid(false)
        end,
        catch = function(err)
          local trace = debug.traceback()
          err = err or ""
          DebugPrint("Error: CY@ \230\156\170\232\167\163\233\148\129\230\173\166\229\153\168\228\191\161\230\129\175\229\136\155\229\187\186\229\164\177\232\180\165!\n" .. err .. "\n" .. trace)
        end
      })
    end
  end
end

function M:WeaponMain_InitRoleList()
  self.EMListView_Role:ClearListItems()
  for _, Content in ipairs(self.WeaponItemContentsArray) do
    self.EMListView_Role:AddItem(Content)
    if Content.IsSelect then
      self.EMListView_Role:BP_ScrollItemIntoView(Content)
    end
  end
  self.EMListView_Role:RegenerateAllEntries()
end

function M:WeaponMain_SortItemContents()
  if self.DoNotSort then
    return
  end
  ArmoryUtils:SortItemContents(self.WeaponItemContentsArray, {
    "Level",
    "Rarity",
    "SortPriority",
    "UnitId"
  }, CommonConst.DESC, self.CurContentName and self[self.CurContentName], ArmoryUtils.IsOwnedCmpFunc)
end

function M:WeaponMain_InitContentState()
  if self[self.CurContentName] then
    self[self.CurContentName].bInGear = false
  end
  if self[self.CmpContentName] then
    self[self.CmpContentName].IsSelect = false
  end
  if self[self.CurrentWeaponName] then
    self[self.CurContentName] = self.WeaponItemContentsMap[self[self.CurrentWeaponName].Uuid]
    if self[self.CurContentName] then
      self[self.CurContentName].bInGear = true
    end
  end
  local CmpWeapon = self[self.ComparedWeaponName]
  if CmpWeapon then
    local Avatar = ArmoryUtils:GetAvatar()
    self[self.ComparedWeaponName] = Avatar.Weapons[CmpWeapon.Uuid] or CmpWeapon
  elseif not CmpWeapon then
    local Avatar = ArmoryUtils:GetAvatar()
    local FirstContent = self.WeaponItemContentsArray[1]
    self[self.ComparedWeaponName] = Avatar.Weapons[FirstContent.Uuid] or FirstContent.Target
  end
  CmpWeapon = self[self.ComparedWeaponName]
  self[self.CmpContentName] = self.WeaponItemContentsMap[CmpWeapon.Uuid]
  self[self.CmpContentName].IsSelect = true
end

function M:WeaponMain_UpdateResourceInfos()
  self.Tab_Arm:UpdateResource()
end

function M:WeaponMain_OnBtnIntensifyClicked()
  local Type = self.CurSubTab.Type
  local Tag = self.CurSubTab.Tag
  local WeaponId = self[self.ComparedWeaponName].WeaponId
  local RealMaxLevel = DataMgr.Weapon[WeaponId].WeaponMaxLevel
  local Level = self[self.ComparedWeaponName].Level
  if RealMaxLevel > Level then
    local Params = {
      Target = self[self.ComparedWeaponName],
      Type = Type,
      Tag = Tag,
      HideItemTips = true
    }
    local BreakData = DataMgr.WeaponBreak[WeaponId]
    local NextBreakLevelInfo = BreakData and BreakData[self[self.ComparedWeaponName].EnhanceLevel + 1]
    local UIConfig = DataMgr.SystemUI.ArmoryCardLevelWeapon
    if NextBreakLevelInfo then
      if Level < NextBreakLevelInfo.WeaponBreakLevel then
        Params.BehaviourType = "LevelUp"
        UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self:GetZOrder(), CommonConst.ArmoryType.Weapon, self[self.ComparedWeaponName], self, Params)
      else
        Params.BehaviourType = "BreakLevelUp"
        UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self:GetZOrder(), CommonConst.ArmoryType.Weapon, self[self.ComparedWeaponName], self, Params)
      end
    else
      Params.BehaviourType = "LevelUp"
      UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self:GetZOrder(), CommonConst.ArmoryType.Weapon, self[self.ComparedWeaponName], self, Params)
    end
  else
    UIManager(self):ShowUITip("CommonToastMain", GText("Max_Level_Achieved"))
  end
end

function M:CharMain_OnForbiddenBtnIntensifyClicked()
  UIManager(self):ShowUITip("CommonToastMain", GText("Max_Level_Achieved"))
end

function M:WeaponMain_OnBtnReplaceClicked()
  local Avatar = ArmoryUtils:GetAvatar()
  local Weapon = self[self.ComparedWeaponName]
  local Uuid = Weapon.Uuid
  if not self.WeaponTag or not Uuid then
    return
  end
  if Weapon.AssisterId and 0 ~= Weapon.AssisterId then
    local function func()
      self:BlockAllUIInput(false)
    end
    
    local function OnPopupConfirm()
      self:BlockAllUIInput(true)
      Avatar:SwitchWeapon(self.WeaponTag, Uuid)
    end
    
    local Params = {
      ShortText = string.format(GText(DataMgr.CommonPopupUIContext[100044].PopoverText), GText(Weapon.WeaponName), GText(Avatar.Resources[Weapon.AssisterId].ResourceName)),
      LeftCallbackFunction = func,
      CloseBtnCallbackFunction = func,
      RightCallbackFunction = OnPopupConfirm
    }
    UIManager(self):ShowCommonPopupUI(100044, Params, self)
  else
    self:BlockAllUIInput(true)
    Avatar:SwitchWeapon(self.WeaponTag, Uuid)
  end
end

function M:OnSwitchWeapon()
  self:BlockAllUIInput(false)
  if self.ComponentReceivedEvent.OnSwitchWeapon then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/weapon_replace", nil, nil)
  ArmoryUtils:SetItemInGear(self[self.CurContentName], false)
  ArmoryUtils:SetItemInGear(self[self.CmpContentName], true)
  ArmoryUtils:SetContentPhantomIcon(self[self.CurContentName])
  ArmoryUtils:SetContentPhantomIcon(self[self.CmpContentName])
  self[self.CurrentWeaponName] = self[self.ComparedWeaponName]
  self[self.CurContentName] = self[self.CmpContentName]
  self:WeaponMain_UpdatAttributeButton()
end

function M:WeaponMain_OnForbiddenBtnConfirm1Clicked()
  UIManager(self):ShowUITip("CommonToastMain", GText("Max_Level_Achieved"))
end

function M:WeaponMain_OnForbiddenBtnConfirm2Clicked()
end

function M:WeaponMain_PreMainTabChange()
  self:ShowElementTips(false)
  self:RemoveSubTabReddotListen()
end

function M:WeaponMain_PreSubTabChange()
  self:ResetWeaponData()
end

function M:WeaponMain_SetAllReddotRead()
  for _, Content in ipairs(self.WeaponItemContentsArray) do
    if Content.IsOwned then
      ArmoryUtils:SetItemReddotRead(Content, true)
    end
  end
end

function M:ResetWeaponData()
  local Avatar = ArmoryUtils:GetAvatar()
  if self.WeaponTag == CommonConst.ArmoryTag.UWeapon then
    local UWeaponUuid = self.ComparedChar.UWeaponEids[self.CurMainTab.TabData.UWeaponIdx]
    Avatar = self.CharMain_CmpContent and self.CharMain_CmpContent.Avatar and self.CharMain_CmpContent.Avatar or Avatar
    self[self.CurrentWeaponName] = Avatar.UWeapons[UWeaponUuid]
    self[self.ComparedWeaponName] = self[self.CurrentWeaponName]
  else
    self[self.ComparedWeaponName] = Avatar.Weapons[self[self.ComparedWeaponName].Uuid] or self[self.ComparedWeaponName]
    if self[self.CurrentWeaponName] then
      self[self.CurrentWeaponName] = Avatar.Weapons[self[self.CurrentWeaponName].Uuid]
    end
  end
end

function M:OnNewWeaponObtained(WeaponUuid)
  if self.Params.WeaponUuids then
    return
  end
  if not self.WeaponItemContentsMap then
    return
  end
  local Avatar = ArmoryUtils:GetAvatar()
  local Weapon = Avatar.Weapons[WeaponUuid]
  if not Weapon or self.WeaponItemContentsMap[Weapon.Uuid] then
    return
  end
  local UnownedContent = self.UnownedWeaponContentMap[Weapon.WeaponId]
  local IsCmpContent = UnownedContent and self[self.CmpContentName].UnitId == UnownedContent.UnitId
  if UnownedContent then
    UnownedContent2Content(self, UnownedContent, Weapon)
    if IsCmpContent then
      self[self.ComparedWeaponName] = Weapon
    end
  else
    AddContent(self, Weapon)
  end
  if self[self.CurrentWeaponName] then
    self:WeaponMain_InitContentState()
    self:WeaponMain_SortItemContents()
  else
    self:WeaponMain_SortItemContents()
    self:WeaponMain_InitContentState()
  end
  self:InitRoleList()
  if IsCmpContent then
    self:SelectRoleListItem(UnownedContent)
  end
  self:UpdateSubTabReddotByName(ArmoryUtils.ArmorySubTabNames.Grade)
  self:UpdateBoxReddot()
end

function M:UpdateSubTabReddotByName(TabName)
  if not self.SubTabs then
    return
  end
  for index, value in ipairs(self.SubTabs) do
    if value.Name == TabName then
      if value.Widget and value.CheckReddot then
        value.Widget:SetReddot(value.CheckReddot({}))
      end
      break
    end
  end
end

function M:OnWeaponDeleted(WeaponUuid)
  if self.Params.WeaponUuids then
    return
  end
  RemoveContent(self, WeaponUuid)
  if not self.WeaponItemContentsMap then
    return
  end
  self:InitRoleList()
  self:UpdateSubTabReddotByName(ArmoryUtils.ArmorySubTabNames.Grade)
  self:UpdateBoxReddot()
end

function M:OnWeaponRewardStateChanged(WeaponId)
  if self.IsPreviewMode or not self.WeaponId2Contents then
    return
  end
  local Contents = self.WeaponId2Contents[WeaponId]
  if not Contents then
    return
  end
  local Avatar = GWorld:GetAvatar()
  local HasReward = Avatar:IsWeaponHasReward(WeaponId)
  for key, value in pairs(Contents) do
    value.HasReward = HasReward
    ArmoryUtils:UpdateContentRetDotType(value)
    if value == self[self.CmpContentName] then
      self:UpdateSubTabReddotByName(ArmoryUtils.ArmorySubTabNames.Attribute)
    end
  end
end

function M:WeaponMain_OnLockBtnClicked()
  if self[self.ComparedWeaponName]:IsLock() then
    local function CancelFunc()
      self:SetFocus()
    end
    
    local function ConfirmFunc()
      self:SetFocus()
      local Avatar = ArmoryUtils:GetAvatar()
      self:BlockAllUIInput(true)
      Avatar:UnLockResourceInBag(CommonConst.AllType.Weapon, self[self.ComparedWeaponName].Uuid)
    end
    
    UIManager(self):ShowCommonPopupUI(100019, {
      LeftCallbackFunction = CancelFunc,
      RightCallbackFunction = ConfirmFunc,
      CloseBtnCallbackFunction = CancelFunc
    }, self)
  else
    self:BlockAllUIInput(true)
    local Avatar = ArmoryUtils:GetAvatar()
    Avatar:LockResourceInBag(CommonConst.AllType.Weapon, self[self.ComparedWeaponName].Uuid)
  end
end

function M:WeaponMain_OnBagItemLockedOrUnlocked(OpAction, ErrCode, Id)
  self:BlockAllUIInput(false)
  if not ErrorCode:Check(ErrCode) then
    return
  end
  if "StateChange" == OpAction then
    self:ResetWeaponData()
    local Avatar = ArmoryUtils:GetAvatar()
    local Weapon = Avatar.Weapons[Id]
    local Content = self.WeaponItemContentsMap[Id]
    if Weapon and Content then
      Content.IsLocked = Weapon:IsLock()
      Content.LockType = Content.IsLocked and 1 or 0
      if Content.SelfWidget then
        Content.SelfWidget:SetLock(Content.LockType)
      end
      if Content.IsLocked then
        UIManager(self):ShowError(7006, nil, UIConst.Tip_CommonToast)
        self.Switcher_Lock:SetActiveWidgetIndex(0)
      else
        UIManager(self):ShowError(7007, nil, UIConst.Tip_CommonToast)
        self.Switcher_Lock:SetActiveWidgetIndex(1)
      end
    end
  end
end

function M:WeaponMain_OnFocusReceived(ReplyInfo)
end

function M:WeaponMain_InitKeySetting(KeyDownEvents, KeyUpEvents, BottomKeyInfo)
  if not self.bHideSquadBuildBtn or not self.IsPreviewMode then
    self:AddKeyEvents(KeyDownEvents, self.MenuKeyDownEvents)
  end
  self:AddKeyEvents(KeyDownEvents, self.LeftThumbstickKeyDownEvents, self.MainTabKeyDownEvents, self.CommonKeyDownEvents)
  self.LeftThumbstickBottomKeyInfoList.Desc = GText("UI_Weapon_Type")
  table.insert(BottomKeyInfo, self.LeftThumbstickBottomKeyInfoList)
  self:AddKeyEvents(KeyUpEvents, self.LeftThumbstickKeyUpEvents)
  if self.Tab_L:IsVisible() then
    table.insert(BottomKeyInfo, self.RoleUpDownBottomKeyInfoList)
    self:AddKeyEvents(KeyDownEvents, self.RoleTabKeyDownEvents)
  end
  if self.WeaponTag ~= CommonConst.ArmoryTag.UWeapon and not self.IsPreviewMode and ArmoryUtils:GetWeaponByUuid(self[self.ComparedWeaponName].Uuid) ~= nil then
    self:AddKeyEvents(KeyDownEvents, self.LockKeyDownEvents)
    if self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Attribute then
      if not self.AttributeButtonStyleParams[1].ForbidBtn then
        self:AddKeyEvents(KeyDownEvents, self.UpgradeKeyDownEvents)
      end
    elseif self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Appearance then
      self:AddKeyEvents(KeyDownEvents, self.SubTabKeyDownEvents)
    end
  end
  table.insert(self.BottomKeyInfo, self.ESCKeyInfoList)
end

function M:WeaponMain_InitNavigationRules()
  self:InitNavigationRulesCommon()
end

function M:WeaponMain_OnTableKeyDown()
  if self.CurrentSubUI and self.CurrentSubUI.OnContrastKeyDown then
    self.CurrentSubUI:OnContrastKeyDown()
  end
end

function M:WeaponMain_OnTableKeyUp()
  if self.CurrentSubUI and self.CurrentSubUI.OnContrastKeyDown then
    self.CurrentSubUI:OnContrastKeyUp()
  end
end

function M:WeaponMain_OnLeftThumbstickKeyDown()
  self:ShowElementTips(true)
end

function M:WeaponMain_OnLeftThumbstickKeyUp()
  self:ShowElementTips(false)
end

function M:WeaponMain_OnViewKeyDown()
end

function M:WeaponMain_OnLockKeyDown()
  self:WeaponMain_OnLockBtnClicked()
end

function M:WeaponMain_UpdateGamepadStyle()
  if self.IsGamepadInput and self.WeaponTag ~= CommonConst.ArmoryTag.UWeapon and not self.IsPreviewMode and not self.IsListExpanded then
    self.Key_GamePad_Lock:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Right"}
      }
    })
    self.Key_GamePad_Lock:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_GamePad_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnWeaponUpgraded(Ret, WeaponUuid)
  local Avatar = ArmoryUtils:GetAvatar()
  local Weapon = Avatar.Weapons[WeaponUuid]
  if not Weapon then
    return
  end
  local Content = self:WeaponMain_FindContent(WeaponUuid)
  if not Content then
    return
  end
  self:ResetWeaponData()
  ArmoryUtils:SetItemLevel(Content, Weapon.Level)
  if self[self.CmpContentName] == Content then
    self:InitSubUI()
  end
  self:InitRoleList()
end

function M:OnWeaponGradeLevelUp(Ret, WeaponUuid, CurrentGradeLevel, ConsumeWeaponUuids)
  local Avatar = ArmoryUtils:GetAvatar()
  local Weapon = Avatar.Weapons[WeaponUuid]
  if not Weapon then
    return
  end
  local Content = self:WeaponMain_FindContent(WeaponUuid)
  if not Content then
    return
  end
  self:ResetWeaponData()
  Content.GradeLevel = Weapon.GradeLevel
  Content.LevelCardNum = Weapon.GradeLevel
  if Content.Widget then
    Content.Widget:OnListItemObjectSet(Content)
  end
  if Content.SelfWidget then
    Content.SelfWidget:OnListItemObjectSet(Content)
  end
  if self[self.ComparedWeaponName] == Weapon then
    self:UpdateWeaponCardLevel()
    self:UpdateSubTabReddotByName(ArmoryUtils.ArmorySubTabNames.Grade)
    self:InitSubUI()
  end
end

function M:WeaponMain_FindContent(WeaponUuid)
  for index, value in ipairs(self.AllWeaponMainTabNames) do
    local _Map = self[value .. "ItemContentsMap"]
    if _Map and _Map[WeaponUuid] then
      return _Map[WeaponUuid]
    end
  end
end

function M:OnWeaponColorsChanged()
  self:ResetWeaponData()
end

return M
