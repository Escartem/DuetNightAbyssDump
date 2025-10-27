require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local SkillUtils = require("Utils.SkillUtils")
local Component = {}

function Component:MainTabReddotFunc(TabName, bNew, bUpgradeable)
  local Content = self.MainTabs[self.MainTabName2Idx[TabName]]
  if not Content then
    return
  end
  Content.IsNew = bNew
  Content.ShowRedDot = bUpgradeable
  if IsValid(Content.UI) then
    Content.UI:SetReddot(Content.IsNew, Content.ShowRedDot)
  end
end

function Component:SubTabReddotFunc(TabName, bNew, bUpgradeable, bUnlockable)
  if not self.SubTabName2Idx then
    return
  end
  local Content = self.SubTabs[self.SubTabName2Idx[TabName]]
  if not Content then
    return
  end
  Content.IsNew = bNew
  Content.Upgradeable = bUpgradeable
  Content.Unlockable = bUnlockable
  if IsValid(Content.Widget) then
    Content.Widget:SetReddot(Content.IsNew, Content.Upgradeable or Content.Unlockable)
  end
end

function Component:AddMainTabReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveMainTabReddotListen()
  if self.bListened then
    return
  end
  
  local function WeaponReddotFunc(WeaponType, IsNew, IsRed)
    self:MainTabReddotFunc(WeaponType, IsNew, IsRed)
    if self.CurMainTab.Name == WeaponType then
      self.Btn_Selective:SetReddot(IsNew, IsRed)
    end
  end
  
  self:AddMeleeReddotListen(function(self, Count)
    local NewNode = ReddotManager.GetTreeNode(CommonConst.WeaponType.MeleeWeapon)
    local RewardNode = ReddotManager.GetTreeNode(DataMgr.ReddotNode.MeleeReward.Name)
    local IsNew = NewNode.Count > 0
    local IsRed = RewardNode.Count > 0
    WeaponReddotFunc(ArmoryUtils.ArmoryMainTabNames.Melee, IsNew, IsRed)
    if self.CurMainTab.Name == ArmoryUtils.ArmoryMainTabNames.Melee then
      self.Btn_Selective:SetReddot(IsNew, IsRed)
    end
  end)
  self:AddRangedReddotListen(function(self, Count)
    local NewNode = ReddotManager.GetTreeNode(CommonConst.WeaponType.RangedWeapon)
    local RewardNode = ReddotManager.GetTreeNode(DataMgr.ReddotNode.RangedReward.Name)
    local IsNew = NewNode.Count > 0
    local IsRed = RewardNode.Count > 0
    WeaponReddotFunc(ArmoryUtils.ArmoryMainTabNames.Ranged, IsNew, IsRed)
    if self.CurMainTab.Name == ArmoryUtils.ArmoryMainTabNames.Ranged then
      self.Btn_Selective:SetReddot(IsNew, IsRed)
    end
  end)
  self:AddBattleItemReddotListen(function(self, Count)
    self:MainTabReddotFunc(ArmoryUtils.ArmoryMainTabNames.BattleWheel, Count > 0)
  end)
  self:AddCharReddotReddotListen(function(Count)
    local NewCharNode = ReddotManager.GetTreeNode(DataMgr.ReddotNode.NewChar.Name)
    local HasPromoteCharReddot = self:CheckCharPromoteReddot(self.ComparedChar)
    local CharRewardNode = ReddotManager.GetTreeNode(DataMgr.ReddotNode.CharReward.Name)
    local UnlockableCharNode = ReddotManager.GetTreeNode(DataMgr.ReddotNode.UnlockableChar.Name)
    local IsNew = NewCharNode.Count > 0
    local IsRed = HasPromoteCharReddot or CharRewardNode.Count > 0 or UnlockableCharNode.Count > 0
    self:MainTabReddotFunc(ArmoryUtils.ArmoryMainTabNames.Char, IsNew, IsRed)
    if self.CurMainTab.Name == ArmoryUtils.ArmoryMainTabNames.Char then
      self.Btn_Selective:SetReddot(IsNew, IsRed)
    end
  end)
  self:AddNewPetReddotListen(function(self, Count)
    self:MainTabReddotFunc(ArmoryUtils.ArmoryMainTabNames.Pet, Count > 0)
    if self.CurMainTab.Name == ArmoryUtils.ArmoryMainTabNames.Pet then
      self:UpdateBoxReddot()
    end
  end)
  self.bListened = true
end

function Component:CheckCharPromoteReddot(Char)
  if ArmoryUtils:GetCharByUuid(self.ComparedChar.Uuid) == nil then
    return
  end
  local PromoteNode = ReddotManager.GetTreeNode(DataMgr.ReddotNode.PromoteChar.Name)
  local UuidStr = CommonUtils.ObjId2Str(Char.Uuid)
  local PromoteCharCacheDetail = ReddotManager.GetLeafNodeCacheDetail(DataMgr.ReddotNode.PromoteChar.Name)
  return PromoteNode and PromoteNode.Count > 0 and 1 == PromoteCharCacheDetail[UuidStr]
end

function Component:CheckCharSkillReddot(Char)
  local UuidStr = CommonUtils.ObjId2Str(Char.Uuid)
  local NodeName = CommonConst.DataType.Char .. Const.Skill .. UuidStr
  local CharSkillNode = ReddotManager.GetTreeNode(NodeName)
  if CharSkillNode and CharSkillNode.Count > 0 then
    return true
  end
  return self:CheckCharSkillTreeSubNodeReddot(Char)
end

function Component:CheckCharSkillTreeSubNodeReddot(Char)
  local SkillTreeData = DataMgr.SkillTree[Char.CharId]
  if SkillTreeData then
    for i = 1, 3 do
      for j = 2, 3 do
        local IsNodeActivated = Char:CheckSkillTreeNodeIsActive(i, j)
        if not IsNodeActivated then
          local Res = SkillUtils.CanSkillTreeNodeUnlock(Char, i, j)
          if Res.CanUnlock then
            return true
          end
        end
      end
    end
  end
end

function Component:CheckCharAppearanceReddot(Char)
  local Avatar = GWorld:GetAvatar()
  local CommonChar = Avatar.CommonChars[Char.CharId]
  local Count = 0
  for _, Type in pairs(CommonConst.CharAccessoryTypes) do
    local LeafNodeName = CommonConst.DataType.CharAccessory .. Type
    local CharAccessoryNode = ReddotManager.GetTreeNode(LeafNodeName)
    local NewAccessoryCount = CharAccessoryNode and CharAccessoryNode.Count or 0
    Count = Count + NewAccessoryCount
    for key, Skin in pairs(CommonChar.OwnedSkins) do
      LeafNodeName = LeafNodeName .. Skin.SkinId
      local SkinNewAccessoryNode = ReddotManager.GetTreeNode(LeafNodeName)
      local SkinNewAccessoryCount = SkinNewAccessoryNode and SkinNewAccessoryNode.Count or 0
      Count = Count + SkinNewAccessoryCount
    end
  end
  local LeafNodeName = CommonConst.DataType.Char .. CommonConst.DataType.Skin .. Char.CharId
  local SkinNode = ReddotManager.GetTreeNode(LeafNodeName)
  local NewSkinCount = SkinNode and SkinNode.Count or 0
  Count = Count + NewSkinCount
  return Count > 0
end

function Component:CheckWeaponAppearanceReddot(Weapon)
  local Count = 0
  local WeaponAccessoryNode = ReddotManager.GetTreeNode(CommonConst.DataType.WeaponAccessory)
  Count = Count + (WeaponAccessoryNode and WeaponAccessoryNode.Count or 0)
  local Data = DataMgr.Weapon[Weapon.WeaponId]
  if Data and Data.SkinApplicationType then
    for _, value in pairs(Data.SkinApplicationType) do
      local NodeName = CommonConst.DataType.WeaponSkin .. (value or "")
      local WeaponSkinNode = ReddotManager.GetTreeNode(NodeName)
      Count = Count + (WeaponSkinNode and WeaponSkinNode.Count or 0)
    end
  end
  return Count > 0
end

function Component:AddSubTabReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveSubTabReddotListen()
  if self.CurSubTab.Type == CommonConst.ArmoryType.Char then
    self:AddCharAttributeReddotListen(function(self, Count)
      local CharRewardNodeCache = ReddotManager.GetLeafNodeCacheDetail(DataMgr.ReddotNode.CharReward.Name) or {}
      local UnLockableCharNodeCache = ReddotManager.GetLeafNodeCacheDetail(DataMgr.ReddotNode.UnlockableChar.Name) or {}
      local HasReddot = 1 == CharRewardNodeCache[self.ComparedChar.CharId] or 1 == UnLockableCharNodeCache[self.ComparedChar.CharId]
      self:SubTabReddotFunc(ArmoryUtils.ArmorySubTabNames.Attribute, nil, HasReddot)
    end, self.ComparedChar.CharId)
    self:AddCharAppearanceReddotListen(function(self, Count)
      self:SubTabReddotFunc(ArmoryUtils.ArmorySubTabNames.Appearance, Count > 0)
    end, self.ComparedChar.CharId)
    self:AddCharRedordReddotListen(function(self, Count)
      self:SubTabReddotFunc(ArmoryUtils.ArmorySubTabNames.Files, Count > 0)
    end, self.ComparedChar.CharId)
    self:AddCharSkillReddotListen(function(self, Count)
      local bShowReddot = Count > 0
      bShowReddot = bShowReddot or self:CheckCharSkillTreeSubNodeReddot(self.ComparedChar)
      self:SubTabReddotFunc(ArmoryUtils.ArmorySubTabNames.Skill, false, bShowReddot)
    end, self.ComparedChar.Uuid)
  elseif self.CurSubTab.Type == CommonConst.ArmoryType.Weapon then
    local WeaponType = CommonUtils.GetWeaponTypeById(self[self.ComparedWeaponName].WeaponId) or ""
    self:AddWeaponAttributeReddotListen(function(Count)
      local Avatar = GWorld:GetAvatar()
      local HasReward = Avatar:IsWeaponHasReward(self[self.ComparedWeaponName].WeaponId)
      self:SubTabReddotFunc(ArmoryUtils.ArmorySubTabNames.Attribute, nil, HasReward)
    end, self[self.ComparedWeaponName].WeaponId, WeaponType)
    self:AddWeaponAppearanceReddotListen(function(self, Count)
      self:SubTabReddotFunc(ArmoryUtils.ArmorySubTabNames.Appearance, Count > 0)
    end, self[self.ComparedWeaponName].WeaponId)
  end
end

function Component:RemoveMainTabReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  if not self.bListened then
    return
  end
  self:RemoveCharReddotListen()
  self:RemoveNewCharReddotListen()
  self:RemoveMeleeReddotListen()
  self:RemoveRangedReddotListen()
  self:RemoveBattleItemReddotListen()
  self:RemovePromoteCharReddotListen()
  self:RemoveNewPetReddotListen()
  self.bListened = false
end

function Component:RemoveSubTabReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveCharAttributeReddotListen()
  self:RemoveCharAppearanceReddotListen()
  self:RemoveWeaponAttributeReddotListen()
  self:RemoveWeaponAppearanceReddotListen()
  self:RemoveCharRedordReddotListen()
  self:RemoveCharSkillReddotListen()
end

function Component:AddCharReddotReddotListen(Callback)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveCharReddotListen()
  local NodeName = DataMgr.ReddotNode.ArmoryMainMenu.Name
  ReddotManager.AddListener(NodeName, self, Callback)
end

function Component:AddNewCharReddotListen(Callback)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveNewCharReddotListen()
  local NodeName = DataMgr.ReddotNode.NewChar.Name
  if not self.NewCharNodeNames then
    self.NewCharNodeNames = {}
  end
  if not self.NewCharNodeNames[NodeName] then
    ReddotManager.AddListener(NodeName, self, Callback, nil, 1)
    self.NewCharNodeNames[NodeName] = 1
  end
end

function Component:RemoveNewCharReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:_RemoveReddotListenerCommon(DataMgr.ReddotNode.NewChar.Name)
end

function Component:AddNewPetReddotListen(Callback)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveNewPetReddotListen()
  local NodeName = CommonConst.DataType.Pet
  if not self.NewPetNodeNames then
    self.NewPetNodeNames = {}
  end
  if not self.NewPetNodeNames[NodeName] then
    ReddotManager.AddListener(NodeName, self, Callback, nil, 1)
    self.NewPetNodeNames[NodeName] = 1
  end
end

function Component:RemoveNewPetReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:_RemoveReddotListenerCommon(CommonConst.DataType.Pet)
end

function Component:AddCharSkillReddotListen(Callback, CharUuid)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveCharSkillReddotListen()
  local NodeName = CommonConst.DataType.Char .. Const.Skill .. CommonUtils.ObjId2Str(CharUuid)
  if not self.CharSkillNodeNames then
    self.CharSkillNodeNames = {}
  end
  if not self.CharSkillNodeNames[NodeName] then
    ReddotManager.AddListener(NodeName, self, Callback, nil, 1)
    self.CharSkillNodeNames[NodeName] = 1
  end
end

function Component:RemoveCharSkillReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:_RemoveReddotListenerCommon(CommonConst.DataType.Char .. Const.Skill)
end

function Component:AddPromoteCharReddotListen(Callback)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemovePromoteCharReddotListen()
  local NodeName = DataMgr.ReddotNode.PromoteChar.Name
  if not self.PromoteCharNodeNames then
    self.PromoteCharNodeNames = {}
  end
  if not self.PromoteCharNodeNames[NodeName] then
    ReddotManager.AddListener(NodeName, self, Callback, nil, 1)
    self.PromoteCharNodeNames[NodeName] = 1
  end
end

function Component:RemovePromoteCharReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:_RemoveReddotListenerCommon(DataMgr.ReddotNode.PromoteChar.Name)
end

function Component:AddCharRedordReddotListen(Callback, CharId)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveCharRedordReddotListen()
  if self.UnownedCharContentMap[CharId] then
    return
  end
  local SumNodeName = table.concat({
    "CharFile",
    self.ComparedChar.CharId
  }, "_")
  local RecordNodeName = table.concat({
    "Record",
    self.ComparedChar.CharId
  }, "_")
  ArmoryUtils:InitCharRecoedReddotNode(CharId)
  local RecordNode = ReddotManager.GetTreeNode(RecordNodeName)
  if not self.CharRecordNodeNames then
    self.CharRecordNodeNames = {}
  end
  local LeafNodes = {}
  if RecordNode then
    LeafNodes[RecordNodeName] = {1}
  end
  if not self.CharRecordNodeNames[SumNodeName] then
    local LeafNodes = {}
    LeafNodes[DataMgr.ReddotNode.CharReward.Name] = 1
  end
  if not self.CharRecordNodeNames[SumNodeName] and not IsEmptyTable(LeafNodes) then
    ReddotManager.AddListener(SumNodeName, self, Callback, LeafNodes)
    self.CharRecordNodeNames[SumNodeName] = 1
  end
end

function Component:OnCharUpgraded(Ret, Uuid, CurLevel, NewLevel)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  local Char = ArmoryUtils:GetCharByUuid(Uuid)
  ArmoryUtils:InitCharRecoedReddotNode(Char.CharId)
end

function Component:RemoveCharRedordReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:_RemoveReddotListenerCommon("CharRecord")
end

function Component:AddCharAttributeReddotListen(Callback, CharId)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveCharAttributeReddotListen()
  local NodeName = CommonConst.DataType.Char .. ArmoryUtils.ArmorySubTabNames.Attribute .. CharId
  if not self.CharAttributeNodeNames then
    self.CharAttributeNodeNames = {}
  end
  if not self.CharAttributeNodeNames[NodeName] then
    local LeafNodes = {}
    LeafNodes[DataMgr.ReddotNode.CharReward.Name] = 1
    LeafNodes[DataMgr.ReddotNode.UnlockableChar.Name] = 1
    ReddotManager.AddListener(NodeName, self, Callback, LeafNodes)
    self.CharAttributeNodeNames[NodeName] = 1
  end
end

function Component:RemoveCharAttributeReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:_RemoveReddotListenerCommon(CommonConst.DataType.Char .. ArmoryUtils.ArmorySubTabNames.Attribute)
end

function Component:AddCharAppearanceReddotListen(Callback, CharId)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveCharAppearanceReddotListen()
  local NodeName = CommonConst.DataType.Char .. ArmoryUtils.ArmorySubTabNames.Appearance .. CharId
  if not self.CharAppearanceNodeNames then
    self.CharAppearanceNodeNames = {}
  end
  local Avatar = GWorld:GetAvatar()
  local CommonChar = Avatar.CommonChars[CharId]
  local LeafNodes = {}
  for _, Type in pairs(CommonConst.CharAccessoryTypes) do
    local LeafNodeName = CommonConst.DataType.CharAccessory .. Type
    LeafNodes[LeafNodeName] = ReddotManager.GetTreeNode(LeafNodeName) and 1 or nil
    for key, Skin in pairs(CommonChar.OwnedSkins) do
      LeafNodeName = LeafNodeName .. Skin.SkinId
      LeafNodes[LeafNodeName] = ReddotManager.GetTreeNode(LeafNodeName) and 1 or nil
    end
  end
  local LeafNodeName = CommonConst.DataType.Char .. CommonConst.DataType.Skin .. CharId
  LeafNodes[LeafNodeName] = ReddotManager.GetTreeNode(LeafNodeName) and 1 or nil
  if not self.CharAppearanceNodeNames[NodeName] and not IsEmptyTable(LeafNodes) then
    ReddotManager.AddListener(NodeName, self, Callback, LeafNodes)
    self.CharAppearanceNodeNames[NodeName] = 1
  end
end

function Component:RemoveCharAppearanceReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:_RemoveReddotListenerCommon(CommonConst.DataType.Char .. ArmoryUtils.ArmorySubTabNames.Appearance)
end

function Component:AddWeaponAttributeReddotListen(Callback, WeaponId, WeaponType)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveWeaponAttributeReddotListen()
  WeaponType = WeaponType or ""
  self.WeaponAttributeNodeNames = self.WeaponAttributeNodeNames or {}
  local NodeName = CommonConst.DataType.Weapon .. ArmoryUtils.ArmorySubTabNames.Attribute
  local LeafNodes = {}
  if WeaponType == CommonConst.WeaponType.MeleeWeapon then
    LeafNodes[DataMgr.ReddotNode.MeleeReward.Name] = ReddotManager.GetTreeNode(DataMgr.ReddotNode.MeleeReward.Name) and 1 or nil
  elseif WeaponType == CommonConst.WeaponType.RangedWeapon then
    LeafNodes[DataMgr.ReddotNode.RangedReward.Name] = ReddotManager.GetTreeNode(DataMgr.ReddotNode.RangedReward.Name) and 1 or nil
  end
  if not self.WeaponAttributeNodeNames[NodeName] and not IsEmptyTable(LeafNodes) then
    ReddotManager.AddListener(NodeName, self, Callback, LeafNodes)
    self.WeaponAttributeNodeNames[NodeName] = 1
  end
end

function Component:RemoveWeaponAttributeReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:_RemoveReddotListenerCommon(CommonConst.DataType.Weapon .. ArmoryUtils.ArmorySubTabNames.Appearance)
end

function Component:AddWeaponAppearanceReddotListen(Callback, WeaponId)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveWeaponAppearanceReddotListen()
  local NodeName = CommonConst.DataType.Weapon .. ArmoryUtils.ArmorySubTabNames.Appearance .. WeaponId
  if not self.WeaponAppearanceNodeNames then
    self.WeaponAppearanceNodeNames = {}
  end
  local LeafNodes = {}
  local LeafNodeName = CommonConst.DataType.WeaponAccessory
  LeafNodes[LeafNodeName] = ReddotManager.GetTreeNode(LeafNodeName) and 1 or nil
  local Data = DataMgr.Weapon[WeaponId]
  if Data and Data.SkinApplicationType then
    for _, value in pairs(Data.SkinApplicationType) do
      LeafNodeName = CommonConst.DataType.WeaponSkin .. (value or "")
      LeafNodes[LeafNodeName] = ReddotManager.GetTreeNode(LeafNodeName) and 1 or nil
    end
  end
  if not self.WeaponAppearanceNodeNames[NodeName] and not IsEmptyTable(LeafNodes) then
    ReddotManager.AddListener(NodeName, self, Callback, LeafNodes)
    self.WeaponAppearanceNodeNames[NodeName] = 1
  end
end

function Component:RemoveWeaponAppearanceReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:_RemoveReddotListenerCommon(CommonConst.DataType.Weapon .. ArmoryUtils.ArmorySubTabNames.Appearance)
end

function Component:AddBattleItemReddotListen(Callback)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveBattleItemReddotListen()
  local NodeName = DataMgr.ReddotNode.ArmoryBattleItem.Name
  if not self.ArmoryBattleItemNodeNames then
    self.ArmoryBattleItemNodeNames = {}
  end
  if not self.ArmoryBattleItemNodeNames[NodeName] then
    ReddotManager.AddListener(NodeName, self, Callback, nil, 1)
    self.ArmoryBattleItemNodeNames[NodeName] = 1
  end
end

function Component:RemoveBattleItemReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:_RemoveReddotListenerCommon(DataMgr.ReddotNode.ArmoryBattleItem.Name)
end

function Component:RemoveCharReddotListen(Callback)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:_RemoveReddotListenerCommon(CommonConst.DataType.Char)
  ReddotManager.RemoveListener(DataMgr.ReddotNode.ArmoryMainMenu.Name, self)
end

function Component:AddMeleeReddotListen(Callback)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveMeleeReddotListen()
  local NodeName = CommonConst.WeaponType.MeleeWeapon .. "MainTab"
  if not self.MeleeNodeNames then
    self.MeleeNodeNames = {}
  end
  local LeafNodes = {}
  LeafNodes[DataMgr.ReddotNode.MeleeReward.Name] = -1
  LeafNodes[CommonConst.WeaponType.MeleeWeapon] = 1
  if not self.MeleeNodeNames[NodeName] and not IsEmptyTable(LeafNodes) then
    ReddotManager.AddListener(NodeName, self, Callback, LeafNodes, -1)
    self.MeleeNodeNames[NodeName] = 1
  end
end

function Component:RemoveMeleeReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:_RemoveReddotListenerCommon(CommonConst.WeaponType.MeleeWeapon .. "MainTab")
end

function Component:AddRangedReddotListen(Callback)
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:RemoveRangedReddotListen()
  local NodeName = CommonConst.WeaponType.RangedWeapon .. "MainTab"
  if not self.RangedNodeNames then
    self.RangedNodeNames = {}
  end
  local LeafNodes = {}
  LeafNodes[DataMgr.ReddotNode.RangedReward.Name] = -1
  LeafNodes[CommonConst.WeaponType.RangedWeapon] = -1
  if not self.RangedNodeNames[NodeName] and not IsEmptyTable(LeafNodes) then
    ReddotManager.AddListener(NodeName, self, Callback, LeafNodes, -1)
    self.RangedNodeNames[NodeName] = 1
  end
end

function Component:RemoveRangedReddotListen()
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:_RemoveReddotListenerCommon(CommonConst.WeaponType.RangedWeapon .. "MainTab")
end

function Component:_GetModReddotNodeName(Target)
  local UuidStr
  local Uuid = Target.Uuid
  local Type = type(Uuid)
  if "number" == Type then
    UuidStr = Uuid
  else
    UuidStr = CommonUtils.ObjId2Str(Uuid)
  end
  local NodeName = CommonConst.DataType.Mod .. UuidStr
  return NodeName
end

function Component:AddModReddotListen(Callback, Target)
  if self.IsAbyss then
    return
  end
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  if Callback then
    self:RemoveModReddotListen()
  end
  if not self.ModNodeNames then
    self.ModNodeNames = {}
  end
  local NodeName = self:_GetModReddotNodeName(Target)
  local LeafNodes = {}
  for _, value in pairs(Target.ModApplicationType or {}) do
    if not DataMgr.ModTag[value] then
    else
      local LeafNodeName = CommonConst.DataType.Mod .. value
      LeafNodes[LeafNodeName] = ReddotManager.GetTreeNode(LeafNodeName) and 1 or nil
    end
  end
  if not self.ModNodeNames[NodeName] and not IsEmptyTable(LeafNodes) then
    if not Callback then
      ReddotManager.AddNode(NodeName, LeafNodes, Const.ReddotCacheType.UserCache)
    else
      ReddotManager.AddListener(NodeName, self, Callback, LeafNodes)
      self.ModNodeNames[NodeName] = 1
    end
  end
end

function Component:RemoveModReddotListen()
  if self.IsAbyss then
    return
  end
  if self.IsPreviewMode or self.NoReddot then
    return
  end
  self:_RemoveReddotListenerCommon(CommonConst.DataType.Mod)
end

function Component:_RemoveReddotListenerCommon(Tag)
  if not self[Tag .. "NodeNames"] then
    return
  end
  for NodeName, _ in pairs(self[Tag .. "NodeNames"] or {}) do
    ReddotManager.RemoveListener(NodeName, self)
  end
  self[Tag .. "NodeNames"] = nil
end

return Component
