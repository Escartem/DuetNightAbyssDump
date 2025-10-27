local LuaMemoryManager = {
  LastGCMemory = collectgarbage("count")
}

function LuaMemoryManager:EnableLuaMemoryMonitor()
  self:DisableLuaMemoryMonitor()
  if IsDedicatedServer(GWorld.GameInstance) then
    return
  end
  local GCMemory = 51200
  local GCTime = 600
  local bIsIOS = false
  local PlatformName = UE4.UUIFunctionLibrary.GetDevicePlatformName(GWorld.GameInstance)
  if "IOS" == PlatformName then
    GCMemory = 0
    GCTime = 60
    bIsIOS = true
  end
  print(_G.LogTag, "EnableLuaMemoryMonitor")
  
  local function LuaMemoryMonitor()
    local CurLuaMemory = collectgarbage("count")
    print(_G.LogTag, "Lua Memor6y Cost Now: ", CurLuaMemory)
    if CurLuaMemory < self.LastGCMemory then
      self.LastGCMemory = CurLuaMemory
      return
    end
    if not bIsIOS then
      if CurLuaMemory - self.LastGCMemory >= GCMemory then
        print(_G.LogTag, "Lua Memory has increased more than 50 or 20(In ios) MB. Full GC manually.")
        self:FullGC()
      end
    else
      self:FullGC()
    end
  end
  
  self.Monitor = UE4.UKismetSystemLibrary.K2_SetTimerDelegate({
    GWorld.GameInstance,
    LuaMemoryMonitor
  }, GCTime, true)
end

function LuaMemoryManager:DisableLuaMemoryMonitor()
  print(_G.LogTag, "DisableLuaMemoryMonitor")
  if self.Monitor == nil then
    return
  end
  UE4.UKismetSystemLibrary.K2_ClearAndInvalidateTimerHandle(GWorld.GameInstance, self.Monitor)
end

function LuaMemoryManager:FullGC(bCollectTable)
  if bCollectTable then
    DataMgr.CleanAllTable()
  end
  local PreMemory = collectgarbage("count")
  collectgarbage("collect")
  self.LastGCMemory = collectgarbage("count")
  print(_G.LogTag, "Lua Memory FullGC, Pre Memory: ", PreMemory, " Now Memory: ", self.LastGCMemory)
end

return LuaMemoryManager
