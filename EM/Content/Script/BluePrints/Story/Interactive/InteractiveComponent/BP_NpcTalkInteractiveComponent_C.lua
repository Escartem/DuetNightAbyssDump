require("UnLua")
require("DataMgr")
local BP_NpcTalkInteractiveComponent_C = Class("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local DailyTalkController = require("BluePrints.UI.WBP.DailyTalk.DailyTalkController")
local StoryInteractiveController = require("BluePrints.UI.WBP.StoryInteractive.StoryInteractiveController")
local StoryInterActiveModel = require("BluePrints.UI.WBP.StoryInteractive.StoryInteractiveModel")
local ETalkInteractiveState = {
  None = "None",
  InteractiveTalk = "InteractiveTalk",
  BubbleTalk = "BubbleTalk",
  InvitateBubble = "InvitateBubble"
}

function BP_NpcTalkInteractiveComponent_C:ReceiveBeginPlay()
  self.InteractiveTag = "Interactive"
  self.Super.ReceiveBeginPlay(self)
  self.Owner = self:GetOwner()
  self.EmptyUI = nil
  self.PlayerActor = nil
  self.TalkTriggerId = nil
  self.BubbleTalkTriggerId = 0
  self.InvitateBubbleTriggerId = 0
  self.InvitateBubbleDisplayDistance = nil
  local InvitateBubbleDistance = DataMgr.GlobalConstant.InvitateBubbleDisplayDistance
  if InvitateBubbleDistance and InvitateBubbleDistance.ConstantValue then
    self.InvitateBubbleDisplayDistance = InvitateBubbleDistance.ConstantValue
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    local InteractiveTriggerComponent = PlayerCharacter and PlayerCharacter.InteractiveTriggerComponent
    if InteractiveTriggerComponent:GetInteractiveTriggerDistance() < self.InvitateBubbleDisplayDistance then
      UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\233\148\153\232\175\175\231\154\132\231\156\139\230\157\191\229\168\152\229\133\179\232\129\148\229\134\146\230\179\161\232\140\131\229\155\180", string.format("\229\133\168\229\177\128\229\143\152\233\135\143\232\161\168\231\156\139\230\157\191\229\168\152\229\133\179\232\129\148\229\134\146\230\179\161\232\183\157\231\166\187( %f )\229\176\143\228\186\142\228\184\187\232\167\146\232\167\166\229\143\145\229\175\185\232\175\157\232\183\157\231\166\187 ( %f )", self.InvitateBubbleDisplayDistance, InteractiveTriggerComponent:GetInteractiveTriggerDistance()))
    end
  end
  self.bIsInit = false
  self.bIsEnd = false
  self.bIsHeadWidgetDisplayed = false
  self.bIsNameDisplayed = false
  self.bIsBubbleDisplayed = false
  self.bIsInvitateBubbleDisplayed = false
  self.bAllowShowName = true
  self.bCannotActive = false
  self.bNeedCheckNpcMap = true
  self.TalkState = ETalkInteractiveState.None
  self.NPCLookAtDistance = 200
  self.NPCLookAtAngle = 45
  self.NPCLookAtTarget = nil
end

function BP_NpcTalkInteractiveComponent_C:InitDailyTalk()
  DailyTalkController:RegisterDailyTalkNpc(self.Owner.NpcId, self)
end

function BP_NpcTalkInteractiveComponent_C:DeInitDailyTalk()
  DailyTalkController:RegisterDailyTalkNpc(self.Owner.NpcId, nil)
end

function BP_NpcTalkInteractiveComponent_C:ReceiveEndPlay()
  DebugPrint("BP_NpcTalkInteractiveComponent_C:ReceiveEndPlay", self.Owner and self.Owner:GetName())
  self.bIsEnd = true
  if self:IsInInteractive() then
    self:TryExitInterativeTalkState()
  end
  self:DeInitDailyTalk()
end

function BP_NpcTalkInteractiveComponent_C:DisableNameDisplay()
  self.bAllowShowName = false
end

function BP_NpcTalkInteractiveComponent_C:Init()
  self.bIsInit = true
  if DailyTalkController:GetModel():CheckHasDailyTalkReward(self.Owner and self.Owner.NpcId) then
    self:InitDailyTalk()
  end
end

function BP_NpcTalkInteractiveComponent_C:GetDisplayName()
  return StoryInterActiveModel:GetInteractiveName(self.Owner.NpcId)
end

function BP_NpcTalkInteractiveComponent_C:RefreshInteractiveName()
  local InteractiveName = self:GetDisplayName()
  if self.InteractiveName == InteractiveName then
    return
  end
  self:SetInteractiveName(InteractiveName)
end

function BP_NpcTalkInteractiveComponent_C:TriggerEnter(PlayerActor)
  if not self:CheckSelfCanInteractive() then
    return
  end
  if self.bIsInit == false or self.bCannotActive then
    return
  end
  self.Overridden.TriggerEnter(self, PlayerActor)
end

function BP_NpcTalkInteractiveComponent_C:CheckSelfCanInteractive()
  local GameState = UE4.URuntimeCommonFunctionLibrary.GetCurrentGameState(self)
  if not GameState then
    return false
  end
  local NpcCharacterMap = GameState.NpcCharacterMap
  local Npc = NpcCharacterMap:FindRef(self.Owner.NpcId)
  if not IsValid(Npc) then
    return false
  end
  return true
end

function BP_NpcTalkInteractiveComponent_C:TriggerTick(PlayerActor)
  if not self:CheckSelfCanInteractive() then
    self.Overridden.TriggerTick(self, PlayerActor)
    return
  end
  if self.bIsInit == false or self.bCannotActive then
    self.Overridden.TriggerTick(self, PlayerActor)
    return
  end
  local GameInstance = GWorld.GameInstance
  local TalkContext = GameInstance:GetTalkContext()
  local NpcData = self:GetNpcCharData(self.Owner.UnitType, self.Owner.UnitId)
  self:RefreshInteractiveName()
  if NpcData and NpcData.RelatedBubble then
    self.BubbleTalkTriggerId = TalkContext:GetValidTalkTriggerId(NpcData.RelatedBubble)
  else
    self.BubbleTalkTriggerId = nil
  end
  if NpcData and NpcData.RelatedInvitationBubble then
    self.InvitateBubbleTriggerId = TalkContext:GetValidTalkTriggerId(NpcData.RelatedInvitationBubble)
  else
    self.InvitateBubbleTriggerId = nil
  end
  self.Overridden.TriggerTick(self, PlayerActor)
  if self.Owner then
    local bDisplayNameRes = self:IsCanDisplayName(PlayerActor)
    self:UpdateDisplayName(PlayerActor, bDisplayNameRes)
    self:UpdateState(PlayerActor)
    if self.Owner.bNPCDefaultLookAt then
      local IsInLookAtRange = self.DistanceCheck(self.Owner, PlayerActor, self.NPCLookAtDistance) and self.AngleCheck(self.Owner, PlayerActor, self.NPCLookAtAngle)
      self:EnableLookAt(PlayerActor, IsInLookAtRange)
    end
  end
end

function BP_NpcTalkInteractiveComponent_C:GetNpcCharData(InType, InUnitId)
  return DataMgr[InType][InUnitId]
end

function BP_NpcTalkInteractiveComponent_C:EnableLookAt(PlayerActor, EnableLookAtState)
  if not self.Owner or not self.Owner.NpcAnimInstance then
    return
  end
  if self.NPCLookAtTarget and false == EnableLookAtState then
    self.Owner.NpcAnimInstance:ResetNormalLookAt()
    self.NPCLookAtTarget = nil
  elseif self.NPCLookAtTarget == nil and true == EnableLookAtState then
    self.Owner.NpcAnimInstance:SetLookAtActor(PlayerActor, "head")
    self.NPCLookAtTarget = PlayerActor
  end
end

function BP_NpcTalkInteractiveComponent_C:TriggerExit(PlayerActor)
  if self.bIsInit == false then
    return
  end
  self.Overridden.TriggerExit(self, PlayerActor)
  self:NotDisplayName(PlayerActor)
  if self.TalkState ~= ETalkInteractiveState.InteractiveTalk then
    self:ExitCurrentState(PlayerActor)
  end
  if not PlayerActor:CheckCanInteractiveTrigger() then
    self:NotDisplayHeadWidget(PlayerActor)
  end
end

function BP_NpcTalkInteractiveComponent_C:BtnPressed(PlayerActor)
  if self:IsForbidden() then
    return
  end
  self:SwitchState(ETalkInteractiveState.InteractiveTalk, PlayerActor)
end

function BP_NpcTalkInteractiveComponent_C:IsCanInteractive(PlayerActor)
  local Owner = self.Owner
  local NPCAnimInstance = Owner.NPCAnimInstance
  local bIsRotating = NPCAnimInstance and NPCAnimInstance.IsRotating
  return self.bIsInit and not PlayerActor:IsSeating() and self.NpcState ~= "Hide" and self.DistanceCheck(self.Owner, PlayerActor, self.InteractiveDistance) and self.BFaceToACheck(self.Owner, PlayerActor, self.InteractiveFaceAngle) and StoryInterActiveModel:HasAnyInteractive(self.Owner.NpcId) and not self.Owner.bHidden and not bIsRotating
end

function BP_NpcTalkInteractiveComponent_C:CheckForbiddenBySpecialQuest()
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar.InSpecialQuest and StoryInterActiveModel:IsForbidBySpecialQuest(self.Owner.NpcId) then
    return true
  end
  return false
end

function BP_NpcTalkInteractiveComponent_C:IsForbidden()
  if self.bCannotActive then
    return true
  end
  if self:CheckForbiddenBySpecialQuest() then
    self:SetOverridenFailMsg("QUEST_INSPECIALQUEST_MSG")
    return true
  else
    self:SetOverridenFailMsg()
  end
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if IsValid(PlayerCharacter) then
    return not self:CheckInteractiveSucc(PlayerCharacter.Eid)
  else
    return true
  end
end

function BP_NpcTalkInteractiveComponent_C:OnClicked_Forbidden()
  self:InteractiveFailed()
end

function BP_NpcTalkInteractiveComponent_C:SetNpcTalkActive(bActive)
  self.bCannotActive = not bActive
end

function BP_NpcTalkInteractiveComponent_C:RefreshTalkTriggerId()
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  local NpcData = self:GetNpcCharData(self.Owner.UnitType, self.Owner.UnitId)
  if NpcData and NpcData.RelatedTalks then
    self.TalkTriggerId = TalkContext:GetValidTalkTriggerId(NpcData.RelatedTalks)
  else
    self.TalkTriggerId = nil
  end
end

function BP_NpcTalkInteractiveComponent_C:GetQuestID()
  return StoryInterActiveModel:GetNowInteractiveQuestChainId(self.Owner.NpcId)
end

function BP_NpcTalkInteractiveComponent_C:GetSpecialQuestID()
  return StoryInterActiveModel:GetNowInteractiveSpecialQuestId(self.Owner.NpcId)
end

function BP_NpcTalkInteractiveComponent_C:StartInteractive(PlayerActor)
  DebugPrint("BP_NpcTalkInteractiveComponent_C:StartInteractive")
  PlayerActor:AddForbidTag("TalkInteractive")
  PlayerActor:SetCharacterTag("Idle")
  PlayerActor:StopSlide()
  PlayerActor:SetCharacterTag(self.InteractiveTag)
  PlayerActor:SetCanInteractiveTrigger(false, "TalkInteractive")
  self.bIsInInteractive = true
  self.PlayerActor = PlayerActor
  local GameInstance = GWorld.GameInstance
  local TalkContext = GameInstance:GetTalkContext()
  TalkContext:RegisterInteractiveActor(self.Owner)
  StoryInteractiveController:TryStartInteractive(self.Owner.NpcId, self.Owner, PlayerActor, {
    Obj = self,
    Func = self.TryExitInterativeTalkState
  })
end

function BP_NpcTalkInteractiveComponent_C:EndInteractive()
  DebugPrint("BP_NpcTalkInteractiveComponent_C:EndInteractive", self:IsInInteractive())
  TalkUtils:RemovePlayerInvincible()
  if not self:IsInInteractive() then
    return
  end
  self.PlayerActor:MinusForbidTag("TalkInteractive")
  self.PlayerActor:SetCharacterTag("Idle")
  self.PlayerActor:SetCanInteractiveTrigger(true, "TalkInteractive")
  self.bIsInInteractive = false
  self.PlayerActor = nil
  local TalkContext = GWorld.GameInstance:GetTalkContext()
  TalkContext:UnregisterInteractiveActor()
end

function BP_NpcTalkInteractiveComponent_C:IsInInteractive()
  return self.bIsInInteractive
end

function BP_NpcTalkInteractiveComponent_C:CheckInteractiveSucc(PlayerEid)
  local ConditionCheck = self.Super.CheckInteractiveSucc(self, PlayerEid)
  local Player = Battle(self):GetEntity(PlayerEid)
  local TagCheck = self:CheckPlayerTag(Player)
  return ConditionCheck and TagCheck
end

function BP_NpcTalkInteractiveComponent_C:UpdateDisplayHeadWidget(PlayerActor, bDisplayHeadWidgetRes)
  if bDisplayHeadWidgetRes then
    self:DisplayHeadWidget(PlayerActor)
  else
    self:NotDisplayHeadWidget(PlayerActor)
  end
end

function BP_NpcTalkInteractiveComponent_C:DisplayHeadWidget(PlayerActor)
  local HeadUISubsystem = UNpcHeadUISubsystem.GetHeadUISubsystem(self)
  if HeadUISubsystem then
  end
end

function BP_NpcTalkInteractiveComponent_C:RefreshHeadWidget(PlayerActor)
end

function BP_NpcTalkInteractiveComponent_C:NotDisplayHeadWidget(PlayerActor)
  local HeadUISubsystem = UNpcHeadUISubsystem.GetHeadUISubsystem(self)
  if not HeadUISubsystem or false then
  end
end

function BP_NpcTalkInteractiveComponent_C:IsCanDisplayName(PlayerActor)
  return self.bAllowShowName and self.bIsInit and self.DistanceCheck(self.Owner, PlayerActor, self.NameDisplayDistance)
end

function BP_NpcTalkInteractiveComponent_C:UpdateDisplayName(PlayerActor, bDisplayName)
  if bDisplayName and self.bIsNameDisplayed == false then
    self:DisplayName(PlayerActor)
  elseif false == bDisplayName and self.bIsNameDisplayed then
    self:NotDisplayName(PlayerActor)
  end
end

function BP_NpcTalkInteractiveComponent_C:DisplayName(PlayerActor)
  if self.DisplayInteractiveName == "" or self.bIsNameDisplayed then
    return
  end
  self.bIsNameDisplayed = true
  self.Owner:EnableNameWidget(true)
end

function BP_NpcTalkInteractiveComponent_C:NotDisplayName(PlayerActor)
  if self.bIsNameDisplayed == false then
    return
  end
  self.bIsNameDisplayed = false
  self.Owner:EnableNameWidget(false)
end

function BP_NpcTalkInteractiveComponent_C:IsCanDisplayBubble(PlayerActor)
  return self.bIsInit and not self.bIsEnd and self.BubbleTalkTriggerId ~= nil and self.DistanceCheck(self.Owner, PlayerActor, self.BubbleDisplayDistance) and not self.Owner.bHidden
end

function BP_NpcTalkInteractiveComponent_C:DisplayBubble(PlayerActor)
  if self.bIsBubbleDisplayed then
    return
  end
  self.bIsBubbleDisplayed = true
  local GameInstance = GWorld.GameInstance
  local TalkContext = GameInstance:GetTalkContext()
  self.BubbleTalkKey = TalkContext:StartTalk(self.BubbleTalkTriggerId, nil, nil, PlayerActor, self:GetOwner(), {
    Func = self.NotDisplayBubble,
    Obj = self
  })
end

function BP_NpcTalkInteractiveComponent_C:NotDisplayBubble(PlayerActor)
  if self.bIsBubbleDisplayed == false then
    return
  end
  if self:IsCanDisplayBubble(PlayerActor) then
    return
  end
  self.bIsBubbleDisplayed = false
  local TS = TalkSubsystem()
  if TS then
    TS:ForceInterruptTalkTaskData(function(TalkTaskData)
      return TalkTaskData.FilePath == self.BubbleTalkKey
    end)
  end
  self.BubbleTalkKey = nil
end

function BP_NpcTalkInteractiveComponent_C:IsCanDisplayInvitateBubble(PlayerActor)
  local TS = TalkSubsystem()
  return self.bIsInit and not self.bIsEnd and self.InvitateBubbleTriggerId ~= nil and (nil == self.InvitateBubbleDisplayDistance or self.DistanceCheck(self.Owner, PlayerActor, self.InvitateBubbleDisplayDistance)) and TS and TS:CheckCanTriggerInvitateBubbleTalk(self.Owner.NpcId)
end

function BP_NpcTalkInteractiveComponent_C:DisplayInvitateBubble(PlayerActor)
  if self.bIsInvitateBubbleDisplayed then
    return
  end
  self.bIsInvitateBubbleDisplayed = true
  local TS = TalkSubsystem()
  local NpcId = self.Owner.NpcId
  
  local function OnTriggerSucces()
    local GameInstance = GWorld.GameInstance
    local TalkContext = GameInstance:GetTalkContext()
    self.InvitateBubbleTalkKey = TalkContext:StartTalk(self.InvitateBubbleTriggerId, nil, nil, PlayerActor, self:GetOwner(), {
      Func = self.TryExitInvitateBubbleState,
      Obj = self
    })
  end
  
  local function OnTriggerFailed()
    self:TryExitInvitateBubbleState(PlayerActor)
  end
  
  if TS and TS:TryTriggerInvitateBubbleTalk(NpcId, OnTriggerSucces, OnTriggerFailed) then
  else
    OnTriggerFailed()
  end
end

function BP_NpcTalkInteractiveComponent_C:TryExitInvitateBubbleState(PlayerActor)
  if self.TalkState ~= ETalkInteractiveState.InvitateBubble then
    return
  end
  self:ExitCurrentState(PlayerActor)
end

function BP_NpcTalkInteractiveComponent_C:TryExitInterativeTalkState()
  if self.TalkState ~= ETalkInteractiveState.InteractiveTalk then
    return
  end
  self:ExitCurrentState()
end

function BP_NpcTalkInteractiveComponent_C:NotDisplayInvitateBubble(PlayerActor)
  if not self.bIsInvitateBubbleDisplayed then
    return
  end
  if self:IsCanDisplayInvitateBubble(PlayerActor) then
    return
  end
  self.bIsInvitateBubbleDisplayed = false
  local TS = TalkSubsystem()
  if TS then
    TS:TryEndInvitateBubbleTalk(self.Owner.NpcId)
    local InvitateBubbleTalkKey = self.InvitateBubbleTalkKey
    self.InvitateBubbleTalkKey = nil
    if InvitateBubbleTalkKey then
      TS:ForceInterruptTalkTaskData(function(TalkTaskData)
        return TalkTaskData.FilePath == InvitateBubbleTalkKey
      end)
    end
  end
end

function BP_NpcTalkInteractiveComponent_C:ExitCurrentState(PlayerActor)
  local TalkState = self.TalkState
  self.TalkState = ETalkInteractiveState.None
  if TalkState == ETalkInteractiveState.InvitateBubble then
    self:NotDisplayInvitateBubble(PlayerActor)
  elseif TalkState == ETalkInteractiveState.BubbleTalk then
    self:NotDisplayBubble(PlayerActor)
  elseif TalkState == ETalkInteractiveState.InteractiveTalk then
    self:EndInteractive()
  end
end

function BP_NpcTalkInteractiveComponent_C:EnterState(State, PlayerActor)
  if self.TalkState == State then
    return
  end
  self.TalkState = State
  if State == ETalkInteractiveState.InvitateBubble then
    self:DisplayInvitateBubble(self.PlayerActor)
  elseif State == ETalkInteractiveState.BubbleTalk then
    self:DisplayBubble(self.PlayerActor)
  elseif State == ETalkInteractiveState.InteractiveTalk then
    self:StartInteractive(PlayerActor)
  end
end

function BP_NpcTalkInteractiveComponent_C:SwitchState(State, PlayerActor)
  self:ExitCurrentState(PlayerActor)
  self:EnterState(State, PlayerActor)
end

function BP_NpcTalkInteractiveComponent_C:CanEnterState(State)
  if State == self.TalkState then
    return false
  end
  local bCanExit = true
  if self.TalkState == ETalkInteractiveState.InteractiveTalk then
    bCanExit = false
  elseif State == ETalkInteractiveState.InteractiveTalk then
    bCanExit = true
  elseif self.TalkState == ETalkInteractiveState.InvitateBubble then
    if self.InvitateBubbleTalkKey then
      bCanExit = false
    else
      bCanExit = true
    end
  elseif self.TalkState == ETalkInteractiveState.BubbleTalk then
    if self.bIsBubbleDisplayed then
      bCanExit = false
    else
      bCanExit = true
    end
  end
  return bCanExit
end

function BP_NpcTalkInteractiveComponent_C:UpdateState(PlayerActor)
  if self.TalkState == ETalkInteractiveState.BubbleTalk and not self:IsCanDisplayBubble(PlayerActor) then
    self:ExitCurrentState(PlayerActor)
  end
  if self.TalkState == ETalkInteractiveState.InvitateBubble and not self:IsCanDisplayInvitateBubble(PlayerActor) then
    self:ExitCurrentState(PlayerActor)
  end
  if self:CanEnterState(ETalkInteractiveState.BubbleTalk) and self:IsCanDisplayBubble(PlayerActor) then
    self:SwitchState(ETalkInteractiveState.BubbleTalk, PlayerActor)
  end
  if self:CanEnterState(ETalkInteractiveState.InvitateBubble) and self:IsCanDisplayInvitateBubble(PlayerActor) then
    self:SwitchState(ETalkInteractiveState.InvitateBubble, PlayerActor)
  end
end

return BP_NpcTalkInteractiveComponent_C
