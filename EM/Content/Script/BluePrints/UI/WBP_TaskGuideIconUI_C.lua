require("UnLua")
local Guide_Icon_Point_C = Class("BluePrints.UI.BP_UIState_C")

function Guide_Icon_Point_C:DebugPrint(...)
  DebugPrint("DungeonIndicator", ...)
end

function Guide_Icon_Point_C:AssignVector(from, to)
  to.X, to.Y, to.Z = from.X, from.Y, from.Z
end

function Guide_Icon_Point_C:AssignVector2D(from, to)
  to.X, to.Y = from.X, from.Y
end

function Guide_Icon_Point_C:GetBPName()
  if self.ConfigData == nil then
    return nil
  end
  return self.ConfigData.GuideIconAni
end

function Guide_Icon_Point_C:GetIconSize()
  if self.ConfigData == nil or nil == self.ConfigData.GuideIconAni then
    return FVector2D(64, 64)
  end
  return self.IconSize
end

function Guide_Icon_Point_C:GetRealDistance()
  return self.PointRealDistance
end

function Guide_Icon_Point_C:GetIconPathName()
  if self.ConfigData == nil then
    return ""
  end
  return self.ConfigData.GuideIconAni
end

local PhantomStateEnum = {
  Alive = 0,
  Dead = 1,
  Resurrecting = 2
}

function Guide_Icon_Point_C:Initialize(Initializer)
  self.Super.Initialize(self)
  self.ConfigData = nil
  self.TargetEid = nil
  self.TargetActor = nil
  self.TargetPointPos = nil
  self.OvalSize = FVector2D(0, 0)
  self.CenterPos = FVector2D(0, 0)
  self.ScreenLocation = FVector2D(0, 0)
  self.TargetWorldLoc = FVector(0, 0, 0)
  self.CurrentWorldLoc = FVector(0, 0, 0)
  self.TargetVisibility = true
  self.TargetVisibilityOnDoor = true
  self.CurrentVisbilityOnDoor = true
  self.LocationLerpInterval = 3
  self.GuideType = ""
  self.IconSize = nil
  self.BoardSize = FVector2D(30, 30)
  self.DistanceUnit = GText("UI_SCALE_METER")
  self.TargetOffsetOnDoor = 0
  self.CurrentOffsetOnDoor = 0
  self.OffsetLerpInterval = 150
  self.DoorPosition = FVector(0, 0, 0)
  self.DoorDirection = FVector(0, 0, 0)
  self.UseRealDistance = true
  self.PointRealDistance = 0
  self.RequireInAnimation = false
  self.RequireLookUpEntity = false
  self.RequireDirectionArrow = false
  self.RequireFollowingActor = false
  self.PhantomGuideState = nil
  self.States = {OnDoor = 0, OnActor = 1}
  self.Styles = {
    Single = 0,
    Multiple = 1,
    Disappearing = 2
  }
  self.State = self.States.OnActor
  self.Style = self.Styles.Single
  self.HideBehinds = {}
  self.SpawnDown = false
  self.FlyToTarget = true
  self.CacheScreenPos = FVector2D(0, 0)
  self.TargetPhantomOpacity = 1
  self.CurrentPhantomOpacity = 1
  self.PhantomOpacityLerpInterval = 0.1
end

function Guide_Icon_Point_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.TargetEid, self.TargetActor, self.TargetPointPos, self.ConfigData, self.RequireDirectionArrow, self.RequireFollowingActor, self.RequireLookUpEntity, self.RequireInAnimation, self.UseRealDistance = ...
  self:InitConfigData()
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Guide_Node)
  self.IconSize = CanvasSlot:GetSize()
  self.CacheScreenPos = FVector2D(0, 0)
  self:SetVisibilityOnDoor(true)
  self:SetVisibilityNotOnDoor(true)
end

function Guide_Icon_Point_C:InitConfigData()
  if IsValid(self.TargetActor) then
    self.GuideType = self.TargetActor.UnitType
  elseif self.ConfigData ~= nil then
    self.GuideType = self.ConfigData.UnitRealType
  end
  if self.ConfigData == nil then
    self.ConfigData = {
      UnitType = "AOITriggerBox",
      GuideIconAni = "Evacuation",
      GuideIconBPPath = "/Game/UI/UI_Phone/Battle/Battle_Main/Frames/Icon_MapMark_05.Icon_MapMark_05"
    }
  end
  self:Refresh(self.ConfigData.GuideIconAni, self.RequireInAnimation)
  if (self.ConfigData.GuideIconAni == "lifeSupport_System" or self.ConfigData.GuideIconAni == "Guide_Icon_Survival") and not self.AddedSupplyCount then
    local GameState = UE4.UGameplayStatics.GetGameState(self)
    if nil ~= GameState then
      self.AddedSupplyCount = true
    end
  end
  self:SetGuideImage(self.ConfigData.GuideIconImg)
  self:InitABCTextInSabotage()
  self:InitABCTextInExcavation()
  if nil == self.Text_PointName then
    return
  end
  if nil ~= self.ConfigData.GuideText then
    self.Text_PointName:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_PointName:SetText(GText(self.ConfigData.GuideText))
  else
    self.Text_PointName:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function Guide_Icon_Point_C:SetPhantomImgAvatar()
  if self.GuideType == "Phantom" and self.Phantom then
    if self.PhantomGuideState == PhantomStateEnum.Alive then
      local MiniIconPath = "/Game/UI/Texture/Dynamic/Image/Head/Mini/"
      local PhantomGuideIconImg = DataMgr.BattleChar[self.TargetActor.UnitId].GuideIconImg
      local NormalIconName = "T_Normal_" .. PhantomGuideIconImg
      local IconImage = LoadObject(MiniIconPath .. NormalIconName .. "." .. NormalIconName)
      self.Phantom.Img_Avatar:SetBrushResourceObject(IconImage)
    elseif self.PhantomGuideState == PhantomStateEnum.Dead then
      local MiniIconPath = "/Game/UI/Texture/Dynamic/Image/Head/Mini/"
      local PhantomGuideIconImg = DataMgr.BattleChar[self.TargetActor.UnitId].GuideIconImg
      local DeadIconName = "T_Dead_" .. PhantomGuideIconImg
      local IconImage = LoadObject(MiniIconPath .. DeadIconName .. "." .. DeadIconName)
      self.Phantom.Img_Avatar:SetBrushResourceObject(IconImage)
    end
  end
end

function Guide_Icon_Point_C:TryPlayAppearAudio()
  if self.GuideType == "Task" then
    AudioManager(self):PlayUISound(self, "event:/ui/common/guide_point_show", nil, nil)
  end
end

function Guide_Icon_Point_C:SetGuideImage(ImageName)
  local ImagePath = UIConst.DUNGEONINDICATORIMG[ImageName]
  if nil ~= ImagePath and nil ~= self.Img_GuidePoint_Icon then
    local IconImage = LoadObject(ImagePath)
    if nil == IconImage then
      self:DebugPrint("InitConfigData: \230\140\135\229\188\149\231\130\185 Icon \229\155\190\231\137\135\228\184\141\229\173\152\229\156\168\239\188\129")
      return
    end
    self.Img_GuidePoint_Icon:SetBrushResourceObject(IconImage)
  end
end

function Guide_Icon_Point_C:Refresh(BPName, RequireInAnimation)
  if nil ~= BPName then
    if nil ~= self[BPName .. "_Arrows"] and nil ~= self.Common_Arrows then
      self.Common_Arrows:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if true == RequireInAnimation then
      self:PlayAppearAnim()
    end
    BPName = "Panel_" .. BPName
    if nil ~= self[BPName] then
      self[BPName]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  else
    self:SetVisibilityOnDoor(false)
    self:SetVisibilityNotOnDoor(false)
  end
end

function Guide_Icon_Point_C:Reset(TargetEid, TargetActor, TargetLocation, ConfigData, RequireDirectionArrow, RequireFollowingActor, RequireLookUpEntity, RequireInAnimation, UseRealDistance, IsResetPos)
  self.TargetEid = TargetEid
  self.TargetActor = TargetActor
  self.TargetPointPos = TargetLocation
  self.UseRealDistance = UseRealDistance
  self.RequireInAnimation = RequireInAnimation
  self.RequireLookUpEntity = RequireLookUpEntity
  self.RequireDirectionArrow = RequireDirectionArrow
  self.RequireFollowingActor = RequireFollowingActor
  if IsResetPos then
    self.TargetOffsetOnDoor = 0
  end
  if nil ~= ConfigData then
    self.ConfigData = ConfigData
  end
  self:InitConfigData()
end

function Guide_Icon_Point_C:Disappear()
  if self.Style == self.Styles.Disappearing then
    return
  end
  self.Style = self.Styles.Disappearing
  if self.ConfigData ~= nil and nil ~= self.ConfigData.GuideIconAni and self.RequireInAnimation then
    self:UnbindAllFromAnimationFinished(self.Out)
    
    local function PlayAnimFinished()
      local StyleNode = "Panel_" .. self.ConfigData.GuideIconAni
      if nil ~= self[StyleNode] then
        self[StyleNode]:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
      self:Close()
    end
    
    if self.Out ~= nil then
      self:BindToAnimationFinished(self.Out, {self, PlayAnimFinished})
      self:PlayAnimation(self.Out)
    else
      PlayAnimFinished()
    end
  else
    self:Close()
  end
end

function Guide_Icon_Point_C:ChangeStyle(Style, Count)
  if self.ConfigData == nil or nil == self.ConfigData.GuideIconAni then
    self:DebugPrint("ChangeStyle: \230\140\135\229\188\149\231\130\185\230\156\170\230\152\190\231\164\186")
    return
  end
  if Style == self.Styles.Single then
    if nil ~= self.Panel_Quantity then
      self.Panel_Quantity:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if nil ~= self.Panel_GuidePoint_More then
      self.Panel_GuidePoint_More:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  elseif Style == self.Styles.Multiple then
    if nil ~= self.Text_Quantity and nil ~= self.Panel_Quantity then
      self.Text_Quantity:SetText(tostring(Count))
      self.Panel_Quantity:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    if nil ~= self.Panel_GuidePoint_More then
      self.Panel_GuidePoint_More:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  else
    self:DebugPrint("ChangeStyle: \230\160\183\229\188\143\228\184\141\229\144\136\230\179\149")
  end
end

function Guide_Icon_Point_C:GetVisible()
  return self.TargetVisibilityOnDoor
end

function Guide_Icon_Point_C:SetVisibilityNotOnDoor(Visible)
  self.TargetVisibility = Visible
  if self.TargetVisibility == true and true == self.TargetVisibilityOnDoor then
    self.Guide_Node:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if self.TargetVisibility == false then
    self.Guide_Node:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function Guide_Icon_Point_C:SetVisibilityOnDoor(Visible, HideObjs)
  if true == Visible then
    self.TargetVisibilityOnDoor = true
    self.CurrentVisbilityOnDoor = true
  elseif false == Visible then
    self.TargetVisibilityOnDoor = false
  end
  self.HideBehinds = HideObjs
  if true == self.TargetVisibility and true == self.TargetVisibilityOnDoor then
    self.Guide_Node:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function Guide_Icon_Point_C:PlayAppearAnim()
  if self.In ~= nil then
    self:PlayAnimation(self.In)
  end
end

function Guide_Icon_Point_C:RePlayAppearAnim()
  if self.Loop ~= nil then
    self:PlayAnimation(self.Loop, 0, 2)
  end
end

function Guide_Icon_Point_C:GetTargetPosition(SceneManager)
  if self.RequireLookUpEntity == true then
    self.TargetActor = Battle(self):GetEntity(self.TargetEid)
    if IsValid(self.TargetActor) then
      self.RequireLookUpEntity = false
      self.GuideType = self.TargetActor.UnitType
    else
      local ClientGuideData = SceneManager.CurSceneGuideEids[self.TargetEid]
      if nil ~= ClientGuideData then
        if ClientGuideData.Type == "DataStruct" then
          if ClientGuideData.Entity and ClientGuideData.Entity.Loc then
            self.TargetPointPos = ClientGuideData.Entity.Loc
          else
            self:DebugPrint("GetTargetPosition: Entity.Loc \230\151\160\230\149\136")
          end
        else
          local RealEntity = Battle(self):GetEntity(CurSceneGuideData.Entity)
          if IsValid(RealEntity) then
            self.TargetPointPos = RealEntity:K2_GetActorLocation()
          else
          end
        end
      else
      end
    end
  elseif not IsValid(self.TargetActor) then
    self:DebugPrint("GetTargetPosition: \233\135\141\230\150\176\232\142\183\229\143\150 TargetActor \229\174\158\228\190\139")
    self.RequireLookUpEntity = true
  end
end

function Guide_Icon_Point_C:AdjustTargetPosition()
  if not IsValid(self.TargetActor) or not IsValid(self.TargetActor) then
    return
  end
  if self.TargetActor.UnitType ~= "Monster" and self.RequireFollowingActor == false and self.TargetPointPos ~= nil then
    return
  end
  if self.TargetPointPos == nil then
    self.TargetPointPos = FVector(0, 0, 0)
  end
  local TargetActorLocation = self.TargetActor:K2_GetActorLocation()
  self:AssignVector(TargetActorLocation, self.TargetPointPos)
  if self.TargetActor.CapsuleComponent and self.TargetActor.CapsuleComponent.GetUnscaledCapsuleHalfHeight then
    self.TargetPointPos.Z = TargetActorLocation.Z + self.TargetActor.CapsuleComponent:GetUnscaledCapsuleHalfHeight() * 0.8
    if self.TargetActor.UnitType == "Phantom" then
      self.TargetPointPos.Z = TargetActorLocation.Z + self.TargetActor.CapsuleComponent:GetUnscaledCapsuleHalfHeight() * 1.0
    end
  elseif self.TargetActor.Sphere and self.TargetActor.Sphere.GetScaledSphereRadius then
    self.TargetPointPos.Z = TargetActorLocation.Z + self.TargetActor.Sphere:GetScaledSphereRadius()
  elseif self.TargetActor.Box and self.TargetActor.Box.GetScaledBoxExtent then
    self.TargetPointPos.Z = TargetActorLocation.Z + self.TargetActor.Box:GetScaledBoxExtent().Z
  end
end

function Guide_Icon_Point_C:CheckPhantomIsNeedChangeIconState()
  local function TryPlayResurgenceSuccessFromResurrectEnd()
    if self.PhantomGuideState == PhantomStateEnum.Resurrecting then
      DebugPrint("Guide_Icon_Point_C:TryPlayResurgenceSuccessFromResurrectEnd", self.TargetEid)
      
      self:BindToAnimationFinished(self.Resurgence_Success, {
        self,
        self.PlayPhantomNormalAnimation
      })
      self:PlayAnimation(self.Resurgence_Success)
    end
  end
  
  if self.TargetActor:IsInRecovering() and self.PhantomGuideState ~= PhantomStateEnum.Resurrecting then
    DebugPrint("Guide_Icon_Point_C:CheckPhantomIsNeedChangeIconState Recovering", self.TargetEid)
    self.PhantomGuideState = PhantomStateEnum.Resurrecting
    self:PlayAnimation(self.Resurgence)
    return true
  elseif self.TargetActor:IsDead() and self.PhantomGuideState == PhantomStateEnum.Alive then
    DebugPrint("Guide_Icon_Point_C:CheckPhantomIsNeedChangeIconState dead", self.TargetEid)
    if self.PhantomGuideState == PhantomStateEnum.Alive then
      self:PlayAnimation(self.Dead)
      if self:GetCanRecoveryCount() <= 0 and self.TargetActor:IsDead() then
        local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
        local UIManager = GameInstance:GetGameUIManager()
        UIManager:ShowUITip_BattleCommonTop(UIConst.Tip_CommonTop, "TOAST_PHANTOM_ISDEAD")
      end
    end
    self.PhantomGuideState = PhantomStateEnum.Dead
    return true
  elseif not self.TargetActor:IsDead() and self.PhantomGuideState ~= PhantomStateEnum.Alive then
    TryPlayResurgenceSuccessFromResurrectEnd()
    self.PhantomGuideState = PhantomStateEnum.Alive
    DebugPrint("Guide_Icon_Point_C:CheckPhantomIsNeedChangeIconState alive", self.TargetEid)
    self:PlayAnimation(self.Normal)
    return true
  elseif not self.TargetActor:IsInRecovering() and self.TargetActor:IsDead() and self.PhantomGuideState == PhantomStateEnum.Resurrecting then
    DebugPrint("Guide_Icon_Point_C:CheckPhantomIsNeedChangeIconState dead", self.TargetEid)
    self.PhantomGuideState = PhantomStateEnum.Dead
    self:PlayAnimation(self.Dead)
    return true
  end
  return false
end

function Guide_Icon_Point_C:PlayPhantomNormalAnimation()
  self:PlayAnimation(self.Normal)
end

function Guide_Icon_Point_C:SetIconStateStyle()
  self:SetPhantomImgAvatar()
  if self.PhantomGuideState == PhantomStateEnum.Alive then
    self.Phantom.Bar_Circle:GetDynamicMaterial():SetScalarParameterValue("Percent", 1)
    self.Panel_RemainTimes:SetRenderOpacity(0)
    self.Panel_Rescue:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif self.PhantomGuideState == PhantomStateEnum.Dead then
    self.Phantom.Bg_Black01:SetVisibility(UE4.ESlateVisibility.Collapsed)
    local CanRecoveryCount = self:GetCanRecoveryCount()
    if CanRecoveryCount > 0 then
      self.Text_Times:SetText(CanRecoveryCount)
    end
    self.Text_Distance:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  elseif self.PhantomGuideState == PhantomStateEnum.Resurrecting then
    self.Panel_Rescue:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_Distance:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function Guide_Icon_Point_C:UpdatePhantomVisbility()
  if self.TargetActor:IsDead() then
    if self:GetCanRecoveryCount() <= 0 then
      self.TargetPhantomOpacity = 0
    else
      self.TargetPhantomOpacity = 1
    end
  else
    local CameraMgr = UE4.UGameplayStatics.GetPlayerCameraManager(self, 0)
    if nil == CameraMgr then
      return
    end
    local HitScene = UE4.UKismetSystemLibrary.LineTraceSingle(self, self.TargetWorldLoc, CameraMgr:GetCameraLocation(), ETraceTypeQuery.TraceScene, false, nil, 0, FHitResult(), true)
    if self.IsOutElliptic or HitScene then
      self.TargetPhantomOpacity = 1
    else
      self.TargetPhantomOpacity = 0
    end
  end
  self.CurrentPhantomOpacity = UE4.UKismetMathLibrary.Lerp(self.CurrentPhantomOpacity, self.TargetPhantomOpacity, self.PhantomOpacityLerpInterval)
  self:SetRenderOpacity(self.CurrentPhantomOpacity)
end

function Guide_Icon_Point_C:UpdatePhantomGuide()
  if self:CheckPhantomIsNeedChangeIconState() then
    self:SetIconStateStyle()
  end
  self:UpdatePhantomCanRecoveryCount()
  self:UpdateRecoveryBarCircle()
end

function Guide_Icon_Point_C:UpdatePhantomCanRecoveryCount()
  if self.TargetActor:IsDead() then
    local CanRecoveryCount = self:GetCanRecoveryCount()
    if CanRecoveryCount > 0 and not self.TargetActor:IsInRecovering() then
      self.Panel_RemainTimes:SetRenderOpacity(1.0)
      self.Text_Times:SetText(CanRecoveryCount)
    end
  end
end

function Guide_Icon_Point_C:UpdateRecoveryBarCircle()
  if self.TargetActor:IsInRecovering() and self.PhantomGuideState == PhantomStateEnum.Resurrecting then
    self.Text_Percent:SetText(math.floor(self.TargetActor:GetRecoveryPercent()))
    self.Phantom.Bar_Circle:GetDynamicMaterial():SetScalarParameterValue("Percent", self.TargetActor:GetRecoveryPercent() / 100)
  end
end

function Guide_Icon_Point_C:GetCanRecoveryCount()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local PhantomRecoveryCount = Player.PlayerState.PhantomRecoveryCount
  local PhantomRecoveryMaxCount = Player.PlayerState.PhantomRecoveryMaxCount
  return PhantomRecoveryMaxCount - PhantomRecoveryCount
end

function Guide_Icon_Point_C:UpdateIndicator()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if nil == GameInstance then
    self:DebugPrint("UpdateIndicator: GameInstance \228\184\141\229\173\152\229\156\168")
    return
  end
  local SceneManager = GameInstance:GetSceneManager()
  if nil == SceneManager then
    self:DebugPrint("UpdateIndicator: SceneManager \228\184\141\229\173\152\229\156\168")
    return
  end
  if self.GuideType == "Phantom" and self.Phantom then
    self:UpdatePhantomGuide()
    self:UpdatePhantomVisbility()
  end
  self:GetTargetPosition(SceneManager)
  self:AdjustTargetPosition()
  if not IsValid(self.TargetActor) and nil == self.TargetPointPos then
    self:Disappear()
    return
  end
  local Player = UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) or nil == self.TargetPointPos then
    self:DebugPrint("UpdateIndicator: Player \228\184\141\229\173\152\229\156\168")
    return
  end
  local Controller = Player:GetController()
  local IsOnDoor = SceneManager:CaluCurGuideNeedShowPos(self.TargetEid, self.DoorPosition, self.DoorDirection)
  if true == IsOnDoor then
    self.State = self.States.OnDoor
    self:AssignVector(self.DoorPosition, self.TargetWorldLoc)
    self.TargetWorldLoc.Z = self.DoorPosition.Z + 150
  else
    self.State = self.States.OnActor
    self:AssignVector(self.TargetPointPos, self.TargetWorldLoc)
  end
  if self.SpawnDown == false then
    self.SpawnDown = true
    if true == self.FlyToTarget then
      self:AssignVector(Player:K2_GetActorLocation(), self.CurrentWorldLoc)
    else
      self:AssignVector(self.TargetWorldLoc, self.CurrentWorldLoc)
    end
  end
  local ViewportSize = UIManager(self):GetViewportSize()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.CenterPos.X, self.CenterPos.Y = ViewportSize.X * 0.5, ViewportSize.Y * 0.463
    self.OvalSize.X, self.OvalSize.Y = 0.6 * ViewportSize.X * 0.5, 0.55 * ViewportSize.Y * 0.5
  elseif CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.CenterPos.X, self.CenterPos.Y = ViewportSize.X * 0.5, ViewportSize.Y * 0.4723
    self.OvalSize.X, self.OvalSize.Y = 0.62 * ViewportSize.X * 0.5, 0.532 * ViewportSize.Y * 0.5
  end
  if not Controller:IsA(APlayerController) then
    return
  end
  local CurrentOffsetOnDoor, LocLerpFinished, IndicatorAngle, TargetDistance, CurrentDistance, IsOutElliptic, IsOutScreen = UUIFunctionLibrary.LerpAndProjectWorldToScreenInEllipse(Controller, self.TargetWorldLoc, self.CurrentWorldLoc, self.LocationLerpInterval, self.ScreenLocation, self.CenterPos, self.OvalSize, self.BoardSize, self.State == self.States.OnDoor, self.TargetOffsetOnDoor, self.CurrentOffsetOnDoor, self.OffsetLerpInterval, false, 0, 0, 0, false)
  self.IsOutScreen = IsOutScreen
  self.IsOutElliptic = IsOutElliptic
  self.CurrentOffsetOnDoor = CurrentOffsetOnDoor
  if true == LocLerpFinished and false == self.TargetVisibilityOnDoor and true == self.CurrentVisbilityOnDoor then
    self.Guide_Node:SetVisibility(ESlateVisibility.Collapsed)
    self.CurrentVisbilityOnDoor = false
  end
  if self.UseRealDistance then
    TargetDistance = UKismetMathLibrary.Vector_Distance(Player.CurrentLocation, self.TargetPointPos) / 100.0
  end
  self.PointRealDistance = TargetDistance
  self:SetArrowAndNumVisiblity(IndicatorAngle)
  local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Guide_Node)
  local ViewPortScale = UWidgetLayoutLibrary.GetViewportScale(self)
  self.CacheScreenPos:Set(self.ScreenLocation.X / ViewPortScale, self.ScreenLocation.Y / ViewPortScale)
  CanvasSlot:SetPosition(self.CacheScreenPos)
end

function Guide_Icon_Point_C:GetDistanceText()
  if self.PointRealDistance < 1 then
    return "<1" .. self.DistanceUnit
  end
  if self.PointRealDistance <= 9999 then
    return tostring(math.ceil(self.PointRealDistance)) .. self.DistanceUnit
  end
  return ">9999" .. self.DistanceUnit
end

function Guide_Icon_Point_C:SetArrowAndNumVisiblity(IndicatorAngle)
  local StyleNodeName = self.ConfigData and self.ConfigData.GuideIconAni or ""
  if self.RequireDirectionArrow and self.IsOutElliptic then
    if self[StyleNodeName .. "_Arrows"] ~= nil then
      self[StyleNodeName .. "_Arrows"]:SetRenderTransformAngle(IndicatorAngle + 45)
      self[StyleNodeName .. "_Arrows"]:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.Common_Arrows:SetRenderTransformAngle(IndicatorAngle + 45)
      self.Common_Arrows:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    if self.GuideType == "Phantom" and self.Phantom then
      if self.TargetActor:IsDead() and self.PhantomGuideState == PhantomStateEnum.Dead then
        self.Panel_RemainTimes:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
      if self.TargetActor:IsInRecovering() and self.PhantomGuideState == PhantomStateEnum.Resurrecting then
        self.Common_Arrows:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
    self.Text_Distance:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    if self[StyleNodeName .. "_Arrows"] ~= nil then
      self[StyleNodeName .. "_Arrows"]:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.Common_Arrows:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    self.Text_Distance:SetText(self:GetDistanceText())
    self.Text_Distance:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.PointRealDistance <= 2 and self.GuideType == "Task" then
      self.Text_Distance:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if self.GuideType == "Phantom" and self.Phantom then
      if self.TargetActor:IsDead() and self.PhantomGuideState == PhantomStateEnum.Dead then
        self.Panel_RemainTimes:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      elseif self.TargetActor:IsInRecovering() and self.PhantomGuideState == PhantomStateEnum.Resurrecting then
        self.Text_Distance:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
  end
end

return Guide_Icon_Point_C
