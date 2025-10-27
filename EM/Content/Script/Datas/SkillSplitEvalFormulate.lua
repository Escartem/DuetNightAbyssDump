local Path = "/Game/BluePrints/Common/BP_SkillFunctionLibrary"
local FunctionLibrary = LoadClass(Path)

local function CondemnDamageValue(Source, Target)
  if not FunctionLibrary then
    FunctionLibrary = LoadClass(Path)
  end
  if FunctionLibrary then
    return FunctionLibrary.CondemnDamageValue(Source, Target)
  end
end

local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SkillSplitEvalFormulate", {
  ["$0.25*math.exp(0.0002*Source:GetAttr('Level')^2+0.0868*Source:GetAttr('Level')+7.0885)$"] = function(Source, SkillLevel, Target)
    return 0.25 * math.exp(2.0E-4 * Source:GetAttr("Level") ^ 2 + 0.0868 * Source:GetAttr("Level") + 7.0885)
  end,
  ["$0.75*math.exp(0.0002*Source:GetAttr('Level')^2+0.0868*Source:GetAttr('Level')+7.0885)$"] = function(Source, SkillLevel, Target)
    return 0.75 * math.exp(2.0E-4 * Source:GetAttr("Level") ^ 2 + 0.0868 * Source:GetAttr("Level") + 7.0885)
  end,
  ["$Source:GetRootSource():GetFloat('Xibi_Skill04_Rate')$"] = function(Source, SkillLevel, Target)
    return Source:GetRootSource():GetFloat("Xibi_Skill04_Rate")
  end,
  ["$Source:GetRootSource():GetInt('PassiveWaitingNum')$"] = function(Source, SkillLevel, Target)
    return Source:GetRootSource():GetInt("PassiveWaitingNum")
  end,
  ["$Source:GetRootSource():GetFloat('Skill04TriggerRate')$"] = function(Source, SkillLevel, Target)
    return Source:GetRootSource():GetFloat("Skill04TriggerRate")
  end,
  ["$Source:GetInt('MagazineBulletNum_20505')$"] = function(Source, SkillLevel, Target)
    return Source:GetInt("MagazineBulletNum_20505")
  end,
  ["$Source:GetRootSource():GetInt('Skill1Buff')$"] = function(Source, SkillLevel, Target)
    return Source:GetRootSource():GetInt("Skill1Buff")
  end,
  ["$Source:GetFloat('LinenSkill02ShootRate')*Source:GetCurrentWeaponAttr('MultiShoot', 1)$"] = function(Source, SkillLevel, Target)
    return Source:GetFloat("LinenSkill02ShootRate") * Source:GetCurrentWeaponAttr("MultiShoot", 1)
  end
})
