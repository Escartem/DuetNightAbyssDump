local M = Class({
  "BluePrints.Item.BP_CombatItemBase_C"
})

function M:CommonInitInfo(Info)
  M.Super.CommonInitInfo(self, Info)
  self.Speed = 1
  self.Range = self.UnitParams.Range or 500
  self.UIRange = self.UnitParams.UIRange or 500
  self.Height = self.UnitParams.Height or 500
  self.Time = self.UnitParams.Time or 0.2
end

function M:ClientInitInfo(Info)
  M.Super.ClientInitInfo(self, Info)
  self.ProgressWidget:GetWidget():Init(math.floor(self.OccupateProgress))
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local Res = self:CheckRange(Player)
  if Res then
    self.ProgressWidget:GetWidget():OnOccupationContinue()
  else
    self.ProgressWidget:GetWidget():OnOccupationPause()
  end
end

function M:OnActorReady(Info)
  M.Super.OnActorReady(self, Info)
  self.DeactiveGuideIgnoreList:Add(self.Eid)
  if IsAuthority(self) then
    self:DeactiveGuide()
    self:StartOccupateProgress()
    self:AddOccupateProgress()
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
    local SceneManager = GameInstance:GetSceneManager()
    SceneManager:UpdateOneSceneGuideIcon(self.Eid, true, true)
  end
end

function M:WaitStartOccupateProgress()
  if IsAuthority(self) then
    self:AddTimer(self.Time, self.StartOccupateProgress, false, 0, "Occupation")
  end
end

function M:OnOneOccupationSucceed()
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  local bDisCheck = self:CheckRange(Player)
  if (not IsAuthority(self) or IsStandAlone(self)) and bDisCheck then
    if bDisCheck then
      UIManager(self):LoadUINew("ExploreToastSuccess", GText("DUNGEON_SYNTHESIS_111"))
    end
    self.Overridden.OnOneOccupationSucceed(self)
  end
  if IsAuthority(self) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    GameMode:TriggerDungeonComponentFun("OnOneOccupationSucceed", self)
    self:EMActorDestroy(EDestroyReason.MechanismDead)
  end
end

function M:OnRep_OccupateProgress()
  if not self.ProgressWidget:GetWidget() then
    self:AddTimer(0.1, function()
      if self.ProgressWidget:GetWidget() then
        self.ProgressWidget:GetWidget():OnProgressChange(self.OccupateProgress)
        self:RemoveTimer("OnRepOccupateProgress")
      end
    end, true, 0, "OnRepOccupateProgress")
    return
  end
  self.ProgressWidget:GetWidget():OnProgressChange(self.OccupateProgress)
  AudioManager(self):PlayFMODSound(self, nil, "event:/ui/common/week_level_progress_grow", "OccupateProgress")
end

function M:OnPlayerIn()
  print(_G.LogTag, "LXZ OnPlayerIn")
  self.ProgressWidget:GetWidget():OnPlayerIn()
end

function M:OnPlayerOut()
  print(_G.LogTag, "LXZ OnPlayerOut")
  self.ProgressWidget:GetWidget():OnPlayerOut()
end

function M:OnOccupationPause()
  self.Overridden.OnOccupationPause(self)
  self.ProgressWidget:GetWidget():OnOccupationPause()
end

function M:OnOccupationContinue()
  self.Overridden.OnOccupationContinue(self)
  self.ProgressWidget:GetWidget():OnOccupationContinue()
end

function M:OnEMActorDestroy(DestroyReason)
  if IsAuthority(self) and self.OccupateProgress >= 100 then
    self:RemoveTimer("Occupation")
    self:RemoveTimer("OccupationSucceed")
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    for _, Player in pairs(GameMode:GetAllPlayer()) do
      self:ActiveAllGuide(nil, Player.Eid)
      self:DeactiveGuide(Player.Eid)
    end
  end
end

function M:ReceiveEndPlay(EndReason)
  M.Super.ReceiveEndPlay(self, EndReason)
  if IsAuthority(self) then
    self:RemoveTimer("Occupation")
    self:RemoveTimer("OccupationSucceed")
  end
end

return M
