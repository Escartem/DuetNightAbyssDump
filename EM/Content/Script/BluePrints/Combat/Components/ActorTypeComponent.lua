local Component = Class({
  "BluePrints.Combat.BattleLogic.GameplayTagLogic"
})

function Component:IsCharacter()
  if self._IsCharacter_Type == nil then
    self._IsCharacter_Type = self:GetObjType() >= EObjType.CharacterBase and self:GetObjType() <= EObjType.NpcCharacter
  end
  return self._IsCharacter_Type
end

function Component:IsPlayer()
  if self._IsPlayer_Type == nil then
    self._IsPlayer_Type = self:GetObjType() == EObjType.PlayerCharacter
  end
  return self._IsPlayer_Type
end

function Component:IsPlayer_Lua()
  return self:IsPlayer()
end

function Component:IsPhantom()
  if self._IsPhantom_Type == nil then
    self._IsPhantom_Type = self:GetObjType() == EObjType.PhantomCharacter or self:GetObjType() == EObjType.RobotCharacter
  end
  return self._IsPhantom_Type
end

function Component:IsRobot()
  if self._IsRobot_Type == nil then
    self._IsRobot_Type = self:GetObjType() == EObjType.RobotCharacter
  end
  return self._IsRobot_Type
end

function Component:IsPhantom_Lua()
  return self:IsPhantom()
end

function Component:IsMonster()
  if self._IsMonster_Type == nil then
    self._IsMonster_Type = self:GetObjType() == EObjType.MonsterCharacter or self:GetObjType() == EObjType.PhantomCharacter
  end
  return self._IsMonster_Type
end

function Component:IsRealMonster()
  if not self.GameplayTagsInitSuccess then
    return nil
  end
  if self._IsRealMonster_Type == nil then
    self._IsRealMonster_Type = self:GetObjType() == EObjType.MonsterCharacter and not self:HasAnyTags_Table(self, {
      "Player.Summon",
      "Mon.Summon"
    }, false)
  end
  return self._IsRealMonster_Type
end

function Component:IsPureMonster()
  if self._IsPureMonster_Type == nil then
    self._IsPureMonster_Type = self:GetObjType() == EObjType.MonsterCharacter
  end
  return self._IsPureMonster_Type
end

function Component:IsAIControlled()
  if self._IsAIControlled_Type == nil then
    self._IsAIControlled_Type = self:GetObjType() == EObjType.MonsterCharacter or self:GetObjType() == EObjType.NpcCharacter or self:GetObjType() == EObjType.PhantomCharacter or self:GetObjType() == EObjType.PetNpcCharacter
  end
  return self._IsAIControlled_Type
end

function Component:IsAIControlled_Lua()
  return self:IsAIControlled()
end

function Component:IsNPC()
  if self._IsNPC_Type == nil then
    self._IsNPC_Type = self:GetObjType() == EObjType.NpcCharacter or self:GetObjType() == EObjType.PetNpcCharacter
  end
  return self._IsNPC_Type
end

function Component:IsPetNpc()
  if self._IsPetNpc_Type == nil then
    self._IsPetNpc_Type = self:GetObjType() == EObjType.PetNpcCharacter
  end
  return self._IsPetNpc_Type
end

function Component:IsSkillCreature()
  if self._IsSkillCreature_Type == nil then
    self._IsSkillCreature_Type = self:GetObjType() == EObjType.SkillCreature or self:GetObjType() == EObjType.BulletCreature
  end
  return self._IsSkillCreature_Type
end

function Component:IsRealSkillCreature()
  if self._IsRealSkillCreature_Type == nil then
    self._IsRealSkillCreature_Type = self:GetObjType() == EObjType.SkillCreature
  end
  return self._IsRealSkillCreature_Type
end

function Component:IsBulletCreature()
  if self._IsBulletCreature_Type == nil then
    self._IsBulletCreature_Type = self:GetObjType() == EObjType.BulletCreature
  end
  return self._IsBulletCreature_Type
end

function Component:IsMechanismSummon()
  if self._IsMechanismSummon_Type == nil then
    self._IsMechanismSummon_Type = self:GetObjType() == EObjType.MechanismSummon
  end
  return self._IsMechanismSummon_Type
end

function Component:IsCombatItemBase(Type)
  if not self.GetUnitRealType or not Type then
    if self._IsCombatItemBase_Type == nil then
      self._IsCombatItemBase_Type = self:GetObjType() == EObjType.CombatItemBase or self:GetObjType() == EObjType.BreakableItem
    end
    return self._IsCombatItemBase_Type
  end
  return self:GetUnitRealType() == Type
end

function Component:IsPickupItemBase(Type)
  if not self.GetUnitRealType or not Type then
    if self._IsPickupItemBase_Type == nil then
      self._IsPickupItemBase_Type = self:GetObjType() == EObjType.PickupBase
    end
    return self._IsPickupItemBase_Type
  end
  return self:GetUnitRealType() == Type
end

function Component:IsSummonMonster()
  if not self.GameplayTagsInitSuccess then
    return nil
  end
  if self.IsSummon == nil then
    self.IsSummon = self:IsMonster() and self:HasAnyTags_Table(self, {
      "Player.Summon",
      "Mon.Summon"
    }, false)
    return self.IsSummon
  end
  return self.IsSummon
end

function Component:IsSummonByMonster()
  if not self.GameplayTagsInitSuccess then
    return nil
  end
  if self.IsMonsterSummon == nil then
    self.IsMonsterSummon = self:IsMonster() and self:HasAnyTags_Table(self, {"Mon.Summon"}, false)
    return self.IsMonsterSummon
  end
  return self.IsMonsterSummon
end

function Component:IsSummonByPlayer()
  local Creator = self:GetDirectSource()
  return self:IsSummonMonster() and Creator and Creator:IsPlayer()
end

function Component:IsSummonByMainPlayer()
  local Creator = self:GetDirectSource()
  return self:IsSummonMonster() and Creator and Creator:IsMainPlayer()
end

function Component:IsBossMonster()
  if not self.GameplayTagsInitSuccess then
    return nil
  end
  if self.Lua_IsBoss == nil then
    self.Lua_IsBoss = self:HasAnyTags_Table(self, {"Mon.Boss"}, false)
    return self.Lua_IsBoss
  end
  return self.Lua_IsBoss
end

function Component:IsCaptureMonster()
  if not self.GameplayTagsInitSuccess then
    return nil
  end
  if self.IsCapture == nil then
    self.IsCapture = self:HasAnyTags_Table(self, {
      "Mon.Capture"
    }, false)
    return self.IsCapture
  end
  return self.IsCapture
end

function Component:IsTreasureMonster()
  if not self.GameplayTagsInitSuccess then
    return nil
  end
  if self.IsTreasure == nil then
    self.IsTreasure = self:HasAnyTags_Table(self, {
      "Mon.Treasure"
    }, false)
    return self.IsTreasure
  end
  return self.IsTreasure
end

function Component:IsMeleeMonster()
  if not self.GameplayTagsInitSuccess then
    return nil
  end
  if self.IsMelee == nil then
    self.IsMelee = self:HasAnyTags_Table(self, {"Mon.Melee"}, false)
    return self.IsMelee
  end
  return self.IsMelee
end

function Component:IsRangedMonster()
  if not self.GameplayTagsInitSuccess then
    return nil
  end
  if self.IsRanged == nil then
    self.IsRanged = self:HasAnyTags_Table(self, {"Mon.Ranged"}, false)
    return self.IsRanged
  end
  return self.IsRanged
end

function Component:IsEliteMonster()
  if not self.GameplayTagsInitSuccess then
    return nil
  end
  if self.IsElite == nil then
    self.IsElite = self:HasAnyTags_Table(self, {"Mon.Elite"}, false)
    return self.IsElite
  end
  return self.IsElite
end

function Component:IsJailerMonster()
  if not self.GameplayTagsInitSuccess then
    return nil
  end
  if self.IsJailer == nil then
    self.IsJailer = self:HasAnyTags_Table(self, {
      "Mon.Elite.Jailer"
    }, false)
    return self.IsJailer
  end
  return self.IsJailer
end

function Component:IsDestructPart()
  return self.IsDestructablePart == true
end

function Component:IsMainPlayer_Lua()
  return self:IsMainPlayer()
end

function Component:IsAttrbutesSetOnRep()
  local IsAttrbutesOnRep = false
  if self:IsMonster() or self:GetObjType() == EObjType.CombatItemBase then
    IsAttrbutesOnRep = true
  end
  return IsAttrbutesOnRep
end

function Component:IsFakeCharacter()
  if self._IsFakeCharacter_Type == nil then
    self._IsFakeCharacter_Type = self:GetObjType() == EObjType.FakeCharacter
  end
  return self._IsFakeCharacter_Type
end

return Component
