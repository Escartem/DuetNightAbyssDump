local BP_SkillObject_C = Class()
BP_SkillObject_C._components = {
  "BluePrints.Combat.Components.SkillLevelInterface"
}
local SkillConfigs = DataMgr.Skill
local BeforeIndex = BP_SkillObject_C.__index
local rawget, rawset = rawget, _ENV.rawset

local function __InnerIndex(t, k)
  local v = BeforeIndex(t, k)
  if nil == v then
    if nil == rawget(t, "Data") then
      local SkillId = BeforeIndex(t, "SkillId")
      if nil == SkillId then
        return
      end
      local SkillLevel = BeforeIndex(t, "SkillLevel")
      if nil == SkillLevel then
        return
      end
      local SkillGrade = BeforeIndex(t, "SkillGrade")
      if nil == SkillGrade then
        return
      end
      local SkillData = SkillConfigs[t.SkillId][t.SkillLevel][t.SkillGrade]
      rawset(t, "Data", SkillData)
    end
    local SkillData = rawget(t, "Data")
    if "Data" == k then
      return SkillData
    elseif SkillData then
      v = SkillData[k]
      if v then
        rawset(t, k, v)
      end
    end
  end
  return v
end

BP_SkillObject_C.__index = __InnerIndex
AssembleComponents(BP_SkillObject_C)
return BP_SkillObject_C
