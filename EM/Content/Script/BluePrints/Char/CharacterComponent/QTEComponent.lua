local Component = {}
local QTEUIName = "QTE"

function Component:RedirectInputActionName(InputActionName)
  return InputActionName
end

function Component:TriggerQTE_SingleClick(TriggerObject, WindowSize, TimeDialation, InteractiveUI, InputActionName, InputGamePadActionName, UIPosition, ClickFaultToleranceCount, SuccessCallbackName, SuccessSequence, FailCallbackName, FailSequence, QTEName)
  local Config = {}
  Config.WindowSize = WindowSize
  Config.RealWindowSize = Config.WindowSize * 1
  Config.TriggerObject = TriggerObject
  Config.TimeDialation = TimeDialation
  Config.InteractiveUI = InteractiveUI
  Config.InputActionName = self:RedirectInputActionName(InputActionName)
  Config.InputGamePadActionName = InputGamePadActionName
  Config.UIPosition = UIPosition
  Config.ClickFaultToleranceCount = ClickFaultToleranceCount
  Config.SuccessCallbackName = SuccessCallbackName
  Config.SuccessSequence = SuccessSequence
  Config.FailCallbackName = FailCallbackName
  Config.FailSequence = FailSequence
  Config.ClickType = "Single"
  Config.SuccessClickNum = 1
  DebugPrint("QTE: TriggerQTE_SingleClick")
  if self:CheckQTEConfig(Config) then
    self:TriggerQTE(Config)
  end
end

function Component:TriggerQTE_MultiClick(TriggerObject, TimeDialation, InteractiveUI, InputActionName, InputGamePadActionName, UIPosition, ClickFaultToleranceCount, SuccessClickNum, bAlwaysSuccess, SuccessCallbackName, SuccessSequence, FailCallbackName, FailSequence)
  local Config = {}
  Config.RealWindowSize = Config.WindowSize or 5
  Config.TriggerObject = TriggerObject
  Config.TimeDialation = TimeDialation
  Config.InteractiveUI = InteractiveUI
  Config.InputActionName = self:RedirectInputActionName(InputActionName)
  Config.InputGamePadActionName = InputGamePadActionName
  Config.UIPosition = UIPosition
  Config.ClickFaultToleranceCount = ClickFaultToleranceCount
  Config.SuccessClickNum = SuccessClickNum
  Config.bAlwaysSuccess = bAlwaysSuccess
  Config.SuccessCallbackName = SuccessCallbackName
  Config.SuccessSequence = SuccessSequence
  Config.FailCallbackName = FailCallbackName
  Config.FailSequence = FailSequence
  Config.ClickType = "Multi"
  DebugPrint("QTE: TriggerQTE_MultiClick")
  if self:CheckQTEConfig(Config) then
    self:TriggerQTE(Config)
  end
end

function Component:StopWorkingQTE(TriggerObject)
  DebugPrint("QTE: StopWorkingQTE", TriggerObject)
  if not self:IsQTEWorking() then
    return
  end
  self:OnQTETimeOut()
end

function Component:CheckCanWorkingQTE(Config)
  if not IsValid(Config.TriggerObject) then
    return false
  end
  if self:IsQTEWorking() then
    DebugPrint("QTE: \232\167\166\229\143\145\231\170\151\229\143\163\233\135\141\229\143\160/\229\144\140\228\184\128QTE\229\164\154\230\172\161\232\167\166\229\143\145")
    return false
  end
  return true
end

function Component:TriggerQTE(Config)
  DebugPrintTable(Config)
  if not self:CheckCanWorkingQTE(Config) then
    return
  end
  self:StartOneQTE(Config.TriggerObject, Config)
end

function Component:StartOneQTE(TriggerObject, Config)
  DebugPrint("QTE: StartOneQTE", Config, TriggerObject.Player)
  DebugPrintTable(Config)
  self.bQTEWorking = true
  self.bQTESucceed = false
  self.WorkingQTEConfig = Config
  self.WorkingSequencePlayer = TriggerObject.Player
  self:SwitchBindSequenceEvent(self.WorkingSequencePlayer, true)
  self:EnableQTETimeDilation(Config)
  self:EnableQTEUI(Config)
end

function Component:SwitchBindSequenceEvent(SequencePlayer, bBind)
  if not SequencePlayer then
    return
  end
  if bBind then
    SequencePlayer.OnFinished:Add(self, self.OnQTESequencePlayFinished)
    SequencePlayer.OnStop:Add(self, self.OnQTESequencePlayStopped)
  else
    SequencePlayer.OnFinished:Remove(self, self.OnQTESequencePlayFinished)
    SequencePlayer.OnStop:Remove(self, self.OnQTESequencePlayStopped)
  end
end

function Component:OnQTESequencePlayStopped()
  DebugPrint("QTE: OnQTESequencePlayStopped")
  self:SwitchBindSequenceEvent(self.WorkingSequencePlayer, false)
  self:ClearQTE()
end

function Component:OnQTESequencePlayFinished()
  DebugPrint("QTE: OnQTESequencePlayFinished")
  self:SwitchBindSequenceEvent(self.WorkingSequencePlayer, false)
  self:ClearQTE()
end

function Component:ClearQTE()
  DebugPrint("QTE: ClearQTE")
  self:DisableQTEUI()
  self.bQTEWorking = false
  self.WorkingQTEConfig = nil
  self.WorkingSequencePlayer = nil
end

function Component:OnQTETimeOut()
  DebugPrint("QTE: QTE\231\187\147\230\157\159")
  local Config = self.WorkingQTEConfig
  self:ResumeQTETimeDilation()
  self:SwitchPlayNextSequence()
  local QTEUI = UIManager(GWorld.GameInstance):GetUIObj(QTEUIName)
  self.bQTESucceed = Config.bAlwaysSuccess or false
  if QTEUI then
    QTEUI:OnTimeOut(self.bQTESucceed, function()
      self:ClearQTE()
    end)
  end
end

function Component:SwitchPlayNextSequence()
  local Config = self.WorkingQTEConfig
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local NextCallbackName, NextSequence
  if self.bQTESucceed then
    NextCallbackName = Config.SuccessCallbackName
    NextSequence = Config.SuccessSequence
  else
    NextCallbackName = Config.FailCallbackName
    NextSequence = Config.FailSequence
  end
  if GameMode and NextCallbackName then
    GameMode:PostCustomEvent(NextCallbackName)
  end
  self:TryPlayNextSequence(Config, NextSequence)
end

function Component:EnableQTETimeDilation(Config)
  self.bHasResumeQTETimeDilation = false
  if 0 == Config.TimeDialation then
    Config.TimeDialation = 0.01
  end
  DebugPrint("QTE: \230\155\180\230\148\185\229\133\168\229\177\128\230\151\182\233\151\180\232\134\168\232\131\128", Config.TimeDialation)
  Config.OriGlobalTimeDilation = UE4.UGameplayStatics.GetGlobalTimeDilation(self)
  UE4.UGameplayStatics.SetGlobalTimeDilation(self, Config.TimeDialation)
end

function Component:ResumeQTETimeDilation()
  if self.bHasResumeQTETimeDilation then
    return
  end
  local Config = self.WorkingQTEConfig
  self.bHasResumeQTETimeDilation = true
  if Config and Config.OriGlobalTimeDilation then
    DebugPrint("QTE: \230\129\162\229\164\141\229\133\168\229\177\128\230\151\182\233\151\180\232\134\168\232\131\128", Config.OriGlobalTimeDilation)
    UE4.UGameplayStatics.SetGlobalTimeDilation(self, Config.OriGlobalTimeDilation)
  else
    DebugPrint("QTE: warning ResumeQTETimeDilation without ori TimeDilation, Use Default 1.0 GlobalTimeDilation")
    UE4.UGameplayStatics.SetGlobalTimeDilation(self, 1.0)
  end
end

function Component:EnableQTEUI(Config)
  DebugPrint("QTE: EnableQTEUI", QTEUIName)
  local UI = UIManager(GWorld.GameInstance):LoadUINew(QTEUIName)
  UI:SetOnSuccCallback(self, self.OnQTESucceed)
  UI:SetOnFailCallback(self, self.OnQTEFailed)
  UI:ResponseQTE(Config)
end

function Component:DisableQTEUI()
  UIManager(GWorld.GameInstance):UnLoadUINew(QTEUIName)
end

function Component:IsQTEWorking()
  return self.bQTEWorking
end

function Component:OnQTESucceed()
  DebugPrint("QTE: QTE\229\147\141\229\186\148\230\136\144\229\138\159")
  self.bQTESucceed = true
  self:ResumeQTETimeDilation()
end

function Component:OnQTEFailed()
  DebugPrint("QTE: QTE\229\147\141\229\186\148\229\164\177\232\180\165")
  self.bQTESucceed = false
  self:ResumeQTETimeDilation()
end

function Component:TryPlayNextSequence(Config, Sequence)
  if not self:IsQTEWorking() then
    return
  end
  DebugPrint("QTE: TryPlayNextSequence", Sequence)
  if not Sequence then
    return
  end
  local SP = Config.TriggerObject.Player
  SP:Stop()
  local LevelSequenceActorClass = UE4.LoadClass(Const.Talk_LevelSequenceActorPath)
  local DefaultTrans = UE4.UKismetMathLibrary.MakeTransform(UE4.FVector(0, 0, 0), UE4.FRotator(0, 0, 0), UE4.FVector(1, 1, 1))
  local World = self:GetWorld()
  local SequenceActor = World:SpawnActor(LevelSequenceActorClass, DefaultTrans, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
  SequenceActor.CameraSettings.bOverrideAspectRatioAxisConstraint = false
  SequenceActor:SetSequence(Sequence)
  SequenceActor.SequencePlayer:Play()
end

function Component:CheckQTEConfig(Config)
  return true
end

return Component
