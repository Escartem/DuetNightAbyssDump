local StatMonster = {}
local TestIds = {
  6001011,
  6002011,
  6003001,
  6004013,
  7001012,
  7001013,
  7001017,
  7002011,
  7003011,
  8500001
}
local TestMonsters = {}
local TestSkillIndex = {}
local TmpPlayer
local AllStat = {}
local StatNum = 4
local StrOutput = ""
local StrLine = "\n"
local StrSpace = "        "
StatMonster.BeginStat = false

function StatMonster:Stat(GM)
  self.BeginStat = not self.BeginStat
  if self.BeginStat then
    self:StatStart(GM)
  else
    self:StatEnd(GM)
  end
end

function StatMonster:StatStart(GM)
  assert(GM.Player, "\231\188\186\229\176\145Player")
  TmpPlayer = GM.Player
  local SkillInterval = 5
  local RecordInterval = 0.5
  
  local function StatLoadCb(Mon)
    self:AddMon(Mon)
    if #TestMonsters == #TestIds then
      GM.Player:AddTimer(SkillInterval, self.RepeatSkillTimer, true, 0, "Test_RepeatSkillTimer")
      GM.Player:AddTimer(RecordInterval, self.StatRecordTimer, true, 0, "Test_StatRecordTimer")
    end
  end
  
  self:CreateMonster(StatLoadCb)
end

function StatMonster:CreateMonster(Callback)
  local Row = 0
  local Col = 0
  local MaxRow = 5
  local TmpLength = 300
  local GameMode = UE4.UGameplayStatics.GetGameMode(TmpPlayer)
  local FirstLoc = TmpPlayer:K2_GetActorLocation() + TmpPlayer:GetActorForwardVector() * 100
  for i = 1, #TestIds do
    local Loc = FirstLoc + FVector(Row * TmpLength, Col * TmpLength, 0)
    local InitArgs = {CachePreloadInfo = 1}
    GameMode.EMGameState.EventMgr:GMCreateTestMonster(nil, TestIds[i], 1, Loc, Callback, InitArgs)
    Row = Row + 1
    if MaxRow <= Row then
      Row = 0
      Col = Col + 1
    end
  end
end

function StatMonster:AddMon(Mon)
  table.insert(TestMonsters, Mon)
  table.insert(TestSkillIndex, 1)
  Mon.EMAnimInstance:SetRootMotionMode(ERootMotionMode.NoRootMotionExtraction)
end

function StatMonster:RepeatSkillTimer()
  for Key, Mon in pairs(TestMonsters) do
    local Idx = TestSkillIndex[Key]
    local Res = Mon:TestUseSkill(Idx)
    if Res then
      TestSkillIndex[Key] = Idx + 1
    else
      TestSkillIndex[Key] = 1
    end
  end
end

function StatMonster:StatRecordTimer()
  if "" == StrOutput then
    StrOutput = "Frame" .. StrSpace .. "CPU" .. StrSpace .. "Draw" .. StrSpace .. "GPU" .. StrLine
  end
  local EMData = UE4.URuntimeCommonFunctionLibrary.GetStatUnitData(TmpPlayer)
  StrOutput = StrOutput .. EMData.FrameTime .. StrSpace .. EMData.GameThreadTime .. StrSpace .. EMData.RenderThreadTime .. StrSpace .. EMData.GPUFrameTime .. StrLine
  if 0 == #AllStat then
    for i = 1, StatNum do
      AllStat[i] = {}
    end
  end
  table.insert(AllStat[1], EMData.FrameTime)
  table.insert(AllStat[2], EMData.GameThreadTime)
  table.insert(AllStat[3], EMData.RenderThreadTime)
  table.insert(AllStat[4], EMData.GPUFrameTime)
end

function StatMonster:StatEnd(GM)
  assert(GM.Player, "\231\188\186\229\176\145Player")
  GM.Player:RemoveTimer("Test_RepeatSkillTimer")
  GM.Player:RemoveTimer("Test_StatRecordTimer")
  StrOutput = StrOutput .. "Average" .. StrLine
  local StrTmpMax = ""
  for i = 1, #AllStat do
    local TotalStat = 0
    local MaxStat = 0
    for j = 1, #AllStat[i] do
      TotalStat = TotalStat + AllStat[i][j]
      if MaxStat < AllStat[i][j] then
        MaxStat = AllStat[i][j]
      end
    end
    StrTmpMax = StrTmpMax .. MaxStat .. StrSpace
    StrOutput = StrOutput .. TotalStat / #AllStat[i] .. StrSpace
  end
  StrOutput = StrOutput .. StrLine .. "Max" .. StrLine .. StrTmpMax
  local Path = UE4.UBlueprintPathsLibrary.ProjectLogDir() .. "/StatMonster" .. os.date("%Y.%m.%d-%H.%M.%S") .. ".txt"
  local File = io.open(Path, "w+")
  io.output(File)
  io.write(StrOutput)
  io.close(File)
  TmpPlayer = nil
end

function StatMonster:StatMem(GM)
  assert(GM.Player, "\231\188\186\229\176\145Player")
  TmpPlayer = GM.Player
  local AllNum = 0
  
  local function StatMemLoadCb(Mon)
    self:AddMon(Mon)
    AllNum = AllNum + 1
    if AllNum == #TestIds then
      self:StatMemRecord()
    end
  end
  
  self:CreateMonster(StatMemLoadCb)
end

function StatMonster:StatMemRecord()
  StrOutput = ""
  for i = 1, #TestMonsters do
    StrOutput = StrOutput .. TestMonsters[i].UnitId .. StrLine
    local Data = TestMonsters[i].CachePreloadData
    if Data and not IsEmptyTable(Data) then
      for i = 1, #Data do
        StrOutput = StrOutput .. Data[i] .. StrLine
      end
    else
      StrOutput = StrOutput .. "NULL" .. StrLine
    end
  end
  local Path = UE4.UBlueprintPathsLibrary.ProjectLogDir() .. "/StatMonsterMem" .. os.date("%Y.%m.%d-%H.%M.%S") .. ".txt"
  local File = io.open(Path, "w+")
  io.output(File)
  io.write(StrOutput)
  io.close(File)
  TmpPlayer = nil
end

return StatMonster
