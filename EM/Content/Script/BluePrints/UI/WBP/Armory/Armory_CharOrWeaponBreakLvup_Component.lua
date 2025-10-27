require("UnLua")
local UpgradeUtils = require("Utils.UpgradeUtils")
local Component = {}

function Component:Construct()
end

Component.BreakLevelUpWidgetMap = {
  [CommonConst.ArmoryType.Char] = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Intensify/WBP_Armory_Ascend.WBP_Armory_Ascend'",
  [CommonConst.ArmoryType.Weapon] = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Intensify/WBP_Armory_Ascend.WBP_Armory_Ascend'"
}

function Component:InitBreakLevelUpComp(...)
  local User, Target, SubWidget, Params = ...
  self.Target = Target
  self.TargetData = Target.Props
  self.Type = Params.Type
  self.Tag = Params.Tag
  self.CurrentMode = Params.BehaviourType
  self.TargetId = self.Target[self.Type .. "Id"]
  self.BreakLevel = self.Target.EnhanceLevel
  self.MaxBreakLevel = #DataMgr[self.Type .. "Break"][self.TargetId]
  self:OnExpandList(false, true)
  self.Selective_Listing:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:InitTab(GText("UI_COMMONPOP_TITLE_100030") .. "/" .. GText(self.Target:GetName()))
  self.Btn_Upgrade.Button_Area.OnClicked:Clear()
  self.Btn_Upgrade.Button_Area.OnClicked:Add(self, self.OnUpgradeBtnClicked)
  self:AddDispatcher(EventID.OnWeaponBreakLevelUp, self, self.OnTargetBreakLevelUp)
  self:AddDispatcher(EventID.OnCharBreakLevelUp, self, self.OnTargetBreakLevelUp)
  self:AddDispatcher(EventID.OnResourcesChanged, self, self.OnBreakLvUpResourcesChanged)
  local WidgetPath = Component.BreakLevelUpWidgetMap[User]
  local SubWidgetParams = {
    Parent = self,
    Target = self.Target,
    Type = self.Type,
    Tag = self.Tag
  }
  self.IntensifyWidget = nil
  self.Panel_Warning:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:InitBreakLevelUpIntensify(WidgetPath, SubWidgetParams)
  self:InitBreakLevelUpView()
  self.WidgetSwitcher_Mode:SetActiveWidgetIndex(0)
  self.Panel_Max:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:InitBreakLevelUpPanelInfo()
  self.InitTimer = self:AddTimer(0.2, function()
    self:RefreshBaseInfo()
  end)
end

function Component:OnUpgradeBtnClicked()
  if self.CurrentMode == "BreakLevelUp" then
    self:TryToBreakLevelUp()
  end
end

function Component:InitBreakLevelUpIntensify(WidgetPath, Params)
  if self.IntensifyWidget then
    return
  end
  self.VB_Node:ClearChildren()
  self:CreateBreakLevelUpWidget(WidgetPath, Params)
end

function Component:CreateBreakLevelUpWidget(WidgetPath, Params)
  self.IntensifyWidget = UIManager(self):CreateWidget(WidgetPath, true)
  self.VB_Node:AddChild(self.IntensifyWidget)
  if self.IntensifyWidget then
    Params = Params or {}
    Params.Parent = self
    Params.MaxBreakLevel = self.MaxBreakLevel
    self.IntensifyWidget:SetCallbacks({
      OnBreakLevelUpSuccessCallback = function()
        return self.ComparedAttrs, nil
      end
    })
    self.IntensifyWidget:Init(Params)
    if self.IntensifyWidget:IsVisible() then
      self.IntensifyWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    self.CurrentSubUI = self.IntensifyWidget
  end
end

function Component:InitBreakLevelUpPanelInfo()
  self.Panel_Info:SetVisibility(UIConst.VisibilityOp.Visible)
  local TargetData = self.Target.Props
  if self.Type == CommonConst.ArmoryType.Char then
    local TargetName = DataMgr.Char[TargetData.CharId].CharName
    local TargetRarity = DataMgr.Char[TargetData.CharId].CharRarity
    self.TextBlock_Name:SetText(GText(TargetName))
    local ElmtType = DataMgr.BattleChar[TargetData.CharId].Attribute
    self:SetElementIcon(ElmtType)
    self:SetStars(TargetRarity)
  elseif self.Type == CommonConst.ArmoryType.Weapon then
    local TargetName = DataMgr.Weapon[TargetData.WeaponId].WeaponName
    local TargetRarity = DataMgr.Weapon[TargetData.WeaponId].WeaponRarity
    self.TextBlock_Name:SetText(GText(TargetName))
    self:UpdateWeaponTagIcon()
    self:SetStars(TargetRarity)
  end
  self.Btn_Upgrade:SetText(GText("UI_COMMONPOP_TITLE_100030"))
  self.Btn_Upgrade:SetDefaultGamePadImg("Y")
  if self.Type == CommonConst.ArmoryType.Char then
    local BreakData = DataMgr.CharBreak[TargetData.CharId]
    local NextBreakLevelInfo = BreakData and BreakData[self.Target.EnhanceLevel + 1]
    self.CurrentSubUI.Text_Ascend:SetText(GText("Text_Ascend") .. self.TargetLevelLimit)
  elseif self.Type == CommonConst.ArmoryType.Weapon then
    local BreakData = DataMgr.WeaponBreak[TargetData.WeaponId]
    local NextBreakLevelInfo = BreakData and BreakData[self.Target.EnhanceLevel + 1]
    self.CurrentSubUI.Text_Ascend:SetText(GText("Text_Ascend") .. self.TargetLevelLimit)
  end
  self.CurrentSubUI:InitBreakLevelStars(self.Target.EnhanceLevel + 1)
end

function Component:SetElementIcon(ElementType)
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

function Component:NewElmtIconContent(ElmtType, ElmtName, IsSelected)
  local Obj = NewObject(UIUtils.GetCommonItemContentClass())
  local IconName = "Armory_" .. ElmtType
  Obj.Icon = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_" .. IconName .. ".T_" .. IconName
  Obj.Text = GText(ElmtName)
  Obj.IsSelected = IsSelected
  return Obj
end

function Component:CloseComp()
end

function Component:OnBackgroundClickedComp()
end

function Component:DestructComp()
end

function Component:OnBreakLvUpResourcesChanged(ResourceId)
  if self.CurrentMode ~= "BreakLevelUp" then
    return
  end
  for _, Id in ipairs(self.CurBreakLvUpResourceIds) do
    if Id == ResourceId then
      if IsValid(self) then
        self:UpdateBreakLevelUpInfo(true)
      end
      break
    end
  end
end

function Component:InitBreakLevelUpView()
  local Avatar = GWorld:GetAvatar()
  if not (Avatar and self.Target) or not self.Type then
    return
  end
  self:UpdateBreakLevelUpInfo()
end

function Component:UpdateBreakLevelUpInfo(ResourcesChanged)
  local BreakLevelUpData = DataMgr[self.Type .. "Break"][self.TargetId]
  local BreakLevel = self.BreakLevel
  if BreakLevel >= #BreakLevelUpData then
    self.BreakHintText = "Max_BreakLevel_Achieved"
    return
  end
  local ComparedTable = DataMgr[self.Type][self.TargetId]
  local ComparedBreakLevel = BreakLevel + 1
  local LevelLimit = BreakLevelUpData[ComparedBreakLevel][self.Type .. "BreakLevel"]
  local TargetLevelLimit
  if ComparedBreakLevel == #BreakLevelUpData then
    TargetLevelLimit = ComparedTable[self.Type .. "MaxLevel"]
  else
    TargetLevelLimit = BreakLevelUpData[ComparedBreakLevel + 1][self.Type .. "BreakLevel"]
  end
  self.TargetLevelLimit = TargetLevelLimit
  local Attrs = {}
  local ComparedAttrs = {}
  if LevelLimit and TargetLevelLimit then
    table.insert(Attrs, {Key = "LevelLimit", Value = LevelLimit})
    table.insert(ComparedAttrs, {Key = "LevelLimit", Value = TargetLevelLimit})
  end
  local CurrenModSlotNum = -1
  local TargetModSlotNum = -1
  for index, value in ipairs(ComparedTable.ModSlotUnlock) do
    if value <= BreakLevel then
      CurrenModSlotNum = CurrenModSlotNum + 1
    end
    if value <= ComparedBreakLevel then
      TargetModSlotNum = TargetModSlotNum + 1
    end
  end
  if CurrenModSlotNum > 0 then
    table.insert(Attrs, {
      Key = "ModSlotNum",
      Value = CurrenModSlotNum + 1
    })
    table.insert(ComparedAttrs, {
      Key = "ModSlotNum",
      Value = TargetModSlotNum + 1
    })
  end
  self.Attrs = {}
  self.ComparedAttrs = {}
  self.Attrs, self.ComparedAttrs = self:GetDispatchTagAttrs(self.Attrs, self.ComparedAttrs, BreakLevel, ComparedBreakLevel)
  for i, Attr in ipairs(Attrs) do
    if Attr.Value ~= ComparedAttrs[i].Value then
      local Data = DataMgr.AttrConfig[Attr.Key]
      table.insert(self.Attrs, {
        AttrName = GText(Data.Name),
        AttrValue = CommonUtils.AttrValueToString(Data, Attr.Value),
        AttrDesc = GText(Data.AttrDesc)
      })
      table.insert(self.ComparedAttrs, {
        AttrName = GText(Data.Name),
        AttrValue = CommonUtils.AttrValueToString(Data, ComparedAttrs[i].Value or 0),
        Delta = (ComparedAttrs[i].Value or 0) - Attr.Value
      })
    end
  end
  self.CurrentSubUI:UpdataAttrListView(self.Attrs, self.ComparedAttrs)
  local Res = UpgradeUtils.CalcBreakLevelUp(self.Target, self.Type, ComparedBreakLevel)
  self.CanUpgrade = Res.CanUpgrade
  self.ResourceUse = Res.ResourceUse
  self.BreakHintText = Res.BreakHintText
  self:UpdateBreakLvUpResourceItems(Res.ResourceUse)
  if self.CanUpgrade then
    self.Btn_Upgrade:ForbidBtn(false)
  else
    self.Btn_Upgrade:ForbidBtn(true)
  end
  if not self.CanUpgrade and ResourcesChanged then
    return
  end
  self:SetBreakHintText(Res.CanUpgrade, Res.BreakHintText, Res.FirstUpgrade)
  self.Params.bShouldPlayAnim = true
end

function Component:SetBreakHintText(CanUpgrade, BreakHintText, FirstUpgrade)
  if not CanUpgrade then
    DebugPrint(TXTTag, "UpdateBreakLevelUpInfo", GText(BreakHintText))
    self.Text_Warning:SetText(GText(BreakHintText))
    self.Panel_Warning:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.WidgetSwitcher_Hint:SetActiveWidgetIndex(0)
    self.WidgetSwitcher_Hint:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    UIManager(self):LoadUI(UIConst.COMMONTOASTMAIN, "CommonToastMain", UIConst.ZORDER_FOR_COMMON_TIP, GText(BreakHintText), 2)
    return
  end
  if FirstUpgrade then
    self.Text_ExpHint:SetText(GText(BreakHintText))
    self.Text_ExpHint:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.WidgetSwitcher_Hint:SetActiveWidgetIndex(1)
    self.WidgetSwitcher_Hint:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    UIManager(self):LoadUI(UIConst.COMMONTOASTMAIN, "CommonToastMain", UIConst.ZORDER_FOR_COMMON_TIP, GText(BreakHintText), 2)
  else
    self.WidgetSwitcher_Hint:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function Component:GetDispatchTagAttrs(Attrs, ComparedAttrs, BreakLevel, ComparedBreakLevel)
  Attrs = Attrs or {}
  ComparedAttrs = ComparedAttrs or {}
  if self.Type ~= CommonConst.ArmoryType.Char then
    return Attrs, ComparedAttrs
  end
  local CharData = self.Target:Data()
  if CharData and CharData.DispatchTag then
    local DispatchTags = CharData.DispatchTag
    local DispatchUnlock = CharData.DispatchUnlock or {}
    local CharDispatchTagTable = DataMgr.CharDispatchTag
    for index, value in ipairs(DispatchTags) do
      local UnlockLevel = DispatchUnlock[index]
      if UnlockLevel then
        local CharDispatchTagData = CharDispatchTagTable[value]
        if CharDispatchTagData then
          local CurrentUnlocked = BreakLevel >= UnlockLevel
          local NextUnlocked = ComparedBreakLevel >= UnlockLevel
          if not CurrentUnlocked and NextUnlocked then
            table.insert(Attrs, {IsDispatchTag = true, DispatchTagData = CharDispatchTagData})
            table.insert(ComparedAttrs, {IsDispatchTag = true, DispatchTagData = CharDispatchTagData})
          end
        end
      end
    end
  end
  return Attrs, ComparedAttrs
end

function Component:UpdateBreakLvUpResourceItems(ResourceUse)
  for i = 1, 5 do
    local itemWidget = self["Item_" .. i]
    if IsValid(itemWidget) then
      itemWidget:Init({})
      itemWidget:SetVisibility(UIConst.VisibilityOp.Visible)
    end
  end
  if not ResourceUse or 0 == #ResourceUse then
    return
  end
  self.CurBreakLvUpResourceIds = {}
  for i, Resource in ipairs(ResourceUse) do
    table.insert(self.CurBreakLvUpResourceIds, Resource.ResourceId)
    local itemWidget = self["Item_" .. i]
    if IsValid(itemWidget) then
      local resourceConfig = DataMgr.Resource[Resource.ResourceId]
      if resourceConfig then
        local Content = {
          ItemType = "Resource",
          Id = Resource.ResourceId,
          Count = Resource.Count,
          Icon = resourceConfig.Icon,
          Rarity = resourceConfig.Rarity or 1,
          NotInteractive = false,
          IsShowDetails = true
        }
        local Avatar = GWorld:GetAvatar()
        local hasCount = Avatar and Avatar:GetResourceNum(Resource.ResourceId) or 0
        Content.Count = hasCount
        Content.NeedCount = Resource.Count
        itemWidget:Init(Content)
        local Events = {}
        Events.OnMenuOpenChanged = self.ItemMenuAnchorChanged
        itemWidget:BindEvents(self, Events)
      end
    end
  end
end

function Component:TryToBreakLevelUp()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  if self.CanUpgrade then
    self:BlockAllUIInput(true)
    local CallServerFunc = Avatar[self.Type .. "BreakLevelUp"]
    CallServerFunc(Avatar, self.Target.Uuid, self.BreakLevel + 1)
    local ArmoryMain = UIManager(self):GetArmoryUIObj()
    if self.Type == "Char" then
      ArmoryMain.ActorController:CharLvUpOrBreakUp()
    elseif self.Type == "Weapon" then
      ArmoryMain.ActorController:WeaponLvUpOrBreakUp()
    end
  else
    UIManager(self):ShowUITip("CommonToastMain", GText(self.BreakHintText))
  end
end

function Component:ForbiddenUpgradeBtnClicked()
  UIManager(self):ShowUITip("CommonToastMain", GText(self.BreakHintText))
end

function Component:OnTargetBreakLevelUp(Ret, Uuid, TargetBreakLevel)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if Ret == ErrorCode.RET_SUCCESS then
    local Avatar = GWorld:GetAvatar()
    if Avatar and Avatar[self.Type .. "s"][Uuid] and TargetBreakLevel == self.BreakLevel + 1 then
      local OldBreakLevel = self.BreakLevel
      self.BreakLevel = TargetBreakLevel
      self.Target = Avatar[self.Type .. "s"][Uuid]
      if self.Type == "Char" then
        self.BreakHintText = "Char_BreakLevelUp_Success"
      elseif self.Type == "Weapon" then
        self.BreakHintText = "Weapon_BreakLevelUp_Success"
      end
      self:BlockAllUIInput(true)
      self.CurrentSubUI:OnBreakLevelUpSuccess(self.Target.EnhanceLevel)
      self.Btn_Upgrade:ForbidBtn(true)
      self:UpdateBreakLvUpResourceItems({})
      self:PlayBreakLevelUpVoice()
      if self.Params and self.Params.LeftCallbackObj and self.Params.LeftCallbackFunction then
        self.Params.LeftCallbackFunction(self.Params.LeftCallbackObj)
      end
    else
      self.BreakHintText = "Unknown_Error"
      UIManager(self):ShowUITip("CommonToastMain", GText(self.BreakHintText))
    end
  else
    UIManager:ShowError(Ret, 1.5)
  end
end

function Component:OnBreakLevelUpAnimFinishedCallback()
  if self.CurrentMode ~= "BreakLevelUp" then
    return
  end
  self:BlockAllUIInput(false)
  self:SetFocus()
  self.Btn_Upgrade:ForbidBtn(false)
  self.VB_Node:ClearChildren()
  local Params = {
    Target = self.Target,
    Type = self.Type,
    Tag = self.Tag,
    BehaviourType = "LevelUp",
    IsSwitch = true,
    LeftCallbackObj = self.Params.LeftCallbackObj,
    LeftCallbackFunction = self.Params.LeftCallbackFunction,
    CloseBtnCallbackObj = self.Params.CloseBtnCallbackObj,
    CloseBtnCallbackFunction = self.Params.CloseBtnCallbackFunction
  }
  local UIConfig = DataMgr.SystemUI.ArmoryCardLevelWeapon
  self:InitUIInfo(UIConst.LoadInConfig, UIConfig.UIName, nil, self.Type, self.Target, self, Params)
  if self.Key_Consume and self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Key_Consume:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  return
end

function Component:PlayBreakLevelUpVoice()
  local AudioManager = AudioManager(self)
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain then
    self.ArmoryPlayer = ArmoryMain.ActorController.ArmoryPlayer
    self.ArmoryHelper = ArmoryMain.ActorController.ArmoryHelper
  end
  AudioManager:PlayCharVoice(self.ArmoryPlayer, nil, "vo_lvup", nil, "ArmoryRoleVoice", true)
end

function Component:RefreshOpInfoByInputDeviceComp(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = CurInputDevice
  if CurInputDevice == ECommonInputType.Gamepad then
    self:ReNavigateToListItem()
    if self.Key_Consume then
      self.Key_Consume:SetVisibility(UIConst.VisibilityOp.Visible)
      self:SetFocus()
      self:ShowCheckBtn(false)
      self:ShowChooseBtn(false)
    end
    if self.CurrentSubUI.WidgetSwitcher_Min then
      self.CurrentSubUI.WidgetSwitcher_Min:SetActiveWidgetIndex(1)
      self.CurrentSubUI.WidgetSwitcher_Minus:SetActiveWidgetIndex(1)
      self.CurrentSubUI.WidgetSwitcher_Add:SetActiveWidgetIndex(1)
      self.CurrentSubUI.WidgetSwitcher_Max:SetActiveWidgetIndex(1)
    end
    self.Item_1:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    self.Item_5:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    for i = 1, 4 do
      self["Item_" .. i]:SetNavigationRuleExplicit(EUINavigation.Right, self["Item_" .. i + 1])
      self["Item_" .. i + 1]:SetNavigationRuleExplicit(EUINavigation.Left, self["Item_" .. i])
    end
    for i = 1, 5 do
      self["Item_" .. i]:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
      self["Item_" .. i]:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    end
  else
    if self.Key_Consume then
      self.Key_Consume:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    if self.CurrentSubUI.WidgetSwitcher_Min then
      self.CurrentSubUI.WidgetSwitcher_Min:SetActiveWidgetIndex(0)
      self.CurrentSubUI.WidgetSwitcher_Minus:SetActiveWidgetIndex(0)
      self.CurrentSubUI.WidgetSwitcher_Add:SetActiveWidgetIndex(0)
      self.CurrentSubUI.WidgetSwitcher_Max:SetActiveWidgetIndex(0)
    end
  end
end

function Component:OnFocusReceivedComp(MyGeometry, InFocusEvent)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:ReNavigateToListItem()
    self.Key_Consume:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function Component:ReNavigateToListItem()
  if self.CurrentMode == "LevelUp" then
    if self.bListExpand then
      local TileView = self.Selective_Listing.TileView_Select_Role
      if TileView:GetNumItems() > 0 then
        local SelectedItem = TileView:BP_GetSelectedItem()
        if SelectedItem then
          TileView:BP_NavigateToItem(SelectedItem)
        else
          TileView:NavigateToIndex(0)
        end
      end
    else
      self:SetFocus()
    end
  end
end

function Component:OnKeyDownComp(MyGeometry, InKeyName)
  if InKeyName == UIConst.GamePadKey.FaceButtonTop and self.CurrentMode == "BreakLevelUp" then
    self:OnUpgradeBtnClicked()
    return true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight and self.IsFocusInItem then
    self:SetFocus()
    self.IsFocusInItem = false
    self.Key_Consume:SetVisibility(UIConst.VisibilityOp.Visible)
    self:ShowCheckBtn(false)
    return true
  elseif InKeyName == UIConst.GamePadKey.LeftTriggerThreshold then
    self:PreLevel()
    return true
  elseif InKeyName == UIConst.GamePadKey.RightTriggerThreshold then
    self:NextLevel()
    return true
  elseif InKeyName == UIConst.GamePadKey.RightThumb then
    self.Item_1:SetFocus()
    self.IsFocusInItem = true
    self.Key_Consume:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:ShowCheckBtn(true)
    return true
  end
  return false
end

return Component
