local M = Class({
  "BluePrints.Common.TimerMgr"
})

function M:InitSurvivalMiniBaseComponent()
  self.GameMode = self:GetOwner()
  self.MaxSurvivalMiniValue = DataMgr.GlobalConstant.SurvivalValue.ConstantValue
  self.MonsterDeadOut = 0
  self.CanPlayTalk = true
end

function M:StartRound()
  self.IsRoundBegin = true
  self:SetSurvivalMiniValue(0)
  self:SpawnMonsters()
end

function M:OnMiniGameSuccess()
  self.GameMode.EMGameState:SetDungeonUIState(Const.EDungeonUIState.OnTarget)
end

function M:SpawnMonsters()
end

function M:AddSurvivalMiniValue(Value)
  local NewValue = self:GetSurvivalMiniValue() + Value
  self:SetSurvivalMiniValue(NewValue)
end

function M:TriggerStopVitamin()
  self.IsStopVitamin = true
end

function M:TrigerResumeVitamin()
  self.IsStopVitamin = false
end

function M:AddSurvivalValue(Value)
  self:AddSurvivalMiniValue(Value)
end

function M:TriggerRoundEnd()
  if not self.IsRoundBegin then
    return
  end
  self.IsRoundBegin = false
  self.GameMode:TriggerGameModeEvent("Event_OnRoundEnd")
end

function M:SetSurvivalMiniValue(NewValue)
  if not self.IsRoundBegin then
    return
  end
  if self.IsStopVitamin then
    return
  end
  if NewValue < 0 then
    NewValue = 0
  end
  if NewValue > self.MaxSurvivalMiniValue then
    NewValue = self.MaxSurvivalMiniValue
  end
  self.GameMode.EMGameState:SetSurvivalMiniValue(NewValue)
  if NewValue >= self.MaxSurvivalMiniValue then
    EventManager:FireEvent(EventID.OnSurvivalMiniValueMax)
    self:TriggerRoundEnd()
  end
end

function M:GetSurvivalMiniValue()
  return self.GameMode.EMGameState.SurvivalMiniValue
end

function M:TableToTArray(table)
  local ResTArray = TArray(0)
  if table then
    for _, Item in ipairs(table) do
      ResTArray:Add(Item)
    end
  end
  return ResTArray
end

function M:OnMonsterDeadOut()
  if not IsStandAlone(self) then
    return
  end
  if not self.IsRoundBegin then
    return
  end
  if not self.CanPlayTalk then
    return
  end
  local MaxMonsterDeadOut = DataMgr.GlobalConstant.MaxMonsterDeadOut.ConstantValue
  self.MonsterDeadOut = self.MonsterDeadOut + 1
  if MaxMonsterDeadOut <= self.MonsterDeadOut and self.HasInEnergySurvival then
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
    UE4.UPlayTalkAsyncAction.PlayTalk(GameInstance, 600306, nil)
    self.MonsterDeadOut = 0
    self.CanPlayTalk = false
    self:AddTimer(DataMgr.GlobalConstant.SurvivalTalkInterval.ConstantValue, function()
      self.CanPlayTalk = true
    end, false, 0)
  end
end

return M
