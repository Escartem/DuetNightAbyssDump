local FSetSequenceActorsIgnorePauseComponent = {}

function FSetSequenceActorsIgnorePauseComponent:New(TalkContext, TalkTaskData)
  local Obj = setmetatable({}, {__index = FSetSequenceActorsIgnorePauseComponent})
  Obj.TalkContext = TalkContext
  Obj.TalkTaskData = TalkTaskData
  return Obj
end

function FSetSequenceActorsIgnorePauseComponent:Execute()
  self:SetPlayerIgnorePause(true)
  self:SetCreateActorsIgnorePause(true)
  self:SetActorsInSequenceImmunePause(true)
end

function FSetSequenceActorsIgnorePauseComponent:Resume()
  self:SetPlayerIgnorePause(false)
  self:SetCreateActorsIgnorePause(false)
  self:SetActorsInSequenceImmunePause(false)
end

function FSetSequenceActorsIgnorePauseComponent:SetPlayerIgnorePause(bIgnore)
  local PC = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  local PlayerChar = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if bIgnore then
    if PC then
      self.CachedShouldPerformFullTick = PC.bShouldPerformFullTickWhenPaused
      PC.bShouldPerformFullTickWhenPaused = true
    end
    if PlayerChar then
      local TS = TalkSubsystem()
      if TS then
        TS:SetActorIgnorePause(PlayerChar)
      end
    end
  elseif PC then
    if self.CachedShouldPerformFullTick ~= nil then
      PC.bShouldPerformFullTickWhenPaused = self.CachedShouldPerformFullTick
    else
      PC.bShouldPerformFullTickWhenPaused = true
    end
  end
end

function FSetSequenceActorsIgnorePauseComponent:SetCreateActorsIgnorePause(bIgnore)
  local Datas = self.TalkTaskData.CreateTalkActors
  for _, TalkActorData in pairs(Datas or {}) do
    local ActorData = self.TalkContext.TalkActorDatas[TalkActorData.TalkActorId]
    local Actor = ActorData and ActorData.TalkActor
    local TS = TalkSubsystem()
    if Actor and TS then
      TS:SetActorIgnorePause(Actor)
    end
  end
end

function FSetSequenceActorsIgnorePauseComponent:SetActorsInSequenceImmunePause(bIgnore)
  local SA = self.TalkTaskData.SequenceActor
  local SP = self.TalkTaskData.SequencePlayer
  if not SA or not SP then
    return
  end
  local TS = TalkSubsystem()
  if IsValid(TS) then
    TS:SetSequenceIgnorePause(bIgnore, SA, SP)
  end
end

return FSetSequenceActorsIgnorePauseComponent
