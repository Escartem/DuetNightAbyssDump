require("UnLua")
local M = Class("BluePrints.Item.Chest.BP_MechanismBase_C")

function M:ReceiveBeginPlay()
  self.bHasInit = false
  if self.EMNavModifierComponent then
    self.EMNavModifierComponent:K2_DestroyComponent(self.EMNavModifierComponent)
  end
  self:SetActorTickInterval(0.5)
  self:SetActorTickEnabled(false)
  self:AddTimer(math.random(), function()
    self:SetActorTickEnabled(true)
  end)
end

function M:ReceiveTick(DeltaSeconds)
  if self.bHasInit then
    local ActiveGuideRes = self:IsCanActiveGuide(self.ActivePlayer)
    self:UpdateActiveGuide(ActiveGuideRes)
  end
end

function M:ReceiveEndPlay()
end

function M:OnInteractiveTriggerEnter(PlayerActor)
end

function M:OnInteractiveTriggerTick(PlayerActor)
end

function M:OnInteractiveTriggerExit(PlayerActor)
end

function M:ClientInitInfo(Info)
  self.bHasInit = true
  self.CanOpen = true
  self.ChestInteractiveComponent.OnInteractiveTriggerEnter:Add(self, self.OnInteractiveTriggerEnter)
  self.ChestInteractiveComponent.OnInteractiveTriggerTick:Add(self, self.OnInteractiveTriggerTick)
  self.ChestInteractiveComponent.OnInteractiveTriggerExit:Add(self, self.OnInteractiveTriggerExit)
  local ChestInfo = DataMgr.Mechanism[self.UnitId]
  self.TalkTriggerId = ChestInfo.UnitParams.TalkTriggerId
  self.IsActiveGuide = true
  self.ActivePlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  self:CreateAndAddGuideIconComponent()
  if IsValid(self.GuideIconComponent) and self:CheckActivePlayer() then
    self.GuideIconComponent:InitGuide(self, nil, self.ActivePlayer, ChestInfo.GuideIconBPPath, UE4.FVector2D(0.45, 0.45), nil, "TalkMechanism", "Guide")
    self.GuideIconComponent:InitAccessibility()
    self:UpdateActiveGuide(self:IsCanActiveGuide())
  end
end

function M:GetCanOpen(PlayerActorEid)
  local PlayerActor = Battle(self):GetEntity(PlayerActorEid)
  self.CanOpen = not PlayerActor:IsSeating()
end

function M:OpenMechanism(PlayerActorEid)
  if self:CheckActivePlayer() then
    self.GuideIconComponent:SetAccessibility(true)
    local GameInstance = GWorld.GameInstance
    local TalkContext = GameInstance:GetTalkContext()
    local PlayerActor = Battle(self):GetEntity(PlayerActorEid)
    if GWorld.StoryMgr:ExistedNPCInteractiveTalk(self.UnitId) then
      GWorld.StoryMgr:TryExecNPCInteractiveTalk(self.UnitId, self)
    else
      TalkContext:StartTalk(self.TalkTriggerId, nil, nil, PlayerActor, self, nil)
    end
  end
end

function M:CloseMechanism(PlayerId)
  self:CreateReward()
end

function M:IsCanActiveGuide()
  if self:CheckActivePlayer() then
    return self.ChestInteractiveComponent.DistanceCheck(self, self.ActivePlayer, self.DiscoveryDistance)
  end
  return false
end

function M:CheckActivePlayer()
  if not self.ActivePlayer then
    self.ActivePlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    if not self.ActivePlayer then
      return false
    end
  end
  return true
end

function M:UpdateActiveGuide(ActiveGuideRes)
  if true == ActiveGuideRes then
    self.GuideIconComponent:SetWidgetHiddenByTag(false, "TalkMechanism")
  elseif false == ActiveGuideRes then
    self.GuideIconComponent:SetWidgetHiddenByTag(true, "TalkMechanism")
  end
end

return M
