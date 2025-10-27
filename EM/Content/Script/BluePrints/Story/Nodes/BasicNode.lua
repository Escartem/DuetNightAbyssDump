local function DebugPrint(...)
  print("Talk", ...)
end

local BasicNode = {}

function BasicNode:Deserialize(editor_config)
  self.in_execs = {}
  self.out_execs = {}
  self.in_pins = {}
  self.out_pins = {}
  self.type = editor_config.type
  self.id = editor_config.id
  if editor_config.in_execs then
    for _, exec in pairs(editor_config.in_execs) do
      if exec.variant == true then
        self.in_execs[exec.id] = {}
        self.in_execs[exec.name .. "_1"] = self.in_execs[exec.id]
        local in_exec = self.in_execs[exec.id]
        in_exec.id = exec.id
        in_exec.node = self
        in_exec.active = false
        if exec.sub_pins then
          local idx = 2
          for _, sub_exec in ipairs(exec.sub_pins) do
            self.in_execs[sub_exec.id] = {}
            self.in_execs[sub_exec.name .. "_" .. idx] = self.in_execs[sub_exec.id]
            local in_exec = self.in_execs[sub_exec.id]
            in_exec.id = sub_exec.id
            in_exec.node = self
            in_exec.active = false
            idx = idx + 1
          end
        end
      else
        self.in_execs[exec.id] = {}
        self.in_execs[exec.name] = self.in_execs[exec.id]
        local in_exec = self.in_execs[exec.id]
        in_exec.id = exec.id
        in_exec.node = self
        in_exec.active = false
      end
    end
  end
  if editor_config.out_execs then
    for _, exec in pairs(editor_config.out_execs) do
      if exec.variant == true then
        self.out_execs[exec.id] = {}
        self.out_execs[exec.name .. "_1"] = self.out_execs[exec.id]
        local out_exec = self.out_execs[exec.id]
        out_exec.id = exec.id
        out_exec.links = {}
        if exec.sub_pins then
          local idx = 2
          for _, sub_exec in ipairs(exec.sub_pins) do
            self.out_execs[sub_exec.id] = {}
            self.out_execs[sub_exec.name .. "_" .. idx] = self.out_execs[sub_exec.id]
            local out_exec = self.out_execs[sub_exec.id]
            out_exec.id = sub_exec.id
            out_exec.links = {}
            idx = idx + 1
          end
        end
      else
        self.out_execs[exec.id] = {}
        self.out_execs[exec.name] = self.out_execs[exec.id]
        local out_exec = self.out_execs[exec.id]
        out_exec.id = exec.id
        out_exec.links = {}
      end
    end
  end
  if editor_config.in_pins then
    for _, pin in pairs(editor_config.in_pins) do
      if pin.variant == true then
        self.in_pins[pin.id] = {}
        self.in_pins[pin.name .. "_1"] = self.in_pins[pin.id]
        local in_pin = self.in_pins[pin.id]
        in_pin.id = pin.id
        in_pin.value = pin.value
        in_pin.link = nil
        if pin.sub_pins then
          local idx = 2
          for _, sub_pin in ipairs(pin.sub_pins) do
            self.in_pins[sub_pin.id] = {}
            self.in_pins[sub_pin.name .. "_" .. idx] = self.in_pins[sub_pin.id]
            local in_pin = self.in_pins[sub_pin.id]
            in_pin.id = sub_pin.id
            in_pin.value = sub_pin.value
            in_pin.link = nil
            idx = idx + 1
          end
        end
      else
        self.in_pins[pin.id] = {}
        self.in_pins[pin.name] = self.in_pins[pin.id]
        local in_pin = self.in_pins[pin.id]
        in_pin.id = pin.id
        in_pin.value = pin.value
        in_pin.link = nil
      end
    end
  end
  if editor_config.out_pins then
    for _, pin in pairs(editor_config.out_pins) do
      if pin.variant == true then
        self.out_pins[pin.id] = {}
        self.out_pins[pin.name .. "_1"] = self.out_pins[pin.id]
        local out_pin = self.out_pins[pin.id]
        out_pin.id = pin.id
        out_pin.value = pin.value
        if pin.sub_pins then
          local idx = 2
          for _, sub_pin in ipairs(pin.sub_pins) do
            self.out_pins[sub_pin.id] = {}
            self.out_pins[sub_pin.name .. "_" .. idx] = self.out_pins[sub_pin.id]
            local out_pin = self.out_pins[sub_pin.id]
            out_pin.id = sub_pin.id
            out_pin.value = sub_pin.value
            idx = idx + 1
          end
        end
      else
        self.out_pins[pin.id] = {}
        self.out_pins[pin.name] = self.out_pins[pin.id]
        local out_pin = self.out_pins[pin.id]
        out_pin.id = pin.id
        out_pin.value = pin.value
      end
    end
  end
end

local function ActivateNode(node, exec_name)
  node.is_active = true
  if nil ~= exec_name then
    node.in_execs[exec_name].active = true
  end
  for _, pin in pairs(node.in_pins) do
    if nil == pin.value and pin.link then
      pin.value = pin.link.value
    end
  end
  DebugPrint("Activate node: " .. node.type)
  node:OnActivate(exec_name)
end

function BasicNode:Finish(exec_name)
  self.is_active = false
  if self.context.wait_for_destroy then
    return
  end
  local next_links = self.out_execs[exec_name].links
  for next_link, _ in pairs(next_links) do
    local next_node = next_link.node
    ActivateNode(next_node, next_link.name)
  end
end

local function LinkPin(out_pin, in_pin)
  in_pin.link = out_pin
end

local function LinkExec(out_exec, in_exec)
  out_exec.links[in_exec] = true
end

function BasicNode:GetVarOfInPin(pin_name)
  assert(self.in_pins[pin_name] ~= nil, "pin name: " .. pin_name .. " not exist!")
  return self.in_pins[pin_name].value
end

local function IsID(id)
  return type(id) == "number"
end

local function IsName(id)
  return type(id) == "string"
end

function BasicNode:GetVarsOfInPins()
  local ret = {}
  for i, pin in pairs(self.in_pins) do
    if IsID(i) then
      ret[#ret + 1] = pin.value
    end
  end
  return ret
end

function BasicNode:GetVarsOfVariantPin(pin_name)
  local ret = {}
  local idx = 1
  while true do
    local pin = self.in_pins[pin_name .. "_" .. idx]
    if pin then
      table.insert(ret, pin.value)
      idx = idx + 1
    else
      return ret
    end
  end
end

function BasicNode:GetStateOfInExec(exec_name)
  return self.in_execs[exec_name].active
end

function BasicNode:GetStatesOfInExecs()
  local ret = {}
  for i, exec in pairs(self.in_execs) do
    if IsID(i) then
      ret[#ret + 1] = exec.active
    end
  end
  return ret
end

function BasicNode:GetAllNamesOfOutExecs()
  local ret = {}
  for name, _ in pairs(self.out_execs) do
    if IsName(name) then
      ret[#ret + 1] = name
    end
  end
  return ret
end

function BasicNode:GetNamesOfVariantOutExec(exec_name)
  local ret = {}
  local idx = 1
  while true do
    local exec = self.out_execs[exec_name .. "_" .. idx]
    if exec then
      table.insert(ret, exec_name .. "_" .. idx)
      idx = idx + 1
    else
      return ret
    end
  end
end

function BasicNode:IsAllExecsActivate()
  for _, exec in pairs(self.in_execs) do
    if exec.active == false then
      return false
    end
  end
  return true
end

function BasicNode:SetVarOfOutPin(pin_name, value)
  self.out_pins[pin_name].value = value
end

function BasicNode:GetActor(npc_id)
  return self.context.actor_table[npc_id]
end

return BasicNode
