local RewardParse = require("BluePrints.GameMode.Components.GameModeRewardParseComponent")
local ItemUtils = require("Utils.ItemUtils")
local CommonConst = require("CommonConst")
local RewardBox = require("BluePrints.Client.CustomTypes.SimpleRewardBox")
local MonsterSpawnRewardArray = TArray(0)
local Component = {}
local ForceLogicRewardReason = {
  [CommonConst.RewardReason.MonsterDead] = true,
  [CommonConst.RewardReason.PickUp] = true
}

function Component:InitRewardParams()
  self.RewardPerFrame = 20
  self.CacheFrontIndex = 1
  self.CacheRearIndex = 1
  self.CacheBattleRewards = {}
  self.CacheLogicRewards = {}
  self.CacheEid2AvatarEid = {}
  self.bNeedNotifyClientCreateDrop = false
end

function Component:TickGenReward(DeltaSeconds)
  if self.bNeedNotifyClientCreateDrop then
    self.EMGameState:ClientCreateReward()
    self.bNeedNotifyClientCreateDrop = false
  end
  if self.CacheRearIndex > self.CacheFrontIndex then
    for i = 1, self.RewardPerFrame do
      local RewardParam = self.CacheBattleRewards[self.CacheFrontIndex]
      self.CacheBattleRewards[self.CacheFrontIndex] = nil
      self.CacheFrontIndex = self.CacheFrontIndex + 1
      self:RealGenerateReward(table.unpack(RewardParam))
      if self.CacheRearIndex <= self.CacheFrontIndex then
        break
      end
    end
  end
  if not next(self.CacheLogicRewards) then
    return
  end
  local ServerEntity = GWorld:GetServerEntity()
  if not ServerEntity then
    return
  end
  local LogicRewards = self.CacheLogicRewards
  self.CacheLogicRewards = {}
  ServerEntity:TriggerRewardEvent(LogicRewards)
end

function Component:AddCacheBattleReward(RewardIds, Reason, Transform, ExtraInfo)
  if 0 == #RewardIds then
    return
  end
  self.CacheBattleRewards[self.CacheRearIndex] = {
    RewardIds,
    Reason,
    Transform,
    ExtraInfo
  }
  self.CacheRearIndex = self.CacheRearIndex + 1
end

function Component:RealGenerateReward(RewardIds, Reason, Transform, ExtraInfo)
  local Rewards = RewardUtils:GetRewards(RewardIds)
  self:ResolveRewardsInBattle(Rewards, Reason, Transform, ExtraInfo)
end

function Component:TriggerRewardEvent(UnitId, Reason, Transform, ExtraInfo, Callback)
  DebugPrint("TriggerRewardEvent", UnitId, Reason, Transform)
  ExtraInfo = ExtraInfo or {}
  local AvatarEid = self:GetAvatarEidByBattleEid(rawget(ExtraInfo, "SourceEid"))
  ExtraInfo.Avatar = AvatarEid
  self:AddCacheGenUnitReward(UnitId, Reason, Transform, ExtraInfo, Callback)
end

function Component:AddCacheGenUnitReward(UnitId, Reason, Transform, ExtraInfo, Callback)
  local ret, RewardIds = RewardParse:ParseReward(UnitId, Reason, ExtraInfo)
  if not ret then
    print(_G.LogTag, "Cannot Generate Reward for UnitId:", UnitId, "Reason:", Reason)
    return
  end
  if Reason == CommonConst.RewardReason.MonsterDead then
    self:GetMonsterSpawnRewardId(UnitId, MonsterSpawnRewardArray)
    for _, RewardId in pairs(MonsterSpawnRewardArray) do
      DebugPrint("Add GetMonsterSpawnRewardId", RewardId)
      RewardIds[#RewardIds + 1] = RewardId
    end
  end
  if not ExtraInfo.Avatar then
    self:AddCacheBattleReward(RewardIds, Reason, Transform, ExtraInfo)
  else
    local RewardId, BattleRewards = RewardUtils:SplitBattleRewards(RewardIds)
    self:AddCacheBattleReward(BattleRewards, Reason, Transform, ExtraInfo)
    if #RewardId > 0 or ForceLogicRewardReason[Reason] then
      self:AddCacheLogicUnitReward(UnitId, Reason, Transform, ExtraInfo, Callback)
    end
  end
end

function Component:AddCacheLogicUnitReward(UnitId, Reason, Transform, ExtraInfo, Callback)
  local AvatarEid = ExtraInfo.Avatar
  if not AvatarEid then
    self:AddCacheBattleUnitReward(UnitId, Reason, Transform, ExtraInfo)
    return
  end
  ExtraInfo.Avatar = nil
  DebugPrint("AddCacheLogicUnitReward", UnitId, Reason)
  local AvatarCache = self.CacheLogicRewards[AvatarEid]
  AvatarCache = AvatarCache or {
    UpValues = {},
    Rewards = {}
  }
  local Location = CommonUtils.LocationToTable(Transform.Translation)
  AvatarCache.UpValues[#AvatarCache.UpValues + 1] = {
    Reason,
    Transform,
    ExtraInfo,
    Callback
  }
  AvatarCache.Rewards[#AvatarCache.Rewards + 1] = {
    UnitId,
    Reason,
    ExtraInfo,
    Location
  }
  self.CacheLogicRewards[AvatarEid] = AvatarCache
end

function Component:AddCacheBattleUnitReward(UnitId, Reason, Transform, ExtraInfo)
  local ret, RewardIds = RewardParse:ParseReward(UnitId, Reason, ExtraInfo)
  if not ret then
    print(_G.LogTag, "Cannot Generate Reward for UnitId:", UnitId, "Reason:", Reason)
    return
  end
  self:AddCacheBattleReward(RewardIds, Reason, Transform, ExtraInfo)
end

function Component:GetAvatarEidByBattleEid(Eid)
  if not Eid then
    return
  end
  local AvatarEid = self.CacheEid2AvatarEid[Eid]
  if AvatarEid then
    return AvatarEid
  end
  local PlayerCharacter = Battle(self):GetEntity(Eid)
  if not PlayerCharacter:IsPlayer() then
    print(_G.LogTag, "Cannot Generate Logic Reward for Player Character is nil")
    return
  end
  local Controller = PlayerCharacter:GetController()
  if not Controller then
    print(_G.LogTag, "Cannot Generate Logic Reward for Player Character has no Controller")
    return
  end
  AvatarEid = CommonUtils.Str2ObjId(Controller.AvatarEidStr)
  self.CacheEid2AvatarEid[Eid] = AvatarEid
  return AvatarEid
end

function Component:ResolveRewardsInBattle(Rewards, Reason, Transform, ExtraInfo, OtherParams)
  DebugPrint("ResolveRewardsInBattle", Reason, Transform)
  self:ResolveExpInBattle(Rewards, Reason, ExtraInfo, OtherParams)
  self:HandleRewardDrop(rawget(Rewards, "Drops"), Reason, Transform, ExtraInfo, OtherParams)
end

function Component:ResolveExpInBattle(Rewards, Reason, ExtraInfo, OtherParams)
  if not OtherParams then
    return
  end
  local Avatar = OtherParams.Avatar
  local Character = self.BattleAvatars[Avatar]
  if not Character then
    DebugPrint("ResolveExpInBattle no Character", Avatar)
    return
  end
  self:GetExpMap(Character, Rewards, Reason, ExtraInfo)
  self:HandleExpInBattle()
  self.ExpMap:Clear()
end

function Component:GetExpMap(Character, Rewards)
  local Exps = rawget(Rewards, "Exps")
  if not Exps then
    return
  end
  local BattleEid = Character.Eid
  self:SingleAddExpToMap(BattleEid, RewardBox:GetCount(Exps[CommonConst.CharExpItemId]), RewardBox:GetCount(Exps[CommonConst.MeleeWeaponExpItemId]), RewardBox:GetCount(Exps[CommonConst.RangedWeaponExpItemId]))
end

function Component:HandleRewardDrop(Drops, Reason, Transform, ExtraInfo, OtherParams)
  if not Drops then
    return
  end
  OtherParams = OtherParams or {}
  local GameState = self.EMGameState
  local LevelId = self:GetItemLevelId(Transform.Translation)
  
  local function CreateDrop(DropId, Count, bExtra, CreateIndex)
    DebugPrint("HandleRewardDrop in Dungeon1111", DropId, Count)
    if self.LevelGameMode.DropRule[DropId] then
      return
    end
    DebugPrint("HandleRewardDrop in Dungeon2222", DropId, Count)
    if IsStandAlone(self) then
      if self:IsInRegion() then
        DebugPrint("ZJT_ 111111111111111 DropId ,Count ", DropId, bExtra, CreateIndex)
        GameState.EventMgr:RealSpawnRewards_Region(DropId, Count, Transform, Reason, ExtraInfo, bExtra, CreateIndex, OtherParams.RewardDropDatas)
      else
        DebugPrint("HandleRewardDrop in Dungeon", DropId, Count)
        GameState.EventMgr:RealSpawnRewards_Normal(DropId, Count, Transform, Reason, ExtraInfo, bExtra)
      end
    elseif IsDedicatedServer(self) then
      if ItemUtils:IsServerCreate(DropId) then
        GameState.EventMgr:RealSpawnRewards_Normal(DropId, Count, Transform, Reason, ExtraInfo, bExtra)
      else
        print(_G.LogTag, "CreateDrop For Player", DropId)
        local Avatar = OtherParams.Avatar or ""
        self:PickupToSpecPlayer(DropId, Count, Avatar, Reason, Transform, LevelId, bExtra)
        self.bNeedNotifyClientCreateDrop = true
      end
    end
  end
  
  if ExtraInfo and ExtraInfo.MultiWave and self:IsInDungeon() then
    local Mechanism = Battle(self):GetEntity(ExtraInfo.ParentEid)
    Mechanism:MultiWaveCreateDrop(Drops, CreateDrop)
  else
    for DropId, DropCountTable in pairs(Drops) do
      DropId = tonumber(DropId)
      local ExtraCount = RewardBox:FindCountByTag(DropCountTable, "Extra")
      local CreateIndex = 0
      if ExtraCount > 0 then
        CreateIndex = ExtraCount
        CreateDrop(DropId, ExtraCount, true, 0)
      end
      local OtherCount = RewardBox:FindCountByTag(DropCountTable, "Normal")
      if OtherCount > 0 then
        CreateDrop(DropId, OtherCount, false, CreateIndex)
      end
    end
  end
end

function Component:TriggerGenerateRewardForMonsterDeath(UnitId, Transform, UniqueSign, KillerEid, bKilledByPlayer, WeaponType, ExpRate, Level, IsEliteMonster, IsSummonMonster, MonEid, DamageCauserLocation)
  Transform = UE4.FTransform(Transform.Rotation, Transform.Translation)
  if "" == WeaponType then
    WeaponType = nil
  end
  local ExtraInfo = {
    UniqueSign = UniqueSign,
    SourceEid = KillerEid,
    bKilledByPlayer = bKilledByPlayer,
    WeaponType = WeaponType,
    ExpRate = ExpRate,
    Level = Level,
    IsEliteMonster = IsEliteMonster,
    IsSummonMonster = IsSummonMonster
  }
  
  local function Callback(Reward)
    if not Reward then
      return
    end
    local ExpNum = 0
    local Exp = rawget(Reward, "Exps")
    if Exp then
      for _, v in pairs(Exp) do
        ExpNum = ExpNum + RewardBox:GetCount(v)
      end
    end
    if self.GameState and ExpNum > 0 then
      self.GameState:AddMonDeadShowJumpWordInfo(MonEid, ExpNum, KillerEid, DamageCauserLocation)
    end
    DebugPrint("Component:TriggerGenerateRewardForMonsterDeath", ExpNum)
  end
  
  self:TriggerRewardEvent(UnitId, CommonConst.RewardReason.MonsterDead, Transform, ExtraInfo, Callback)
end

function Component:FlushRewards()
  DebugPrint("FlushRewards")
  self:TickGenReward(0)
end

return Component
