local Component = {}

function Component:GetAttr(AttrName)
  local IntValue = 0
  local IsInt = false
  local FloatValue = 0.0
  local IsFloat = false
  local StringValue = ""
  local IsString = false
  IntValue, IsInt, FloatValue, IsFloat, StringValue, IsString = self:GetAttrFromLua(AttrName)
  if IsInt then
    return IntValue
  elseif IsFloat then
    return FloatValue
  elseif IsString then
    return StringValue
  else
    return nil
  end
end

function Component:SetAttr(AttrName, Value)
  if type(Value) == "string" then
    self:SetAttrStringFromLua(AttrName, Value)
  elseif type(Value) == "number" then
    self:SetAttrNumberFromLua(AttrName, Value)
  end
end

return Component
