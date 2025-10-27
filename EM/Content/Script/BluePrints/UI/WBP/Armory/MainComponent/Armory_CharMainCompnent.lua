local UpgradeUtils = require("Utils.UpgradeUtils")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local SkillUtils = require("Utils.SkillUtils")
local M = {}

function M:ComponentInitDispatcher()
  self:AddDispatcher(EventID.OnCharLevelUp, self, self.OnCharUpgraded)
  self:AddDispatcher(EventID.OnCharBreakLevelUp, self, self.OnCharUpgraded)
  self:AddDispatcher(EventID.OnCharGradeLevelUp, self, self.OnCharGradeLevelUp)
  self:AddDispatcher(EventID.OnCharSkillLevelUp, self, self.OnCharSkillLevelUp)
  self:AddDispatcher(EventID.OnSwitchRole, self, self.OnSwitchRole)
  self:AddDispatcher(EventID.OnNewCharObtained, self, self.OnNewCharObtained)
  self:AddDispatcher(EventID.OnCharCardLevelResourcesChanged, self, self.OnCharCardLevelResourcesChanged)
  self:AddDispatcher(EventID.OnCharRewardStateChanged, self, self.OnCharRewardStateChanged)
end

function M:CharMain_Close()
  self:RemoveDispatcher(EventID.OnSwitchRole)
end

function M:CharMain_OnArmoryTargetStateChanged(NewAvatar)
  local _, Char = next(NewAvatar.Chars)
  if self.IsPreviewMode or Char.CharId ~= self.ComparedChar.CharId then
    return
  end
  self.CharMain_CmpContent.Target = Char
  local CmpContent = self.CharMain_CmpContent
  CmpContent.GradeLevel = Char.GradeLevel
  CmpContent.Avatar = NewAvatar
  if self.CurMainTab.Name == ArmoryUtils.ArmoryMainTabNames.Char then
    self.CharMain_CmpContent = nil
    self:CharMain_OnRoleListItemClicked(CmpContent)
  else
    self.ComparedChar = CmpContent.Target
    self:CreateMainTabs({
      Char = self.ComparedChar,
      Avatar = CmpContent.Avatar
    })
    self:AddMainTabReddotListen()
    local CurMainTabIdx = self.MainTabName2Idx[self.CurMainTab.Name]
    if self.MainTabs[CurMainTabIdx] and self.MainTabs[CurMainTabIdx].Name == self.CurMainTab.Name then
      self.CurMainTab = self.MainTabs[CurMainTabIdx]
      self.CurMainTab.IsOn = true
      self:UpdateMainTabs(self.MainTabs)
      self.CurMainTab.IsOn = false
    end
    self.CharMain_CmpContent = CmpContent
  end
end

function M:CharMain_Init()
  self.Panel_SubTab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_Edit:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if not self.CharItemContentsMap then
    self:CharMain_PreprocessContents()
  end
  self:InitRoleList()
  self:CharMain_SelectRoleListItem(self.CharMain_CmpContent)
  self:PlayAnimation(self.RoleList_In)
  self:UpdateBoxReddot()
end

function M:CharMain_JumpToSubPage(SubPageName)
  if not SubPageName or not IsValid(self.CurrentSubUI) then
    return
  end
  if SubPageName == ArmoryUtils.ArmorySubPageName.Mod and self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Attribute then
    self.CurrentSubUI:OnModBtnClicked()
  end
end

function M:CharMain_PreprocessContents(Type, PreprocessParams)
  PreprocessParams = PreprocessParams or {}
  local Uuid = PreprocessParams.SelectedTargetUuid
  local Id = PreprocessParams.SelectedTargetId
  local Index = PreprocessParams.SelectedTargetIndex
  self:CharMain_CreateItemContents()
  local Avatar = ArmoryUtils:GetAvatar()
  local ContentArray = self.CharItemContentsArray
  if Uuid then
    self.ComparedChar = Avatar.Chars[Uuid]
  elseif Id then
    for _, value in ipairs(ContentArray) do
      if value.UnitId == Id then
        self.ComparedChar = Avatar.Chars[value.Uuid] or value.Target
      end
    end
  elseif Index then
    local Content = ContentArray[Index]
    if Content then
      self.ComparedChar = Avatar.Chars[Content.Uuid] or Content.Target
    end
  end
  if self.ComparedChar then
    local Content = self.CharItemContentsMap[self.ComparedChar.Uuid]
    if Content then
      self.ComparedChar = Avatar.Chars[self.ComparedChar.Uuid] or Content.Target
    else
      self.ComparedChar = nil
    end
  end
  if not self.ComparedChar and ContentArray[1] then
    self.ComparedChar = Avatar.Chars[ContentArray[1].Uuid] or ContentArray[1].Target
  end
  self:CharMain_InitContentState()
  self:CharMain_SortItemContents()
end

function M:CharMain_InitSubUI()
  local Target = self.ComparedChar
  local IsTargetUnowned = ArmoryUtils:GetCharByUuid(Target.Uuid) == nil
  local Params = {
    CharUuid = Target.Uuid,
    Target = Target,
    Type = self.CurSubTab.Type,
    Tag = self.CurSubTab.Tag,
    IsTargetUnowned = IsTargetUnowned
  }
  if self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Attribute then
    Params.bHideUWeaponMod = self.Params.bFormPersonalPage
    Params.AvatarPrime = self.CharMain_CmpContent.AvatarPrime
    Params.AvatarMax = self.CharMain_CmpContent.AvatarMax
    Params.CurrentAvatar = self.CharMain_CmpContent.Avatar
    Params.EscapeArmoryCharID = self.Params.EscapeArmoryCharID
  elseif self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Files then
    Params.bNeedStandBtn = self.Params.bNeedStandBtn
  elseif self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Appearance then
    Params.AppearanceIndex = self.Params.AppearanceIndex
  end
  self:DefaultInitSubUI(Params)
  if self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Attribute then
    self:CharMain_InitSubUI_Attribute()
  end
end

function M:CharMain_ReceiveEnterState()
  self:ResetCharData()
  self:_UpdateSkillUpgradeReddot(ArmoryUtils:GetAvatar(), self.ComparedChar.Uuid)
  if self.CurSubTab.Name ~= ArmoryUtils.ArmorySubTabNames.Skill then
    self:InitSubUI()
  end
  self:UpdateSkillTabReddot()
end

function M:UpdateSkillTabReddot()
  for index, value in ipairs(self.SubTabs) do
    if value.Name == ArmoryUtils.ArmorySubTabNames.Skill then
      if value.Widget and value.CheckReddot then
        value.Widget:SetReddot(value.CheckReddot({}))
      end
      break
    end
  end
end

function M:CharMain_InitSubUI_Attribute()
  if self.CurrentSubUI then
    self.CurrentSubUI:BindEvents(self, {
      OnBtnIntensifyClicked = self.CharMain_OnBtnIntensifyClicked,
      OnBtnReplaceClicked = self.CharMain_OnBtnReplaceClicked,
      OnForbiddenBtnIntensifyClicked = self.CharMain_OnForbiddenBtnIntensifyClicked,
      OnForbiddenBtnReplaceClicked = self.CharMain_OnForbiddenBtnReplaceClicked
    })
  end
  self:CharMain_UpdatAttributeButton()
end

function M:CharMain_UpdatAttributeButton()
  if self.CurSubTab.Name ~= ArmoryUtils.ArmorySubTabNames.Attribute then
    return
  end
  self.AttributeButtonStyleParams = {
    {},
    {}
  }
  if self.ComparedChar.Level >= DataMgr.Char[self.ComparedChar.CharId].CharMaxLevel then
    self.AttributeButtonStyleParams[1].Text = GText("Max_Level_Achieved")
    self.AttributeButtonStyleParams[1].ForbidBtn = true
  else
    local MaxLevel = UpgradeUtils.GetMaxLevel(self.ComparedChar, CommonConst.ArmoryType.Char)
    if MaxLevel <= self.ComparedChar.Level then
      self.AttributeButtonStyleParams[1].Text = GText("UI_FUNC_BREAKLEVELUP")
    else
      self.AttributeButtonStyleParams[1].Text = GText("UI_FUNC_LEVELUP")
    end
    self.AttributeButtonStyleParams[1].ForbidBtn = false
  end
  self.AttributeButtonStyleParams[1].Visibility = UIConst.VisibilityOp.SelfHitTestInvisible
  self.AttributeButtonStyleParams[2].Visibility = UIConst.VisibilityOp.SelfHitTestInvisible
  if self.CharMain_CurContent == self.CharMain_CmpContent then
    self.AttributeButtonStyleParams[2].Text = GText("UI_Armory_AlreadyPut")
    self.AttributeButtonStyleParams[2].ForbidBtn = true
  else
    self.AttributeButtonStyleParams[2].Text = GText("UI_Armory_PutOn")
    self.AttributeButtonStyleParams[2].ForbidBtn = false
  end
  if self.Params.bHideDeployBtn then
    self.AttributeButtonStyleParams[2].Visibility = UIConst.VisibilityOp.Collapsed
  end
  self.CurrentSubUI:UpdateButtonStyle(self.AttributeButtonStyleParams)
  if self.CurrentChar == self.ComparedChar then
    self.CurrentSubUI:SetOpenModParams(nil)
  else
    self.CurrentSubUI:SetOpenModParams({
      CharUuid = self.ComparedChar.Uuid
    })
  end
end

function M:UpdateCharInfos()
  self.Panel_Element:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Tab_L:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if self.bHideBoxBtn then
    self.BoxWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.BoxWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.Panel_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  local Data = DataMgr.Char[self.ComparedChar.CharId]
  self.TextBlock_Name:SetText(GText(Data.CharName))
  self:SetStars(Data.CharRarity or 0)
  local ElmtType = DataMgr.BattleChar[self.ComparedChar.CharId].Attribute
  self:CharMain_SetElementIcon(ElmtType)
end

function M:CharMain_SetElementIcon(ElementType)
  if ElementType then
    self.Panel_Element:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Panel_Element:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  local IconName = "Armory_" .. ElementType
  local AttributeIcon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName)
  self.Image_Element:SetBrushResourceObject(AttributeIcon)
  self.Stats_ListView:ClearListItems()
  local ElmtTypes, ElmtNames = UIUtils.GetAllElementTypes()
  for idx, Type in ipairs(ElmtTypes) do
    self.Stats_ListView:AddItem(self:NewElmtIconContent(Type, ElmtNames[idx], Type == ElementType))
  end
end

function M:NewElmtIconContent(ElmtType, ElmtName, IsSelected)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  local IconName = "Armory_" .. ElmtType
  Obj.Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName
  Obj.Text = GText(ElmtName)
  Obj.IsSelected = IsSelected
  return Obj
end

function M:CharMain_UpdateBoxReddot()
  local PromoteNode = ReddotManager.GetTreeNode(DataMgr.ReddotNode.PromoteChar.Name)
  local NewCharNode = ReddotManager.GetTreeNode(DataMgr.ReddotNode.NewChar.Name)
  self.Btn_Selective:SetReddot(NewCharNode and NewCharNode.Count > 0, PromoteNode and PromoteNode.Count > 0)
end

function M:CharMain_OnRoleListItemClicked(Content)
  if self.CharMain_CmpContent == Content then
    return
  end
  local Avatar = ArmoryUtils:GetAvatar()
  self.ComparedChar = Avatar.Chars[Content.Uuid] or Content.Target
  self:CreateMainTabs({
    Char = self.ComparedChar,
    Avatar = Content.Avatar
  })
  self:AddMainTabReddotListen()
  local CurMainTabIdx = self.MainTabName2Idx[self.CurMainTab.Name]
  if self.MainTabs[CurMainTabIdx] and self.MainTabs[CurMainTabIdx].Name == self.CurMainTab.Name then
    self.CurMainTab = self.MainTabs[CurMainTabIdx]
    self.CurMainTab.IsOn = true
    self:UpdateMainTabs(self.MainTabs)
    self.CurMainTab.IsOn = false
    self:SelectRoleListItem(Content)
  else
    self:UpdateMainTabs(self.MainTabs)
    self.Tab_Arm:SelectTab(1)
  end
end

function M:CharMain_SelectRoleListItem(Content)
  if self.bFromArchive then
    ArmoryUtils:SetArchiveReddotRead(Content)
  end
  ArmoryUtils:SetItemIsSelected(self.CharMain_CmpContent, false)
  ArmoryUtils:SetItemIsSelected(Content, true)
  self.CharMain_CmpContent = Content
  self:UpdateCharInfos()
  if self.CharMain_CmpContent.Avatar then
    self.ActorController:SetAvatar(self.CharMain_CmpContent.Avatar)
  end
  self.ActorController:ChangeCharModel(self.ComparedChar)
  self.ActorController:SetAvatar(ArmoryUtils:GetAvatar())
  self:CreateAndSelectSubTab()
  self:UpdateCharCardLevel()
  if Content.IsOwned then
    ArmoryUtils:SetItemReddotRead(Content, true)
    self:_UpdateSkillUpgradeReddot(ArmoryUtils:GetAvatar(), Content.Uuid)
    self:AddSubTabReddotListen()
  end
end

function M:UpdateCharCardLevel()
  for _, value in ipairs(self.SubTabs) do
    if value.Name == ArmoryUtils.ArmorySubTabNames.Grade then
      value.Number = self.ComparedChar.GradeLevel
      local MaxGradeLevel = DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue
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

local function AddContent(self, Char)
  local Obj = ArmoryUtils:NewCharOrWeaponItemContent(Char, CommonConst.ArmoryType.Char, CommonConst.ArmoryTag.Char, nil, self.ReddotFrom)
  Obj.bHideItemLevel = self.bFromArchive
  Obj.IsOwned = true
  self.BP_CharItemContents:Add(Obj)
  self.CharItemContentsMap[Char.Uuid] = Obj
  self.CharId2Content[Char.CharId] = Obj
  table.insert(self.CharItemContentsArray, Obj)
  self:OnRoleListContentCreated(Obj)
  return Obj
end

local function AddUnownedContent(self, Char)
  local Obj = ArmoryUtils:NewCharOrWeaponItemContent(Char, CommonConst.ArmoryType.Char, CommonConst.ArmoryTag.Char, true, self.ReddotFrom)
  Obj.bHideItemLevel = true
  Obj.IsOwned = false
  Obj.LockType = 2
  Obj.Level = nil
  Obj.Unlockable = not not ArmoryUtils:TryAddUnlockableCharReddot(Char.CharId)
  if Obj.Unlockable then
    Obj.RedDotType = UIConst.RedDotType.CommonRedDot
  end
  self.BP_CharItemContents:Add(Obj)
  self.CharItemContentsMap[Char.Uuid] = Obj
  self.UnownedCharContentMap[Char.CharId] = Obj
  table.insert(self.CharItemContentsArray, Obj)
  self:OnRoleListContentCreated(Obj)
  return Obj
end

local function UnownedContent2Content(self, UnownedContent, Char)
  self.CharItemContentsMap[UnownedContent.Uuid] = nil
  if self.UnownedCharContentMap[UnownedContent.UnitId] then
    self.UnownedCharContentMap[UnownedContent.UnitId] = nil
  end
  local Obj = ArmoryUtils:NewCharOrWeaponItemContent(Char, CommonConst.ArmoryType.Char, CommonConst.ArmoryTag.Char, nil, self.ReddotFrom)
  UnownedContent.Uuid = Obj.Uuid
  self.CharItemContentsMap[UnownedContent.Uuid] = UnownedContent
  self.CharId2Content[UnownedContent.UnitId] = UnownedContent
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

function M:CharMain_CreateItemContents()
  local Avatar = ArmoryUtils:GetAvatar()
  rawset(self, "CharItemContentsMap", {})
  rawset(self, "CharItemContentsArray", {})
  rawset(self, "UnownedCharContentMap", {})
  rawset(self, "CharId2Content", {})
  self.BP_CharItemContents:Clear()
  local OwnedChars = {}
  local RealAvatar = GWorld:GetAvatar()
  if RealAvatar then
    for _, value in pairs(RealAvatar.Chars) do
      OwnedChars[value.CharId] = value
    end
  end
  
  local function InsertLogic(Char)
    if OwnedChars[Char.CharId] or self.IsPreviewMode then
      return AddContent(self, Char)
    else
      return AddUnownedContent(self, Char)
    end
  end
  
  local Chars = Avatar.Chars
  if self.Params.CharUuids then
    Chars = {}
    for _, Uuid in ipairs(self.Params.CharUuids) do
      if Avatar.Chars[Uuid] then
        table.insert(Chars, Avatar.Chars[Uuid])
      end
    end
  end
  if self.DoNotSort and self.IsPreviewMode then
    local CharArray = {}
    if self.InitialOrderCharUuids then
      for index, value in ipairs(self.InitialOrderCharUuids) do
        table.insert(CharArray, Chars[value])
      end
    else
      CharArray = Chars
    end
    for _, Char in ipairs(CharArray) do
      InsertLogic(Char)
    end
  else
    for Uuid, Char in pairs(Chars) do
      InsertLogic(Char)
    end
    if self.IsPreviewMode or self.Params.CharUuids then
      return
    end
    try({
      exec = function()
        ArmoryUtils:DontResetUuid(true)
        local Gender2RoleIds = Const.DefaultAttributeMaster
        local ExcludeCharId = Gender2RoleIds[1 - RealAvatar.Sex]
        for CharId, value in pairs(DataMgr.Char) do
          if not value.IsNotOpen and ExcludeCharId ~= CharId and not OwnedChars[CharId] then
            local DummyAvatar = ArmoryUtils:CreateNewDummyAvatar(ArmoryUtils.PreviewTargetStates.Prime, {
              CharIds = {CharId}
            })
            local _, Char = next(DummyAvatar.Chars)
            local Content = InsertLogic(Char)
            Content.Target = Char
            Content.AvatarPrime = DummyAvatar
            local DummyAvatarMax = ArmoryUtils:CreateNewDummyAvatar(ArmoryUtils.PreviewTargetStates.Max, {
              CharIds = {CharId}
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
        DebugPrint("Error: CY@ \230\156\170\232\167\163\233\148\129\232\167\146\232\137\178\228\191\161\230\129\175\229\136\155\229\187\186\229\164\177\232\180\165!\n" .. err .. "\n" .. trace)
      end
    })
  end
end

function M:CharMain_SortItemContents()
  if self.DoNotSort then
    return
  end
  local AttrNames = {
    "Level",
    "SortPriority",
    "UnitId"
  }
  ArmoryUtils:SortItemContents(self.CharItemContentsArray, AttrNames, CommonConst.DESC, self.CharMain_CurContent, function(a, b)
    if a.IsOwned or b.IsOwned then
      return ArmoryUtils.IsOwnedCmpFunc(a, b)
    end
    if a.Unlockable ~= b.Unlockable then
      if a.Unlockable then
        return true
      else
        return false
      end
    end
  end)
end

function M:CharMain_InitRoleList()
  self:CharMain_InitContentState()
  self:CharMain_SortItemContents()
  self.EMListView_Role:ClearListItems()
  for _, Content in ipairs(self.CharItemContentsArray) do
    self.EMListView_Role:AddItem(Content)
    if Content.IsSelect then
      self.EMListView_Role:BP_ScrollItemIntoView(Content)
    end
  end
  self.EMListView_Role:RegenerateAllEntries()
end

function M:CharMain_InitContentState()
  if self.CharMain_CurContent then
    self.CharMain_CurContent.bInGear = false
  end
  if self.CharMain_CmpContent then
    self.CharMain_CmpContent.IsSelect = false
  end
  if self.CurrentChar then
    self.CharMain_CurContent = self.CharItemContentsMap[self.CurrentChar.Uuid]
    if self.CharMain_CurContent then
      self.CharMain_CurContent.bInGear = true
    end
  end
  if not self.CharMain_CmpContent or not self.CharMain_CmpContent.Avatar then
    self.CharMain_CmpContent = self.CharItemContentsMap[self.ComparedChar.Uuid]
  end
  self.CharMain_CmpContent.IsSelect = true
end

function M:CharMain_UpdateResourceInfos()
  self.Tab_Arm:UpdateResource()
end

function M:CharMain_OnBtnIntensifyClicked()
  local Type = self.CurSubTab.Type
  local Tag = self.CurSubTab.Tag
  local CharId = self.ComparedChar.CharId
  local RealMaxLevel = DataMgr.Char[CharId].CharMaxLevel
  local Level = self.ComparedChar.Level
  if RealMaxLevel > Level then
    local Params = {
      Target = self.ComparedChar,
      Type = Type,
      Tag = Tag,
      HideItemTips = true
    }
    local BreakData = DataMgr.CharBreak[CharId]
    local NextBreakLevelInfo = BreakData and BreakData[self.ComparedChar.EnhanceLevel + 1]
    local UIConfig = DataMgr.SystemUI.ArmoryCardLevelWeapon
    if NextBreakLevelInfo then
      if Level < NextBreakLevelInfo.CharBreakLevel then
        Params.BehaviourType = "LevelUp"
        UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self:GetZOrder(), CommonConst.ArmoryType.Char, self.ComparedChar, self, Params)
      else
        Params.BehaviourType = "BreakLevelUp"
        UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self:GetZOrder(), CommonConst.ArmoryType.Char, self.ComparedChar, self, Params)
      end
    else
      Params.BehaviourType = "LevelUp"
      UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self:GetZOrder(), CommonConst.ArmoryType.Char, self.ComparedChar, self, Params)
    end
  else
    UIManager(self):ShowUITip("CommonToastMain", GText("Max_Level_Achieved"))
  end
end

function M:CharMain_OnBtnReplaceClicked()
  if not (self.ComparedChar and self.ComparedChar.Uuid) or self.ComparedChar == self.CurrentChar then
    return
  end
  self:ServerSwitchRole()
end

function M:ServerSwitchRole()
  local Avatar = ArmoryUtils:GetAvatar()
  if not Avatar then
    return
  end
  self:BlockAllUIInput(true)
  Avatar:SwitchCurrentChar(self.ComparedChar.Uuid)
end

function M:CharMain_OnForbiddenBtnIntensifyClicked()
  UIManager(self):ShowUITip("CommonToastMain", GText("Max_Level_Achieved"))
end

function M:CharMain_OnForbiddenBtnReplaceClicked()
end

function M:PlayRoleSelectedSound()
  AudioManager(self):PlayItemSound(self, self.ComparedChar.CharId, "Click", "Char")
end

function M:_UpdateSkillUpgradeReddot(Avatar, CharUuid)
  if self.IsPreviewMode or ArmoryUtils:GetCharByUuid(CharUuid) == nil then
    return
  end
  CharUuid = CharUuid or self.ComparedChar.Uuid
  local ContentType = CommonConst.DataType.Char .. Const.Skill
  local Char = Avatar.Chars[CharUuid]
  if nil == Char then
    return
  end
  for _, CharSkill in pairs(Char.Skills) do
    local Ret = SkillUtils.CalcSkillCanLvup(CharSkill.SkillId, CharSkill.Level, CharSkill.Level + 1, CharUuid)
    ArmoryUtils:TryAddNewCharSkillReddot(CharSkill, nil, CharUuid, Ret.CanLevelUp)
    if not Ret.CanLevelUp then
      ArmoryUtils:SetItemReddotRead({
        Type = ContentType,
        CharUuid = CharUuid,
        SkillId = CharSkill.SkillId
      }, false, true)
    end
  end
end

function M:CharMain_PreMainTabChange()
  self:ShowElementTips(false)
  self:RemoveSubTabReddotListen()
end

function M:CharMain_PreSubTabChange()
  self:ResetCharData()
end

function M:ResetCharData()
  local Avatar = ArmoryUtils:GetAvatar()
  if self.CharMain_CmpContent and self.CharMain_CmpContent.Avatar then
    Avatar = self.CharMain_CmpContent.Avatar
  end
  self.ComparedChar = not Avatar.Chars[self.ComparedChar.Uuid] and self.CharMain_CmpContent and self.CharMain_CmpContent.Target
  if self.CurrentChar then
    self.CurrentChar = Avatar.Chars[self.CurrentChar.Uuid]
  end
end

function M:OnNewCharObtained(CharUuid)
  local Avatar = ArmoryUtils:GetAvatar()
  local Char = Avatar.Chars[CharUuid]
  if not Char or self.CharItemContentsMap[CharUuid] then
    return
  end
  local UnownedContent = self.UnownedCharContentMap[Char.CharId]
  if UnownedContent then
    UnownedContent2Content(self, UnownedContent, Char)
    local IsCmpContent = self.CharMain_CmpContent.UnitId == UnownedContent.UnitId
    if IsCmpContent then
      self.ComparedChar = Char
    end
    self:InitRoleList()
    if IsCmpContent then
      self:SelectRoleListItem(UnownedContent)
    end
    self:UpdateBoxReddot()
  end
end

function M:OnSwitchRole(...)
  self:BlockAllUIInput(false)
  local Avatar = ArmoryUtils:GetAvatar()
  self.CurrentChar = Avatar.Chars[Avatar.CurrentChar]
  self.ComparedChar = self.CurrentChar
  if self.CurMainTab.Name ~= ArmoryUtils.ArmoryMainTabNames.Char then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm_positive", nil, nil)
  ArmoryUtils:SetItemInGear(self.CharMain_CurContent, false)
  ArmoryUtils:SetItemInGear(self.CharMain_CmpContent, true)
  self.CharMain_CurContent = self.CharMain_CmpContent
  self:CharMain_UpdatAttributeButton()
end

function M:OnCharUpgraded(Ret, Uuid, CurLevel, TargetLevel)
  local Avatar = ArmoryUtils:GetAvatar()
  local Char = Avatar.Chars[Uuid]
  if not Char then
    return
  end
  self:ResetCharData()
  local Content = self.CharItemContentsMap[Uuid]
  if not Content then
    return
  end
  ArmoryUtils:SetItemLevel(Content, Char.Level)
  if self.CharMain_CmpContent == Content then
    self:InitSubUI()
  end
  self:InitRoleList()
end

function M:OnCharSkillLevelUp(Ret, SkillId, CurrentLevel)
  self:ResetCharData()
  local Avatar = ArmoryUtils:GetAvatar()
  ArmoryUtils:SetItemReddotRead({
    Type = CommonConst.DataType.Char .. Const.Skill,
    CharUuid = self.ComparedChar.Uuid,
    SkillId = SkillId
  }, false, true)
  self:_UpdateSkillUpgradeReddot(Avatar)
end

function M:OnCharGradeLevelUp(Ret, Uuid, CurrentGradeLevel)
  local Avatar = ArmoryUtils:GetAvatar()
  local Char = Avatar.Chars[Uuid]
  if not Char then
    return
  end
  self:ResetCharData()
  self:UpdateCharCardLevel()
end

function M:OnCharCardLevelResourcesChanged(Rid, CharId, Uuid)
  if self.IsPreviewMode then
    return
  end
  local Content
  if Uuid then
    if not self.CharItemContentsMap then
      return
    end
    self:ResetCharData()
    local Avatar = ArmoryUtils:GetAvatar()
    local Char = Avatar.Chars[Uuid]
    Content = self.CharItemContentsMap[Uuid]
    if Char and Content then
      Content.Upgradeable = UpgradeUtils.CheckCharCanUpgradeCardLevel(Char)
      if Content.IsNew then
        Content.RedDotType = UIConst.RedDotType.NewRedDot
      elseif Content.Upgradeable then
        Content.RedDotType = UIConst.RedDotType.CommonRedDot
      else
        Content.RedDotType = nil
      end
      if Content.SelfWidget then
        Content.SelfWidget:SetRedDot(Content.RedDotType)
      end
      if Content.Widget then
        Content.Widget:SetReddot(Content.RedDotType)
      end
    end
  else
    if not self.UnownedCharContentMap then
      return
    end
    Content = self.UnownedCharContentMap[CharId]
    if Content then
      Content.Unlockable = not not ArmoryUtils:TryAddUnlockableCharReddot(CharId)
      if Content.Unlockable then
        Content.RedDotType = UIConst.RedDotType.CommonRedDot
        self:InitRoleList()
      else
        Content.RedDotType = nil
      end
    end
  end
  if not Content then
    return
  end
  if Content.SelfWidget then
    Content.SelfWidget:SetRedDot(Content.RedDotType)
  end
  if Content.Widget then
    Content.Widget:SetReddot(Content.RedDotType)
  end
end

function M:OnCharRewardStateChanged(CharId)
  if self.IsPreviewMode then
    return
  end
  local Content = self.CharId2Content[CharId]
  if not Content then
    return
  end
  local Avatar = GWorld:GetAvatar()
  Content.HasReward = Avatar:IsCharHasReward(CharId)
  ArmoryUtils:UpdateContentRetDotType(Content)
end

function M:CharMain_OnFocusReceived(ReplyInfo)
end

function M:CharMain_InitKeySetting(KeyDownEvents, KeyUpEvents, BottomKeyInfo)
  if not self.bHideSquadBuildBtn or not self.IsPreviewMode then
    self:AddKeyEvents(KeyDownEvents, self.MenuKeyDownEvents)
  end
  self:AddKeyEvents(KeyUpEvents, self.LeftThumbstickKeyUpEvents)
  self.LeftThumbstickBottomKeyInfoList.Desc = GText("UI_CTL_CheckProperty")
  table.insert(BottomKeyInfo, self.LeftThumbstickBottomKeyInfoList)
  self:AddKeyEvents(KeyDownEvents, self.LeftThumbstickKeyDownEvents, self.MainTabKeyDownEvents, self.CommonKeyDownEvents)
  if self.Tab_L:IsVisible() then
    table.insert(BottomKeyInfo, self.RoleUpDownBottomKeyInfoList)
    self:AddKeyEvents(KeyDownEvents, self.RoleTabKeyDownEvents)
  end
  if self.CurSubTab.Name == ArmoryUtils.ArmorySubTabNames.Attribute and not self.AttributeButtonStyleParams[1].ForbidBtn and not self.IsPreviewMode and ArmoryUtils:GetCharByUuid(self.ComparedChar.Uuid) ~= nil then
    self:AddKeyEvents(KeyDownEvents, self.UpgradeKeyDownEvents)
  end
  table.insert(BottomKeyInfo, self.ESCKeyInfoList)
end

function M:CharMain_InitNavigationRules()
  self:InitNavigationRulesCommon()
end

function M:CharMain_OnSubTabLeftKeyDown()
  if self.CurrentSubUI and self.CurrentSubUI.OnTabLeftKeyDown then
    self.CurrentSubUI:OnTabLeftKeyDown()
  end
end

function M:CharMain_OnSubTabRightKeyDown()
  if self.CurrentSubUI and self.CurrentSubUI.OnTabRightKeyDown then
    self.CurrentSubUI:OnTabRightKeyDown()
  end
end

function M:CharMain_OnLeftThumbstickKeyDown()
  self:ShowElementTips(true)
end

function M:CharMain_OnLeftThumbstickKeyUp()
  self:ShowElementTips(false)
end

function M:CharMain_OnViewKeyDown()
end

function M:CharMain_OnRightThumbstickKeyDown()
end

return M
