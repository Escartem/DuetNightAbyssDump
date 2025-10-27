local RpcRecorder = {}
RpcRecorder.C2S = {}
RpcRecorder.S2C = {}
RpcRecorder.StartTime = os.time()
RpcRecorder.C2S.TotalByteSize = 0
RpcRecorder.S2C.TotalByteSize = 0

function RpcRecorder:Restart()
  UE.UNetworkManager.PrintNetMsgC2S("======================== RpcRecorder:Restart ===============================================")
  self.C2S = {}
  self.S2C = {}
  RpcRecorder.C2S.TotalByteSize = 0
  RpcRecorder.S2C.TotalByteSize = 0
  self.StartTime = os.time()
end

function RpcRecorder:Send(Cmd, ByteSize, Args, Ctx)
  if self.RecordMsgs then
    local time = os.time() - self.RecordStartTime
    DebugPrint("RecordMsgs", Cmd, time, Args)
    table.insert(self.RecordMsgs, {
      Cmd = Cmd,
      time = time,
      Args = Args
    })
  end
  local EntityFunc = ""
  if "EntityMessage" == Cmd then
    EntityFunc = Args[1]
    Cmd = "EntityMessage:" .. EntityFunc
  end
  Ctx = "[" .. (Ctx or "RPC") .. "]"
  UE.UNetworkManager.PrintNetMsgC2S(Ctx .. "CMD:" .. Cmd .. " ByteSize:" .. tostring(ByteSize) .. " EntityFunc:" .. EntityFunc)
  if not self.C2S[Cmd] then
    self.C2S[Cmd] = {Count = 0, TotalByteSize = 0}
  end
  self.C2S[Cmd].Count = self.C2S[Cmd].Count + 1
  self.C2S[Cmd].TotalByteSize = self.C2S[Cmd].TotalByteSize + ByteSize
  self.C2S.TotalByteSize = self.C2S.TotalByteSize + ByteSize
end

function RpcRecorder:Recv(Cmd, ByteSize, Args, Ctx)
  local EntityFunc = ""
  if "EntityMessage" == Cmd then
    EntityFunc = Args[2]
    Cmd = "EntityMessage:" .. EntityFunc
  end
  Ctx = "[" .. (Ctx or "RPC") .. "]"
  if "SHB" ~= EntityFunc then
    UE.UNetworkManager.PrintNetMsgS2C(Ctx .. "CMD:" .. Cmd .. " ByteSize:" .. tostring(ByteSize) .. " EntityFunc:" .. EntityFunc)
  end
  if not self.S2C[Cmd] then
    self.S2C[Cmd] = {Count = 0, TotalByteSize = 0}
  end
  self.S2C[Cmd].Count = self.S2C[Cmd].Count + 1
  self.S2C[Cmd].TotalByteSize = self.S2C[Cmd].TotalByteSize + ByteSize
  self.S2C.TotalByteSize = self.S2C.TotalByteSize + ByteSize
end

function RpcRecorder:Print(Deep)
  UE.UNetworkManager.PrintNetMsgC2S("======================== C2S Print START ===============================================")
  local delay = os.time() - self.StartTime
  local C2SSpeed = self.C2S.TotalByteSize // delay
  local S2CSpeed = self.S2C.TotalByteSize // delay
  UE.UNetworkManager.PrintNetMsgC2S("[C2S] NetSpeed(B/S):" .. tostring(C2SSpeed) .. " Delay:" .. tostring(delay) .. "s " .. " Bytes(MB):" .. tostring(self.C2S.TotalByteSize / 1024 / 1024) .. self.TableToStr(self.C2S, Deep))
  UE.UNetworkManager.PrintNetMsgC2S("======================== C2S Print END ===============================================")
  UE.UNetworkManager.PrintNetMsgS2C("======================== C2S Print START ===============================================")
  UE.UNetworkManager.PrintNetMsgS2C("[S2C] NetSpeed(B/S):" .. tostring(S2CSpeed) .. " Delay:" .. tostring(delay) .. "s " .. " Bytes(MB):" .. tostring(self.S2C.TotalByteSize / 1024 / 1024) .. self.TableToStr(self.S2C, Deep))
  UE.UNetworkManager.PrintNetMsgS2C("======================== C2S Print END ===============================================")
end

function RpcRecorder.TableToStr(Targets, Deep)
  if type(Targets) ~= "table" then
    Targets = {Targets}
  end
  Deep = Deep or 1
  
  local function get_table_str(t, step)
    local s = ""
    for k, v in pairs(t) do
      for i = 1, step do
        s = s .. "\t"
      end
      local _type = type(v)
      if "table" == _type and v.IsValid and UE4.UKismetSystemLibrary.IsValid(v) then
        _type = tostring(UE4.UKismetSystemLibrary.GetDisplayName(v))
      end
      local k_str, v_str
      if type(k) == "string" and CommonUtils.IsObjId(k) then
        k_str = CommonUtils.ObjId2Str(k)
      else
        k_str = tostring(k)
      end
      if type(v) == "string" and CommonUtils.IsObjId(v) then
        v_str = CommonUtils.ObjId2Str(v)
      else
        v_str = tostring(v)
      end
      s = s .. k_str .. " (" .. tostring(type(k)) .. ")" .. ": " .. v_str .. " (" .. tostring(_type) .. ")" .. "\n"
      if type(v) == "table" and step < Deep and (not v.IsValid or not UE4.UKismetSystemLibrary.IsValid(v)) then
        s = s .. get_table_str(v, step + 1)
      end
    end
    return s
  end
  
  local ret = "\n"
  if Targets then
    ret = ret .. get_table_str(Targets, 1)
  end
  return ret
end

local function save(tbl, file, compressed)
  local f, err = io.open(file, "w")
  if err then
    print(err)
    return
  end
  local indent = 1
  
  local function exportstring(s)
    s = string.format("%q", s)
    s = s:gsub("\\\n", "\\n")
    s = s:gsub("\r", "")
    s = s:gsub(string.char(26), "\"..string.char(26)..\"")
    return s
  end
  
  local function serialize(o)
    if type(o) == "number" then
      f:write(o)
    elseif type(o) == "boolean" then
      if o then
        f:write("true")
      else
        f:write("false")
      end
    elseif type(o) == "string" then
      f:write(exportstring(o))
    elseif type(o) == "table" then
      f:write("{" .. (compressed and "" or "\n"))
      indent = indent + 1
      local tab = ""
      for i = 1, indent do
        tab = tab .. "    "
      end
      for k, v in pairs(o) do
        f:write((compressed and "" or tab) .. "[")
        serialize(k)
        f:write("]" .. (compressed and "=" or " = "))
        serialize(v)
        f:write("," .. (compressed and "" or "\n"))
      end
      indent = indent - 1
      tab = ""
      for i = 1, indent do
        tab = tab .. "    "
      end
      f:write((compressed and "" or tab) .. "}")
    else
      print("unable to serialzie data: " .. tostring(o))
      f:write("nil," .. (compressed and "" or " -- ***ERROR: unsupported data type: " .. type(o) .. "!***"))
    end
  end
  
  f:write("return {" .. (compressed and "" or "\n"))
  local tab = "    "
  for k, v in pairs(tbl) do
    f:write((compressed and "" or tab) .. "[")
    serialize(k)
    f:write("]" .. (compressed and "=" or " = "))
    serialize(v)
    f:write("," .. (compressed and "" or "\n"))
  end
  f:write("}")
  f:close()
end

local function load(file)
  local data, err = loadfile(file)
  if err then
    return nil, err
  else
    return data()
  end
end

function RpcRecorder:StartRecord(Filename)
  self.RecordMsgs = {}
  self.RecordFilename = Filename
  self.RecordStartTime = os.time()
end

function RpcRecorder:EndRecord()
  save(self.RecordMsgs, self.RecordFilename or "F:/DefaultRpcRecorder.bin", true)
  self.RecordMsgs = nil
  self.RecordFilename = nil
  self.RecordStartTime = nil
end

function RpcRecorder:LoadRecordMsg(file)
  return load(file or "F:/DefaultRpcRecorder.bin")
end

return RpcRecorder
