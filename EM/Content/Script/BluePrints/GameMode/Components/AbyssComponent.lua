require("UnLua")
require("Const")
local AbyssComponent = {}

function AbyssComponent:OnStartNextRoom(LevelId, NewLevelId)
  if self:IsSubGameMode() then
    return
  end
  print(_G.LogTag, "LXZ OnStartNextRoom", LevelId, NewLevelId)
end

function AbyssComponent:OnAbyssRoomBegin(LevelId, RoomId)
  if not self:IsSubGameMode() then
    return
  end
  self.AbyssRoomId = RoomId
  local AbyssRoomInfo = DataMgr.AbyssRoom[self.AbyssRoomId]
  if not AbyssRoomInfo then
    self.EMGameState:ShowDungeonError("RoomId\228\184\141\229\173\152\229\156\168\228\186\142AbyssRoom\232\161\168\233\135\140, RoomId" .. self.AbyssRoomId)
    return
  end
  if not AbyssRoomInfo.ClearCondition then
    self.EMGameState:ShowDungeonError("AbyssRoom\232\161\168\233\135\140\228\184\141\229\173\152\229\156\168ClearCondition, RoomId" .. self.AbyssRoomId)
    return
  end
  if not AbyssRoomInfo.TimeLimit then
    self.EMGameState:ShowDungeonError("AbyssRoom\232\161\168\233\135\140\228\184\141\229\173\152\229\156\168TimeLimit, RoomId" .. self.AbyssRoomId)
    return
  end
  if not AbyssRoomInfo.UnitSpawnId then
    self.EMGameState:ShowDungeonError("AbyssRoom\232\161\168\233\135\140\228\184\141\229\173\152\229\156\168UnitSpawnId, RoomId" .. self.AbyssRoomId)
    return
  end
  self.ClearCondition = AbyssRoomInfo.ClearCondition
  self.TimeLimit = AbyssRoomInfo.TimeLimit
  self.UnitSpawnId:Clear()
  for _, Id in pairs(AbyssRoomInfo.UnitSpawnId) do
    self.UnitSpawnId:Add(Id)
  end
  self.StaticCreatorId:Clear()
  if AbyssRoomInfo.StaticCreatorId then
    for _, Id in pairs(AbyssRoomInfo.StaticCreatorId) do
      self.StaticCreatorId:Add(Id)
    end
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/battle_warning", nil, nil)
  self.Overridden.OnAbyssRoomBegin(self, LevelId, RoomId)
end

function AbyssComponent:IsAbyssBossRoom()
  if self.IsAbyssRoomTypeBossRoom == nil then
    local AbyssRoomInfo = DataMgr.AbyssRoom[self.AbyssRoomId]
    self.IsAbyssRoomTypeBossRoom = AbyssRoomInfo.RoomType == "Boss"
  end
  return self.IsAbyssRoomTypeBossRoom
end

function AbyssComponent:TryUnlockDoor()
  if self.GetLevelLoader and self:GetLevelLoader() then
    local LevelLoader = self:GetLevelLoader()
    if LevelLoader.LevelId2Doors[self.LevelName] then
      for i = 1, #LevelLoader.LevelId2Doors[self.LevelName] do
        if LevelLoader.LevelId2Doors[self.LevelName][i].door_state then
          local Door = LevelLoader.LevelId2Doors[self.LevelName][i].AutoDoor
          Door:OnUnLockDoor()
          if LevelLoader.LoadAbyssLevel then
            LevelLoader:LoadAbyssLevel(LevelLoader.LevelId2Doors[self.LevelName][i], self.LevelName)
          end
          return true
        end
      end
    else
      self.EMGameState:ShowDungeonError("\229\189\147\229\137\141\230\136\191\233\151\180\233\128\154\232\191\135\239\188\140\228\189\134\230\152\175LevelLoader.LevelId2Doors\228\184\173\230\178\161\230\156\137\229\189\147\229\137\141LevelName\239\188\154" .. self.LevelName)
    end
  else
    self.EMGameState:ShowDungeonError("\229\189\147\229\137\141\230\136\191\233\151\180\233\128\154\232\191\135\239\188\140\228\189\134\230\152\175GameMode\232\142\183\229\143\150\228\184\141\229\136\176LevelLoader")
  end
  return false
end

function AbyssComponent:TryLockDoor()
  if self.LevelGameMode.GetLevelLoader and self.LevelGameMode:GetLevelLoader() then
    local LevelLoader = self.LevelGameMode:GetLevelLoader()
    if LevelLoader.LevelId2Doors[self.LevelName] then
      for i = 1, #LevelLoader.LevelId2Doors[self.LevelName] do
        if LevelLoader.LevelId2Doors[self.LevelName][i].door_state then
          local Door = LevelLoader.LevelId2Doors[self.LevelName][i].AutoDoor
          Door:OnLockDoor()
        end
      end
    else
      self.EMGameState:ShowDungeonError("\232\191\155\229\133\165\230\150\176\230\136\191\233\151\180\239\188\140\228\189\134\230\152\175LevelLoader.LevelId2Doors\228\184\173\230\178\161\230\156\137\229\189\147\229\137\141LevelName\239\188\154" .. self.LevelName .. self:GetName())
    end
  else
    self.EMGameState:ShowDungeonError("\232\191\155\229\133\165\230\150\176\230\136\191\233\151\180\239\188\140\228\189\134\230\152\175GameMode\232\142\183\229\143\150\228\184\141\229\136\176LevelLoader")
  end
end

function AbyssComponent:AddAbyssBattleCount(Value)
  self.EMGameState.AbyssBattleCount = self.EMGameState.AbyssBattleCount + Value
  EventManager:FireEvent(EventID.OnRepAbyssBattleCount)
end

function AbyssComponent:SetAbyssBattleMaxNum(Value, DisplayText, IsShowBar)
  self.EMGameState.AbyssBattleCount = 0
  self.EMGameState.AbyssBattleMaxNum = Value
  EventManager:FireEvent(EventID.OnRepAbyssBattleCount)
  local AbyssBattleUI = UIManager(self):GetUIObj("Abyss_BattleProgress")
  if AbyssBattleUI then
    self:SetAbyssBattlePanelVisibility(true)
    AbyssBattleUI:InitAbyssBattleDisplayText(DisplayText, IsShowBar)
  else
    self:AddTimer(0.1, function()
      AbyssBattleUI = UIManager(self):GetUIObj("Abyss_BattleProgress")
      if AbyssBattleUI then
        self:SetAbyssBattlePanelVisibility(true)
        AbyssBattleUI:InitAbyssBattleDisplayText(DisplayText, IsShowBar)
        self:RemoveTimer("InitAbyssDisplayTextTimer")
      end
    end, true, 0, "InitAbyssDisplayTextTimer")
  end
end

function AbyssComponent:HideAbyssBattlePanel()
  self:SetAbyssBattlePanelVisibility(false)
end

function AbyssComponent:SetAbyssBattlePanelVisibility(IsShow)
  local AbyssBattleUI = UIManager(self):GetUIObj("Abyss_BattleProgress")
  if AbyssBattleUI then
    AbyssBattleUI:SetAbyssBattleVisibility(IsShow)
  else
    DebugPrint("AbyssComponent:SetAbyssBattlePanelVisibility \230\137\190\228\184\141\229\136\176AbyssBattleUI ", IsShow)
  end
end

function AbyssComponent:GetCurrentAbyssDungeonId()
  if self.EMGameState.GameModeType ~= "Abyss" then
    return 0
  end
  return self.LevelGameMode:GetDungeonComponent() and self.LevelGameMode:GetDungeonComponent().AbyssDungeonId or 0
end

function AbyssComponent:BpOnTimerDel_AbyssBattle()
  if CommonUtils.HasClientTimerStruct("AbyssBattle") then
    local PassedTime = CommonUtils.GetClientTimerStructPassedTime("AbyssBattle")
    self.LevelGameMode:TriggerDungeonComponentFun("SendAbyssPassedTime", PassedTime)
    self.LevelGameMode:TriggerDungeonComponentFun("RealSendAbyssPassedTime")
  elseif CommonUtils.HasClientTimerStruct("AbyssBattleNew") then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    local Info = GameState.ClientTimerStruct:GetTimerInfo("AbyssBattleNew")
    local IsRealTime = Info.IsRealTime
    self:BpDelTimer("AbyssBattleNew", IsRealTime, Const.GameModeEventServerClient)
  end
end

function AbyssComponent:BpOnTimerDel_AbyssBattleNew()
  local PassedTime = CommonUtils.GetClientTimerStructPassedTime("AbyssBattleNew")
  self.LevelGameMode:TriggerDungeonComponentFun("SendAbyssPassedTime", PassedTime)
end

function AbyssComponent:BpOnTimerEnd_AbyssBattleNew()
  self:BpOnTimerEnd("AbyssBattle")
end

function AbyssComponent:AbyssTeleport(Location, Rotation, IsBoss)
  if self.EMGameState.GameModeType ~= "Abyss" then
    return
  end
  DebugPrint("AbyssTeleport", Location)
  self:GetLevelLoader():OnAbyssTeleport(IsBoss)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local LastLevelId = self:GetLevelLoader():GetLevelIdByLocation(PlayerCharacter:K2_GetActorLocation())
  local NewLevelId = self:GetLevelLoader():GetLevelIdByLocation(Location)
  PlayerCharacter:K2_TeleportTo(Location, Rotation, false, nil, false)
  EventManager:FireEvent(EventID.ForceUpdatePlayerCurrentLevelId)
  self:AddTimer(2, self.OnCharacterChangeLevel, false, 0, "AbyssTeleport", false, LastLevelId, NewLevelId)
end

function AbyssComponent:OnCharacterChangeLevel(LastLevelId, NewLevelId)
  print(_G.LogTag, "LXZ OnCharacterChangeLevel", LastLevelId, NewLevelId, self:GetName())
  self:TryLockDoor()
  self.LevelGameMode:AbyssRecordProgressData({LastLevelId = LastLevelId, NewLevelId = NewLevelId})
  self.LevelGameMode:TriggerDungeonComponentFun("TriggerStartNextRoom", LastLevelId, NewLevelId)
end

return AbyssComponent
