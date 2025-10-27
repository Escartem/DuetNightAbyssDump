local Component = {}
local EMCache = require("EMCache.EMCache")

function Component:EnterWorld()
  EventManager:AddEvent(EventID.ConditionComplete, self, self.UpdateHardBossReddot)
end

function Component:LeaveWorld()
  EventManager:RemoveEvent(EventID.ConditionComplete, self)
end

function Component:UpdateHardBossReddot(ConditionId)
  if not ReddotManager.GetTreeNode("HardBossItem") then
    ReddotManager.AddNode("HardBossItem")
  end
  if not ReddotManager.GetTreeNode("HardBossMain") then
    ReddotManager.AddNode("HardBossMain")
  end
  local HardbossItemCacheDetail = ReddotManager.GetLeafNodeCacheDetail("HardBossItem")
  local HardbossNode = ReddotManager.GetTreeNode("HardBossMain")
  for _, data in pairs(DataMgr.HardBossMain) do
    if data.UnlockCondition == ConditionId and not HardbossItemCacheDetail[data.HardBossId] then
      HardbossItemCacheDetail[data.HardBossId] = 1
      ReddotManager.IncreaseLeafNodeCount("HardBossItem")
      if HardbossNode and 0 == HardbossNode.Count then
        ReddotManager.IncreaseLeafNodeCount("HardBossMain")
      end
    end
  end
end

function Component:EnterHardBoss(HardBossId, DifficultyId, OtherCallback)
  print(_G.LogTag, "Avatar EnterHardBoss", HardBossId, DifficultyId)
  
  local function Callback(Ret)
    print(_G.LogTag, "EnterHardBoss Ret", Ret)
    ErrorCode:Check(Ret)
    if OtherCallback then
      OtherCallback(Ret)
    end
  end
  
  self:CallServer("EnterHardBoss", Callback, HardBossId, DifficultyId)
end

function Component:ReEnterHardBoss(OtherCallback)
  print(_G.LogTag, "ReEnterHardBoss")
  
  local function Callback(Ret)
    print(_G.LogTag, "ReEnterHardBoss Ret", Ret)
    ErrorCode:Check(Ret)
    if OtherCallback then
      OtherCallback(Ret)
    end
  end
  
  self:CallServer("ReEnterHardBoss", Callback)
end

function Component:OnEnterHardBoss(HardBossId, DifficultyId)
  print(_G.LogTag, "OnEnterHardBoss", HardBossId, DifficultyId)
  self.HardBossInfo = {HardBossId = HardBossId, DifficultyId = DifficultyId}
  if IsStandAlone(GWorld.GameInstance) then
    local GameMode = UE.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    GameMode.EMGameState:SetInHardBossValue(true)
    self:PreEnterHardBoss(GameMode)
    GameMode:InitHardBoss(HardBossId, DifficultyId)
  end
end

function Component:OnFinishHardBoss(CurrentHardBossInfo, IsWin, Rewards, CostTime)
  print(_G.LogTag, "Avatar OnFinishHardBoss", IsWin, CostTime)
  if IsStandAlone(GWorld.GameInstance) then
    local GameMode = UE.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    if GameMode.QuitHardBoss then
      GameMode:QuitHardBoss()
      GWorld.GameInstance:PushLogicServerCallbackInfo(IsWin, CurrentHardBossInfo, Rewards, nil, CostTime)
    end
  end
end

function Component:ExitHardBoss()
  print(_G.LogTag, "Avatar ExitHardBoss")
  
  local function Callback()
    print(_G.LogTag, "Avatar ExitHardBossCallback")
    local GameMode = UE.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    GameMode.EMGameState:SetInHardBossValue(false)
    EventManager:FireEvent(EventID.OnExitDungeon)
    self.HardBossInfo = nil
    if IsStandAlone(GWorld.GameInstance) then
      self:PreExitHardBoss()
      GameMode:EndHardBossCallBack()
    end
  end
  
  self:CallServer("ExitHardBoss", Callback)
end

function Component:PreEnterHardBoss(GameMode)
  local PlayerController = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local Player = PlayerController:GetMyPawn()
  Player:RefreshRecoveryData("HardBoss")
  Player:SetRecoveryCount(0)
  GWorld.GameInstance:EnablePlayerCharacterInput()
  GameMode:PreInitPlayer(PlayerController, {Avatar = self})
end

function Component:PreExitHardBoss()
  local PlayerController = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local Player = PlayerController:GetMyPawn()
  Player:RefreshRecoveryData("CommonRegion")
  Player:SetRecoveryCount(0)
  GWorld.GameInstance:EnablePlayerCharacterInput()
end

function Component:CheckHardBossCondition(DifficultyId)
  local UnlockCondition = DataMgr.HardBossDifficulty[DifficultyId].UnlockCondition
  if not UnlockCondition then
    return true
  end
  return self:CheckCondition(UnlockCondition)
end

function Component:CheckHardBossUnlockCondition(HardBossId)
  local UnlockCondition = DataMgr.HardBossMain[HardBossId].UnlockCondition
  if not UnlockCondition then
    return true
  end
  return self:CheckCondition(UnlockCondition)
end

return Component
