local M = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function M:Init()
  self.SequencePath = ""
  self.EnableFadeIn = true
  self.EnableFadeOut = true
  self.EnableSkip = true
  self.PauseGameGlobal = false
  self.DisableMonsterAI = false
  self.DisableNPCAI = false
  self.TalkContext = GWorld.GameInstance:GetTalkContext()
  self.Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
end

function M:Execute(Callback)
  self.Callback = Callback
  self:ShowUI()
  self:PlaySequence()
  self.Player:AddDisableInputTag("Talk")
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if GameMode and GameMode.SetPlayerCharacterForceIdle then
    GameMode:SetPlayerCharacterForceIdle(self.Player)
  end
end

function M:Clear()
  self.Player:RemoveClearInputCache()
  self.Player:RemoveDisableInputTag("Talk")
end

function M:PlaySequence()
  local SequenceAsset = LoadObject(self.SequencePath)
  if not IsValid(SequenceAsset) then
    DebugPrint("Warning: BossBattleOpenNode Sequence\232\183\175\229\190\132\230\156\137\232\175\175\239\188\140\232\175\183\230\163\128\230\159\165\239\188\129\239\188\129\239\188\129", self.SequencePath)
    self:OnSequencePlayFinished()
    return
  end
  local transform = UE4.UKismetMathLibrary.MakeTransform(UE4.FVector(0, 0, 0), UE4.FRotator(0, 0, 0), UE4.FVector(1, 1, 1))
  self.LevelSequenceActor = GWorld.GameInstance:GetWorld():SpawnActor(UE4.LoadClass(Const.Talk_LevelSequenceActorPath), transform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
  self.LevelSequenceActor.CameraSettings.bOverrideAspectRatioAxisConstraint = false
  self.SequencePlayer = self.LevelSequenceActor.SequencePlayer
  self.LevelSequenceActor:SetSequence(SequenceAsset)
  if self.PauseGameGlobal and Utils.IsStandAlone(GWorld.GameInstance) then
    self:FakeTalkTaskData()
    self.TalkContext:OnPausedBegin(self.TalkTaskData)
    local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    GameMode:SetGamePaused(Const.Tag_GamePausedByTalk, true)
    local TS = TalkSubsystem()
    TS:SetSequenceIgnorePause(true, self.LevelSequenceActor, self.SequencePlayer)
  end
  self.SequencePlayer.OnFinished:Add(SequenceAsset, function()
    self:OnSequencePlayFinished()
  end)
  self.SequencePlayer:Play()
end

function M:FakeTalkTaskData()
  self.TalkTaskData = {}
  self.TalkTaskData.bPauseGameGlobal = self.PauseGameGlobal
  self.TalkTaskData.bDisableMonsterAI = self.DisableMonsterAI
  self.TalkTaskData.bDisableNPCAI = self.DisableNPCAI
  self.TalkTaskData.SequenceActor = self.LevelSequenceActor
  self.TalkTaskData.SequencePlayer = self.SequencePlayer
end

function M:ShowUI()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  UIManager:HideAllUI(true, Const.BossBattleOpenHideTag)
  UIManager:LoadUINew("HardBossBattleOpen", self.EnableFadeIn, self.EnableSkip, self, self.SkipToEnd)
end

function M:SkipToEnd()
  self.SequencePlayer:GoToEndAndStop()
  self:OnSequencePlayFinished()
end

function M:UnShowUI()
  local UIManager = GWorld.GameInstance:GetGameUIManager()
  local BossBattleOpenUI = UIManager:GetUIObj("HardBossBattleOpen")
  if self.EnableFadeOut then
    BossBattleOpenUI:BindToAnimationFinished(BossBattleOpenUI.Out, function()
      BossBattleOpenUI:Close()
    end)
    BossBattleOpenUI:PlayAnimation(BossBattleOpenUI.Out)
    BossBattleOpenUI:ShowHardBossTitle(false)
  else
    BossBattleOpenUI:Close()
  end
  UIManager:HideAllUI(false, Const.BossBattleOpenHideTag)
end

function M:OnSequencePlayFinished()
  if self.PauseGameGlobal and Utils.IsStandAlone(GWorld.GameInstance) then
    self.TalkContext:OnPausedEnd(self.TalkTaskData)
    local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
    GameMode:SetGamePaused(Const.Tag_GamePausedByTalk, false)
  end
  self:UnShowUI()
  local Eid = self.Player.MechanismEid
  local Mechanism = Battle(self):GetEntity(Eid)
  if Mechanism then
    Mechanism.ChestInteractiveComponent:EndInteractive(self.Player)
  end
  self.LevelSequenceActor:K2_DestroyActor()
  self.Callback()
end

return M
