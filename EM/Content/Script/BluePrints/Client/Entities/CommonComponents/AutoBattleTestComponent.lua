local Component = {}

function Component:StartAutoBattleTest(DungeonId, AvatarBattleInfo)
  print(_G.LogTag, "StartAutoBattleTest")
  self.IsAutoBattle = true
  self.AvatarBattleInfo = AvatarBattleInfo
  if AvatarBattleInfo then
    WorldTravelSubsystem():ChangeDungeonByDungeonId(DungeonId, CommonConst.DungeonNetMode.Standalone)
  else
    local GameMode = GWorld.GameInstance:GetCurrentGameMode()
    if not GameMode then
      return
    end
    GameMode:StartAutoBattleTest()
  end
end

function Component:OnStartAutoBattleTest(bClientMode)
  print(_G.LogTag, "OnStartAutoBattleTest")
  self:CallServerMethod("GMOnStartAutoBattleTest", bClientMode)
end

function Component:RealStartAutoBattleTest(AutoBattleId)
  print(_G.LogTag, "RealStartAutoBattleTest", AutoBattleId)
  self.AutoBattleId = AutoBattleId
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  GameMode.IsAutoBattle = true
  if not GameMode then
    return
  end
  GameMode:RealStartAutoBattleTest()
end

function Component:RealOnStartAutoBattleTest(bClientMode)
  print(_G.LogTag, "RealOnStartAutoBattleTest")
  self:CallServerMethod("GMRealOnStartAutoBattleTest", bClientMode)
end

function Component:TestAutoBattleEnd(Callback, bClientMode)
  print(_G.LogTag, "TestAutoBattleEnd", self.AutoBattleId)
  if self.AutoBattleId == nil then
    return
  end
  local Id = self.AutoBattleId
  local TempData = {}
  local Data = ""
  local TaskInfo = DataMgr.AutoTestTask[Id]
  if TaskInfo then
    Data = GText("TaskId,DungeonId,")
  end
  local Index = 1
  local playerKey, AvatarBattleInfo
  local GameMode = GWorld.GameInstance:GetCurrentGameMode()
  if GameMode then
    local Avatars = GameMode.AvatarInfos or {}
    if Avatars then
      for _, value in pairs(Avatars) do
        AvatarBattleInfo = value.BattleInfo
      end
    end
    local CharId = AvatarBattleInfo.RoleInfo.RoleId
    if CharId then
      playerKey = "Player" .. tostring(CharId)
      TempData[playerKey] = TempData[playerKey] or {}
      TempData[playerKey].CharId = CharId
      TempData[playerKey].AddEnergyShield = 0
      TempData[playerKey].Damage = 0
      TempData[playerKey].Heal = 0
      Data = Data .. GText("Player" .. tostring(Index) .. "ID,AddEnergyShield,Damage,Heal,")
      Index = Index + 1
    end
    if self.AutoTestRobotInfo then
      for _, value in pairs(self.AutoTestRobotInfo) do
        CharId = value
        local key = "Robot" .. tostring(CharId)
        TempData[key] = TempData[key] or {}
        TempData[key].CharId = CharId
        TempData[key].AddEnergyShield = 0
        TempData[key].Damage = 0
        TempData[key].Heal = 0
        Data = Data .. GText("Robot" .. tostring(Index) .. "ID,AddEnergyShield,Damage,Heal,")
        Index = Index + 1
      end
    end
  end
  Data = Data .. GText("\n")
  Data = Data .. tostring(TaskInfo.TaskId) .. "," .. tostring(TaskInfo.DungeonId)
  if GameMode then
    local TestTime = 1
    if GameMode.AutoTestStartTime then
      TestTime = GWorld:GetCurrentTime() - GameMode.AutoTestStartTime
    end
    print(_G.LogTag, "Auto Test Time" .. tostring(GameMode.AutoTestStartTime))
    if GameMode.AutoTestData then
      for key, value in pairs(GameMode.AutoTestData) do
        for key1, value1 in pairs(value) do
          print(_G.LogTag, "Write AutoTestData" .. tostring(key1))
          for DataType, DetailValue in pairs(value1) do
            print(_G.LogTag, "Write AutoTestData" .. tostring(key1) .. tostring(DataType) .. tostring(DetailValue))
            TempData[key1][DataType] = DetailValue / TestTime
            print(_G.LogTag, "Write Averge AutoTestData" .. tostring(key1) .. tostring(DataType) .. tostring(DetailValue / TestTime))
          end
        end
      end
    else
      print(_G.LogTag, "EmptyAutoTestData")
    end
    Data = Data .. "," .. tostring(TempData[playerKey].CharId) .. "," .. tostring(TempData[playerKey].AddEnergyShield) .. "," .. tostring(TempData[playerKey].Damage) .. "," .. tostring(TempData[playerKey].Heal)
    for key, value in pairs(TempData) do
      if key ~= playerKey then
        Data = Data .. "," .. tostring(value.CharId) .. "," .. tostring(value.AddEnergyShield) .. "," .. tostring(value.Damage) .. "," .. tostring(value.Heal)
      end
    end
    GameMode.IsInAutoTestCombat = false
  end
  self.AutoTestRobotInfo = nil
  local time = os.time()
  local GameInstance = GWorld.GameInstance
  local Pid = GameInstance:GetPID()
  local FileName = "AutoBattleTest" .. "/" .. "ABT_" .. tostring(Id) .. "_" .. time .. "_" .. tostring(Pid) .. ".csv"
  local FileDir = UEMPathFunctionLibrary.GetProjectSavedDirectory() .. FileName
  UE4.URuntimeCommonFunctionLibrary.SaveFile(FileDir, Data)
  local t = CommonUtils.Split(GWorld.GameInstance:LogPath(), "/")
  local AbsoluteDir = ""
  for i = 1, #t - 2 do
    AbsoluteDir = AbsoluteDir .. t[i] .. "/"
  end
  AbsoluteDir = AbsoluteDir .. FileName
  if not bClientMode then
    self:CallSkynetServerCallback(Callback, AbsoluteDir)
  end
  GameMode.IsAutoBattle = false
end

return Component
