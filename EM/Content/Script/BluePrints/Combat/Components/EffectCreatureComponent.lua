local Component = {}

function Component:InitEffectCreatureComponent()
  if not self.EffectCreatures then
    self.EffectCreatures = {}
  end
  if not self.EffectRecyclePool then
    self.EffectRecyclePool = {}
  end
  if not self.AsyncEffectCreatures then
    self.AsyncEffectCreatures = {}
  end
end

function Component:GetReplaceEffectCreatureIdBySkinId(EffectCreatureId)
  local EffectCreatureData = DataMgr.EffectCreature[EffectCreatureId]
  if EffectCreatureData and EffectCreatureData.ReplaceBySkin then
    local ModelId = self.ModelId
    return ModelId and EffectCreatureData.ReplaceBySkin[ModelId]
  end
end

function Component:AsyncCreateEffectCreatureById(EffectCreatureId, CreateEffectInfo)
  local Effect
  local AttachToCharacter = CreateEffectInfo.AttachToCharacter
  local Transform = CreateEffectInfo.Transform
  local LoadFinishCallBack = CreateEffectInfo.LoadFinishCallBack
  local SocketName = CreateEffectInfo.SocketName
  local SkillSpeed = CreateEffectInfo.SkillSpeed
  local ReplaceSkinEffectCreatureId = self:GetReplaceEffectCreatureIdBySkinId(EffectCreatureId)
  local CurSumDeltaSeconds = self.SumDeltaSeconds
  if self.EffectRecyclePool[EffectCreatureId] and #self.EffectRecyclePool[EffectCreatureId] > 0 then
    local Index = #self.EffectRecyclePool[EffectCreatureId]
    Effect = self.EffectRecyclePool[EffectCreatureId][Index]
    Effect.LoadTime = CurSumDeltaSeconds
    Effect.SkillSpeed = SkillSpeed
    if Effect.ReplaceSkinEffectCreatureId ~= ReplaceSkinEffectCreatureId then
      Effect.ReplaceSkinEffectCreatureId = ReplaceSkinEffectCreatureId
      Effect:LoadEffectCreatureResource()
    else
      Effect:Active()
    end
    self.EffectRecyclePool[EffectCreatureId][Index] = nil
    if not AttachToCharacter then
      Effect:K2_SetActorLocation(Transform.Translation, false, nil, false)
      Effect:K2_SetActorRotation(Transform.Rotation:ToRotator(), false, nil, false)
      Effect:SetActorScale3D(Transform.Scale3D)
    end
    if LoadFinishCallBack then
      LoadFinishCallBack(Effect)
    end
    if Effect and not Effect.IsDestroy then
      self:AddOrRemoveEffectCreature(Effect, true)
      if Effect.LoadMeshCallBack then
        Effect.LoadMeshCallBack()
      end
      Effect:LoadEffectCreatureResource()
      Effect.Overridden.ReceiveBeginPlay(Effect)
    end
  else
    local EffectCreatureData = DataMgr.EffectCreature[EffectCreatureId]
    local RealEffectCreaturePath = EffectCreatureData.EffectCreaturePath or "/Game/BluePrints/Combat/SkillCreatures/BP_EffectCreature.BP_EffectCreature"
    if not self.AsyncEffectCreatures[EffectCreatureId] then
      self.AsyncEffectCreatures[EffectCreatureId] = {}
    end
    self.AsyncEffectCreatures[EffectCreatureId][CreateEffectInfo] = true
    UE4.UResourceLibrary.LoadClassAsync(self, RealEffectCreaturePath, {
      self,
      function(self, BPCLass)
        if not IsValid(self) then
          return
        end
        if not self.AsyncEffectCreatures[EffectCreatureId] then
          return
        end
        if not self.AsyncEffectCreatures[EffectCreatureId][CreateEffectInfo] then
          return
        end
        self.AsyncEffectCreatures[EffectCreatureId][CreateEffectInfo] = nil
        if not BPCLass then
          DebugPrint("\231\137\185\230\149\136\229\136\155\231\148\159\231\137\169\232\183\175\229\190\132\228\184\186\231\169\186" .. RealEffectCreaturePath)
          return
        end
        if not AttachToCharacter then
          Effect = self:GetWorld():SpawnActor(BPCLass, Transform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
        else
          local OriginTransform
          if SocketName and nil ~= SocketName and self.Mesh:GetSocketBoneName(SocketName) ~= "None" then
            OriginTransform = self.Mesh:GetSocketTransform(SocketName, UE4.ERelativeTransformSpace.RTS_World)
          else
            OriginTransform = FTransform(self:K2_GetActorRotation():ToQuat(), self:K2_GetActorLocation(), self:GetActorScale3D())
          end
          Effect = self:GetWorld():SpawnActor(BPCLass, OriginTransform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
          if self.Mesh then
            Effect:K2_AttachToComponent(self.Mesh, SocketName, UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld)
          else
            Effect:K2_AttachToActor(self, "", UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld)
          end
          Effect.CustomTimeDilation = self.CustomTimeDilation
          if Transform then
            Effect:K2_AddActorLocalTransform(Transform, false, nil, false)
          end
        end
        Effect:SetOwner(self)
        Effect.LoadTime = CurSumDeltaSeconds
        Effect.SkillSpeed = SkillSpeed
        Effect.EffectCreatureId = EffectCreatureId
        Effect.ReplaceSkinEffectCreatureId = ReplaceSkinEffectCreatureId
        self:HideEffectCreatureByTags(Effect)
        if LoadFinishCallBack then
          LoadFinishCallBack(Effect)
        end
        if Effect and not Effect.IsDestroy then
          self:AddOrRemoveEffectCreature(Effect, true)
          Effect:LoadEffectCreatureResource()
          Effect.Overridden.ReceiveBeginPlay(Effect)
        end
      end
    })
  end
end

function Component:CreateEffectCreatureById(EffectCreatureId, CreateEffectInfo)
  local Effect
  local Transform = CreateEffectInfo.Transform
  local AttachToCharacter = CreateEffectInfo.AttachToCharacter
  local SocketName = CreateEffectInfo.SocketName
  local SkillSpeed = CreateEffectInfo.SkillSpeed
  local ReplaceSkinEffectCreatureId = self:GetReplaceEffectCreatureIdBySkinId(EffectCreatureId)
  if self.EffectRecyclePool[EffectCreatureId] and #self.EffectRecyclePool[EffectCreatureId] > 0 then
    local Index = #self.EffectRecyclePool[EffectCreatureId]
    Effect = self.EffectRecyclePool[EffectCreatureId][Index]
    Effect.LoadTime = self.SumDeltaSeconds
    Effect.SkillSpeed = SkillSpeed
    if Effect.ReplaceSkinEffectCreatureId ~= ReplaceSkinEffectCreatureId then
      Effect.ReplaceSkinEffectCreatureId = ReplaceSkinEffectCreatureId
      Effect:LoadEffectCreatureResource()
    else
      Effect:Active()
    end
    self.EffectRecyclePool[EffectCreatureId][Index] = nil
    if not AttachToCharacter then
      Effect:K2_SetActorLocation(Transform.Translation, false, nil, false)
      Effect:K2_SetActorRotation(Transform.Rotation:ToRotator(), false, nil, false)
      Effect:SetActorScale3D(Transform.Scale3D)
    end
    self:AddOrRemoveEffectCreature(Effect, true)
  else
    local EffectCreatureData = DataMgr.EffectCreature[EffectCreatureId]
    local RealEffectCreaturePath = EffectCreatureData.EffectCreaturePath or "/Game/BluePrints/Combat/SkillCreatures/BP_EffectCreature.BP_EffectCreature"
    local BPCLass = LoadClass(RealEffectCreaturePath)
    if not BPCLass then
      DebugPrint("\231\137\185\230\149\136\229\136\155\231\148\159\231\137\169\232\183\175\229\190\132\228\184\186\231\169\186" .. RealEffectCreaturePath)
      return
    end
    if not AttachToCharacter then
      Effect = self:GetWorld():SpawnActor(BPCLass, Transform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
    else
      local OriginTransform
      if self.Mesh and self.Mesh:GetSocketBoneName(SocketName) ~= "None" then
        OriginTransform = self.Mesh:GetSocketTransform(SocketName, UE4.ERelativeTransformSpace.RTS_World)
      else
        OriginTransform = FTransform(self:K2_GetActorRotation():ToQuat(), self:K2_GetActorLocation(), self:GetActorScale3D())
      end
      Effect = self:GetWorld():SpawnActor(BPCLass, OriginTransform, UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn)
      if self.Mesh then
        Effect:K2_AttachToComponent(self.Mesh, SocketName, UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld)
      else
        Effect:K2_AttachToActor(self, "", UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld)
      end
      Effect.CustomTimeDilation = self.CustomTimeDilation
      if Transform then
        Effect:K2_AddActorLocalTransform(Transform, false, nil, false)
      end
    end
    Effect.LoadTime = self.SumDeltaSeconds
    Effect.SkillSpeed = SkillSpeed
    Effect.ReplaceSkinEffectCreatureId = ReplaceSkinEffectCreatureId
    Effect:SetOwner(self)
    Effect.EffectCreatureId = EffectCreatureId
    self:HideEffectCreatureByTags(Effect)
    Effect:LoadEffectCreatureResource()
    self:AddOrRemoveEffectCreature(Effect, true)
  end
  if 0 == Effect.InitialLifeSpan then
    if not self.EffectCreatures[EffectCreatureId] then
      self.EffectCreatures[EffectCreatureId] = {}
    end
    table.insert(self.EffectCreatures[EffectCreatureId], Effect)
  end
  return Effect
end

function Component:AsyncCreateEffectCreatureWithCallBack(EffectCreatureId, Transform, AttachToCharacter, SocketName, CreateCallBack)
  self:InitEffectCreatureComponent()
  if 0 == EffectCreatureId then
    return
  end
  local EffectCreatureData = DataMgr.EffectCreature[EffectCreatureId]
  SocketName = SocketName and "" ~= SocketName and SocketName or EffectCreatureData.SocketName or "root"
  if not self.EffectCreatures[EffectCreatureId] then
    self.EffectCreatures[EffectCreatureId] = {}
  end
  
  local function LoadFinishCallBack(EffectCreature)
    if 0 == EffectCreature.InitialLifeSpan then
      table.insert(self.EffectCreatures[EffectCreatureId], EffectCreature)
    end
    CreateCallBack:Execute(EffectCreature)
  end
  
  local CurSkill = self:IsCharacter() and self:GetCurrentSkill()
  local SkillConfig = CurSkill and CurSkill.Data
  local SkillSpeedModify = SkillConfig and SkillConfig.SkillSpeedModify
  local SkillSpeed = SkillSpeedModify and self:GetCurrentSkillNodeSpeed() or 1
  local CreateEffectInfo = {
    Transform = Transform,
    AttachToCharacter = AttachToCharacter,
    SocketName = SocketName,
    SkillSpeed = SkillSpeed,
    LoadFinishCallBack = LoadFinishCallBack
  }
  self:AsyncCreateEffectCreatureById(EffectCreatureId, CreateEffectInfo)
end

function Component:AsyncCreateEffectCreature(EffectCreatureId, Transform, AttachToCharacter, SocketName, LuaCallBack, IsNotEnterList)
  self:InitEffectCreatureComponent()
  if 0 == EffectCreatureId then
    return
  end
  local EffectCreatureData = DataMgr.EffectCreature[EffectCreatureId]
  SocketName = SocketName and "" ~= SocketName and "None" ~= SocketName and SocketName or EffectCreatureData.SocketName or "root"
  if not self.EffectCreatures[EffectCreatureId] then
    self.EffectCreatures[EffectCreatureId] = {}
  end
  
  local function LoadFinishCallBack(EffectCreature)
    if 0 == EffectCreature.InitialLifeSpan and not IsNotEnterList then
      table.insert(self.EffectCreatures[EffectCreatureId], EffectCreature)
    end
    if LuaCallBack then
      LuaCallBack(EffectCreature)
    end
  end
  
  local CurSkill = self:IsCharacter() and self:GetCurrentSkill()
  local SkillConfig = CurSkill and CurSkill.Data
  local SkillSpeedModify = SkillConfig and SkillConfig.SkillSpeedModify
  local SkillSpeed = SkillSpeedModify and self:GetCurrentSkillNodeSpeed() or 1
  local CreateEffectInfo = {
    Transform = Transform,
    AttachToCharacter = AttachToCharacter,
    SocketName = SocketName,
    SkillSpeed = SkillSpeed,
    LoadFinishCallBack = LoadFinishCallBack
  }
  self:AsyncCreateEffectCreatureById(EffectCreatureId, CreateEffectInfo)
end

function Component:CreateEffectCreature(EffectCreatureId, Transform, AttachToCharacter, SocketName)
  self:InitEffectCreatureComponent()
  if 0 == EffectCreatureId then
    return
  end
  local EffectCreatureData = DataMgr.EffectCreature[EffectCreatureId]
  SocketName = SocketName and "" ~= SocketName and "None" ~= SocketName and SocketName or EffectCreatureData.SocketName or "root"
  local CurSkill = self:IsCharacter() and self:GetCurrentSkill()
  local SkillConfig = CurSkill and CurSkill.Data
  local SkillSpeedModify = SkillConfig and SkillConfig.SkillSpeedModify
  local SkillSpeed = SkillSpeedModify and self:GetCurrentSkillNodeSpeed() or 1
  local CreateEffectInfo = {
    Transform = Transform,
    AttachToCharacter = AttachToCharacter,
    SocketName = SocketName,
    SkillSpeed = SkillSpeed
  }
  local EffectCreature = self:CreateEffectCreatureById(EffectCreatureId, CreateEffectInfo)
  EffectCreature.Overridden.ReceiveBeginPlay(EffectCreature)
  return EffectCreature
end

function Component:RefreshEffectCreatureByBuff(EffectCreatureId, BuffId, Layer)
  local EffectCreatures = self.EffectCreatures and self.EffectCreatures[EffectCreatureId]
  if EffectCreatures and #EffectCreatures > 0 then
    for i, EffectCreature in ipairs(EffectCreatures) do
      if EffectCreature.SourceBuffId == BuffId then
        EffectCreature:OnEffectCreatureBuffChanged(EffectCreature.Layer, Layer)
        EffectCreature.Layer = Layer
        break
      end
    end
  else
    local EffectCreature = self:CreateEffectCreature(EffectCreatureId, nil, true)
    if not EffectCreature then
      return
    end
    EffectCreature.SourceBuffId = BuffId
    EffectCreature.Layer = Layer
    EffectCreature:OnEffectCreatureBuffChanged(0, Layer)
  end
end

function Component:CreateEffectCreatureByPet(EffectCreatureId)
  self:AsyncCreateEffectCreature(EffectCreatureId, nil, true, nil, function(PetEffectCreature)
    local BattlePet = self:GetBattlePet()
    if BattlePet.EffectCreature then
      BattlePet.EffectCreature:DestroyEffectCreature()
    end
    BattlePet.EffectCreature = PetEffectCreature
    PetEffectCreature:SetActorHiddenInGame(BattlePet.IsHideCreature)
    
    function PetEffectCreature.LoadMeshCallBack()
      EventManager:FireEvent(EventID.OnPetEffectCreatureCreated, BattlePet, self)
    end
  end, true)
end

function Component:RecycleEffectCreature(EffectCreature)
  local EffectCreatureId = EffectCreature.EffectCreatureId
  if not self.EffectRecyclePool[EffectCreatureId] then
    self.EffectRecyclePool[EffectCreatureId] = {}
  end
  table.insert(self.EffectRecyclePool[EffectCreatureId], EffectCreature)
end

function Component:RemoveEffectCreature(EffectCreatureId)
  if not self.EffectCreatures or not self.EffectCreatures[EffectCreatureId] then
    return
  end
  for i, EffectCreature in ipairs(self.EffectCreatures[EffectCreatureId]) do
    if IsValid(EffectCreature) then
      EffectCreature:DestroyEffectCreature()
    else
      DebugPrint("\231\137\185\230\149\136\229\136\155\231\148\159\231\137\169\228\184\186\231\169\186\228\189\134\230\152\175\230\149\176\230\141\174\228\190\157\230\151\167\229\173\152\229\156\168\239\188\140id\239\188\154" .. EffectCreatureId)
    end
  end
  self.EffectCreatures[EffectCreatureId] = nil
  self.AsyncEffectCreatures[EffectCreatureId] = nil
end

function Component:RemoveEffectCreatureByRef(DeleteEffectCreature)
  local EffectCreatureId = DeleteEffectCreature.EffectCreatureId
  if not self.EffectCreatures or not self.EffectCreatures[EffectCreatureId] then
    return
  end
  local EffectCreatures = {}
  for _, EffectCreature in ipairs(self.EffectCreatures[EffectCreatureId]) do
    if IsValid(EffectCreature) then
      if DeleteEffectCreature == EffectCreature then
        EffectCreature:DestroyEffectCreature()
      else
        table.insert(EffectCreatures, EffectCreature)
      end
    else
      DebugPrint("\231\137\185\230\149\136\229\136\155\231\148\159\231\137\169\228\184\186\231\169\186\228\189\134\230\152\175\230\149\176\230\141\174\228\190\157\230\151\167\229\173\152\229\156\168\239\188\140id\239\188\154" .. EffectCreatureId)
    end
  end
  self.EffectCreatures[EffectCreatureId] = EffectCreatures
end

function Component:RemoveEffectCreatureByBuff(EffectCreatureId, BuffUniqueId)
  if not self.EffectCreatures or not self.EffectCreatures[EffectCreatureId] then
    return
  end
  local EffectCreatures = self.EffectCreatures[EffectCreatureId]
  for Index = #EffectCreatures, 1, -1 do
    local EffectCreature = EffectCreatures[Index]
    if IsValid(EffectCreature) and EffectCreature.SourceBuffId and EffectCreature.SourceBuffId == BuffUniqueId then
      EffectCreature:DestroyEffectCreature()
      table.remove(EffectCreatures, Index)
    else
      DebugPrint("\231\137\185\230\149\136\229\136\155\231\148\159\231\137\169\228\184\186\231\169\186\228\189\134\230\152\175\230\149\176\230\141\174\228\190\157\230\151\167\229\173\152\229\156\168\239\188\140id\239\188\154" .. EffectCreatureId)
      table.remove(EffectCreatures, Index)
    end
  end
end

function Component:RemoveAllEffectCreature(NormalDeath)
  if not self.EffectCreatures or NormalDeath then
    return
  end
  self.AsyncEffectCreatures = {}
  for EffectCreatureId, EffectCreatures in pairs(self.EffectCreatures) do
    for i = 1, #EffectCreatures do
      local EffectCreature = EffectCreatures[i]
      if IsValid(EffectCreature) then
        EffectCreature:DestroyEffectCreature()
      else
        DebugPrint("\231\137\185\230\149\136\229\136\155\231\148\159\231\137\169\228\184\186\231\169\186\228\189\134\230\152\175\230\149\176\230\141\174\228\190\157\230\151\167\229\173\152\229\156\168\239\188\140id\239\188\154" .. EffectCreatureId)
      end
    end
  end
  self.EffectCreatures = {}
  for _, EffectCreatures in pairs(self.EffectRecyclePool) do
    for i = 1, #EffectCreatures do
      local EffectCreature = EffectCreatures[i]
      if IsValid(EffectCreature) then
        EffectCreature:DestroyEffectCreature()
      end
    end
  end
  self.EffectRecyclePool = {}
  if self:IsPlayer() then
    local BattlePet = self:GetBattlePet()
    if BattlePet and IsValid(BattlePet.EffectCreature) then
      BattlePet.EffectCreature:DestroyEffectCreature()
    end
  end
end

function Component:HideAllEffectCreature(HideTag, IsHide)
  self:InitEffectCreatureComponent()
  if not self.EffectCreatureHideTags then
    self.EffectCreatureHideTags = {}
  end
  if not HideTag then
    return
  end
  if IsHide then
    self.EffectCreatureHideTags[HideTag] = true
  else
    self.EffectCreatureHideTags[HideTag] = nil
  end
  for _, EffectCreatures in pairs(self.EffectCreatures) do
    for i = 1, #EffectCreatures do
      local EffectCreature = EffectCreatures[i]
      if IsValid(EffectCreature) then
        EffectCreature:HideEffectCreatureByTag(HideTag, IsHide)
      end
    end
  end
end

function Component:HideEffectCreatureByTags(EffectCreature)
  if not self.EffectCreatureHideTags then
    return
  end
  for HideTag, _ in pairs(self.EffectCreatureHideTags) do
    EffectCreature:HideEffectCreatureByTag(HideTag, true)
  end
end

function Component:HideEffectCreatureById(HideTag, IsHide, EffectCreatureId)
  self:InitEffectCreatureComponent()
  for CreatureId, EffectCreatures in pairs(self.EffectCreatures) do
    if CreatureId == EffectCreatureId then
      for i = 1, #EffectCreatures do
        local EffectCreature = EffectCreatures[i]
        if IsValid(EffectCreature) then
          EffectCreature:HideEffectCreatureByTag(HideTag, IsHide)
        end
      end
    end
  end
end

function Component:UpdateEffectCreatureModel(EffectCreatureId, ModelId)
  if not self.EffectCreatures or not self.EffectCreatures[EffectCreatureId] then
    return
  end
  local EffectCreatures = self.EffectCreatures[EffectCreatureId]
  for Index = #EffectCreatures, 1, -1 do
    local EffectCreature = EffectCreatures[Index]
    if IsValid(EffectCreature) then
      EffectCreature:UpdateEffectCreatureModel(ModelId)
    else
      table.remove(EffectCreatures, Index)
    end
  end
end

function Component:GetEffectCreatureByTag(EffectCreatureTag)
  local EffectCreatureList = TArray(UE4.AEffectCreature)
  if not self.EffectCreatures then
    return EffectCreatureList
  end
  for EffectCreatureId, EffectCreatures in pairs(self.EffectCreatures) do
    local EffectCreatureConfig = DataMgr.EffectCreature[EffectCreatureId]
    if not EffectCreatureConfig.EffectCreatureTag then
    else
      local IsContains = false
      for i, Tag in ipairs(EffectCreatureConfig.EffectCreatureTag) do
        if Tag == EffectCreatureTag then
          IsContains = true
          break
        end
      end
      if not IsContains then
      else
        for i = 1, #EffectCreatures do
          local EffectCreature = EffectCreatures[i]
          if IsValid(EffectCreature) then
            EffectCreatureList:Add(EffectCreature)
          end
        end
      end
    end
  end
  return EffectCreatureList
end

function Component:RemoveEffectCreatureByTag(EffectCreatureTag)
  if not self.EffectCreatures then
    return
  end
  for EffectCreatureId, EffectCreatures in pairs(self.EffectCreatures) do
    local EffectCreatureConfig = DataMgr.EffectCreature[EffectCreatureId]
    if not EffectCreatureConfig.EffectCreatureTag then
    else
      local IsContains = false
      for i, Tag in ipairs(EffectCreatureConfig.EffectCreatureTag) do
        if Tag == EffectCreatureTag then
          IsContains = true
          break
        end
      end
      if not IsContains then
      else
        for i = 1, #EffectCreatures do
          local EffectCreature = EffectCreatures[i]
          if IsValid(EffectCreature) then
            EffectCreature:DestroyEffectCreature()
          end
        end
        self.EffectCreatures[EffectCreatureId] = {}
        self.AsyncEffectCreatures[EffectCreatureId] = {}
      end
    end
  end
end

return Component
