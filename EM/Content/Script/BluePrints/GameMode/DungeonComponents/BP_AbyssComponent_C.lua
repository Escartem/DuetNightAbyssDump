require("UnLua")
local BP_AbyssComponent_C = Class({
  "BluePrints.Common.TimerMgr"
})

function BP_AbyssComponent_C:InitAbyssComponent()
  self.GameMode = self:GetOwner()
  self:InitListenEvent()
  if GWorld.GameInstance.TempAbyssInfo then
    self.AbyssDungeonId = GWorld.GameInstance.TempAbyssInfo.AbyssDungeonId
    self.AbyssDifficulty = GWorld.GameInstance.TempAbyssInfo.AbyssDifficulty
    GWorld.GameInstance.TempAbyssInfo = nil
  else
    self.AbyssLogicServerInfo = self.GameMode.PreInitInfo
    if not self.AbyssLogicServerInfo then
      DebugPrint("BP_AbyssComponent_C:InitAbyssComponent \228\187\142\230\149\176\230\141\174\230\129\162\229\164\141\230\139\191\228\191\161\230\129\175")
      self.AbyssLogicServerInfo = self.GameMode:GetProgressDataAbyssLogicServerInfo()
      if not self.AbyssLogicServerInfo then
        GameState(self):ShowDungeonError("BP_AbyssComponent_C:\228\187\142\233\128\187\232\190\145\230\156\141\230\139\191\229\136\176\231\154\132\228\191\161\230\129\175\228\184\186\231\169\186 \228\184\148 \230\178\161\230\156\137\228\187\142\230\149\176\230\141\174\230\129\162\229\164\141\230\139\191\229\136\176\228\191\161\230\129\175")
        return
      end
    end
    DebugPrint("BP_AbyssComponent_C:InitAbyssComponent \228\187\142\233\128\187\232\190\145\230\156\141\230\139\191\229\136\176\231\154\132\228\191\161\230\129\175 AbyssId", self.AbyssLogicServerInfo.AbyssId, "AbyssLevelId", self.AbyssLogicServerInfo.AbyssLevelId, "AbyssDungeonId", self.AbyssLogicServerInfo.AbyssDungeonId)
    self.AbyssDungeonId = self.AbyssLogicServerInfo.AbyssDungeonId
    self.AbyssDifficulty = self:GetAbyssDifficulty()
  end
  self.GameMode:SetGameModeLevel(self.AbyssDifficulty)
  self.AbyssDungeonInfo = DataMgr.AbyssDungeon[self.AbyssDungeonId]
  if not self.AbyssDungeonInfo then
    GameState(self):ShowDungeonError("BP_AbyssComponent_C:\229\189\147\229\137\141AbyssDungeonId\230\178\161\230\156\137\229\161\171\229\134\153\229\156\168\229\175\185\229\186\148\231\154\132AbyssDungeon\232\161\168\228\184\173, \232\175\187\232\161\168\229\164\177\232\180\165! \232\175\187\229\133\165Id\239\188\154" .. self.AbyssDungeonId)
    return
  end
  self.AbyssRoomIndex = 0
  self.CurRoomId = 0
  DebugPrint("BP_AbyssComponent_C:InitAbyssComponent AbyssDungeonId", self.AbyssDungeonId, "AbyssDifficulty", self.AbyssDifficulty)
end

function BP_AbyssComponent_C:InitListenEvent()
  EventManager:AddEvent(EventID.OnAbyssSeasonEnd, self, self.OnAbyssSeasonEnd)
end

function BP_AbyssComponent_C:RemoveListenEvent()
  EventManager:RemoveEvent(EventID.OnAbyssSeasonEnd, self)
end

function BP_AbyssComponent_C:ReceiveEndPlay(EndPlayReason)
  self:RemoveListenEvent()
end

function BP_AbyssComponent_C:GetAbyssDifficulty()
  local AbyssId = self.AbyssLogicServerInfo.AbyssId
  local AbyssLevelIndex = self.AbyssLogicServerInfo.AbyssLevelId
  local AbyssLevelIdList = DataMgr.AbyssSeason[AbyssId].AbyssLevelId
  local RealAbyssLevelIndex = AbyssLevelIndex % #AbyssLevelIdList
  if 0 == RealAbyssLevelIndex then
    RealAbyssLevelIndex = #AbyssLevelIdList
  end
  local CurLevelId = AbyssLevelIdList[RealAbyssLevelIndex]
  local AbyssLevelInfo = DataMgr.AbyssLevel[CurLevelId]
  return AbyssLevelInfo.InitLevel + (AbyssLevelInfo.LevelAddOn or 0) * (AbyssLevelIndex // #AbyssLevelIdList)
end

function BP_AbyssComponent_C:GetAbyssId()
  return self.AbyssLogicServerInfo.AbyssId
end

function BP_AbyssComponent_C:InitGlobalPassive()
  if not self.AbyssDungeonId then
    GameState(self):ShowDungeonError("\230\139\191\228\184\141\229\136\176\229\189\147\229\137\141\229\164\167\231\167\152\229\162\131\231\154\132Id")
    return
  end
  local AbyssDungeonData = DataMgr.AbyssDungeon[self.AbyssDungeonId]
  if not AbyssDungeonData then
    GameState(self):ShowDungeonError("\232\175\187\228\184\141\229\136\176\229\189\147\229\137\141\229\164\167\231\167\152\229\162\131\233\133\141\231\189\174, Id\228\184\186 " .. self.AbyssDungeonId)
    return
  end
  local AbyssBuffList = AbyssDungeonData.AbyssBuffID or {}
  for _, AbyssBuffID in pairs(AbyssBuffList) do
    local AbyssBuffData = DataMgr.AbyssBuff[AbyssBuffID]
    if AbyssBuffData then
      local GlobalPassiveId = AbyssBuffData.GlobalPassiveId
      local GlobalPassiveLevel = AbyssBuffData.GlobalPassiveLv
      if GlobalPassiveId and GlobalPassiveLevel then
        local Battle = Battle(self)
        Battle:AddGlobalPassive(GlobalPassiveId, nil, GlobalPassiveLevel)
        DebugPrint("\230\183\187\229\138\160\229\133\168\229\177\128\232\162\171\229\138\168, Id = " .. GlobalPassiveId .. " Level = " .. GlobalPassiveLevel .. " AbyssDungeonId = " .. self.AbyssDungeonId)
      end
    else
      DebugPrint("Tianyi@ \230\137\190\228\184\141\229\136\176\229\164\167\231\167\152\229\162\131\232\175\141\230\157\161, Id = " .. AbyssBuffID)
    end
  end
end

function BP_AbyssComponent_C:InitAbyssBaseInfo()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not Player then
    GameState(self):ShowDungeonError("BP_AbyssComponent_C:InitAbyssBaseInfo \230\139\191\228\184\141\229\136\176Player")
    return
  end
  self:InitGlobalPassive()
  local LevelId = self.GameMode:GetActorLevelName(Player)
  self:TriggerStartNextRoom("", LevelId)
end

function BP_AbyssComponent_C:TriggerStartNextRoom(LastLevelId, NewLevelId)
  self:RealSendAbyssPassedTime()
  local gamestate = GameState(self)
  gamestate.AbyssBattleCount = -1
  self.AbyssRoomIndex = self.AbyssRoomIndex + 1
  local AbyssRoomId = self.AbyssDungeonInfo.RoomId[self.AbyssRoomIndex]
  DebugPrint("BP_AbyssComponent_C:TriggerStartNextRoom NewLevelId", NewLevelId, "AbyssRoomIndex", self.AbyssRoomIndex, "AbyssRoomId", AbyssRoomId)
  self.CurRoomId = AbyssRoomId
  self.AbyssRoomInfo = DataMgr.AbyssRoom[AbyssRoomId]
  if not self.AbyssRoomInfo then
    GameState(self):ShowDungeonError("BP_AbyssComponent_C: AbyssRoom\232\161\168\232\175\187\232\161\168\229\164\177\232\180\165\239\188\129 AbyssRoomId " .. AbyssRoomId)
    return
  end
  self.GameMode:InitAbyssSubGameMode(self.AbyssRoomInfo.SubGamemode, NewLevelId)
  local SubGameMode = self.GameMode.SubGameModeInfo:FindRef(NewLevelId)
  if IsValid(SubGameMode) then
    self.GameMode:OnStartNextRoom(LastLevelId, NewLevelId)
    SubGameMode:OnAbyssRoomBegin(NewLevelId, AbyssRoomId)
  else
    GameState(self):ShowDungeonError("Error: BP_AbyssComponent_C:TriggerStartNextRoom \228\188\160\229\133\165\229\143\130\230\149\176\228\184\141\229\144\136\230\179\149" .. LastLevelId .. NewLevelId)
  end
end

function BP_AbyssComponent_C:RealSendAbyssPassedTime()
  if self.CachedPassedTime then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      Avatar:TriggerCompleteAbyssRoom(self.CurRoomId, self.CachedPassedTime)
      DebugPrint("BP_AbyssComponent_C:TriggerStartNextRoom SendAbyssPassedTime", self.CurRoomId, self.CachedPassedTime)
    end
    self.CachedPassedTime = nil
  end
end

function BP_AbyssComponent_C:GetAbyssRoomIndex()
  return self.AbyssRoomIndex
end

function BP_AbyssComponent_C:SendAbyssPassedTime(_PassedTime)
  local PassedTime = math.ceil(_PassedTime)
  self.CachedPassedTime = PassedTime
  DebugPrint("BP_AbyssComponent_C: SendAbyssPassedTime To Cache RoomId", self.CurRoomId, "PassedTime", PassedTime)
end

function BP_AbyssComponent_C:TriggerAbyssOnEnd()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local AbyssInfo = Avatar.Abysses[self.AbyssLogicServerInfo.AbyssId]
  if not AbyssInfo then
    return
  end
  local AbyssLevelInfo = AbyssInfo.AbyssLevelList[self.AbyssLogicServerInfo.AbyssLevelId]
  if not AbyssLevelInfo then
    return
  end
  local IsPassed = AbyssLevelInfo:IsAbyssLevelPass()
  if not IsPassed then
    return
  end
  local HasShow = self.AbyssLogicServerInfo.AbyssLevelId .. "HasShow"
  local Entry1Detail = ReddotManager.GetLeafNodeCacheDetail("AbyssEntry1")
  if Entry1Detail[HasShow] then
    return
  else
    Entry1Detail[HasShow] = true
  end
  local AbyssId = self.AbyssLogicServerInfo.AbyssId
  local AbyssLevelIndex = self.AbyssLogicServerInfo.AbyssLevelId
  local AbyssLevelIdList = DataMgr.AbyssSeason[AbyssId].AbyssLevelId
  local RealAbyssLevelIndex = AbyssLevelIndex % #AbyssLevelIdList
  if 0 == RealAbyssLevelIndex then
    RealAbyssLevelIndex = #AbyssLevelIdList
  end
  local AbyssLevel = DataMgr.AbyssLevel
  local PreLevel = AbyssLevelIdList[RealAbyssLevelIndex]
  if not PreLevel then
    return
  end
  local NowLevel = PreLevel + 1
  local DungeonId1 = AbyssLevel[PreLevel].AbyssDungeon1
  local NewDungeon1BuffIds = {}
  local NewDungeon2BuffIds = {}
  if DungeonId1 then
    local PreDungeon1BuffIds = {}
    local NowDungeon1BuffIds = {}
    if AbyssLevel[NowLevel] then
      local NowDungeonId1 = AbyssLevel[NowLevel].AbyssDungeon1
      NowDungeon1BuffIds = DataMgr.AbyssDungeon[NowDungeonId1].AbyssBuffID
    end
    if AbyssLevel[PreLevel] then
      do
        local PreDungeonId1 = AbyssLevel[PreLevel].AbyssDungeon1
        PreDungeon1BuffIds = DataMgr.AbyssDungeon[PreDungeonId1].AbyssBuffID
      end
    end
    for _, Buff2Id in pairs(NowDungeon1BuffIds) do
      local Isfind = false
      for _, Buff1Id in pairs(PreDungeon1BuffIds) do
        if Buff2Id == Buff1Id then
          Isfind = true
          goto lbl_108
        end
      end
      ::lbl_108::
      if not Isfind then
        table.insert(NewDungeon1BuffIds, Buff2Id)
      end
    end
  end
  local DungeonId2 = AbyssLevel[PreLevel].AbyssDungeon2
  if DungeonId2 then
    local PreDungeon2BuffIds = {}
    local NowDungeon2BuffIds = {}
    if AbyssLevel[NowLevel] then
      local NowDungeonId2 = AbyssLevel[NowLevel].AbyssDungeon2
      NowDungeon2BuffIds = DataMgr.AbyssDungeon[NowDungeonId2].AbyssBuffID
    end
    if AbyssLevel[PreLevel] then
      do
        local PreDungeonId2 = AbyssLevel[PreLevel].AbyssDungeon2
        PreDungeon2BuffIds = DataMgr.AbyssDungeon[PreDungeonId2].AbyssBuffID
      end
    end
    for _, Buff2Id in pairs(NowDungeon2BuffIds) do
      local Isfind = false
      for _, Buff1Id in pairs(PreDungeon2BuffIds) do
        if Buff2Id == Buff1Id then
          Isfind = true
          goto lbl_161
        end
      end
      ::lbl_161::
      if not Isfind then
        table.insert(NewDungeon2BuffIds, Buff2Id)
      end
    end
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("AbyssEntry1")
  local HasNew = false
  for _, Value in ipairs(NewDungeon1BuffIds) do
    local CacheKey = tostring(Value)
    if not CacheDetail[self.AbyssLogicServerInfo.AbyssId] then
      CacheDetail[self.AbyssLogicServerInfo.AbyssId] = {}
    end
    if not CacheDetail[self.AbyssLogicServerInfo.AbyssId][CacheKey] then
      CacheDetail[self.AbyssLogicServerInfo.AbyssId][CacheKey] = true
      HasNew = true
    end
  end
  if HasNew then
    ReddotManager.IncreaseLeafNodeCount("AbyssEntry1")
  end
  HasNew = false
  CacheDetail = ReddotManager.GetLeafNodeCacheDetail("AbyssEntry2")
  for _, Value in ipairs(NewDungeon2BuffIds) do
    local CacheKey = tostring(Value)
    if not CacheDetail[self.AbyssLogicServerInfo.AbyssId] then
      CacheDetail[self.AbyssLogicServerInfo.AbyssId] = {}
    end
    if not CacheDetail[self.AbyssLogicServerInfo.AbyssId][CacheKey] then
      CacheDetail[self.AbyssLogicServerInfo.AbyssId][CacheKey] = true
      HasNew = true
    end
  end
  if HasNew then
    ReddotManager.IncreaseLeafNodeCount("AbyssEntry2")
  end
end

function BP_AbyssComponent_C:OnAbyssSeasonEnd(AbyssSeasonId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  EventManager:RemoveEvent(EventID.OnAbyssSeasonEnd, self)
  DebugPrint("BP_AbyssComponent_C:OnAbyssSeasonEnd")
  if Avatar:IsInEnterDungeon() then
    EventManager:AddEvent(EventID.CloseLoading, self, function()
      EventManager:RemoveEvent(EventID.CloseLoading, self)
      self:ShowSeasonEndPopup()
    end)
  else
    self:ShowSeasonEndPopup()
  end
end

function BP_AbyssComponent_C:ShowSeasonEndPopup()
  local Params = {}
  
  function Params.RightCallbackFunction()
    self.GameMode:TriggerDungeonWin()
  end
  
  UIManager(self):ShowCommonPopupUI(100225, Params)
end

return BP_AbyssComponent_C
