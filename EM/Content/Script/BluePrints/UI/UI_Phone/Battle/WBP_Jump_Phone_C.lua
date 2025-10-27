local Jump_Phone_C = Class("BluePrints.UI.BP_UIState_C")
local OpacityName = {
  Bullet_Jump = "OpacityJump",
  Slide_Attack = "OpacitySideAtack",
  Slide = "OpacitySide"
}

function Jump_Phone_C:Initialize(Initializer)
  self.CurButtonState = "Normal"
  self.LastButtonState = "Normal"
  self.InnerButtonDis = 50
  self.StartSlide = false
  self.JumpAngle_Max = 125
  self.JumpAngle_Min = 0
  self.AttackAngle_Max = 215
  self.AttackAngle_Min = 125
  self.SlideAngle_Min = 215
  self.SlideAngle_Max = 360
end

function Jump_Phone_C:Construct()
  self.OwnerPlayer = UGameplayStatics.GetPlayerCharacter(self, 0)
  self.PanelMaterial = self.Image_Panel_State:GetDynamicMaterial()
  self.PanelMaterialGuide = self.Image_Panel_State_Guide:GetDynamicMaterial()
  for _, Opacity in pairs(OpacityName) do
    self.PanelMaterial:SetScalarParameterValue(Opacity, 0)
    self.PanelMaterialGuide:SetScalarParameterValue(Opacity, 0)
  end
end

function Jump_Phone_C:InitSkillInfos()
  self.SkillInfos = {
    [ESkillName.Slide] = {
      SkillActive = true,
      AnimName = self.UnLock_Slide
    },
    [ESkillName.Attack] = {
      SkillActive = true,
      AnimName = self.UnLock_SlideAttack
    },
    [ESkillName.BulletJump] = {
      SkillActive = true,
      AnimName = self.UnLock_BulletJump
    }
  }
end

function Jump_Phone_C.ButtonJumpDown(Battle_Button_Phone, Index, StartPos)
  local Jump_M = Battle_Button_Phone.Jump
  if Jump_M.OwnerPlayer:CheckSkillInActive(ESkillName.Jump) then
    return
  end
  Jump_M.CurButtonState = "Press"
  if Jump_M.OwnerPlayer:IsFlying() then
    Jump_M.OwnerPanel:TryToPlayTargetCommand("Jump", true)
  end
  Jump_M:PlayStateAnimation()
end

function Jump_Phone_C.ButtonJumpMove(Battle_Button_Phone, TouchFingerCount, Index, LastPos, TotalDeltaDis, LastDeltaDis)
  local Jump_M = Battle_Button_Phone.Jump
  if Jump_M.OwnerPlayer:CheckSkillInActive(ESkillName.Jump) then
    return
  end
  local FromCenterDis = UE4.UKismetMathLibrary.Distance2D(TotalDeltaDis, FVector2D(0, 0))
  if FromCenterDis >= Jump_M.InnerButtonDis then
    if not Jump_M.StartSlide then
      Jump_M.OwnerPanel:TryToPlayTargetCommand("Slide", true)
      if Jump_M.OwnerPlayer:IsFlying() then
        Jump_M.OwnerPanel:TryToStopTargetCommand("Jump", true)
      end
      Jump_M.StartSlide = true
    end
    Jump_M:GetVectorRegionAngle(TotalDeltaDis)
  elseif FromCenterDis < Jump_M.InnerButtonDis and Jump_M.StartSlide then
    Jump_M.OwnerPanel:TryToStopTargetCommand("Slide", true)
    if Jump_M.OwnerPlayer:IsFlying() then
      Jump_M.OwnerPanel:TryToPlayTargetCommand("Jump", true)
    end
    Jump_M.CurButtonState = "Press"
    Jump_M.StartSlide = false
  end
  Jump_M:PlayStateAnimation()
end

function Jump_Phone_C.ButtonJumpUp(Battle_Button_Phone, Index, WidgetLocalPos, LastWidgetTouchPos, EndTouchPos, TotalDeltaDis)
  local Jump_M = Battle_Button_Phone.Jump
  if Jump_M.OwnerPlayer:CheckSkillInActive(ESkillName.Jump) then
    return
  end
  local FromCenterDis = UE4.UKismetMathLibrary.Distance2D(TotalDeltaDis, FVector2D(0, 0))
  if FromCenterDis >= Jump_M.InnerButtonDis then
    Jump_M:GetVectorRegionAngle(TotalDeltaDis)
    Jump_M:HandleStateWhenUp()
  elseif Jump_M.OwnerPlayer:IsFlying() then
    Jump_M.OwnerPanel:TryToStopTargetCommand("Jump", true)
  else
    Jump_M.OwnerPanel:TryToPlayTargetCommand("Jump", true)
  end
  Jump_M.CurButtonState = "Normal"
  Jump_M:PlayStateAnimation()
end

function Jump_Phone_C:GetVectorRegionAngle(Vector2D)
  local Angle = math.atan(-Vector2D.Y / Vector2D.X) * (180 / math.pi)
  if Vector2D.X < 0 then
    Angle = Angle + 180
  elseif -Vector2D.Y < 0 then
    Angle = Angle + 360
  end
  if Angle >= self.JumpAngle_Min and Angle <= self.JumpAngle_Max then
    self.CurButtonState = "Jump"
  elseif Angle > self.AttackAngle_Min and Angle <= self.AttackAngle_Max then
    self.CurButtonState = "Attack"
  elseif Angle > self.SlideAngle_Min and Angle <= self.SlideAngle_Max then
    self.CurButtonState = "Slide"
  end
end

function Jump_Phone_C:HandleStateWhenUp()
  if self.CurButtonState == "Jump" then
    if self.OwnerPlayer:IsFlying() then
      self.OwnerPanel:TryToStopTargetCommand("Jump", true)
    else
      self.OwnerPanel:TryToPlayTargetCommand("Jump", true)
    end
    self.StartSlide = false
  elseif self.CurButtonState == "Attack" then
    self.OwnerPanel:TryToPlayTargetCommand("Attack", false)
    self:AddTimer(0.03, function()
      self.OwnerPanel:TryToStopTargetCommand("Attack", false)
    end, false)
    self.StartSlide = false
  elseif self.CurButtonState == "Slide" then
    self.StartSlide = false
  end
  self:AddTimer(0.05, function()
    self.OwnerPanel:TryToStopTargetCommand("Slide", true)
  end, false)
end

function Jump_Phone_C:PlayAndSetVisibility(SkillName)
  EMUIAnimationSubsystem:EMPlayAnimation(self, self["VX_" .. SkillName])
  self.PanelMaterial:SetScalarParameterValue(OpacityName[SkillName], 0)
end

function Jump_Phone_C:PlayStateAnimation()
  if self.LastButtonState ~= self.CurButtonState then
    if self.CurButtonState == "Jump" then
      if self.SkillInfos[ESkillName.BulletJump].SkillActive and (not (EMUIAnimationSubsystem:EMPlayAnimation(self, self.VX_Bullet_Jump) and EMUIAnimationSubsystem:EMPlayAnimation(self, self.Click)) or not EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)) then
        if self.LastAnime then
          EMUIAnimationSubsystem:EMPlayAnimation(self, self.LastAnime, EUMGSequencePlayMode.Reverse)
        end
        self.LastAnime = self.VX_Bullet_Jump
        self:PlayAndSetVisibility("Bullet_Jump")
      end
    elseif self.CurButtonState == "Attack" then
      if self.SkillInfos[ESkillName.Attack].SkillActive and (not (EMUIAnimationSubsystem:EMPlayAnimation(self, self.VX_Slide_Attack) and EMUIAnimationSubsystem:EMPlayAnimation(self, self.Click)) or not EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)) then
        if self.LastAnime then
          EMUIAnimationSubsystem:EMPlayAnimation(self, self.LastAnime, EUMGSequencePlayMode.Reverse)
        end
        self.LastAnime = self.VX_Slide_Attack
        self:PlayAndSetVisibility("Slide_Attack")
      end
    elseif self.CurButtonState == "Slide" then
      if self.SkillInfos[ESkillName.Slide].SkillActive and (not (EMUIAnimationSubsystem:EMPlayAnimation(self, self.VX_Slide) and EMUIAnimationSubsystem:EMPlayAnimation(self, self.Click)) or not EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)) then
        if self.LastAnime then
          EMUIAnimationSubsystem:EMPlayAnimation(self, self.LastAnime, EUMGSequencePlayMode.Reverse)
        end
        self.LastAnime = self.VX_Slide
        self:PlayAndSetVisibility("Slide")
      end
    elseif self.CurButtonState == "Normal" then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Click)
      self:EndBtnAnimation()
    elseif self.CurButtonState == "Press" then
      if self.LastAnime then
        EMUIAnimationSubsystem:EMPlayAnimation(self, self.LastAnime, EUMGSequencePlayMode.Reverse)
        self.LastAnime = nil
      end
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Press)
    end
  end
  self.LastButtonState = self.CurButtonState
end

function Jump_Phone_C:EndBtnAnimation()
  if self.LastAnime then
    local anime = self.LastAnime
    self.LastAnime = nil
    self:AddTimer(0.1, function()
      if anime then
        EMUIAnimationSubsystem:EMPlayAnimation(self, anime, EUMGSequencePlayMode.Reverse)
        self:AddTimer(anime:GetEndTime(), function()
          EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
        end)
      else
        EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
      end
    end)
  end
end

function Jump_Phone_C:OnSkillActive(SkillName)
  if not self.SkillInfos[SkillName] then
    return
  end
  self.SkillInfos[SkillName].SkillActive = true
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.SkillInfos[SkillName].AnimName)
end

function Jump_Phone_C:OnSkillInActive(SkillName)
  if not self.SkillInfos[SkillName] then
    return
  end
  self.SkillInfos[SkillName].SkillActive = false
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.SkillInfos[SkillName].AnimName, EUMGSequencePlayMode.Reverse)
end

function Jump_Phone_C:PlayVX(SkillName, IsClose)
  if IsClose then
    self:OnGuideEnd()
    return
  end
  self.GuidingSkill = self.GuidingSkill or {}
  local CurEvent
  if "SlideAttack" == SkillName then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Guide_Slide_Attack)
    CurEvent = EventID.OnSlideAttackPressed
    self.GuidingSkill.Slide_Attack = CurEvent
  elseif SkillName == ESkillName.Slide or "Slide" == SkillName then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Guide_Slide)
    CurEvent = EventID.OnSlidePressed
    self.GuidingSkill.Slide = CurEvent
  elseif SkillName == ESkillName.BulletJump or "BulletJump" == SkillName then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Guide_Bullet_Jump)
    CurEvent = EventID.OnBulletJumpStarted
    self.GuidingSkill.Bullet_Jump = CurEvent
  else
    return
  end
  self.Panel_State_Guide:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.ListenEvent = self.ListenEvent or {}
  self:AddDispatcher(CurEvent, self, function()
    self:OnUseGuidingSkill(SkillName)
  end)
end

function Jump_Phone_C:OnUseGuidingSkill(SkillName)
  if not self.GuidingSkill[SkillName] then
    return
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self["Guide_" .. SkillName], EUMGSequencePlayMode.Reverse)
  self:RemoveDispatcher(self.GuidingSkill[SkillName])
  self.GuidingSkill[SkillName] = nil
end

function Jump_Phone_C:OnGuideEnd()
  self.GuidingSkill = self.GuidingSkill or {}
  for SkillName, _ in pairs(self.GuidingSkill) do
    EMUIAnimationSubsystem:EMPlayAnimation(self, self["Guide_" .. SkillName], EUMGSequencePlayMode.Reverse)
  end
  self.Panel_State_Guide:SetVisibility(ESlateVisibility.Collapsed)
  self.GuidingSkill = {}
end

return Jump_Phone_C
