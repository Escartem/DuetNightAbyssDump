require("UnLua")
local BP_PenalizeInteractiveComponent_C = Class({
  "BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C",
  "BluePrints.Common.TimerMgr"
})

function BP_PenalizeInteractiveComponent_C:InitInteractiveComponent(InteractiveId)
end

function BP_PenalizeInteractiveComponent_C:IsCanInteractive(PlayerActor)
  local Owner = self:GetOwner()
  self.CanBePenalize = Owner:GetEnableBeCondemned()
  if self:GetInteractiveName() ~= "" and self.DistanceCheckComponent(self, PlayerActor, self.InteractiveDistance, false) and self.CFaceToACheckComponent(self, PlayerActor, self.InteractiveFaceAngle, false) and self.AFaceToCCheckComponent(PlayerActor, self, self.InteractiveAngle, false) and self.CanBePenalize then
    return true
  end
  return false
end

function BP_PenalizeInteractiveComponent_C:IsForbidden(PlayerActor)
  return not self:CheckInteractiveSucc(PlayerActor.Eid)
end

function BP_PenalizeInteractiveComponent_C:OnClicked_Forbidden()
  self:InteractiveFailed()
end

function BP_PenalizeInteractiveComponent_C:CheckInteractiveSucc(PlayerEid)
  local ConditionCheck = BP_PenalizeInteractiveComponent_C.Super.CheckInteractiveSucc(self, PlayerEid)
  local Player = Battle(self):GetEntity(PlayerEid)
  local TagCheck = self:CheckPlayerTag(Player)
  return ConditionCheck and TagCheck
end

function BP_PenalizeInteractiveComponent_C:StartInteractive(PlayerActor)
  if not self.bEnter then
    return
  end
  self.CanEnd = true
  if self:IsCanInteractive(PlayerActor) and not PlayerActor.WaitCallBack then
    local Owner = self:GetOwner()
    PlayerActor:InteractiveMechanism(Owner.Eid, PlayerActor.Eid, self.NextStateId, self.CommonUIConfirmID, true)
  end
end

function BP_PenalizeInteractiveComponent_C:BtnPressed(PlayerActor)
  self:StartInteractive(PlayerActor)
end

function BP_PenalizeInteractiveComponent_C:BtnReleased(PlayerActor, InPressTimeSeconds)
  self:EndPressInteractive(PlayerActor, true)
end

function BP_PenalizeInteractiveComponent_C:EndInteractive(PlayerActor, ReasonId)
  local Owner = self:GetOwner()
  if Owner and Owner.InteractiveType == Const.ClickInteractive then
    PlayerActor:DeInteractiveMechanism(Owner.Eid, PlayerActor.Eid, ReasonId, true, nil, true)
  end
end

function BP_PenalizeInteractiveComponent_C:BtnClicked(PlayerActor, InPressTimeSeconds)
end

function BP_PenalizeInteractiveComponent_C:EndPressInteractive(PlayerActor, IsSuccess, ReasonId)
  local Owner = self:GetOwner()
  if IsSuccess then
    self.CanEnd = false
  end
  if Owner and Owner.InteractiveType == Const.PressInteractive then
    PlayerActor:DeInteractiveMechanism(Owner.Eid, PlayerActor.Eid, ReasonId, IsSuccess, nil, true)
    self:RemoveTimer(self.Handle)
    self.Handle = nil
  end
end

function BP_PenalizeInteractiveComponent_C:ForceEndInteractive(PlayerActor, IsSuccess, ReasonId)
  local Owner = self:GetOwner()
  if Owner.InteractiveType == Const.ClickInteractive then
    self:EndInteractive(PlayerActor, ReasonId)
  else
    self:EndPressInteractive(PlayerActor, IsSuccess, ReasonId)
  end
end

function BP_PenalizeInteractiveComponent_C:DisplayInteractiveBtn(PlayerActor)
  if self:GetOwner().AutoSyncProp and self:GetOwner().AutoSyncProp.CharacterTag == "Defeated" then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local UIManager = GameInstance:GetGameUIManager()
    local DefeatedUI = UIManager:GetUIObj("DefeatedInteract")
    if DefeatedUI then
      DefeatedUI:ChangeUIDefeatedState(true)
      self:SetBtnDisplayed(PlayerActor, true)
    end
  end
  self.IsDisPlayBtn = true
end

function BP_PenalizeInteractiveComponent_C:NotDisplayInteractiveBtn(PlayerActor)
  self:SetBtnDisplayed(PlayerActor, false)
  self.IsDisPlayBtn = false
end

function BP_PenalizeInteractiveComponent_C:IsLastingInteract()
  if self.InteractiveTime > 0 then
    return true
  end
  local Owner = self:GetOwner()
  if Owner and Owner.InteractiveType == Const.PressInteractive then
    return true
  end
  return false
end

return BP_PenalizeInteractiveComponent_C
