local SkillUtils = require("Utils.SkillUtils")
local ExperienceAttrModel = {}

function ExperienceAttrModel:GetAttrName2Info(BuffId, BuffLevel)
  local AddAttrs = {}
  if BuffId then
    local BuffInfo = DataMgr.Buff[BuffId]
    AddAttrs = BuffInfo.AddAttrs
  end
  local AttrName2Info = {}
  for _, AddAttr in ipairs(AddAttrs) do
    local AttrConfig = DataMgr.AttrConfig[AddAttr.AttrName]
    if not AttrConfig then
    else
      local Value, ValueStr = self:GenBuffAttrData(AddAttr, BuffLevel, AttrConfig, BuffId)
      local AttrName = AddAttr.AttrName
      AttrName2Info[AttrName] = ValueStr
    end
  end
  return AttrName2Info
end

function ExperienceAttrModel:GenBuffAttrData(BuffAttrConf, BuffLevel, AttrConf, BuffId)
  local IsRate = BuffAttrConf.Rate ~= nil
  local Value = self:CalcBuffAttrByLevel(BuffAttrConf, BuffLevel, nil, BuffId)
  local ValueStr = CommonUtils.AttrValueToString(AttrConf, Value, IsRate)
  return Value, ValueStr
end

function ExperienceAttrModel:CalcBuffAttrByLevel(BuffAttrConf, BuffLevel, ValueType, BuffId)
  local IsRate = BuffAttrConf.Rate ~= nil
  local Base = IsRate and BuffAttrConf.Rate or BuffAttrConf.Value
  if ValueType then
    if string.lower(ValueType) == "rate" then
      Base = BuffAttrConf.Rate
      IsRate = true
    elseif string.lower(ValueType) == "value" then
      Base = BuffAttrConf.Value
      IsRate = false
    end
  end
  if type(Base) ~= "number" then
    local AttrData = SkillUtils.GrowProxy("Buff", BuffId, {
      GetSkillLevelInfo = function(self)
        return {SkillLevel = BuffLevel}
      end
    }, BuffAttrConf)
    local Value = tonumber(IsRate and AttrData.Rate or AttrData.Value)
    if not Value then
      DebugPrint(ErrorTag, string.format("BuffId: %s \231\154\132SkillGrow\233\133\141\231\189\174\230\156\137\233\151\174\233\162\152\239\188\140\231\188\186\229\176\145\231\173\137\231\186\167%s\231\154\132\230\136\144\233\149\191\230\149\176\229\128\188\239\188\140\232\175\183\230\163\128\230\159\165SkillGrow\232\161\168", BuffId, BuffLevel))
      return 0
    end
    return Value
  end
  return Base + (BuffAttrConf.LevelGrow or 0) * BuffLevel
end

return ExperienceAttrModel
