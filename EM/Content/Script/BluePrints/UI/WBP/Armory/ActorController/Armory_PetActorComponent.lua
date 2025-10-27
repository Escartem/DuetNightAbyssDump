local M = {}

function M:Init()
  EventManager:AddEvent(EventID.OnArmoryShowPet, self, self.OnArmoryShowPet)
  EventManager:AddEvent(EventID.OnPetEffectCreatureCreated, self, self.OnPetEffectCreatureCreated)
end

function M:ChangePetModel(Info, PlayCharacter, Params)
  self.CurrentPetInfo = Info
  
  function self.RealChangePetModel()
    PlayCharacter = PlayCharacter or self.ArmoryPlayer
    PlayCharacter:ServerRemoveBattlePet()
    local AudioManager = AudioManager(self.ViewUI)
    if Info and Info.PetId then
      if Info.Type == "BattlePass" then
        self:CreatePetEffectCreature(Info.PetId, Params)
      else
        self.WaitForServerSetBattlePet = true
        PlayCharacter:ServerSetBattlePet(Info.PetId, Info.BattlePetLevel, false)
      end
      if not AudioManager:IsSoundPlaying(self.ViewUI, "PetIdle") then
        AudioManager:PlayUISound(self.ViewUI, "event:/ui/armory/open_pet_idle", "PetIdle", nil)
      end
      self:PlayPetVoice("vo_hello")
      self:HidePetActor("ActorController_ChangeViewTarget", false)
    else
      AudioManager:SetEventSoundParam(self.ViewUI, "PetIdle", {ToEnd = 1})
    end
  end
  
  if self.bWaitForNotifyToChangePet then
    return
  else
    self.RealChangePetModel()
  end
end

function M:PlayPetVoice(VoiceStr)
  local PetId = self.CurrentPetInfo and self.CurrentPetInfo.PetId
  local PetData = DataMgr.Pet[PetId]
  if PetData then
    AudioManager(self.ArmoryPlayer):PlayPetVoice(self.ArmoryPlayer, PetData.PetNameTag, VoiceStr, "ArmoryPetVoice")
  end
end

function M:OnArmoryShowPet()
  if self.bWaitForNotifyToChangePet then
    self.bWaitForNotifyToChangePet = false
    self.bShouldSetPetFresnel = true
    self.RealChangePetModel()
  end
end

function M:OnPetEffectCreatureCreated(BattlePet, Owner)
  if not (self.WaitForServerSetBattlePet and self.ViewUI and self.ViewUI:IsVisible() and IsValid(self.ArmoryPlayer)) or Owner ~= self.ArmoryPlayer then
    return
  end
  if self.ArmoryPlayer:GetBattlePet() ~= BattlePet then
    self:HidePetActor(self.UIName, true)
    return
  end
  self.WaitForServerSetBattlePet = false
  local BattlePet = self.ArmoryPlayer:GetBattlePet()
  if BattlePet and BattlePet.EffectCreature then
    BattlePet.EffectCreature:SetActorHiddenInGame(false)
  end
  if self.bShouldSetPetFresnel then
    self.bShouldSetPetFresnel = false
    self:SetPetFresnel(self.ArmoryPlayer)
  end
end

function M:GetPetActor()
  if IsValid(self.ArmoryPlayer) then
    local BattlePet = self.ArmoryPlayer:GetBattlePet()
    return BattlePet and BattlePet.EffectCreature
  end
end

function M:HidePetActor(Tag, IsHidden)
  if IsValid(self.ArmoryPlayer) then
    local BattlePet = self.ArmoryPlayer:GetBattlePet()
    if BattlePet then
      BattlePet:HideBattlePet(Tag, IsHidden)
    end
  end
  if IsValid(self.EffectCreature) then
    self.EffectCreature:SetActorHiddenInGame(IsHidden)
  end
end

function M:SetPetFresnel(Player)
  local BattlePet = Player:GetBattlePet()
  local EffectCreature = BattlePet and BattlePet.EffectCreature
  if EffectCreature and EffectCreature.FashionComponent then
    local FresnelColor = FLinearColor(1, 0.1, 0)
    local FresnelColorRange = 1
    local FresnelColorStrength = 50
    local FresnelPriority = 999
    local Duration = 1
    local FresnelColorCurve = LoadObject("CurveLinearColor'/Game/Asset/Effect/Curve/PostCurve/FX_PostCurve_10.FX_PostCurve_10'")
    local bImmediately = false
    EffectCreature.FashionComponent:SetFresnel(EffectCreature, FresnelColor, FresnelColorRange, FresnelColorStrength, FresnelPriority, Duration, FresnelColorCurve, bImmediately)
    CommonUtils:SetActorTickableWhenPaused(EffectCreature, true)
    self.ViewUI:AddTimer(Duration, function()
      self:RemovePetFresnel(Player)
    end, false, 0, "DelayRemoveFresnel", true)
    if self.OnPlayPetFresnel then
      self.OnPlayPetFresnel(self.EventObj)
    end
  end
end

function M:RemovePetFresnel(Player)
  local BattlePet = Player:GetBattlePet()
  local EffectCreature = BattlePet and BattlePet.EffectCreature
  if EffectCreature and EffectCreature.FashionComponent then
    EffectCreature.FashionComponent:RemoveFresnel(EffectCreature)
  end
end

function M:CreatePetEffectCreature(PetId, Params)
  Params = Params or {}
  local PetData = DataMgr.Pet[PetId]
  if self.EffectCreatureId and self.EffectCreatureId == PetData.EffectCreatureId then
    return
  elseif self.EffectCreatureId and self.EffectCreatureId ~= PetData.EffectCreatureId and self.EffectCreature then
    self.EffectCreature:SetActorHiddenInGame(true)
    self._Player:RemoveEffectCreature(self.EffectCreatureId)
  end
  self.EffectCreatureId = PetData.EffectCreatureId
  self._Player = UGameplayStatics.GetPlayerCharacter(self.ViewUI, 0)
  self.EffectCreature = self._Player:CreateEffectCreature(self.EffectCreatureId, FTransform(), true, "Root")
  self.EffectCreature:SetOwner(self.ArmoryPlayer)
  self.EffectCreature.OwnerPlayer = self.ArmoryPlayer
  self.EffectCreature:UpdateTickableWhenPaused()
  if not self.ActorTransform then
    self.ActorTransform = self.ArmoryPlayer:GetTransform()
  end
  self.EffectCreature:K2_SetActorTransform(FTransform(self.ActorTransform.Rotation, self.ActorTransform.Translation, self.ActorTransform.Scale3D), false, nil, false)
  self.EffectCreature.SkeletalMesh:K2_AddRelativeLocation(Params.Location or FVector(0, -40, 25), false, nil, false)
  self.EffectCreature:SetActorHiddenInGame(false)
  self.EffectCreature.SkeletalMesh:SetTickableWhenPaused(true)
end

function M:DestroyPetEffectCreature()
  if self.EffectCreature then
    self.EffectCreature:SetActorHiddenInGame(true)
    self._Player:RemoveEffectCreature(self.EffectCreatureId)
    self.EffectCreatureId = nil
    self.EffectCreature = nil
  end
end

function M:PetLvUpOrBreakUp()
  local ArmoryPet = self:GetPetActor()
  if not ArmoryPet then
    return
  end
  local MeshLocation = ArmoryPet.SkeletalMesh:K2_GetComponentLocation()
  if ArmoryPet then
    ArmoryPet.FXComponent:PlayEffectByIDParams(305, {
      bTickEvenWhenPaused = true,
      UseAbsoluteLocation = true,
      Location = {
        MeshLocation.X,
        MeshLocation.Y,
        MeshLocation.Z
      }
    })
  end
end

function M:Component_OnClosed()
  self:HidePetActor(self.UIName, true)
end

function M:Component_OnDestruct()
  self.CurrentPetInfo = nil
  self:DestroyPetEffectCreature()
  EventManager:RemoveEvent(EventID.OnArmoryShowPet, self)
  EventManager:RemoveEvent(EventID.OnPetEffectCreatureCreated, self)
end

return M
