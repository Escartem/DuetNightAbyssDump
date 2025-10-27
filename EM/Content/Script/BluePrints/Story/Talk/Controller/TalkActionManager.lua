require("Const")
local TalkActionManager_C = Class({
  "BluePrints.Common.TimerMgr"
})

function TalkActionManager_C.New()
  local Obj = setmetatable({}, {__index = TalkActionManager_C})
  Obj.NpcPlayActionRecordMap = {}
  Obj.NpcLookAtRecordMap = {}
  Obj.NpcRotateToRecordMap = {}
  Obj.GlobalNpcRotateToRecord = {}
  Obj.NpcRotateOffsetRecordMap = {}
  return Obj
end

function TalkActionManager_C:ReceiveTick(DeltaTime)
end

function TalkActionManager_C:RecordNpcPlayAction(TalkTask, TalkActor)
  DebugPrint("RecordNpcPlayAction", TalkTask, TalkActor, TalkActor:GetName())
  local RecordMap = self.NpcPlayActionRecordMap[TalkTask] or {}
  RecordMap[TalkActor] = true
  self.NpcPlayActionRecordMap[TalkTask] = RecordMap
end

function TalkActionManager_C:RecordNpcSitOrStand(TalkTask, TalkActor)
  local RecordMap = self.NpcSitOrStandRecordMap[TalkTask] or {}
  RecordMap[TalkActor] = true
  self.NpcSitOrStandRecordMap[TalkTask] = RecordMap
end

function TalkActionManager_C:RecordLookAt(TalkTask, TalkActor)
  local RecordMap = self.NpcLookAtRecordMap[TalkTask] or {}
  RecordMap[TalkActor] = true
  self.NpcLookAtRecordMap[TalkTask] = RecordMap
end

function TalkActionManager_C:RecordRotateTo(Key, TalkActor)
  local RecordMap = self.NpcRotateToRecordMap[Key] or {}
  if not RecordMap[TalkActor] then
    RecordMap[TalkActor] = TalkActor:K2_GetActorRotation()
  end
  self.NpcRotateToRecordMap[Key] = RecordMap
  self.GlobalNpcRotateToRecord = RecordMap
end

function TalkActionManager_C:StopAllNpcMontage(TalkTask)
  DebugPrint("TalkActionManager_C:StopAllNpcMontage", TalkTask)
  if self.NpcPlayActionRecordMap[TalkTask] then
    for TalkActor, _ in pairs(self.NpcPlayActionRecordMap[TalkTask]) do
      if IsValid(TalkActor) and TalkActor.Mesh then
        local AnimInstance = TalkActor.Mesh:GetAnimInstance()
        if AnimInstance then
          if TalkActor.IsSitting then
            if TalkTask.TalkTaskData.RestoreStand then
              TalkActor:SetIdlePose(true, function()
                TalkActor:StopAllTalkAction()
              end)
            end
          else
            TalkActor:StopAllTalkAction()
          end
        end
      end
    end
    self.NpcPlayActionRecordMap[TalkTask] = nil
  end
end

function TalkActionManager_C:StopAllLookAt(TalkTask)
  if self.NpcLookAtRecordMap[TalkTask] then
    for TalkActor, _ in pairs(self.NpcLookAtRecordMap[TalkTask]) do
      if IsValid(TalkActor) and TalkActor.Mesh then
        self:ResetLookAt(TalkActor)
      end
    end
    self.NpcLookAtRecordMap[TalkTask] = nil
  end
end

function TalkActionManager_C:ClearAllAsynchronousCall(TalkTask)
  DebugPrint("TalkActionManager_C:ClearAllAsynchronousCall")
  if self.NpcRotateOffsetRecordMap[TalkTask] == nil then
    return
  end
  local Npcs = self.NpcRotateOffsetRecordMap[TalkTask] or {}
  for _, Npc in pairs(Npcs) do
    if IsValid(Npc) and Npc.ClearMotionWarpingEndEvent then
      Npc:ClearMotionWarpingEndEvent()
    end
  end
  self.NpcRotateOffsetRecordMap[TalkTask] = nil
end

function TalkActionManager_C:Clear(TalkTask)
  self:StopAllLookAt(TalkTask)
  self:StopAllNpcMontage(TalkTask)
  self:ClearAllAsynchronousCall(TalkTask)
end

function TalkActionManager_C:PlayTalkAction(TalkActor, TalkActorId, TalkActionData, TalkContext, TalkTask, Callback, IsSync, IgnoreBlendInTime)
  if not TalkActor then
    return
  end
  local Obj, Func
  if Callback then
    Obj = Callback.Obj
    Func = Callback.Func
  end
  TalkActor:PlayTalkAction(TalkActionData.TalkActionId, {Obj, Func}, nil, nil, IsSync, IgnoreBlendInTime)
end

function TalkActionManager_C:DefaultLookAt(TalkContext, TalkTask, TalkTaskData, SpeakActorId, LookAtType)
  if "TalkNpc" == LookAtType then
    local SpeakActorData = TalkContext:GetTalkActorData(TalkTask, SpeakActorId)
    if not SpeakActorData or not SpeakActorData.TalkActor then
      return
    end
    local SpeakActor = SpeakActorData.TalkActor
    for _, CreateTalkActorData in ipairs(TalkTaskData.CreateTalkActors) do
      local UnitId = CreateTalkActorData.TalkActorId
      if UnitId ~= SpeakActorId then
        local TalkActorData = TalkContext:GetTalkActorData(TalkTask, UnitId)
        if TalkActorData and TalkActorData.TalkActor then
          self:SetLookAtAngles(TalkActorData.TalkActor)
          self:StartLookAt(TalkActorData.TalkActor, SpeakActor)
          self:RecordLookAt(TalkTask, TalkActorData.TalkActor)
          DebugPrint(UE4.UKismetSystemLibrary.GetDisplayName(TalkActorData.TalkActor) .. " look at " .. UE4.UKismetSystemLibrary.GetDisplayName(SpeakActor))
        end
      end
    end
  elseif "Self" == LookAtType then
    for _, CreateTalkActorData in ipairs(TalkTaskData.CreateTalkActors) do
      local UnitId = CreateTalkActorData.TalkActorId
      local TalkActorData = TalkContext:GetTalkActorData(TalkTask, UnitId)
      if TalkActorData and TalkActorData.TalkActor then
        self:ResetLookAt(TalkActorData.TalkActor)
        DebugPrint(UE4.UKismetSystemLibrary.GetDisplayName(TalkActorData.TalkActor) .. " look at " .. UE4.UKismetSystemLibrary.GetDisplayName(TalkActorData.TalkActor))
      end
    end
  end
end

function TalkActionManager_C:LookAtReady(TalkTaskData, TalkTask, LookAtDescription, NotUsingSocket, CallBack)
  local LookId, LookedInfo = LookAtDescription.LookId, LookAtDescription.LookedInfo
  if not LookId then
    local Message = string.format("Look at ready failed: LookId not found, LookAtDescription: %s, TalkNodeId: %s", LookAtDescription, TalkTaskData.TalkNodeId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local TalkContext = TalkTaskData.TalkContext
  if not IsValid(TalkContext) then
    local Message = string.format("Look at ready failed: TalkContext not found, ActorId: %s, TalkNodeId: %s", LookId, TalkTaskData.TalkNodeId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local LookActorData = TalkContext:GetTalkActorData(TalkTask, LookId)
  if not LookActorData then
    local Message = string.format("Look at ready failed: LookActorData not found, ActorId: %s, TalkNodeId: %s", LookId, TalkTaskData.TalkNodeId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local LookActor = LookActorData.TalkActor
  if not IsValid(LookActor) then
    local Message = string.format("Look at ready failed: LookActor not found, ActorId: %s, TalkNodeId: %s", LookId, TalkTaskData.TalkNodeId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  if not LookActor then
    if type(CallBack) == "function" then
      CallBack()
    elseif CallBack and CallBack.Func then
      CallBack.Func(CallBack.Obj)
    end
    return
  end
  local LookedActor
  if type(LookedInfo) == "number" then
    local LookedActorData = TalkContext:GetTalkActorData(TalkTask, LookedInfo)
    if not LookedActorData then
      local Message = string.format("Look at ready failed: LookedActorData not found, ActorId: %s, TalkNodeId: %s", LookedInfo, TalkTaskData.TalkNodeId)
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
      return
    end
    LookedActor = LookedActorData.TalkActor
    if not IsValid(LookedActor) then
      local Message = string.format("Look at ready failed: LookedActor not found, ActorId: %s, TalkNodeId: %s", LookedInfo, TalkTaskData.TalkNodeId)
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
      return
    end
  elseif "string" == type(LookedInfo) then
    local GameState = UE4.UGameplayStatics.GetGameState(TalkContext)
    LookedActor = GameState:GetTargetPoint(LookedInfo)
    if not IsValid(LookedActor) then
      local Message = string.format("Look at ready failed: LookedActor not found, ActorId: %s, TalkNodeId: %s", LookedInfo, TalkTaskData.TalkNodeId)
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
      return
    end
  end
  if LookedActor then
    if LookedActor == LookActor then
      self:ResetLookAt(LookActor)
    else
      self:SetLookAtAngles(LookActor)
      self:StartLookAt(LookActor, LookedActor, NotUsingSocket)
      self:RecordLookAt(TalkTask, LookActor)
    end
    if nil ~= CallBack then
      local AnimInstance = LookActor.Mesh:GetAnimInstance()
      AnimInstance.RotateEndEvent:Bind(AnimInstance, CallBack)
    end
    DebugPrint(UE4.UKismetSystemLibrary.GetDisplayName(LookActor) .. " look at " .. UE4.UKismetSystemLibrary.GetDisplayName(LookedActor))
  end
  return LookActor
end

function TalkActionManager_C:LookAtFinishImmediate(TalkTaskData, TalkTask, LookAtDescription, NotUsingSocket)
  local LookId, LookedInfo = LookAtDescription.LookId, LookAtDescription.LookedInfo
  local TalkContext = TalkTaskData.TalkContext
  local LookActorData = TalkContext:GetTalkActorData(TalkTask, LookId)
  local LookActor = LookActorData.TalkActor
  if not LookActor then
    return
  end
  local LookedActor
  if type(LookedInfo) == "number" then
    local LookedActorData = TalkContext:GetTalkActorData(TalkTask, LookedInfo)
    LookedActor = LookedActorData.TalkActor
  elseif type(LookedInfo) == "string" then
    local GameState = UE4.UGameplayStatics.GetGameState(TalkContext)
    LookedActor = GameState:GetTargetPoint(LookedInfo)
  end
  if LookedActor then
    if LookedActor == LookActor then
      self:ResetLookAtImmediate(LookActor)
    else
      self:SetLookAtAngles(LookActor)
      self:StartLookAtImmediate(LookActor, LookedActor, NotUsingSocket)
      self:RecordLookAt(TalkTask, LookActor)
    end
    DebugPrint(UE4.UKismetSystemLibrary.GetDisplayName(LookActor) .. " look at Immediate" .. UE4.UKismetSystemLibrary.GetDisplayName(LookedActor))
  end
end

function TalkActionManager_C:SetLookAtAngles(TalkActor)
  local AnimInstance = TalkActor.Mesh:GetAnimInstance()
  if IsValid(AnimInstance) == false then
    local Message = string.format("Set look at angles failed, AnimInstance is invalid, ActorName: %s", TalkActor:GetName())
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  AnimInstance.LookAtMaxX = 20
  AnimInstance.LookAtMinX = -20
  AnimInstance.LookAtMaxY = 20
  AnimInstance.LookAtMinY = -20
  AnimInstance.LookAtMaxZ = 45
  AnimInstance.LookAtMinZ = -45
end

function TalkActionManager_C:ResetLookAtImmediate(TalkActor)
  if TalkActor.Mesh and TalkActor.Mesh:GetAnimInstance() then
    local AnimInstance = TalkActor.Mesh:GetAnimInstance()
    if TalkActor.NPCAnimInstance and AnimInstance:Cast(UNPCAnimInstance) then
      AnimInstance:ResetNormalLookAtImmediate()
    else
      AnimInstance.bIsLookAt = false
    end
  else
    DebugPrint("error: TalkActionManager_C:ResetLookAt:TalkActor.Mesh or TalkActor.Mesh:GetAnimInstance() is nil")
  end
end

function TalkActionManager_C:ResetLookAt(TalkActor)
  if TalkActor.Mesh and TalkActor.Mesh:GetAnimInstance() then
    local AnimInstance = TalkActor.Mesh:GetAnimInstance()
    if TalkActor.NPCAnimInstance and AnimInstance:Cast(UNPCAnimInstance) then
      AnimInstance:ResetNormalLookAt()
    else
      AnimInstance.bIsLookAt = false
    end
  else
    DebugPrint("error: TalkActionManager_C:ResetLookAt:TalkActor.Mesh or TalkActor.Mesh:GetAnimInstance() is nil")
  end
end

function TalkActionManager_C:StartLookAt(TalkActor, TargetTalkActor, NotUsingSocket)
  if TalkActor.Mesh and TalkActor.Mesh:GetAnimInstance() then
    local AnimInstance = TalkActor.Mesh:GetAnimInstance()
    if TalkActor.NPCAnimInstance and AnimInstance:Cast(UNPCAnimInstance) then
      AnimInstance:SetLookAtActor(TargetTalkActor, "head", NotUsingSocket)
    end
  else
    DebugPrint("error: TalkActionManager_C:StartLookAt:TalkActor.Mesh or TalkActor.Mesh:GetAnimInstance() is nil")
  end
end

function TalkActionManager_C:StartLookAtImmediate(TalkActor, TargetTalkActor, NotUsingSocket)
  if TalkActor.Mesh and TalkActor.Mesh:GetAnimInstance() then
    local AnimInstance = TalkActor.Mesh:GetAnimInstance()
    if not AnimInstance.SetLookAtActorImmediate then
      return
    end
    AnimInstance:SetLookAtActorImmediate(TargetTalkActor, "head", NotUsingSocket)
  else
    DebugPrint("error: TalkActionManager_C:StartLookAt:TalkActor.Mesh or TalkActor.Mesh:GetAnimInstance() is nil")
  end
end

function TalkActionManager_C:SyncSetActorRotation(TalkTask, TalkContext, SetRotationDescription, Callback)
  DebugPrint("TalkActionManager_C:SyncSetActorRotation", SetRotationDescription, Callback)
  if not SetRotationDescription then
    return
  end
  local P1, P2, Type = SetRotationDescription.P1, SetRotationDescription.P2, SetRotationDescription.Type
  local CurrentActorId = P1
  local CurrentActor = TalkContext:GetTalkActorData(TalkTask, CurrentActorId).TalkActor
  local CurrentRotation = CurrentActor:K2_GetActorRotation()
  if "Degree" == Type then
    local RotDegree = P2
    CurrentActor:K2_SetActorRotation(CurrentRotation + FRotator(0, RotDegree, 0), false)
  elseif "Actor" == Type then
    local TargetActorId = P2
    local TargetActor = TalkContext:GetTalkActorData(TalkTask, TargetActorId).TalkActor
    if CurrentActor and TargetActor then
      local TargetLoc = TargetActor:K2_GetActorLocation()
      local CurrentLoc = CurrentActor:K2_GetActorLocation()
      local RotateYaw = UE4.UKismetMathLibrary.Conv_VectorToRotator(TargetLoc - CurrentLoc).Yaw
      local RealRotate = FRotator(CurrentRotation.Pitch, RotateYaw, CurrentRotation.Roll)
      DebugPrint("@@@myfd RotateYaw is ", RotateYaw)
      CurrentActor:K2_SetActorRotation(RealRotate, false)
    end
  end
  Callback()
end

function TalkActionManager_C:RotateToReady(TalkContext, TalkTask, TalkTaskData, RotateToDescription, MontageName, CallBack)
  if not RotateToDescription then
    return
  end
  local P1, P2, Type = RotateToDescription.P1, RotateToDescription.P2, RotateToDescription.Type
  if "Degree" == Type then
    return self:RotateToDegree(TalkContext, TalkTask, P1, P2, MontageName, CallBack)
  else
    return self:RotateToActorById(TalkContext, TalkTask, P1, P2, MontageName, CallBack)
  end
end

function TalkActionManager_C:RotateToDegree(TalkContext, TalkTask, SrcActorId, RotDegree, MontageName, CallBack)
  if not IsValid(TalkContext) then
    local Message = string.format("Rotate to degree failed: TalkContext is invalid, SrcActorId: %s, RotDegree: %s", SrcActorId, RotDegree)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local SrcActorData = TalkContext:GetTalkActorData(TalkTask, SrcActorId)
  if not SrcActorData then
    local Message = string.format("Rotate to degree failed: SrcActorData is nil, SrcActorId: %s, RotDegree: %s", SrcActorId, RotDegree)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local SrcActor = SrcActorData.TalkActor
  if not IsValid(SrcActor) then
    local Message = string.format("Rotate to degree failed: SrcActor is nil, SrcActorId: %s, RotDegree: %s", SrcActorId, RotDegree)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  self:RotateOffset(SrcActor, RotDegree, MontageName, CallBack, TalkTask, TalkTask.TalkTaskData)
  local Rotation = SrcActor:K2_GetActorRotation()
  return SrcActor, Rotation.Yaw + RotDegree, nil
end

function TalkActionManager_C:RotateToActorById(TalkContext, TalkTask, SrcActorId, DstActorId, MontageName, CallBack)
  if not IsValid(TalkContext) then
    local Message = string.format("Rotate to actor failed: TalkContext is invalid, SrcActorId: %s, DstActorId: %s", SrcActorId, DstActorId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local SrcActorData = TalkContext:GetTalkActorData(TalkTask, SrcActorId)
  if not SrcActorData then
    local Message = string.format("Rotate to actor failed: SrcActorData is nil, SrcActorId: %s, DstActorId: %s", SrcActorId, DstActorId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local SrcActor = SrcActorData.TalkActor
  if not IsValid(SrcActor) then
    local Message = string.format("Rotate to actor failed: SrcActor is nil, SrcActorId: %s, DstActorId: %s", SrcActorId, DstActorId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local DstActorData = TalkContext:GetTalkActorData(TalkTask, DstActorId)
  if not DstActorData then
    local Message = string.format("Rotate to actor failed: DstActorData is nil, SrcActorId: %s, DstActorId: %s", SrcActorId, DstActorId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local DstActor = DstActorData.TalkActor
  if not IsValid(DstActor) then
    local Message = string.format("Rotate to actor failed: DstActor is nil, SrcActorId: %s, DstActorId: %s", SrcActorId, DstActorId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  return self:RotateToActor(TalkTask, SrcActor, DstActor, MontageName, CallBack)
end

function TalkActionManager_C:RotateToActor(TalkTask, SrcActor, DstActor, MontageName, CallBack)
  if IsValid(SrcActor) == false then
    local Message = "Rotate to actor failed: SrcActor is invalid"
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  if IsValid(DstActor) == false then
    local Message = "Rotate to actor failed: DstActor is invalid"
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local SrcActorLoc = SrcActor:K2_GetActorLocation()
  local DstActorLoc = DstActor:K2_GetActorLocation()
  local LookAtDir = UE4.UKismetMathLibrary.GetDirectionUnitVector(SrcActorLoc, DstActorLoc)
  local LookAtRot = UE4.UKismetMathLibrary.Conv_VectorToRotator(LookAtDir)
  local SrcActorRot = SrcActor:K2_GetActorRotation()
  local DeltaRot = UE4.UKismetMathLibrary.NormalizedDeltaRotator(LookAtRot, SrcActorRot).Yaw
  local AnimInstance = SrcActor.Mesh and SrcActor.Mesh:GetAnimInstance()
  if IsValid(AnimInstance) then
    if SrcActor.TalkRotateToTimer then
      SrcActor:RemoveTimer(SrcActor.TalkRotateToTimer)
      SrcActor.TalkRotateToTimer = nil
    end
    SrcActor.TalkRotateToTimer = SrcActor:AddTimer(0.5, function()
      SrcActor.TalkRotateToTimer = nil
      self:StartLookAt(SrcActor, DstActor)
      self:RotateOffset(SrcActor, DeltaRot, MontageName, CallBack, TalkTask, TalkTask.TalkTaskData)
    end)
  else
    self:RotateOffset(SrcActor, DeltaRot, MontageName, CallBack, TalkTask, TalkTask.TalkTaskData)
  end
  return SrcActor, LookAtRot.Yaw, DstActor
end

function TalkActionManager_C:FinishRotateTo(TalkActor, TargetYaw, LookAtedActor)
  if not IsValid(TalkActor) then
    return
  end
  local Rotation = TalkActor:K2_EMGetActorRotation()
  Rotation.Yaw = TargetYaw or Rotation.Yaw
  TalkActor:K2_EMSetActorRotation(Rotation)
  if IsValid(LookAtedActor) then
    self:StartLookAtImmediate(TalkActor, LookAtedActor)
  end
  if TalkActor.TalkRotateToTimer then
    TalkActor:RemoveTimer(TalkActor.TalkRotateToTimer)
    TalkActor.TalkRotateToTimer = nil
  end
  if TalkActor.AbortRotation then
    TalkActor:AbortRotation()
    return
  end
  local AnimInstance = TalkActor.Mesh and TalkActor.Mesh:GetAnimInstance()
  if IsValid(AnimInstance) then
    AnimInstance:Montage_Stop(0.1, AnimInstance.TurnIPStandMontageInfo.Montage)
  end
end

function TalkActionManager_C:FreeTalkNpcRotateToPlayer(TalkTask, Npc, Callback)
  if not (-1 ~= TalkTask.TalkTaskData.BlendInTime and TalkTask.TalkTaskData.IsNPCTurnToPlayer) or Npc:IsA(ATalkInteractiveItem) then
    if Callback then
      Callback.Func(Callback.Obj)
    end
    return
  end
  assert(Npc:IsA(ANpcCharacter))
  Npc:PlayTalkGroupEndAnimation(function()
    self:RecordRotateTo(TalkTask, Npc)
    self:RotateToActor(TalkTask, Npc, TalkTask.Player, nil, Callback)
  end)
end

function TalkActionManager_C:FreeTalkPlayerRotateToNpc(TalkTask, Npc, Callback)
  if -1 == TalkTask.TalkTaskData.BlendInTime or not TalkTask.TalkTaskData.bIsPlayerTurnToNPC then
    if Callback then
      Callback.Func(Callback.Obj)
    end
  else
    self:RotateToActor(TalkTask, TalkTask.Player, Npc, nil, Callback)
  end
end

function TalkActionManager_C:RotateToActorNew(Key, NpcA, NpcB, Callback)
  if not NpcA or not NpcB then
    if Callback then
      Callback.Func(Callback.Obj)
    end
    return
  end
  DebugPrint("TalkActionManager_C:RotateToActorNew", Key, NpcA:GetName(), NpcB:GetName(), Callback)
  local LocA = NpcA:K2_GetActorLocation()
  local LocB = NpcB:K2_GetActorLocation()
  local LookAtDir = UE4.UKismetMathLibrary.GetDirectionUnitVector(LocA, LocB)
  local LookAtRot = UE4.UKismetMathLibrary.Conv_VectorToRotator(LookAtDir)
  local RotA = NpcA:K2_GetActorRotation()
  local DeltaRot = UE4.UKismetMathLibrary.NormalizedDeltaRotator(LookAtRot, RotA).Yaw
  local AnimInstance = NpcA.Mesh and NpcA.Mesh:GetAnimInstance()
  DebugPrint("TalkActionManager_C:RotateToActor", NpcA:GetName(), NpcB:GetName(), DeltaRot, AnimInstance)
  if AnimInstance then
    NpcA:AddTimer(0.5, function()
      self:StartLookAt(NpcA, NpcB)
      self:RotateOffsetNew(Key, NpcA, DeltaRot, Callback)
    end)
  else
    self:RotateOffsetNew(Key, NpcA, DeltaRot, Callback)
  end
end

function TalkActionManager_C:RotateOffsetNew(Key, Npc, RotDegree, Callback)
  local bHasExecuteCallback = false
  
  local function RealCallback()
    if bHasExecuteCallback then
      return
    end
    bHasExecuteCallback = true
    if Callback then
      Callback.Func(Callback.Obj)
    end
  end
  
  if not Npc then
    RealCallback()
    return
  end
  DebugPrint("TalkActionManager_C:RotateOffset", Npc:GetName(), RotDegree)
  local StoryPlayable = Npc:Cast(UStoryPlayableInterface)
  if not StoryPlayable then
    RealCallback()
    return
  end
  self:AddTimer(1.5, function()
    RealCallback()
  end)
  self.NpcRotateOffsetRecordMap[Key] = self.NpcRotateOffsetRecordMap[Key] or {}
  self.NpcRotateOffsetRecordMap[Key][StoryPlayable] = StoryPlayable
  StoryPlayable:RotateOffset(RotDegree, {
    StoryPlayable,
    function()
      RealCallback()
    end
  })
end

function TalkActionManager_C:FreeTalkNpcRotateRecover(Npc, TalkTask, TalkTaskData, Callback)
  local RecordMap
  if -1 ~= TalkTaskData.BlendOutTime then
    if -1 == TalkTaskData.BlendInTime then
      RecordMap = self.GlobalNpcRotateToRecord
    else
      RecordMap = self.NpcRotateToRecordMap[TalkTask]
    end
  else
    RecordMap = nil
  end
  if RecordMap then
    local TargetRot = RecordMap[Npc]
    if TargetRot then
      if Npc and IsValid(Npc.NPCAnimInstance) then
        Npc.NPCAnimInstance:StopLookAt()
      end
      self:RotateToTargetRotation(Npc, TargetRot, {
        Obj = Npc,
        Func = function()
          Npc:PlayDefaultAnimStartAnimation()
          if Callback then
            Callback()
          end
        end
      }, TalkTask, TalkTaskData)
    elseif Callback then
      Callback.Func(Callback.Obj)
    end
  end
  self.NpcRotateToRecordMap[TalkTask] = nil
end

function TalkActionManager_C:RotateToTargetRotation(TalkActor, TargetRot, Callback, TalkTask, TalkTaskData)
  local ActiveTalkActorRot = TalkActor:K2_GetActorRotation()
  local DeltaRot = UE4.UKismetMathLibrary.NormalizedDeltaRotator(TargetRot, ActiveTalkActorRot).Yaw
  DebugPrint("TalkActionManager_C:RotateToTargetRotation", TalkActor:GetName(), DeltaRot)
  self:RotateOffset(TalkActor, DeltaRot, nil, Callback, TalkTask, TalkTaskData)
end

function TalkActionManager_C:RotateOffset(ActiveTalkActor, RotDegree, MontageName, Callback, TalkTask, TalkTaskData)
  local bHasExecuteCallback = false
  
  local function RealCallback()
    if bHasExecuteCallback then
      return
    end
    bHasExecuteCallback = true
    if Callback then
      Callback.Func(Callback.Obj)
    end
  end
  
  if not ActiveTalkActor or not TalkTask then
    RealCallback()
    return
  end
  DebugPrint("TalkActionManager_C:RotateOffset", ActiveTalkActor:GetName(), RotDegree, MontageName)
  local StoryPlayable = ActiveTalkActor:Cast(UStoryPlayableInterface)
  if not StoryPlayable then
    RealCallback()
    return
  end
  TalkTask.TalkContext.TalkTimerManager:AddTimer(TalkTask, 4, false, nil, nil, RealCallback)
  self.NpcRotateOffsetRecordMap[TalkTask] = self.NpcRotateOffsetRecordMap[TalkTask] or {}
  self.NpcRotateOffsetRecordMap[TalkTask][StoryPlayable] = StoryPlayable
  StoryPlayable:RotateOffset(RotDegree, {
    StoryPlayable,
    function()
      RealCallback()
    end
  }, MontageName)
end

return TalkActionManager_C
