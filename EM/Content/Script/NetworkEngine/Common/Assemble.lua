local function AssembleComponents(M, _components)
  local components = _components or rawget(M, "__Component__")
  
  if not components then
    return
  end
  local NameToFuncTable = {}
  for name, value in pairs(M) do
    if type(value) == "function" then
      if nil == NameToFuncTable[name] then
        NameToFuncTable[name] = {}
      end
      NameToFuncTable[name][#NameToFuncTable[name] + 1] = value
    end
  end
  if type(components) == "table" then
    for _, component_name in ipairs(components) do
      package.loaded[component_name] = nil
      local component = require(component_name)
      for name, value in pairs(component) do
        if type(value) == "function" then
          if nil == NameToFuncTable[name] then
            NameToFuncTable[name] = {}
          end
          NameToFuncTable[name][#NameToFuncTable[name] + 1] = value
        end
      end
    end
  end
  for name, func_t in pairs(NameToFuncTable) do
    if 1 == #func_t then
      M[name] = func_t[1]
    else
      local function wrapper(...)
        for _, func in ipairs(func_t) do
          func(...)
        end
      end
      
      M[name] = wrapper
    end
  end
end

local function AddSuperProps(Super, PropType, Target)
  if not Super then
    return
  end
  local SuperProps = rawget(Super, PropType)
  if not SuperProps then
    return
  end
  for k, v in pairs(SuperProps) do
    Target[k] = v
  end
end

local function FormatProperties(M)
  local implement_name = rawget(M, "__Props__")
  if not implement_name then
    return
  end
  local Super = rawget(M, "Super")
  local props = {}
  AddSuperProps(Super, "Props", props)
  local save_props = {}
  AddSuperProps(Super, "SaveProps", save_props)
  local meta_props = {}
  AddSuperProps(Super, "MetaProps", meta_props)
  local client_props = {}
  AddSuperProps(Super, "ClientProps", client_props)
  local cross_props = {}
  AddSuperProps(Super, "CrossProps", cross_props)
  local getters = {}
  AddSuperProps(Super, "Getters", getters)
  local implement
  if type(implement_name) == "table" then
    implement = implement_name
  else
    implement = require(implement_name)
  end
  for name, prop in pairs(implement) do
    if prop.is_prop then
      prop:SetName(name)
      props[name] = prop
      if prop.save then
        save_props[#save_props + 1] = name
      end
      if prop.meta then
        meta_props[#meta_props + 1] = name
      end
      if prop.client then
        client_props[#client_props + 1] = name
      end
      if prop.cross then
        cross_props[#cross_props + 1] = name
      end
    elseif prop.is_getter then
      getters[name] = prop
    end
  end
  M.Props = props
  M.SaveProps = save_props
  M.MetaProps = meta_props
  M.ClientProps = client_props
  M.CrossProps = cross_props
  M.Getters = getters
  rawset(M, "__Props__", nil)
end

return {AssembleComponents = AssembleComponents, FormatProperties = FormatProperties}
