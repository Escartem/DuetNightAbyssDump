local Component = {}

function Component:EnterWorld()
  self:InitFishMapReddot()
end

function Component:GetFishCount()
  local TotalFish = 0
  local NormalFish = 0
  local VariantFish = 0
  local KingFish = 0
  for key, value in pairs(self.Fishes) do
    local FishInfo = DataMgr.Fish[key]
    if FishInfo then
      if 1 == FishInfo.FishType then
        NormalFish = NormalFish + value[1]
      elseif 2 == FishInfo.FishType then
        VariantFish = VariantFish + value[1]
      elseif 3 == FishInfo.FishType then
        KingFish = KingFish + value[1]
      end
      TotalFish = TotalFish + value[1]
    end
  end
  return TotalFish, NormalFish, VariantFish, KingFish
end

function Component:GetFishCountByFishId(FishId)
  local FishCount = 0
  if FishId and self.Fishes[FishId] then
    local Fish = self.Fishes[FishId]
    FishCount = FishCount + Fish[1]
  end
  return FishCount
end

function Component:GetFishMaxSize(FishId)
  local FishSize = CommonConst.FishSystemNoParam * CommonConst.FishSizeScale
  if self.Fishes[FishId] then
    FishSize = self.Fishes[FishId][2]
  end
  local FishInfo = DataMgr.Fish[FishId]
  if FishInfo.VariationFishId then
    for key, value in pairs(FishInfo.VariationFishId) do
      if self.Fishes[value] then
        FishSize = math.max(FishSize, self.Fishes[value][2])
      end
    end
  end
  FishSize = FishSize / CommonConst.FishSizeScale
  self.logger.debug("GetFishMaxSize", FishId, FishSize)
  return FishSize
end

function Component:OnFishStart(FishingSpotId, FishingRodId, FishingLureId, FishId)
  self.logger.debug("OnFishStart Begin", FishingSpotId, FishingRodId, FishingLureId, FishId)
  
  local function Callback(Ret)
    self.logger.debug("OnFishStart Callback", Ret, FishingSpotId, FishingRodId, FishingLureId, FishId)
  end
  
  self:CallServer("OnFishStart", Callback, FishingSpotId, FishingRodId, FishingLureId, FishId)
end

function Component:OnFishHook(FishId, IsSmall2Big)
  self.logger.debug("OnFishHook", FishId, IsSmall2Big)
  EventManager:FireEvent(EventID.OnFishHook, FishId, IsSmall2Big)
end

function Component:OnFishStop(FishingSpotId)
  self:CallServerMethod("OnFishStop", FishingSpotId)
end

function Component:OnCompleteFishGame(IsSuccess, callback)
  self.logger.debug("OnCompleteFishGame Begin", IsSuccess)
  
  local function Callback(Ret, FishId, FishSize)
    self.logger.debug("OnCompleteFishGame Callback", Ret, FishId, FishSize, IsSuccess)
    if callback then
      callback(Ret, FishId, FishSize, IsSuccess)
    end
  end
  
  self:CallServer("OnCompleteFishGame", Callback, IsSuccess)
end

function Component:GMSimulateFish(FishData)
  self.logger.debug("\230\168\161\230\139\159\233\146\147\233\177\188\230\136\144\229\138\159\239\188\140\230\130\168\231\148\168\233\177\188\231\171\191:" .. FishData.FishingRodId .. "\229\146\140\233\177\188\233\165\181:" .. FishData.FishingLureId .. "\229\156\168\233\146\147\233\177\188\231\130\185\239\188\154" .. FishData.FishingSpotId .. "\233\146\147\229\136\176\228\186\134\228\184\128\230\157\161\229\176\186\229\175\184\228\184\186\239\188\154" .. FishData.FishSize .. "\231\154\132\233\177\188:" .. FishData.FishId .. "\239\188\140\233\177\188\228\184\138\233\146\169\230\137\128\233\156\128\230\151\182\233\151\180\228\184\186\239\188\154" .. FishData.FishHookDuration, ",\232\175\165\233\177\188\230\152\175\229\144\166\229\143\152\229\188\130\239\188\154", FishData.IsVariant, ",\230\152\175\229\144\166\232\167\166\229\143\145\228\187\165\229\176\143\233\146\147\229\164\167\239\188\154", FishData.IsSmall2Big)
end

function Component:InitFishMapReddot()
  local Node = ReddotManager.GetTreeNode("AnglingMap")
  Node = Node or ReddotManager.AddNode("AnglingMap", nil, 1)
  local EMCache = require("EMCache.EMCache")
  local UnLockData = EMCache:Get("FishMapUnLockData", true)
  if not UnLockData then
    UnLockData = {}
    for FishId, FishData in pairs(self.Fishes) do
      ReddotManager.IncreaseLeafNodeCount("AnglingMap", 1)
      UnLockData[FishId] = 0
    end
    EMCache:Set("FishMapUnLockData", UnLockData, true)
  end
end

function Component:GMAddFishMapUnLockData()
  local EMCache = require("EMCache.EMCache")
  local UnLockData = EMCache:Get("FishMapUnLockData", true)
  UnLockData = UnLockData or {}
  for FishId, FishData in pairs(DataMgr.Fish) do
    UnLockData[tostring(FishId)] = 2
  end
  EMCache:Set("FishMapUnLockData", UnLockData, true)
end

function Component:GetFishAchvReward(AchvId, cb)
  self.logger.debug("GetFishAchvReward Begin", AchvId)
  
  local function Callback(Ret, RewardReturn)
    self.logger.debug("GetFishAchvReward Callback ", Ret, RewardReturn)
    cb(Ret, RewardReturn)
  end
  
  self:CallServer("GetFishAchvReward", Callback, AchvId)
end

function Component:GetAllFishAchvReward(cb)
  self.logger.debug("GetFishAchvReward Begin")
  
  local function Callback(Ret, RewardReturn)
    self.logger.debug("GetFishAchvReward Callback ", Ret, RewardReturn)
    cb(Ret, RewardReturn)
  end
  
  self:CallServer("GetAllFishAchvReward", Callback)
end

function Component:OnActivateFishingSpot(FishingSpotId)
  self.logger.debug("OnActivateFishingSpot", FishingSpotId)
end

return Component
