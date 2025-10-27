require("UnLua")
local WBP_DungeonIndicatorUI_C = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})
local ErrorLoc = FVector(2147483647, 2147483647, 2147483647)

function WBP_DungeonIndicatorUI_C:DebugPrint(...)
  DebugPrint("DungeonIndicator", ...)
end

function WBP_DungeonIndicatorUI_C:AssignVector(from, to)
  to.X, to.Y, to.Z = from.X, from.Y, from.Z
end

function WBP_DungeonIndicatorUI_C:AssignVector2D(from, to)
  to.X, to.Y = from.X, from.Y
end

function WBP_DungeonIndicatorUI_C:GetVisible()
  return self.TargetVisibilityOnDoor
end

function WBP_DungeonIndicatorUI_C:GetRealDistance()
  return self.PointRealDistance
end

function WBP_DungeonIndicatorUI_C:GetIconPathName()
  if self.ConfigData == nil then
    return ""
  end
  return self.SceneManager:GetGuideGuideAnimByBPPath(self.ConfigData.GuideIconAni, self.ConfigData.GuideIconBPPath)
end

function WBP_DungeonIndicatorUI_C:Construct()
  self.Super.Construct(self)
  self.MobileOvalSizeXRatio = 0.41
  self.MobileOvalSizeYRatio = 0.42
end

function WBP_DungeonIndicatorUI_C:Destruct()
  self.Super.Destruct(self)
  self:ClearEventPreDestruct()
end

function WBP_DungeonIndicatorUI_C:AttachEventOnLoaded()
  if self.GuideType == "Phantom" then
    EventManager:AddEvent(EventID.OnTeamRecoveryStateChange, self, self.SetPhantomGuideStateByEvent)
  end
  if self.GuideType == "Hostage" then
    EventManager:AddEvent(EventID.TriggerHostageVisibility, self, self.ChangeHostageVisibility)
    EventManager:AddEvent(EventID.TriggerHostageGuideLoop, self, self.TriggerDeadGuideDisplay)
  end
  EventManager:AddEvent(EventID.RecycleClassToCachePool, self, self.DisappearCacheIndicatorClass)
end

function WBP_DungeonIndicatorUI_C:ClearEventPreDestruct()
  EventManager:RemoveEvent(EventID.OnTeamRecoveryStateChange, self)
  EventManager:RemoveEvent(EventID.RecycleClassToCachePool, self)
  EventManager:RemoveEvent(EventID.TriggerHostageVisibility, self)
  EventManager:RemoveEvent(EventID.TriggerHostageGuideLoop, self)
end

function WBP_DungeonIndicatorUI_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  local TargetPointPos
  self.TargetEid, self.TargetActor, TargetPointPos, self.ConfigData, self.RequireDirectionArrow, self.RequireFollowingActor, self.RequireLookUpEntity, self.RequireInAnimation, self.UseRealDistance = ...
  self.TargetActor = Battle(self):GetEntity(self.TargetEid)
  if nil ~= TargetPointPos then
    self.TargetPointPos = TargetPointPos
  end
  DebugPrint("HTY WBP_DungeonIndicatorUI_C:OnLoaded self.TargetPointPos", self.TargetPointPos, "self.TargetEid", self.TargetEid)
  self:OnIndicatorLoaded()
end

function WBP_DungeonIndicatorUI_C:Close()
  if self.IsFromPool then
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.IsActiveInPoor = false
    self.GameState:AddIndicatorToPool(self.GuideType, self)
    self.IndicatorStyle = EIndicatorStyle.Single
  else
    self.Super.Close(self)
  end
end

function WBP_DungeonIndicatorUI_C:InitConfigData()
  if IsValid(self.TargetActor) then
    self.GuideType = self.TargetActor.UnitType
  end
  if self.ConfigData ~= nil then
    local RealGuideType = self.SceneManager:GetGuideTypeByBPPath(self.ConfigData.GuideIconAni, self.ConfigData.GuideIconBPPath)
    if nil ~= RealGuideType then
      self.GuideType = RealGuideType
    end
  end
  if self.ConfigData == nil then
    return
  end
  self:AttachEventOnLoaded()
  self:OnInitConfig()
  self:InitIndicatorByConfigData(self.SceneManager:GetGuideGuideAnimByBPPath(self.ConfigData.GuideIconAni, self.ConfigData.GuideIconBPPath) or "", self.ConfigData.GuideIconBPPath or "", self.ConfigData.GuideText or "")
  self:InitFlyToTarget()
end

function WBP_DungeonIndicatorUI_C:RequestSnapShotInfo()
  DebugPrint("RequestSnapShotInfo TargetEid", self.TargetEid)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(GameInstance, 0)
  PlayerCharacter.RPCComponent:RequestGuideInfo(self.TargetEid)
end

function WBP_DungeonIndicatorUI_C:SetGuideColor(ImagePath)
  local PathColor = self.WBP_GuidePoint_Base.GuideColorMap:Find(ImagePath)
  if nil ~= PathColor then
    self.WBP_GuidePoint_Base.ArrowColor = PathColor.ArrowColor
    self.WBP_GuidePoint_Base.GeometryColor = PathColor.GeometryColor
    self.ImgMaterial:SetVectorParameterValue("ArrowColor", PathColor.ArrowColor)
    self.ImgMaterial:SetVectorParameterValue("GeometryColor", PathColor.GeometryColor)
  end
end

function WBP_DungeonIndicatorUI_C:OnInitConfig()
  if self["InitConfigDataWithType_" .. self.GuideType] then
    self["InitConfigDataWithType_" .. self.GuideType](self)
  end
  if self.ConfigData.GuideIconAni == "/Game/UI/WBP/GuidePoint/WBP_GuidePoint_BlastRobot.WBP_GuidePoint_BlastRobot" and self.Sustained and self.TargetActor then
    local MonsterDelayTime = self.TargetActor.GuideDelayTime
    local PlayTime = self.Sustained:GetEndTime() - self.Sustained:GetStartTime()
    local NewSpeed = PlayTime / MonsterDelayTime
    self:PlayAnimation(self.Sustained, 0, 1, EUMGSequencePlayMode.Forward, NewSpeed)
  end
  if self.ConfigData.PlayerIndex and self.ConfigData.PlayerIndex > 0 then
    self.PlayerIndex = self.ConfigData.PlayerIndex
  end
  self:SetArrowWidgetColor()
end

function WBP_DungeonIndicatorUI_C:InitFlyToTarget()
  if self.SpawnDown == false and (self.GuideType == "Monster" or self.GuideType == "Mechanism") then
    self.FlyToTarget = false
  else
    self.FlyToTarget = true
  end
end

function WBP_DungeonIndicatorUI_C:SetArrowWidgetColor()
  if self.GuideType == "Monster" and self.ConfigData.GuideIconBPPath == "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_TreasureHunter.T_Gp_TreasureHunter" then
    local TreasureSlateColor = self.Color_Purple
    self:SetArrowColor(TreasureSlateColor.SpecifiedColor)
  end
end

function WBP_DungeonIndicatorUI_C:SetPhantomImgAvatar()
  if self.ConfigData.PlayerIndex and self.ConfigData.PlayerIndex > 0 then
    UE4.UResourceLibrary.LoadObjectAsync(self, self.ConfigData.GuideIconBPPath, {
      self,
      WBP_DungeonIndicatorUI_C.OnPhantomImgIconLoadFinish
    })
    return
  end
  if self.ConfigData.BattleRoleId == nil or nil == DataMgr.BattleChar[self.ConfigData.BattleRoleId] or nil == DataMgr.BattleChar[self.ConfigData.BattleRoleId].GuideIconImg then
    return
  end
  if self.GuideType == "Phantom" and nil ~= self.Phantom then
    if self.CurPhantomGuideState == EPhantomGuideState.Alive then
      local MiniIconPath = "/Game/UI/Texture/Dynamic/Image/Head/Mini/"
      local PhantomGuideIconImg = DataMgr.BattleChar[self.ConfigData.BattleRoleId].GuideIconImg
      local NormalIconName = "T_Normal_" .. PhantomGuideIconImg
      UE4.UResourceLibrary.LoadObjectAsync(self, MiniIconPath .. NormalIconName .. "." .. NormalIconName, {
        self,
        WBP_DungeonIndicatorUI_C.OnPhantomImgIconLoadFinish
      })
    elseif self.CurPhantomGuideState == EPhantomGuideState.Dead then
      local MiniIconPath = "/Game/UI/Texture/Dynamic/Image/Head/Mini/"
      local PhantomGuideIconImg = DataMgr.BattleChar[self.ConfigData.BattleRoleId].GuideIconImg
      local DeadIconName = "T_Dead_" .. PhantomGuideIconImg
      UE4.UResourceLibrary.LoadObjectAsync(self, MiniIconPath .. DeadIconName .. "." .. DeadIconName, {
        self,
        WBP_DungeonIndicatorUI_C.OnPhantomImgIconLoadFinish
      })
    end
  end
end

function WBP_DungeonIndicatorUI_C:OnPhantomImgIconLoadFinish(Object)
  if Object then
    self.Phantom.Img_Avatar:SetBrushResourceObject(Object)
  end
end

function WBP_DungeonIndicatorUI_C:Reset(TargetEid, TargetActor, TargetLocation, ConfigData, RequireDirectionArrow, RequireFollowingActor, RequireLookUpEntity, RequireInAnimation, UseRealDistance, IsResetPos)
  if nil ~= ConfigData then
    self.ConfigData = ConfigData
  end
  self:Reset_Cpp(TargetEid, TargetActor, TargetLocation, RequireDirectionArrow, RequireFollowingActor, RequireLookUpEntity, RequireInAnimation, UseRealDistance, IsResetPos)
end

function WBP_DungeonIndicatorUI_C:InitConfigDataWithType_Pet()
  if self.ConfigData and self.ConfigData.GuideDuration and self.ConfigData.GuideCloseRange then
    self.ShowTime = self.ConfigData.GuideDuration
    self.CloseDistance = self.ConfigData.GuideCloseRange
    self.RegionImagePath = self.ConfigData.GuideIconBPPath2
  end
end

function WBP_DungeonIndicatorUI_C:InitConfigDataWithType_Mechanism()
  if self.ConfigData and self.ConfigData.GuideDuration and self.ConfigData.GuideCloseRange then
    self.ShowTime = self.ConfigData.GuideDuration
    self.CloseDistance = self.ConfigData.GuideCloseRange
  end
end

function WBP_DungeonIndicatorUI_C:CheckNeedPlayFinishAnim()
  return self.ConfigData ~= nil and nil ~= self.ConfigData.GuideIconAni and self.RequireInAnimation
end

function WBP_DungeonIndicatorUI_C:GetStyleNodeName()
  if not self.ConfigData then
    return ""
  end
  return "Panel_" .. self.SceneManager:GetGuideGuideAnimByBPPath(self.ConfigData.GuideIconAni, self.ConfigData.GuideIconBPPath)
end

function WBP_DungeonIndicatorUI_C:ChangeStyle(IndicatorStyle, Count)
  if self.ConfigData == nil or nil == self.ConfigData.GuideIconAni then
    self:DebugPrint("ChangeStyle: \230\140\135\229\188\149\231\130\185\230\156\170\230\152\190\231\164\186")
    return
  end
  if self.IndicatorStyle == EIndicatorStyle.Disappearing then
    return
  end
  if IndicatorStyle == EIndicatorStyle.Multiple and self.IsNeedMultipleShow then
    self.IndicatorStyle = EIndicatorStyle.Multiple
    if nil ~= self.Text_Quantity and nil ~= self.Panel_Quantity then
      self.Text_Quantity:SetText(tostring(Count))
      self.Panel_Quantity:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    if nil ~= self.Panel_GuidePoint_More then
      self.Panel_GuidePoint_More:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    elseif nil ~= self.WBP_GuidePoint_Base and nil ~= self.ImgMaterial then
      self.ImgMaterial:SetScalarParameterValue("HasMore", 1)
    end
  elseif IndicatorStyle == EIndicatorStyle.Single then
    self.IndicatorStyle = EIndicatorStyle.Single
    if nil ~= self.Panel_Quantity then
      self.Panel_Quantity:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    if nil ~= self.Panel_GuidePoint_More then
      self.Panel_GuidePoint_More:SetVisibility(UE4.ESlateVisibility.Collapsed)
    elseif nil ~= self.WBP_GuidePoint_Base and nil ~= self.ImgMaterial then
      self.ImgMaterial:SetScalarParameterValue("HasMore", 0)
    end
  end
end

function WBP_DungeonIndicatorUI_C:SetVisibilityNotOnDoor(Visible)
  self.TargetVisibility = Visible
  if self.TargetVisibility == true and true == self.TargetVisibilityOnDoor then
    self.Main:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if self.TargetVisibility == false then
    self.Main:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_DungeonIndicatorUI_C:Show(ShowTag)
  WBP_DungeonIndicatorUI_C.Super.Show(self, ShowTag)
end

function WBP_DungeonIndicatorUI_C:Hide(HideTag)
  for _, Widget in pairs(UIConst.DungeonIndicatorShowWidgets) do
    if HideTag == "InUIConfigure" .. Widget then
      return
    end
  end
  WBP_DungeonIndicatorUI_C.Super.Hide(self, HideTag)
end

function WBP_DungeonIndicatorUI_C:PlayAppearAnim()
  if self.In ~= nil then
    self:PlayAnimation(self.In)
  end
end

function WBP_DungeonIndicatorUI_C:RePlayAppearAnim()
  if self.Loop ~= nil then
    self:PlayAnimation(self.Loop, 0, 2)
  elseif self.WBP_GuidePoint_Base then
    self.WBP_GuidePoint_Base:PlayAnimation(self.WBP_GuidePoint_Base.Loop, 0, 2)
  end
end

function WBP_DungeonIndicatorUI_C:PlayLoopAnim()
  if self.Loop ~= nil then
    self:PlayAnimation(self.Loop, 0)
  elseif self.WBP_GuidePoint_Base then
    self.WBP_GuidePoint_Base:PlayAnimation(self.WBP_GuidePoint_Base.Loop, 0)
  end
end

function WBP_DungeonIndicatorUI_C:PlayConfigLoopAnim()
  if self.NeedPlayConfigLoop then
    self:PlayLoopAnim()
  elseif self.ConfigData and self.ConfigData.GuideIconBPPath and self.WBP_GuidePoint_Base then
    local PathColorConfig = self.WBP_GuidePoint_Base.GuideColorMap:Find(self.ConfigData.GuideIconBPPath)
    if PathColorConfig and PathColorConfig.NeedPlayConfigLoop then
      self:PlayLoopAnim()
    end
  end
end

function WBP_DungeonIndicatorUI_C:GetCurSceneGuideEidEntityAsFSnapShotInfo()
  local ClientGuideData = self.SceneManager.CurSceneGuideEids[self.TargetEid]
  if nil ~= ClientGuideData and ClientGuideData.IsDataStruct == true then
    return ClientGuideData.Entity
  else
    return FSnapShotInfo()
  end
end

function WBP_DungeonIndicatorUI_C:GetCurSceneGuideEidEntityAsActor()
  local ClientGuideData = self.SceneManager.CurSceneGuideEids[self.TargetEid]
  if nil ~= ClientGuideData and ClientGuideData.IsDataStruct == false then
    return Battle(self):GetEntity(ClientGuideData.Entity)
  else
    return nil
  end
end

function WBP_DungeonIndicatorUI_C:GetFromGText(Name)
  return GText(Name) or ""
end

function WBP_DungeonIndicatorUI_C:CaluCurGuideNeedShowPos()
  return self.SceneManager:CaluCurGuideNeedShowPos(self.TargetEid, self.DoorPosition, self.DoorDirection)
end

function WBP_DungeonIndicatorUI_C:SetMechanismRelativePosition()
  if self.TargetActor and self.TargetActor.GetGuidePos then
    local RelativePosition = self.TargetActor:GetGuidePos()
    if RelativePosition then
      self.MechanismLoc.X = RelativePosition.X
      self.MechanismLoc.Y = RelativePosition.Y
      self.MechanismLoc.Z = RelativePosition.Z
    end
  end
end

function WBP_DungeonIndicatorUI_C:SetArrowColor(Color)
  if self.Common_Arrows then
    self.Common_Arrows:SetColorAndOpacity(Color)
  else
    self.ImgMaterial:SetVectorParameterValue("ArrowColor", Color)
  end
end

function WBP_DungeonIndicatorUI_C:InitABCTextInSabotage(GuideIconAni)
  if "Destroy" ~= GuideIconAni then
    return
  end
  if self.TargetEid == nil then
    self:DebugPrint("InitABCTextInSabotage: TargetEid \228\184\141\229\173\152\229\156\168")
    return
  end
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  if nil == GameInstance then
    self:DebugPrint("InitABCTextInSabotage: GameInstance \228\184\141\229\173\152\229\156\168")
    return
  end
  local SceneManager = GameInstance:GetSceneManager()
  if nil == SceneManager then
    self:DebugPrint("InitABCTextInSabotage: SceneManager \228\184\141\229\173\152\229\156\168")
    return
  end
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if nil ~= Player then
    Player.RPCComponent:RequestSabotageGuideInfo_Client(self, self.SetABCTextInSabotage_Callback)
  end
end

function WBP_DungeonIndicatorUI_C:SetABCTextInSabotage_Callback(Eids, UnitIds)
  local index = 0
  for i, Eid in pairs(Eids) do
    if Eid == self.TargetEid then
      index = i
      break
    end
  end
  if 0 == index then
    return
  end
  local ABCLetter = string.char(string.byte("A") + index - 1)
  DebugPrint("WBP_DungeonIndicatorUI_C ABCLetter", ABCLetter, "Eid", self.TargetEid, "index", index)
  local SceneManager = GWorld.GameInstance:GetSceneManager()
  if nil == SceneManager then
    self:DebugPrint("InitABCTextInSabotage: SceneManager \228\184\141\229\173\152\229\156\168")
    return
  end
  local RetPath = SceneManager:GetSabotageABCIconPath(ABCLetter)
  UE4.UResourceLibrary.LoadObjectAsync(self, RetPath, {
    self,
    WBP_DungeonIndicatorUI_C.OnGuideIconLoadFinish
  })
end

function WBP_DungeonIndicatorUI_C:GetTextLetter()
  if self.Text_Letter == nil then
    return nil
  end
  return self.Text_Letter:GetText()
end

function WBP_DungeonIndicatorUI_C:GetExcavationEfficiency()
  local Ent = Battle(self):GetEntity(self.TargetEid)
  if nil ~= Ent then
    return Ent.Efficiency
  end
  return 0
end

function WBP_DungeonIndicatorUI_C:GetExcavationABCLetter()
  local Ent = Battle(self):GetEntity(self.TargetEid)
  if nil ~= Ent then
    local Index = (Ent.GuideOrderIndex - 1) % 6
    return string.char(string.byte("A") + Index)
  end
  return " "
end

function WBP_DungeonIndicatorUI_C:TriggerDeadGuideDisplay(IsLoop)
  if self.WBP_GuidePoint_Base and self.WBP_GuidePoint_Base.Loop and IsLoop then
    self.WBP_GuidePoint_Base:PlayAnimation(self.WBP_GuidePoint_Base.Loop, 0, 0)
    local IconImagePath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rescue_HostageB.T_Gp_Rescue_HostageB"
    UE4.UResourceLibrary.LoadObjectAsync(self, IconImagePath, {
      self,
      WBP_DungeonIndicatorUI_C.OnGuideIconLoadFinish
    })
    EventManager:FireEvent(EventID.OnHostageDeadUpdateMiniMap, true)
    EventManager:FireEvent(EventID.TriggerHostageBattleMapChangeStyle, true)
  elseif not IsLoop then
    self:StopAllAnimations()
    if self.WBP_GuidePoint_Base then
      self.WBP_GuidePoint_Base:StopAllAnimations()
    end
    local IconImagePath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Rescue_HostageA.T_Gp_Rescue_HostageA"
    UE4.UResourceLibrary.LoadObjectAsync(self, IconImagePath, {
      self,
      WBP_DungeonIndicatorUI_C.OnGuideIconLoadFinish
    })
    EventManager:FireEvent(EventID.OnHostageDeadUpdateMiniMap, false)
    EventManager:FireEvent(EventID.TriggerHostageBattleMapChangeStyle, false)
  end
  if IsLoop then
    self:SetArrowColor(self.Color_Red.SpecifiedColor)
  else
    self:SetArrowColor(self.Color_Blue.SpecifiedColor)
  end
end

function WBP_DungeonIndicatorUI_C:OnGuideIconLoadFinish(Object)
  if nil ~= Object then
    if self.Img_GuidePoint_Icon then
      self.Img_GuidePoint_Icon:SetBrushResourceObject(Object)
    else
      self.ImgMaterial:SetTextureParameterValue("GuideIcon", Object)
    end
  end
  self.IsIconLoaded = true
end

function WBP_DungeonIndicatorUI_C:ChangeHostageVisibility(IsShow)
  if IsShow then
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_DungeonIndicatorUI_C:SetPhantomRecoverCountChangeFlagByEvent()
  self.IsChangeRecoverCount = true
end

function WBP_DungeonIndicatorUI_C:SetPhantomGuideStateByEvent(PhantomEid, State, PrevState)
  if self.TargetEid ~= PhantomEid then
    return
  end
  local PreState = self.CurPhantomGuideState
  if State == UE4.ETeamRecoveryState.Dying then
    self.CurPhantomGuideState = EPhantomGuideState.Dead
  elseif State == UE4.ETeamRecoveryState.IsWaitingRecover then
    self.CurPhantomGuideState = EPhantomGuideState.Resurrecting
  elseif State == UE4.ETeamRecoveryState.Alive then
    self.CurPhantomGuideState = EPhantomGuideState.Alive
  end
  if State == UE4.ETeamRecoveryState.Alive and PrevState == UE4.ETeamRecoveryState.IsWaitingRecover then
    self:SetPhantomRecoverCountChangeFlagByEvent()
  end
  self.IsNeedChangeState = true
end

function WBP_DungeonIndicatorUI_C:DisappearCacheIndicatorClass(Eid)
  if self.TargetEid == Eid and self.IsActiveInPoor then
    self:Disappear()
    self.IsActiveInPoor = false
  end
end

function WBP_DungeonIndicatorUI_C:UpdatePhantomCanRecoveryCount()
  if self.TargetActor:IsDead() then
    local CanRecoveryCount = self:GetCanRecoveryCount()
    if CanRecoveryCount > 0 and not self.TargetActor:IsInRecovering() then
      self.Panel_RemainTimes:SetRenderOpacity(1.0)
      self.Text_Times:SetText(CanRecoveryCount)
    end
  end
end

function WBP_DungeonIndicatorUI_C:UpdateRecoveryBarCircle()
  self.Text_Percent:SetText(math.floor(self.TargetActor:GetRecoveryPercent()))
  self.Phantom.Bar_Circle:GetDynamicMaterial():SetScalarParameterValue("Percent", self.TargetActor:GetRecoveryPercent() / 100)
end

function WBP_DungeonIndicatorUI_C:GetCanPhantomRecoveryCount()
  if self.TargetActor:IsPhantom() then
    return self.TargetActor:GetRecoveryMaxCount() - self.TargetActor:GetRecoveryCount()
  end
  return 0
end

function WBP_DungeonIndicatorUI_C:UpdateAlertUI(DeltaSeconds)
  if self.AlertValue > 0 and self.ReadyShowAlert then
    self.Guide_Node:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.IsMax = false
    self.ReadyShowAlert = false
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.In)
    self:SetArrowColor(self.Color_White.SpecifiedColor)
    if self.AlertValue >= self.MaxAlertValue and not self.IsMax then
      self.IsMax = true
      EMUIAnimationSubsystem:EMPlayAnimation(self, self.Max)
      self:SetArrowColor(self.Color_Red.SpecifiedColor)
    end
  elseif self.AlertValue >= self.MaxAlertValue and not self.IsMax then
    self.IsMax = true
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Max)
    self:SetArrowColor(self.Color_Red.SpecifiedColor)
  elseif self.AlertValue <= 0 and not self.ReadyShowAlert then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Out)
    self.ReadyShowAlert = true
    self.FirstDown = false
    self.IsMax = false
    self:StopAlertAudio()
  elseif self.AlertValue > 0 and not self.ReadyShowAlert and self.AlertValue > self.LastAlertValue and self.CanUpAnim and self.FirstDown then
    self.IsMax = false
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Rising)
  elseif self.AlertValue >= 0 and not self.ReadyShowAlert and self.AlertValue <= self.LastAlertValue and self.CanDownAim then
    self.IsMax = false
    EMUIAnimationSubsystem:EMStopAnimation(self, self.Max)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Rising, EUMGSequencePlayMode.Reverse)
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
  end
  if self.AlertValue > 0 and self.AlertValue <= self.MaxAlertValue and self.AlertValue >= self.LastAlertValue then
    self.CanUpAnim = false
    self.CanDownAim = true
    self:CalChange(DeltaSeconds)
  elseif self.AlertValue >= 0 and self.AlertValue <= self.MaxAlertValue and self.AlertValue <= self.LastAlertValue then
    self.CanUpAnim = true
    self.CanDownAim = false
    self.FirstDown = true
    self:CalChange(DeltaSeconds)
  end
end

function WBP_DungeonIndicatorUI_C:CalChange(DeltaSeconds)
  local Times = DeltaSeconds / 0.02
  if Times <= 0 then
    Times = 1
  end
  local SingleChangeValue = (self.AlertValue - self.LastAlertValue) / Times
  Times = math.floor(Times)
  self.Bar:SetPercent(self.LastAlertValue / self.MaxAlertValue)
  self:AddTimer(0.02, self.ChangeBar, true, -1, "ChangeBar", nil, Times, SingleChangeValue)
end

function WBP_DungeonIndicatorUI_C:ChangeBar(Times, SingleChangeValue)
  self.TimerTimes = self.TimerTimes + 1
  local Percent = self.Bar.Percent
  self.Bar:SetPercent(Percent + SingleChangeValue / self.MaxAlertValue)
  if Times <= self.TimerTimes then
    self.TimerTimes = 0
    self:RemoveTimer("ChangeBar")
  end
end

return WBP_DungeonIndicatorUI_C
