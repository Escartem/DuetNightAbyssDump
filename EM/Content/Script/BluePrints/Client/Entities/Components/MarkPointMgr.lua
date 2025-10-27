local Component = {}

function Component:AddMarkPoint(RegionId, MarkPointKey, MarkPointData)
  local function Callback(Ret)
    EventManager:FireEvent(EventID.UpdateMapMark, RegionId, MarkPointKey, MarkPointData)
  end
  
  self:CallServer("AddMarkPoint", Callback, RegionId, MarkPointKey, MarkPointData)
end

function Component:DeleteMarkPoint(RegionId, MarkPointKey)
  local function Callback(Ret)
    EventManager:FireEvent(EventID.UpdateMapMark, RegionId, MarkPointKey, nil)
  end
  
  self:CallServer("DeleteMarkPoint", Callback, RegionId, MarkPointKey)
end

function Component:UpdateMarkPoint(RegionId, MarkPointKey, MarkPointData)
  local function Callback(Ret)
    EventManager:FireEvent(EventID.UpdateMapMark, RegionId, MarkPointKey, MarkPointData)
  end
  
  self:CallServer("UpdateMarkPoint", Callback, RegionId, MarkPointKey, MarkPointData)
end

function Component:GetCurrentMarkCount()
  local count = 0
  for _, MarkPoint in pairs(self.MarkPoints) do
    count = count + MarkPoint.Count
  end
  return count
end

return Component
