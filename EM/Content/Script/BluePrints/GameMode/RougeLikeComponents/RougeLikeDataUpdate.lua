local FShop = FShop()
local FRougeAwardInfo = FRougeAwardInfo()
local Component = {}

function Component:RefreshRougeInfo(Info, ExtraInfo)
  local IsCanonMiniGameReward = false
  if ExtraInfo then
    IsCanonMiniGameReward = ExtraInfo.IsCanonMiniGameReward
    self.NoNeedTriggerGetAward = ExtraInfo.NoNeedTriggerGetAward
    self.IsPassRoomAward = ExtraInfo.IsPassRoomAward
  else
    IsCanonMiniGameReward = false
    self.IsPassRoomAward = nil
    self.NoNeedTriggerGetAward = nil
  end
  Info = Info or self.Avatar.RougeLikeManagerInfo
  PrintTable(Info, 5)
  self.AppendInfo = {}
  Info = self:ResortRougeInfo(Info)
  for _, InfoTable in ipairs(Info) do
    for k, v in pairs(InfoTable) do
      local func = self["Set" .. k]
      if func then
        func(self, v, IsCanonMiniGameReward)
      else
        print(_G.LogTag, "Cannot set info ", k)
      end
    end
  end
  if IsCanonMiniGameReward then
    self:CanonMiniGameRewardAddFinishMark_Add()
  end
  EventManager:FireEvent(EventID.OnRougeInfoUpdate)
end

function Component:RefreshShopBlessing(ShopRandomId, Id, Value)
  print(_G.LogTag, "RougeLikeManager RefreshShopBlessing", ShopRandomId, Id, Value)
  local Shop = self.Shop:FindRef(ShopRandomId)
  if not Shop then
    error("Shop is not exist")
  end
  Shop.ShopBlessing:Add(Id, Value)
end

function Component:RefreshShopTreasure(ShopRandomId, Id, Value)
  print(_G.LogTag, "RougeLikeManager RefreshShopTreasure", ShopRandomId, Id, Value)
  local Shop = self.Shop:FindRef(ShopRandomId)
  if not Shop then
    error("Shop is not exist")
  end
  Shop.ShopTreasure:Add(Id, Value)
end

function Component:RefreshShopItem(ShopRandomId, Id, Value)
  print(_G.LogTag, "RougeLikeManager RefreshShopItem", ShopRandomId, Id, Value)
  local Shop = self.Shop:FindRef(ShopRandomId)
  if not Shop then
    error("Shop is not exist")
  end
  Shop.ShopItem:Add(Id, Value)
end

function Component:GetBlessingLevel(Id)
  local Info = self.Blessings:FindRef(Id)
  if not Info then
    return 0
  end
  return Info.Level
end

function Component:GetTreasureLevel(Id)
  local Info = self.Treasures:FindRef(Id)
  if not Info then
    return 0
  end
  return Info.Level
end

function Component:SetSeasonId(_SeasonId)
  self.SeasonId = _SeasonId
end

function Component:SetDifficultyId(_DifficultyId)
  self.DifficultyId = _DifficultyId
end

function Component:SetRoomIndex(_RoomIndex)
  self.RoomIndex = _RoomIndex
end

function Component:SetRoomId(_RoomId)
  self.RoomId = _RoomId
end

function Component:SetPassRooms(_PassRooms)
  self.PassRooms:Clear()
  for i = 1, #_PassRooms do
    self.PassRooms:Add(_PassRooms[i])
  end
end

function Component:SetRandomRooms(_RandomRooms)
  self.RandomRooms:Clear()
  for i = 1, #_RandomRooms do
    self.RandomRooms:Add(_RandomRooms[i])
  end
end

function Component:SetRandomBlessings(_RandomBlessings)
  self.RandomBlessings:Clear()
  local UpdateInfo = {
    Type = "Blessing",
    Event = "3Choose1",
    AwardsId = {}
  }
  for i = 1, #_RandomBlessings do
    self.RandomBlessings:Add(_RandomBlessings[i])
    table.insert(UpdateInfo.AwardsId, {
      ItemId = _RandomBlessings[i]
    })
  end
  if #UpdateInfo.AwardsId > 0 and not self.NoNeedTriggerGetAward then
    self:OnUpdateAward(UpdateInfo)
  end
end

function Component:SetRandomTreasures(_RandomTreasures)
  self.RandomTreasures:Clear()
  local UpdateInfo = {
    Type = "Treasure",
    Event = "3Choose1",
    AwardsId = {}
  }
  for i = 1, #_RandomTreasures do
    self.RandomTreasures:Add(_RandomTreasures[i])
    table.insert(UpdateInfo.AwardsId, {
      ItemId = _RandomTreasures[i]
    })
  end
  if #UpdateInfo.AwardsId > 0 and not self.NoNeedTriggerGetAward then
    self:OnUpdateAward(UpdateInfo)
  end
end

function Component:SetMaxRefreshTime(_MaxRefreshTime)
  self.MaxRefreshTime = _MaxRefreshTime
end

function Component:SetRefreshTime(_RefreshTime)
  self.RefreshTime = _RefreshTime
end

function Component:SetRefreshCost(_RefreshCost)
  self.RefreshCost = _RefreshCost
end

local function UpdateCharInfo()
  local Avatar = GWorld:GetAvatar()
  EventManager:FireEvent(EventID.OnSwitchRole, Avatar.CurrentChar)
end

function Component:SetAwardInfo(OldInfo, NewInfo)
  for k, v in pairs(NewInfo) do
    OldInfo[k] = v
  end
end

function Component:CanonMiniGameRewardAddFinishMark_Add()
  local UpdateInfo = {Event = "Mark"}
  self:OnUpdateAward(UpdateInfo)
end

function Component:SetBlessings(_Blessings)
  for k, v in pairs(_Blessings) do
    self:ResetRougeLikeAwardInfo(FRougeAwardInfo)
    self:SetAwardInfo(FRougeAwardInfo, v)
    local Level = FRougeAwardInfo.Level
    self:AddBlessings(k, Level - 1)
    self.Blessings:Add(k, FRougeAwardInfo)
  end
  UpdateCharInfo()
end

function Component:SetBlessing_Add(_Blessings, IsCanonMiniGameReward)
  self:SetBlessings(_Blessings)
  local UpdateInfo = {
    Type = "Blessing",
    Event = "Add",
    IsCanonMiniGameReward = IsCanonMiniGameReward,
    AwardsId = {}
  }
  for BlessingId, _ in pairs(_Blessings) do
    if self.Last3Choose1AwardId ~= BlessingId then
      table.insert(UpdateInfo.AwardsId, {ItemId = BlessingId})
    end
  end
  EventManager:FireEvent(EventID.OnRougeDealEventReward)
  if #UpdateInfo.AwardsId > 0 then
    self:OnUpdateAward(UpdateInfo)
  end
end

function Component:SetBlessing_Remove(_Blessings)
  local UpdateInfo = {
    Type = "Blessing",
    Event = "Remove",
    AwardsId = {}
  }
  for i = 1, #_Blessings do
    self:RemoveBlessings(_Blessings[i])
    self.Blessings:Remove(_Blessings[i])
    table.insert(UpdateInfo.AwardsId, {
      ItemId = _Blessings[i]
    })
  end
  EventManager:FireEvent(EventID.OnRougeDealEventReward)
  if #UpdateInfo.AwardsId > 0 then
    self:OnUpdateAward(UpdateInfo)
  end
  UpdateCharInfo()
end

function Component:SetBlessing_Update(_Blessings)
  local UpdateInfo = {
    Type = "Blessing",
    Event = "Upgrade",
    AwardsId = {}
  }
  for k, v in pairs(_Blessings) do
    local ExistAward = self.Blessings:FindRef(k)
    if not ExistAward then
      self:SetBlessing_Add({
        [k] = v
      })
    else
      local OldLevel = ExistAward.Level
      local NewLevel = v.Level or FRougeAwardInfo.Level
      if NewLevel ~= OldLevel then
        self:UpgradeModById("Blessing", k, OldLevel - 1, NewLevel - 1)
        table.insert(UpdateInfo.AwardsId, {
          ItemId = k,
          OldLevel = OldLevel,
          NewLevel = NewLevel
        })
      end
      self:ResetRougeLikeAwardInfo(ExistAward)
      self:SetAwardInfo(ExistAward, v)
    end
  end
  EventManager:FireEvent(EventID.OnRougeDealEventReward)
  if #UpdateInfo.AwardsId > 0 then
    self:OnUpdateAward(UpdateInfo)
  end
  UpdateCharInfo()
end

function Component:SetBlessing_ABA(_Blessings)
  EventManager:FireEvent(EventID.OnRougeDealEventReward)
end

function Component:SetTreasures(_Treasures)
  for k, v in pairs(_Treasures) do
    self:ResetRougeLikeAwardInfo(FRougeAwardInfo)
    self:SetAwardInfo(FRougeAwardInfo, v)
    local Level = FRougeAwardInfo.Level
    self:AddTreasures(k, Level - 1)
    self.Treasures:Add(k, FRougeAwardInfo)
  end
  UpdateCharInfo()
end

function Component:SetTreasure_Add(_Treasures, IsCanonMiniGameReward)
  self:SetTreasures(_Treasures)
  local UpdateInfo = {
    Type = "Treasure",
    Event = "Add",
    IsCanonMiniGameReward = IsCanonMiniGameReward,
    AwardsId = {}
  }
  for TreasureId, _ in pairs(_Treasures) do
    if self.Last3Choose1AwardId ~= TreasureId then
      table.insert(UpdateInfo.AwardsId, {ItemId = TreasureId})
    end
  end
  EventManager:FireEvent(EventID.OnRougeDealEventReward)
  if #UpdateInfo.AwardsId > 0 then
    self:OnUpdateAward(UpdateInfo)
  end
end

function Component:SetTreasure_Remove(_Treasures)
  local UpdateInfo = {
    Type = "Treasure",
    Event = "Remove",
    AwardsId = {}
  }
  for i = 1, #_Treasures do
    self:RemoveTreasures(_Treasures[i])
    self.Treasures:Remove(_Treasures[i])
    table.insert(UpdateInfo.AwardsId, {
      ItemId = _Treasures[i]
    })
  end
  EventManager:FireEvent(EventID.OnRougeDealEventReward)
  if #UpdateInfo.AwardsId > 0 then
    self:OnUpdateAward(UpdateInfo)
  end
  UpdateCharInfo()
end

function Component:SetTreasure_ABA(_Treasures)
  EventManager:FireEvent(EventID.OnRougeDealEventReward)
end

function Component:SetTreasure_Update(_Treasures)
  for k, v in pairs(_Treasures) do
    local ExistAward = self.Treasures:FindRef(k)
    if ExistAward then
      self:ResetRougeLikeAwardInfo(ExistAward)
      self:SetAwardInfo(ExistAward, v)
    else
      self:SetTreasure_Add({
        [k] = v
      })
    end
  end
  EventManager:FireEvent(EventID.OnRougeDealEventReward)
  UpdateCharInfo()
end

function Component:SetShop(_Shop)
  self.Shop:Clear()
  for k, v in pairs(_Shop) do
    FShop.ShopBlessing:Clear()
    for _k, _v in pairs(v.ShopBlessing) do
      FShop.ShopBlessing:Add(_k, _v)
    end
    FShop.ShopTreasure:Clear()
    for _k, _v in pairs(v.ShopTreasure) do
      FShop.ShopTreasure:Add(_k, _v)
    end
    FShop.ShopItem:Clear()
    for _k, _v in pairs(v.ShopItem) do
      FShop.ShopItem:Add(_k, _v)
    end
    self.Shop:Add(k, FShop)
  end
end

function Component:SetEventId(_EventId)
  self.EventId = _EventId
end

function Component:SetTalent(_Talent)
  for k, v in pairs(_Talent) do
    if self.Talents:Find(k) then
      if self.Talents:Find(k) ~= v then
        self:UpgradeModById("Talent", k, self.Talents:Find(k), v - 1)
      end
    else
      self:AddTalents(k, v - 1)
    end
    self.Talents:Add(k, v)
  end
  local Avatar = GWorld:GetAvatar()
  EventManager:FireEvent(EventID.OnSwitchRole, Avatar.CurrentChar)
end

function Component:SetTokenExtraRate(_TokenExtraRate)
  self.TokenExtraRate = _TokenExtraRate
end

function Component:SetEndPointsExtraRate(_EndPointsExtraRate)
  self.EndPointsExtraRate = _EndPointsExtraRate
end

function Component:SetShopDiscount(_ShopDiscount)
  self.ShopDiscount = _ShopDiscount
end

function Component:SetStoryId(_StoryId)
  DebugPrint("@zyh \229\143\145\231\148\159\229\137\167\230\131\133\228\186\139\228\187\182", _StoryId)
  self.StoryId = _StoryId
end

function Component:SetCanGetToken(_CanGetToken)
  self.bCanGetToken = _CanGetToken
end

function Component:SetContract(_Contract)
  self.Contract:Clear()
  for k, v in pairs(_Contract) do
    self.Contract:Add(k, v)
  end
end

function Component:ResortRougeInfo(Info)
  local SortInfo = {
    {},
    {},
    {}
  }
  for k, v in pairs(Info) do
    if string.find(k, "Blessing") or string.find(k, "Treasure") or string.find(k, "Talent") then
      if string.find(k, "Remove") then
        SortInfo[2][k] = v
      else
        SortInfo[3][k] = v
      end
    else
      SortInfo[1][k] = v
    end
  end
  return SortInfo
end

return Component
