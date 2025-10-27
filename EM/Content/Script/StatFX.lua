local M = {}
local TmpPlayer
local AllStat = {}
local StatNum = 5
local StrOutput = ""
local StrLine = "\n"
local StrSpace = ","
local CurrentIndex = 0
local NiagaraPaths
local NiagaraCount = 10
local CurrentNiagaraPath
M.BeginStat = false

function M:Stat(GM, InNiagaraCount)
  NiagaraCount = InNiagaraCount or 10
  self.BeginStat = not self.BeginStat
  if self.BeginStat then
    self:StatStart(GM)
  else
    self:StatEnd(GM)
  end
end

function M:StatStart(GM)
  assert(GM.Player, "\231\188\186\229\176\145Player")
  local RecordInterval = 0.5
  local PlayFXInterval = 5
  CurrentIndex = 0
  NiagaraPaths = URuntimeCommonFunctionLibrary.GetAllNiagaraPath()
  GM.Player:AddTimer(RecordInterval, self.StatRecordTimer, true, 0, "Test_StatRecordTimer")
  GM.Player:AddTimer(PlayFXInterval, self.RepeatFXTimer, true, 0, "Test_RepeatFXTimer")
  TmpPlayer = GM.Player
end

function M:StatRecordTimer()
  if not CurrentNiagaraPath then
    return
  end
  if "" == StrOutput then
    StrOutput = "NiagaraPath" .. StrSpace .. "Frame" .. StrSpace .. "CPU" .. StrSpace .. "Draw" .. StrSpace .. "GPU" .. StrLine
  end
  local EMData = UE4.URuntimeCommonFunctionLibrary.GetStatUnitData(TmpPlayer)
  StrOutput = StrOutput .. CurrentNiagaraPath .. StrSpace .. EMData.FrameTime .. StrSpace .. EMData.GameThreadTime .. StrSpace .. EMData.RenderThreadTime .. StrSpace .. EMData.GPUFrameTime .. StrLine
  if 0 == #AllStat then
    for i = 1, StatNum do
      AllStat[i] = {}
    end
  end
  table.insert(AllStat[1], CurrentNiagaraPath)
  table.insert(AllStat[2], EMData.FrameTime)
  table.insert(AllStat[3], EMData.GameThreadTime)
  table.insert(AllStat[4], EMData.RenderThreadTime)
  table.insert(AllStat[5], EMData.GPUFrameTime)
end

function M:RepeatFXTimer()
  CurrentIndex = CurrentIndex + 1 > NiagaraPaths:Num() and 1 or CurrentIndex + 1
  CurrentNiagaraPath = NiagaraPaths:GetRef(CurrentIndex)
  local SideCount = math.floor(math.sqrt(NiagaraCount))
  local HalfSideCount = math.floor(SideCount / 2)
  local OriLocation = TmpPlayer:K2_GetActorLocation()
  for i = 0, NiagaraCount - 1 do
    local XCount = math.floor(i / SideCount)
    local X = XCount * 100 + OriLocation.X
    local YCount = i % SideCount
    local Y = (YCount - HalfSideCount) * 100 + OriLocation.Y
    UNiagaraFunctionLibrary.SpawnSystemAtLocation(TmpPlayer, LoadObject(CurrentNiagaraPath), FVector(X, Y, OriLocation.Z))
  end
  UKismetSystemLibrary.ExecuteConsoleCommand(TmpPlayer, "fx.ParticlePerfStats.RunTest 60", nil)
end

function M:StatEnd(GM)
  assert(GM.Player, "\231\188\186\229\176\145Player")
  GM.Player:RemoveTimer("Test_RepeatSkillTimer")
  GM.Player:RemoveTimer("Test_RepeatFXTimer")
  StrOutput = StrOutput .. "Average" .. StrLine .. ","
  local StrTmpMax = ","
  for i = 2, #AllStat do
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
  local Path = UE4.UBlueprintPathsLibrary.ProfilingDir() .. "/ParticlePerf/StatFX_" .. os.date("%Y.%m.%d-%H.%M.%S") .. ".csv"
  local File = io.open(Path, "w+")
  io.output(File)
  io.write(StrOutput)
  io.close(File)
end

return M
