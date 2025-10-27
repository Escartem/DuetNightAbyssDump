local FacialActionListenType = {
  StaticPoint = "StaticPoint",
  TriggerBox = "TriggerBox",
  Player = "Player"
}
local M = Class("StoryCreator.StoryLogic.StorylineNodes.BaseAsynQuestNode")

function M:Init()
  self.FacialActionTag = ""
  self.ListenType = 0
  self.ListenInterval = 0.5
end

function M:Execute(Callback)
  self.Callback = Callback
  self:StartListen()
end

function M:Clear()
  self:StopListen(true)
  if self.ExecuteTimer then
    GWorld.GameInstance:RemoveTimer(self.ExecuteTimer)
    self.ExecuteTimer = nil
  end
end

function M:StartListen()
  local GameInstance = GWorld.GameInstance
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  if not PlayerCharacter then
    DebugPrint("TTT:ListenPlayerFacialActionTagNode: Error,Empty Player")
    return
  end
  self.ListenTarget = PlayerCharacter
  self.ExecuteTimer = GWorld.GameInstance:AddTimer(self.ListenInterval, function()
    self:LoopListen()
  end, true)
end

function M:LoopListen()
  if self.IsStopListen then
    return
  end
  if not self.ListenTarget then
    self:StopListen(false)
  end
  local NeedCheck = false
  local GameMode = UE4.UGameplayStatics.GetGameMode(GWorld.GameInstance)
  if not GameMode then
    return
  end
  if self.ListenType == FacialActionListenType.StaticPoint then
    self.StaticPoint = GameMode.EMGameState.StaticCreatorMap:Find(self.StaticPointId)
    if self.StaticPoint then
      local PlayerDistance = UE4.UKismetMathLibrary.Vector_Distance(self.ListenTarget:K2_GetActorLocation(), self.StaticPoint:K2_GetActorLocation())
      if PlayerDistance > self.StaticPointListenMinCM and PlayerDistance < self.StaticPointListenMaxCM then
        NeedCheck = true
      end
    end
  elseif self.ListenType == FacialActionListenType.Player then
    NeedCheck = true
  elseif self.ListenType == FacialActionListenType.TriggerBox then
    self.Trigger = GameMode:GetActor2ManualId(self.TriggerBoxId)
    if self.Trigger and self.Trigger.CheckPlayerIn and self.Trigger:CheckPlayerIn() then
      NeedCheck = true
    end
  end
  if NeedCheck and self.ListenTarget:CheckLevelTag(self.FacialActionTag) then
    self:StopListen(true)
  end
end

function M:StopListen(TriggerCallback)
  self.IsStopListen = true
  DebugPrint("TTT:ListenPlayerFacialActionTagNode:Stop")
  if self.ExecuteTimer then
    GWorld.GameInstance:RemoveTimer(self.ExecuteTimer)
    self.ExecuteTimer = nil
  end
  if TriggerCallback and self.Callback then
    DebugPrint("TTTT:ListenPlayerFacialActionTagNode TriggerCallback")
    self.Callback()
  end
end

return M
