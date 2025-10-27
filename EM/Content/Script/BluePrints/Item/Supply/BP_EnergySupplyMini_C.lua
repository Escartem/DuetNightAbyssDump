local BP_EnergySupplyMini_C = Class({
  "BluePrints.Item.Supply.BP_EnergySupply_C"
})

function BP_EnergySupplyMini_C:CommonInitInfo(Info)
  BP_EnergySupplyMini_C.Super.CommonInitInfo(self, Info)
  EventManager:AddEvent(EventID.OnRepSurvivalMiniValue, self, self.OnRepSurvivalMiniValue)
  EventManager:AddEvent(EventID.OnSurvivalMiniValueMax, self, self.OnSurvivalMiniValueMax)
  self.MiniMapPath = self.UnitParams.MiniMapPath or "/Game/UI/WBP/Common/VX/Activity/RechargeRebate/1111.1111"
end

function BP_EnergySupplyMini_C:ClientInitInfo(Info)
  BP_EnergySupplyMini_C.Super.ClientInitInfo(self, Info)
  EventManager:FireEvent(EventID.ShowRangedIconInMinimap, self.Eid, true, self.MiniMapPath, self.Radius)
end

function BP_EnergySupplyMini_C:OnRepSurvivalMiniValue(SurvivalValue)
  local ChangeValue = SurvivalValue - self.NowEnergy
  self.NowEnergy = SurvivalValue
  self.NowEnergy = math.min(self.NowEnergy, self.MaxEnergy)
  self.NowEnergy = math.max(self.NowEnergy, 0)
  if IsAuthority(self) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode and self.NowEnergy >= self.MaxEnergy then
      GameMode:TriggerDungeonAchieve("EnergySupplyEnergyMax", -1, self.Eid, self.UnitId)
    end
  end
  if IsStandAlone(self) or not IsAuthority(self) then
    if ChangeValue < 0 then
      self:OnEnergyDown()
    elseif ChangeValue > 0 then
      self:OnFxObjectFinished()
    end
  end
  if self.NowEnergy >= self.MaxEnergy then
    self:OnSurvivalMiniValueMax_Client()
  end
end

function BP_EnergySupplyMini_C:ChangeEnergy_Lua(ChangeValue, bFromMonster)
  if IsAuthority(self) then
    local GameMode = UE4.UGameplayStatics.GetGameMode(self)
    if GameMode then
      GameMode:TriggerDungeonComponentFun("AddSurvivalValue", ChangeValue)
    end
  end
end

function BP_EnergySupplyMini_C:OnSurvivalMiniValueMax()
  if not IsAuthority(self) then
    return
  end
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local PlayerList = GameMode:GetAllPlayer()
  for _, Player in pairs(PlayerList) do
    self:DeactiveGuide(Player.Eid)
  end
  self:EndFindTarget()
  self:EndFindTarget_Client()
  EventManager:FireEvent(EventID.ShowRangedIconInMinimap, self.Eid, false, nil, self.Radius)
end

function BP_EnergySupplyMini_C:OnSurvivalMiniValueMax_Client()
  self:EndFindTarget_Client()
  EventManager:FireEvent(EventID.ShowRangedIconInMinimap, self.Eid, false, nil, self.Radius)
end

function BP_EnergySupplyMini_C:EnergyToSurvival()
end

function BP_EnergySupplyMini_C:OnEnergyChanged(NewEnergy, bFromMonster)
end

function BP_EnergySupplyMini_C:OnBuffAdded(PlayerEid, BuffID, OldLayer, NewLayer)
end

function BP_EnergySupplyMini_C:OnPlayerIn(PlayerEid, BuffID)
end

function BP_EnergySupplyMini_C:OnPlayerLeft(PlayerEid)
end

function BP_EnergySupplyMini_C:CheckPlayerInShowToastDis(Dis, PlayerEid)
end

function BP_EnergySupplyMini_C:RealShowToast()
end

function BP_EnergySupplyMini_C:OnInteracrive(PlayerId)
end

function BP_EnergySupplyMini_C:ResetToastInfo()
end

function BP_EnergySupplyMini_C:ShowInteractedToast(PlayerEid)
end

function BP_EnergySupplyMini_C:PhantomInteractive(PhantomEid)
end

function BP_EnergySupplyMini_C:PhantomDeInteractive(PhantomEid)
end

return BP_EnergySupplyMini_C
