local Component = {}

function Component:GetSkillId_Lua(SkillName)
  return self["Get" .. SkillName .. "Skill"](self) or 0
end

function Component:GetSkillByType(_Type)
  local Ret = self.Overridden.GetSkillByType(self, _Type)
  if 0 == Ret then
    return nil
  end
  return Ret
end

function Component:IsSkillNotInCD(SkillId)
  local SkillObject = self:GetSkill(SkillId)
  if not SkillObject then
    return false
  end
  return SkillObject:GetUseTime() > 0
end

return Component
