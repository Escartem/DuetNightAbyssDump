require("UnLua")
require("DataMgr")
local EMCache = require("EMCache.EMCache")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local GuidePointLocData = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
local WBP_DynamicIndicatorUI_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_DynamicIndicatorUI_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.TargetPointPos = nil
  self.HelperCoefficient = 80
  self.OverrideNpcHelperCoefficient = 40
  self.CenterPos = nil
  self.GuideInfoCache = GWorld:GetAvatar() and EMCache:Get("GuideInfoCache", true) or {}
  self.BranchGuideInfoCache = {}
  self.CurGuideChainId = nil
  self.CurGuideChainQuestId = nil
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

function WBP_DynamicIndicatorUI_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:OnLoadedInit()
  self:OnLoadedTaskIndicator()
  self:PlayAppearAnim()
  local IndicatorType, PointKey, MapKey, InNode, GuideTag
  IndicatorType, PointKey, MapKey, InNode, GuideTag = ...
  self:SetDynamicEventGuideInfo(IndicatorType, PointKey, MapKey, InNode, GuideTag)
  if not MissionIndicatorManager.bTriggerCollapsAll then
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_DynamicIndicatorUI_C:OnLoadedInit()
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
  self.NpcIndicatorHideTags = {}
  self.DistanceUnit = GText("UI_SCALE_METER")
end

function WBP_DynamicIndicatorUI_C:SetDynamicEventGuideInfo(PointType, PointName, MapKey, QuestNode, GuideTag)
  self.GuideInfoCache = {
    GuideTag = GuideTag,
    PointType = PointType,
    PointName = PointName,
    PointOrStaticCreatorName = MapKey,
    QuestNode = QuestNode
  }
  self.STLIndicatorType = "Dynamic"
  self.TargetPointType = PointType
  if self.TargetPointType == "Area" then
    self.TargetPointName = self.GuideInfoCache.PointOrStaticCreatorName
  elseif self.TargetPointType == "Npc" or self.TargetPointType == "N" then
    self.TargetPointName = self.GuideInfoCache.PointName
  else
    self.TargetPointName = self.GuideInfoCache.PointOrStaticCreatorName
  end
  self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetTextureParameterValue("GuideIcon", LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_DynQuest.T_Gp_DynQuest"))
  self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetVectorParameterValue("ArrowColor", self.Color_Purple.SpecifiedColor)
  TaskUtils:UpdateAllMissionNpcGuideMaps(true, self:GetName(), PointName)
  EventManager:FireEvent(EventID.OnChangeTaskIndicator, TaskUtils.MissionNpcGuideMaps)
  EventManager:FireEvent(EventID.UpdateMiniMap, self:GetName(), "Dynamic", "Add")
end

function WBP_DynamicIndicatorUI_C:RePlayAppearAnim()
  if self.Loop ~= nil then
    self:PlayAnimation(self.Loop, 0, 2)
  end
end

function WBP_DynamicIndicatorUI_C:PlayAppearAnim()
  self:RePlayAppearAnim()
end

function WBP_DynamicIndicatorUI_C:Disappear()
  self:Close()
end

function WBP_DynamicIndicatorUI_C:TryPlayAppearAudio()
  if self.Guide_Node.Visibility ~= ESlateVisibility.Collapsed then
    AudioManager(self):PlayUISound(self, "event:/ui/common/guide_point_show", nil, nil)
  end
end

function WBP_DynamicIndicatorUI_C:TickChildBP()
  self.Guide_Node:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:TriggerToChengeIsNeedCollapsedByRangeStyle()
  if self.IsRangeOrPoint then
    self.Guide_Node:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  if self.TargetPointType == "N" or self.TargetPointType == "Npc" then
    self:SetNpcGuideTargetPosition()
  elseif self.TargetPointType == "P" then
    self:SetTargetPositionByNewTargetPoint()
  else
    self:SetTargetPositionByStaticCreator()
  end
  if self.TargetPointPos == Const.ZeroVector then
    self.Guide_Node:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
end

function WBP_DynamicIndicatorUI_C:TriggerQuestHint()
end

function WBP_DynamicIndicatorUI_C:ChengeIsNeedCollapsedByRangeStyle()
  local Key = self.GuideInfoCache.PointOrStaticCreatorName
  if nil == GuidePointLocData[Key] or nil == GuidePointLocData[Key].R or not IsValid(self.PlayerCharacter) then
    self.IsRangeOrPoint = false
    return
  end
  local RealRadius
  if GuidePointLocData[Key] and GuidePointLocData[Key].R and GuidePointLocData[Key].R > 0 then
    RealRadius = (GuidePointLocData[Key].R + 5) / 100
  end
  local PointLoc = FVector(GuidePointLocData[Key].X, GuidePointLocData[Key].Y, GuidePointLocData[Key].Z)
  local Distance = UKismetMathLibrary.Vector_Distance2D(self.PlayerCharacter.CurrentLocation, PointLoc) / 100.0
  if nil == RealRadius then
    self.IsRangeOrPoint = false
    return
  end
  local IsShowRange = RealRadius > Distance
  if nil ~= RealRadius and IsShowRange then
    self.IsRangeOrPoint = true
    return
  end
  self.IsRangeOrPoint = false
  return
end

function WBP_DynamicIndicatorUI_C:CloseIndicator()
  TaskUtils:UpdateAllMissionNpcGuideMaps(false, self:GetName(), nil)
  EventManager:FireEvent(EventID.OnChangeTaskIndicator, TaskUtils.MissionNpcGuideMaps)
  EventManager:FireEvent(EventID.UpdateMiniMap, self:GetName(), "Dynamic", "Delete")
  self.Super.Close(self)
end

function WBP_DynamicIndicatorUI_C:SetNpcGuideTargetPosition()
  local TargetNpc = self.GameState:GetNpcInfo(tonumber(self.TargetPointName))
  if TargetNpc then
    local NPCActorLocation = TargetNpc:K2_GetActorLocation()
    local NPCActorHalfHeight = 0
    if TargetNpc.CapsuleComponent then
      NPCActorHalfHeight = TargetNpc.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
    end
    local RealHelperCoefficient = self.OverrideNpcHelperCoefficient or self.HelperCoefficient
    self.TargetPointPos = UE4.FVector(NPCActorLocation.X, NPCActorLocation.Y, NPCActorLocation.Z + NPCActorHalfHeight + RealHelperCoefficient)
  elseif self.GuideInfoCache and self.GuideInfoCache.PointOrStaticCreatorName ~= nil then
    local TargetStaticCreator = self:GetTargetStaticCreatorByName(self.GuideInfoCache.PointOrStaticCreatorName)
    if TargetStaticCreator and UE4.UKismetSystemLibrary.IsValid(TargetStaticCreator) then
      local TargetStaticCreatorLoc = TargetStaticCreator:K2_GetActorLocation()
      self.TargetPointPos = UE4.FVector(TargetStaticCreatorLoc.X, TargetStaticCreatorLoc.Y, TargetStaticCreatorLoc.Z + self.HelperCoefficient)
    else
      self.Guide_Node:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    self.Guide_Node:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_DynamicIndicatorUI_C:TryGetTaskGuideNpcUnitId()
  local TargetNpc = self.GameState:GetNpcInfo(self.TargetPointName)
  if TargetNpc and UE4.UKismetSystemLibrary.IsValid(TargetNpc) then
    return TargetNpc.UnitId
  end
  local TargetStaticCreator = self:GetTargetStaticCreator(self.GuideInfoCache.PointOrStaticCreatorName)
  if TargetStaticCreator and UE4.UKismetSystemLibrary.IsValid(TargetStaticCreator) and TargetStaticCreator.UnitType == "Npc" and self.Guide_Node.Visibility == UE4.ESlateVisibility.SelfHitTestInvisible then
    return TargetStaticCreator.UnitId
  end
  return nil
end

function WBP_DynamicIndicatorUI_C:GetTargetStaticCreator(InTargetName)
  local TargetStaticCreator
  TargetStaticCreator = self.GameState.StaticCreatorStringNameMap:FindRef(InTargetName)
  if TargetStaticCreator then
    return TargetStaticCreator
  end
  TargetStaticCreator = self.GameState.StaticCreatorMap:FindRef(InTargetName)
  if TargetStaticCreator then
    return TargetStaticCreator
  end
  local CreatorMap = self.GameState.StaticCreatorMap:ToTable()
  for _, v in pairs(CreatorMap) do
    if v:GetDisplayName() == InTargetName then
      return v
    end
  end
end

function WBP_DynamicIndicatorUI_C:CalculateTargetPointPos()
  if self.TargetPointType == "N" or self.TargetPointType == "Npc" then
    self:SetNpcGuideTargetPosition()
  elseif self.TargetPointType == "P" then
    self:SetTargetPositionByNewTargetPoint()
  else
    self:SetTargetPositionByStaticCreator()
  end
end

return WBP_DynamicIndicatorUI_C
