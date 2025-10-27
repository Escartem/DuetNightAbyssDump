local Battle_HeilongSkill_PC_C = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")

function Battle_HeilongSkill_PC_C:Initialize(Initializer)
  Battle_HeilongSkill_PC_C.Super.Initialize(self)
end

function Battle_HeilongSkill_PC_C:Construct()
end

function Battle_HeilongSkill_PC_C:Destruct()
end

function Battle_HeilongSkill_PC_C:OnLoaded(PlayerCharacter, SpecialUIInfo)
  Battle_HeilongSkill_PC_C.Super.OnLoaded(self)
  self.PlayerCharacter = PlayerCharacter
  self.SummonerId = SpecialUIInfo.SummonerId
  self.Summoner = nil
  self.HpPercent = 1
  self:SetRenderOpacity(0)
  self:SetStaticMeshWidgetMaterialOpacity(self.VX_Flash, 0.0)
  self:BindToAnimationStarted(self.In, function()
    self:SetRenderOpacity(1)
  end)
  self:BindToAnimationFinished(self.Out, function()
    self:SetRenderOpacity(0)
  end)
  self.BackProcessBar = self.Progress_HitRe1
  self.FrontProcessBar = self.Progress_Normal1
  self.BackProcessBarFrame = self.Progress_HitRe2
  self.FrontProcessBarFrame = self.Progress_Normal2
  self:TrySetSummon(self.SummonerId, true)
  self:AddDispatcher(EventID.OnCharCallSummoner, self, self.OnSummonerAdd)
  self:AddDispatcher(EventID.OnCharRemoveSummoner, self, self.OnSummonRemove)
  self:AddDispatcher(EventID.OnUpdateSummonHp, self, self.OnUpdateSummonHp)
end

function Battle_HeilongSkill_PC_C:OnSummonerAdd(Summoner)
  DebugPrint("gmy@Battle_HeilongSkill_PC Battle_HeilongSkill_PC_C:OnSummonerAdd", Summoner)
  if self:IsMainPlayerSummon(Summoner, self.PlayerCharacter, self.SummonerId) then
    self:StartListenSummoner(Summoner)
  end
end

function Battle_HeilongSkill_PC_C:StartListenSummoner(Summoner)
  self.Summoner = Summoner
  self:StopAnimation(self.Out)
  self:PlayAnimation(self.In)
  self:OnUpdateSummonHp()
  local HpPercent = self:GetSummonerHpPercent(self.Summoner)
  self:SetPercent(HpPercent)
end

function Battle_HeilongSkill_PC_C:EndListenSummoner()
  self.Summoner = nil
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
end

function Battle_HeilongSkill_PC_C:GetSummonerHpPercent(Summoner)
  return self.HpPercent
end

function Battle_HeilongSkill_PC_C:GetSummonerMapHpPercent(SummonerHpPercent)
  local MapHpPercent = UKismetMathLibrary.MapRangeClamped(SummonerHpPercent, 0.0, 1.0, self.ProgressPercentMin, self.ProgressPercentMax)
  return MapHpPercent
end

function Battle_HeilongSkill_PC_C:SetPercent(Percent)
  local MapHpPercent = self:GetSummonerMapHpPercent(Percent)
  self.Progress_Normal2:SetPercent(MapHpPercent)
  self.Progress_Normal1:SetPercent(MapHpPercent)
  local ShowHpPercent = UKismetMathLibrary.Round(Percent * 100)
  self.ProcessText:SetText(ShowHpPercent)
end

function Battle_HeilongSkill_PC_C:SetProgressFillImageColor(ProgressBar, TineColor)
  ProgressBar.WidgetStyle.FillImage.TintColor = TineColor
end

function Battle_HeilongSkill_PC_C:SetStaticMeshWidgetMaterialMainColor(StaticMeshWidget, MainColor)
  local Material = StaticMeshWidget.SlateMesh.Material
  Material:SetVectorParameterValue("MainColor", MainColor)
end

function Battle_HeilongSkill_PC_C:SetStaticMeshWidgetMaterialOpacity(StaticMeshWidget, Opacity)
  local Material = StaticMeshWidget.SlateMesh.Material
  Material:SetScalarParameterValue("Opacity", Opacity)
end

function Battle_HeilongSkill_PC_C:OnUpdateSummonHp()
  if IsValid(self.Summoner) then
    self.HpPercent = self.Summoner:GetAttr("HpPercent")
    self:SetPercent(self.HpPercent)
  end
end

function Battle_HeilongSkill_PC_C:OnSummonRemove(Summoner)
  DebugPrint("gmy@Battle_HeilongSkill_PC Battle_HeilongSkill_PC_C:OnSummonRemove", self.PlayerCharacter:GetLocalRole())
  if self:IsMainPlayerSummon(Summoner, self.PlayerCharacter, self.SummonerId) then
    self:EndListenSummoner()
  end
end

return Battle_HeilongSkill_PC_C
