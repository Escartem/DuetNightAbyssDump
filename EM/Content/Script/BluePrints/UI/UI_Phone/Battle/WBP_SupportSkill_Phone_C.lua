local SupportSkill_Phone_C = Class("BluePrints.UI.BP_UIState_C")

function SupportSkill_Phone_C:Initialize(Initializer)
  self.CurButtonState = nil
end

function SupportSkill_Phone_C:Construct()
  self.Button_Area.OnPressed:Add(self, self.OnPressed)
  self.Button_Area.OnReleased:Add(self, self.OnReleased)
  self.OwnerPlayer = UGameplayStatics.GetPlayerCharacter(self, 0)
  self:RefreshSupportSkillIcon()
end

function SupportSkill_Phone_C:Destruct()
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return
  end
  if self.SupportUnlockKey then
    Avatar:UnBindOnUIFirstTimeUnlock(self.SupportUIUnlockRuleId, self.SupportUnlockKey)
  end
  if self.SwitchUnlockKey then
    Avatar:UnBindOnUIFirstTimeUnlock(self.SwitchUIUnlockRuleId, self.SwitchUnlockKey)
  end
  self.Super.Destruct(self)
end

function SupportSkill_Phone_C:RefreshSupportSkillIcon()
  local BattlePet = self.OwnerPlayer:GetBattlePet()
  if not BattlePet then
    DebugPrint("BattlePet\228\184\186\231\169\186!!!")
    return
  end
  self.IsInit = true
  self.SkillId = DataMgr.BattlePet[BattlePet.BattlePetId].SupportSkillId
  if self.bSupportSkillUnlock then
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self:SetVisibility(ESlateVisibility.Collapsed)
  end
  self:RefreshButtonStyle()
  self.CurButtonState = "Normal"
  self:PlayButtonStateAnimation()
end

function SupportSkill_Phone_C:OnPressed()
  if self.CurButtonState == "Empty" then
    return
  end
  if self.CurButtonState == "Ban" then
    UIManager(self):ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, "UI_SKILL_FORBIDDEN")
    return
  end
  self.OwnerPanel:TryToPlayTargetCommand("Skill3", false)
  self:OnPressed_Presentation()
end

function SupportSkill_Phone_C:OnReleased()
  if self.CurButtonState == "Empty" or self.CurButtonState == "Ban" then
    return
  end
  self.OwnerPanel:TryToStopTargetCommand("Skill3", false)
end

function SupportSkill_Phone_C:OnPressed_Presentation()
  self:PlayResponsiveAnimation()
end

function SupportSkill_Phone_C:PlayResponsiveAnimation()
  if self.CurButtonState == "InCDTime" or self.CurButtonState == "InCDTimeSustain" then
    if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Disable) then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Disable)
    end
  elseif not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Click) then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Click)
  end
end

function SupportSkill_Phone_C:PlayWithTimerAnimation()
  if self.NeedCDCompleteAnim then
    self.ProgressBar_Support:SetPercent(0)
    self:PlayAnimation(self.CD_Complete)
    self.NeedCDCompleteAnim = false
  end
end

function SupportSkill_Phone_C:PlayButtonStateAnimation()
  if self.CurButtonState == "InCDTime" then
    DebugPrint("\232\191\155\229\133\165CD\230\128\129")
    if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.CD) then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.CD)
    end
  elseif self.CurButtonState == "InCDTimeSustain" then
    DebugPrint("\232\191\155\229\133\165CD\230\140\129\231\187\173\230\128\129")
    if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Sustain_CD) then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Sustain_CD)
    end
  elseif self.CurButtonState == "SustainLoop" then
    DebugPrint("\232\191\155\229\133\165\230\140\129\231\187\173\230\128\129")
    if not EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Sustain_Loop) then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Sustain_Loop)
    end
  elseif self.CurButtonState == "Normal" then
    DebugPrint("\232\191\155\229\133\165\229\184\184\232\167\132\230\128\129")
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
  end
end

function SupportSkill_Phone_C:HandleCurButtonState(SkillId, CurButtonState)
  local Skill = self.OwnerPlayer:GetSkill(self.SkillId)
  if not Skill then
    return
  end
  local SkillCDTime, SkillCDPercent = Skill:GetSkillCdTimeAndPercent()
  local IsSkillSustain = self.OwnerPanel:ExecuteCheckIsSkillInUsing(Skill)
  if "Normal" == CurButtonState then
    if SkillCDTime > 0 and IsSkillSustain then
      self.CurButtonState = "InCDTimeSustain"
    elseif SkillCDTime > 0 then
      self.CurButtonState = "InCDTime"
    elseif IsSkillSustain then
      self.CurButtonState = "SustainLoop"
    end
  elseif "InCDTime" == CurButtonState then
    self.Text_CD:SetText(self:GetPreciseDecimal(SkillCDTime, 1))
    self.ProgressBar_Support:SetPercent(1 - SkillCDPercent)
    if IsSkillSustain then
      self.CurButtonState = "InCDTimeSustain"
    end
    if SkillCDTime <= 0 then
      self.NeedCDCompleteAnim = true
      self.CurButtonState = "Normal"
    end
  elseif "InCDTimeSustain" == CurButtonState then
    self.Text_CD:SetText(self:GetPreciseDecimal(SkillCDTime, 1))
    self.ProgressBar_Support:SetPercent(1 - SkillCDPercent)
    if SkillCDTime <= 0 and IsSkillSustain then
      self.NeedCDCompleteAnim = true
      self.CurButtonState = "SustainLoop"
    elseif SkillCDTime > 0 and not IsSkillSustain then
      self.CurButtonState = "InCDTime"
    elseif not IsSkillSustain then
      self.CurButtonState = "Normal"
    end
  elseif "SustainLoop" == CurButtonState then
    if not IsSkillSustain and SkillCDTime <= 0 then
      self.CurButtonState = "Normal"
    elseif not IsSkillSustain and SkillCDTime > 0 then
      self.CurButtonState = "InCDTime"
    elseif SkillCDTime > 0 then
      self.CurButtonState = "InCDTimeSustain"
    end
  end
  if CurButtonState ~= self.CurButtonState then
    self:PlayButtonStateAnimation()
  end
end

function SupportSkill_Phone_C:UpdateSkillInTimer()
  if not self.IsInit then
    return
  end
  if not IsValid(self.OwnerPlayer) then
    return
  end
  if not self.SkillId then
    return
  end
  self:HandleCurButtonState(self.SkillId, self.CurButtonState)
  self:PlayWithTimerAnimation()
end

function SupportSkill_Phone_C:RefreshButtonStyle()
  if not self.SkillId then
    return
  end
  local SkillBaseConfig = DataMgr.Skill[self.SkillId][1][0]
  if SkillBaseConfig.SkillBtnIcon ~= nil then
    local IconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Skill/T_" .. SkillBaseConfig.SkillBtnIcon
    UE.UResourceLibrary.LoadObjectAsync(self, IconPath, {
      self,
      SupportSkill_Phone_C.OnSkillImgIconLoadFinish
    })
  end
end

function SupportSkill_Phone_C:OnSkillImgIconLoadFinish(Object)
  if IsValid(self) and Object and self.Icon_Support then
    self.Icon_Support:GetDynamicMaterial():SetTextureParameterValue("Mask", Object)
  end
end

function SupportSkill_Phone_C:InitSupportSkill()
  self.bSupportSkillUnlock = false
  local Avatar = GWorld:GetAvatar()
  local UIUnlockRule = DataMgr.UIUnlockRule
  self.SupportUIUnlockRuleId = UIUnlockRule.PetSkill.UIUnlockRuleId
  if Avatar then
    self.bSupportSkillUnlock = Avatar:CheckUIUnlocked(self.SupportUIUnlockRuleId)
    if not self.bSupportSkillUnlock then
      self:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.SupportUnlockKey = Avatar:BindOnUIFirstTimeUnlock(self.SupportUIUnlockRuleId, function()
        self.bSupportSkillUnlock = true
        self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end)
    else
      self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.OwnerPanel:ChangeSkillButtonState(ESkillName.Skill3, "Empty")
    end
  end
end

return SupportSkill_Phone_C
