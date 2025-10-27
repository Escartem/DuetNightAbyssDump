require("UnLua")
require("DataMgr")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local GuidePointLocData = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
local WBP_UnSpecialSideIndicatorUI_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_UnSpecialSideIndicatorUI_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.TargetPointPos = nil
  self.HelperCoefficient = 80
  self.OverrideNpcHelperCoefficient = 40
  self.CenterPos = nil
  self.TargetPointType = nil
  self.TargetPointName = nil
  self.TargetAreaName = nil
  self.IsNeedChangeSmartGuideStyle = true
  self.IsShowSmartPointStyle = false
  self.BelongToQuestChainId = 0
  self.IsRangeOrPoint = false
  self.IsInTaskRegion = false
  self.NpcIndicatorPreVisibility = 0
end

function WBP_UnSpecialSideIndicatorUI_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:OnLoadedInit()
  self:OnLoadedTaskIndicator()
  self.OwnerDisplayName, self.OwenrQuestNpcId = ...
  self:SetNpcSideQuestGuideInfo(self.OwnerDisplayName)
end

function WBP_UnSpecialSideIndicatorUI_C:OnLoadedInit()
  local DesignedScreenSize = UIManager(self):GetDesignedScreenSize()
  self.CenterPos = FVector2D(DesignedScreenSize.X / 2, DesignedScreenSize.Y / 2)
  self.Guide_Node:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.TargetWorldLoc = FVector(0, 0, 0)
  self.OvalSize = FVector2D(0, 0)
  self.ScreenLocation = FVector2D(0, 0)
  self.CurrentWorldLoc = FVector(0, 0, 0)
  self.LocationLerpInterval = 3
  self.BoardSize = FVector2D(30, 30)
  self.TargetOffsetOnDoor = 0
  self.CurrentOffsetOnDoor = 0
  self.OffsetLerpInterval = 150
  self.CacheScreenPos = FVector2D(0, 0)
  self.DistanceUnit = GText("UI_SCALE_METER")
  self.PlayerRegionId = 0
  self.SmartGuidePointInfo = nil
end

function WBP_UnSpecialSideIndicatorUI_C:Construct()
  self.Super.Construct(self)
  EventManager:AddEvent(EventID.OnChangeTaskSubRegion, self, self.SetSmarPointInfoByQuestRegionId)
  self.IsDestroied = false
end

function WBP_UnSpecialSideIndicatorUI_C:Destruct()
  self.Super.Destruct(self)
  EventManager:RemoveEvent(EventID.OnChangeTaskSubRegion, self)
  self.IsDestroied = true
end

function WBP_UnSpecialSideIndicatorUI_C:CloseIndicator()
  EventManager:FireEvent(EventID.UpdateMiniMap, self.OwenrQuestNpcId, "SpecialSide", "Delete")
  self.Super.Close(self)
  MissionIndicatorManager:TryToArrangeIndicatorBySmartPointInfo()
end

function WBP_UnSpecialSideIndicatorUI_C:SetNpcSideQuestGuideInfo(InOwnerDisplayName)
  self.STLIndicatorType = "UnSpecialSide"
  self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetTextureParameterValue("GuideIcon", LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SpSideMission_Un.T_Gp_SpSideMission_Un"))
  self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetVectorParameterValue("ArrowColor", self.Color_Blue.SpecifiedColor)
  if InOwnerDisplayName and GuidePointLocData[InOwnerDisplayName] and GuidePointLocData[InOwnerDisplayName].SubRegionId > 0 then
    self.TargetRegionId = GuidePointLocData[InOwnerDisplayName].SubRegionId
  end
  local SideActor = self:TryToFindGuidePointTarget(InOwnerDisplayName)
  self:SetSmarPointInfoByQuestRegionId()
  EventManager:FireEvent(EventID.UpdateMiniMap, self.OwenrQuestNpcId, "SpecialSide", "Add")
  if SideActor then
    local TargetLoc = SideActor:K2_GetActorLocation()
    self.TargetPointPos = UE4.FVector(TargetLoc.X, TargetLoc.Y, TargetLoc.Z + 2 * self.HelperCoefficient)
  end
end

function WBP_UnSpecialSideIndicatorUI_C:SetSmarPointInfoByQuestRegionId()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.PlayerRegionId = Avatar.CurrentRegionId
  if self.TargetRegionId ~= self.PlayerRegionId then
    self.SmartGuidePointInfo = self:TryGetTargetGuidePointByRegionGraph(self.PlayerRegionId, self.TargetRegionId)
    self.IsInTaskRegion = false
  else
    self.IsInTaskRegion = true
  end
  EventManager:FireEvent(EventID.UpdateMiniMap, self:GetName(), "SpecialSide", "ChangeRegion")
  if self.SmartGuidePointInfo == nil then
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  local SideActor = self:TryToFindGuidePointTarget(self.OwnerDisplayName)
  if SideActor then
    local TargetLoc = SideActor:K2_GetActorLocation()
    self.TargetPointPos = UE4.FVector(TargetLoc.X, TargetLoc.Y, TargetLoc.Z + 2 * self.HelperCoefficient)
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  MissionIndicatorManager:TryToArrangeIndicatorBySmartPointInfo()
end

function WBP_UnSpecialSideIndicatorUI_C:TryToFindGuidePointTarget(DisplayName)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  local TargetStaticCreator
  TargetStaticCreator = GameState.StaticCreatorStringNameMap:FindRef(DisplayName)
  if TargetStaticCreator then
    self.TargetPointType = "M"
    return TargetStaticCreator
  end
  TargetStaticCreator = GameState.StaticCreatorMap:FindRef(DisplayName)
  if TargetStaticCreator then
    self.TargetPointType = "M"
    return TargetStaticCreator
  end
  local NewTargetPoint = GameState:GetTargetPoint(DisplayName)
  if NewTargetPoint then
    self.TargetPointType = "P"
    return NewTargetPoint
  end
  return nil
end

function WBP_UnSpecialSideIndicatorUI_C:TryGetTargetGuidePointByRegionGraph(CurSubRegionId, TargetSubRegionId)
  local function ContainsElement(table, element)
    for _, value in pairs(table) do
      if value[1] == element then
        return value
      end
    end
    return nil
  end
  
  local function CreateQueue()
    local queue = {}
    queue.first = 0
    queue.last = -1
    queue.QueueValue = {}
    queue.Path = {}
    return queue
  end
  
  local function Enqueue(queue, value)
    local last = queue.last + 1
    queue.last = last
    queue.QueueValue[last] = value
    table.insert(queue.Path, value[1])
  end
  
  local function ContainsPath(table, element)
    for _, value in pairs(table) do
      if value == element then
        return true
      end
    end
    return false
  end
  
  local function Dequeue(queue)
    local first = queue.first
    if first > queue.last then
      return nil
    end
    local value = queue.QueueValue[first]
    queue.QueueValue[first] = nil
    queue.first = first + 1
    return value
  end
  
  local function IsEmptyQueue(queue)
    return queue.first > queue.last
  end
  
  if not DataMgr.RegionGraph[TargetSubRegionId] or not DataMgr.SubRegion[TargetSubRegionId].RegionId then
    return nil
  end
  local TargetRegionId = DataMgr.SubRegion[TargetSubRegionId].RegionId
  if not (DataMgr.RegionGraph[CurSubRegionId] and DataMgr.RegionGraph[CurSubRegionId].SubRegionTarget) or not DataMgr.RegionGraph[CurSubRegionId].SubRegionTarget.RegionTarget then
    return nil
  end
  local RegionTargetDatas = DataMgr.RegionGraph[CurSubRegionId].SubRegionTarget.RegionTarget
  
  local function TryFindTargetPointByBFS(RootTargetData)
    local RootSubRegionId = RootTargetData[1]
    if not (DataMgr.RegionGraph[RootSubRegionId] and DataMgr.RegionGraph[RootSubRegionId].SubRegionTarget) or not DataMgr.RegionGraph[RootSubRegionId].SubRegionTarget.RegionTarget then
      return -1
    end
    local RootRegionQueue = CreateQueue()
    local RootRegionDatas = DataMgr.RegionGraph[RootSubRegionId].SubRegionTarget.RegionTarget
    for _, v in pairs(RootRegionDatas) do
      Enqueue(RootRegionQueue, v)
    end
    local QueueCount = RootRegionQueue.last - RootRegionQueue.first + 1
    local Weight = 1
    local QueueIndex = 0
    while not IsEmptyQueue(RootRegionQueue) do
      if ContainsElement(RootRegionQueue.QueueValue, TargetSubRegionId) == nil then
        local frontData = RootRegionQueue.QueueValue[RootRegionQueue.first]
        local frontDataSubRegionId = frontData[1]
        QueueIndex = QueueIndex + 1
        if QueueCount < QueueIndex then
          Weight = Weight + 1
          QueueIndex = 0
          QueueCount = RootRegionQueue.last - RootRegionQueue.first + 1
        end
        Dequeue(RootRegionQueue)
        if not (DataMgr.RegionGraph[frontDataSubRegionId] and DataMgr.RegionGraph[frontDataSubRegionId].SubRegionTarget) or not DataMgr.RegionGraph[frontDataSubRegionId].SubRegionTarget.RegionTarget then
        elseif DataMgr.RegionGraph[frontDataSubRegionId].RegionStart == DataMgr.RegionGraph[TargetSubRegionId].RegionStart then
          local NewRegionDatas = DataMgr.RegionGraph[frontDataSubRegionId].SubRegionTarget.RegionTarget
          for _, NewRegionData in pairs(NewRegionDatas) do
            local SubRegionId = NewRegionData[1]
            if DataMgr.RegionGraph[SubRegionId] and DataMgr.RegionGraph[TargetSubRegionId].RegionStart == DataMgr.RegionGraph[SubRegionId].RegionStart and not ContainsPath(RootRegionQueue.Path, SubRegionId) then
              Enqueue(RootRegionQueue, NewRegionData)
              if ContainsElement(RootRegionQueue.QueueValue, TargetSubRegionId) then
                return Weight + 1
              end
            end
          end
        end
      else
        return Weight + 1
      end
    end
    if IsEmptyQueue(RootRegionQueue) then
      return -1
    end
  end
  
  local function TryFindNearestEnterByRegionId()
    local NearestData
    local CurrentParentRegionId = DataMgr.SubRegion[CurSubRegionId].RegionId
    local TargetParentRegionId = DataMgr.SubRegion[TargetSubRegionId].RegionId
    if CurrentParentRegionId == TargetParentRegionId then
      return NearestData
    end
    local RetDistance = math.maxinteger
    for _, Data in pairs(RegionTargetDatas) do
      if Data and Data[1] and Data[2] and DataMgr.SubRegion[Data[1]] then
        local IterParentRegionId = DataMgr.SubRegion[Data[1]].RegionId
        local IsConditionUnlock = true
        if Data[4] and self:CheckConditionIsUnlock(Data[4]) == false then
          IsConditionUnlock = false
        end
        if TargetParentRegionId == IterParentRegionId and IsConditionUnlock then
          local NewTargetPoint = self.GameState:GetTargetPoint(Data[2])
          if NewTargetPoint then
            local PointLocation = NewTargetPoint:K2_GetActorLocation()
            local Distance = UKismetMathLibrary.Vector_Distance(self.PlayerCharacter.CurrentLocation, PointLocation)
            if RetDistance > Distance then
              RetDistance = Distance
              NearestData = Data
            end
          end
        end
      end
    end
    return NearestData
  end
  
  local RetData = TryFindNearestEnterByRegionId()
  local RetWeight = math.maxinteger
  if nil ~= RetData then
    return RetData
  end
  local MinDistance = math.maxinteger
  local RetDataTable = {}
  if not ContainsElement(RegionTargetDatas, TargetSubRegionId) then
    for _, IteraData in pairs(RegionTargetDatas) do
      local IterWeight = TryFindTargetPointByBFS(IteraData)
      if IterWeight >= 0 and RetWeight >= IterWeight then
        RetWeight = IterWeight
        table.insert(RetDataTable, IteraData)
      end
    end
    for _, Data in pairs(RetDataTable) do
      if self:CheckConditionIsUnlock(Data[4]) then
        local NewTargetPoint = self.GameState:GetTargetPoint(Data[2])
        if NewTargetPoint then
          local PointLocation = NewTargetPoint:K2_GetActorLocation()
          local Distance = UKismetMathLibrary.Vector_Distance(self.PlayerCharacter.CurrentLocation, PointLocation)
          if MinDistance > Distance then
            MinDistance = Distance
            RetData = Data
          end
        end
      end
    end
  else
    RetWeight = 1
    for _, IteraData in pairs(RegionTargetDatas) do
      if IteraData and IteraData[1] and IteraData[1] == TargetSubRegionId then
        table.insert(RetDataTable, IteraData)
      end
    end
    for _, Data in pairs(RetDataTable) do
      if Data and Data[1] and Data[2] and DataMgr.SubRegion[Data[1]] and self:CheckConditionIsUnlock(Data[4]) then
        local NewTargetPoint = self.GameState:GetTargetPoint(Data[2])
        if NewTargetPoint then
          local PointLocation = NewTargetPoint:K2_GetActorLocation()
          local Distance = UKismetMathLibrary.Vector_Distance(self.PlayerCharacter.CurrentLocation, PointLocation)
          if MinDistance > Distance then
            MinDistance = Distance
            RetData = Data
          end
        end
      end
    end
  end
  if IsEmptyTable(RetDataTable) then
    if IsEmptyTable(DataMgr.RegionGraph[CurSubRegionId].RegionStart) then
      for _, Data in pairs(RegionTargetDatas) do
        local IterSubRegionId = Data[1]
        if DataMgr.RegionGraph[IterSubRegionId] and IsEmptyTable(DataMgr.RegionGraph[IterSubRegionId].RegionStart) == false then
          for _, Id in pairs(DataMgr.RegionGraph[IterSubRegionId].RegionStart) do
            if Id == TargetSubRegionId then
              RetData = Data
              RetWeight = 1
              break
            end
          end
        end
      end
    else
      for _, SubRegionId in pairs(DataMgr.RegionGraph[CurSubRegionId].RegionStart) do
        if SubRegionId == TargetSubRegionId then
          RetWeight = 2
          break
        end
      end
    end
  end
  local SourcePointTarget
  if RetWeight > 1 and DataMgr.RegionGraph[CurSubRegionId] and nil ~= DataMgr.RegionGraph[CurSubRegionId].RegionStart and self.OwnerDisplayName then
    SourcePointTarget = self:TryToFindGuidePointTarget(self.OwnerDisplayName)
    if SourcePointTarget then
      return nil
    end
  end
  if SourcePointTarget then
    return nil
  end
  return RetData
end

function WBP_UnSpecialSideIndicatorUI_C:TickChildBP()
  if not self.IsInTaskRegion then
    local TargetPointInfo = self.SmartGuidePointInfo
    if nil ~= TargetPointInfo then
      self.TargetPointType = "P"
      self:TryReplaceNearlySmartPoint(TargetPointInfo)
    else
      self.TargetPointName = self.OwnerDisplayName
    end
  end
  self:UpdateTaskIndicator_CPP()
end

function WBP_UnSpecialSideIndicatorUI_C:CheckConditionIsUnlock(RegionData)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if nil == RegionData then
    return true
  end
  return ConditionUtils.CheckCondition(Avatar, RegionData)
end

function WBP_UnSpecialSideIndicatorUI_C:TryReplaceNearlySmartPoint(SmarPointInfo)
  if nil == SmarPointInfo then
    return false
  end
  if nil ~= SmarPointInfo[2] then
    self.TargetPointName = SmarPointInfo[2]
    self.TargetPointSubRegionId = SmarPointInfo[1]
    return false
  else
    self.TargetPointName = self.OwnerDisplayName
    return true
  end
end

function WBP_UnSpecialSideIndicatorUI_C:CalculateTargetPointPos()
  if self.TargetPointType == "P" then
    self:SetTargetPositionByNewTargetPoint()
  else
    self:SetTargetPositionByStaticCreator()
  end
end

return WBP_UnSpecialSideIndicatorUI_C
