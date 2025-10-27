require("UnLua")
local Battle_Survival_Serum = Class("BluePrints.UI.BP_UIState_C")

function Battle_Survival_Serum:Initialize(Initializer)
  self.Energy = 0
  self.Level = -1
  self.BuffBase = 100
  self.AnimationArray = {}
  self.EnergyPercent = 0
  self.DisplayEnergyPercent = 0
  self.CurrentPlayingAnimIndex = -1
  self.EnergyPercentGrowRate = 5
  self.FxObjects = {}
end

function Battle_Survival_Serum:Construct()
  self.Overridden.Construct(self)
end

function Battle_Survival_Serum:SetUnitParams(MechanismID)
  local BuffTypeImgPathPostFix = DataMgr.Mechanism[MechanismID].GuideIconBPPath
  BuffTypeImgPathPostFix = string.gsub(BuffTypeImgPathPostFix, "Guide_", "")
  local BuffIconPath = "/Game/UI/UI_PNG/Battle/Battle_Buff_" .. BuffTypeImgPathPostFix .. ".Battle_Buff_" .. BuffTypeImgPathPostFix
  UE.UResourceLibrary.LoadObjectAsync(self, BuffIconPath, {
    self,
    Battle_Survival_Serum.OnBuffIconLoadFinish
  })
  self:OnEnergyChanged(self.Energy)
  local ResurgenceMat = self.Bar_Agentia_Surge:GetDynamicMaterial()
  if nil ~= ResurgenceMat then
    ResurgenceMat:SetScalarParameterValue("Percent", 0)
  end
  self.BuffBase = DataMgr.Mechanism[MechanismID].UnitParams.BuffBase
end

function Battle_Survival_Serum:OnBuffIconLoadFinish(Object)
  if not Object then
    return
  end
  if IsValid(self) and self.Img_Buff then
    self.Img_Buff:SetBrushResourceObject(Object)
  end
end

function Battle_Survival_Serum:Tick(_, DeltaTime)
  if self.EnergyPercent == self.DisplayEnergyPercent then
    return
  end
  local EnergyPercentDelta = self.EnergyPercentGrowRate * DeltaTime * (self.EnergyPercent - self.DisplayEnergyPercent)
  self.DisplayEnergyPercent = self.DisplayEnergyPercent + EnergyPercentDelta
  if self.EnergyPercent < self.DisplayEnergyPercent then
    self.DisplayEnergyPercent = self.EnergyPercent
  end
  if not self.ResurgenceMat then
    self.ResurgenceMat = self.Bar_Agentia_Surge:GetDynamicMaterial()
  end
  if self.ResurgenceMat then
    self.ResurgenceMat:SetScalarParameterValue("Percent", self.DisplayEnergyPercent)
  end
end

function Battle_Survival_Serum:OnLoaded(...)
  self:PlayAnimation(self.In)
  local ResurgenceMat = self.Bar_Agentia_Surge:GetDynamicMaterial()
  if nil ~= ResurgenceMat then
    ResurgenceMat:SetScalarParameterValue("Percent", 0)
  end
end

function Battle_Survival_Serum:OnAnimationFinished()
  self.CurrentPlayingAnimIndex = -1
end

function Battle_Survival_Serum:OnEnergyChanged(NewEnergy, bFromMonster)
  if not NewEnergy then
    local NewLevel = self.Energy // self.BuffBase
    return 0, NewLevel
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if not UIManager then
    return
  end
  local SurviveFloat = UIManager:GetUI("DungenonSurviveFloat")
  local bEnergyIncreased = NewEnergy >= self.Energy
  if not bEnergyIncreased and not self.bAnimStopped then
    self.bAnimStopped = true
    if SurviveFloat then
      SurviveFloat.bShouldContinueGuideAnim = true
      SurviveFloat:StopGuideAnim()
    end
  end
  self.Energy = NewEnergy
  local NewLevel = NewEnergy // self.BuffBase
  local CurrentLevelEnergy = self.Energy - NewLevel * self.BuffBase
  local EnergyPercent = CurrentLevelEnergy / self.BuffBase
  self:ChangeEnergyBar(EnergyPercent, bFromMonster, bEnergyIncreased)
  if NewLevel ~= self.Level then
    local OldLevel = self.Level
    self:ChangeLevel(NewLevel)
    return OldLevel, NewLevel
  end
end

function Battle_Survival_Serum:ChangeEnergyBar(EnergyPercent, bFromMonster, bEnergyIncreased)
  self.EnergyPercent = EnergyPercent
end

function Battle_Survival_Serum:ChangeLevel(NewLevel)
  self.Level = NewLevel
  local ResurgenceMat = self.Bar_Agentia_Glow:GetDynamicMaterial()
  if ResurgenceMat then
    ResurgenceMat:SetScalarParameterValue("Percent", 1 - NewLevel * 0.2)
  end
end

function Battle_Survival_Serum:Close()
  local _, Proxy = UWidgetAnimationPlayCallbackProxy.CreatePlayAnimationProxyObject(nil, self, self.Out, 0, 1, 0)
  Proxy.Finished:Add(self, self.OnClose_Internal)
end

function Battle_Survival_Serum:OnClose_Internal()
  self.Super.Close(self)
end

return Battle_Survival_Serum
