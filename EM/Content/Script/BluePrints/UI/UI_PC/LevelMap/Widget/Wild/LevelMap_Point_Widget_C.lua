require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.Btn_Level.OnClicked:Add(self, self.OnClicked)
  self.Btn_Level.OnHovered:Add(self, self.OnHovered)
  self.Btn_Level.OnUnhovered:Add(self, self.OnUnhovered)
  self.Data = nil
  self.TeleportLockPath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Trans01.T_Gp_Trans01"
  self.TeleportNotCompletePath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Trans02.T_Gp_Trans02"
  self.TeleportCompletePath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_Gp_Trans03.T_Gp_Trans03"
  self.Top:SetVisibility(ESlateVisibility.Collapsed)
  self.Bottom:SetVisibility(ESlateVisibility.Collapsed)
  self:BindToAnimationFinished(self.In, {
    self,
    self.OnFadeIn
  })
  self.VisibilityTag = {}
  self.IsMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  self.IsOpen = nil
end

function M:Destruct()
  self.Btn_Level.OnClicked:Clear()
  self.Btn_Level.OnHovered:Clear()
  self.Btn_Level.OnUnhovered:Clear()
  EventManager:RemoveEvent(EventID.OnDeliveryMeshanismOpen, self)
  EventManager:RemoveEvent(EventID.ConditionComplete, self)
end

function M:OnFadeIn()
  if not self.PlayForward then
    self:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:SetPointVisibility(Reason, Visible, NeedHide)
  self.VisibilityTag[Reason] = Visible
  local Result = true
  for _, Tag in pairs(self.VisibilityTag) do
    Result = Result and Tag
  end
  if Result then
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif NeedHide then
    self:SetVisibility(ESlateVisibility.Collapsed)
  end
  return Result
end

function M:SetDoorVisibility(Reason, Visible, NeedHide)
  self.VisibilityTag[Reason] = Visible
  local Result = true
  for _, Tag in pairs(self.VisibilityTag) do
    Result = Result and Tag
  end
  if self.IsOpen then
    self:SetVisibility(ESlateVisibility.Collapsed)
  elseif Result then
    self:SetVisibility(ESlateVisibility.HitTestInvisible)
  elseif NeedHide then
    self:SetVisibility(ESlateVisibility.Collapsed)
  end
  return Result
end

function M:GetPointVisibility(Reason)
  if Reason then
    return self.VisibilityTag[Reason]
  else
    local Result = true
    for _, Tag in pairs(self.VisibilityTag) do
      Result = Result and Tag
    end
    return Result
  end
end

function M:Init(Parent, Data, IsUnlock, ClickFunction, HoverFunction, UnoverFunction)
  self.Parent = Parent
  self.Data = Data
  local ImagePath = Data.TeleportPointIcon
  if ImagePath then
    local image = LoadObject(ImagePath)
    if image then
      self.Img_Point:SetBrushFromTexture(image, true)
    end
  elseif IsUnlock or Const.UnlockRegionTeleport then
    local complete = true
    if Data.Temples ~= nil or nil ~= Data.Parties then
      if Data.Temples ~= nil then
        local Avatar = GWorld:GetAvatar()
        for _, DungeonId in pairs(Data.Temples) do
          local Max = 0
          local IsStarTemple = true
          local DungeonInfo = DataMgr.Temple[DungeonId] or DataMgr.Party[DungeonId]
          if not DungeonInfo then
            complete = false
            break
          end
          if nil ~= DungeonInfo.RewardId and #DungeonInfo.RewardId > 1 then
            IsStarTemple = true
            Max = #DungeonInfo.RewardId
          else
            IsStarTemple = false
            Max = 0
          end
          if not (Avatar and Avatar.Dungeons[DungeonId]) or IsStarTemple and Max > Avatar.Dungeons[DungeonId].MaxStar or not IsStarTemple and not Avatar.Dungeons[DungeonId].IsPass then
            complete = false
            break
          end
        end
      end
    else
      complete = false
    end
    local path = complete and self.TeleportCompletePath or self.TeleportNotCompletePath
    local image = LoadObject(path)
    if image then
      self.Img_Point:SetBrushFromTexture(image, true)
    end
    if not complete then
      self:PlayAnimation(self.SelfLoop, 0, 0)
    end
  else
    local image = LoadObject(self.TeleportLockPath)
    if image then
      self.Img_Point:SetBrushFromTexture(image, true)
    end
  end
  self.ClickFunction = ClickFunction
  self.HoverFunction = HoverFunction
  self.UnoverFunction = UnoverFunction
  EventManager:AddEvent(EventID.OnDeliveryMeshanismOpen, self, self.OnDeliveryMeshanismOpen)
end

function M:InitGuidePoint(Parent, Name, ClickFunction, HoverFunction, UnoverFunction)
  self.Parent = Parent
  self.PointWidgetName = Name
  self.ClickFunction = ClickFunction
  self.HoverFunction = HoverFunction
  self.UnoverFunction = UnoverFunction
  self:PlayAnimation(self.Loop, 0, 0)
end

function M:ClearAllFunc()
  self.Btn_Level.OnClicked:Clear()
  self.Btn_Level.OnHovered:Clear()
  self.Btn_Level.OnUnhovered:Clear()
  self.IsSelected = false
end

function M:ReInitTeleportPoint(Data)
  self.Data = Data
  EventManager:AddEvent(EventID.OnDeliveryMeshanismOpen, self, self.OnDeliveryMeshanismOpen)
end

function M:OnDeliveryMeshanismOpen(CreatorId)
  if self.Data.StaticId == CreatorId then
    self:StopAllAnimations()
    self:PlayAnimation(self.SelfLoop, 0, 0)
    local image = LoadObject(self.TeleportNotCompletePath)
    if image then
      self.Img_Point:SetBrushFromTexture(image, true)
    end
    self.Parent:OnCommonTrack(self.Data.Id, false)
    self.Parent:UpdateSingleMapFogByTeleport(self.Data.Block, true, self.Data.Id)
    if not GWorld.GameInstance.ShowFogAnimId then
      GWorld.GameInstance.ShowFogAnimId = {}
    end
    table.insert(GWorld.GameInstance.ShowFogAnimId, self.Data.Id)
  elseif self.Data.TelepointId then
    local Avatar = GWorld:GetAvatar()
    if DataMgr.TeleportPoint[self.Data.TelepointId] and DataMgr.TeleportPoint[self.Data.TelepointId].StaticId == CreatorId and Avatar and ConditionUtils.CheckCondition(Avatar, self.Data.UnlockConditionId) then
      self:SetPointVisibility("Lock", true)
    end
  elseif self.Data.DoorTelepointId then
    local Avatar = GWorld:GetAvatar()
    if DataMgr.TeleportPoint[self.Data.DoorTelepointId] and DataMgr.TeleportPoint[self.Data.DoorTelepointId].StaticId == CreatorId then
      self:SetDoorVisibility("Lock", true)
    end
  end
end

function M:OnConditionComplete(ConditionId)
  if self.Data.UnlockConditionId == ConditionId then
    self:SetPointVisibility("Lock", true)
  end
end

function M:SetFloor(FloorType)
  if 0 == FloorType then
    self.Top:SetVisibility(ESlateVisibility.Collapsed)
    self.Bottom:SetVisibility(ESlateVisibility.Collapsed)
  elseif FloorType > 0 then
    self.Top:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Bottom:SetVisibility(ESlateVisibility.Collapsed)
  elseif FloorType < 0 then
    self.Top:SetVisibility(ESlateVisibility.Collapsed)
    self.Bottom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:InitAsMark(Parent, Data, ClickFunction, HoverFunction, UnoverFunction)
  self.Parent = Parent
  self.Data = Data
  if Data.ImagePath then
    local image = LoadObject(Data.ImagePath)
    if image then
      self.Img_Point:SetBrushFromTexture(image, true)
    end
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self.ClickFunction = ClickFunction
  self.HoverFunction = HoverFunction
  self.UnoverFunction = UnoverFunction
  if not self.Data.ImagePath then
    self.NewMarkTag = true
  end
end

function M:InitAsRegionPoint(Parent, Data, ClickFunction, HoverFunction, UnoverFunction)
  self.Parent = Parent
  self.Data = Data
  if Data.Icon then
    local image = LoadObject(Data.Icon)
    if image then
      self.Img_Point:SetBrushFromTexture(image, true)
    end
  end
  self.ClickFunction = ClickFunction
  self.HoverFunction = HoverFunction
  self.UnoverFunction = UnoverFunction
  EventManager:AddEvent(EventID.OnDeliveryMeshanismOpen, self, self.OnDeliveryMeshanismOpen)
  EventManager:AddEvent(EventID.ConditionComplete, self, self.OnConditionComplete)
end

function M:OnClicked()
  self:PlayAnimation(self.Click)
  AudioManager(self):PlayUISound(self, "event:/ui/common/map_click_level", "", nil)
  if self.ClickFunction and type(self.ClickFunction) == "function" then
    if self.Data and self.Data.Id then
      self.ClickFunction(self.Parent, self.Data.Id)
    elseif self.PointWidgetName then
      self.ClickFunction(self.Parent, self.FloorId, self)
    end
  end
  self.IsSelected = true
end

function M:OnHovered()
  if self.IsMobile then
    return
  end
  if not self.IsSelected then
    self:PlayAnimation(self.Hover)
  end
  if self.HoverFunction and type(self.HoverFunction) == "function" then
    if self.Data then
      self.HoverFunction(self.Parent, self.Data.Id)
    elseif self.PointWidgetName then
      self.HoverFunction(self.Parent, self.PointWidgetName)
    end
  end
end

function M:OnUnhovered()
  if self.IsMobile then
    return
  end
  if not self.IsSelected then
  end
  if self.UnoverFunction and type(self.UnoverFunction) == "function" then
    if self.Data then
      self.UnoverFunction(self.Parent, self.Data.Id)
    elseif self.PointWidgetName then
      self.UnoverFunction(self.Parent, self.PointWidgetName)
    end
  end
end

function M:InitDoor(Parent, Data, State, Scale)
  self.Parent = Parent
  self.Data = Data
  local ImagePath
  if 104010 == State or 104011 == State then
    ImagePath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_GP_Door.T_GP_Door"
    self.IsOpen = true
    self:SetVisibility(ESlateVisibility.Collapsed)
  elseif 104012 == State then
    ImagePath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_GP_LockedDoor.T_GP_LockedDoor"
    self.IsOpen = false
    self:SetVisibility(ESlateVisibility.HitTestInvisible)
  else
    ImagePath = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_GP_SealedDoor.T_GP_SealedDoor"
    self.IsOpen = false
    self:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
  local Image = LoadObject(ImagePath)
  self.Img_Point:SetBrushFromTexture(Image, true)
  if Scale then
    self.Img_Point:SetRenderScale(FVector2D(Scale, Scale))
  end
  EventManager:AddEvent(EventID.OnDeliveryMeshanismOpen, self, self.OnDeliveryMeshanismOpen)
end

function M:UpdateDoor(DoorType)
  local Path
  if 0 == DoorType then
    Path = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_GP_Door.T_GP_Door"
    self.IsOpen = true
    self:SetVisibility(ESlateVisibility.Collapsed)
  elseif 1 == DoorType then
    Path = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_GP_LockedDoor.T_GP_LockedDoor"
    self.IsOpen = false
    self:SetVisibility(ESlateVisibility.HitTestInvisible)
  else
    Path = "/Game/UI/Texture/Dynamic/Atlas/GuidePoint/T_GP_SealedDoor.T_GP_SealedDoor"
    self.IsOpen = false
    self:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
  local NewIcon = LoadObject(Path)
  self.Img_Point:SetBrushFromTexture(NewIcon, true)
end

function M:PlayLoopUISound()
  if not self.Parent.IsMiniMap then
    AudioManager(self):PlayUISound(self, "event:/ui/common/map_track_warning", "", {
      pan = self:GetCurrentSoundPosValue()
    })
  end
end

function M:GetCurrentSoundPosValue()
  local ScreenSize = UIManager(self):GetDesignedScreenSize(self)
  local _, ViewportPos = USlateBlueprintLibrary.AbsoluteToViewport(self, UUIFunctionLibrary.GetGeometryAbsolutePosition(self:GetCachedGeometry()))
  local Value = (ScreenSize.X - ViewportPos.X) / ScreenSize.X
  Value = (math.clamp(Value, 0, 1) - 0.5) * 2 * -1
  return Value
end

return M
