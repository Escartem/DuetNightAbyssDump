local M = Class({
  "BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base",
  "BluePrints.Common.TimerMgr"
})
local SUMMONER_ID = 510101
local CHANGE_DELTA = 0.01
local LERP_SPEED = 0.2

function M:Construct()
  EventManager:AddEvent(EventID.OnUpdateSummonHp, self, self.OnUpdateSummonHp)
end

function M:Destruct()
  EventManager:RemoveEvent(EventID.OnUpdateSummonHp, self)
end

function M:OnLoaded(PlayerCharacter, SpecialUIInfo)
  self.Super.OnLoaded(self, PlayerCharacter, SpecialUIInfo)
  self.Owner = PlayerCharacter
  LERP_SPEED = SpecialUIInfo.LerpSpeed or 0.2
  self.BackProcessBar = self.Process_HitRe1
  self.FrontProcessBar = self.Process_Normal1
  self.BackProcessBarFrame = self.Process_HitRe2
  self.FrontProcessBarFrame = self.Process_Normal2
  self.CanvasPanel:SetVisibility(ESlateVisibility.Hidden)
  self.BackProcessBar:SetPercent(1)
  self.FrontProcessBar:SetPercent(1)
  self.BackProcessBarFrame:SetPercent(1)
  self.FrontProcessBarFrame:SetPercent(1)
  self.HpPercent = 1
  self.DisplayPercent = 1
  self.PercentFormat = GText("SKILL_PROGRESS_DESC_FORMAT")
  SUMMONER_ID = SpecialUIInfo.SummonerId
  self:AddDispatcher(EventID.OnCharCallSummoner, self, self.OnSummonerAdd)
  self:AddDispatcher(EventID.OnCharRemoveSummoner, self, self.OnSummonerRemove)
  if not self.Summoner then
    self:TrySetSummon(SUMMONER_ID, true)
  end
end

function M:SetNormalStyle()
  self:SetProgressFillImageColor(self.BackProcessBar, self.Process_NormalColor)
  self:SetProgressFillImageColor(self.BackProcessBarFrame, self.Process_Frame_NormalColor)
  self.VX_01Line:SetColorAndOpacity(self.VX_01_NormalColor)
  self.VX_01Line_1:SetColorAndOpacity(self.VX_01_NormalColor)
  self.VX_01LGlow:SetColorAndOpacity(self.VX_01_NormalColor)
  self:SetMaterialParams(self.VX_01Line, self.VX_01_Skill01_NormalSpeed)
  self:SetMaterialParams(self.VX_01Line_1, self.VX_01_Skill01_NormalSpeed)
  self:SetMaterialParams(self.VX_01LGlow, self.VX_01_Skill02_NormalSpeed)
end

function M:SetRecoverStyle()
  self:SetProgressFillImageColor(self.BackProcessBar, self.Process_RecoverColor)
  self:SetProgressFillImageColor(self.BackProcessBarFrame, self.Process_Frame_RecoverColor)
  self.VX_01Line:SetColorAndOpacity(self.VX_01_RecoverColor)
  self.VX_01Line_1:SetColorAndOpacity(self.VX_01_RecoverColor)
  self.VX_01LGlow:SetColorAndOpacity(self.VX_01_RecoverColor)
  self:SetMaterialParams(self.VX_01Line, self.VX_01_Skill01_HitSpeed)
  self:SetMaterialParams(self.VX_01Line_1, self.VX_01_Skill01_HitSpeed)
  self:SetMaterialParams(self.VX_01LGlow, self.VX_01_Skill02_HitSpeed)
  self:PlayAnimation(self.Return)
end

function M:SetProgressFillImageColor(ProgressBar, TineColor)
  ProgressBar.WidgetStyle.FillImage.TintColor = TineColor
end

function M:SetMaterialParams(ImageWidget, Speed2D)
  ImageWidget:GetDynamicMaterial():SetScalarParameterValue("Distortion_U_Speed", Speed2D.X)
  ImageWidget:GetDynamicMaterial():SetScalarParameterValue("Distortion_V_Speed", Speed2D.Y)
end

function M:OnBackProcessBarValueChanged(Value)
  self.BackProcessBarFrame:SetPercent(Value)
end

function M:OnFrontProcessBarValueChanged(Value)
  self.FrontProcessBarFrame:SetPercent(Value)
end

function M:OnSummonerAdd(Summoner)
  if self:IsMainPlayerSummon(Summoner, self.Owner, SUMMONER_ID) then
    self.Summoner = Summoner
    self:StopAnimation(self.Out)
    self:PlayAnimation(self.In)
    self:ForceRefreshSummonerProgress()
    self.CanvasPanel:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
end

function M:OnSummonerRemove(Summoner)
  DebugPrint("gmy@Battle_SongluSkill_PC M:OnSummonerRemove", Summoner)
  if self:IsMainPlayerSummon(Summoner, self.Owner, SUMMONER_ID) then
    self.Summoner = nil
    self:StopAnimation(self.In)
    self:PlayAnimation(self.Out)
  end
end

function M:ForceRefreshSummonerProgress()
  local Summoner = self.Summoner
  if IsValid(Summoner) then
    local HpPercent = self.Summoner:GetAttr("HpPercent")
    local HpText = UKismetMathLibrary.Round(HpPercent * 100)
    self.ProcessText:SetText(HpText)
    self.DisplayPercent = HpPercent
    self:SetProgressPercent(HpPercent)
  end
end

function M:Show(ShowTag)
  self.Super.Show(self, ShowTag)
end

function M:OnUpdateSummonHp()
  local Summoner = self.Summoner
  if IsValid(Summoner) then
    local HpPercent = self.Summoner:GetAttr("HpPercent")
    self.HpPercent = HpPercent
    local Delta = self.DisplayPercent - HpPercent
    if Delta > CHANGE_DELTA or Delta < -CHANGE_DELTA then
      local HpText = UKismetMathLibrary.Round(HpPercent * 100)
      self:StartSetPercent(self.DisplayPercent, HpPercent, LERP_SPEED, function()
        self:EndSetPercent()
      end)
      self.ProcessText:SetText(HpText)
    end
  end
end

function M:StartSetPercent(OriginPercent, TargetPercent, LerpSpeed, CompleteFunc)
  local Duration = (TargetPercent - OriginPercent) / LerpSpeed
  Duration = math.abs(Duration)
  self.bBlending = self.bBlending or false
  if not self.bBlending then
    self.bBlending = true
    DebugPrint("gmy@Battle_SongluSkill_PC M:Start Param", Duration, OriginPercent, TargetPercent, self.bBlending)
    if OriginPercent < TargetPercent then
      self:SetRecoverStyle()
    else
      self:SetNormalStyle()
    end
    self.LTweenHandle = UE4.ULTweenBPLibrary.FloatTo(self, {
      self,
      function(_, Value)
        local Percent = Value
        self:SetProgressPercent(Percent)
        self.DisplayPercent = Percent
      end
    }, OriginPercent, TargetPercent, Duration, 0, 0)
    local LTweenActor = UE4.ALTweenActor.GetLTweenInstance(self.LTweenHandle)
    if LTweenActor then
      LTweenActor:SetTickableWhenPaused(true)
    end
    if CompleteFunc then
      self.LTweenHandle:OnComplete({self, CompleteFunc})
    end
  end
end

function M:SetProgressPercent(Percent)
  self.BackProcessBar:SetPercent(Percent)
  self.FrontProcessBar:SetPercent(Percent)
  self.BackProcessBarFrame:SetPercent(Percent)
  self.FrontProcessBarFrame:SetPercent(Percent)
end

function M:EndSetPercent()
  self.bBlending = false
  self:OnUpdateSummonHp()
end

return M
