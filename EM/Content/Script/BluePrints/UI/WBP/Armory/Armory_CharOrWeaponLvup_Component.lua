require("UnLua")
local UpgradeUtils = require("Utils.UpgradeUtils")
local Component = {}
Component.LevelUpWidgetMap = {
  [CommonConst.ArmoryType.Char] = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Intensify/WBP_Armory_Upgrade.WBP_Armory_Upgrade'",
  [CommonConst.ArmoryType.Weapon] = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Intensify/WBP_Armory_Upgrade.WBP_Armory_Upgrade'"
}

function Component:InitLevelUpComp(...)
  local User, Target, SubWidget, Params = ...
  self.Target = Target
  self.TargetData = Target.Props
  self.Type = Params.Type
  self.Tag = Params.Tag
  self.CurrentMode = Params.BehaviourType
  self:OnExpandList(false, true)
  self.Selective_Listing:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:InitTab(GText("UI_COMMONPOP_TITLE_100029") .. "/" .. GText(self.Target:GetName()))
  self.Btn_Upgrade.Button_Area.OnClicked:Clear()
  self.Btn_Upgrade.Button_Area.OnClicked:Add(self, self.OnUpgradeBtnClicked)
  self.Btn_Upgrade:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  end)
  self:AddDispatcher(EventID.OnWeaponLevelUp, self, self.OnTargetLevelUp)
  self:AddDispatcher(EventID.OnCharLevelUp, self, self.OnTargetLevelUp)
  self:AddDispatcher(EventID.OnResourcesChanged, self, self.OnLvUpResourcesChanged)
  self:ShowWarning(false)
  local WidgetPath = Component.LevelUpWidgetMap[User]
  local SubWidgetParams = {
    Parent = self,
    Target = self.Target,
    Type = self.Type,
    Tag = self.Tag
  }
  self.IntensifyWidget = nil
  self:InitLvUpIntensify(WidgetPath, SubWidgetParams)
  self:InitLvUpView(Params)
  self.WidgetSwitcher_Mode:SetActiveWidgetIndex(0)
  self.Panel_Max:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:InitLvUpPanelInfo()
  self.InitTimer = self:AddTimer(0.2, function()
    self:RefreshBaseInfo()
  end)
end

function Component:OnUpgradeBtnClicked()
  if self.CurrentMode == "LevelUp" then
    self:TryToLevelUp()
  end
end

function Component:InitLvUpIntensify(WidgetPath, Params)
  if self.IntensifyWidget then
    return
  end
  self.VB_Node:ClearChildren()
  self:CreateLvUpWidget(WidgetPath, Params)
end

function Component:CreateLvUpWidget(WidgetPath, Params)
  self.IntensifyWidget = UIManager(self):CreateWidget(WidgetPath, true)
  self.VB_Node:AddChild(self.IntensifyWidget)
  if self.IntensifyWidget then
    Params = Params or {}
    Params.Parent = self
    self.IntensifyWidget:SetCallbacks({
      OnLevelUpAnimFinishedCallback = self.OnLevelUpAnimFinishedCallback,
      OnLevelUpSuccessCallback = function()
        return self.ComparedAttrs, nil, self.Level >= DataMgr[self.Type][self.TargetId][self.Type .. "MaxLevel"]
      end,
      OnLevelUpFinalCallback = self.UpdateBtnState
    })
    self.IntensifyWidget:Init(Params)
    if self.IntensifyWidget:IsVisible() then
      self.IntensifyWidget:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
    local CanvasSlot = self.IntensifyWidget.Main.Slot
    local Anchors = FAnchors()
    Anchors.Minimum = FVector2D(0, 0)
    Anchors.Maximum = FVector2D(1, 1)
    CanvasSlot:SetAnchors(Anchors)
    CanvasSlot:SetOffsets(FMargin(0, 0, 0, 0))
    CanvasSlot:SetAlignment(FVector2D(0, 0))
    self.CurrentSubUI = self.IntensifyWidget
    self.CurrentSubUI.Btn_Min.Button_Area.OnClicked:Add(self, self.OnBtnReduceMaxClicked)
    self.CurrentSubUI.Btn_Max.Button_Area.OnClicked:Add(self, self.OnBtnAddMaxClicked)
    self.CurrentSubUI.Btn_Minus.Button_Area.OnClicked:Add(self, self.PreLevel)
    self.CurrentSubUI.Btn_Add.Button_Area.OnClicked:Add(self, self.NextLevel)
  end
end

function Component:InitLvUpPanelInfo()
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
  self.Text_Max:SetText(GText("Pet_LevelUp_LevelMax"))
  self.Btn_Upgrade:SetText(GText("UI_COMMONPOP_TITLE_100029"))
  self.Btn_Upgrade:SetDefaultGamePadImg("Y")
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
  if self.InitTimer then
    self:RemoveTimer(self.InitTimer)
    self.InitTimer = nil
  end
end

function Component:OnBackgroundClickedComp()
end

function Component:DestructComp()
end

function Component:Construct()
end

function Component:PreLevel()
  if self.ComparedLevel - 1 <= self.Level or 0 == self.PreLevelTimes then
    return
  end
  self.PreLevelTimes = self.PreLevelTimes + 1
  self.NextLevelTimes = self.NextLevelTimes - 1
  self:UpdateLevelUpInfo(self.Level, self.ComparedLevel - 1)
end

function Component:NextLevel()
  DebugPrint("NextLevel", self.ComparedLevel, self.Level, self.NextLevelTimes)
  if self.ComparedLevel + 1 > self.MaxLevel then
    return
  end
  local Res = UpgradeUtils.CalcCharOrWeaponLevelUp(self.Target, self.Type, self.Level, self.ComparedLevel + 1)
  if Res.CanUpgrade then
    self.PreLevelTimes = self.PreLevelTimes - 1
    self.NextLevelTimes = self.NextLevelTimes + 1
    self:UpdateLevelUpInfo(self.Level, self.ComparedLevel + 1)
  else
  end
end

function Component:OnAddBtnForbid()
  if self.ComparedLevel + 1 > self.MaxLevel then
    return
  end
  local Res = UpgradeUtils.CalcCharOrWeaponLevelUp(self.Target, self.Type, self.Level, self.ComparedLevel + 1)
  UIManager(self):ShowUITip("CommonToastMain", GText(Res.ErrorText))
end

function Component:OnBtnAddMaxClicked()
  if self.ComparedLevel >= self.MaxLevel then
    return
  end
  local ComparedLevel = self.ComparedLevel + 1
  local ToLevel
  repeat
    local ComparedLevelUpData = self.LevelUpData[ComparedLevel]
    local ComparedMaxExp = ComparedLevelUpData[self.Type .. "LevelMaxExp"]
    local Res = UpgradeUtils.CalcCharOrWeaponLevelUp(self.Target, self.Type, self.Level, ComparedLevel)
    local ComparedExp = Res.ExpConsume - Res.ExpNeed
    if Res.CanUpgrade then
      ToLevel = ComparedLevel
      if ComparedMaxExp > ComparedExp then
        self.PreLevelTimes = self.PreLevelTimes - 1
        self.NextLevelTimes = self.NextLevelTimes + 1
      end
    end
    ComparedLevel = ComparedLevel + 1
  until ComparedLevel > self.MaxLevel or not Res.CanUpgrade
  if ToLevel then
    self:UpdateLevelUpInfo(self.Level, ToLevel)
  end
end

function Component:OnBtnReduceMaxClicked()
  if self.ComparedLevel - 1 <= self.Level or 0 == self.PreLevelTimes then
    return
  end
  self.PreLevelTimes = 0
  self.NextLevelTimes = 0
  self.ComparedLevel = self.Level + 1
  self:UpdateLevelUpInfo(self.Level, self.ComparedLevel)
end

function Component:OnLvUpResourcesChanged(ResourceId)
  if self.CurrentMode ~= "LevelUp" then
    return
  end
  for _, Id in ipairs(self.CurLvUpResourceIds) do
    if Id == ResourceId then
      if IsValid(self) then
        self:UpdateLevelUpInfo(self.Level, self.ComparedLevel)
      end
      break
    end
  end
end

function Component:InitLvUpView(LevelUpParams)
  local Avatar = GWorld:GetAvatar()
  if not (Avatar and self.Target) or not self.Type then
  end
  self.MaxLevel = 1
  self.CashId = CommonConst.Coins.Coin2
  self.TargetId = self.TargetData[self.Type .. "Id"]
  self.Level = self.TargetData.Level
  self.BreakLevel = self.TargetData.EnhanceLevel
  self.PreLevelTimes = 0
  self.NextLevelTimes = 0
  if self.Level < DataMgr[self.Type][self.TargetId][self.Type .. "MaxLevel"] then
    self.MaxLevel, self.RealMaxLevel = UpgradeUtils.GetMaxLevel(self.Target, self.Type)
  else
    return
  end
  self.ComparedLevel = self.Level + 1
  self:UpdateLevelUpInfo(self.Level, self.ComparedLevel)
end

function Component:UpdateLevelUpInfo(Level, ComparedLevel)
  if Level >= self.MaxLevel then
    self:UpdateBtnState(true)
    self:UpdateBreakLevelUpInfo()
    return
  else
    self:UpdateBtnState(false)
  end
  self.LevelUpData = nil
  if self.Type == "Char" then
    self.LevelUpData = DataMgr.LevelUp
  elseif self.Type == "Weapon" then
    self.LevelUpData = DataMgr.WeaponLevelUp
  end
  local LevelUpData = self.LevelUpData[Level]
  local MaxExp = LevelUpData[self.Type .. "LevelMaxExp"]
  local Exp = self.Target.Exp
  local ComparedLevelUpData = self.LevelUpData[ComparedLevel]
  local ComparedMaxExp = ComparedLevelUpData[self.Type .. "LevelMaxExp"]
  local ComparedExp = 0
  local Res
  if ComparedLevel <= Level + 1 or 0 == self.PreLevelTimes then
    self.CurrentSubUI.Btn_Minus:ForbidBtn(true)
    self.CurrentSubUI.Btn_Min:ForbidBtn(true)
    self.CurrentSubUI.Key_Minus:SetRenderOpacity(0.5)
    self.CurrentSubUI.Key_Min:SetRenderOpacity(0.5)
  else
    self.CurrentSubUI.Btn_Minus:ForbidBtn(false)
    self.CurrentSubUI.Btn_Min:ForbidBtn(false)
    self.CurrentSubUI.Key_Minus:SetRenderOpacity(1)
    self.CurrentSubUI.Key_Min:SetRenderOpacity(1)
  end
  if ComparedLevel >= self.MaxLevel then
    self.CurrentSubUI.Btn_Add:ForbidBtn(true)
    self.CurrentSubUI.Btn_Max:ForbidBtn(true)
    self.CurrentSubUI.Key_Add:SetRenderOpacity(0.5)
    self.CurrentSubUI.Key_Max:SetRenderOpacity(0.5)
  else
    Res = UpgradeUtils.CalcCharOrWeaponLevelUp(self.Target, self.Type, Level, ComparedLevel + 1)
    if Res.CanUpgrade then
      self.CurrentSubUI.Btn_Add:ForbidBtn(false)
      self.CurrentSubUI.Btn_Max:ForbidBtn(false)
      self.CurrentSubUI.Key_Add:SetRenderOpacity(1)
      self.CurrentSubUI.Key_Max:SetRenderOpacity(1)
    else
      self.CurrentSubUI.Btn_Add:ForbidBtn(true)
      self.CurrentSubUI.Btn_Max:ForbidBtn(true)
      self.CurrentSubUI.Key_Add:SetRenderOpacity(0.5)
      self.CurrentSubUI.Key_Max:SetRenderOpacity(0.5)
    end
  end
  if ComparedLevel <= Level then
    ComparedLevel = Level
    ComparedLevelUpData = LevelUpData
    ComparedExp = Exp
    ComparedMaxExp = MaxExp
    self.CanUpgrade = false
  else
    Res = UpgradeUtils.CalcCharOrWeaponLevelUp(self.Target, self.Type, Level, ComparedLevel)
    self.CanUpgrade = Res.CanUpgrade
    self.ResourceUse = Res.ResourceUse
    self.CashConsume = Res.CashConsume
    self.ExpConsume = Res.ExpConsume
    self.ExpNeed = Res.ExpNeed
    self.ErrorText = Res.ErrorText
    ComparedExp = self.ExpConsume - self.ExpNeed
    if self.CanUpgrade and ComparedMaxExp <= ComparedExp and ComparedLevel + 1 <= self.MaxLevel then
      local CanUpgrade = self.CanUpgrade
      local _ExpConsum = self.ExpConsume
      local SkipToLevel = ComparedLevel
      if ComparedLevel >= self.ComparedLevel then
        while CanUpgrade and _ExpConsum == Res.ExpConsume do
          SkipToLevel = SkipToLevel + 1
          Res = UpgradeUtils.CalcCharOrWeaponLevelUp(self.Target, self.Type, Level, SkipToLevel)
          CanUpgrade = Res.CanUpgrade
        end
        self:UpdateLevelUpInfo(Level, SkipToLevel - 1)
      elseif Level < ComparedLevel - 1 then
        while CanUpgrade and _ExpConsum == Res.ExpConsume and Level < SkipToLevel do
          SkipToLevel = SkipToLevel - 1
          Res = UpgradeUtils.CalcCharOrWeaponLevelUp(self.Target, self.Type, Level, SkipToLevel)
          CanUpgrade = Res.CanUpgrade
        end
        self:UpdateLevelUpInfo(Level, SkipToLevel)
      end
      return
    end
  end
  if ComparedLevel >= self.MaxLevel then
    ComparedExp = 0
  end
  if ComparedLevel >= self.RealMaxLevel then
    self.CurrentSubUI.Level_Preview_Max:SetText(self.RealMaxLevel)
    self.CurrentSubUI.Switcher_Level:SetActiveWidgetIndex(1)
  else
    self.CurrentSubUI.Switcher_Level:SetActiveWidgetIndex(0)
  end
  self:UpdataLevelUpAttr(Level, ComparedLevel)
  self.CurrentSubUI.Level_Now:SetText(Level)
  self.CurrentSubUI.Level_Preview:SetText(ComparedLevel)
  if Res then
    table.insert(Res.ResourceUse, {
      ResourceId = self.CashId,
      Count = self.CashConsume
    })
    self:UpdateLvUpResourceItems(Res.ResourceUse)
  end
  if not self.CanUpgrade then
    UIManager(self):LoadUI(UIConst.COMMONTOASTMAIN, "CommonToastMain", UIConst.ZORDER_FOR_COMMON_TIP, GText(self.ErrorText), 2)
  end
  self.Level = Level
  self.ComparedLevel = ComparedLevel
  self.WidgetSwitcher_Hint:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function Component:UpdateLvUpResourceItems(ResourceUse)
  if not ResourceUse or 0 == #ResourceUse then
    return
  end
  local validResources = {}
  local emptyResources = {}
  for _, Resource in ipairs(ResourceUse) do
    if Resource.Count and Resource.Count > 0 then
      table.insert(validResources, Resource)
    else
      table.insert(emptyResources, Resource)
    end
  end
  local currentIndex = 1
  self.CurLvUpResourceIds = {}
  for _, Resource in ipairs(validResources) do
    table.insert(self.CurLvUpResourceIds, Resource.ResourceId)
    local itemWidget = self["Item_" .. currentIndex]
    if IsValid(itemWidget) then
      local resourceConfig = DataMgr.Resource[Resource.ResourceId]
      if resourceConfig then
        local Content = {
          ItemType = "Resource",
          Id = Resource.ResourceId,
          Count = Resource.Count,
          Icon = resourceConfig.Icon,
          Rarity = resourceConfig.Rarity or 1,
          IsShowDetails = true
        }
        local Avatar = GWorld:GetAvatar()
        local hasCount = Avatar and Avatar:GetResourceNum(Resource.ResourceId) or 0
        Content.Count = hasCount
        Content.NeedCount = Resource.Count
        itemWidget:Init(Content)
        itemWidget:SetVisibility(UIConst.VisibilityOp.Visible)
        local Events = {}
        Events.OnMenuOpenChanged = self.ItemMenuAnchorChanged
        itemWidget:BindEvents(self, Events)
      end
    end
    currentIndex = currentIndex + 1
  end
  for _, Resource in ipairs(emptyResources) do
    local itemWidget = self["Item_" .. currentIndex]
    if IsValid(itemWidget) then
      itemWidget:Init({})
      itemWidget:SetVisibility(UIConst.VisibilityOp.Visible)
    end
    currentIndex = currentIndex + 1
  end
end

function Component:UpdataLevelUpAttr(Level, ComparedLevel)
  local LevelUpData = self.LevelUpData[Level]
  local ComparedLevelUpData = self.LevelUpData[ComparedLevel]
  local Attrs = {}
  local ComparedAttrs = {}
  local BattleTargetData = DataMgr["Battle" .. self.Type][self.TargetId]
  local BaseATK = BattleTargetData.ATK or 0
  local ATKLevelGrow = BattleTargetData.ATKLevelGrow
  if BaseATK and ATKLevelGrow then
    for _AttrName, _ in pairs(DataMgr.Attribute) do
      local AttrName = "ATK_" .. _AttrName
      if BattleTargetData[AttrName] then
        BaseATK = BaseATK + BattleTargetData[AttrName]
      end
    end
    table.insert(Attrs, {
      Key = "ATK",
      Value = BaseATK * LevelUpData[ATKLevelGrow]
    })
    table.insert(ComparedAttrs, {
      Key = "ATK",
      Value = BaseATK * ComparedLevelUpData[ATKLevelGrow]
    })
  end
  local AttrNames = {
    "MaxHp",
    "DEF",
    "MaxES"
  }
  for _, AttrName in ipairs(AttrNames) do
    local BaseValue = BattleTargetData[AttrName]
    local ValueLevelGrow = BattleTargetData[AttrName .. "LevelGrow"]
    if BaseValue and ValueLevelGrow then
      local OldValue = BaseValue * LevelUpData[ValueLevelGrow]
      local NewValue = BaseValue * ComparedLevelUpData[ValueLevelGrow]
      if CommonUtils.AttrConvert[AttrName] then
        OldValue = CommonUtils.AttrConvert[AttrName](OldValue)
        NewValue = CommonUtils.AttrConvert[AttrName](NewValue)
      end
      table.insert(Attrs, {Key = AttrName, Value = OldValue})
      table.insert(ComparedAttrs, {Key = AttrName, Value = NewValue})
    end
  end
  local ModVolume = LevelUpData.ModVolume
  local ComparedModVolume = ComparedLevelUpData.ModVolume
  table.insert(Attrs, {Key = "ModVolume", Value = ModVolume})
  table.insert(ComparedAttrs, {Key = "ModVolume", Value = ComparedModVolume})
  self.Attrs = {}
  self.ComparedAttrs = {}
  for i, Attr in ipairs(Attrs) do
    if Attr.Value ~= ComparedAttrs[i].Value then
      local Data = DataMgr.AttrConfig[Attr.Key]
      table.insert(self.Attrs, {
        AttrName = Data.Name,
        AttrValue = CommonUtils.AttrValueToString(Data, Attr.Value),
        AttrDesc = GText(Data.AttrDesc)
      })
      table.insert(self.ComparedAttrs, {
        AttrName = Data.Name,
        AttrValue = CommonUtils.AttrValueToString(Data, ComparedAttrs[i].Value or 0),
        Delta = (ComparedAttrs[i].Value or 0) - Attr.Value
      })
    end
  end
  self.CurrentSubUI:UpdataAttrListView(self.Attrs, self.ComparedAttrs)
end

function Component:TryToLevelUp()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  if self.CanUpgrade then
    self:BlockAllUIInput(true)
    local CallServerFunc = Avatar[self.Type .. "LevelUp"]
    CallServerFunc(Avatar, self.Target.Uuid, self.Level, self.ComparedLevel)
    local ArmoryMain = UIManager(self):GetArmoryUIObj()
    if self.Type == "Char" then
      ArmoryMain.ActorController:CharLvUpOrBreakUp()
    elseif self.Type == "Weapon" then
      ArmoryMain.ActorController:WeaponLvUpOrBreakUp()
    end
  else
    UIManager(self):ShowUITip("CommonToastMain", GText(self.ErrorText))
  end
end

function Component:ForbiddenUpgradeBtnClicked()
  UIManager(self):ShowUITip("CommonToastMain", GText(self.ErrorText))
end

function Component:OnTargetLevelUp(Ret, Uuid, Level, NewLevel)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if not UIManager then
    return
  end
  if Ret == ErrorCode.RET_SUCCESS then
    local Avatar = GWorld:GetAvatar()
    if Avatar and Avatar[self.Type .. "s"][Uuid] and Level == self.Level and NewLevel == Avatar[self.Type .. "s"][Uuid].Level then
      self.Level = NewLevel
      self.Target = Avatar[self.Type .. "s"][Uuid]
      if self.Type == "Char" then
        self.ErrorText = "Char_LevelUp_Success"
      elseif self.Type == "Weapon" then
        self.ErrorText = "Weapon_LevelUp_Success"
      end
      self:BlockAllUIInput(true)
      self.CurrentSubUI:OnLevelUpSuccess()
      self.CurrentSubUI.Num_LevelUp:SetText(NewLevel)
      self.Btn_Upgrade:ForbidBtn(true)
      self:UpdateLvUpResourceItems({
        {ResourceId = nil, Count = 0},
        {ResourceId = nil, Count = 0},
        {ResourceId = nil, Count = 0},
        {ResourceId = nil, Count = 0},
        {ResourceId = nil, Count = 0}
      })
      if self.Params and self.Params.LeftCallbackObj and self.Params.LeftCallbackFunction then
        self.Params.LeftCallbackFunction(self.Params.LeftCallbackObj)
      end
    else
      self.ErrorText = "Unknown_Error"
      UIManager(self):ShowUITip("CommonToastMain", GText(self.ErrorText))
    end
  else
    UIManager:ShowError(Ret, 1.5)
  end
end

function Component:OnLevelUpAnimFinishedCallback()
  if self.CurrentMode ~= "LevelUp" then
    return
  end
  if self.Level >= DataMgr[self.Type][self.TargetId][self.Type .. "MaxLevel"] then
    self:UpdateBtnState(true)
    return
  end
  self.Btn_Upgrade:ForbidBtn(false)
  self:BlockAllUIInput(false)
  if self.Level >= self.MaxLevel then
    self.VB_Node:ClearChildren()
    local Params = {
      Target = self.Target,
      Type = self.Type,
      Tag = self.Tag,
      BehaviourType = "BreakLevelUp",
      IsSwitch = true,
      LeftCallbackObj = self.Params.LeftCallbackObj,
      LeftCallbackFunction = self.Params.LeftCallbackFunction,
      CloseBtnCallbackObj = self.Params.CloseBtnCallbackObj,
      CloseBtnCallbackFunction = self.Params.CloseBtnCallbackFunction
    }
    local UIConfig = DataMgr.SystemUI.ArmoryCardLevelWeapon
    self:InitUIInfo(UIConst.LoadInConfig, UIConfig.UIName, nil, self.Type, self.Target, self, Params)
    return
  else
    self:InitLvUpView({
      Target = self.Target,
      Type = self.Type,
      Tag = self.Tag
    })
  end
  if self.Key_Consume and self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Key_Consume:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function Component:UpdateBtnState(bIsMaxLevel)
  DebugPrint(WarningTag, "UpdateBtnStateUpdateBtnStateUpdateBtnState", bIsMaxLevel)
  if bIsMaxLevel then
    self.Btn_Upgrade:ForbidBtn(true)
    self.Panel_Max:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.CurrentSubUI.Btn_Minus:ForbidBtn(true)
    self.CurrentSubUI.Btn_Min:ForbidBtn(true)
    self:BlockAllUIInput(false)
  else
    self.Btn_Upgrade:ForbidBtn(false)
    self.Panel_Max:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.CurrentSubUI.Btn_Minus:ForbidBtn(false)
    self.CurrentSubUI.Btn_Min:ForbidBtn(false)
  end
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
  if CommonUtils:IfExistSystemGuideUI(self) then
    return
  end
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
  if InKeyName == UIConst.GamePadKey.FaceButtonTop and self.CurrentMode == "LevelUp" then
    self:OnUpgradeBtnClicked()
    return true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight and self.IsFocusInItem then
    self:SetFocus()
    self.IsFocusInItem = false
    self.Key_Consume:SetVisibility(UIConst.VisibilityOp.Visible)
    self:ShowCheckBtn(false)
    return true
  elseif InKeyName == UIConst.GamePadKey.DPadLeft then
    self:OnBtnReduceMaxClicked()
    return true
  elseif InKeyName == UIConst.GamePadKey.DPadRight then
    self:OnBtnAddMaxClicked()
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

function Component:OnPreviewKeyDownComp(MyGeometry, InKeyName)
  if InKeyName == UIConst.GamePadKey.DPadLeft then
    self:OnBtnReduceMaxClicked()
    return true
  elseif InKeyName == UIConst.GamePadKey.DPadRight then
    self:OnBtnAddMaxClicked()
    return true
  end
  return false
end

return Component
