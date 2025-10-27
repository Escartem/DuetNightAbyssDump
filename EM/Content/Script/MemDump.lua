local MemDump = {}

function MemDump:GetCurrentDir()
  local info = debug.getinfo(1)
  local path = info.source
  path = string.match(path, "^(.*)/")
  return path
end

MemDump.file = io.open(MemDump:GetCurrentDir() .. "/MemDump_" .. os.time() .. ".txt", "w+")
MemDump.NextLine = "\n"
io.output(MemDump.file)
io.write("CurrentLuaMemory(KBytes): " .. collectgarbage("count") .. MemDump.NextLine)
io.write("Global" .. MemDump.NextLine)

function MemDump:Dump(Table, Level)
  Level = Level or 1
  if Level > 4 then
    return
  end
  local Prefix = ""
  for i = 1, Level do
    Prefix = Prefix .. "  "
  end
  Prefix = Prefix .. "L_" .. tostring(Level)
  pcall(function()
    for k, v in pairs(Table) do
      if type(v) ~= "function" then
        local out = Prefix .. "[key]" .. k .. " [value]" .. "[" .. type(v) .. "]" .. tostring(v)
        io.write(out .. self.NextLine)
        if type(v) == "table" and not self:CheckTable(v) then
          self:Dump(v, Level + 1)
        end
      end
    end
    io.write(self.NextLine)
    self:MarkTable(Table)
  end)
end

MemDump.Mark = {}

function MemDump:MarkTable(Table)
  if type(Table) ~= "table" then
    return
  end
  local key = tostring(Table)
  self.Mark[key] = true
end

function MemDump:CheckTable(Table)
  local key = tostring(Table)
  return self.Mark[key]
end

MemDump:Dump(_G)
io.close(MemDump.file)
