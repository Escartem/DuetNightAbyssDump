local Component = {}

function Component:EnterWorld()
  DebugPrint("dispatch111111111111111")
  if not ReddotManager.GetTreeNode(DataMgr.ReddotNode.Dispatch.Name) then
    ReddotManager.AddNode(DataMgr.ReddotNode.Dispatch.Name)
  end
end

function Component:LeaveWorld()
end

function Component:StartDispatch(DispatchId, IsManualCompete, DispatchCharsList)
  local function Callback(Ret)
    if Ret == ErrorCode.RET_SUCCESS then
      EventManager:FireEvent(EventID.StartDispatch, DispatchId)
    end
    DebugPrint("ZJT_ 11111111 StartDispatch ", Ret, DispatchId, IsManualCompete, DispatchCharsList)
  end
  
  self:CallServer("StartDispatch", Callback, DispatchId, IsManualCompete, DispatchCharsList)
end

function Component:OnDispatchComplete(DispatchId, CurrentSuccRate, TotalSuccRate)
  self:_TryAddReddotCacheDetail(DispatchId)
  EventManager:FireEvent(EventID.OnDispatchComplete, DispatchId)
  DebugPrint("ZJT_ 11111111 OnDispatchComplete ", DispatchId, CurrentSuccRate, TotalSuccRate)
end

function Component:UpdateDispatchCondition(DispatchId)
  DebugPrint("ZJT_ 11111111 UpdateDispatchCondition Out ", DispatchId)
  UIManager(self):ShowDispatchTip(DispatchId)
end

function Component:CancelDispatch(DispatchId)
  local function Callback(Ret)
    if Ret == ErrorCode.RET_SUCCESS then
      EventManager:FireEvent(EventID.CancelDispatch, DispatchId)
    end
  end
  
  self:CallServer("CancelDispatch", Callback, DispatchId)
end

function Component:CompleteDispatch(DispatchId)
  local function Callback(Ret, TotalReward)
    if Ret == ErrorCode.RET_SUCCESS then
      EventManager:FireEvent(EventID.CompleteDispatch, TotalReward, DispatchId)
      
      self:_TryCutReddotCacheDetail({DispatchId})
    end
    DebugPrint("ZJT_ 11111111 CompleteDispatch ", DispatchId)
  end
  
  self:CallServer("CompleteDispatch", Callback, DispatchId)
end

function Component:GetAllDispatchReward(CompleteDispatchs)
  local function Callback(Ret, TotalReward)
    if Ret == ErrorCode.RET_SUCCESS then
      EventManager:FireEvent(EventID.GetAllDispatchReward, TotalReward, CompleteDispatchs)
      
      self:_TryCutReddotCacheDetail(CompleteDispatchs)
    end
    DebugPrint("ZJT_ 11111111 GetAllDispatchReward ")
  end
  
  self:CallServer("GetAllDispatchReward", Callback, CompleteDispatchs)
end

function Component:OnDispatchListCoolingComplete(DispatchId)
  DebugPrint("ZJT_ 11111111 OnDispatchListCoolingComplete", DispatchId)
  EventManager:FireEvent(EventID.OnDispatchListCoolingComplete, DispatchId)
end

function Component:ServerNotifyClientGetNewDispatch(DispatchId)
  DebugPrint("ZJT_ 11111111111111111111 ServerNotifyClientGetNewDispatch ", DispatchId)
  EventManager:FireEvent(EventID.OnDispatchListCoolingComplete, DispatchId)
  self:OnActivateDynamicQuest(DispatchId)
end

function Component:OnDispatchExistingComplete(DispatchId)
  EventManager:FireEvent(EventID.OnDispatchExistingComplete, DispatchId)
  DebugPrint("ZJT_ 11111111 OnDispatchExistingComplete", DispatchId)
end

function Component:_TryAddReddotCacheDetail(Id)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(DataMgr.ReddotNode.Dispatch.Name)
  if CacheDetail and nil == CacheDetail[Id] then
    CacheDetail[Id] = true
  end
  if CacheDetail[Id] then
    ReddotManager.IncreaseLeafNodeCount(DataMgr.ReddotNode.Dispatch.Name)
  end
end

function Component:_TryCutReddotCacheDetail(Dispatches)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(DataMgr.ReddotNode.Dispatch.Name)
  if CacheDetail then
    for _, Id in ipairs(Dispatches) do
      if CacheDetail[Id] then
        CacheDetail[Id] = nil
      end
    end
  end
  ReddotManager.DecreaseLeafNodeCount(DataMgr.ReddotNode.Dispatch.Name, #Dispatches)
end

return Component
