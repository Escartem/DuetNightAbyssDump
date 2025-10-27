local Component = {}

function Component:GMAddMod(ModId, Level, Reason)
  local info = DataMgr.Mod[ModId]
  if not info or 1 == info.GMNot then
    return
  end
  return self:AddMod(ModId, Level, Reason, true)
end

function Component:AddMod(ModId, Level, Reason, GiveNotOpen)
  self.logger.info("AddMod", ModId, Level, Reason)
  local ModInfo = DataMgr.Mod[ModId]
  if not ModInfo or ModInfo.IsNotOpen and not GiveNotOpen then
    return
  end
  local Mod
  if Level > 0 then
    local Uuid = bson.objectid()
    local MaxLevel = ModInfo.MaxLevel
    local ExtraLevel = Level - MaxLevel
    Level = math.min(Level, MaxLevel)
    Mod = self.Mods:NewMod(Uuid, ModId, Level)
    if ExtraLevel > 0 then
      Mod.CurrentModCardLevel = math.min(ExtraLevel, Mod.ModCardLevelMax or 0)
      Mod:SetLevel(Mod.CurrentModCardLevel + Mod.MaxLevel)
    end
    Mod.IsOriginal = false
    Mod.Count = 1
  elseif 0 == Level then
    local OriginalModUuid = self.OriginalMods[ModId]
    local ModUuid = OriginalModUuid or bson.objectid()
    Mod = self.Mods[ModUuid]
    if Mod then
      Mod.IsOriginal = true
      Mod:AddCount(1)
    else
      Mod = self.Mods:NewMod(ModUuid, ModId, Level)
      Mod.IsOriginal = true
      Mod.Count = 1
      self.OriginalMods[ModId] = Mod.Uuid
    end
  end
  if not Mod then
    self.logger.error("ZJT_ \230\183\187\229\138\160Mod\233\148\153\232\175\175 \230\166\130\231\142\135\233\133\141\232\161\168\233\151\174\233\162\152 ", ModId, Level, Reason, GiveNotOpen)
    return
  end
  self.Mods[Mod.Uuid] = Mod
  return Mod.Uuid
end

return Component
