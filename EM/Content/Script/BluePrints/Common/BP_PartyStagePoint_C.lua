local BP_PartyStagePoint = Class()

function BP_PartyStagePoint:ReceiveBeginPlay()
  DebugPrint("PartyComponent: PartyStagePoint:ReceiveBeginPlay, StageId", self.StageId)
  local PointComponents = self:K2_GetComponentsByClass(LoadClass("/Game/BluePrints/Item/Mechanism/Seat/BP_SeatEnterComponent.BP_SeatEnterComponent"):StaticClass())
  self.PointList = {}
  for _, PointComponent in pairs(PointComponents) do
    local Index = PointComponent.Index
    self.PointList[Index] = PointComponent
  end
end

function BP_PartyStagePoint:GetStageId()
  DebugPrint("PartyComponent: PartyStagePoint GetStageId, StageId", self.StageId)
  return self.StageId
end

function BP_PartyStagePoint:GetTransformByIndex(Index)
  local PointComponent = self.PointList[Index]
  return PointComponent:K2_GetComponentToWorld()
end

return BP_PartyStagePoint
