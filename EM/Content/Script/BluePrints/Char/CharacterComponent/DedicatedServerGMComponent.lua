local Component = {}

function Component:GMDedicatedServerCommand_Lua(Func, ArgsMessage)
  print(_G.LogTag, "GMDedicatedServerCommand", Func)
  local func = "GM_" .. Func
  local msgpack = require("msgpack_core")
  local MessageStr = ArgsMessage:GetBytes()
  local Args = msgpack.unpack(MessageStr)
  if self[func] then
    self[func](self, Args)
  end
end

function Component:GM_DungeonWin(Args)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  GameMode:TriggerDungeonWin()
end

function Component:GM_DungeonFailed(Args)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  GameMode:TriggerDungeonFailed()
end

function Component:GM_PlayerWin(Args)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  local PlayerController = UE4.URuntimeCommonFunctionLibrary.GetPlayerControllerByAvatarEid(GWorld.GameInstance, self.AvatarEidStr)
  local Eid = PlayerController:GetMyPawn().Eid
  GameMode:TriggerPlayerWin({
    self.AvatarEidStr
  }, {Eid})
end

function Component:GM_PlayerFailed(Args)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  GameMode:TriggerPlayerFailed({
    self.AvatarEidStr
  })
end

function Component:GM_TriggerMechanism(Args)
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  GameMode:TriggerMechanism(Args[1], Args[3])
  local Arr = TArray(0)
  Arr:Add(Args[2])
  GameMode:TriggerMechanismManualItem(Arr, Args[3], 0)
end

function Component:GM_KickSelf(Args)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  GameMode:KickAllPlayers(Args[1])
end

function Component:GM_StartVote(Args)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  GameMode:TriggerActiveGameModeState(5)
end

function Component:GM_SpawnPet(Args)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  GameMode:TriggerSpawnPet()
end

function Component:GM_PostCustomEvent(Args)
  local EventName = table.unpack(Args)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not GameMode then
    return
  end
  DebugPrint("GM PostCustomEvent", EventName)
  GameMode:PostCustomEvent(EventName)
end

function Component:GM_SwitchSurvivalValueChange()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local GameState = UE4.UGameplayStatics.GetGameState(Player)
  if not Player then
    return
  end
  if Player.AddSurvivalValueTimer then
    Player:RemoveTimer(Player.AddSurvivalValueTimer)
    Player.AddSurvivalValueTimer = nil
  end
  Player.AddSurvivalValueTimer = Player:AddTimer(1, function()
    GameState:SetSurvivalValue(GameState.SurvivalValue + 100)
  end, true)
end

function Component:GM_t1(Args)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.VoteValues:Add(1, true)
  GameState.VoteValues:Add(2, false)
  UE.UMapSyncHelper.SyncMap(GameState, "VoteValues")
end

function Component:GM_t2(Args)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.VoteValues:Add(1, false)
  UE.UMapSyncHelper.SyncMap(GameState, "VoteValues")
end

function Component:GM_t3(Args)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.VoteValues:Remove(1)
  UE.UMapSyncHelper.SyncMap(GameState, "VoteValues")
end

function Component:GM_t4(Args)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.VoteValues:Add(1, true)
  GameState.VoteValues:Add(2, true)
  GameState.VoteValues:Remove(2)
  GameState.VoteValues:Add(3, false)
  GameState.VoteValues:Add(3, true)
  UE.UMapSyncHelper.SyncMap(GameState, "VoteValues")
end

function Component:GM_t5(Args)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:KickNotEnteredPlayers("VoteStart")
end

function Component:GM_t6(Args)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState:TestSyncMap()
end

function Component:GM_t7(Args)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState.VoteValues:Clear()
  UE.UMapSyncHelper.SyncMap(GameState, "VoteValues")
end

function Component:GM_CMD(Args)
  local ArgStr = ""
  for i = 1, #Args - 1 do
    ArgStr = ArgStr .. tostring(Args[i]) .. " "
  end
  ArgStr = ArgStr .. tostring(Args[#Args])
  print(_G.LogTag, ArgStr)
  GWorld.GameInstance:ExecuteCmd(ArgStr)
end

function Component:GM_RPC()
  local a = 1
  self:GetMyPawn():AddTimer(1, function()
    self:TestRPC(a)
    a = a + 1
  end, true)
end

function Component:GM_TestCrash()
  self:TestCrash()
end

function Component:GM_TestTrace()
  error("GM_TestTrace")
end

function Component:GM_BlockEntrance()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  GameMode:BlockEntrance()
end

function Component:GM_Stat(Args)
  local ArgStr = ""
  for i = 1, #Args - 1 do
    ArgStr = ArgStr .. tostring(Args[i]) .. " "
  end
  ArgStr = ArgStr .. tostring(Args[#Args])
  print(_G.LogTag, "GM Stat", ArgStr)
  GWorld.GameInstance:ExecuteCmd(ArgStr)
end

function Component:GM_PrintLevelDebugInfo()
  DebugPrint("================= PrintLevelDebugInfo Server ==================")
  DebugPrint("")
  DebugPrint("===== PrintGameStateInfo Server =====")
  self:PrintGameStateInfo()
  DebugPrint("")
  DebugPrint("===== PrintGameModeInfo Server ======")
  self:PrintGameModeInfo()
  DebugPrint("")
  DebugPrint("")
  DebugPrint("==============================================================")
end

function Component:PrintGameStateInfo()
  local GameState = UE.UGameplayStatics.GetGameState(self)
  DebugPrint("DungeonId", GameState.DungeonId)
  DebugPrint("GameModeType", GameState.GameModeType)
  DebugPrint("GameModeState", EGameModeState:GetNameByValue(GameState.GameModeState))
  DebugPrint("DungeonUIState", EDungeonUIState:GetNameByValue(GameState.DungeonUIState))
  DebugPrint("GameModeLevel", GameState.GameModeLevel)
  DebugPrint("DungeonProgress", GameState.DungeonProgress)
  DebugPrint("InDungeon", GameState:IsInDungeon())
  DebugPrint("InCommonAlert", GameState.InCommonAlert)
  local EventString = ""
  for i = 1, GameState.DungeonEvent:Num() do
    local Event = GameState.DungeonEvent:GetValueByIdx(i - 1)
    EventString = EventString .. Event .. ", "
  end
  DebugPrint("DungeonEvent", EventString)
  local GuideEidString = ""
  for i = 1, GameState.GuideEids.Items:Num() do
    local Eid = GameState.GuideEids.Items:GetRef(i).IntProperty
    GuideEidString = GuideEidString .. Eid .. ", "
  end
  DebugPrint("GuideEids", GuideEidString)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local PlayerState = Player.PlayerState
  local PlayerEidString = ""
  for Index = 1, PlayerState.PlayerGuideEids.Items:Num() do
    local Eid = PlayerState.PlayerGuideEids.Items:GetRef(Index).IntProperty
    PlayerEidString = PlayerEidString .. Eid .. ", "
  end
  DebugPrint("PlayerGuideEids", PlayerEidString)
end

function Component:PrintGameModeInfo()
  local GameMode = UE.UGameplayStatics.GetGameMode(self)
  local MonsterSpawnString = ""
  for Id, _ in pairs(GameMode.MonsterSpawnMap) do
    MonsterSpawnString = MonsterSpawnString .. Id .. ", "
  end
  DebugPrint("MonsterSpawnMap", MonsterSpawnString)
  DebugPrint("SubGameModeInfo LevelName   IsActive")
  for LevelName, SubGameMode in pairs(GameMode.SubGameModeInfo) do
    DebugPrint("            ", LevelName, SubGameMode.IsActive)
  end
  GameMode:TriggerDungeonComponentFun("Print" .. GameMode.EMGameState.GameModeType .. "DebugInfo")
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  local LevelName = GameMode:GetActorLevelName(Player)
  DebugPrint("Player_LevelName", LevelName)
end

function Component:GM_RanPlayerEndDungeon(Args)
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local Num = Args[1]
  local AvatarEids = {}
  local Eids = {}
  for i = 1, tonumber(Num) do
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, i - 1)
    if PlayerController then
      table.insert(AvatarEids, PlayerController.AvatarEidStr)
      local Eid = PlayerController:GetMyPawn().Eid
      table.insert(Eids, Eid)
    end
  end
  GameMode:TriggerPlayerWin(AvatarEids, Eids)
end

function Component:GM_DungeonEventTest(info)
  local oper, str = table.unpack(info)
  DebugPrint("DS DungeonEventTest", oper, str)
  local GameMode = UE.UGameplayStatics.GetGameMode(self)
  if "add" == oper or "Add" == oper then
    GameMode:AddDungeonEvent(str)
    return
  end
  if "remove" == oper or "Remove" == oper then
    GameMode:RemoveDungeonEvent(str)
    return
  end
end

function Component:GM_ljltest()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.Player)
  GameMode:OnPlayerSelectWalnutReward()
end

function Component:GM_SwitchLogDevice()
  local DedicatedServerErrorHandleSubsystem = USubsystemBlueprintLibrary.GetGameInstanceSubsystem(self, UDedicatedServerErrorHandleSubsystem)
  assert(DedicatedServerErrorHandleSubsystem)
  DedicatedServerErrorHandleSubsystem:TestSwitchLogDevice()
end

function Component:GM_AddWhiteCategoryLog(Args)
  if not Args or #Args < 1 then
    return
  end
  local Category = Args[1]
  UE.UDedicatedServerOutputDeviceHelper.AddWhiteCategory(Category)
end

function Component:GM_RemoveWhiteCategoryLog(Args)
  if not Args or #Args < 1 then
    return
  end
  local Category = Args[1]
  UE.UDedicatedServerOutputDeviceHelper.RemoveWhiteCategory(Category)
end

function Component:GM_AddBlackCategoryLog(Args)
  if not Args or #Args < 1 then
    return
  end
  local Category = Args[1]
  UE.UDedicatedServerOutputDeviceHelper.AddBlackCategory(Category)
end

function Component:GM_RemoveBlackCategoryLog(Args)
  if not Args or #Args < 1 then
    return
  end
  local Category = Args[1]
  UE.UDedicatedServerOutputDeviceHelper.RemoveBlackCategory(Category)
end

function Component:GM_AddWhiteLogContent(Args)
  if not Args or #Args < 1 then
    return
  end
  local Content = Args[1]
  UE.UDedicatedServerOutputDeviceHelper.AddWhiteLogContent(Content)
end

function Component:GM_RemoveWhiteLogContent(Args)
  if not Args or #Args < 1 then
    return
  end
  local Content = Args[1]
  UE.UDedicatedServerOutputDeviceHelper.RemoveWhiteLogContent(Content)
end

function Component:GM_AddBlackLogContent(Args)
  if not Args or #Args < 1 then
    return
  end
  local Content = Args[1]
  UE.UDedicatedServerOutputDeviceHelper.AddBlackLogContent(Content)
end

function Component:GM_RemoveBlackLogContent(Args)
  if not Args or #Args < 1 then
    return
  end
  local Content = Args[1]
  UE.UDedicatedServerOutputDeviceHelper.RemoveBlackLogContent(Content)
end

function Component:GM_ResetLogFilters()
  UE.UDedicatedServerOutputDeviceHelper.ResetLogFilters()
end

function Component:GM_SetOpenAllLog(Args)
  local bOpen = Args and #Args >= 1
  UE.UDedicatedServerOutputDeviceHelper.SetOpenAllLog(bOpen)
end

function Component:GM_NetworkError()
  self:TestNetworkError()
end

return Component
