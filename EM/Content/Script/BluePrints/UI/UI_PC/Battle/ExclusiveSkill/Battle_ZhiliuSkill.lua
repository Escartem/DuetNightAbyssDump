local M = Class("BluePrints.UI.UI_PC.Battle.ExclusiveSkill.Base.Battle_Skill_UI_Base")

function M:Construct()
  self.WidgetSwitcher_Mix:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Text_Time:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Progress:SetRenderOpacity(0)
  self.Img_Line:SetRenderOpacity(0)
  self.Text_Time:SetRenderOpacity(0)
end

function M:Destruct()
  if self:IsExistTimer("RefreshSkillCreatureLifeTimeProgress") then
    self:RemoveTimer("RefreshSkillCreatureLifeTimeProgress")
  end
end

function M:OnLoaded(OwnerPlayer, Params)
  self.Super.OnLoaded(self)
  self.Owner = OwnerPlayer
  self.WindBuffId = Params.WindBuffId
  self.ThunderBuffId = Params.ThunderBuffId
  self.PassiveEffectId = Params.PassiveEffectId
  self.BuffId2MarkType = {
    [self.WindBuffId] = "Wind",
    [self.ThunderBuffId] = "Thunder"
  }
  self.PassiveEffectObj = self.Owner:GetPassiveEffectById(self.PassiveEffectId)
  self:AddDispatcher(EventID.CharDie, self, self.OnCharDie)
end

function M:RemoveMark(bIndex0, bIndex1)
  if bIndex0 and bIndex1 then
    self.ZhiliuSKill_Item_1:PlayOutAnimation()
    self.ZhiliuSKill_Item_2:PlayOutAnimation()
  elseif bIndex0 then
    if not IsValid(self.PassiveEffectObj) then
      self.PassiveEffectObj = self.Owner:GetPassiveEffectById(self.PassiveEffectId)
    end
    if IsValid(self.PassiveEffectObj) and IsStandAlone(self) then
      local Length = self.PassiveEffectObj.MarkSet:Length()
      if 2 == Length or 1 == Length then
        local BuffId = self.PassiveEffectObj.MarkSet:Get(1).BuffId
        local MarkType = self.BuffId2MarkType[BuffId]
        self.ZhiliuSKill_Item_1:PlayInAnimation(MarkType)
        self.ZhiliuSKill_Item_2:PlaySwitchAnimation()
      else
        self.ZhiliuSKill_Item_1:PlayOutAnimation()
      end
    else
      local PassiveEffectClient = self.Owner:GetPassiveEffectClient()
      if IsValid(PassiveEffectClient) then
        local BuffId = PassiveEffectClient.MarkSet:Get(1)
        if BuffId > 0 then
          local MarkType = self.BuffId2MarkType[BuffId]
          self.ZhiliuSKill_Item_1:PlayInAnimation(MarkType)
          self.ZhiliuSKill_Item_2:PlaySwitchAnimation()
        else
          self.ZhiliuSKill_Item_1:PlayOutAnimation()
        end
      end
    end
  elseif bIndex1 then
    self.ZhiliuSKill_Item_2:PlayOutAnimation()
  end
end

function M:AddMark(Index, BuffId)
  local MarkType = self.BuffId2MarkType[BuffId]
  if 0 == Index then
    self.ZhiliuSKill_Item_1:PlayInAnimation(MarkType)
  elseif 1 == Index then
    self.ZhiliuSKill_Item_2:PlayInAnimation(MarkType)
  end
end

function M:FusionMark(BuffId0, BuffId1)
  self.WidgetSwitcher_Mix:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  if BuffId0 == self.WindBuffId and BuffId1 == self.WindBuffId then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Tips_Wind)
  elseif BuffId0 == self.ThunderBuffId and BuffId1 == self.ThunderBuffId then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Tips_Thunder)
  else
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Tips_Wind_Thunder)
  end
end

function M:InitSkillItem()
  self.ZhiliuSKill_Item_1:InitSkillItem()
  self.ZhiliuSKill_Item_2:InitSkillItem()
end

function M:OnCharDie()
  self:InitSkillItem()
end

function M:ShowSkillCreatureLifeTime(SkillCreature)
  if IsValid(SkillCreature) then
    self.SkillCreature = SkillCreature
    self.TotalLifeTime = self.SkillCreature:GetTotalLifeTime()
    if self.TotalLifeTime < 0 then
      if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Out) then
        EMUIAnimationSubsystem:EMStopAnimation(self, self.Out)
      end
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.In)
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Switch)
      self.Text_Time:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Progress_L:SetPercent(1)
      self.Progress_R:SetPercent(1)
    else
      local LeftLifeTime = self.SkillCreature:GetLeftLifeTime()
      if LeftLifeTime > 0 then
        if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Out) then
          EMUIAnimationSubsystem:EMStopAnimation(self, self.Out)
        end
        EMUIAnimationSubsystem:EMPlayAnimation(self, self.In)
        EMUIAnimationSubsystem:EMPlayAnimation(self, self.Switch, EUMGSequencePlayMode.Reverse)
        self.Text_Time:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
        if not self:IsExistTimer("RefreshSkillCreatureLifeTimeProgress") then
          self:RefreshSkillCreatureLifeTimeProgress()
          self:AddTimer(0.1, self.RefreshSkillCreatureLifeTimeProgress, true, 0, "RefreshSkillCreatureLifeTimeProgress")
        end
      end
    end
  end
end

function M:HideSkillCreatureLifeTime()
  if self:IsExistTimer("RefreshSkillCreatureLifeTimeProgress") then
    self:RemoveTimer("RefreshSkillCreatureLifeTimeProgress")
  end
  if self.SkillCreature then
    if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.In) then
      EMUIAnimationSubsystem:EMStopAnimation(self, self.In)
    end
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Out)
    self.SkillCreature = nil
  end
end

function M:RefreshSkillCreatureLifeTimeProgress()
  if IsValid(self.SkillCreature) then
    local LeftLifeTime = self.SkillCreature:GetLeftLifeTime()
    local Percent = LeftLifeTime / self.TotalLifeTime
    self.Progress_L:SetPercent(Percent)
    self.Progress_R:SetPercent(Percent)
    local TimeString = string.format("%.0fs", LeftLifeTime)
    self.Text_Time:SetText(TimeString)
    if LeftLifeTime <= 0 then
      self:HideSkillCreatureLifeTime()
    end
  end
end

return M
