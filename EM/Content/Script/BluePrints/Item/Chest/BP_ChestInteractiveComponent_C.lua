require("UnLua")
local BP_ChestInteractiveComponent_C = Class({
  "BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C",
  "BluePrints.Common.TimerMgr"
})
local BP_InteractiveBaseComponent_C = require("BluePrints.Story.Interactive.InteractiveComponent.BP_InteractiveBaseComponent_C")

function BP_ChestInteractiveComponent_C:TriggerEnter(PlayerActor)
  self.Overridden.TriggerEnter(self, PlayerActor)
  self.OnInteractiveTriggerEnter:Broadcast(PlayerActor)
end

function BP_ChestInteractiveComponent_C:TriggerTick(PlayerActor)
  self.Overridden.TriggerTick(self, PlayerActor)
  self.OnInteractiveTriggerTick:Broadcast(PlayerActor)
end

function BP_ChestInteractiveComponent_C:TriggerExit(PlayerActor)
  self.Overridden.TriggerExit(self, PlayerActor)
  self.OnInteractiveTriggerExit:Broadcast(PlayerActor)
end

function BP_ChestInteractiveComponent_C:NotDisplayInteractiveBtn(PlayerActor)
  BP_InteractiveBaseComponent_C.NotDisplayInteractiveBtn(self, PlayerActor)
  if PlayerActor and PlayerActor:CheckMechanismEid(self:GetOwner().Eid) and not self:IsCanInteractive(PlayerActor) then
    self:EndPressInteractive(PlayerActor, false)
  end
end

function BP_ChestInteractiveComponent_C:InitInteractiveComponent(InteractiveId)
  if nil == InteractiveId then
    return
  end
  self.bHasId = true
  self.bCanUsed = true
  self.bPressed = false
  self:InitCommonUIConfirmID(InteractiveId)
  self.InteractiveParam = DataMgr.CommonUIConfirm[InteractiveId]
  self.MontageName = self.InteractiveParam.TriggerInterAnim
  self.AutoRotate = self.InteractiveParam.AutoRotate
  if self.MontageName then
    self.InteractiveTag = self.InteractiveParam.InteractiveTag or "Interactive"
  end
end

function BP_ChestInteractiveComponent_C:IsCanInteractive(PlayerActor)
  if not IsValid(PlayerActor) or not self.bCanUsed then
    return false
  end
  local Owner = self:GetOwner()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if not GameState:GetMechanismInteractiveInSpecialQuest(Owner) then
    return false
  end
  Owner:GetCanOpen(PlayerActor.Eid)
  if self:GetInteractiveName() ~= "" and self.DistanceCheckComponent(self, PlayerActor, self.InteractiveDistance, false) and self.CFaceToACheckComponent(self, PlayerActor, self.InteractiveFaceAngle, false) and self.AFaceToCCheckComponent(PlayerActor, self, self.InteractiveAngle, false) and (not Owner.CombatStateChangeComponent or Owner.CombatStateChangeComponent.EventCallbackNum <= 0) and Owner.CanOpen and not Owner.OpenState then
    return true
  end
  return false
end

function BP_ChestInteractiveComponent_C:IsForbidden(PlayerActor)
  if not IsValid(PlayerActor) then
    return false
  end
  return not self:CheckInteractiveSucc(PlayerActor.Eid)
end

function BP_ChestInteractiveComponent_C:IsForbidden_CPP(PlayerActor)
  if not IsValid(PlayerActor) then
    return false
  end
  return not self:CheckInteractiveSucc(PlayerActor.Eid)
end

function BP_ChestInteractiveComponent_C:IsCanPlayMontage(PlayerActor)
  if self.MontageName then
    return not PlayerActor.WaitCallBack
  end
  return true
end

function BP_ChestInteractiveComponent_C:OnClicked_Forbidden()
  self:InteractiveFailed()
end

function BP_ChestInteractiveComponent_C:CheckInteractiveSucc(PlayerEid)
  local ConditionCheck = BP_ChestInteractiveComponent_C.Super.CheckInteractiveSucc(self, PlayerEid)
  local Player = Battle(self):GetEntity(PlayerEid)
  local TagCheck = self:CheckPlayerTag(Player)
  return ConditionCheck and TagCheck
end

function BP_ChestInteractiveComponent_C:CheckPlayerTag(PlayerActor)
  local Res = BP_ChestInteractiveComponent_C.Super.CheckPlayerTag(self, PlayerActor)
  if self.InteractiveParam.IfSkipAnim then
    local Owner = self:GetOwner()
    Res = Res and (PlayerActor:CanEnterInteractive() or Owner.AutoSyncProp ~= nil and Owner.AutoSyncProp.CharacterTag == "Defeated")
  end
  return Res
end

function BP_ChestInteractiveComponent_C:StartInteractive(PlayerActor)
  if not self.bEnter then
    return
  end
  self.CanEnd = true
  print(_G.LogTag, "LXZ StartInteractive", self:IsCanInteractive(PlayerActor), self:IsCanPlayMontage(PlayerActor), not self:IsForbidden(PlayerActor))
  if self:IsCanInteractive(PlayerActor) and self:IsCanPlayMontage(PlayerActor) and not self:IsForbidden(PlayerActor) then
    local Owner = self:GetOwner()
    PlayerActor:InteractiveMechanism(Owner.Eid, PlayerActor.Eid, self.NextStateId, self.CommonUIConfirmID, true)
    if Owner.InteractiveType == Const.PressInteractive then
      self.bPressed = true
    end
  end
end

function BP_ChestInteractiveComponent_C:BtnPressed(PlayerActor)
  self:StartInteractive(PlayerActor)
end

function BP_ChestInteractiveComponent_C:BtnReleased(PlayerActor, InPressTimeSeconds)
  local Owner = self:GetOwner()
  if Owner and Owner.InteractiveType == Const.PressInteractive and self.bPressed then
    self:EndPressInteractive(PlayerActor, false)
  elseif Owner.InteractiveType == Const.ClickInteractive then
    self:EndInteractive(PlayerActor)
  end
end

function BP_ChestInteractiveComponent_C:EndInteractive(PlayerActor, ReasonId)
  local Owner = self:GetOwner()
  if Owner and Owner.InteractiveType ~= Const.PressInteractive and PlayerActor:CheckMechanismEid(self:GetOwner().Eid) then
    PlayerActor:DeInteractiveMechanism(Owner.Eid, PlayerActor.Eid, ReasonId, true, nil, true)
  end
end

function BP_ChestInteractiveComponent_C:BtnClicked(PlayerActor, InPressTimeSeconds)
  if self:CanPickUpWithOneClick() then
    self:StartInteractive(PlayerActor)
  end
end

function BP_ChestInteractiveComponent_C:EndPressInteractive(PlayerActor, IsSuccess, ReasonId)
  local Owner = self:GetOwner()
  if IsSuccess then
    self.CanEnd = false
  end
  if Owner and Owner.InteractiveType == Const.PressInteractive then
    if self.bPressed then
      if Owner.SetInteractiveCanUsed then
        Owner:SetInteractiveCanUsed(false)
      else
        self.bCanUsed = false
      end
    end
    self.bPressed = false
    PlayerActor:DeInteractiveMechanism(Owner.Eid, PlayerActor.Eid, ReasonId, IsSuccess, 0, true)
    self:RemoveTimer(self.Handle)
    self.Handle = nil
  elseif Owner and Owner.InteractiveType == Const.EndByTargetInteractive then
    PlayerActor:DeInteractiveMechanism(Owner.Eid, PlayerActor.Eid, ReasonId, IsSuccess, 0, true)
    self:RemoveTimer(self.Handle)
    self.Handle = nil
  end
end

function BP_ChestInteractiveComponent_C:ForceEndInteractive(PlayerActor, IsSuccess, ReasonId)
  local Owner = self:GetOwner()
  if Owner.InteractiveType == Const.ClickInteractive then
    self:EndInteractive(PlayerActor, ReasonId)
  else
    self:EndPressInteractive(PlayerActor, IsSuccess, ReasonId)
  end
end

function BP_ChestInteractiveComponent_C:DisplayInteractiveBtn(PlayerActor)
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local InteractiveUI = UIManager:LoadUINew(UIConst.InteractiveUIName)
  if not InteractiveUI then
    return
  end
  InteractiveUI:AddInteractiveItem(self)
  self:SetBtnDisplayed(PlayerActor, true)
end

function BP_ChestInteractiveComponent_C:NotDisplayInteractiveBtn(PlayerActor)
  if not PlayerActor then
    return
  end
  self:SetBtnDisplayed(PlayerActor, false)
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local InteractiveUI = UIManager:GetUIObj(UIConst.InteractiveUIName)
  if not InteractiveUI then
    return
  end
  InteractiveUI:RemoveInteractiveItem(self)
end

function BP_ChestInteractiveComponent_C:IsLastingInteract()
  if self.InteractiveTime > 0 then
    return true
  end
  local Owner = self:GetOwner()
  if Owner and Owner.InteractiveType == Const.PressInteractive then
    return true
  end
  return false
end

function BP_ChestInteractiveComponent_C:GetInteractiveIcon(PlayerActor)
  if self:IsLocked() then
    return "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Lock.T_Interactive_Lock'"
  end
  local Owner = self:GetOwner()
  if not Owner then
    return nil
  end
  if not Owner.UsePlayerId and self:IsForbidden(PlayerActor) then
    return "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Interactive/T_Interactive_Forbidden.T_Interactive_Forbidden'"
  end
  local Data = DataMgr.CommonUIConfirm[self.CommonUIConfirmID]
  if not Data or not Data.Icon then
    return nil
  end
  return Data.Icon
end

function BP_ChestInteractiveComponent_C:CanPickUpWithOneClick()
  if not self:GetOwner().UnitId then
    return false
  end
  local UnitId = self:GetOwner().UnitId
  if not DataMgr.Mechanism[UnitId] then
    return false
  end
  if DataMgr.Mechanism[UnitId].UnitRealType == "Collection" then
    return true
  end
  return false
end

function BP_ChestInteractiveComponent_C:GetQuestID()
  local Owner = self:GetOwner()
  return Owner.QuestChainId
end

function BP_ChestInteractiveComponent_C:GetSpecialQuestID()
  local Owner = self:GetOwner()
  if Owner then
    return Owner.ExtraRegionInfo.SpecialQuestId
  end
  return nil
end

return BP_ChestInteractiveComponent_C
