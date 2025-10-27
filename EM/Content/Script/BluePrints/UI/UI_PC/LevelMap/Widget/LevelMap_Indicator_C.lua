require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Init(WildMap, IdicatorLimitSize, TrackTarget, IsGamer)
  self.IsPc = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile"
  self.BgHeight = WildMap.BgHeight
  self.TrackTarget = TrackTarget
  self:ForceLayoutPrepass()
  local size = self:GetDesiredSize()
  self.IndicatorHalfHeight = size.X / 2
  self.IdicatorLimitSize = IdicatorLimitSize - size / 2
  self.Btn_Click.OnClicked:Clear()
  self.Btn_Click.OnClicked:Add(self, function()
    WildMap.CurrentDragOffset = -TrackTarget.RenderTransform.Translation
    if WildMap:IsOverBorder() then
      WildMap:LimitDragOffset()
    end
    WildMap:SetSlideTarget(WildMap.CurrentDragOffset, 4, 0.5)
  end)
  self.Panel_Indicator:SetRenderOpacity(0)
  self.Panel_Indicator:SetVisibility(ESlateVisibility.Collapsed)
  self.Active = false
  local Avatar = GWorld:GetAvatar()
  self.IsInRegion = WildMap.IsInRegion and not DataMgr.SubRegion[Avatar.CurrentRegionId].NotShowInRegionMap
  self.IsGamer = IsGamer
  if self.IsInRegion or not IsGamer then
    self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    local angle = 0
    if IsGamer then
      angle = WildMap.Gamer:GetRenderTransformAngle()
    end
    self.Img_Role:SetRenderTransformAngle(angle)
  else
    self:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.Location = FVector2D()
end

function M:OnPointerMove(CurrentDragOffset, GamerLoc)
  if not self.IsInRegion and self.IsGamer then
    return
  end
  self.Location:Set(CurrentDragOffset.X, CurrentDragOffset.Y)
  FVector2D.Add(self.Location, GamerLoc)
  local BottomY = self.IdicatorLimitSize.Y
  if not self.IsPc then
    BottomY = self.IdicatorLimitSize.Y + self.BgHeight.Y
  end
  if self.Location.X > self.IdicatorLimitSize.X or self.Location.X < -self.IdicatorLimitSize.X or BottomY < self.Location.Y or self.Location.Y < -self.IdicatorLimitSize.Y then
    local k = self.Location.Y / self.Location.X
    local screenK = self.IdicatorLimitSize.Y / self.IdicatorLimitSize.X
    if k > screenK and self.Location.X > 0 or k < -screenK and self.Location.X < 0 then
      self.Location:Set(BottomY / k, BottomY)
    elseif k > screenK and self.Location.X < 0 or k < -screenK and self.Location.X > 0 then
      self.Location:Set(-self.IdicatorLimitSize.Y / k, -self.IdicatorLimitSize.Y)
    elseif k < screenK and self.Location.X > 0 or k > -screenK and self.Location.X > 0 then
      self.Location:Set(self.IdicatorLimitSize.X, self.IdicatorLimitSize.X * k)
    elseif k < screenK and self.Location.X < 0 or k > -screenK and self.Location.X < 0 then
      self.Location:Set(-self.IdicatorLimitSize.X, -self.IdicatorLimitSize.X * k)
    end
    local tan = math.deg(math.atan(self.Location.Y, self.Location.X))
    if not self.Active then
      self.Panel_Indicator:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self:StopAllAnimations()
      self:PlayAnimation(self.Auto_In)
      self.Active = true
      if self.TrackTarget.SetPointVisibility then
        self.TrackTarget:SetPointVisibility("Indicator", false, true)
      else
        self.TrackTarget:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
    self:SetRenderTranslation(self.Location)
    self.Arrow:SetRenderTransformAngle(tan - 225)
  elseif self.Active then
    self.Panel_Indicator:SetVisibility(ESlateVisibility.Collapsed)
    self:StopAllAnimations()
    self:PlayAnimation(self.Auto_Out)
    self.Active = false
    if self.TrackTarget.SetPointVisibility then
      self.TrackTarget:SetPointVisibility("Indicator", true)
    else
      self.TrackTarget:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    end
  end
end

function M:SetIcon(Icon)
  if not Icon then
    return
  end
  self.Img_Role:SetBrushFromTexture(Icon)
end

return M
