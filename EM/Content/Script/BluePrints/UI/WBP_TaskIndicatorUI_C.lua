require("UnLua")
require("DataMgr")
local EMCache = require("EMCache.EMCache")
local TaskUtils = require("BluePrints.UI.TaskPanel.TaskUtils")
local GuidePointLocData = require("BluePrints.UI.TaskPanel/QuestGuidePointLocData")
local ClientEventUtils = require("BluePrints.Common.ClientEvent.ClientEventUtils")
local WBP_TaskIndicatorUI_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_TaskIndicatorUI_C:Initialize(Initializer)
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
  self.STLIndicatorType = nil
  self.ShowQuestHintFlag = false
  self.AvatarTrackingId = 0
end

function WBP_TaskIndicatorUI_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self:OnLoadedInit()
  self:OnLoadedTaskIndicator()
  self:ListenForInputAction("ActiveGuide", EInputEvent.IE_Pressed, false, {
    self,
    self.RePlayAppearAnim
  })
  self:ListenForInputAction("ActiveGuide", EInputEvent.IE_Pressed, false, {
    self,
    self.CreateAndMoveFollowingPath
  })
  self:PlayAppearAnim()
  local IndicatorType, PointKey, MapKey, InNode, GuideTag
  IndicatorType, PointKey, MapKey, InNode, GuideTag = ...
  self:SetGuideInfo(IndicatorType, PointKey, MapKey, InNode, GuideTag)
  if not MissionIndicatorManager.bTriggerCollapsAll then
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_TaskIndicatorUI_C:OnLoadedInit()
  local DesignedScreenSize = UIManager(self):GetDesignedScreenSize()
  self.CenterPos = FVector2D(DesignedScreenSize.X / 2, DesignedScreenSize.Y / 2)
  self.Guide_Node:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local ZhiliuUI = UIManager(self):GetUIObj("ZhiliuEventTask")
  if ZhiliuUI then
    self:Hide("UIPopUp")
  end
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

function WBP_TaskIndicatorUI_C:SetGuideInfo(PointType, PointName, MapKey, QuestNode, GuideTag)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.GuideInfoCache = {
    PointType = PointType,
    PointName = PointName,
    PointOrStaticCreatorName = MapKey,
    QuestNode = QuestNode,
    QuestHintId = QuestNode.QuestHintId
  }
  self.TargetPointType = PointType
  local GuidePointChainId
  if Avatar.InSpecialQuest and ClientEventUtils:GetCurrentEvent() and ClientEventUtils:GetCurrentEvent().PreQuestChainId then
    GuidePointChainId = ClientEventUtils:GetCurrentEvent().PreQuestChainId
  else
    GuidePointChainId = QuestNode.Context.QuestChainId
  end
  self:ChangeIconStyleByQuestChainType(GuidePointChainId)
  self:TrySetDiffGuideIcon(GuidePointChainId, QuestNode.Key)
  self.TaskRegionId = 0
  if self.GuideInfoCache.PointOrStaticCreatorName == nil or GuidePointLocData[self.GuideInfoCache.PointOrStaticCreatorName] == nil or 0 == GuidePointLocData[self.GuideInfoCache.PointOrStaticCreatorName].SubRegionId then
    if self.GuideInfoCache.PointName ~= nil and GuidePointLocData[self.GuideInfoCache.PointName] and 0 ~= GuidePointLocData[self.GuideInfoCache.PointName].SubRegionId then
      self.TaskRegionId = GuidePointLocData[self.GuideInfoCache.PointName].SubRegionId
    elseif Const.EnableTaskPrintError then
      ScreenPrint(string.format("\230\140\135\229\188\149\231\130\185\230\137\128\229\156\168\229\140\186\229\159\159\228\184\141\229\173\152\229\156\168\239\188\140\232\175\183\230\163\128\230\159\165\229\175\188\229\135\186\230\149\176\230\141\174\230\152\175\229\144\166\230\173\163\231\161\174\239\188\129QuestChainId:" .. tostring(GuidePointChainId) .. ", STL\232\138\130\231\130\185Key:" .. tostring(QuestNode.Key) .. ", \230\140\135\229\188\149\231\130\185\229\144\141\231\167\176:" .. tostring(self.GuideInfoCache.PointName)))
    end
  else
    self.TaskRegionId = GuidePointLocData[self.GuideInfoCache.PointOrStaticCreatorName].SubRegionId
  end
  local TrackingQuestChainId = Avatar.TrackingQuestChainId
  self:SetSmarPointInfoByQuestRegionId()
  self.STLIndicatorType = "Task"
  self.CurGuideChainId = GuidePointChainId
  self.AvatarTrackingId = TrackingQuestChainId
  DebugPrint("SetGuideInfo CurGuideChainId is:", self.CurGuideChainId, "TaskRegionId:", self.TaskRegionId, "NodeKey:", QuestNode.Key)
  if self.CurGuideChainId == TrackingQuestChainId and 0 ~= TrackingQuestChainId then
    EventManager:FireEvent(EventID.UpdateMiniMap, self:GetName(), "Task", "Add")
  end
  if GuidePointChainId == TrackingQuestChainId and self.TargetPointType == "N" then
    TaskUtils:UpdateAllMissionNpcGuideMaps(true, self:GetName(), tonumber(PointName))
  end
end

function WBP_TaskIndicatorUI_C:TrySetDiffGuideIcon(InGuidePointChainId, InKey)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local DoingQuestId = Avatar.QuestChains[InGuidePointChainId].DoingQuestId
  local Info = TaskUtils:GetQuestExtraInfo(InGuidePointChainId, DoingQuestId)
  if not Info then
    return
  end
  local BarWidget = TaskUtils:GetTaskBarWidget()
  for _, Data in pairs(Info) do
    if Data.Node and Data.Node.Type == "BranchQuestStartNode" and IsEmptyTable(Data.DiffGuideList) == false then
      for Index, OptionElemts in pairs(Data.DiffGuideList) do
        for _, KeyList in pairs(OptionElemts) do
          for _, KeyData in pairs(KeyList) do
            if KeyData.IsShowOptional == true and InKey == KeyData.TargetIndicatorKey then
              self.IconObject = TaskUtils:GetOptinalIconTextureByQuestChainType(InGuidePointChainId)
              self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetTextureParameterValue("GuideIcon", self.IconObject)
              if BarWidget then
                BarWidget:SetTaskBarSubTaskIcon(Index, "Optional")
              end
            elseif KeyData.TargetIndicatorKey == InKey then
              local Content = string.char(string.byte("A") + Index - 1)
              local RetPath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Digging_" .. Content .. ".T_Gp_Digging_" .. Content
              self.IconObject = LoadObject(RetPath)
              self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetTextureParameterValue("GuideIcon", self.IconObject)
            end
          end
        end
      end
    end
  end
end

function WBP_TaskIndicatorUI_C:RealSetABCImg(Object)
  self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetTextureParameterValue("GuideIcon", Object)
end

function WBP_TaskIndicatorUI_C:Construct()
  self.Super.Construct(self)
  EventManager:AddEvent(EventID.OnChangeTaskSubRegion, self, self.SetSmarPointInfoByQuestRegionId)
  EventManager:AddEvent(EventID.OnChangeTaskIndicator, self, self.ChangeAvatarTrackingQuestChainId)
  EventManager:AddEvent(EventID.OnSetQuestTracking, self, self.OnDoSetQuestTracking)
  EventManager:AddEvent(EventID.PlayLoopAnimAfterBarAnim, self, self.RePlayAppearAnim)
  EventManager:AddEvent(EventID.OnLevelDeliverBlackCurtainEnd, self, self.OnDeliverEnd)
  self.IsDestroied = false
end

function WBP_TaskIndicatorUI_C:Destruct()
  self.Super.Destruct(self)
  if self:IsListeningForInputAction("ActiveGuide") then
    self:StopListeningForInputAction("ActiveGuide", EInputEvent.IE_Pressed)
  end
  EventManager:RemoveEvent(EventID.OnChangeTaskSubRegion, self)
  EventManager:RemoveEvent(EventID.OnChangeTaskIndicator, self)
  EventManager:RemoveEvent(EventID.OnSetQuestTracking, self)
  EventManager:RemoveEvent(EventID.PlayLoopAnimAfterBarAnim, self)
  EventManager:RemoveEvent(EventID.OnLevelDeliverBlackCurtainEnd, self)
  self.IsDestroied = true
end

function WBP_TaskIndicatorUI_C:GetGuideInfoFromCache(ChainId)
  if 0 == ChainId then
    self.TargetPointName = nil
    return
  end
  if not self.GuideInfoCache then
    self.TargetPointName = nil
    return
  end
  local PointType = self.GuideInfoCache.PointType
  local PointName = self.GuideInfoCache.PointName
  local AreaName = self.GuideInfoCache.AreaName
  self.TargetPointType = PointType
  self.TargetPointName = PointName
  self.TargetAreaName = AreaName
end

function WBP_TaskIndicatorUI_C:OnDeliverEnd()
  if 0 == self.CurGuideChainId then
    return
  end
  if self.CurGuideChainId == self.AvatarTrackingId then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  local TS = TalkSubsystem()
  if TS and TS:IsInImmersiveStory() then
    self:Hide(Const.TalkHideTag)
  end
end

function WBP_TaskIndicatorUI_C:ChangeIconStyleByQuestChainType(InChainId)
  self.IsNeedChangeSmartGuideStyle = true
  if self.IconObject == nil or IsValid(self.IconObject) == false then
    if not DataMgr.QuestChain[InChainId] then
      return
    end
    local Obj
    local CurQuestChainType = DataMgr.QuestChain[InChainId].QuestChainType
    if CurQuestChainType == Const.MainQuestChainType then
      self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetVectorParameterValue("ArrowColor", self.Color_Yellow.SpecifiedColor)
      self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetVectorParameterValue("GeometryColor", self.Color_Yellow.SpecifiedColor)
      Obj = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_MainMission.T_Gp_MainMission")
    elseif CurQuestChainType == Const.SideQuestChainType then
      self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetVectorParameterValue("ArrowColor", self.Color_White.SpecifiedColor)
      self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetVectorParameterValue("GeometryColor", self.Color_White.SpecifiedColor)
      Obj = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SideMission.T_Gp_SideMission")
    elseif CurQuestChainType == Const.MainActivityQuestChainType then
      self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetVectorParameterValue("ArrowColor", self.Color_Yellow.SpecifiedColor)
      self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetVectorParameterValue("GeometryColor", self.Color_Yellow.SpecifiedColor)
      Obj = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_EventMainMission.T_Gp_EventMainMission")
    elseif CurQuestChainType == Const.LimTimeQuestChainType then
      self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetVectorParameterValue("ArrowColor", self.Color_Blue.SpecifiedColor)
      self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetVectorParameterValue("GeometryColor", self.Color_Blue.SpecifiedColor)
      Obj = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_LTMission.T_Gp_LTMission")
    elseif CurQuestChainType == Const.SpecialSideQuestChainType then
      self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetVectorParameterValue("ArrowColor", self.Color_Blue.SpecifiedColor)
      self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetVectorParameterValue("GeometryColor", self.Color_Blue.SpecifiedColor)
      Obj = LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SpSideMission.T_Gp_SpSideMission")
    end
    self.IconObject = Obj
    self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetTextureParameterValue("GuideIcon", Obj)
  else
    self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetTextureParameterValue("GuideIcon", self.IconObject)
  end
end

function WBP_TaskIndicatorUI_C:CreateAndMoveFollowingPath()
  if self.Guide_Node.Visibility ~= UE4.ESlateVisibility.Collapsed then
    local UIObjs = MissionIndicatorManager:GetIndicatorUIObjByQuestChainIdWithType(self.CurGuideChainId, "Task")
    if #UIObjs > 1 then
      return
    end
    if IsValid(TaskUtils.TaskPathActor) and TaskUtils.IsCanMakeTaskPathActor == false then
      TaskUtils.TaskPathActor:K2_DestroyActor()
      TaskUtils.TaskPathActor = nil
    end
    TaskUtils:CreateAndMoveFollowingPath(self)
  end
end

function WBP_TaskIndicatorUI_C:OnDoSetQuestTracking()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if TaskUtils:GetQuestInterfaceJump(Avatar.TrackingQuestChainId) and TaskUtils:GetQuestIsShowGuide(Avatar.TrackingQuestChainId) then
    return
  end
  GWorld.GameInstance:AddTimer(0.5, function()
    self:CreateAndMoveFollowingPath()
  end, false)
end

function WBP_TaskIndicatorUI_C:RePlayAppearAnim()
  if self.WBP_TaskGuide_Base.Loop ~= nil then
    self.WBP_TaskGuide_Base:PlayAnimation(self.WBP_TaskGuide_Base.Loop, 0, 3)
    self:TryPlayAppearAudio()
  end
end

function WBP_TaskIndicatorUI_C:PlayAppearAnim()
  local BarWidget = TaskUtils:GetTaskBarWidget()
  if BarWidget then
    if BarWidget:IsAnimationPlaying(BarWidget.Get_in) then
      BarWidget:BindToAnimationFinished(BarWidget.Get_in, {
        BarWidget,
        function()
          BarWidget:UnbindAllFromAnimationFinished(BarWidget.Get_in)
          EventManager:FireEvent(EventID.PlayLoopAnimAfterBarAnim)
        end
      })
    elseif BarWidget:IsAnimationPlaying(BarWidget.Main_Task_In) then
      BarWidget:BindToAnimationFinished(BarWidget.Main_Task_In, {
        BarWidget,
        function()
          BarWidget:UnbindAllFromAnimationFinished(BarWidget.Main_Task_In)
          EventManager:FireEvent(EventID.PlayLoopAnimAfterBarAnim)
        end
      })
    elseif BarWidget:IsAnimationPlaying(BarWidget.In) then
      BarWidget:BindToAnimationFinished(BarWidget.In, {
        BarWidget,
        function()
          BarWidget:UnbindAllFromAnimationFinished(BarWidget.In)
          EventManager:FireEvent(EventID.PlayLoopAnimAfterBarAnim)
        end
      })
    elseif BarWidget:IsAnimationPlaying(BarWidget.Main_Task_Out) then
      return
    else
      self:RePlayAppearAnim()
    end
  else
    self:RePlayAppearAnim()
  end
end

function WBP_TaskIndicatorUI_C:Disappear()
  self:Close()
end

function WBP_TaskIndicatorUI_C:GetTargetStaticCreator(InTargetName)
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

function WBP_TaskIndicatorUI_C:GetNewTargetPoint()
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  return GameState:GetTargetPoint(self.TargetPointName)
end

function WBP_TaskIndicatorUI_C:ChengeIsNeedCollapsedByRangeStyle()
  if self.TargetPointType ~= "P" then
    self.IsRangeOrPoint = false
    return
  end
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

function WBP_TaskIndicatorUI_C:TriggerQuestHint()
  if self.ShowQuestHintFlag == self.IsRangeOrPoint then
    return
  end
  if self.GuideInfoCache.QuestHintId == nil then
    return
  end
  local Obj = TaskUtils:GetTaskBarWidget()
  if self.IsRangeOrPoint and Obj then
    Obj:ShowQuestHint(self.GuideInfoCache.QuestHintId)
  elseif not self.IsRangeOrPoint and Obj then
    Obj:HideQuestHint(self.GuideInfoCache.QuestHintId)
  end
  self.ShowQuestHintFlag = self.IsRangeOrPoint
end

function WBP_TaskIndicatorUI_C:TryGetTaskGuideNpcUnitId()
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

function WBP_TaskIndicatorUI_C:CalculateTargetPointPos()
  if self.IsInTaskRegion then
    self.TargetPointType = self.GuideInfoCache.PointType
    if self.TargetPointType == "Area" then
      self.TargetPointName = self.GuideInfoCache.PointOrStaticCreatorName
    else
      self.TargetPointName = self.GuideInfoCache.PointName
    end
  end
  if self.TargetPointType == "N" or self.TargetPointType == "Npc" then
    self:SetNpcGuideTargetPosition()
  elseif self.TargetPointType == "P" then
    self:SetTargetPositionByNewTargetPoint()
  elseif self.TargetPointType == "Observation" then
    self:SetTargetPositionByObservationPoint()
  else
    self:SetTargetPositionByStaticCreator()
  end
end

function WBP_TaskIndicatorUI_C:SetNpcGuideTargetPosition()
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

function WBP_TaskIndicatorUI_C:TryPlayAppearAudio()
  if self.Guide_Node.Visibility ~= ESlateVisibility.Collapsed then
    AudioManager(self):PlayUISound(self, "event:/ui/common/guide_point_show", nil, nil)
  end
end

function WBP_TaskIndicatorUI_C:TickChildBP()
  if 0 == self.CurGuideChainId then
    self.Guide_Node:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  if self.CurGuideChainId ~= self.AvatarTrackingId then
    self.Guide_Node:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  local IsOpenSmartGuide = false
  if not self.IsInTaskRegion then
    local TargetPointInfo = self.SmartGuidePointInfo
    if nil ~= TargetPointInfo then
      self.TargetPointType = "P"
      if self:TryReplaceNearlySmartPoint(TargetPointInfo) then
        IsOpenSmartGuide = false
      else
        IsOpenSmartGuide = true
      end
    else
      self:GetGuideInfoFromCache(self.CurGuideChainId)
    end
  end
  self:ChangePointStyle(IsOpenSmartGuide)
  self:UpdateTaskIndicator_CPP()
end

function WBP_TaskIndicatorUI_C:TryReplaceNearlySmartPoint(SmarPointInfo)
  if nil == SmarPointInfo then
    return false
  end
  if nil ~= SmarPointInfo[2] then
    self.TargetPointName = SmarPointInfo[2]
    self.TargetPointSubRegionId = SmarPointInfo[1]
    return false
  else
    self:GetGuideInfoFromCache(self.CurGuideChainId)
    return true
  end
  return false
end

function WBP_TaskIndicatorUI_C:ChangePointStyle(IsOpenSmartGuide)
  if self.IsShowSmartPointStyle ~= IsOpenSmartGuide then
    self.IsNeedChangeSmartGuideStyle = true
    self.IsShowSmartPointStyle = IsOpenSmartGuide
  end
  if IsOpenSmartGuide and self.IsNeedChangeSmartGuideStyle then
    if not DataMgr.QuestChain[self.CurGuideChainId] then
      return
    end
    local CurQuestChainType = DataMgr.QuestChain[self.CurGuideChainId].QuestChainType
    if CurQuestChainType == Const.MainQuestChainType or CurQuestChainType == Const.MainActivityQuestChainType then
      self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetTextureParameterValue("GuideIcon", LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_MainMissionEntrance.T_Gp_MainMissionEntrance"))
    elseif CurQuestChainType == Const.SideQuestChainType then
      self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetTextureParameterValue("GuideIcon", LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SideMissionEntrance.T_Gp_SideMissionEntrance"))
    elseif CurQuestChainType == Const.LimTimeQuestChainType or CurQuestChainType == Const.SpecialSideQuestChainType then
      self.WBP_TaskGuide_Base.Img_Main:GetDynamicMaterial():SetTextureParameterValue("GuideIcon", LoadObject("/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_SpMissionEntrance.T_Gp_SpMissionEntrance"))
    end
    self.IsNeedChangeSmartGuideStyle = false
  end
  if not IsOpenSmartGuide and self.IsNeedChangeSmartGuideStyle then
    self:ChangeIconStyleByQuestChainType(self.CurGuideChainId)
    self.IsNeedChangeSmartGuideStyle = false
  end
end

function WBP_TaskIndicatorUI_C:SetSmarPointInfoByQuestRegionId()
  DebugPrint("SetSmarPointInfoByQuestRegionId start===")
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  self.PlayerRegionId = Avatar.CurrentRegionId
  if self.TaskRegionId ~= self.PlayerRegionId then
    self.SmartGuidePointInfo = self:TryGetTargetGuidePointByRegionGraph(self.PlayerRegionId, self.TaskRegionId)
    self.IsInTaskRegion = false
  else
    self.IsInTaskRegion = true
  end
  EventManager:FireEvent(EventID.UpdateMiniMap, self:GetName(), "Task", "ChangeRegion")
  local CurTrackingQuestChaindId = Avatar.TrackingQuestChainId
  if Avatar.QuestChains[CurTrackingQuestChaindId] then
    local TrackingQuestId = Avatar.QuestChains[CurTrackingQuestChaindId].DoingQuestId
    DebugPrint("CurTrackQuestChain:", CurTrackingQuestChaindId, "CurTrackDoingQuestId", TrackingQuestId)
  end
  MissionIndicatorManager:TryToArrangeIndicatorBySmartPointInfo()
  DebugPrint("TargetPointName:", self.TargetPointName)
  DebugPrint("TargePosition:", self.TargetPointPos)
  DebugPrint("TaskRegionId:", self.TaskRegionId, "PlayerRegionId:", self.PlayerRegionId)
  DebugPrint("SetSmarPointInfoByQuestRegionId end===")
end

function WBP_TaskIndicatorUI_C:ChangeAvatarTrackingQuestChainId(InMissionNpcGuideMaps)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local CurTrackingQuestChaindId = Avatar.TrackingQuestChainId
  self.AvatarTrackingId = CurTrackingQuestChaindId
end

function WBP_TaskIndicatorUI_C:CheckConditionIsUnlock(RegionData)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  if nil == RegionData then
    return true
  end
  return ConditionUtils.CheckCondition(Avatar, RegionData)
end

function WBP_TaskIndicatorUI_C:TryGetTargetGuidePointByRegionGraph(CurSubRegionId, TargetSubRegionId)
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
  if RetWeight > 1 and DataMgr.RegionGraph[CurSubRegionId] and nil ~= DataMgr.RegionGraph[CurSubRegionId].RegionStart then
    if self.GuideInfoCache.PointType == "N" or self.GuideInfoCache.PointType == "Npc" then
      local TargetNpc = self.GameState:GetNpcInfo(tonumber(self.GuideInfoCache.PointName))
      if TargetNpc then
        SourcePointTarget = TargetNpc
      elseif nil ~= self.GuideInfoCache.PointOrStaticCreatorName then
        SourcePointTarget = self:TryToFindGuidePointTarget(self.GuideInfoCache.PointOrStaticCreatorName)
      end
    elseif self.GuideInfoCache.PointName then
      SourcePointTarget = self:TryToFindGuidePointTarget(self.GuideInfoCache.PointName)
      if SourcePointTarget then
        return nil
      end
    end
  end
  if SourcePointTarget then
    return nil
  end
  return RetData
end

function WBP_TaskIndicatorUI_C:TryToFindGuidePointTarget(DisplayName)
  local TargetStaticCreator
  TargetStaticCreator = self.GameState.StaticCreatorStringNameMap:FindRef(DisplayName)
  if TargetStaticCreator then
    return TargetStaticCreator
  end
  TargetStaticCreator = self.GameState.StaticCreatorMap:FindRef(DisplayName)
  if TargetStaticCreator then
    return TargetStaticCreator
  end
  local NewTargetPoint = self.GameState:GetTargetPoint(DisplayName)
  if NewTargetPoint then
    return NewTargetPoint
  end
  local TalkSubsystem = TalkSubsystem()
  local ObservationPoint = TalkSubsystem:GetTalkInteractiveItem(DisplayName)
  if ObservationPoint then
    return ObservationPoint
  end
  return nil
end

function WBP_TaskIndicatorUI_C:CloseIndicator()
  TaskUtils:UpdateAllMissionNpcGuideMaps(false, self:GetName(), nil)
  EventManager:FireEvent(EventID.OnChangeTaskIndicator, TaskUtils.MissionNpcGuideMaps)
  EventManager:FireEvent(EventID.UpdateMiniMap, self:GetName(), "Task", "Delete")
  self.Super.Close(self)
  MissionIndicatorManager:TryToArrangeIndicatorBySmartPointInfo()
end

function WBP_TaskIndicatorUI_C:UpdateQuestArea(isAdd)
  if not self.TargetAreaName then
    return
  end
  if isAdd then
    if self.TargetArea then
      return
    end
    local UIManager = GWorld.GameInstance:GetGameUIManager()
    local battleMain = UIManager:GetUI("BattleMain")
    if not battleMain then
      return
    end
    local miniMap = battleMain.Battle_Map or battleMain.Battle_Map_PC
    if miniMap then
      self.TargetArea = miniMap:AddArea(self.TargetAreaName)
    end
  else
    if not self.TargetArea then
      return
    end
    self.TargetArea:RemoveFromParent()
    self.TargetArea = nil
  end
end

function WBP_TaskIndicatorUI_C:GetTaskGuideNpcUnitIdFromCache()
  if not self.GuideInfoCache or not self.GuideInfoCache.PointName then
    return nil
  end
  local NpcId = self.GuideInfoCache.PointName
  local TargetNpc = self.GameState:GetNpcInfo(tonumber(NpcId))
  if TargetNpc and UE4.UKismetSystemLibrary.IsValid(TargetNpc) then
    return TargetNpc.UnitId
  else
    return nil
  end
end

return WBP_TaskIndicatorUI_C
