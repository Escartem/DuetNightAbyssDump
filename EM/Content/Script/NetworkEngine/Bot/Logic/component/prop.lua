local prop = {}

function prop:InitFromDict(attrs)
  for name, value in pairs(attrs) do
    self[name] = value
  end
end

function prop:ClientPropChanged(name, value)
  self[name] = value
end

function prop:ClientPropSet(name, key, value)
  if type(value) == "table" and value.__type and value.value then
    self[name][key] = value.value
  else
    self[name][key] = value
  end
end

function prop:ClientPropDictChange(prop_name, key, second_prop_name, attr_value)
  if self[prop_name] and self[prop_name][key] and self[prop_name][key][second_prop_name] then
    self[prop_name][key][second_prop_name] = attr_value
  end
end

return prop
