require("UnLua")
require("Const")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local RougeLikeComponent = {}

function RougeLikeComponent:TriggerRougeLikeEnd(IsWin)
  if not GWorld.RougeLikeManager then
    self.EMGameState:ShowDungeonError("TriggerRougeLikeEnd \230\139\191\228\184\141\229\136\176 RougeLikeManager")
    return
  end
  DebugPrint("TriggerRougeLikeEnd RoomId", GWorld.RougeLikeManager.RoomId)
  local TotalTime = self.LevelGameMode:StopAndGetRougeLikeTimer()
  
  local function Callback()
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local TotalTime = self.LevelGameMode:StopAndGetRougeLikeTimer()
      Avatar:PassRoom(TotalTime)
    else
      self.EMGameState:ShowDungeonError("TriggerRougeLikeEnd \230\139\191\228\184\141\229\136\176 Avatar")
    end
  end
  
  if IsWin then
    local RoomInfo = DataMgr.RougeLikeRoom[GWorld.RougeLikeManager.RoomId]
    local TypeInfo = DataMgr.RougeLikeRoomType[RoomInfo.RoomType]
    if TypeInfo.EnableTimeDilation then
      GWorld.RougeLikeManager:EnterRougeLikeBulletTime(0.2, 1, Callback)
    else
      Callback()
    end
  else
    Callback()
  end
end

function RougeLikeComponent:FinishRougeLike(IsWin, AvatarEids)
  if self:IsDungeonInSettlement() then
    return
  end
  
  local function RealFinishRougeLike(bStoryEvent)
    DebugPrint("RougeLikeComponent:RealFinishRougeLike bStoryEvent", bStoryEvent)
    if bStoryEvent then
      self:ShowFinishRougeStory(IsWin, AvatarEids)
    else
      self:TriggerRealFinish(IsWin, AvatarEids)
    end
  end
  
  GWorld.RougeLikeManager:TriggerRecordProgressData({IsRougeFinished = true, IsWin = IsWin})
  local Avatar = GWorld:GetAvatar()
  Avatar:PreFinishRougeLike(RealFinishRougeLike, IsWin)
end

function RougeLikeComponent:ShowFinishRougeStory(IsWin, AvatarEids)
  EventManager:AddEvent(EventID.OnRougeLikeStoryEventEnd, self, function()
    DebugPrint("RougeLikeComponent:ReceivedEvent EventID.OnRougeLikeStoryEventEnd")
    EventManager:RemoveEvent(EventID.OnRougeLikeStoryEventEnd, self)
    self:TriggerRealFinish(IsWin, AvatarEids)
  end)
  GWorld.RougeLikeManager:ShowRougeStoryEvent()
end

function RougeLikeComponent:TriggerRealFinish(IsWin, AvatarEids)
  if IsWin then
    self:TriggerDungeonWin()
  elseif AvatarEids then
    self:TriggerPlayerFailed(AvatarEids)
  else
    self:TriggerDungeonFailed()
  end
end

function RougeLikeComponent:OnRougeLikeEnterNextRoom()
  DebugPrint("RougeLike OnRougeLikeEnterNextRoom RoomIndex:", GWorld.RougeLikeManager.RoomIndex, "RoomId:", GWorld.RougeLikeManager.RoomId)
  if GWorld.RougeLikeManager.IsListeningDealRewardEvent then
    self.EMGameState:ShowDungeonError("RougeLike Error! \232\191\155\229\133\165\228\184\139\228\184\128\230\136\191\233\151\180\230\151\182,ListeningDealRewardEvent\230\178\161\230\156\137\232\162\171\230\184\133\233\153\164\239\188\129\232\129\148\231\179\187ljl\230\163\128\230\159\165\239\188\129")
    GWorld.RougeLikeManager.IsListeningDealRewardEvent = false
  end
  GWorld.RougeLikeManager:RemoveDataManagerInfos(self.RougeLikeLastRoomId, true)
  GWorld.RougeLikeManager:RegisterNextRoomData(self.RougeLikeCurRoomId)
  self:ClearMonsterSpawnDivisions()
  self:InitMonsterSpawnDivisions(self.EMGameState.MonsterSpawnPointParams)
  self:RefreshRougeBattleUI(false, true)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  Battle(self):TriggerBattleEvent(BattleEventName.RougeEnterNewRoom, Player)
end

function RougeLikeComponent:CreateProbabilityMonster(MonsterType, MonsterID)
  if not MonsterID then
    return
  end
  local LevelLoader = self.LevelGameMode:GetLevelLoader()
  if nil == LevelLoader then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local PlayerLocation = GameMode:GetAllPlayer()[1].CurrentLocation
  local TargetLocation = UKismetMathLibrary.Vector_Zero()
  local LocationValid = false
  for i = 1, GameMode.EmergencyMonsterSpawnLoc.RandomTime do
    if UNavigationSystemV1.K2_GetRandomLocationInNavigableRadius(self, PlayerLocation, TargetLocation, self.EmergencyMonsterSpawnLoc.MaxDistance) == true and math.abs(PlayerLocation.Z - TargetLocation.Z) <= self.EmergencyMonsterSpawnLoc.MaxZDistance and LevelLoader:GetLevelIdByLocation(PlayerLocation) == LevelLoader:GetLevelIdByLocation(TargetLocation) and UNavigationFunctionLibrary.CheckTwoPosHasPath(PlayerLocation, TargetLocation, self) == EPathConnectType.HasPath then
      LocationValid = true
      break
    end
  end
  if false == LocationValid then
    TargetLocation = GameMode:GetMonsterCustomLoc(nil)
  end
  if false == UKismetMathLibrary.EqualEqual_VectorVector(TargetLocation, UKismetMathLibrary.Vector_Zero(), 0.001) then
    local Context = AEventMgr.CreateUnitContext()
    Context.UnitType = "Monster"
    Context.UnitId = MonsterID
    Context.Loc = TargetLocation
    Context.MonsterSpawn = GameMode.LevelGameMode.FixedMonsterSpawn
    Context.IntParams:Add("Level", GameMode:GetFixedGamemodeLevel())
    GameMode.EMGameState.EventMgr:CreateUnitNew(Context, false)
    self[MonsterType .. "MonsterSpawnProbability"] = nil
  end
end

function RougeLikeComponent:PreCreateProbabilityMonster(MonsterType, MonsterId)
  self:CreateProbabilityMonster(MonsterType, MonsterId)
  self[MonsterType .. "MonsterTimer"] = nil
end

function RougeLikeComponent:CheckCreateProbabilityMonster(MonsterType)
  DebugPrint("[THY] RougeLike CheckCreateSpecialMonster", MonsterType)
  if GWorld.RougeLikeManager.RoomIndex < DataMgr.RougeLikeDifficulty[GWorld.RougeLikeManager.DifficultyId].TMMinRoom then
    return
  end
  local RoomInfo = DataMgr.RougeLikeRoom[self.RougeLikeCurRoomId]
  if RoomInfo and 1 ~= RoomInfo.RoomType and 6 ~= RoomInfo.RoomType then
    DebugPrint("[THY]  CheckCreateSpecialMonster: RoomInfo.RoomType ~= 1 and RoomInfo.RoomType ~= 6")
    return
  end
  if self[MonsterType .. "MonsterTimer"] ~= nil then
    return
  end
  local DifficultyInfo = DataMgr.RougeLikeDifficulty[GWorld.RougeLikeManager.DifficultyId]
  if not DifficultyInfo then
    return
  end
  if not self[MonsterType .. "MonsterCreatedNum"] then
    self[MonsterType .. "MonsterCreatedNum"] = 0
  end
  if not (self[MonsterType .. "MonsterCreatedNum"] < DifficultyInfo.TMMaxNum) then
    DebugPrint("[THY] ThisMonsterCreatedNum is upper limit", self[MonsterType .. "MonsterCreatedNum"])
    self[MonsterType .. "MonsterTimer"] = nil
    return
  end
  if math.random() > self[MonsterType .. "MonsterSpawnProbability"] then
    return
  end
  local MonsterBornTime = math.random(DifficultyInfo.TMBornTime[1], DifficultyInfo.TMBornTime[2])
  DebugPrint("[THY] After ", MonsterBornTime, "s, CreateTreasureMonster, and TreasureMonsterCreatedNum is", self[MonsterType .. "MonsterCreatedNum"] + 1)
  self[MonsterType .. "MonsterTimer"] = self:AddTimer(MonsterBornTime, function()
    self:PreCreateProbabilityMonster(MonsterType, DifficultyInfo.TMId)
  end, false)
end

function RougeLikeComponent:SetProbabilityMonsterSpawnProbability(MonsterType, RoomInfo, DifficultyInfo)
  if not DifficultyInfo or not DifficultyInfo.TMProbability then
    return
  end
  if 1 ~= RoomInfo.RoomType and 6 ~= RoomInfo.RoomType then
    return
  end
  if self[MonsterType .. "MonsterSpawnProbability"] then
    self[MonsterType .. "MonsterSpawnProbability"] = self[MonsterType .. "MonsterSpawnProbability"] + DifficultyInfo.TMProbability[2]
  else
    self[MonsterType .. "MonsterSpawnProbability"] = DifficultyInfo.TMProbability[1]
  end
  DebugPrint("[THY] RougeLike", MonsterType, "MonsterSpawnProbability is ", self[MonsterType .. "MonsterSpawnProbability"])
end

function RougeLikeComponent:TryCreateProbabilityMonsterInRougeLike()
  local RoomInfo = DataMgr.RougeLikeRoom[self.LevelGameMode.RougeLikeCurRoomId]
  local DifficultyInfo = DataMgr.RougeLikeDifficulty[GWorld.RougeLikeManager.DifficultyId]
  if RoomInfo and DifficultyInfo then
    self.LevelGameMode:SetProbabilityMonsterSpawnProbability("Treasure", RoomInfo, DifficultyInfo)
    self.LevelGameMode:CheckCreateProbabilityMonster("Treasure")
    return
  end
  DebugPrint("RoomInfo or DifficultyInfo can not be found")
end

function RougeLikeComponent:OnRougeLikeRoomInit()
  self.RougeLikeLastRoomId = self.RougeLikeCurRoomId
  self.RougeLikeCurRoomId = GWorld.RougeLikeManager.RoomId
  DebugPrint("RougeLike OnRougeLikeRoomInit", GWorld.RougeLikeManager.RoomIndex, "LastRoomId:", self.RougeLikeLastRoomId, "CurRoomId:", self.RougeLikeCurRoomId)
  self:SetRougeLikeGameModeLevel()
  self:StartRougeLikeTimer()
  self:ShowRougeLikeSubTask(false)
end

function RougeLikeComponent:SetRougeLikeGameModeLevel()
  local RougeLikeManager = GWorld.RougeLikeManager
  if not IsValid(RougeLikeManager) then
    self.EMGameState:ShowDungeonError("RougeLike Error! \230\137\190\228\184\141\229\136\176GWorld.RougeLikeManager")
    return
  end
  local DifficultyInfo = DataMgr.RougeLikeDifficulty[RougeLikeManager.DifficultyId]
  if not DifficultyInfo then
    self.EMGameState:ShowDungeonError("RougeLike Error! \230\178\161\230\156\137\229\175\185\229\186\148RougeLikeDifficulty, DifficultyId: " .. RougeLikeManager.DifficultyId)
    return
  end
  local RoomLevel = DifficultyInfo.RoomLevel
  if not RoomLevel then
    self.EMGameState:ShowDungeonError("RougeLike Error! \230\178\161\230\156\137\229\175\185\229\186\148RoomLevel, DifficultyId: ", RougeLikeManager.DifficultyId)
    return
  end
  local GameModeLevel = RoomLevel[RougeLikeManager.RoomIndex] or 0
  self:SetGameModeLevel(GameModeLevel)
  DebugPrint("RougeLike SetRougeLikeGameModeLevel Succeed! DifficultyId: ", RougeLikeManager.DifficultyId, " RoomIndex: ", RougeLikeManager.RoomIndex, " GameModeLevel: ", GameModeLevel)
end

function RougeLikeComponent:StartRougeLikeTimer()
  self.RougeLikeTotalTime = 0
  
  local function RougeLikeTimer()
    self.RougeLikeTotalTime = self.RougeLikeTotalTime + 0.1
  end
  
  self:AddTimer(0.1, RougeLikeTimer, true, 0, "RougeLikeTimer")
  DebugPrint("RougeLike TimerStart")
end

function RougeLikeComponent:StopAndGetRougeLikeTimer()
  self:RemoveTimer("RougeLikeTimer")
  DebugPrint("RougeLike TimerStop. TotalTime:", self.RougeLikeTotalTime)
  return self.RougeLikeTotalTime or 0
end

function RougeLikeComponent:SpawnRougeLikeRoomShops()
  if GWorld.RougeLikeManager == nil then
    return
  end
  GWorld.RougeLikeManager:SpawnRoomShops()
end

function RougeLikeComponent:RefreshRougeBattleUI(IsShow, IsResetCount)
  local NewUIState
  if IsShow then
    NewUIState = Const.EDungeonUIState.OnTarget
  else
    NewUIState = Const.EDungeonUIState.None
  end
  self.EMGameState:SetDungeonUIState(NewUIState)
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  if not UIManager then
    return
  end
  local RougeBattleUI = UIManager:GetUIObj("Rouge_BattleProgress")
  if RougeBattleUI then
    RougeBattleUI:RefreshVisibility()
  end
  if IsResetCount then
    self.EMGameState:SetRougeBattleNums(0)
  end
end

function RougeLikeComponent:InitRougeLikeSubTask(DisplayText)
  self:ShowRougeLikeSubTask(true, DisplayText)
end

function RougeLikeComponent:ShowRougeLikeSubTask(IsShow, DisplayText)
  local TaskBar = TaskUtils:GetTaskBarWidget()
  if not TaskBar then
    DebugPrint("RougeLikeComponent:ShowRougeLikeSubTask, \230\137\190\228\184\141\229\136\176\228\187\187\229\138\161\230\160\143")
    return
  end
  if IsShow then
    self.LevelGameMode.RougeLikeSubTaskText = DisplayText
    TaskBar:AddOptionalTask(DisplayText)
  else
    self.LevelGameMode.RougeLikeSubTaskText = nil
    TaskBar:RemoveOptionalTask()
  end
end

function RougeLikeComponent:TriggerRougeLikePassEvent(MiniGameName, FinialScore, IsWin)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    self.EMGameState:ShowDungeonError("EMGameMode::TriggerRougeLikePassEvent No  Avatar")
    return
  end
  if "" == MiniGameName then
    DebugPrint("RougeLikeComponent::TriggerRougeLikePassEvent NotGame")
    Avatar:PassEvent()
  else
    DebugPrint("RougeLikeComponent::TriggerRougeLikePassEvent MiniGameName", MiniGameName, "FinialScore", FinialScore, "IsWin", IsWin)
    local CustomData = {}
    CustomData.Score = FinialScore
    Avatar:PassEvent(IsWin, CustomData)
  end
end

function RougeLikeComponent:SpeciaMonsterOnDeadReal(MonsterType, UnitId)
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:IsInRougeLike() then
    DebugPrint("[THY]  MonsterIsDead")
    if "Treasure" ~= MonsterType then
      return
    end
    local DifficultyInfo = DataMgr.RougeLikeDifficulty[GWorld.RougeLikeManager.DifficultyId]
    if not DifficultyInfo then
      return
    end
    DebugPrint("RougeLikeComponent:SpeciaMonsterOnDeadReal UnitId", UnitId, "TMId", DifficultyInfo.TMId)
    if UnitId ~= DifficultyInfo.TMId then
      return
    end
    if self[MonsterType .. "MonsterCreatedNum"] then
      self[MonsterType .. "MonsterCreatedNum"] = self[MonsterType .. "MonsterCreatedNum"] + 1
    else
      self[MonsterType .. "MonsterCreatedNum"] = 1
    end
    Avatar:TriggerTMGetReward()
    if "Treasure" == MonsterType then
      Avatar:SavePlayerSlice({
        Type = Const.RougeSliceInfoType.TreasureMonCount,
        Value = {
          TreasureMonCount = self.TreasureMonsterCreatedNum
        }
      })
      DebugPrint("RougeLike SaveTreasureMonCount =", self.TreasureMonsterCreatedNum)
    end
  end
end

function RougeLikeComponent:SpeciaMonsterOnDead(UnitId)
  self:SpeciaMonsterOnDeadReal("Treasure", UnitId)
end

function RougeLikeComponent:IsAllRoomPassed()
  local DifficultyInfo = DataMgr.RougeLikeDifficulty[GWorld.RougeLikeManager.DifficultyId]
  if not DifficultyInfo then
    return false
  end
  local RoomRandom = DifficultyInfo.RoomRandom
  if not RoomRandom then
    return false
  end
  local TotalRoomNum = #RoomRandom
  local PassRoomNum = GWorld.RougeLikeManager.PassRooms:Num()
  return TotalRoomNum == PassRoomNum
end

function RougeLikeComponent:TriggerAllContractDungeonEffect()
  GWorld.RougeLikeManager:TriggerAllContractDungeonEffect()
end

function RougeLikeComponent:GetContractMonsterNum()
  local RougeLikeManager = GWorld.RougeLikeManager
  local Contracts = RougeLikeManager.Contract
  local MonsterNum = 0
  if nil ~= Contracts then
    for k, v in pairs(Contracts) do
      local RoomType = DataMgr.RougeLikeRoom[RougeLikeManager.RoomId].RoomType
      local ContractData = DataMgr.RougelikeContract[k]
      local UnitType = ContractData.UnitType
      if "Monster" == UnitType then
        local EffectRoomTypes = ContractData.RoomType
        for i = 1, #EffectRoomTypes do
          if RoomType == EffectRoomTypes[i] then
            MonsterNum = MonsterNum + ContractData.UnitNum[v]
            break
          end
        end
      end
    end
  end
  DebugPrint("HTY GetContractMonsterNum: ", MonsterNum)
  return MonsterNum
end

function RougeLikeComponent:StartRougeMiniGame(MiniGameName, MiniGameId)
  local FunName = "StartRouge" .. MiniGameName .. "MiniGame"
  if self[FunName] then
    DebugPrint("RougeLikeComponent:StartRougeMiniGame MiniGameName", MiniGameName, "MiniGameId", MiniGameId)
    self.EMGameState.RougeMiniGameProgressing = true
    self.RougeMiniGameName = MiniGameName
    self[FunName](self, MiniGameId)
  else
    self.EMGameState:ShowDungeonError("RougeLikeComponent:StartRougeMiniGame FunName", FunName, "\230\156\170\229\174\158\231\142\176 \230\136\150 \228\184\141\229\173\152\229\156\168\232\175\165\231\142\169\230\179\149")
  end
end

function RougeLikeComponent:EndRougeMiniGame(IsWin)
  if self.RougeMiniGameName then
    local FunName = "EndRouge" .. self.RougeMiniGameName .. "MiniGame"
    if self[FunName] then
      DebugPrint("RougeLikeComponent:EndRougeMiniGame MiniGameName", self.RougeMiniGameName)
      self[FunName](self, IsWin)
      self.EMGameState.RougeMiniGameProgressing = false
      self.RougeMiniGameName = nil
    else
      self.EMGameState:ShowDungeonError("RougeLikeComponent:StartRougeMiniGame FunName", FunName, "\230\156\170\229\174\158\231\142\176 \230\136\150 \228\184\141\229\173\152\229\156\168\232\175\165\231\142\169\230\179\149")
    end
  end
end

function RougeLikeComponent:RougeShowUITip(TextTip, IsWarning)
  if IsWarning then
    local LastTime = 2
    UIManager(self):ShowUITip(UIConst.Tip_CommonWarning, TextTip, LastTime)
  else
    UIManager(self):LoadUINew("ExploreToastSuccess", TextTip)
  end
end

function RougeLikeComponent:OnCanonMonsterDead(Monster)
  if not IsValid(Monster) then
    self.EMGameState:ShowDungeonError("RougeLikeComponent:OnCanonMonsterDead Monster is nil")
    return
  end
  local DeathReason = Monster.MonsterDeathReason
  DebugPrint("RougeLikeComponent:OnCanonMonsterDead UnitId", Monster.UnitId, "DeathReason", EDeathReason:GetNameByValue(DeathReason))
  local AddScore = 0
  local CononInfo = DataMgr.CanonMiniGame[Monster.UnitId]
  if CononInfo then
    if DeathReason == EDeathReason.KillSelf then
      AddScore = CononInfo.SelfKillScore or 0
    else
      AddScore = CononInfo.KillScore or 0
    end
  end
  self:AddCanonScore(AddScore)
end

function RougeLikeComponent:AddCanonScore(Score)
  self.CanonScore = (self.CanonScore or 0) + Score
  EventManager:FireEvent(EventID.OnRougeLikeCanonScoreAdd, self.CanonScore, Score)
  DebugPrint("RougeLikeComponent:AddCanonScore Score", Score, "CurrentScore:", self.CanonScore)
end

function RougeLikeComponent:GetCanonScore()
  return self.CanonScore or 0
end

function RougeLikeComponent:StartRougeCanonMiniGame(MiniGameId)
  self:OnWaveStart()
  EventManager:FireEvent(EventID.StartRougeCanonMiniGame)
end

function RougeLikeComponent:EndRougeCanonMiniGame(IsWin)
  self:EndInteractive()
  self:RemoveTimer("RougeCanonStartCountDown")
  self:RemoveTimer("RougeCanonShowToast")
  self:RemoveTimer("RougeCanonTimer")
  local GuideCountDownFloat = UIManager(self):GetUIObj("GuideCountDown")
  if GuideCountDownFloat then
    GuideCountDownFloat:OnCountDownEnd()
    GuideCountDownFloat:Close()
  end
  local WaveStartBP = self:GetWaveStartBP()
  if WaveStartBP then
    WaveStartBP:Close()
  end
  EventManager:FireEvent(EventID.EndRougeCanonMiniGame)
  local FinialScore = self:GetCanonScore()
  self:TriggerRougeLikePassEvent("Canon", FinialScore, IsWin)
  self:PostCustomEvent("CanonGameEnd")
end

function RougeLikeComponent:RealStartRougeCanon()
  self:PostCustomEvent("CanonGameMonsterStart")
  self:StartRougeCanonTimer()
end

function RougeLikeComponent:StartRougeCanonTimer()
  local BattleMain = UIManager(self):GetUIObj("BattleMain")
  if IsValid(BattleMain) then
    BattleMain:StartRougeCanonCountDown()
  end
  self.RougeCanonTime = self.TotalTime
  
  local function RougeCanonTimer()
    self.RougeCanonTime = self.RougeCanonTime - 0.1
    if self.RougeCanonTime < 0 then
      self.RougeCanonTime = 0
    end
    if IsValid(BattleMain) then
      BattleMain:RefreshRougeGameCountDown(self.RougeCanonTime)
    end
    if 0 == self.RougeCanonTime then
      self:EndRougeCanonMiniGame(true)
      self:RemoveTimer("RougeCanonTimer")
    end
  end
  
  self:AddTimer(0.1, RougeCanonTimer, true, 0, "RougeCanonTimer")
end

function RougeLikeComponent:EndInteractive()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if Player then
    local Eid = Player.MechanismEid
    if 0 ~= Eid then
      local Mechanism = Battle(GWorld.GameInstance):GetEntity(Eid)
      if Mechanism and Mechanism.ChestInteractiveComponent then
        Mechanism.ChestInteractiveComponent:ForceEndInteractive(Player, false, Const.ForceEndInteractive)
      end
    end
  end
end

function RougeLikeComponent:GetWaveStartBP()
  local WaveStartBP = UIManager(self):GetUIObj("WaveStartBP")
  WaveStartBP = WaveStartBP or UIManager(self):LoadUINew("WaveStartBP")
  WaveStartBP:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  return WaveStartBP
end

function RougeLikeComponent:OnWaveStart()
  local ToastShowTime = 1
  local WaveStartBP = self:GetWaveStartBP()
  if WaveStartBP then
    WaveStartBP:SetVisibility(ESlateVisibility.Collapsed)
    WaveStartBP.Text_WaveStart:SetText(GText("RougePaotaiMiniGameStart"))
    WaveStartBP:UnbindAllFromAnimationFinished(WaveStartBP.Out)
    WaveStartBP:BindToAnimationFinished(WaveStartBP.Out, {
      WaveStartBP,
      WaveStartBP.Close
    })
    self:AddTimer(self.Countdown, function()
      WaveStartBP:SetVisibility(ESlateVisibility.HitTestInvisible)
      WaveStartBP:PlayInAnimation()
      self:RealStartRougeCanon()
    end, false, 0, "RougeCanonStartCountDown")
    self:AddTimer(self.Countdown + ToastShowTime, function()
      WaveStartBP:PlayOutAnimation()
    end, false, 0, "RougeCanonShowToast")
  end
  self:ShowCountDown()
end

function RougeLikeComponent:ShowCountDown()
  local GuideCountDownFloat = UIManager(self):GetUIObj("GuideCountDown")
  GuideCountDownFloat = GuideCountDownFloat or UIManager(self):LoadUINew("GuideCountDown")
  GuideCountDownFloat:InitializeData(self.Countdown)
end

function RougeLikeComponent:StartRougeMorseMiniGame(MiniGameId)
  local MorseMiniGameInfo = DataMgr.MorseMiniGame[MiniGameId]
  assert(MorseMiniGameInfo, "MorseMiniGame\232\175\187\232\161\168\228\184\141\229\173\152\229\156\168\239\188\140MiniGameId:" .. MiniGameId)
  self.CurMorseMiniGameId = MiniGameId
  UIManager(self):LoadUINew("Morse", MorseMiniGameInfo.Difficulty, MorseMiniGameInfo.TotalTime, self, self.EndRougeMiniGame)
end

function RougeLikeComponent:EndRougeMorseMiniGame(IsWin)
  assert(self.CurMorseMiniGameId, "CurMorseMiniGameId\228\184\141\229\173\152\229\156\168\239\188\129")
  local MorseMiniGameInfo = DataMgr.MorseMiniGame[self.CurMorseMiniGameId]
  local FinialScore = 0
  if IsWin then
    FinialScore = MorseMiniGameInfo.SuccScore
  else
    FinialScore = MorseMiniGameInfo.FailScore
  end
  self:TriggerRougeLikePassEvent("Morse", FinialScore, IsWin)
end

function RougeLikeComponent:FillRougeLikeErrorLog(MsgTable)
  table.insert(MsgTable, "\229\137\175\230\156\172\231\138\182\230\128\129GameModeState: " .. EGameModeState:GetNameByValue(self.GameState.GameModeState) .. "\n")
  table.insert(MsgTable, "\229\189\147\229\137\141\229\137\175\230\156\172\230\152\175\229\144\166\231\187\147\231\174\151: " .. tostring(self:IsDungeonInSettlement()) .. "\n")
  table.insert(MsgTable, "\230\136\152\230\150\151\229\133\179\232\191\155\229\186\166\239\188\154" .. tostring(self.EMGameState.RougeBattleCount) .. "/" .. tostring(self.EMGameState.RougeBattleMaxNum) .. "\n")
  table.insert(MsgTable, "\231\155\151\229\174\157\230\128\170\229\136\183\230\150\176\230\149\176: " .. tostring(self.TreasureMonsterCreatedNum) .. "\n")
  table.insert(MsgTable, "\231\155\151\229\174\157\230\128\170\229\136\183\230\150\176\230\166\130\231\142\135: " .. tostring(self.TreasureMonsterSpawnProbability) .. "\n")
  local PlayerController = UE.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  if PlayerController then
    local PlayerState = PlayerController.PlayerState
    if PlayerState then
      table.insert(MsgTable, "\231\142\169\229\174\182\230\173\187\228\186\161(\229\164\141\230\180\187)\230\172\161\230\149\176 / \230\156\128\229\164\167\230\173\187\228\186\161(\229\164\141\230\180\187)\230\172\161\230\149\176\239\188\154" .. tostring(PlayerState.RecoveryCount) .. "/" .. tostring(PlayerState.RecoveryMaxCount) .. "\n")
    end
  end
  local MiniGameName = ""
  for LevelName, SubGameMode in pairs(self.SubGameModeInfo) do
    MiniGameName = SubGameMode.RougeMiniGameName
  end
  table.insert(MsgTable, "\229\189\147\229\137\141MiniGame\229\144\141\231\167\176: " .. tostring(MiniGameName) .. "\n")
end

return RougeLikeComponent
