require("DataMgr")
require("UnLua")
local MiscUtils = require("Utils.MiscUtils")
local FSoundOralComponent = require("BluePrints.Story.Talk.Component.SoundOralComponent").FSoundOralComponent
local StoryPlayableUtils = require("BluePrints.Story.StoryPlayableUtils").StoryPlayableUtils
local BP_NPC_C = Class({
  "BluePrints.Char.BP_NpcCharacterBase_C"
})

function BP_NPC_C:ReceiveBeginPlay()
  rawset(self, "AutoSyncProp", self.AutoSyncProp)
  EventManager:AddEvent(EventID.OnBattleReady, self, self.OnBattleReady_TryInitCharacterInfo)
  EventManager:AddEvent(EventID.EnableNpcSideBubble, self, self.TryEnableNpcSideBubble)
  EventManager:AddEvent(EventID.OnNpcEnterOrQuitSpecialQuest, self, self.UpdateNpcSpecialState)
  self.LuaTimerHandles = {}
  if IsValid(self.NS_NPC_Weita) and CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.NS_NPC_Weita:K2_DestroyComponent(self)
    DebugPrint("NS_NPC_Weita Destroyed")
  end
  self.IsDestroied = false
  self.IsShowSideIndicator = false
  self.IsInSpecialQuest = false
  self.IsNeedCollapsedOtherBubble = false
end

function BP_NPC_C:OnBattleReady_TryInitCharacterInfo(_Battle)
  if Battle(self) == _Battle then
    self:TryInitCharacterInfo("Battle")
  end
end

function BP_NPC_C:AuthorityInitInfo(Info)
  BP_NPC_C.Super.AuthorityInitInfo(self, Info)
  if self.NpcAnimInstance then
    self.NpcAnimInstance.CanTurn = self.CanTurn
  end
end

function BP_NPC_C:CommonInitInfo(Info)
  BP_NPC_C.Super.CommonInitInfo(self, Info)
  self:InitInfo(Info)
end

function BP_NPC_C:OnCharacterReady(Info)
  BP_NPC_C.Super.OnCharacterReady(self, Info)
end

function BP_NPC_C:OverrideOnPostInitSucc(Func)
  self.OnPostInitSucc = Func
end

function BP_NPC_C:JointFinalAnimPath(UnitId, Path)
  local ModelId = DataMgr.Npc[UnitId].ModelId
  assert(ModelId, "Can't find model id for npc: " .. UnitId)
  local ModelData = DataMgr.Model[ModelId]
  local MontageFolder = ModelData.MontageFolder
  local Prefix = ModelData.MontagePrefix
  local SequenceFolder = string.gsub(MontageFolder, "Montage", "Sequence")
  DebugPrint(UnitId, ModelId, "SequenceFolder", SequenceFolder, "Prefix", Prefix)
  return SequenceFolder .. "Interactive/" .. Prefix .. Path
end

function BP_NPC_C:JointFinalAnimPathMechInteractive(UnitId, Path)
  local ModelId = DataMgr.Npc[UnitId].ModelId
  assert(ModelId, "Can't find model id for npc: " .. UnitId)
  local ModelData = DataMgr.Model[ModelId]
  local MontageFolder = ModelData.MontageFolder
  local Prefix = ModelData.MontagePrefix
  local SequenceFolder = string.gsub(MontageFolder, "Montage", "Sequence")
  DebugPrint(UnitId, ModelId, "SequenceFolder", SequenceFolder, "Prefix", Prefix)
  return SequenceFolder .. "Interactive/MechInteractive/" .. Prefix .. Path
end

function BP_NPC_C:AuthorityCommonInitMonsterInfo()
  BP_NPC_C.Super.AuthorityCommonInitMonsterInfo(self)
end

function BP_NPC_C:ReceiveEndPlay()
  BP_NPC_C.Super.ReceiveEndPlay(self)
  EventManager:RemoveEvent(EventID.EnableNpcSideBubble, self)
  EventManager:RemoveEvent(EventID.TalkEnableMonsterSpawn, self)
  EventManager:RemoveEvent(EventID.OnNpcEnterOrQuitSpecialQuest, self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  GameState:RecordNpcEntity(self, false)
  if self.IsSitting then
    self:SetIdlePose(nil, nil)
  end
  self:UnRegisterHeadUI()
  self.IsDestroied = true
end

function BP_NPC_C:CheckCanPart()
  return true
end

function BP_NPC_C:StartTalkContext(TalkId, PlayerActor)
  self.NpcTalkInteractiveComponent:StartTalkContext(TalkId, PlayerActor)
end

function BP_NPC_C:IsCustomNPC()
  return self.Hair_SM ~= nil
end

function BP_NPC_C:StartOral(VoiceName, OralBaked)
  self:StopOral(self.CurrentVoiceName)
  self.CurrentVoiceName = VoiceName
  self:BeginLipSync(OralBaked)
end

function BP_NPC_C:StopOral(VoiceName)
  if self.CurrentVoiceName ~= VoiceName then
    return
  end
  self:EndLipSync()
end

function BP_NPC_C:StartSequentialDialogueLipSync(StartDialogueId)
  if not self.SoundOralComponent then
    self.SoundOralComponent = FSoundOralComponent.New()
  end
  self.CurrentDialogueSequentialId = StartDialogueId
  self.LipSyncComponent.OnBlendStop:Add(self, self.DialogueNextLipSync)
  self:DialogueNextLipSync()
end

function BP_NPC_C:DialogueNextLipSync()
  local DialogueInfo = DataMgr.Dialogue[self.CurrentDialogueSequentialId]
  if not DialogueInfo then
    self:StopSequentialDialogueLipSync()
    return
  end
  local VoiceName = DialogueInfo.VoiceName
  if not VoiceName then
    self:StopSequentialDialogueLipSync()
    return
  end
  local NPC
  local DisableMouth = DialogueInfo.DisableMouth
  if not DisableMouth then
    NPC = self
  end
  local AudioManager = AudioManager(self)
  self.SoundOralComponent:PlaySoundWithOral(AudioManager, VoiceName, NPC)
  self.CurrentDialogueSequentialId = self.CurrentDialogueSequentialId + 1
end

function BP_NPC_C:StopSequentialDialogueLipSync()
  self.LipSyncComponent.OnBlendStop:Remove(self, self.DialogueNextLipSync)
  self.CurrentDialogueSequentialId = nil
end

function BP_NPC_C:IsNeedHideInTalk()
  return false
end

function BP_NPC_C:SetSitPoseInteractive(CallBackFunc, IsImmediately)
  if self.IsSitting == true then
    EventManager:FireEvent(EventID.OnNpcPoseChange)
    return
  end
  self.IsSitting = true
  local Result = TArray(AActor)
  local SeatClass = UE4.AMechanismBase
  UE4.UKismetSystemLibrary.BoxOverlapActors(self, self:K2_GetActorLocation(), FVector(50, 50, 150), nil, SeatClass, nil, Result)
  if Result:Length() > 0 then
    self.CurrentSeat = Result[1]
    self.CurrentSeat:OpenMechanismWithoutInteractive(self, CallBackFunc, IsImmediately)
  else
    UE4.UKismetSystemLibrary.BoxOverlapActors(self, self:K2_GetActorLocation(), FVector(100, 100, 150), nil, SeatClass, nil, Result)
    if Result:Length() > 0 then
      self.CurrentSeat = Result[1]
      self.CurrentSeat:OpenMechanismWithoutInteractive(self, CallBackFunc, IsImmediately)
    else
      self.MaxCounter = 0
      self:AddTimer(5, function()
        DebugPrint("RunSafe Sit NpcUnitId:", self.UnitId, self:GetName())
        UE4.UKismetSystemLibrary.BoxOverlapActors(self, self:K2_GetActorLocation(), FVector(100, 100, 150), nil, SeatClass, nil, Result)
        self.MaxCounter = self.MaxCounter + 1
        if self.MaxCounter > 20 then
          self:RemoveTimer("SafeSit")
        end
        if Result:Length() > 0 then
          self.CurrentSeat = Result[1]
          self.CurrentSeat:OpenMechanismWithoutInteractive(self, CallBackFunc, IsImmediately)
          self:RemoveTimer("SafeSit")
        end
      end, true, 0, "SafeSit")
      EventManager:FireEvent(EventID.OnNpcPoseChange)
    end
  end
end

function BP_NPC_C:SetSitPoseWithoutInteractive(CallBackFunc)
  if self.IsSitting == true then
    EventManager:FireEvent(EventID.OnNpcPoseChange)
    return
  end
  self.IsSitting = true
  self.IsSpecialSit = true
  self:SetCharacterTag("Seating")
  self.CapsuleComponent:IgnoreActorWhenMoving(self, true)
  local StaticMeshResult = TArray(AActor)
  local MeshClass = UE4.AStaticMeshActor
  UE4.UKismetSystemLibrary.BoxOverlapActors(self, self.RootComponent:K2_GetComponentLocation(), FVector(80, 80, 30), nil, MeshClass, nil, StaticMeshResult)
  for _, Actor in pairs(StaticMeshResult) do
    if Actor then
      self.CapsuleComponent:IgnoreActorWhenMoving(Actor, true)
    end
  end
  local MechanismResult = TArray(AActor)
  local MechanismClass = UE4.AMechanismBase
  UE4.UKismetSystemLibrary.BoxOverlapActors(self, self.RootComponent:K2_GetComponentLocation(), FVector(80, 80, 30), nil, MechanismClass, nil, MechanismResult)
  for _, Actor in pairs(MechanismResult) do
    if Actor then
      self.CapsuleComponent:IgnoreActorWhenMoving(Actor, true)
    end
  end
  self:GetMovementComponent():LockMovementMode(true, EMovementMode.Move_Walking)
  if self:GetMovementComponent() then
    self:GetMovementComponent().GravityScale = 0
    if not self:GetMovementComponent():IsComponentTickEnabled() then
      self:GetMovementComponent():SetComponentTickEnabled(false)
    end
  end
  self:K2_SetActorLocation(self.BrothLoc, false, nil, false)
  if self.NpcAnimInstance then
    self.NpcAnimInstance.EnableDataFootIK = true
  end
  local DefaultMontageName = DataMgr.Npc[self.UnitId].DefaultAction
  if self.UnitId and DataMgr.Npc[self.UnitId] and DataMgr.Npc[self.UnitId].SpecialSit then
    DefaultMontageName = DataMgr.Npc[self.UnitId].SpecialSit
  end
  self:PlayTalkAction(DefaultMontageName, {
    self,
    function()
      if CallBackFunc then
        CallBackFunc()
      end
      EventManager:FireEvent(EventID.OnNpcPoseChange)
    end
  })
  self:AddTimer(0.1, function()
    local Section = self.Mesh:GetAnimInstance():Montage_GetCurrentSection()
    if "SitLoop" == Section then
      self:RemoveTimer("SitToLoop")
      EventManager:FireEvent(EventID.OnNpcPoseChange)
    end
  end, true, 0, "SitToLoop")
end

function BP_NPC_C:SetSitPoseWithInteractiveAndNoDown(CallBackFunc)
  if self.IsSitting == true then
    EventManager:FireEvent(EventID.OnNpcPoseChange)
    return
  end
  self.IsSitting = true
  local Result = TArray(AActor)
  local SeatClass = UE4.AMechanismBase
  UE4.UKismetSystemLibrary.BoxOverlapActors(self, self:K2_GetActorLocation(), FVector(50, 50, 150), nil, SeatClass, nil, Result)
  if Result:Length() > 0 then
    self.CurrentSeat = Result[1]
    self.CurrentSeat:OpenMechanismNpcSpecial(self, CallBackFunc)
    self:RealSetSitPoseWithInteractiveAndNoDown(CallBackFunc)
  else
    UE4.UKismetSystemLibrary.BoxOverlapActors(self, self:K2_GetActorLocation(), FVector(100, 100, 150), nil, SeatClass, nil, Result)
    if Result:Length() > 0 then
      self.CurrentSeat = Result[1]
      self.CurrentSeat:OpenMechanismNpcSpecial(self, CallBackFunc)
      self:RealSetSitPoseWithInteractiveAndNoDown(CallBackFunc)
    else
      self.MaxCounter = 0
      self:AddTimer(5, function()
        DebugPrint("RunSafe Sit NpcUnitId:", self.UnitId, self:GetName())
        UE4.UKismetSystemLibrary.BoxOverlapActors(self, self:K2_GetActorLocation(), FVector(100, 100, 150), nil, SeatClass, nil, Result)
        self.MaxCounter = self.MaxCounter + 1
        if self.MaxCounter > 20 then
          self:RemoveTimer("SafeSit")
        end
        if Result:Length() > 0 then
          self.CurrentSeat = Result[1]
          self.CurrentSeat:OpenMechanismNpcSpecial(self, CallBackFunc)
          self:RealSetSitPoseWithInteractiveAndNoDown(CallBackFunc)
          self:RemoveTimer("SafeSit")
        end
      end, true, 0, "SafeSit")
      EventManager:FireEvent(EventID.OnNpcPoseChange)
    end
  end
end

function BP_NPC_C:RealSetSitPoseWithInteractiveAndNoDown(CallBackFunc)
  self.IsSitting = true
  self.IsSpecialSit = true
  self:SetCharacterTag("Seating")
  self.CapsuleComponent:IgnoreActorWhenMoving(self, true)
  local StaticMeshResult = TArray(AActor)
  local MeshClass = UE4.AStaticMeshActor
  UE4.UKismetSystemLibrary.BoxOverlapActors(self, self.RootComponent:K2_GetComponentLocation(), FVector(80, 80, 30), nil, MeshClass, nil, StaticMeshResult)
  for _, Actor in pairs(StaticMeshResult) do
    if Actor then
      self.CapsuleComponent:IgnoreActorWhenMoving(Actor, true)
    end
  end
  local MechanismResult = TArray(AActor)
  local MechanismClass = UE4.AMechanismBase
  UE4.UKismetSystemLibrary.BoxOverlapActors(self, self.RootComponent:K2_GetComponentLocation(), FVector(80, 80, 30), nil, MechanismClass, nil, MechanismResult)
  for _, Actor in pairs(MechanismResult) do
    if Actor then
      self.CapsuleComponent:IgnoreActorWhenMoving(Actor, true)
    end
  end
  self:GetMovementComponent():LockMovementMode(true, EMovementMode.Move_Walking)
  if self:GetMovementComponent() then
    self:GetMovementComponent().GravityScale = 0
    if not self:GetMovementComponent():IsComponentTickEnabled() then
      self:GetMovementComponent():SetComponentTickEnabled(false)
    end
  end
  self:K2_SetActorLocation(self.BrothLoc, false, nil, false)
  if self.NpcAnimInstance then
    self.NpcAnimInstance.EnableDataFootIK = true
  end
  local DefaultMontageName = DataMgr.Npc[self.UnitId].DefaultAction
  local MontagePath = self:GetNpcTalkActionPath(DefaultMontageName)
  UResourceLibrary.LoadObjectAsync(self, MontagePath, {
    self,
    function(_, Montage)
      if Montage then
        local PlayParam = {StartSec = "Loop"}
        MiscUtils.PlayMontageBySkeletaMesh(self, self.Mesh, Montage, PlayParam)
        if CallBackFunc then
          CallBackFunc()
        end
        EventManager:FireEvent(EventID.OnNpcPoseChange)
      end
    end
  })
end

function BP_NPC_C:GetNpcTalkActionPath(InActionId)
  local TalkActionData = DataMgr.TalkAction[InActionId]
  if nil == TalkActionData then
    Utils.ScreenPrint("ActionId \228\184\141\229\173\152\229\156\168:" .. tostring(InActionId))
    return ""
  end
  local MontagePath = ""
  local ModelData = DataMgr.Model[self.ModelId]
  if nil == TalkActionData.MontagePrePath or "" == TalkActionData.MontagePrePath then
    MontagePath = string.format("%sInteractive/%s%s_Montage", ModelData.MontageFolder, ModelData.MontagePrefix, TalkActionData.ActionMontage)
  else
    MontagePath = string.format("%s%s/%s%s_Montage", ModelData.MontageFolder, TalkActionData.MontagePrePath, ModelData.MontagePrefix, TalkActionData.ActionMontage)
  end
  return MontagePath
end

function BP_NPC_C:MoveToSeat(Loc, Rot)
  if nil == Loc or nil == Rot then
    DebugPrint("NPC Can not MoveToSeat Loc == nil or Rot == nil ", self:GetName())
    return
  end
  DebugPrint("NPC MoveToSeat:", self:GetName())
  self:GetMovementComponent().GravityScale = 0
  self:K2_SetActorLocationAndRotation(Loc, Rot, false, nil, false)
end

function BP_NPC_C:SetIdlePose(NeedMontage, Callback)
  if self.IsSitting == false then
    DebugPrint("NPC Was already Standing :", self:GetName(), self.UnitId)
    EventManager:FireEvent(EventID.OnNpcPoseChange)
    return
  end
  self.IsSitting = false
  if self.UnitId and DataMgr.Npc[self.UnitId] and DataMgr.Npc[self.UnitId].SpecialSit and 2 == DataMgr.Npc[self.UnitId].IsSit then
    self:RealSetIdlePoseBySpecialSit(Callback)
    return
  end
  if not self.CurrentSeat then
    print(_G.LogTag, "Error: LXZ not self.CurrentSeat")
    EventManager:FireEvent(EventID.OnNpcPoseChange)
    return
  end
  if NeedMontage then
    self.CurrentSeat:CloseMechanismWithoutInteractive(self, Callback)
  else
    self.CurrentSeat:CloseMechanismWithoutMontage(self)
  end
end

function BP_NPC_C:RealSetIdlePoseBySpecialSit(Callback)
  self:GetMovementComponent().bAllowPhysicsRotationDuringAnimRootMotion = true
  self.Mesh:GetAnimInstance():Montage_JumpToSection("SitEnd")
  self.IsSpecialSit = false
  
  local function NewCallBack()
    if Callback then
      Callback()
    end
    EventManager:FireEvent(EventID.OnNpcPoseChange)
    self:SetCharacterTag("Idle")
    if self.SetNpcMovementTickEnable then
      self:SetNpcMovementTickEnable(false)
    end
  end
  
  local AllCallback = {OnCompleted = NewCallBack}
  
  function self.StandCallBack()
    local DefaultMontageName = "Interactive_SitEnd_Montage"
    self:PlayActionMontage("Interactive/MechInteractive", DefaultMontageName, AllCallback, false, true, true)
    self.Mesh:GetAnimInstance().OnMontageEnded:Remove(self, self.StandCallBack)
    self:GetMovementComponent():LockMovementMode(false, EMovementMode.Move_Walking)
  end
  
  self.Mesh:GetAnimInstance().OnMontageEnded:Add(self, self.StandCallBack)
end

function BP_NPC_C:InitNpcInteractiveComponent()
  local NpcData = DataMgr[self.UnitType][self.UnitId]
  if not NpcData then
    return
  end
  if NpcData.InteractiveInfo then
    for InteractiveType, CommonUIConfirmID in pairs(NpcData.InteractiveInfo) do
      if DataMgr.InteractiveInfo[InteractiveType].BPPath then
        UResourceLibrary.LoadClassAsync(self, DataMgr.InteractiveInfo[InteractiveType].BPPath, {
          self,
          function(_, ClassObject)
            self:OnInteractiveComponentClassLoaded(ClassObject, CommonUIConfirmID, InteractiveType)
          end
        })
      end
    end
  end
  if NpcData.NpcBiographyId then
    local BiographyData = DataMgr.NpcBiography[NpcData.NpcBiographyId]
    UResourceLibrary.LoadClassAsync(self, DataMgr.InteractiveInfo.Biography.BPPath, {
      self,
      function(_, ClassObject)
        self:OnInteractiveComponentClassLoaded(ClassObject, 100011, "Biography")
      end
    })
  end
end

function BP_NPC_C:ReinitDefaultFacial()
  self:NewInitDefaultFacial()
end

function BP_NPC_C:InitDefaultFacial()
  local NpcInfo = DataMgr.Npc[self.UnitId]
  if NpcInfo and NpcInfo.DefaultExpression then
    DebugPrint("BP_NPC_C:InitDefaultFacial", self:GetName(), self.UnitId)
    self:NewPlayFacial(NpcInfo.DefaultExpression)
  end
end

function BP_NPC_C:NewPlayAction(InDefaultAction)
  self:PlayTalkAction(InDefaultAction)
end

function BP_NPC_C:PlayDefaultAnimation(CallBackObj)
  local NpcInfo = DataMgr.Npc[self.UnitId]
  if NpcInfo and NpcInfo.DefaultAction then
    DebugPrint("BP_NPC_C:InitDefaultAnimation", self:GetName(), self.UnitId)
    self:PlayTalkAction(NpcInfo.DefaultAction, CallBackObj)
  end
end

function BP_NPC_C:PlayDefaultAnimStartAnimation(CallFunc)
  local NpcInfo = DataMgr.Npc[self.UnitId]
  if NpcInfo.DefaultAction and DataMgr.TalkAction[NpcInfo.DefaultAction] and DataMgr.TalkAction[NpcInfo.DefaultAction].AnimationId then
    local StartAnimName = self:GetStartOrEndAnimtionName(DataMgr.TalkAction[NpcInfo.DefaultAction].AnimationId, "Start")
    local MontagePath = self:GetNpcTalkActionPath(StartAnimName)
    UResourceLibrary.LoadObjectAsync(self, MontagePath, {
      self,
      function(_, Montage)
        if Montage then
          local PlayParam = {StartSec = "Start", OnCompleted = CallFunc}
          MiscUtils.PlayMontageBySkeletaMesh(self, self.Mesh, Montage, PlayParam)
        end
      end
    })
  elseif CallFunc then
    CallFunc()
  end
end

function BP_NPC_C:PlayTalkGroupEndAnimation(CallFunc)
  if self.CurrentTalkGroupMontageName ~= nil then
    local EndAnimName = self:GetStartOrEndAnimtionName(self.CurrentTalkGroupMontageName, "End")
    local MontagePath = self:GetNpcTalkActionPath(EndAnimName)
    if "" ~= MontagePath then
      UResourceLibrary.LoadObjectAsync(self, MontagePath, {
        self,
        function(_, Montage)
          if Montage and self.NpcAnimInstance and self.NpcAnimInstance:Montage_IsPlaying(Montage) then
            self.NpcAnimInstance:Montage_JumpToSection("End")
            local EndSectionTime = self.NpcAnimInstance:GetMontageSectionTime("End")
            self:AddTimer(EndSectionTime, function()
              if CallFunc then
                CallFunc()
              end
              self:RemoveTimer("EndAnimationBackTimer")
            end, false, 0, "EndAnimationBackTimer")
          elseif CallFunc then
            CallFunc()
          end
        end
      })
    elseif CallFunc then
      CallFunc()
    end
  elseif CallFunc then
    CallFunc()
  end
end

function BP_NPC_C:GetStartOrEndAnimtionName(AnimName, Postfix)
  local lastUnderscorePos = string.match(AnimName, ".*()_")
  if lastUnderscorePos then
    local prefix = string.sub(AnimName, 1, lastUnderscorePos - 1)
    local retName = prefix .. "_" .. Postfix
    if DataMgr.TalkAction[retName] then
      return retName
    else
      return ""
    end
  else
    return ""
  end
end

function BP_NPC_C:OnInteractiveComponentClassLoaded(ClassObject, CommonUIConfirmID, InteractiveType)
  local Component = self:AddInteractiveComponent(ClassObject)
  if not IsValid(Component) then
    return
  end
  Component:InitCommonUIConfirmID(CommonUIConfirmID)
  if InteractiveType then
    self[InteractiveType .. "Component"] = Component
  end
end

function BP_NPC_C:GetFreeCameraOffset()
  return self.NpcTalkInteractiveComponent:GetSimpleTalkCenterOffset()
end

function BP_NPC_C:PlayTalkSound(SoundPath, bPlayAs2D)
  if nil == SoundPath then
    DebugPrint("Error: Play talk sound failed, sound path is nil.")
    return
  end
  bPlayAs2D = bPlayAs2D or true
  local AudioManager = AudioManager(self)
  if nil == AudioManager then
    DebugPrint("Error: Play talk sound failed, AudioManager is nil.")
  end
  local LocalizationSoundPath = string.gsub(SoundPath, "%$Locale%$", AudioManager:GetLanguage())
  local EventPath = "event:/" .. LocalizationSoundPath
  local Event = UE4.UFMODBlueprintStatics.FindEventbyName(EventPath)
  AudioManager:PlayNormalSound(self, Event, EventPath, Const.TalkSoundKey, bPlayAs2D)
end

function BP_NPC_C:StopTalkSound()
  local AudioManager = AudioManager(self)
  assert(AudioManager, "Stop talk sound failed, AudioManager is nil.")
  AudioManager:StopSound(self, Const.TalkSoundKey)
end

function BP_NPC_C:PlayFacial(FacialId)
  local FacialData = DataMgr.Facial[FacialId]
  if nil == FacialData then
    local Message = string.format("\230\137\190\228\184\141\229\136\176\232\161\168\230\131\133\230\149\176\230\141\174\239\188\140NpcId: %s\239\188\140\232\161\168\230\131\133Id: %s", self.NpcData.UnitId, FacialId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\161\168\230\131\133\230\149\176\230\141\174\231\188\186\229\164\177/\233\133\141\231\189\174\233\148\153\232\175\175", Message)
    return
  end
  if FacialData.NpcEye then
    self:PlayFacialMontage(FacialData.NpcEye, FacialData.Eye1BlendInTime, nil, true)
  end
  if FacialData.NpcMouth then
    self:PlayFacialMontage(FacialData.NpcMouth, nil, nil, true)
  end
  if FacialData.SoundBaseMouth then
    self:PlayFacialMontage(FacialData.SoundBaseMouth, nil, nil, true)
  end
end

function BP_NPC_C:StopFacial()
  if self.NpcAnimInstance == nil then
    return
  end
  self.NpcAnimInstance:Montage_StopGroupByName(0, Const.CharacterFacialMouthMontageGroupName)
  self.NpcAnimInstance:Montage_StopGroupByName(0, Const.CharacterFacialEyeMontageGroupName)
end

function BP_NPC_C:PlayFacialMontage(MontageName, BlendInTime, PlayParams, bLoadAsync)
  if nil == MontageName then
    local Message = string.format("Play facial montage failed, montage name is nil, NpcId: %s", self.NpcData.UnitId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\161\168\230\131\133\232\146\153\229\164\170\229\165\135\232\181\132\230\186\144\231\188\186\229\164\177/\233\133\141\231\189\174\233\148\153\232\175\175", Message)
    return
  end
  PlayParams = PlayParams or {
    PlayRate = 1,
    StartPos = 0,
    StartSec = "Default"
  }
  local MontagePath = self:GetFacialMontagePath(MontageName)
  if bLoadAsync then
    UResourceLibrary.LoadObjectAsync(self, MontagePath, {
      self,
      function(_, MontageObj)
        if IsValid(MontageObj) == false then
          local Message = string.format("Play facial montage failed, montage is invalid, NpcId: %s, MontagePath: %s", self.NpcData.UnitId, MontagePath)
          UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\161\168\230\131\133\232\146\153\229\164\170\229\165\135\232\181\132\230\186\144\231\188\186\229\164\177/\233\133\141\231\189\174\233\148\153\232\175\175", Message)
          return
        end
        if BlendInTime then
          UTalkFunctionLibrary.SetMontageBlendInTime(MontageObj, BlendInTime)
        end
        if self.NpcAnimInstance then
          self.NpcAnimInstance:Montage_Play(MontageObj, 1.0)
        end
      end
    })
    return
  end
  local Montage = LoadObject(MontagePath)
  if IsValid(Montage) == false then
    local Message = string.format("Play facial montage failed, montage is invalid, NpcId: %s, MontagePath: %s", self.NpcData.UnitId, MontagePath)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\161\168\230\131\133\232\146\153\229\164\170\229\165\135\232\181\132\230\186\144\231\188\186\229\164\177/\233\133\141\231\189\174\233\148\153\232\175\175", Message)
    return
  end
  if BlendInTime then
    UTalkFunctionLibrary.SetMontageBlendInTime(Montage, BlendInTime)
  end
  if self.NpcAnimInstance then
    self.NpcAnimInstance:Montage_Play(Montage, 1.0)
  end
end

function BP_NPC_C:GetFacialMontagePath(MontageName)
  local ModelData = DataMgr.Model[self.NpcData.ModelId]
  if nil == ModelData then
    local Message = string.format("\230\137\190\228\184\141\229\136\176\230\168\161\229\158\139\230\149\176\230\141\174\239\188\140NpcId: %s\239\188\140\230\168\161\229\158\139Id: %s", self.NpcData.UnitId, self.NpcData.ModelId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\232\161\168\230\131\133\230\168\161\229\158\139\230\149\176\230\141\174\231\188\186\229\164\177/\233\133\141\231\189\174\233\148\153\232\175\175", Message)
    return
  end
  local FacePrefix = ""
  if nil ~= ModelData.MontageFacePrefix then
    FacePrefix = ModelData.MontageFacePrefix
    return string.format("%sFacial/%s%s_Montage", ModelData.MontageFolder, FacePrefix, MontageName)
  end
  return string.format("%sFacial/%s%s_Montage", ModelData.MontageFolder, ModelData.MontagePrefix, MontageName)
end

function BP_NPC_C:TickActorGlobalTimeDilation()
  if not self.NpcData.GlobalGameUITagList then
    return
  end
  local CurGameInstance = GWorld.GameInstance
  local CurGameMode = UE4.UGameplayStatics.GetGameMode(self)
  if not CurGameInstance or not CurGameMode then
    return
  end
  local flag = UE4.UGameplayStatics.IsGamePaused(CurGameMode)
  local GameInstanceTag = CurGameInstance:GetGlobalGameUITag()
  for _, v in pairs(self.NpcData.GlobalGameUITagList) do
    if CurGameInstance:GetGlobalGameUITag() == v and UE4.UGameplayStatics.IsGamePaused(CurGameMode) then
      self:SetActorImmunePause(self, false)
      return
    end
  end
end

function BP_NPC_C:SetActorsImmunePause(TargetActors, bImmune)
  if not TargetActors then
    return
  end
  for _, TargetActor in pairs(TargetActors) do
    self:SetActorImmunePause(TargetActor, bImmune)
  end
end

function BP_NPC_C:SetActorImmunePause(TargetActor, bImmune)
  if nil ~= TargetActor and IsValid(TargetActor) then
    TargetActor:SetTickableWhenPaused(bImmune)
    local Components = TargetActor:K2_GetComponentsByClass(UActorComponent:StaticClass())
    if Components then
      for _, _Component in pairs(Components) do
        _Component:SetTickableWhenPaused(bImmune)
      end
    end
    if URuntimeCommonFunctionLibrary.ObjIsChildOf(TargetActor, ACharacterBase) then
      local Attaches = TargetActor:GetAllAttaches()
      if Attaches then
        self:SetActorsImmunePause(Attaches, bImmune)
      end
    end
  end
end

function BP_NPC_C:PlayUITalkAction(ActionId, OnFinished)
  local TalkActionInfo = DataMgr.NPCDialogue[ActionId]
  assert(TalkActionInfo, string.format("%s \229\156\168 NPCDialogue \232\161\168\228\184\173\228\184\141\229\173\152\229\156\168\227\128\130", ActionId))
  local MontagePath = TalkActionInfo.ActionMontage
  local Montage = LoadObject(MontagePath)
  assert(Montage, string.format("%s \228\184\141\229\173\152\229\156\168", MontagePath))
  if TalkActionInfo.EndLoopMontage then
    local function OnMontageFinished()
      local EndLoopMontagePath = TalkActionInfo.EndLoopMontage
      
      local EndLoopMontage = LoadObject(EndLoopMontagePath)
      assert(EndLoopMontage, string.format("%s \228\184\141\229\173\152\229\156\168", EndLoopMontage))
      UE4.UPlayMontageCallbackProxy.CreateProxyObjectForPlayMontage(self.Mesh, EndLoopMontage, 1, 0, TalkActionInfo.EndLoopMontageSection)
      if type(OnFinished) == "table" then
        OnFinished[2](OnFinished[1])
      end
    end
    
    local MontParam = {
      OnCompleted = OnMontageFinished,
      StartSec = TalkActionInfo.MontageSection,
      OnInterrupted = OnMontageFinished
    }
    MiscUtils.PlayMontageBySkeletaMesh(self, self.Mesh, Montage, MontParam)
  else
    local function OnMontageFinished()
      if type(OnFinished) == "table" then
        OnFinished[2](OnFinished[1])
      end
    end
    
    local MontParam = {
      OnCompleted = OnMontageFinished,
      StartSec = TalkActionInfo.MontageSection,
      OnInterrupted = OnMontageFinished
    }
    MiscUtils.PlayMontageBySkeletaMesh(self, self.Mesh, Montage, MontParam)
  end
end

function BP_NPC_C:TriggerNpcGlobalTimeDilation(IsPause)
  self:SetActorImmunePause(self, IsPause)
end

function BP_NPC_C:PreEnterStory(OnFinished, bCacheMeshMaterials, bPauseBT)
  self.bInStory = true
  if bCacheMeshMaterials then
    self.CharacterFashion:CacheMeshMaterials(self.Mesh)
    self.CharacterFashion:ReplaceMeshAllDynamicMaterialAsParent(self.Mesh)
  end
  if self.UnitId == 200003 then
    local NpcData = DataMgr.Npc[self.UnitId]
    if NpcData and NpcData.BT and self.NpcAnimInstance then
      self.NpcAnimInstance.EnableDataFootIK = true
    end
  end
  self:AddTimer(0.01, function()
    self.NativeMeshTickOptions = {}
    local SKMeshComps = self:K2_GetComponentsByClass(USkeletalMeshComponent):ToTable()
    for _, SKMeshComp in pairs(SKMeshComps) do
      if IsValid(SKMeshComp) then
        self.NativeMeshTickOptions[SKMeshComp] = SKMeshComp.VisibilityBasedAnimTickOption
        SKMeshComp.VisibilityBasedAnimTickOption = EVisibilityBasedAnimTickOption.AlwaysTickPoseAndRefreshBones
      end
    end
  end)
  if bPauseBT and self.StopBT then
    self:StopBT("Talk")
  end
  StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
end

function BP_NPC_C:PreExitStory(OnFinished, bStartBT)
  self.bInStory = false
  if bStartBT and self.RestartBT then
    self:RestartBT()
  end
  self:StopFacial()
  local MaterialArray = TArray(UMaterialInterface)
  self.CharacterFashion:UncacheMeshMaterials(self.Mesh, MaterialArray)
  self.CharacterFashion:SetMeshMaterials(self.Mesh, MaterialArray)
  for SKMeshComp, TickOption in pairs(self.NativeMeshTickOptions or {}) do
    if IsValid(SKMeshComp) then
      SKMeshComp.VisibilityBasedAnimTickOption = TickOption
    end
  end
  self.NativeMeshTickOptions = nil
  StoryPlayableUtils:ExecuteStoryDelegate(OnFinished)
end

function BP_NPC_C:IsInStory()
  return self.bInStory
end

function BP_NPC_C:InitNpcAccessories(CharId)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for _, Char in pairs(Avatar.Chars) do
      if Char.CharId == CharId then
        local AppearanceSuit = Char:DumpAppearanceSuit(Avatar)
        self:InitAppearanceSuit(AppearanceSuit)
        break
      end
    end
  end
end

function BP_NPC_C:RefreshNpcAccessories(Char)
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local AppearanceSuit = Char:DumpAppearanceSuit(Avatar)
    self:InitAppearanceSuit(AppearanceSuit)
  end
end

function BP_NPC_C:CommonOnEMActorDestroy(DestroyReason)
  self.GameplayTagsTable = nil
end

function BP_NPC_C:OnEMActorDestroy_Lua(DestroyReason)
  local GameMode = UGameplayStatics.GetGameMode(self)
  if IsValid(self.CurrentSeat) then
    self.CurrentSeat:CloseMechanismNpcSpecial(self)
  end
  if GameMode then
    GameMode:GetRegionDataMgrSubSystem():DeadRegionActorData(self, DestroyReason, GameMode:GetActorLevelName(self))
  end
  self:CommonOnEMActorDestroy(DestroyReason)
  if IsAuthority(self) then
    self:ServerOnEMActorDestroy(DestroyReason)
  end
end

function BP_NPC_C:ServerOnEMActorDestroy(DestroyReason)
  self:ServerClearMonsterExtraInfo(DestroyReason)
end

function BP_NPC_C:PlayMonsterBirthFX()
end

function BP_NPC_C:GetBlueprintPath()
  return self.Data.UnitBPPath
end

function BP_NPC_C:TempSetNpcData(InNpcId)
  local NpcData = DataMgr.Npc[InNpcId]
  if InNpcId and InNpcId > 0 and nil ~= NpcData then
    self.UnitType = "Npc"
    self.NpcId = InNpcId
    self.bInStory = true
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    local Npc = GameState.NpcCharacterMap:FindRef(self.UnitId)
    if GameState and nil == Npc then
      GameState.NpcCharacterMap:Add(self.UnitId, self)
    end
  end
end

function BP_NPC_C:InitNpcSideQuestBubbleBrush(InQuestChainId)
  if self.HeadWidgetComponent and self.HeadWidgetComponent:GetWidget() then
    if DataMgr.QuestChain[InQuestChainId] and DataMgr.QuestChain[InQuestChainId].QuestChainType == Const.SpecialSideQuestChainType then
      self.HeadWidgetComponent:GetWidget().Com_GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SpSideMission_Un.T_Gp_SpSideMission_Un"))
    else
      self.HeadWidgetComponent:GetWidget().Com_GuidePoint.Img_GuidePoint_Icon:SetBrushResourceObject(LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SideMission_Un.T_Gp_SideMission_Un"))
    end
  end
end

function BP_NPC_C:UpdateNpcSpecialState()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.IsInSpecialQuest = Avatar.InSpecialQuest
  end
end

function BP_NPC_C:TryEnableNpcSideBubble(InNpcId, IsEnable)
  if MissionIndicatorManager.MissionNpcSideBubbles[self.UnitId] and InNpcId == self.UnitId and IsEnable then
    self.IsShowSideIndicator = IsEnable
    self:InitNpcSideQuestBubbleBrush(MissionIndicatorManager.MissionNpcSideBubbles[self.UnitId])
    self:EnableNpcSideBubbleWidget(IsEnable)
  elseif false == IsEnable and InNpcId == self.UnitId then
    self.IsShowSideIndicator = IsEnable
    self:EnableNpcSideBubbleWidget(IsEnable)
  end
end

function BP_NPC_C:EnableHeadIconWidget(bEnable)
  if self.IsNeedCollapsedOtherBubble == false then
    self:EnableHeadWidget("HeadIcon", bEnable, self)
  else
    self:EnableHeadWidget("HeadIcon", false, self)
  end
end

function BP_NPC_C:EnableNpcSideBubbleWidget(bEnable)
  if self.IsShowSideIndicator and bEnable and (self.IsInSpecialQuest == false or self.IsInSpecialQuest == nil) then
    self:EnableHeadWidget("NpcSideIndicator", bEnable, self)
  else
    self:EnableHeadWidget("NpcSideIndicator", false, self)
  end
end

function BP_NPC_C:CollapsedOtherBubble()
  self:EnableHeadIconWidget(false)
  self:EnableImpressionWidget(false)
end

function BP_NPC_C:EnableImpressionWidget(bEnable)
  if self.IsNeedCollapsedOtherBubble == false then
    self:EnableHeadWidget("Impression", bEnable, self)
  else
    self:EnableHeadWidget("Impression", false, self)
  end
end

function BP_NPC_C:EnableNameWidget(bEnable)
  local NpcData = DataMgr[self.UnitType][self.UnitId]
  local Name = NpcData and NpcData.UnitName or ""
  self:EnableHeadWidget("Name", bEnable, GText(Name))
end

function BP_NPC_C:EnableBubbleWidget(bEnable, Content, Style)
  if self.IsNeedCollapsedOtherBubble == false then
    self:EnableHeadWidget("Bubble", bEnable, Content, Style)
  else
    self:EnableHeadWidget("Bubble", false, Content, Style)
  end
end

function BP_NPC_C:EnableBubbleRewardWidget(bEnable)
  if self.IsNeedCollapsedOtherBubble == false then
    self:EnableHeadWidget("Bubble_Reward", bEnable)
  else
    self:EnableHeadWidget("Bubble", false)
  end
end

function BP_NPC_C:GetHitMontageRule()
  return nil
end

function BP_NPC_C:GetHitMontageFolderAndPrefix()
  return nil, nil
end

function BP_NPC_C:DisableInteractiveScene(bDisable)
  self.bDisableInteractiveScene = bDisable
end

function BP_NPC_C:IsbDisableInteractiveScene()
  return self.bDisableInteractiveScene or false
end

function BP_NPC_C:ResetLocation()
  if self.Data and self.Data.IgnoreFixLocation == true then
    return
  end
  local SpawnPos = self:K2_GetActorLocation()
  local HalfHeight = self.CapsuleComponent:GetScaledCapsuleHalfHeight()
  local Radius = self.CapsuleComponent:GetScaledCapsuleRadius()
  local Start = SpawnPos + FVector(0, 0, math.max(HalfHeight - Radius, Radius))
  local StartLine = SpawnPos + FVector(0, 0, HalfHeight)
  local End = SpawnPos + FVector(0, 0, -500)
  local HitResult = FHitResult()
  local HitResultLine = FHitResult()
  local OffsetZ = HalfHeight - Radius
  local Ret = UE4.UKismetSystemLibrary.CapsuleTraceSingle(self, Start, End, Radius, Radius, ETraceTypeQuery.TraceScene, false, nil, 0, HitResult, true)
  local RetLine = UE4.UKismetSystemLibrary.LineTraceSingle(self, StartLine, End, ETraceTypeQuery.TraceScene, false, nil, 0, HitResultLine, true)
  if Ret and RetLine and Radius < HitResult.ImpactPoint.Z - HitResultLine.Location.Z then
    DebugPrint("BP_NPC_C CapsuleTraceSingle \230\137\147\228\184\173\228\189\141\231\189\174\239\188\154", HitResult.ImpactPoint, "\230\137\147\228\184\173\231\155\174\230\160\135\239\188\154", HitResult.Actor:GetName(), "Pawn\229\144\141\229\173\151\239\188\154", self:GetName())
    Ret = RetLine
    HitResult = HitResultLine
    OffsetZ = HalfHeight
  end
  if Ret then
    local SurfacePos = FVector(HitResult.Location.X, HitResult.Location.Y, HitResult.Location.Z + OffsetZ)
    DebugPrint("BP_NPC_C\229\141\138\233\171\152\239\188\154", HalfHeight, "\230\137\147\228\184\173\228\189\141\231\189\174\239\188\154", HitResult.ImpactPoint, "\230\137\147\228\184\173\231\155\174\230\160\135\239\188\154", HitResult.Actor:GetName(), "Pawn\229\144\141\229\173\151\239\188\154", self:GetName(), "SurfacePos\239\188\154", SurfacePos, "============sssss================")
    self:K2_SetActorLocation(SurfacePos, false, nil, false)
    if math.abs(HitResult.ImpactPoint.Z - SpawnPos.Z) > HalfHeight * 2 then
      Utils.ScreenPrint("BP_NPC_C\233\157\153\230\128\129\229\136\183\230\150\176\231\130\185\228\189\141\231\189\174\229\188\130\229\184\184,Pawn\229\144\141\229\173\151\239\188\154" .. self:GetName() .. " SpawnPos.Z\239\188\154" .. SpawnPos.Z .. " ImpactPoint.Z:" .. HitResult.ImpactPoint.Z)
    end
  end
end

function BP_NPC_C:TriggerFallingCallable()
  return
end

function BP_NPC_C:TriggerWaterFallingCallable()
  return
end

function BP_NPC_C:GetTalkInteractiveComponent()
  return self.NpcTalkInteractiveComponent
end

function BP_NPC_C:ClearCharacterBattleInfo(NormalDeath, DeathReason)
  BP_NPC_C.Super.ClearCharacterBattleInfo(self, NormalDeath, DeathReason)
  self.IsSitting = false
end

return BP_NPC_C
