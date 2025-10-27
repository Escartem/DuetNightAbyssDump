require("DataMgr")
local Component = {}

function Component:AddCollisionCompToMap(CollisionCompMap, TargetActor, TargetComp)
  local Eid = self:IsDanmakuTarget(TargetActor) and TargetComp.Eid or TargetActor.Eid
  if Eid then
    CollisionCompMap[Eid] = CollisionCompMap[Eid] or {}
    table.insert(CollisionCompMap[Eid], TargetComp)
  end
end

function Component:ApplyRangeModify(Source, ModifyInfo, Ranges)
  local RealSource = Source
  if RealSource:IsSkillCreature() then
    RealSource = RealSource:GetDirectSource()
  end
  if ModifyInfo.AllowSkill then
    local SkillRange = RealSource:GetAttrByConstrain(EAttrName.SkillRange)
    for i = 1, #Ranges do
      Ranges[i] = Ranges[i] * SkillRange
    end
  end
  if ModifyInfo.AttackRangeType and ModifyInfo.AttackRangeType ~= "None" then
    if RealSource.GetCurrentWeapon then
      local Weapon = RealSource:GetCurrentWeapon()
      if Weapon then
        local AttackRange = Weapon:GetAttr("AttackRange_" .. tostring(ModifyInfo.AttackRangeType)) or 0
        for i = 1, #Ranges do
          Ranges[i] = Ranges[i] + AttackRange
        end
      end
    else
      error("TTT" .. " Source: " .. Source:GetName() .. " RealSource: " .. RealSource:GetName())
    end
  end
  return Ranges
end

function Component:GetComponentByName(Target, CompName)
  local CollisionComp = Target[CompName]
  if CollisionComp then
    return CollisionComp
  elseif self:IsDanmakuTarget(Target) then
    return self:GetDanmakuCreatureByName(Target, CompName)
  end
  return Target:K2_GetRootComponent()
end

function Component:GetCollisionNamesByComps(CollisionCompMap)
  local CollisionNames = {}
  if CollisionCompMap then
    for Eid, CollisionCompArray in pairs(CollisionCompMap) do
      CollisionNames[Eid] = {}
      local Collisions = CollisionCompArray.Collisions
      if Collisions then
        for _, CollisionComp in pairs(Collisions) do
          local CompName = UKismetSystemLibrary.GetObjectName(CollisionComp)
          local Entity = self:GetEntity(Eid)
          if Entity and nil == Entity[CompName] then
            CompName = Entity:K2_GetRootComponent():GetName()
          end
          table.insert(CollisionNames[Eid], CompName)
        end
      end
    end
  end
  return CollisionNames
end

function Component:Table2TMap(CollisionCompMap)
  local Eid2CollisionComponents = TMap(0, FCollisionsArray)
  for Eid, CollisionComps in pairs(CollisionCompMap) do
    local CollisionArray = Eid2CollisionComponents:Find(Eid)
    if nil == CollisionArray then
      Eid2CollisionComponents:Add(Eid, FCollisionsArray())
      CollisionArray = Eid2CollisionComponents:FindRef(Eid)
    end
    for _, CollisionComp in ipairs(CollisionComps) do
      CollisionArray.Collisions:AddUnique(CollisionComp)
    end
  end
  return Eid2CollisionComponents
end

function Component:TMap2Table(Eid2CollisionComponents)
  local CollisionCompMap = {}
  for Eid, CollisionComps in pairs(Eid2CollisionComponents) do
    CollisionCompMap[Eid] = {}
    for _, CollisionComp in pairs(CollisionComps.Collisions) do
      table.insert(CollisionCompMap[Eid], CollisionComp)
    end
  end
  return CollisionCompMap
end

function Component:GetConfigFilterResults_Lua(Source, PreTarget, LuaFilter, TargetFilterKey, ModifyInfo, Debug, SkillEffectInfo, Skill)
  local Targets, CollisionComps = self["Filter_" .. LuaFilter](self, Source, PreTarget, TargetFilterKey, ModifyInfo, Debug, SkillEffectInfo, Skill)
  if "CheckRangeHit" ~= LuaFilter and CollisionComps then
    CollisionComps = self:Table2TMap(CollisionComps)
  end
  if type(Targets) == "table" then
    local TargetArray = TArray(AActor)
    for _, Target in ipairs(Targets) do
      TargetArray:Add(Target)
    end
    Targets = TargetArray
  end
  return Targets, CollisionComps
end

function Component:GetPureServerTargetFilters_Lua()
  return {"MySummoned", "MyCreature"}
end

return Component
