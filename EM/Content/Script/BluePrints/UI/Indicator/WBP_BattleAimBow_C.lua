require("UnLua")
local WBP_BattleAimBow_C = Class({
  "BluePrints.UI.Indicator.WBP_BattleAim_C"
})

function WBP_BattleAimBow_C:Init(Root)
  self.Root = Root
  self.CurSightUI = Root.SightUI
  self.CircleAngle = 360
  self.LastNormalChargeAngle = 45
  self.IntoChargeAngle = 240
  self.SightUI2FunctionType = {
    Bow01 = "NoCharge",
    Bow02 = "TwoStageCharge",
    Bow03 = "OneStageCharge",
    Shotgun02 = "OneStageCharge"
  }
  self.AimStarTable = {
    self.Bow_Dot,
    self.Bow_L,
    self.Bow_L_Glow,
    self.Bow_R,
    self.Bow_R_Glow
  }
  self.AimAnimations = {
    self.Bow_Normal,
    self.Bow_NormalAttack,
    self.Bow_NormalCharge_In,
    self.Bow_NormalCharge_Out,
    self.Bow_PerfectCharge_In,
    self.Bow_PerfectCharge_Out
  }
  DebugPrint("gyy@ BattleAimBow Init")
end

function WBP_BattleAimBow_C:GetHeavyChargeId()
  local HeavyChargeId = self.HeavyChargeId
  local BattleWeaponConfigData = DataMgr.BattleWeapon[self.Root.CurrentWeapon.WeaponId]
  if BattleWeaponConfigData.FrontSight then
    local FrontSightInfo = BattleWeaponConfigData.FrontSight
    if FrontSightInfo.HeavyChargeId then
      HeavyChargeId = FrontSightInfo.HeavyChargeId
    end
  end
  return HeavyChargeId
end

function WBP_BattleAimBow_C:Refresh()
  DebugPrint("gyy@ BattleAimBow Refresh")
  self.BowPinAngle = 0
  self.AccumulatePercent = 0
  self.BowNormalTime = nil
  self.BowNormalChargeTime = nil
  self.BowPerfectChargeTime = nil
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bow_Normal)
  self.CurSightUI = self.Root.SightUI
end

function WBP_BattleAimBow_C:SetInfo_NoCharge()
end

function WBP_BattleAimBow_C:SetInfo_TwoStageCharge()
  local HeavyChargeId = self:GetHeavyChargeId()
  self.HeavyChargeId = HeavyChargeId
  local HeavyChargeInterval = self.Root.OwnerPlayer:GetHeavyChargeIntervalById(self.HeavyChargeId)
  if HeavyChargeInterval:Num() > 0 then
    if self.BowNormalTime == HeavyChargeInterval[1] and self.BowNormalChargeTime == HeavyChargeInterval[2] and self.BowPerfectChargeTime == HeavyChargeInterval[3] then
      DebugPrint("gyy@ HeavyChargeInterval Is Same")
      return
    else
      self.BowNormalTime = HeavyChargeInterval[1]
      self.BowNormalChargeTime = HeavyChargeInterval[2]
      self.BowPerfectChargeTime = HeavyChargeInterval[3]
    end
  else
    DebugPrint("gyy@ HeavyChargeInterval Is Empty")
    return
  end
  local BowAreaMat1 = self.Bow_Area_1:GetDynamicMaterial()
  local BowAreaMat2 = self.Bow_Area_2:GetDynamicMaterial()
  local BowAreaMat3 = self.Bow_Area_3:GetDynamicMaterial()
  DebugPrint("gyy@ Set BowChargeMat")
  self.BowChargeMat = self.Bow_Charge:GetDynamicMaterial()
  local RemainingAngle = self.CircleAngle - self.LastNormalChargeAngle
  local SumTime = self.BowNormalTime + self.BowNormalChargeTime + self.BowPerfectChargeTime
  self.AccumulateSpeed = RemainingAngle / SumTime
  local LastTime = self.LastNormalChargeAngle / self.AccumulateSpeed
  local RealSumTime = SumTime + LastTime
  BowAreaMat1:SetScalarParameterValue("Percent", self.BowNormalTime / RealSumTime)
  BowAreaMat2:SetScalarParameterValue("Percent", 1 - self.BowNormalTime / RealSumTime)
  BowAreaMat3:SetScalarParameterValue("Percent", self.BowPerfectChargeTime / RealSumTime)
  self.Bow_Area_3:SetRenderTransformAngle(-self.LastNormalChargeAngle)
  self.BowNormalPercent = self.BowNormalTime / RealSumTime
  self.BowNormalChargeInPercent = (self.BowNormalTime + self.BowPerfectChargeTime) / RealSumTime
  self.BowPerfectChargePercent = (self.BowNormalTime + self.BowPerfectChargeTime + self.BowPerfectChargeTime) / RealSumTime
end

function WBP_BattleAimBow_C:SetInfo_OneStageCharge()
  local HeavyChargeId = self:GetHeavyChargeId()
  self.HeavyChargeId = HeavyChargeId
  local HeavyChargeInterval = self.Root.OwnerPlayer:GetHeavyChargeIntervalById(self.HeavyChargeId)
  if HeavyChargeInterval:Num() > 0 then
    if self.BowChargeTime == HeavyChargeInterval[1] then
      DebugPrint("gyy@ HeavyChargeInterval Is Same")
      return
    else
      self.BowChargeTime = HeavyChargeInterval[1]
    end
  else
    DebugPrint("gyy@ HeavyChargeInterval Is Empty")
    return
  end
  local BowAreaMat1 = self.Bow_Area_1:GetDynamicMaterial()
  local BowAreaMat2 = self.Bow_Area_2:GetDynamicMaterial()
  local BowAreaMat3 = self.Bow_Area_3:GetDynamicMaterial()
  DebugPrint("gyy@ Set BowChargeMat")
  self.BowChargeMat = self.Bow_Charge:GetDynamicMaterial()
  self.AccumulateSpeed = self.IntoChargeAngle / self.BowChargeTime
  BowAreaMat1:SetScalarParameterValue("Percent", self.IntoChargeAngle / self.CircleAngle)
  BowAreaMat2:SetScalarParameterValue("Percent", 1 - self.IntoChargeAngle / self.CircleAngle)
  BowAreaMat3:SetScalarParameterValue("Percent", 1 - self.IntoChargeAngle / self.CircleAngle)
  self.Bow_Area_3:SetRenderTransformAngle(0)
  self.BowNormalPercent = self.IntoChargeAngle / self.CircleAngle
  self.BowPinAngle = 0
  self.AccumulatePercent = 0
end

function WBP_BattleAimBow_C:BeginAccumulate(Skill)
  self.AccumulateNodeId = Skill.NodeId
  if not self.LeaveNodeEventFlag then
    self.Root:RegisterLeaveNodeEvent()
    self.LeaveNodeEventFlag = true
  end
  self["SetInfo_" .. self.SightUI2FunctionType[self.CurSightUI]](self)
  self.BowPinAngle = 0
  self.AccumulatePercent = 0
  self.Bow_Pin:SetRenderTransformAngle(self.BowPinAngle)
  self.BowChargeMat:SetScalarParameterValue("Percent", self.AccumulatePercent)
  self["ChangeAccumulateState_" .. self.SightUI2FunctionType[self.CurSightUI]](self)
  self.Root.IsAccumulateState = true
  if not self.Root.UpdateAccumulateStateTimer then
    self.Root.UpdateAccumulateStateTimer = self.Root:AddTimer(0.033, self.Root.UpdateAccumulateStateInTick, true, 0, "UpdateAccumulateStateTimer", false, 0.033)
  end
end

function WBP_BattleAimBow_C:EndAccumulateOnLeaveNode(Owner, NodeId, SkillNode)
  if self.AccumulateNodeId and self.AccumulateNodeId ~= NodeId then
    return
  end
  if not SkillNode then
    return
  end
  if not self.Root.CurPanel or self.Root.CurPanel ~= self then
    return
  end
  if not IsValid(Owner) or self.Root.OwnerPlayer ~= Owner then
    return
  end
  if self.Root.IsAccumulateState then
    self["ChangeAccumulateState_" .. self.SightUI2FunctionType[self.CurSightUI]](self, "ForceEnd")
    self.Root.IsAccumulateState = false
    self.Root:RemoveTimer(self.Root.UpdateAccumulateStateTimer)
    self.Root.UpdateAccumulateStateTimer = nil
    self.Root:UnregisterLeaveNodeEvent()
    self.LeaveNodeEventFlag = false
  end
end

function WBP_BattleAimBow_C:TryToPlayAimDiffusionStartAnim()
  if self.Root.IsAccumulateState then
    self["ChangeAccumulateState_" .. self.SightUI2FunctionType[self.CurSightUI]](self, "End")
    self.Root.IsAccumulateState = false
    self.Root:RemoveTimer(self.Root.UpdateAccumulateStateTimer)
    self.Root.UpdateAccumulateStateTimer = nil
    self.Root:UnregisterLeaveNodeEvent()
    self.LeaveNodeEventFlag = false
  else
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bow_NormalAttack)
  end
end

function WBP_BattleAimBow_C:UpdateAccumulateStateInTick(InDeltaTime)
  self.BowPinAngle = self.BowPinAngle + self.AccumulateSpeed * InDeltaTime
  if self.BowPinAngle > self.CircleAngle then
    self.BowPinAngle = self.CircleAngle
  end
  self.AccumulatePercent = self.BowPinAngle / self.CircleAngle
  self["ChangeAccumulateState_" .. self.SightUI2FunctionType[self.CurSightUI]](self)
  self.Bow_Pin:SetRenderTransformAngle(self.BowPinAngle)
  self.BowChargeMat:SetScalarParameterValue("Percent", self.AccumulatePercent)
end

function WBP_BattleAimBow_C:ChangeAccumulateState_TwoStageCharge(NewAccumulateState)
  if not NewAccumulateState then
    if self.AccumulatePercent >= self.BowPerfectChargePercent then
      NewAccumulateState = "NormalCharge"
    elseif self.AccumulatePercent >= self.BowNormalChargeInPercent then
      NewAccumulateState = "PerfectCharge"
    elseif self.AccumulatePercent >= self.BowNormalPercent then
      NewAccumulateState = "NormalCharge"
    else
      NewAccumulateState = "Normal"
    end
  end
  if self.CurAccumulateState ~= NewAccumulateState then
    local LastAccumulateState = self.CurAccumulateState
    self.CurAccumulateState = NewAccumulateState
    self:StopAllAimAnimations()
    if "Normal" == self.CurAccumulateState then
      self.Bow_Dot:SetRenderOpacity(0)
      self.Target_Area:SetRenderOpacity(1)
      self.Bow_Charge:SetRenderOpacity(1)
      self.Bow_Pin:SetRenderOpacity(1)
    elseif self.CurAccumulateState == "ForceEnd" then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bow_Normal)
      if "PerfectCharge" == LastAccumulateState then
        self.Root:RefreshAimColorByState("LeaveForceDefault")
      end
    elseif self.CurAccumulateState == "End" then
      if "Normal" == LastAccumulateState then
        EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bow_NormalAttack)
      elseif "NormalCharge" == LastAccumulateState then
        EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bow_NormalCharge_Out)
      elseif "PerfectCharge" == LastAccumulateState then
        self.Root:RefreshAimColorByState("LeaveForceDefault")
        EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bow_Normal)
      end
    elseif "Normal" == LastAccumulateState and "NormalCharge" == self.CurAccumulateState then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bow_NormalCharge_In)
    elseif "NormalCharge" == LastAccumulateState and "PerfectCharge" == self.CurAccumulateState then
      self.Root:RefreshAimColorByState("ForceDefault")
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bow_PerfectCharge_In)
    elseif "PerfectCharge" == LastAccumulateState and "NormalCharge" == self.CurAccumulateState then
      self.Root:RefreshAimColorByState("LeaveForceDefault")
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bow_PerfectCharge_Out)
    end
  end
end

function WBP_BattleAimBow_C:ChangeAccumulateState_OneStageCharge(NewAccumulateState)
  if not NewAccumulateState then
    if self.AccumulatePercent >= self.BowNormalPercent then
      NewAccumulateState = "PerfectCharge"
    else
      NewAccumulateState = "Normal"
    end
  end
  if self.CurAccumulateState ~= NewAccumulateState then
    local LastAccumulateState = self.CurAccumulateState
    self.CurAccumulateState = NewAccumulateState
    self:StopAllAimAnimations()
    if "Normal" == self.CurAccumulateState then
      self.Bow_Dot:SetRenderOpacity(0)
      self.Target_Area:SetRenderOpacity(1)
      self.Bow_Charge:SetRenderOpacity(1)
      self.Bow_Pin:SetRenderOpacity(1)
    elseif self.CurAccumulateState == "ForceEnd" then
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bow_Normal)
      if "PerfectCharge" == LastAccumulateState then
        self.Root:RefreshAimColorByState("LeaveForceDefault")
      end
    elseif self.CurAccumulateState == "End" then
      if "Normal" == LastAccumulateState then
        EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bow_NormalAttack)
      elseif "PerfectCharge" == LastAccumulateState then
        self.Root:RefreshAimColorByState("LeaveForceDefault")
        EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bow_Normal)
      end
    elseif "Normal" == LastAccumulateState and "PerfectCharge" == self.CurAccumulateState then
      self.Root:RefreshAimColorByState("ForceDefault")
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Bow_PerfectCharge_In)
    end
  end
end

function WBP_BattleAimBow_C:StopAllAimAnimations()
  for _, Aniamtion in pairs(self.AimAnimations) do
    EMUIAnimationSubsystem:EMStopAnimation(self, Aniamtion)
  end
end

function WBP_BattleAimBow_C:SetBowChargeMatPercent(AccumulatePercent)
  if not IsValid(self.BowChargeMat) then
    self.BowChargeMat = self.Bow_Charge:GetDynamicMaterial()
  end
  if IsValid(self.BowChargeMat) then
    self.BowChargeMat:SetScalarParameterValue("Percent", AccumulatePercent)
  end
end

return WBP_BattleAimBow_C
