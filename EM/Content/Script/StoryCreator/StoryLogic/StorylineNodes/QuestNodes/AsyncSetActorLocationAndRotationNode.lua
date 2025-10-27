local AsyncSetActorLocationAndRotationNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function AsyncSetActorLocationAndRotationNode:Init()
  self.UnitId = 0
  self.NewTargetPointName = nil
  self.IsForceIdle = nil
  self.FadeIn = nil
  self.FadeOut = nil
  self.bResetCamera = nil
  self.TalkContext = nil
  self.bForceAsyncLoading = nil
  self.IsWhite = nil
end

function AsyncSetActorLocationAndRotationNode:Execute(Callback)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if IsValid(Player) then
    Player:DisablePlayerInputInDeliver(true)
  end
  local GameInstance = GWorld.GameInstance
  local SceneMgrComponent = GameInstance:GetSceneManager()
  self.TalkContext = GameInstance:GetTalkContext()
  local TargetActor
  local EMGameState = UE4.UGameplayStatics.GetGameState(self.TalkContext)
  if 0 == self.UnitId then
    TargetActor = self.TalkContext.Player
  else
    TargetActor = EMGameState.NpcCharacterMap:FindRef(self.UnitId)
  end
  local TargetActorController = TargetActor:GetController()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self.TalkContext)
  local NewTargetPoint = EMGameState:GetTargetPoint(self.NewTargetPointName)
  local LevelLoader = GameMode:GetLevelLoader()
  
  local function FadeOut()
    UIManager(self):HideCommonBlackScreen("AsyncSetActorLocAndRotNode")
  end
  
  local function FadeInCallback()
    SceneMgrComponent:ShowOrHideAllSceneGuideIcon(false)
    local TaskIndicator = UIManager(self):GetUIObj("MainTaskIndicator")
    if IsValid(TaskIndicator) then
      TaskIndicator:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if TargetActorController:IsA(APlayerController) then
      TargetActor:DisableInput(TargetActorController)
    end
    
    local function SetActorTransform()
      if IsValid(NewTargetPoint) then
        GameMode:EMSetActorLocationAndRotation(self.UnitId, self.NewTargetPointName, true, true)
        if 0 == self.UnitId then
          TargetActor:SetSafeLocation()
        end
        if self.bResetCamera then
          TargetActor:GetController():SetControlRotation(TargetActor:K2_GetActorRotation())
        end
      end
    end
    
    if IsValid(LevelLoader) and IsValid(NewTargetPoint) then
      local TargetLevelId = GameMode:GetLevelLoader():GetLevelIdByLocation(NewTargetPoint:K2_GetActorLocation())
      local CurrentLevelId = GameMode:GetLevelLoader():GetLevelIdByLocation(TargetActor:K2_GetActorLocation())
      local WorldCompositionSubsystem = GameMode:GetWCSubSystem()
      if WorldCompositionSubsystem then
        if self.bForceAsyncLoading then
          WorldCompositionSubsystem:RequestAsyncTravel(self.TalkContext.Player, NewTargetPoint:GetTransform(), {
            self.TalkContext,
            FadeOut
          }, self.bResetCamera)
        elseif WorldCompositionSubsystem:IsBigObjectLevelLoadedByLocation(NewTargetPoint:K2_GetActorLocation()) then
          SetActorTransform()
          FadeOut()
        else
          WorldCompositionSubsystem:RequestAsyncTravel(self.TalkContext.Player, NewTargetPoint:GetTransform(), {
            self.TalkContext,
            FadeOut
          }, self.bResetCamera)
        end
        return
      else
      end
      if LevelLoader:GetLevelLoaded(TargetLevelId) then
        SetActorTransform()
        FadeOut()
        return
      end
      if TargetLevelId ~= CurrentLevelId then
        LevelLoader:BindArtLevelLoadedCompleteCallback(TargetLevelId, function()
          SetActorTransform()
          FadeOut()
        end)
        LevelLoader:LoadArtLevel(TargetLevelId)
      else
        SetActorTransform()
        FadeOut()
      end
    else
      SetActorTransform()
      FadeOut()
    end
  end
  
  local function FadeOutCallback()
    TaskIndicator = UIManager(self):GetUIObj("MainTaskIndicator")
    if IsValid(TaskIndicator) then
      TaskIndicator:SetVisibility(UE4.ESlateVisibility.Visible)
    end
    SceneMgrComponent = GameInstance:GetSceneManager()
    SceneMgrComponent:ShowOrHideAllSceneGuideIcon(true)
    if TargetActorController:IsA(APlayerController) then
      TargetActor:EnableInput(TargetActorController)
    end
    if IsValid(LevelLoader) and IsValid(NewTargetPoint) then
      local TargetLevelId = GameMode:GetLevelLoader():GetLevelIdByLocation(NewTargetPoint:K2_GetActorLocation())
      LevelLoader:RemoveArtLevelLoadedCompleteCallback(TargetLevelId)
    end
    local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
    if IsValid(Player) then
      Player:DisablePlayerInputInDeliver(false)
    end
    Callback()
  end
  
  UIManager(self):ShowCommonBlackScreen({
    BlackScreenHandle = "AsyncSetActorLocAndRotNode",
    InAnimationPlayTime = self.FadeIn and 1 or 0,
    InAnimationObj = self,
    InAnimationCallback = FadeInCallback,
    OutAnimationPlayTime = self.FadeOut and 1 or 0,
    OutAnimationObj = self,
    OutAnimationCallback = FadeOutCallback,
    ScreenColor = self.IsWhite and "White" or nil
  })
end

function AsyncSetActorLocationAndRotationNode:FinishAction(OutPortIndex)
  DebugPrint("TalkNode finished", "Option_", self, OutPortIndex)
  if OutPortIndex then
    self:Finish("Option_" .. OutPortIndex)
  else
    self:Finish()
  end
end

return AsyncSetActorLocationAndRotationNode
