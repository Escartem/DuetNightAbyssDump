require("UnLua")
require("Const")
local WalnutComponent = {}

function WalnutComponent:IsWalnutDungeon()
  if self.IsDungeonTypeWalnut == nil then
    local DungeonInfo = DataMgr.Dungeon[self.DungeonId]
    if DungeonInfo then
      self.IsDungeonTypeWalnut = DungeonInfo.IsWalnutDungeon == true
    end
  end
  return self.IsDungeonTypeWalnut
end

function WalnutComponent:TriggerShowWalnutReward()
  DebugPrint("WalnutComponent:TriggerShowWalnutReward")
  if IsStandAlone(self) then
    self:AddDungeonEvent("ShowWalnutReward")
  elseif IsDedicatedServer(self) then
    if self:IsAllPlayerNotChoosedNextWalnut() then
      DebugPrint("WalnutComponent: \230\137\128\230\156\137\231\142\169\229\174\182\233\131\189\230\178\161\232\163\133\229\164\135\230\160\184\230\161\131")
      self:ExecuteNextStepOfWalnutReward()
      return
    end
    self:InitWalnutRewardPlayerMap()
    local WalnutRewardSelectTime = DataMgr.GlobalConstant.WalnutRewardSelectTime.ConstantValue or 15
    self:BpAddTimer("ShowWalnutReward", WalnutRewardSelectTime, true, Const.GameModeEventServerClient)
    self:ShowWalnutDebugTimer(WalnutRewardSelectTime, "ShowWalnutRewardDebug")
  end
  EventManager:AddEvent(EventID.OnSelectWalnutReward, self, self.OnClientSelectedWalnutReward)
  self:NotifyLogicServerOpenWalnut()
  self:SetGamePaused("WalnutReward", true)
end

function WalnutComponent:OnClientSelectedWalnutReward(AvatarEidStr)
  DebugPrint("WalnutComponent:OnClientSelectedWalnutReward, AvatarEidStr", AvatarEidStr)
  if IsStandAlone(self) then
    self:OnClientSelectedWalnutReward_StandAlone(AvatarEidStr)
  elseif IsDedicatedServer(self) then
    self:OnClientSelectedWalnutReward_DedicatedServer(AvatarEidStr)
  end
end

function WalnutComponent:OnClientSelectedWalnutReward_StandAlone(AvatarEidStr)
  self:RemoveDungeonEvent("ShowWalnutReward")
  self:ExecuteNextStepOfWalnutReward()
end

function WalnutComponent:OnClientSelectedWalnutReward_DedicatedServer(AvatarEidStr)
  if self.EMGameState.WalnutRewardPlayer:Find(AvatarEidStr) ~= nil then
    self.EMGameState.WalnutRewardPlayer:Add(AvatarEidStr, true)
    UE.UMapSyncHelper.SyncMap(self.EMGameState, "WalnutRewardPlayer")
    local NotSelectedPlayers = self:GetWalnutRewardNotSelectedPlayers()
    if 0 == #NotSelectedPlayers then
      self:OnPlayerSelectWalnutReward()
    end
  else
    self.EMGameState:ShowDungeonError("WalnutComponent:\228\184\128\228\184\170\228\184\141\229\173\152\229\156\168\231\154\132AvatarEidStr\233\128\137\230\139\169\228\186\134\229\165\150\229\138\177 AvatarEidStr " .. (AvatarEidStr or "nil"))
  end
end

function WalnutComponent:GetWalnutRewardNotSelectedPlayers()
  local Res = {}
  for AvatarEidStr, IsSelected in pairs(self.EMGameState.WalnutRewardPlayer) do
    if not IsSelected then
      table.insert(Res, AvatarEidStr)
    end
  end
  return Res
end

function WalnutComponent:InitWalnutRewardPlayerMap()
  self.EMGameState.WalnutRewardPlayer:Clear()
  for _, Player in pairs(self:GetAllPlayer()) do
    local AvatarEidStr = Player:GetOwner().AvatarEidStr
    local LastChooseWalnutId = self:GetLastChooseWalnutId(AvatarEidStr)
    local IsAlreadySelect = -1 == LastChooseWalnutId or 0 == LastChooseWalnutId or nil == LastChooseWalnutId
    self.EMGameState.WalnutRewardPlayer:Add(AvatarEidStr, IsAlreadySelect)
    DebugPrint("WalnutComponent: InitWalnutRewardPlayerMap, AvatarEidStr", AvatarEidStr, "LastChooseWalnutId", LastChooseWalnutId)
  end
  UE.UMapSyncHelper.SyncMap(self.EMGameState, "WalnutRewardPlayer")
end

function WalnutComponent:GetLastChooseWalnutId(AvatarEidStr)
  if 0 == self.EMGameState.NextWalnutPlayer:Length() then
    return self.AvatarInfos[AvatarEidStr].PlayerInfo.Walnuts.WalnutId
  else
    return self.EMGameState.NextWalnutPlayer:Find(AvatarEidStr)
  end
end

function WalnutComponent:IsAllPlayerNotChoosedNextWalnut()
  if 0 == self.EMGameState.NextWalnutPlayer:Length() then
    PrintTable(self.AvatarInfos, 10)
    for _, v in pairs(self.AvatarInfos) do
      if -1 ~= v.PlayerInfo.Walnuts.WalnutId then
        return false
      end
    end
    return true
  else
    for _, WalnutId in pairs(self.EMGameState.NextWalnutPlayer) do
      if -1 ~= WalnutId and 0 ~= WalnutId then
        return false
      end
    end
    return true
  end
end

function WalnutComponent:NotifyLogicServerOpenWalnut()
  local Entity
  if IsStandAlone(self) then
    Entity = GWorld:GetAvatar()
  else
    Entity = GWorld:GetDSEntity()
  end
  Entity:OpenWalnut()
end

function WalnutComponent:BpOnTimerEnd_ShowWalnutReward()
  DebugPrint("WalnutComponent:BpOnTimerEnd_ShowWalnutReward")
  local DSEntity = GWorld:GetDSEntity()
  local NotSelectedPlayers = self:GetWalnutRewardNotSelectedPlayers()
  PrintTable(NotSelectedPlayers, 2)
  DSEntity:SelectWalnutReward(NotSelectedPlayers, 1)
  self:ExecuteNextStepOfWalnutReward()
end

function WalnutComponent:OnPlayerSelectWalnutReward()
  DebugPrint("WalnutComponent:OnPlayerSelectWalnutReward")
  self:BpDelTimer("ShowWalnutReward", true, Const.GameModeEventServerClient)
  self:ExecuteNextStepOfWalnutReward()
end

function WalnutComponent:ExecuteNextStepOfWalnutReward()
  self:RemoveTimer("ShowWalnutRewardDebug")
  EventManager:RemoveEvent(EventID.OnSelectWalnutReward, self)
  self:SetGamePaused("WalnutReward", false)
  DebugPrint("WalnutComponent:ExecuteNextStepOfWalnutReward \230\152\175\230\151\160\229\176\189\229\137\175\230\156\172\229\144\151", self:IsEndlessDungeon())
  if not self:IsEndlessDungeon() then
    self:TriggerRealDungeFinish(true)
  else
    self:ExecuteLogicStartDungeonVote()
  end
end

function WalnutComponent:ExecuteWalutLogicOnEnd()
  self:TriggerShowWalnutReward()
end

function WalnutComponent:TriggerShowNextWalnut()
  DebugPrint("WalnutComponent:TriggerShowNextWalnut")
  EventManager:AddEvent(EventID.OnSelectWalnut, self, self.OnClinetChooseNextWalnut)
  if IsStandAlone(self) then
    self:AddDungeonEvent("NextWalnut")
  elseif IsDedicatedServer(self) then
    local WalnutSelectTime = DataMgr.GlobalConstant.WalnutSelectTime.ConstantValue or 15
    self:BpAddTimer("NextWalnut", WalnutSelectTime, true, Const.GameModeEventServerClient)
    self:InitNextWalnutPlayerMap()
    self.IsNextStepTriggered = false
    self:ShowWalnutDebugTimer(WalnutSelectTime, "ShowNextWalnutDebug")
  end
end

function WalnutComponent:InitNextWalnutPlayerMap()
  self.EMGameState.NextWalnutPlayer:Clear()
  for _, Player in pairs(self:GetAllPlayer()) do
    local AvatarEidStr = Player:GetOwner().AvatarEidStr
    self.EMGameState.NextWalnutPlayer:Add(AvatarEidStr, 0)
    DebugPrint("WalnutComponent: InitNextWalnutPlayerMap, AvatarEidStr", AvatarEidStr)
  end
  UE.UMapSyncHelper.SyncMap(self.EMGameState, "NextWalnutPlayer")
end

function WalnutComponent:OnClinetChooseNextWalnut(AvatarEidStr, WalnutId)
  DebugPrint("WalnutComponent:OnClinetChooseNextWalnut, AvatarEidStr", AvatarEidStr, "WalnutId", WalnutId)
  if IsStandAlone(self) then
    self:OnClinetChooseNextWalnut_StandAlone(AvatarEidStr, WalnutId)
  elseif IsDedicatedServer(self) then
    self:OnClinetChooseNextWalnut_DedicatedServer(AvatarEidStr, WalnutId)
  end
end

function WalnutComponent:OnClinetChooseNextWalnut_StandAlone(AvatarEidStr, WalnutId)
  DebugPrint("WalnutComponent:ExecuteNextStepOfChooseWalnu_StandAlone")
  EventManager:RemoveEvent(EventID.OnSelectWalnut, self)
  self:RemoveDungeonEvent("NextWalnut")
  self:TriggerActiveGameModeState(Const.StateBattleProgress)
end

function WalnutComponent:OnClinetChooseNextWalnut_DedicatedServer(AvatarEidStr, WalnutId)
  if self.EMGameState.NextWalnutPlayer:Find(AvatarEidStr) ~= nil then
    self.EMGameState.NextWalnutPlayer:Add(AvatarEidStr, WalnutId)
    UE.UMapSyncHelper.SyncMap(self.EMGameState, "NextWalnutPlayer")
    if self.IsNextStepTriggered then
      DebugPrint("WalnutComponent: \229\128\146\232\174\161\230\151\182\229\144\142\230\137\141\230\148\182\229\136\176\231\154\132skynet\228\186\139\228\187\182 AvatarEidStr", AvatarEidStr, "WalnutId", WalnutId)
      return
    end
    local NotChoosedPlayers = self:GetNextWalnutNotChoosedPlayers()
    if 0 == #NotChoosedPlayers then
      self:OnPlayerChoosedNextWalnut()
    end
  end
end

function WalnutComponent:OnPlayerChoosedNextWalnut()
  DebugPrint("WalnutComponent:OnPlayerChoosedNextWalnut")
  self:BpDelTimer("NextWalnut", true, Const.GameModeEventServerClient)
  self:ExecuteWalnutReadyCountDown()
end

function WalnutComponent:BpOnTimerEnd_NextWalnut()
  DebugPrint("WalnutComponent:BpOnTimerEnd_NextWalnut")
  self:ExecuteWalnutReadyCountDown()
end

function WalnutComponent:ExecuteWalnutReadyCountDown()
  self:RemoveTimer("ShowNextWalnutDebug")
  self.IsNextStepTriggered = true
  DebugPrint("WalnutComponent:ExecuteWalnutReadyCountDown")
  local WalnutDungeonReadyTime = DataMgr.GlobalConstant.WalnutDungeonReadyTime.ConstantValue or 15
  self:BpAddTimer("WalnutReady", WalnutDungeonReadyTime, true, Const.GameModeEventServerClient)
  self:ShowWalnutDebugTimer(WalnutDungeonReadyTime, "ShowWalnutReadyDebug")
end

function WalnutComponent:BpOnTimerEnd_WalnutReady()
  DebugPrint("WalnutComponent:BpOnTimerEnd_WalnutReady")
  EventManager:RemoveEvent(EventID.OnSelectWalnut, self)
  PrintTable(self.EMGameState.NextWalnutPlayer:ToTable())
  self:RemoveTimer("ShowWalnutReadyDebug")
  self:TriggerActiveGameModeState(Const.StateBattleProgress)
end

function WalnutComponent:GetNextWalnutNotChoosedPlayers()
  local Res = {}
  for AvatarEidStr, WalnutId in pairs(self.EMGameState.NextWalnutPlayer) do
    if 0 == WalnutId then
      table.insert(Res, AvatarEidStr)
    end
  end
  return Res
end

function WalnutComponent:ShowWalnutDebugTimer(TotalTime, Handle)
  local count = TotalTime
  self:AddTimer(1, function()
    DebugPrint("WalnutComponent:" .. Handle .. " remaintime:", count)
    count = count - 1
    if count <= 0 then
      self:RemoveTimer(Handle)
    end
  end, true, 0, Handle, true)
end

return WalnutComponent
