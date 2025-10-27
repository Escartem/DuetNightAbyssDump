local RewardBox = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local RandomRequireResult, Random = pcall(require, "src.utils.RandomNew")
local RewardUtils = {}

function RewardUtils:GetRewards(RewardIds, Avatar)
  local Rewards = RewardBox:New()
  if not RewardIds then
    return Rewards
  end
  local OriginCount = 0
  RewardIds, OriginCount = self:RewardsModify(RewardIds, Avatar)
  for i = 1, OriginCount do
    self:GetRewardsById(Rewards, RewardIds[i], Avatar)
  end
  if OriginCount < #RewardIds then
    local ExtraTag = Rewards:GetTag("Extra")
    Rewards:AppendTag(ExtraTag)
    for i = OriginCount + 1, #RewardIds do
      self:GetRewardsById(Rewards, RewardIds[i], Avatar)
    end
    Rewards:RemoveTag(ExtraTag)
  end
  return Rewards
end

function RewardUtils:RewardsModify(RewardIds, Avatar)
  local ModifyRewards = RewardIds
  if type(RewardIds) == "number" then
    ModifyRewards = {RewardIds}
  end
  local OriginCount = #ModifyRewards
  if not Avatar then
    return ModifyRewards, OriginCount
  end
  
  local function RandomResult()
    if not RandomRequireResult then
      return math.random(0, 9999)
    else
      return Random.randInt(0, 9999)
    end
  end
  
  local Length = #ModifyRewards
  for i = 1, Length do
    local RewardId = ModifyRewards[i]
    local RewardData = DataMgr.Reward[RewardId]
    if RewardData and RewardData.IsFixedByBonus then
      local Divisible = Avatar.RewardParams.BonusRate // 10000
      for j = 1, Divisible do
        ModifyRewards[#ModifyRewards + 1] = RewardId
      end
      local ModifyRate = RandomResult()
      local Remainder = Avatar.RewardParams.BonusRate % 10000
      if ModifyRate < Remainder then
        ModifyRewards[#ModifyRewards + 1] = RewardId
      end
    end
  end
  return ModifyRewards, OriginCount
end

function RewardUtils:GetRewardsById(Rewards, RewardId, Avatar)
  local RewardData = DataMgr.Reward[RewardId]
  if not RewardData then
    return
  end
  if RewardData.Mode == "Sequence" and not Avatar then
    DebugPrint("Sequence Reward, But Avatar == nil", RewardId)
  end
  local Handle = rawget(self, "HandleReward" .. RewardData.Mode)
  if not Handle then
    return
  end
  Rewards:AppendOriginRewardId(RewardId)
  Handle(self, Rewards, RewardId, RewardData, Avatar)
end

function RewardUtils:GetCount(Counts)
  if not Counts then
    return 0
  end
  if 1 == #Counts then
    return Counts[1]
  elseif 2 == #Counts then
    return math.random(Counts[1], Counts[2])
  end
  return 0
end

function RewardUtils:HandleType(Reward, Type, Id, Count, Avatar)
  if "Reward" == Type then
    for i = 1, Count do
      self:GetRewardsById(Reward, Id, Avatar)
    end
  else
    local Handle = Reward["Add" .. Type]
    if Handle then
      Handle(Reward, Id, Count)
    end
  end
end

function RewardUtils:ChoiceOneFromWeight(Nums)
  local SumWeight = 0
  for index, value in ipairs(Nums) do
    SumWeight = SumWeight + value
  end
  local _Weights = {}
  for index, value in ipairs(Nums) do
    table.insert(_Weights, value / SumWeight)
  end
  local weight = 0
  local Weights = {}
  for index, value in ipairs(_Weights) do
    weight = weight + value
    table.insert(Weights, weight)
  end
  local RandomNum = math.random()
  for index, value in ipairs(Weights) do
    if value > RandomNum then
      return index
    end
  end
  return #Weights
end

function RewardUtils:HandleTypeByChooseIndex(Reward, RewardData, ChooseIndex, Avatar)
  local Type = RewardData.Type[ChooseIndex]
  local Id = RewardData.Id[ChooseIndex]
  local Count = self:GetCount(RewardData.Count[ChooseIndex])
  self:HandleType(Reward, Type, Id, Count, Avatar)
end

function RewardUtils:HandleRewardFixed(Reward, RewardId, RewardData, Avatar)
  for Index, Type in ipairs(RewardData.Type) do
    local Id = RewardData.Id[Index]
    local Count = self:GetCount(RewardData.Count[Index])
    self:HandleType(Reward, Type, Id, Count, Avatar)
  end
end

function RewardUtils:HandleRewardIndependent(Reward, RewardId, RewardData, Avatar)
  for Index, Type in ipairs(RewardData.Type) do
    local Id = RewardData.Id[Index]
    local Count = self:GetCount(RewardData.Count[Index])
    local Param = RewardData.Param[Index]
    local w = math.random(10000)
    if Param > w then
      self:HandleType(Reward, Type, Id, Count, Avatar)
    end
  end
end

function RewardUtils:HandleRewardWeight(Reward, RewardId, RewardData, Avatar)
  if not RewardData.Param or 0 == #RewardData.Param then
    return Reward
  end
  local Weights = {}
  for key, Param in ipairs(RewardData.Param) do
    table.insert(Weights, Param)
  end
  local ChoiceIndex = self:ChoiceOneFromWeight(Weights)
  self:HandleTypeByChooseIndex(Reward, RewardData, ChoiceIndex, Avatar)
end

local RewardSequenceFunc = require("Utils.RewardSequenceFunc")

function RewardUtils:HandleRewardSequence(Reward, RewardId, RewardData, Avatar)
  self:InnerHandleRewardSequence(Reward, RewardId, RewardData, Avatar, false)
end

function RewardUtils:HandleRewardSequenceCeiling(Reward, RewardId, RewardData, Avatar)
  self:InnerHandleRewardSequence(Reward, RewardId, RewardData, Avatar, true)
end

function RewardUtils:InnerHandleRewardSequence(Reward, RewardId, RewardData, Avatar, bCeiling)
  if not Avatar then
    return
  end
  RewardSequenceFunc.AddIndex(Avatar.RewardParams.RewardSequences, RewardId, DataMgr.Reward, bCeiling)
  local Sequence = Avatar.RewardParams.RewardSequences.SequenceDict[RewardId]
  local ChoiceIndex = RewardSequenceFunc.GetReward(Sequence)
  self:HandleTypeByChooseIndex(Reward, RewardData, ChoiceIndex, Avatar)
end

function RewardUtils:HandleRewardLevel(Reward, RewardId, RewardData, Avatar)
  if not Avatar then
    return
  end
  if 0 == #RewardData.Param then
    return Reward
  end
  local ChoiceIndex = #RewardData.Param
  for Index, Param in ipairs(RewardData.Param) do
    if Param > Avatar.Level then
      ChoiceIndex = Index - 1
      break
    end
  end
  self:HandleTypeByChooseIndex(Reward, RewardData, ChoiceIndex, Avatar)
end

function RewardUtils:HandleRewardOnce(Reward, RewardId, RewardData, Avatar)
  if not Avatar then
    return
  end
  local IsGetReward = Avatar.RewardParams.OnceReward[RewardId]
  if IsGetReward and 1 == IsGetReward then
    return
  end
  Avatar.RewardParams.OnceReward[RewardId] = 1
  for Index, Type in pairs(RewardData.Type) do
    local Id = RewardData.Id[Index]
    local Count = self:GetCount(RewardData.Count[Index])
    self:HandleType(Reward, Type, Id, Count, Avatar)
  end
end

function RewardUtils:HandleRewardGender(Reward, RewardId, RewardData, Avatar)
  if not Avatar then
    return
  end
  for Index, Param in ipairs(RewardData.Param) do
    if Avatar.Sex == Param then
      self:HandleTypeByChooseIndex(Reward, RewardData, Index, Avatar)
    end
  end
end

function RewardUtils:GetMod(ModId)
  local Mods = {}
  local ModData = DataMgr.Mod[ModId]
  if ModData then
    Mods[ModId] = 1
  end
  return Mods
end

function RewardUtils:GetWeapons(WeaponId)
  local Weapons = {}
  local WeaponData = DataMgr.Weapon[WeaponId]
  if WeaponData then
    Weapons[WeaponId] = 1
  end
  return Weapons
end

function RewardUtils:CheckResourceSources(DropId, ResourceId)
  local DropInfo = DataMgr.Drop[DropId]
  if DropInfo and DropInfo.UseParam == ResourceId then
    return true
  end
  return false
end

function RewardUtils:GetResources(Resources, DropId, ResourceId)
  local DropInfo = DataMgr.Drop[DropId]
  local Count = 1
  if DropInfo.UseParam2 then
    Count = self:GetCount(DropInfo.UseParam2)
  end
  local ResourceData = DataMgr.Resource[ResourceId]
  if ResourceData then
    Resources[ResourceId] = Count
  end
  return Resources
end

function RewardUtils:GetAllRewardByRewardId(RewardId)
  local RewardData = DataMgr.Reward[RewardId]
  local Reward = RewardBox:New()
  local Handle
  for i = 1, #RewardData.Type do
    local Type = RewardData.Type[i]
    local Id = RewardData.Id[i]
    local Count = self:GetCount(RewardData.Count[i])
    if "Reward" == Type then
      local Rewards = self:GetAllRewardByRewardId(Id)
      if Rewards then
        Reward:Merge(Rewards)
      end
    elseif "Drop" == Type then
      local DropData = DataMgr.Drop[Id]
      if DropData.UseEffectType and string.sub(DropData.UseEffectType, 1, 3) == "Get" then
        local NewType = string.sub(DropData.UseEffectType, 4)
        Handle = Reward["Add" .. NewType]
        if Handle then
          Handle(Reward, DropData.UseParam, Count)
        end
      else
        Reward:AddDrop(Id, Count)
      end
    else
      Handle = Reward["Add" .. Type]
      if Handle then
        Handle(Reward, Id, Count)
      end
    end
  end
  return Reward
end

function RewardUtils:GetAllRewardFromRewardIds(RewardIds)
  if not RewardIds then
    return
  end
  local Rewards = RewardBox:New()
  if type(RewardIds) == "table" then
    for _, RewardId in ipairs(RewardIds) do
      local Reward = self:GetAllRewardByRewardId(RewardId)
      if Reward then
        Rewards:Merge(Reward)
      end
    end
  elseif type(RewardIds) == "number" then
    Rewards = self:GetAllRewardByRewardId(RewardIds)
  end
  return Rewards
end

function RewardUtils:GetRewardViewInfoById(RewardViewId)
  local RewardInfo = {}
  local RewardData = DataMgr.RewardView[RewardViewId]
  if not RewardData then
    return RewardInfo
  end
  local RewardTypes = RewardData.Type
  local RewardIds = RewardData.Id
  local RewardQuantitys
  if RewardData.Quantity then
    RewardQuantitys = RewardData.Quantity
  end
  local RewardDropTypes
  if RewardData.DropType then
    RewardDropTypes = RewardData.DropType
  end
  if not RewardTypes or not RewardIds then
    return RewardInfo
  end
  for i = 1, #RewardTypes do
    local RewardContent = {}
    RewardContent.Type = RewardTypes[i]
    RewardContent.Id = RewardIds[i]
    if RewardQuantitys then
      RewardContent.Quantity = RewardQuantitys[i]
    end
    if RewardDropTypes then
      RewardContent.DropType = RewardDropTypes[i]
    end
    local ItemInfo = DataMgr[RewardContent.Type][RewardContent.Id]
    if ItemInfo then
      RewardContent.Name = ItemInfo.Name or ItemInfo[RewardContent.Type .. "Name"]
      RewardContent.Rarity = ItemInfo.Rarity or ItemInfo[RewardContent.Type .. "Rarity"]
      table.insert(RewardInfo, RewardContent)
    else
      DebugPrint("ZDX Item is nil RewardContent.Rarity", RewardContent.Rarity)
    end
  end
  return RewardInfo
end

function RewardUtils:SplitBattleRewards(Rewards)
  local RewardIds = {}
  local BattleRewardIds = {}
  for i = 1, #Rewards do
    local RewardId = Rewards[i]
    local RewardInfo = DataMgr.Reward[RewardId]
    if RewardInfo then
      if RewardInfo.IsCombatReward then
        BattleRewardIds[#BattleRewardIds + 1] = RewardId
      else
        RewardIds[#RewardIds + 1] = RewardId
      end
    end
  end
  return RewardIds, BattleRewardIds
end

return RewardUtils
