local BP_SkillCreature_C = Class({
  "BluePrints.Combat.Components.EffectSourceInterface",
  "BluePrints.Combat.Components.SkillLevelInterface",
  "BluePrints.Combat.Components.ActorTypeComponent",
  "BluePrints.Common.TimerMgr"
})

function BP_SkillCreature_C:InitCreature_Lua()
  local ConfigData = DataMgr.SkillCreature[self.CreatureId]
  self.ConfigData = ConfigData
  if ConfigData.Tags then
    for _, Tag in pairs(ConfigData.Tags) do
      if "Grenade" == Tag then
        local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
        UIManager:LoadUI(UIConst.GRENADESTIPS, "GrenadesTips" .. self.Eid, UIConst.ZORDER_FOR_DAMAGETIPS, self)
        break
      end
    end
  end
  if ConfigData.EffectCreatureID then
    self.DirectSource = self:GetDirectSource()
    if self.DirectSource then
      self.DirectSource:AsyncCreateEffectCreature(ConfigData.EffectCreatureID, self:GetTransform(), false, nil, function(EffectCreature)
        if self.StartDead then
          self.DirectSource:RemoveEffectCreatureByRef(EffectCreature)
          return
        end
        EffectCreature:K2_AttachToActor(self, "", UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld, UE4.EAttachmentRule.KeepWorld)
        self.AttachEffectCreature = EffectCreature
      end)
    end
  end
end

function BP_SkillCreature_C:ClearCreature_Lua()
  local UIManager = UGameplayStatics.GetGameInstance(self):GetGameUIManager()
  local ConfigData = DataMgr.SkillCreature[self.CreatureId]
  if UIManager and ConfigData.Tags then
    for _, Tag in pairs(ConfigData.Tags) do
      if "Grenade" == Tag then
        UIManager:UnLoadUI("GrenadesTips", "GrenadesTips" .. self.Eid)
        break
      end
    end
  end
end

function BP_SkillCreature_C:GetControlRotation()
  return nil
end

function BP_SkillCreature_C:ClearPauseRemovableCreature()
  local ConfigData = DataMgr.SkillCreature[self.CreatureId]
  if not ConfigData or not ConfigData.Tags then
    return
  end
  for _, Tag in pairs(ConfigData.Tags) do
    if "PauseRemovable" == Tag then
      self:DisableAndDestroy(EDeathReason.CreaturePause)
      return
    end
    if "PauseInvisible" == Tag then
      self:SetActorHiddenInGame(true)
      return
    end
  end
end

function BP_SkillCreature_C:ResetPauseCreature()
  local ConfigData = DataMgr.SkillCreature[self.CreatureId]
  if not ConfigData or not ConfigData.Tags then
    return
  end
  for _, Tag in pairs(ConfigData.Tags) do
    if "PauseInvisible" == Tag then
      self:SetActorHiddenInGame(false)
      return
    end
  end
end

AssembleComponents(BP_SkillCreature_C)
return BP_SkillCreature_C
