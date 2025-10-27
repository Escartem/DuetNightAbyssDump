require("UnLua")
local UIUtils = require("Utils.UIUtils")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
M._components = {
  "BluePrints.UI.BP_EMUserWidgetUtils_C"
}

function M:Init(Params)
  self.Parent = Params.Parent
  self.ActorController = self.Parent.ActorController
  self.Target = Params.Target
  self.Type = Params.Type
  self.IsPreviewMode = Params.IsPreviewMode
  self.bFormPersonalPage = Params.bFormPersonalPage
  self.IsTargetUnowned = Params.IsTargetUnowned
  self.IsCharacterTrialMode = Params.IsCharacterTrialMode
  self.NoReddot = self.IsPreviewMode or self.IsTargetUnowned or self.IsCharacterTrialMode
  self:InitDispatcher()
  self:ResetTarget()
  if self.Type == CommonConst.ArmoryType.Char then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    self:InitCharAppearance()
    self:SwitchCharAppearanceSuits(self.Target.CurrentAppearanceIndex or 1)
    if self.IsPreviewMode or self.IsTargetUnowned then
      self.Panel_Mode:SetVisibility(UIConst.VisibilityOp.Hidden)
      self.Mode_Plan:SetVisibility(UIConst.VisibilityOp.Hidden)
    else
      self.Panel_Mode:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Mode_Plan:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self:ResetAppearancePlanName()
    end
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self:InitWeaponAppearanceSuits()
    self:AddWeaponAppearanceReddotListen(self.Target.WeaponId)
  end
end

function M:GetAppearancePlanNames()
  local AppearanceNames = {}
  for index, value in ipairs(self.Target.AppearanceSuits) do
    local Name = value.AppearanceName
    if not Name or "" == Name then
      Name = "UI_Squad_Appearance_TITLE" .. index
    end
    table.insert(AppearanceNames, GText(Name))
  end
  return AppearanceNames
end

function M:ResetAppearancePlanName()
  local AppearanceNames = self:GetAppearancePlanNames()
  self.Mode_Plan:Init({
    Owner = self,
    OnEditBtnClicked = self.OnAppearanceNameEditBtnClicked,
    OnPlanChanged = self.OnSuitsItemClicked,
    PlanNames = AppearanceNames,
    SelectedItemIndex = self.CurrentSuitsIdx
  })
end

function M:OnAppearanceNameEditBtnClicked()
  local AppearanceNames = self:GetAppearancePlanNames()
  local Data = DataMgr.GlobalConstant.CharPlanNameMax or {ConstantValue = 14}
  self.NameEditDialog = UIManager(self):ShowCommonPopupUI(100176, {
    EditTextConfig = {
      Text = AppearanceNames[self.CurrentSuitsIdx],
      IsMultiLine = false,
      Owner = self,
      TextLimit = Data.ConstantValue,
      bLimitSpaces = true,
      bNotAllowEmpty = true,
      Events = {
        OnTextChanged = function(self, Text)
          if Text == AppearanceNames[self.CurrentSuitsIdx] then
            self.NameEditDialog:GetButtonBar().Btn_Yes:ForbidBtn(true)
          else
            self.NameEditDialog:GetButtonBar().Btn_Yes:ForbidBtn(false)
          end
        end
      },
      bNeedCheckStringSensitive = true,
      OnCheckStringSensitive = function(_, bSuccess, Name)
        if bSuccess then
          Name = Name or ""
          if "" ~= Name then
            local Avatar = GWorld:GetAvatar()
            Avatar:UpdateCharAppearanceSuitName(self.Target.Uuid, self.CurrentSuitsIdx, Name)
          else
          end
        end
      end
    }
  }, self)
end

function M:OnCharAppearanSuitRenamed(Ret, CharUuid, AppearanceIndex, NewName)
  if not ErrorCode:Check(Ret) then
    return
  end
  if CharUuid ~= self.Target.Uuid then
    return
  end
  self:ResetTarget()
  self:ResetAppearancePlanName()
end

function M:InitDispatcher()
  if self.Type == CommonConst.ArmoryType.Char then
    self:AddDispatcher(EventID.OnCharAppearanceChanged, self, self.OnCharAppearanceChanged)
    self:AddDispatcher(EventID.OnCharAccessorySetted, self, self.ResetTarget)
    self:AddDispatcher(EventID.OnCharAccessoryRemoved, self, self.ResetTarget)
    self:AddDispatcher(EventID.OnCharShowPartMesh, self, self.ResetTarget)
    self:AddDispatcher(EventID.OnCharCornerVisibilityChanged, self, self.ResetTarget)
    self:AddDispatcher(EventID.OnCharSkinChanged, self, self.ResetTarget)
    self:AddDispatcher(EventID.OnCharAppearanSuitRenamed, self, self.OnCharAppearanSuitRenamed)
  else
    self:AddDispatcher(EventID.OnWeaponAppearanSuitRenamed, self, self.OnWeaponAppearanSuitRenamed)
  end
end

function M:InitCharAppearance()
  self.AccessoryWidget2Type = {
    [self.Head] = CommonConst.CharAccessoryTypes.Head,
    [self.Face] = CommonConst.CharAccessoryTypes.Face,
    [self.Waist] = CommonConst.CharAccessoryTypes.Waist,
    [self.Back] = CommonConst.CharAccessoryTypes.Back,
    [self.FX_Dead] = CommonConst.CharAccessoryTypes.FX_Dead,
    [self.FX_Teleport] = CommonConst.CharAccessoryTypes.FX_Teleport,
    [self.FX_Footprint] = CommonConst.CharAccessoryTypes.FX_Footprint,
    [self.FX_Body] = CommonConst.CharAccessoryTypes.FX_Body
  }
  self.DefaultCharAccessoryIds = {
    [CommonConst.CharAccessoryTypes.FX_Dead] = DataMgr.GlobalConstant.DefautFXDead.ConstantValue,
    [CommonConst.CharAccessoryTypes.FX_Teleport] = DataMgr.GlobalConstant.DefautFXTeleport.ConstantValue
  }
  self.AccessoryType2Widget = {}
  for key, value in pairs(self.AccessoryWidget2Type) do
    self.AccessoryType2Widget[value] = key
  end
  self.NoneAccessoryIconPaths = ArmoryUtils:GetCharNoneAccessoryIconPaths()
end

function M:InitCharAppearanceSuits()
  local AppearanceSuit = self.Target.AppearanceSuits[self.CurrentSuitsIdx]
  local CharData = self.Target:Data()
  local SkinId = AppearanceSuit.SkinId or CharData.DefaultSkinId
  local SkinData = DataMgr.Skin[SkinId]
  SkinData = SkinData or DataMgr.Skin[CharData.DefaultSkinId]
  local Avatar = ArmoryUtils:GetAvatar()
  local CommonChar = Avatar.CommonChars[self.Target.CharId]
  local Skin = CommonChar and CommonChar.OwnedSkins[SkinId]
  local CharDyeInfos, CurrentDyePlanIndex
  if self.bFormPersonalPage then
    CharDyeInfos = Skin and Skin.Colors or {}
    CurrentDyePlanIndex = Skin and Skin.CurrentPlanIndex or nil
  end
  local SkinItemContent = {
    bDyeable = CharData.DefaultSkinId ~= SkinId,
    IconPath = SkinData.LongIcon,
    Owner = self,
    Type = self.Type,
    IsPreviewMode = self.IsPreviewMode,
    bFormPersonalPage = self.bFormPersonalPage,
    IsTargetUnowned = self.IsTargetUnowned,
    DyeInfos = CharDyeInfos,
    DyePlanIndex = CurrentDyePlanIndex,
    OnClicked = function()
      if not self.bFormPersonalPage then
        local Params = {
          Target = self.Target,
          Type = self.Type,
          SkinId = SkinId,
          OnCloseCallback = self.OnSkinClosed,
          Parent = self,
          IsCharacterTrialMode = self.IsCharacterTrialMode,
          IsTargetUnowned = self.IsTargetUnowned
        }
        self:OpenSkin(Params)
      end
    end,
    TipType = "Skin",
    ItemId = SkinId
  }
  self:OnSkinItemContentCreated(SkinItemContent)
  self.Skin_Char:OnListItemObjectSet(SkinItemContent)
  local PartMeshAccessoryId, PartMeshAccessoryType = self.Target:GetPartMeshAccessoryInfo(SkinId)
  for CharAccessoryType, AccessoryTypeIdx in pairs(CommonConst.NewCharAccessoryTypes) do
    local AccessoryId = AppearanceSuit.Accessory[AccessoryTypeIdx] or self.NoneAccessoryId
    if AccessoryId <= 0 and PartMeshAccessoryType and PartMeshAccessoryType == CharAccessoryType and Skin and Skin.IsShowPartMesh then
      AccessoryId = PartMeshAccessoryId
    end
    local Widget = self.AccessoryType2Widget[CharAccessoryType]
    if Widget then
      local CharAccessoryData = DataMgr.CharAccessory[AccessoryId] or DataMgr.CharPartMesh[AccessoryId]
      local Obj = {
        Owner = self,
        OnClicked = function()
          AudioManager(self):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
          local Params = {
            Target = self.Target,
            Type = self.Type,
            AccessoryId = AccessoryId,
            AccessoryType = CharAccessoryType,
            OnCloseCallback = self.OnSkinClosed,
            IsCharacterTrialMode = self.IsCharacterTrialMode,
            IsTargetUnowned = self.IsTargetUnowned,
            Parent = self
          }
          self:OpenSkin(Params)
        end,
        IsPreviewMode = self.IsPreviewMode,
        IsTargetUnowned = self.IsTargetUnowned,
        TipType = DataMgr.CharAccessory[AccessoryId] and "CharAccessory" or "CharPartMesh"
      }
      Obj.AccessoryId = AccessoryId
      Obj.AccessoryType = CharAccessoryType
      Obj.IsCharacterTrialMode = self.IsCharacterTrialMode
      if CharAccessoryData and self.DefaultCharAccessoryIds[CharAccessoryType] ~= AccessoryId then
        Obj.IconPath = CharAccessoryData.Icon
        Obj.IsNoneIcon = false
        Obj.IsDressed = Obj.ItemId and Obj.ItemId > 0 and Obj.ItemId ~= DataMgr.GlobalConstant.EmptyCharAccessoryID.ConstantValue
      else
        Obj.IconPath = self.NoneAccessoryIconPaths[CharAccessoryType]
        Obj.IsNoneIcon = true
      end
      self:OnAccessoryItemContentCreated(Obj)
      Widget:OnListItemObjectSet(Obj)
    end
  end
end

function M:OpenSkin(Params)
  local UIConfig = DataMgr.SystemUI.ArmorySkin
  UIManager(self):LoadUI(UIConst.LoadInConfig, UIConfig.UIName, self.Parent:GetZOrder(), Params)
end

function M:OnAccessoryItemContentCreated(Content)
end

function M:OnSkinItemContentCreated(Content)
end

function M:InitWeaponAppearanceSuits()
  local Appearacne = self.Target:GetAppearance()
  local WeaponData = self.Target:Data()
  local SkinId = Appearacne.SkinId
  if not SkinId or SkinId <= 0 then
    SkinId = self.Target.WeaponId
  end
  local SkinData = DataMgr.WeaponSkin[SkinId] or {
    LongIcon = WeaponData.LongIcon or WeaponData.GachaIcon
  }
  local ColorInfos, CurrentDyePlanIndex, SpecialColor
  if self.bFormPersonalPage then
    local WeaponDyeInfos = self.Target:GetSkin(SkinId)
    ColorInfos = WeaponDyeInfos.Colors
    SpecialColor = WeaponDyeInfos.SpecialColor
    CurrentDyePlanIndex = WeaponDyeInfos.CurrentPlanIndex
  end
  local SkinItemContent = {
    bDyeable = true,
    IconPath = SkinData.LongIcon,
    Owner = self,
    Type = self.Type,
    bFormPersonalPage = self.bFormPersonalPage,
    IsPreviewMode = self.IsPreviewMode,
    IsTargetUnowned = self.IsTargetUnowned,
    DyeInfos = ColorInfos,
    DyePlanIndex = CurrentDyePlanIndex,
    SpecialColor = SpecialColor,
    OnClicked = function()
      local Params = {
        Target = self.Target,
        Type = self.Type,
        SkinId = SkinId,
        OnCloseCallback = self.OnSkinClosed,
        IsCharacterTrialMode = self.IsCharacterTrialMode,
        IsTargetUnowned = self.IsTargetUnowned,
        Parent = self
      }
      self:OpenSkin(Params)
    end,
    ItemId = DataMgr.WeaponSkin[SkinId] and SkinId or nil,
    TipType = DataMgr.WeaponSkin[SkinId] and "WeaponSkin" or nil
  }
  self:OnSkinItemContentCreated(SkinItemContent)
  self.Skin_Weapon:OnListItemObjectSet(SkinItemContent)
  local WeaponAccessoryData = DataMgr
  local AccessoryId = Appearacne.Accessory[1] or -1
  if AccessoryId then
    WeaponAccessoryData = DataMgr.WeaponAccessory[AccessoryId]
  end
  local AccessoryContent = {
    Owner = self,
    OnClicked = function()
      local Params = {
        Target = self.Target,
        Type = self.Type,
        AccessoryId = AccessoryId,
        OnCloseCallback = self.OnSkinClosed,
        Parent = self,
        IsCharacterTrialMode = self.IsCharacterTrialMode,
        IsTargetUnowned = self.IsTargetUnowned
      }
      self:OpenSkin(Params)
    end,
    IsPreviewMode = self.IsPreviewMode,
    IsTargetUnowned = self.IsTargetUnowned,
    TipType = "WeaponAccessory",
    AccessoryId = AccessoryId
  }
  if not WeaponAccessoryData then
    AccessoryContent.IconPath = UIUtils.GetNoneAccessoryIconPath()
    AccessoryContent.IsNoneIcon = true
  else
    AccessoryContent.IconPath = WeaponAccessoryData.Icon
    AccessoryContent.IsNoneIcon = false
  end
  self:OnAccessoryItemContentCreated(AccessoryContent)
  self.Accessory:OnListItemObjectSet(AccessoryContent)
end

function M:Construct()
  self.NoneAccessoryId = DataMgr.GlobalConstant.EmptyCharAccessoryID.ConstantValue
end

function M:OnSkinClosed()
  self.Parent:BlockAllUIInput(false)
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain then
    ArmoryMain:ResetActorRotation()
    ArmoryMain:UpdateMontageAndCamera()
  end
end

function M:SwitchCharAppearanceSuits(SuitsIdx)
  self.CurrentSuitsIdx = SuitsIdx
  self:InitCharAppearanceSuits()
  self:AddCharAppearanceReddotListen(self.Target.CharId)
end

function M:OnSuitsItemClicked(Index)
  self.Parent:BlockAllUIInput(true)
  local Avatar = GWorld:GetAvatar()
  Avatar:SwitchCurrentCharAppearance(self.Target.Uuid, Index)
end

function M:OnCharAppearanceChanged(Ret, CharUuid, AppearancIndex)
  self.Parent:BlockAllUIInput(false)
  if not ErrorCode:Check(Ret) then
    return
  end
  self:ResetTarget()
  self:SwitchCharAppearanceSuits(self.Target.CurrentAppearanceIndex)
  if self.ActorController and self.ActorController.ArmoryPlayer then
    self.ActorController.ArmoryPlayer.CharacterFashion:InitAppearanceSuit(self.Target:DumpAppearanceSuit(GWorld:GetAvatar()))
    self.ActorController.DelayFrame = 30
    self.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, nil, CommonConst.ArmoryTag.Appearance)
  end
  self:PlayAnimation(self.Change)
end

function M:ResetTarget()
  local Avatar = ArmoryUtils:GetAvatar()
  if self.Type == CommonConst.ArmoryType.Char then
    self.Target = Avatar.Chars[self.Target.Uuid] or self.Target
  else
    self.Target = Avatar.Weapons[self.Target.Uuid] or self.Target
  end
end

function M:PlayInAnim()
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
end

function M:PlayOutAnim()
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
end

function M:AddCharAppearanceReddotListen(CharId)
  if self.NoReddot then
    return
  end
  self.AppearanceNodeNames = self.AppearanceNodeNames or {}
  self:RemoveAppearanceReddotListen()
  local Avatar = GWorld:GetAvatar()
  local CommonChar = Avatar.CommonChars[CharId]
  for _, Type in pairs(CommonConst.CharAccessoryTypes) do
    local LeafNodes = {}
    local NodeName = CharId .. CommonConst.DataType.CharAccessory .. Type
    if self[Type] then
      local LeafNodeName = CommonConst.DataType.CharAccessory .. Type
      LeafNodes[LeafNodeName] = ReddotManager.GetTreeNode(LeafNodeName) and 1 or nil
      for key, Skin in pairs(CommonChar.OwnedSkins) do
        LeafNodeName = LeafNodeName .. Skin.SkinId
        LeafNodes[LeafNodeName] = ReddotManager.GetTreeNode(LeafNodeName) and 1 or nil
      end
      if not IsEmptyTable(LeafNodes) then
        ReddotManager.AddListener(NodeName, self, function(_self, Count)
          self[Type].Content.IsNew = Count > 0
          self[Type]:SetIsNew(Count > 0)
        end, LeafNodes)
        self.AppearanceNodeNames[NodeName] = 1
      end
    end
  end
  local NodeName = CommonConst.DataType.Char .. CommonConst.DataType.Skin .. CharId
  self.AppearanceNodeNames[NodeName] = 1
  ReddotManager.AddListener(NodeName, self, function(_self, Count)
    self.Skin_Char.Content.IsNew = Count > 0
    self.Skin_Char:SetIsNew(Count > 0)
  end, nil, true)
end

function M:RemoveAppearanceReddotListen()
  if self.NoReddot then
    return
  end
  for key, value in pairs(self.AppearanceNodeNames) do
    ReddotManager.RemoveListener(key, self)
  end
  self.AppearanceNodeNames = {}
end

function M:AddWeaponAppearanceReddotListen(WeaponId)
  if self.NoReddot then
    return
  end
  self.AppearanceNodeNames = self.AppearanceNodeNames or {}
  self:RemoveAppearanceReddotListen()
  local NodeName = WeaponId .. CommonConst.DataType.Weapon .. CommonConst.DataType.WeaponSkin
  local LeafNodes = {}
  local Data = DataMgr.Weapon[WeaponId]
  if Data and Data.SkinApplicationType then
    for _, value in pairs(Data.SkinApplicationType) do
      local LeafNodeName = CommonConst.DataType.WeaponSkin .. (value or "")
      LeafNodes[LeafNodeName] = ReddotManager.GetTreeNode(LeafNodeName) and 1 or nil
    end
  end
  self.AppearanceNodeNames[NodeName] = 1
  if not IsEmptyTable(LeafNodes) then
    ReddotManager.AddListener(NodeName, self, function(_self, Count)
      self.Skin_Weapon.Content.IsNew = Count > 0
      self.Skin_Weapon:SetIsNew(Count > 0)
    end, LeafNodes)
  end
  local WeaponAccessoryNodeName = CommonConst.DataType.WeaponAccessory
  self.AppearanceNodeNames[WeaponAccessoryNodeName] = 1
  ReddotManager.AddListener(WeaponAccessoryNodeName, self, function(_self, Count)
    self.Accessory.Content.IsNew = Count > 0
    self.Accessory:SetIsNew(Count > 0)
  end, nil, true)
end

function M:Destruct()
  self:RemoveAppearanceReddotListen()
end

AssembleComponents(M)
return M
