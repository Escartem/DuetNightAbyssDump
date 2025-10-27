require("UnLua")
local GamePauseChecker_C = Class("BluePrints.Story.Talk.Base.TalkDependCheckers.TalkDependCheckerBase")

function GamePauseChecker_C:Init()
  self.Super.Init(GamePauseChecker_C)
end

function GamePauseChecker_C:OnEnabled()
  DebugPrint("@@@ \229\144\175\231\148\168\229\175\185\232\175\157\230\184\184\230\136\143\230\154\130\229\129\156Checker")
  self:ListeningGamePauseChanged()
end

function GamePauseChecker_C:OnDisabled()
  DebugPrint("@@@ \229\133\179\233\151\173\229\175\185\232\175\157\230\184\184\230\136\143\230\154\130\229\129\156Checker")
end

function GamePauseChecker_C:Clear()
  if not self:IsSelfValid() then
    return
  end
  self:UnlisteningGamePauseChanged()
end

function GamePauseChecker_C.ListeningDelegate()
  GamePauseChecker_C:OnGamePauseChanged()
end

function GamePauseChecker_C:OnGamePauseChanged()
  DebugPrint("@@@ GamePauseChecker_C:OnGamePauseChanged")
  if self:IsCheckerCompleted() then
    self:OnCompletedDelegate()
  end
end

function GamePauseChecker_C:ListeningGamePauseChanged()
  DebugPrint("@@@ ListeningGamePauseChanged \231\155\145\229\144\172\230\184\184\230\136\143\230\154\130\229\129\156\231\138\182\230\128\129\230\155\180\230\148\185", self.bHasListen)
  if self.bHasListen then
    return
  end
  self.bHasListen = true
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode and GameMode.OnGamePauseChanged then
    GameMode.OnGamePauseChanged:Add(GWorld.GameInstance, self.ListeningDelegate)
  end
end

function GamePauseChecker_C:UnlisteningGamePauseChanged()
  DebugPrint("@@@ UnlisteningGamePauseChanged \229\143\150\230\182\136\231\155\145\229\144\172\230\184\184\230\136\143\230\154\130\229\129\156\231\138\182\230\128\129\230\155\180\230\148\185")
  self.bHasListen = false
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode and GameMode.OnGamePauseChanged then
    GameMode.OnGamePauseChanged:Remove(GWorld.GameInstance, self.ListeningDelegate)
  end
end

function GamePauseChecker_C:IsCheckerCompletedInternal()
  local bRes = not self:IsGamePaused()
  DebugPrint("@@@ GamePauseChecker_C:IsCheckerCompletedInternal", bRes)
  return bRes
end

function GamePauseChecker_C:IsGamePaused()
  local bPaused = false
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode and GameMode.OnGamePauseChanged then
    bPaused = GameMode:IsGamePaused()
  end
  return bPaused
end

function GamePauseChecker_C:IsSelfValid()
  if not UNeModeFunctionLibrary.IsStandAlone(GWorld.GameInstance) then
  end
  return true
end

function GamePauseChecker_C:IsSelfAutoEnabled()
  return true
end

return GamePauseChecker_C
