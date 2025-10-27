local msgpack = require("msgpack_core")
local Component = {}
local RewardBox = require("BluePrints.Client.CustomTypes.SimpleRewardBox")

function Component:EnterWorld()
  self.logger.debug("DSRewardsComponent EnterWorld")
  self.PersistenceRewards = {}
  self.CacheRewards = {}
  self.CommonRewards = RewardBox:New()
  local mt = {
    __index = function(t, k)
      rawset(t, k, RewardBox:New())
      return t[k]
    end,
    __newindex = function(t, k, v)
      rawset(t, k, v)
    end
  }
  setmetatable(self.CacheRewards, mt)
  setmetatable(self.PersistenceRewards, mt)
  self.ImmediateResources = {}
  self.RewardCallbackUpValue = {}
  self.RewardCallbackId = 0
end

function Component:AddExpsToCache(ExpMap, BattleAvatars)
  if 0 == ExpMap:Num() then
    return
  end
  for AvatarEid, Character in pairs(BattleAvatars) do
    local ExpStruct = ExpMap:FindRef(Character.Eid)
    if ExpStruct then
      local t = {}
      t[CommonConst.CharExpItemId] = ExpStruct.CharExp
      t[CommonConst.MeleeWeaponExpItemId] = ExpStruct.MeleeWeaponExp
      t[CommonConst.RangedWeaponExpItemId] = ExpStruct.RangedWeaponExp
      self.CacheRewards[AvatarEid]:AddExp(t)
    end
  end
end

function Component:PickUpToSave(FunctionName, PickUpCount, ItemInfo, UnitId, Transform, CharacterEid, bExtra)
  if ItemUtils:IsServerCreate(ItemInfo.DropId) and ItemInfo.IsPickShare then
    self[FunctionName](self, PickUpCount, ItemInfo.UseParam, UnitId, Transform, nil, bExtra)
  else
    local Character = Battle(GWorld.GameInstance):GetEntity(CharacterEid)
    local Controller = Character:GetController()
    local AvatarEid = Controller.AvatarEidStr
    self[FunctionName](self, PickUpCount, ItemInfo.UseParam, UnitId, Transform, AvatarEid, bExtra)
  end
end

function Component:PickupToGetMod(PickUpCount, ModId, UnitId, Transform, AvatarEid, bExtra)
  local Mods = RewardUtils:GetMod(ModId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  bExtra = bExtra or false
  local Tag = bExtra and "Extra" or "Normal"
  local InTag = RewardBox:GetTag(Tag)
  if AvatarEid then
    self.CacheRewards[AvatarEid]:AddMod(Mods, nil, InTag)
    GameMode.GameState:HandleAndNotifyDungeonPickUpReward(CommonConst.DataType.Mod, ModId, bExtra, AvatarEid)
  else
    self.CommonRewards:AddMod(Mods, nil, InTag)
    GameMode.GameState:HandleAndNotifyDungeonPickUpReward(CommonConst.DataType.Mod, ModId, bExtra)
  end
end

function Component:PickupToGetResource(PickUpCount, ResourceId, DropId, Transform, AvatarEid, bExtra)
  if not RewardUtils:CheckResourceSources(DropId, ResourceId) then
    return
  end
  local Resources = {}
  Resources = RewardUtils:GetResources(Resources, DropId, ResourceId)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  bExtra = bExtra or false
  local Tag = bExtra and "Extra" or "Normal"
  local InTag = RewardBox:GetTag(Tag)
  if AvatarEid then
    self:AddImmediateRes(Resources, AvatarEid)
    self.CacheRewards[AvatarEid]:AddResource(Resources, nil, InTag)
    GameMode.GameState:HandleAndNotifyDungeonPickUpReward(CommonConst.DataType.Resource, DropId, bExtra, AvatarEid, ResourceId)
  else
    self:AddImmediateRes(Resources)
    self.CommonRewards:AddResource(Resources, nil, InTag)
    GameMode.GameState:HandleAndNotifyDungeonPickUpReward(CommonConst.DataType.Resource, DropId, bExtra, "", ResourceId)
  end
end

function Component:AddImmediateRes(Rewards, Eid)
  local ImmediateRes = {}
  local ResourcesTable = {}
  if Rewards.Resources then
    ResourcesTable = Rewards.Resources
  else
    ResourcesTable = Rewards
  end
  for ResourceId, Count in pairs(ResourcesTable) do
    local Info = DataMgr.Resource[ResourceId]
    if rawget(Info, "ImmediateGet") then
      ImmediateRes[ResourceId] = Count
    end
  end
  if 0 ~= CommonUtils.Size(ImmediateRes) then
    self:CallServerMethod("ImmediateAddRes", ImmediateRes, Eid)
    self:RecordImmediateResources(ImmediateRes, Eid)
    for key, _ in pairs(ImmediateRes) do
      if Rewards.Resources then
        Rewards.Resources[key] = nil
      else
        Rewards[key] = nil
      end
    end
  end
end

function Component:RecordImmediateResources(ImmediateRes, AvatarEid)
  for k, v in pairs(ImmediateRes) do
    if AvatarEid then
      self:RecordImmediateResourcesInternal(AvatarEid, k, v)
    else
      for Eid, _ in pairs(self.AvatarMailboxMap) do
        self:RecordImmediateResourcesInternal(Eid, k, v)
      end
    end
  end
end

function Component:RecordImmediateResourcesInternal(AvatarEid, k, v)
  assert(AvatarEid)
  if not rawget(self.ImmediateResources, AvatarEid) then
    rawset(self.ImmediateResources, AvatarEid, {})
  end
  if not rawget(self.ImmediateResources[AvatarEid], k) then
    rawset(self.ImmediateResources[AvatarEid], k, 0)
  end
  self.ImmediateResources[AvatarEid][k] = self.ImmediateResources[AvatarEid][k] + v
end

function Component:GetCurrentRewards(AvatarEidStr)
  local Rewards = RewardBox:New()
  Rewards:Merge(self.PersistenceRewards[AvatarEidStr])
  Rewards:Merge(self.CacheRewards[AvatarEidStr])
  Rewards:AddResource(self.ImmediateResources[AvatarEidStr])
  return Rewards:DumpAll()
end

function Component:TriggerRewardEvent(LogicRewards)
  local PlayerCount = CommonUtils.Size(self.AvatarInfos)
  for AvatarEid, RewardsArr in pairs(LogicRewards) do
    self.RewardCallbackUpValue[self.RewardCallbackId] = {
      UpValues = RewardsArr.UpValues,
      Count = PlayerCount
    }
    self:SendAvatar(AvatarEid, "DSGetRewardInDungeon", RewardsArr.Rewards, true, self.RewardCallbackId)
    self:ServerConditionalMulticast({
      [AvatarEid] = false
    }, "DSGetRewardInDungeon", RewardsArr.Rewards, false, self.RewardCallbackId)
    self.RewardCallbackId = self.RewardCallbackId + 1
  end
end

function Component:OnGetRewardFromLogicServer(Rewards, AvatarEidStr, RewardCallbackId)
  local CallbackTable = self.RewardCallbackUpValue[RewardCallbackId]
  local RewardsArr = CallbackTable.UpValues
  local Count = CallbackTable.Count
  if 1 == Count then
    self.RewardCallbackUpValue[RewardCallbackId] = nil
  else
    CallbackTable.Count = CallbackTable.Count - 1
  end
  assert(RewardsArr, "OnGetRewardFromLogicServer: RewardsArr is nil")
  assert(#RewardsArr == #Rewards, "OnGetRewardFromLogicServer: RewardsArr size not match Rewards size")
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  assert(GameMode, "OnGetRewardFromLogicServer: GameMode is nil")
  for i = 1, #Rewards do
    local Reward = Rewards[i]
    if next(Reward) then
      local UpValue = RewardsArr[i]
      local Reason, Transform, ExtraInfo, CB = table.unpack(UpValue)
      GameMode:ResolveRewardsInBattle(Reward, Reason, Transform, ExtraInfo, {Avatar = AvatarEidStr})
      if CB then
        CB(Reward)
      end
    end
  end
end

return Component
