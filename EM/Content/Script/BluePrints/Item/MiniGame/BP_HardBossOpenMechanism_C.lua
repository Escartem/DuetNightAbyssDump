require("UnLua")
local M = Class("BluePrints/Item/MiniGame/BP_OpenUIMechanism_C")

function M:OpenUI(PlayerId, NextStateId)
  M.Super.OpenUI(self, PlayerId, NextStateId)
  local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local Player = Battle(self):GetEntity(PlayerId)
  self.Camera:SetAspectRatio(Player.CharCameraComponent.AspectRatio)
  self.Camera:SetFieldOfView(Player.CharCameraComponent.FieldOfView)
  Controller:SetViewTargetWithBlend(self, self.OpenBlendTime)
  self.CacheControllerPausedParam = Controller.bShouldPerformFullTickWhenPaused
  Controller.bShouldPerformFullTickWhenPaused = true
  Player.CharSpringArmComponent:SetTickableWhenPaused(true)
end

function M:CloseMechanism(PlayerId, IsSuccess)
  local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local Player = Battle(self):GetEntity(PlayerId)
  local PlayerRot = Player:K2_GetActorRotation().Yaw
  Controller:SetControlRotation(FRotator(0, PlayerRot, 0))
  Controller:SetViewTargetWithBlend(Player, self.CloseBlendTime, EViewTargetBlendFunction.VTBlend_Linear, 0)
  EventManager:AddEvent(EventID.UnLoadUI, self, self.ResetPauseState)
  M.Super.CloseMechanism(self, PlayerId)
end

function M:ResetPauseState(UIName)
  if "HardBossLevelChoose" ~= UIName then
    return
  end
  EventManager:RemoveEvent(EventID.UnLoadUI, self)
  local Controller = UE4.UGameplayStatics.GetPlayerController(self, 0)
  Controller.bShouldPerformFullTickWhenPaused = self.CacheControllerPausedParam
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  Player.CharSpringArmComponent:SetTickableWhenPaused(false)
end

function M:GetCanOpen()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    self.CanOpen = true
    return
  end
  self.CanOpen = not Avatar:IsInHardBoss()
end

function M:HideMechanism(NeedCallBack, Reason, AlwaysShow)
  local CompArray = self:K2_GetComponentsByClass(UShapeComponent:StaticClass())
  for i, v in pairs(CompArray) do
    v:SetCollisionEnabled(0)
  end
  if not AlwaysShow then
    self:SetActorHideTag(Reason, true)
  end
  if NeedCallBack then
    EventManager:AddEvent(EventID.ConditionComplete, self, self.ShowMechanismWithCondition)
  end
end

function M:ShowMechanismWithCondition(ShowConditionId)
  if ShowConditionId ~= self.Data.ShowConditionId then
    return
  end
  local CompArray = self:K2_GetComponentsByClass(UShapeComponent:StaticClass())
  for i, v in pairs(CompArray) do
    v:SetCollisionEnabled(1)
  end
  EventManager:RemoveEvent(EventID.ConditionComplete, self)
  self:SetActorHideTag("Condition", false)
end

function M:ReceiveEndPlay(EndReason)
  M.Super.ReceiveEndPlay(self, EndReason)
  EventManager:RemoveEvent(EventID.ConditionComplete, self)
end

return M
