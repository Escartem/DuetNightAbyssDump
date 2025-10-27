local UIUtils = require("Utils.UIUtils")
local Component = {}

function Component:TriggerShowCanonMiniGameReward()
  local RougeGameSettlement = UIManager(self):GetUIObj("RougeGameSettlement")
  if IsValid(RougeGameSettlement) then
    RougeGameSettlement:InitRewardAndShow(self.CanonMiniGameRewards)
  end
  self.CanonMiniGameRewards = nil
end

function Component:OnUpdateAward(UpdateInfo)
  if self.IsLoading then
    self.UpdateInfo = UpdateInfo
    return
  end
  local IsEventAward = self.bHandleEventTime
  self:PrintUpdateInfo(UpdateInfo)
  
  local function _Callback(...)
    self.AwardList = {}
    self:ShowRougeAward(UpdateInfo, IsEventAward)
  end
  
  local RoomInfo = DataMgr.RougeLikeRoom[self.RoomId]
  local TypeInfo = DataMgr.RougeLikeRoomType[RoomInfo.RoomType]
  if TypeInfo.EnableAwardDelay and self.IsPassRoomAward then
    self:AddTimer(1.5, _Callback)
  else
    _Callback()
  end
end

function Component:TryEventPassRoom()
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  assert(GameMode, "GameMode\228\184\141\229\173\152\229\156\168")
  if self.bHandleEventTime and self.RandomBlessings:Num() <= 0 and self.RandomTreasures:Num() <= 0 then
    EventManager:FireEvent(EventID.OnRougeDealEventReward)
  end
end

function Component:ListenDealRewardEvent()
  DebugPrint("RougeLikeManager:ListenDealRewardEvent RoomId:", self.RoomId)
  self.IsListeningDealRewardEvent = true
  EventManager:AddEvent(EventID.OnRougeDealEventReward, self, self.OnEventRewardDeal)
end

function Component:OnEventRewardDeal()
  self.IsListeningDealRewardEvent = false
  DebugPrint("RougeLikeManager:OnEventRewardDeal RoomId:", self.RoomId)
  EventManager:RemoveEvent(EventID.OnRougeDealEventReward, self)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  GameMode:PostCustomEvent("EventPassRoom")
end

function Component:ShowRougeAward(UpdateInfo, IsEventAward)
  self:FillAwardList(UpdateInfo)
  if not self.IsGettingAward then
    self:ShowNextAward(self.AwardList, IsEventAward)
  end
end

function Component:FillAwardList(UpdateInfo)
  if self.IsGettingAward then
    DebugPrint("@zyh \230\173\163\229\156\168\229\188\185\229\135\186\229\165\150\229\138\177\228\191\161\230\129\175\239\188\140\230\150\176\232\191\155\229\165\150\229\138\177\229\161\158\232\191\155BackUp")
    table.insert(self.BackUpAwardList, UpdateInfo)
  else
    table.insert(self.AwardList, UpdateInfo)
  end
end

function Component:ShowNextAward(AwardList, IsEventAward)
  self.IsGettingAward = false
  if next(AwardList) == nil then
    if not self.BackUpAwardList or nil == next(self.BackUpAwardList) then
      return
    else
      AwardList = CommonUtils.DeepCopy(self.BackUpAwardList)
      self.BackUpAwardList = {}
    end
  end
  self.IsGettingAward = true
  local Type = AwardList[1].Type
  local Event = AwardList[1].Event
  if "3Choose1" == Event then
    if "Blessing" == Type then
      UIManager(self):LoadUINew("Rouge_Blessing_3Choose1", AwardList, IsEventAward)
    else
      UIManager(self):LoadUINew("Rouge_Treasure_3Choose1", AwardList, IsEventAward)
    end
  elseif "Add" == Event then
    local InfoDatas = {}
    local InfoDataList = {}
    for _, value in pairs(AwardList[1].AwardsId) do
      local RandomInfo
      if "Blessing" == Type then
        local BlessingId = value.ItemId
        RandomInfo = DataMgr.RougeLikeBlessing[BlessingId]
      else
        local TreasureId = value.ItemId
        RandomInfo = DataMgr.RougeLikeTreasure[TreasureId]
      end
      table.insert(InfoDataList, RandomInfo)
    end
    InfoDatas.Islose = false
    InfoDatas.InfoDataList = InfoDataList
    if AwardList[1].IsCanonMiniGameReward then
      if not self.CanonMiniGameRewards then
        self.CanonMiniGameRewards = {}
      end
      for _, Info in pairs(InfoDatas.InfoDataList) do
        table.insert(self.CanonMiniGameRewards, Info)
      end
      table.remove(self.AwardList, 1)
      self:ShowNextAward(self.AwardList)
    else
      UIManager(self):LoadUINew(UIConst.GetItemsTip, InfoDatas, AwardList)
    end
  elseif "Upgrade" == Event then
    local Params = {}
    Params.ItemId = AwardList[1].AwardsId[1].ItemId
    Params.OldLevel = AwardList[1].AwardsId[1].OldLevel
    Params.NewLevel = AwardList[1].AwardsId[1].NewLevel
    UIManager(self):LoadUINew(UIConst.UpgradeTip, Params)
  elseif "Remove" == Event then
    local InfoDatas = {}
    local InfoDataList = {}
    for index, value in pairs(AwardList[1].AwardsId) do
      local RandomInfo
      if "Blessing" == Type then
        local BlessingId = value.ItemId
        RandomInfo = DataMgr.RougeLikeBlessing[BlessingId]
      else
        local TreasureId = value.ItemId
        RandomInfo = DataMgr.RougeLikeTreasure[TreasureId]
      end
      table.insert(InfoDataList, RandomInfo)
    end
    InfoDatas.Islose = true
    InfoDatas.InfoDataList = InfoDataList
    UIManager(self):LoadUINew(UIConst.GetItemsTip, InfoDatas, AwardList)
  elseif "Mark" == Event then
    self:TriggerShowCanonMiniGameReward()
  end
end

function Component:OnChooseAwardFinished()
end

function Component:AddTreasures(TreasureId, Level)
  if not self.Treasures:FindRef(TreasureId) then
    self.PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
    local TreasureData = DataMgr.RougeLikeTreasure[TreasureId]
    if self.PlayerCharacter and self.PlayerCharacter.InitSuccess and TreasureData then
      local ModEquip = TreasureData.ModEquip
      local ModId = TreasureData.TreasureMod
      DebugPrint("Mod\231\188\150\229\143\183", ModId, "Mod\232\163\133\229\164\135\228\189\141\231\189\174", ModEquip)
      if ModId and ModEquip then
        self:AddModById(ModId, ModEquip, Level)
      end
      local ClientBuild = TreasureData.ClientBuild
      if ClientBuild and ClientBuild.GroupDiscount then
        self.BlessingGroupDiscount = self.BlessingGroupDiscount + ClientBuild.GroupDiscount
      end
      self:AddTreasureGroup(TreasureId, false)
    else
      self.NeedInitTreasures = true
    end
  else
    DebugPrint("Treasure", TreasureId, "\229\183\178\229\173\152\229\156\168 \232\175\183\229\139\191\233\135\141\229\164\141\230\183\187\229\138\160")
  end
end

function Component:RemoveTreasures(TreasureId)
  if self.Treasures:FindRef(TreasureId) then
    local Level = self.Treasures:Find(TreasureId).Level
    self:UpgradeModById("Treasure", TreasureId, Level, nil)
    self.TreasureGroup:Add(TreasureId, self.TreasureGroup:Find(TreasureId) - 1)
  else
    DebugPrint("Treasure", TreasureId, "\228\184\141\229\173\152\229\156\168 \230\151\160\230\179\149\231\167\187\233\153\164")
  end
  self.PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
  self:ReCountTreasureGroup(true)
end

function Component:AddTreasureGroup(TreasureId, NoNeedActiveUI)
  local ThisTreasureGroup = DataMgr.RougeLikeTreasure[TreasureId].TreasureGroup
  if self.TreasureGroup:Find(ThisTreasureGroup) then
    self.TreasureGroup:Add(ThisTreasureGroup, self.TreasureGroup:Find(ThisTreasureGroup) + 1)
  else
    self.TreasureGroup:Add(ThisTreasureGroup, 1)
  end
  self:UpdateTreasureGroup(ThisTreasureGroup, NoNeedActiveUI)
end

function Component:ReCountTreasureGroup(NoNeedActiveUI)
  for GroupId, _ in pairs(self.TreasureGroup) do
    self:UpdateTreasureGroup(GroupId, NoNeedActiveUI)
  end
end

function Component:UpdateTreasureGroup(GroupId, NoNeedActiveUI)
  local CurrentCount = self.TreasureGroup:Find(GroupId)
  local GroupTable = DataMgr.TreasureGroup[GroupId]
  if not GroupTable or not GroupTable.ActivateNeed then
    return
  end
  local ActiveNeedCount = #GroupTable.ActivateNeed
  if not NoNeedActiveUI and CurrentCount >= ActiveNeedCount then
    self.NeedActivateList[GroupId] = true
  end
end

function Component:AddBlessings(BlessingId, Level)
  if not self.Blessings:FindRef(BlessingId) then
    self.PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
    if self.PlayerCharacter and self.PlayerCharacter.InitSuccess then
      local ModEquip = DataMgr.RougeLikeBlessing[BlessingId].ModEquip
      local ModId = DataMgr.RougeLikeBlessing[BlessingId].BlessingMod
      DebugPrint("Mod\231\188\150\229\143\183", ModId, "Mod\232\163\133\229\164\135\228\189\141\231\189\174", ModEquip)
      if ModId and ModEquip then
        self:AddModById(ModId, ModEquip, Level)
      end
      self:AddBlessingGroup(BlessingId, self.PlayerCharacter)
    else
      self.NeedInitBlessings = true
    end
  else
    DebugPrint("Blessing", BlessingId, "\229\183\178\229\173\152\229\156\168 \232\175\183\229\139\191\233\135\141\229\164\141\230\183\187\229\138\160")
  end
end

function Component:RemoveBlessings(BlessingId)
  if self.Blessings:FindRef(BlessingId) then
    local Level = self.Blessings:Find(BlessingId).Level
    self:UpgradeModById("Blessing", BlessingId, Level - 1, nil)
    local GroupId = DataMgr.RougeLikeBlessing[BlessingId].BlessingGroup
    self.BlessingGroup:Add(GroupId, self.BlessingGroup:Find(GroupId) - 1)
  else
    DebugPrint("Blessing", BlessingId, "\228\184\141\229\173\152\229\156\168 \230\151\160\230\179\149\231\167\187\233\153\164")
  end
  self.PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
  self:ReCountBlessingGroup(self.PlayerCharacter, true)
end

function Component:AddBlessingGroup(BlessingId, PlayerCharacter, NoNeedActiveUI)
  local ThisBlessingGroup = DataMgr.RougeLikeBlessing[BlessingId].BlessingGroup
  if self.BlessingGroup:Find(ThisBlessingGroup) then
    self.BlessingGroup:Add(ThisBlessingGroup, self.BlessingGroup:Find(ThisBlessingGroup) + 1)
  else
    self.BlessingGroup:Add(ThisBlessingGroup, 1)
  end
  self:UpdateBlessingGroup(ThisBlessingGroup, PlayerCharacter, NoNeedActiveUI)
end

function Component:ReCountBlessingGroup(PlayerCharacter, NoNeedActiveUI)
  for GroupId, _ in pairs(self.BlessingGroup) do
    self:UpdateBlessingGroup(GroupId, PlayerCharacter, NoNeedActiveUI)
  end
end

function Component:UpdateBlessingGroup(GroupId, PlayerCharacter, NoNeedActiveUI)
  local GroupPassiveEffects = DataMgr.BlessingGroup[GroupId].PassiveEffects
  for _, PassiveEffectId in ipairs(GroupPassiveEffects) do
    local PassiveEffectActor = PlayerCharacter:GetPassiveEffectById(PassiveEffectId)
    PassiveEffectActor = PassiveEffectActor or PlayerCharacter:AddPassiveEffectByRole(PlayerCharacter.CurrentRoleId, PassiveEffectId, 0)
    local CurrentCount = self.BlessingGroup:Find(GroupId)
    local CurGroupLevel = 0
    for i, Threshold in ipairs(DataMgr.BlessingGroup[GroupId].ActivateNeed) do
      if CurrentCount < Threshold + self.BlessingGroupDiscount then
        break
      end
      CurGroupLevel = i
    end
    if PassiveEffectActor:GetSkillLevel() ~= CurGroupLevel then
      DebugPrint("@zyh \229\189\147\229\137\141\231\154\132\229\165\151\232\163\133:", GroupId, "\230\191\128\230\180\187\229\177\130\230\149\176:", CurGroupLevel)
      PassiveEffectActor:SetSkillLevel(CurGroupLevel)
      if not NoNeedActiveUI then
        self.NeedActivateList[GroupId] = CurGroupLevel
      end
    end
  end
end

function Component:OnGetAwardUIClose()
  for BlessingGroupId, _ in pairs(self.BlessingGroup) do
    if self.NeedActivateList[BlessingGroupId] then
      self:AddTimer(0.1, function()
        UIManager(self):LoadUINew("Rouge_SuitActivate", BlessingGroupId, self.NeedActivateList[BlessingGroupId])
        self.NeedActivateList[BlessingGroupId] = nil
      end, false, nil, nil, true)
      return
    end
  end
  for TreasureGroupId, _ in pairs(self.TreasureGroup) do
    if self.NeedActivateList[TreasureGroupId] then
      self:AddTimer(0.1, function()
        local bTreasure = true
        UIManager(self):LoadUINew("Rouge_SuitActivate", TreasureGroupId, self.NeedActivateList[TreasureGroupId], bTreasure)
      end, false, nil, nil, true)
      self.NeedActivateList[TreasureGroupId] = nil
      return
    end
  end
end

function Component:AddTalents(TalentId, Level)
  if not self.Talents:Find(TalentId) then
    self.PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
    if self.PlayerCharacter and self.PlayerCharacter.InitSuccess then
      local ModId = DataMgr.RougeLikeTalent[TalentId].TalentMod
      local ModEquip = DataMgr.RougeLikeTalent[TalentId].ModEquip
      DebugPrint("Mod\231\188\150\229\143\183", ModId, "Mod\232\163\133\229\164\135\228\189\141\231\189\174", ModEquip)
      if ModId and ModEquip then
        self:AddModById(ModId, ModEquip, Level)
      end
      self:ResetCharacterAttr()
    else
      self.NeedInitTalents = true
    end
  else
    DebugPrint("Talent", TalentId, "\229\183\178\229\173\152\229\156\168 \232\175\183\229\139\191\233\135\141\229\164\141\230\183\187\229\138\160")
  end
end

function Component:AddModById(ModId, ModEquip, Level)
  local IsRangedUltra, IsMeleeUltra
  if ("RangedWeapon" == ModEquip or "MeleeWeapon" == ModEquip) and self.PlayerCharacter.UltraWeapon then
    local WeaponId = self.PlayerCharacter.UltraWeapon.WeaponId
    local WeaponTags = DataMgr.BattleWeapon[WeaponId].WeaponTag
    if CommonUtils.HasValue(WeaponTags, "Ranged") then
      IsRangedUltra = true
    end
    if CommonUtils.HasValue(WeaponTags, "Melee") then
      IsMeleeUltra = true
    end
  end
  if "Role" == ModEquip then
    self.PlayerCharacter:SetAttrByMod(ModId, Level)
  elseif "RangedWeapon" == ModEquip and self.PlayerCharacter.RangedWeapon then
    self.PlayerCharacter.RangedWeapon:SetAttrByMod(ModId, Level)
    if IsRangedUltra then
      self.PlayerCharacter.UltraWeapon:SetAttrByMod(ModId, Level)
    end
  elseif "MeleeWeapon" == ModEquip and self.PlayerCharacter.MeleeWeapon then
    self.PlayerCharacter.MeleeWeapon:SetAttrByMod(ModId, Level)
    if IsMeleeUltra then
      self.PlayerCharacter.UltraWeapon:SetAttrByMod(ModId, Level)
    end
  end
  self:AddPassiveEffectById(ModId, ModEquip, Level)
end

function Component:AddPassiveEffectById(ModId, ModEquip, Level)
  if not ModId then
    return
  end
  local IsRangedUltra, IsMeleeUltra
  if ("RangedWeapon" == ModEquip or "MeleeWeapon" == ModEquip) and self.PlayerCharacter.UltraWeapon then
    local WeaponId = self.PlayerCharacter.UltraWeapon.WeaponId
    local WeaponTags = DataMgr.BattleWeapon[WeaponId].WeaponTag
    if CommonUtils.HasValue(WeaponTags, "Ranged") then
      IsRangedUltra = true
    end
    if CommonUtils.HasValue(WeaponTags, "Melee") then
      IsMeleeUltra = true
    end
  end
  local ModData = DataMgr.Mod[ModId]
  local PassiveEffects = ModData.PassiveEffects
  if PassiveEffects then
    for _, PassiveEffectId in pairs(PassiveEffects) do
      if "Role" == ModEquip then
        self.PlayerCharacter:AddPassiveEffectByRole(self.PlayerCharacter.CurrentRoleId, PassiveEffectId, Level)
        if self.PlayerCharacter.ModPassives then
          local IsExist = false
          for _, PassiveInfo in ipairs(self.PlayerCharacter.ModPassives) do
            if PassiveInfo[1] == PassiveEffectId then
              IsExist = true
              break
            end
          end
          if not IsExist then
            local SummonInherit = ModData.SummonInherit
            table.insert(self.PlayerCharacter.ModPassives, {
              PassiveEffectId,
              Level,
              SummonInherit
            })
          end
        end
      elseif "RangedWeapon" == ModEquip and self.PlayerCharacter.RangedWeapon then
        self.PlayerCharacter:AddPassiveEffectByWeapon(self.PlayerCharacter.RangedWeapon, PassiveEffectId, Level)
        if IsRangedUltra then
          self.PlayerCharacter:AddPassiveEffectByWeapon(self.PlayerCharacter.UltraWeapon, PassiveEffectId, Level)
        end
      elseif "MeleeWeapon" == ModEquip and self.PlayerCharacter.MeleeWeapon then
        self.PlayerCharacter:AddPassiveEffectByWeapon(self.PlayerCharacter.MeleeWeapon, PassiveEffectId, Level)
        if IsMeleeUltra then
          self.PlayerCharacter:AddPassiveEffectByWeapon(self.PlayerCharacter.UltraWeapon, PassiveEffectId, Level)
        end
      end
    end
  end
end

function Component:RemovePassiveEffectById(ModId)
  if not ModId then
    return
  end
  local ModData = DataMgr.Mod[ModId]
  local PassiveEffects = ModData.PassiveEffects
  if PassiveEffects then
    for _, PassiveEffectId in pairs(PassiveEffects) do
      self.PlayerCharacter:RemovePassiveEffectByEffectId(PassiveEffectId)
    end
  end
end

function Component:UpgradeModById(AwardType, AwardId, CurrentLevel, UpgradeLevel)
  local ModId, ModEquip
  self.PlayerCharacter = UGameplayStatics.GetPlayerCharacter(self, 0)
  assert(self.PlayerCharacter.InitSuccess, "PlayerCharacter\232\191\152\230\156\170\229\136\157\229\167\139\229\140\150\230\136\144\229\138\159\239\188\140\230\151\160\230\179\149\229\175\185\229\136\187\229\141\176\232\191\155\232\161\140\229\141\135\231\186\167")
  AwardId = tonumber(AwardId)
  if "Blessing" == AwardType then
    ModId = DataMgr.RougeLikeBlessing[AwardId].BlessingMod
    ModEquip = DataMgr.RougeLikeBlessing[AwardId].ModEquip
  elseif "Treasure" == AwardType then
    ModEquip = DataMgr.RougeLikeTreasure[AwardId].ModEquip
    ModId = DataMgr.RougeLikeTreasure[AwardId].TreasureMod
  elseif "Talent" == AwardType then
    ModId = DataMgr.RougeLikeTalent[AwardId].TalentMod
    ModEquip = DataMgr.RougeLikeTalent[AwardId].ModEquip
  end
  local IsRangedUltra, IsMeleeUltra
  if ("RangedWeapon" == ModEquip or "MeleeWeapon" == ModEquip) and self.PlayerCharacter.UltraWeapon then
    local WeaponId = self.PlayerCharacter.UltraWeapon.WeaponId
    local WeaponTags = DataMgr.BattleWeapon[WeaponId].WeaponTag
    if CommonUtils.HasValue(WeaponTags, "Ranged") then
      IsRangedUltra = true
    end
    if CommonUtils.HasValue(WeaponTags, "Melee") then
      IsMeleeUltra = true
    end
  end
  if "Role" == ModEquip then
    self.PlayerCharacter:SetAttrByMod(ModId, CurrentLevel, true)
    if UpgradeLevel then
      self.PlayerCharacter:SetAttrByMod(ModId, UpgradeLevel)
    end
  elseif "RangedWeapon" == ModEquip and self.PlayerCharacter.RangedWeapon then
    self.PlayerCharacter.RangedWeapon:SetAttrByMod(ModId, CurrentLevel, true)
    if UpgradeLevel then
      self.PlayerCharacter.RangedWeapon:SetAttrByMod(ModId, UpgradeLevel)
    end
    if IsRangedUltra then
      self.PlayerCharacter.UltraWeapon:SetAttrByMod(ModId, CurrentLevel, true)
      if UpgradeLevel then
        self.PlayerCharacter.UltraWeapon:SetAttrByMod(ModId, UpgradeLevel)
      end
    end
  elseif "MeleeWeapon" == ModEquip and self.PlayerCharacter.MeleeWeapon then
    self.PlayerCharacter.MeleeWeapon:SetAttrByMod(ModId, CurrentLevel, true)
    if UpgradeLevel then
      self.PlayerCharacter.MeleeWeapon:SetAttrByMod(ModId, UpgradeLevel)
    end
    if IsMeleeUltra then
      self.PlayerCharacter.UltraWeapon:SetAttrByMod(ModId, CurrentLevel, true)
      if UpgradeLevel then
        self.PlayerCharacter.UltraWeapon:SetAttrByMod(ModId, UpgradeLevel)
      end
    end
  end
  self:RemovePassiveEffectById(ModId)
  if UpgradeLevel then
    self:AddPassiveEffectById(ModId, ModEquip, UpgradeLevel)
  end
end

function Component:ShowTokenTips(Count)
  self:AddTimer(0.1, function()
    DebugPrint("\228\187\163\229\184\129\230\149\176\233\135\143", Count)
    local Avatar = GWorld:GetAvatar()
    local TokenId = Avatar and Avatar:GetCurrentRougeLikeTokenId()
    local RewardInfo = DataMgr.Resource[TokenId]
    self.RewardList = {
      {
        ItemId = TokenId,
        ItemType = "Resource",
        Count = Count,
        Rarity = RewardInfo.Rarity
      }
    }
    UIUtils.ShowHudReward(GText("RL_GetToken"), self.RewardList)
  end, nil, nil, nil, false)
end

function Component:ResetCharacterAttr()
  self.PlayerCharacter:SetAttr("InitSp", self.PlayerCharacter:GetAttr("MaxSp"))
  local Info = self.PlayerCharacter.InfoForInit
  if Info.PlayerHp then
    self.PlayerCharacter:SetAttr("Hp", math.min(Info.PlayerHp, self.PlayerCharacter:GetAttr("MaxHp")))
  else
    self.PlayerCharacter:SetAttr("Hp", self.PlayerCharacter:GetAttr("MaxHp"))
  end
  if Info.PlayerEs then
    self.PlayerCharacter:SetAttr("ES", math.min(Info.PlayerEs, self.PlayerCharacter:GetAttr("MaxES")))
  else
    self.PlayerCharacter:SetAttr("ES", self.PlayerCharacter:GetAttr("MaxES"))
  end
  if Info.PlayerSp then
    self.PlayerCharacter:SetAttr("Sp", math.min(Info.PlayerSp, self.PlayerCharacter:GetAttr("InitSp")))
  else
    self.PlayerCharacter:SetAttr("Sp", self.PlayerCharacter:GetAttr("InitSp"))
  end
end

function Component:PrintUpdateInfo(UpdateInfo)
  local Type = UpdateInfo.Type
  local Event = UpdateInfo.Event
  DebugPrint("@zyh \230\156\172\230\172\161\229\165\150\229\138\177\231\154\132UpdateInfo\228\184\186\239\188\154 Type: ", Type, "Event:", Event)
  PrintTable(UpdateInfo.AwardsId, 4)
end

return Component
