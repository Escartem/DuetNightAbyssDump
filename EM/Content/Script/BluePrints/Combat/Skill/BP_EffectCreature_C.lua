local EMCache = require("EMCache.EMCache")
local BP_EffectCreature_C = Class()

function BP_EffectCreature_C:ReceiveBeginPlay()
  self.HideTags = {}
end

function BP_EffectCreature_C:Active()
  self.IsDestroy = false
  self:HideEffectCreatureByTag("Active", false)
  self:SetActorTickEnabled(true)
  local IsLooping = self.SkeletalMesh.AnimationData and self.SkeletalMesh.AnimationData.bSavedLooping or false
  self.SkeletalMesh:Play(IsLooping)
  self:RefreshEffectAnimation()
end

function BP_EffectCreature_C:DestroyEffectCreature()
  self:DeActive()
  local EffectCreatureData = DataMgr.EffectCreature[self.EffectCreatureId]
  local Owner = self:GetOwner()
  if EffectCreatureData.EnterPool then
    Owner:RecycleEffectCreature(self)
  else
    self:K2_DestroyActor()
  end
end

function BP_EffectCreature_C:DeActive()
  self.IsDestroy = true
  self:HideEffectCreatureByTag("Active", true)
  self:SetActorTickEnabled(false)
  self.SkeletalMesh:Stop()
  local Owner = self:GetOwner()
  Owner:AddOrRemoveEffectCreature(self, false)
  self:OnDeActive()
end

function BP_EffectCreature_C:ReceiveEndPlay(EndPlayReason)
  if not self.IsDestroy then
    self.IsDestroy = true
    local Owner = self:GetOwner()
    if Owner then
      Owner:AddOrRemoveEffectCreature(self, false)
    end
    self:OnDeActive()
  end
  self.Overridden.ReceiveEndPlay(self, EndPlayReason)
end

function BP_EffectCreature_C:ReplaceSkeletalMesh(EffectCreatureMesh, ModelId)
  if EffectCreatureMesh then
    self.SkeletalMesh:SetSkeletalMesh(EffectCreatureMesh)
  end
  if ModelId then
    if DataMgr.Model[ModelId].ModelScale then
      local Scale3D = Const.OneVector * DataMgr.Model[ModelId].ModelScale
      self.SkeletalMesh:SetRelativeScale3D(Scale3D)
    end
    if DataMgr.Model[ModelId].ModelAixsScale then
      local ModelAixsScale = DataMgr.Model[ModelId].ModelAixsScale
      local Scale3D = FVector(ModelAixsScale[1], ModelAixsScale[2], ModelAixsScale[3])
      self:SetActorScale3D(Const.OneVector * Scale3D)
    end
  end
  self.ModelId = ModelId
end

function BP_EffectCreature_C:InitEffectCreatureMeshInfo(EffectCreatureMesh, ModelId)
  local RealEffectCreatureId = self.ReplaceSkinEffectCreatureId and self.ReplaceSkinEffectCreatureId or self.EffectCreatureId
  local EffectCreatureConfig = DataMgr.EffectCreature[RealEffectCreatureId]
  self:ReplaceSkeletalMesh(EffectCreatureMesh, ModelId)
  if EffectCreatureConfig.ModelOffset then
    local ModelOffset = EffectCreatureConfig.ModelOffset
    ModelOffset = FVector(ModelOffset[1], ModelOffset[2], ModelOffset[3])
    self.SkeletalMesh:K2_AddLocalOffset(ModelOffset, false, nil, false)
  end
  self:LoadEffectCreatureAnim()
  self:UpdateTickableWhenPaused()
  if self.LoadMeshCallBack then
    self.LoadMeshCallBack()
  end
end

function BP_EffectCreature_C:InheritPreAnimation(AnimPosition)
  local RealEffectCreatureId = self.ReplaceSkinEffectCreatureId and self.ReplaceSkinEffectCreatureId or self.EffectCreatureId
  local EffectCreatureConfig = DataMgr.EffectCreature[RealEffectCreatureId]
  local EffectCreatureAnimPath
  if EffectCreatureConfig.MeshResourceIdByCreator then
    local Owner = self:GetOwner()
    local ModelId = Owner.ModelId
    local ModelConfig = DataMgr.Model[ModelId]
    local MontageFolder = ModelConfig.MontageFolder
    EffectCreatureAnimPath = EffectCreatureConfig.ReplaceAnimPath
    EffectCreatureAnimPath = string.gsub(EffectCreatureAnimPath, "Heitao_", ModelConfig.MontagePrefix)
    EffectCreatureAnimPath = MontageFolder .. EffectCreatureAnimPath
  else
    EffectCreatureAnimPath = EffectCreatureConfig.EffectCreatureAnimPath
  end
  if EffectCreatureAnimPath then
    local AnimationAsset = UE4.UResourceLibrary.FindObject(self, EffectCreatureAnimPath)
    if not AnimationAsset then
      UE4.UResourceLibrary.LoadObjectAsync(self, EffectCreatureAnimPath, {
        self,
        function(self, EffectCreatureAnim)
          self.SkeletalMesh:PlayAnimation(EffectCreatureAnim, true)
          self.SkeletalMesh:SetPosition(AnimPosition, false)
          self.SkeletalMesh:SetPlayRate(self.SkillSpeed)
        end
      })
    else
      self.SkeletalMesh:PlayAnimation(AnimationAsset, true)
      self.SkeletalMesh:SetPosition(AnimPosition, false)
      self.SkeletalMesh:SetPlayRate(self.SkillSpeed)
    end
  end
end

function BP_EffectCreature_C:UpdateEffectCreatureModel(ModelId)
  local ModelConfig = DataMgr.Model[ModelId]
  if not ModelConfig then
    return
  end
  local EffectCreatureMeshPath = "/Game/" .. ModelConfig.SkeletonMeshPath
  local ModelMesh = UE4.UResourceLibrary.FindObject(self, EffectCreatureMeshPath)
  local PlayingPosition = 0
  if self.SkeletalMesh:IsPlaying() then
    PlayingPosition = self.SkeletalMesh:GetPosition()
  end
  if not ModelMesh then
    UE4.UResourceLibrary.LoadObjectAsync(self, EffectCreatureMeshPath, {
      self,
      function(self, EffectCreatureMesh)
        self:ReplaceSkeletalMesh(EffectCreatureMesh, ModelId)
        self:InheritPreAnimation(PlayingPosition)
      end
    })
  else
    self:ReplaceSkeletalMesh(ModelMesh, ModelId)
    self:InheritPreAnimation(PlayingPosition)
  end
end

function BP_EffectCreature_C:LoadEffectCreatureResource()
  local RealEffectCreatureId = self.ReplaceSkinEffectCreatureId and self.ReplaceSkinEffectCreatureId or self.EffectCreatureId
  local EffectCreatureConfig = DataMgr.EffectCreature[RealEffectCreatureId]
  local ModelId
  if EffectCreatureConfig.MeshResourceIdByCreator then
    local Owner = self:GetOwner()
    ModelId = Owner.ModelId
  elseif EffectCreatureConfig.ReplaceByFish and EMCache:Get("FishingRodId", true) then
    local CacheRodId = EMCache:Get("FishingRodId", true)
    local FishingRodConfig = DataMgr.FishingRod[CacheRodId]
    if FishingRodConfig then
      ModelId = FishingRodConfig.MeshResourceId
    end
  else
    ModelId = EffectCreatureConfig.MeshResourceId
  end
  self.SkeletalMesh:SetVisibility(false)
  if ModelId then
    self.ModelId = ModelId
    local ModelConfig = DataMgr.Model[ModelId]
    local EffectCreatureMeshPath = "/Game/" .. ModelConfig.SkeletonMeshPath
    local ModelMesh = UE4.UResourceLibrary.FindObject(self, EffectCreatureMeshPath)
    if not ModelMesh then
      UE4.UResourceLibrary.LoadObjectAsync(self, EffectCreatureMeshPath, {
        self,
        function(self, EffectCreatureMesh)
          self:InitEffectCreatureMeshInfo(EffectCreatureMesh, ModelId)
        end
      })
    else
      self:InitEffectCreatureMeshInfo(ModelMesh, ModelId)
    end
  else
    self:InitEffectCreatureMeshInfo()
  end
end

function BP_EffectCreature_C:LoadEffectCreatureAnim()
  local RealEffectCreatureId = self.ReplaceSkinEffectCreatureId and self.ReplaceSkinEffectCreatureId or self.EffectCreatureId
  local EffectCreatureConfig = DataMgr.EffectCreature[RealEffectCreatureId]
  local EffectCreatureAnimPath
  if EffectCreatureConfig.MeshResourceIdByCreator then
    local Owner = self:GetOwner()
    local ModelId = Owner.ModelId
    local ModelConfig = DataMgr.Model[ModelId]
    local MontageFolder = ModelConfig.MontageFolder
    EffectCreatureAnimPath = EffectCreatureConfig.ReplaceAnimPath
    EffectCreatureAnimPath = string.gsub(EffectCreatureAnimPath, "Heitao_", ModelConfig.MontagePrefix)
    EffectCreatureAnimPath = MontageFolder .. EffectCreatureAnimPath
  else
    EffectCreatureAnimPath = EffectCreatureConfig.EffectCreatureAnimPath
  end
  if EffectCreatureAnimPath then
    local AnimationAsset = UE4.UResourceLibrary.FindObject(self, EffectCreatureAnimPath)
    if not AnimationAsset then
      UE4.UResourceLibrary.LoadObjectAsync(self, EffectCreatureAnimPath, {
        self,
        function(self, EffectCreatureAnim)
          self:PlayEffectCreatureAnimation(EffectCreatureAnim)
        end
      })
    else
      self:PlayEffectCreatureAnimation(AnimationAsset)
    end
  else
    self:PlayEffectCreatureAnimation()
  end
end

function BP_EffectCreature_C:PlayEffectCreatureAnimation(EffectCreatureAnim)
  if EffectCreatureAnim then
    self.SkeletalMesh:PlayAnimation(EffectCreatureAnim, true)
  end
  self:RefreshEffectAnimation()
  self.SkeletalMesh:SetVisibility(true)
  self:OnResourceReady()
end

function BP_EffectCreature_C:OnResourceReady()
  self.Overridden.OnResourceReady(self)
  self:SetPetEffectCreatureFX()
end

function BP_EffectCreature_C:RefreshEffectAnimation()
  if not self.LoadTime then
    return
  end
  local Owner = self:GetOwner()
  local Interval = Owner.SumDeltaSeconds - self.LoadTime
  Interval = Interval * self.SkillSpeed
  self.SkeletalMesh:SetPosition(Interval, false)
  self.SkeletalMesh:SetPlayRate(self.SkillSpeed)
end

function BP_EffectCreature_C:UpdateTickableWhenPaused()
  local Owner = self:GetOwner()
  if Owner:GetTickableWhenPaused() then
    self:SetTickableWhenPaused(true)
    local Components = self:K2_GetComponentsByClass(UActorComponent:StaticClass())
    if Components then
      for _, Component in pairs(Components) do
        Component:SetTickableWhenPaused(true)
      end
    end
  end
end

function BP_EffectCreature_C:HideEffectCreatureByTag(HideTag, IsHide)
  if IsHide then
    self.HideTags[HideTag] = true
  else
    self.HideTags[HideTag] = nil
  end
  local Num = CommonUtils.Size(self.HideTags)
  if Num > 0 == self.IsHide then
    return
  end
  self.IsHide = Num > 0
  self:SetActorHiddenInGame(self.IsHide)
end

return BP_EffectCreature_C
