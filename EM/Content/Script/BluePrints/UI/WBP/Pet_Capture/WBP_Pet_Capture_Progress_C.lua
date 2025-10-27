require("UnLua")
local PetBehavior = {
  Angry = "Angry",
  Happy = "Happy",
  Death = "Death"
}
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Success then
    self:CaptureSuccess()
  elseif Animation == self.Fail then
    self:CaptureFail()
  end
end

function M:OnLoaded()
end

function M:StartProgressAnimation(PetOwner, Probability, IsSuccess, UniqueId)
  self.PetOwner = PetOwner
  self.PetUniqueId = UniqueId
  self.Root:SetVisibility(ESlateVisibility.Visible)
  self:PlayAnimation(self.In)
  self.Text_Process:SetText(0)
  Probability = 1 ~= Probability and Probability or 10
  local ProbabilityId = Probability * 10 + (IsSuccess and 1 or 0)
  if not DataMgr.CaptureProgressCondition[ProbabilityId] then
    return
  end
  local ProgressProbList = DataMgr.CaptureProgressCondition[ProbabilityId].ProgressProbList
  local CaptureProgressId = ProgressProbList[math.random(1, #ProgressProbList)]
  self.IsSuccess = IsSuccess
  self.Growth1 = DataMgr.CaptureProgress[CaptureProgressId].Growth1 + math.random(-5, 4)
  local Growth3 = DataMgr.CaptureProgress[CaptureProgressId].Growth3
  self.Growth2 = (not (not IsSuccess or Growth3) or 0 == Growth3) and 100 or DataMgr.CaptureProgress[CaptureProgressId].Growth2 + math.random(-5, 4) + self.Growth1
  if Growth3 then
    if not IsSuccess then
      Growth3 = Growth3 + math.random(-5, 4) + self.Growth2
      self.Growth3 = Growth3 >= 100 and 99 or Growth3
    else
      self.Growth3 = 100
    end
  end
  self.ProgressMaterial = self.Progress_Capture:GetDynamicMaterial()
  self.VXProgressMaterial = self.VX_Progress_Glow:GetDynamicMaterial()
  self:StartFirstGrow()
end

function M:CaptureSuccess()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Pet = Avatar:GetPetByUniqueId(self.PetUniqueId)
  local AffixList = {}
  local EntryIds = Pet and Pet.Entry or {}
  for i, EntryId in ipairs(EntryIds) do
    local Data = DataMgr.PetEntry[EntryId]
    if Data then
      table.insert(AffixList, EntryId)
    end
  end
  local PetId = Pet and Pet.PetId or self.PetOwner.UnitId
  local IsPremium = PetId and 1 == DataMgr.Pet[PetId].Premium or false
  self.PetOwner:TriggerABPPetStateChange(3)
  self.PetOwner:OnPetStatesSwitch(3)
  self.PetOwner:AddTimer(0, function()
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:LoadUINew("ExploreToastSuccess", "UI_Pet_CaptureSuccess", 2)
    AudioManager(self):PlayUISound(self, "event:/ui/common/pet_catch_success", nil, nil)
  end)
  DebugPrint("ZDX_Capture CaptureSuccess:" .. PetId)
  self.PetOwner:AddTimer(2, function()
    DebugPrint("ZDX_Capture Pet: PetId:" .. PetId)
    UIUtils.ShowGotItemTipsUI("Pet", PetId, 1, {AffixList = AffixList, IsPremium = IsPremium})
  end)
  self.PetOwner:AddTimer(4, function()
    self:HideProgress(true)
  end)
end

function M:CaptureFail()
  self.PetOwner:TriggerABPPetStateChange(4)
  self.PetOwner:OnPetStatesSwitch(4)
  self.PetOwner:AddTimer(0, function()
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    UIManager:LoadUINew("ExploreToastFail", "UI_Pet_CaptureFail", 2)
    AudioManager(self):PlayUISound(self, "event:/ui/common/pet_catch_fail", nil, nil)
  end)
  self.PetOwner:AddTimer(4, function()
    self:HideProgress(false)
  end)
end

function M:HideProgress(Result)
  self.Root:SetVisibility(ESlateVisibility.Collapsed)
  self.PetOwner:RegisterUpdateProgressFunc()
  self.PetOwner:OnInteractiveFinish(Result)
end

function M:StartFirstGrow()
  self.PetOwner:TriggerABPPetStateChange(2)
  self.PetOwner:OnPetStatesSwitch(2)
  self:PlayAnimationForward(self.FirstRise)
  AudioManager(self):PlayUISound(self, "event:/ui/common/pet_catch_progress_1", nil, nil)
  self.PetOwner:RegisterUpdateProgressFunc(function(DeltaTime)
    local Value = self.Growth1 * DeltaTime
    self.ProgressMaterial:SetScalarParameterValue("Percent", Value / 100)
    self.VXProgressMaterial:SetScalarParameterValue("Percent", Value / 100)
    local ProgressValue = math.modf(Value)
    self.Text_Process:SetText(ProgressValue)
    if ProgressValue == self.Growth1 then
      self.PetOwner.ProgressTimeline:Stop()
      self.PetOwner:AddTimer_Combat(0.7, function()
        self:StartSecondGrow()
      end)
    end
  end)
  self.PetOwner.ProgressTimeline:PlayFromStart()
  self:PlayPetVoice(PetBehavior.Angry)
end

function M:StartSecondGrow()
  self:PlayAnimationForward(self.SecondRise)
  if 100 == self.Growth2 then
    AudioManager(self):PlayUISound(self, "event:/ui/common/pet_catch_progress_3", nil, nil)
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/pet_catch_progress_2", nil, nil)
  end
  self.PetOwner:RegisterUpdateProgressFunc(function(DeltaTime)
    local Value = self.Growth2 - self.Growth1
    Value = Value * DeltaTime + self.Growth1
    self.ProgressMaterial:SetScalarParameterValue("Percent", Value / 100)
    self.VXProgressMaterial:SetScalarParameterValue("Percent", Value / 100)
    local ProgressValue = math.modf(Value)
    self.Text_Process:SetText(ProgressValue)
    if 100 == ProgressValue then
      self:PlayEndAnimation(true)
      self.PetOwner.ProgressTimeline:Stop()
    elseif ProgressValue == self.Growth2 then
      self.PetOwner.ProgressTimeline:Stop()
      self.PetOwner:AddTimer_Combat(0.7, function()
        self:StartThirdGrow()
      end)
    end
  end)
  self.PetOwner.ProgressTimeline:PlayFromStart()
  self:PlayPetVoice(PetBehavior.Angry)
end

function M:StartThirdGrow()
  self:PlayAnimationForward(self.ThirdRise)
  AudioManager(self):PlayUISound(self, "event:/ui/common/pet_catch_progress_3", nil, nil)
  self.PetOwner:RegisterUpdateProgressFunc(function(DeltaTime)
    local Value = self.Growth3 - self.Growth2
    Value = Value * DeltaTime + self.Growth2
    self.ProgressMaterial:SetScalarParameterValue("Percent", Value / 100)
    self.VXProgressMaterial:SetScalarParameterValue("Percent", Value / 100)
    local ProgressValue = math.modf(Value)
    self.Text_Process:SetText(ProgressValue)
    if 100 == ProgressValue then
      self:PlayEndAnimation(true)
      self.PetOwner.ProgressTimeline:Stop()
    elseif ProgressValue == self.Growth3 then
      self:PlayEndAnimation(false)
      self.PetOwner.ProgressTimeline:Stop()
    end
  end)
  self.PetOwner.ProgressTimeline:PlayFromStart()
  self:PlayPetVoice(PetBehavior.Angry)
end

function M:PlayEndAnimation(IsSuccess)
  if IsSuccess then
    AudioManager(self):PlayUISound(self, "event:/ui/common/pet_catch_progress_success", nil, nil)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Success)
    self:PlayPetVoice(PetBehavior.Happy)
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/pet_catch_progress_fail", nil, nil)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Fail)
    self:PlayPetVoice(PetBehavior.Death)
  end
end

function M:PlayPetVoice(Behavior)
  local PetId = self.PetOwner.UnitId
  local PetData = DataMgr.Pet[PetId]
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local PetNameTag = PetData and PetData.PetNameTag
  if Behavior == PetBehavior.Happy then
    AudioManager(self):StopSound(Player, "PetHappy")
    AudioManager(self):PlayPetVoice(Player, PetNameTag, "vo_happy", "PetHappy")
  elseif Behavior == PetBehavior.Death then
    AudioManager(self):StopSound(Player, "PetUpset")
    AudioManager(self):PlayPetVoice(Player, PetNameTag, "vo_upset", "PetUpset")
  elseif Behavior == PetBehavior.Angry then
    AudioManager(self):StopSound(Player, "PetAngry")
    AudioManager(self):PlayPetVoice(Player, PetNameTag, "vo_angry", "PetAngry")
  end
end

return M
