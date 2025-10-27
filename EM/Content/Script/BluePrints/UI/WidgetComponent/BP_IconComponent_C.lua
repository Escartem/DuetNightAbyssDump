local EMCache = require("EMCache.EMCache")
local M = Class({
  "BluePrints.Common.TimerMgr"
})

function M:ReceiveBeginPlay()
  self.Owner = nil
  self.TypeStr = nil
  self.ActivePlayer = nil
  self.bHiddenTagList = TArray("")
  self.bHasShow = false
  self.OwnerType = nil
  UIManager(self):AddWidgetComponentToList(self:GetOwner(), "Guide", self)
end

function M:ReceiveEndPlay()
  UIManager(self):RemoveWidgetComponentToList(self:GetOwner(), "Guide")
end

function M:InitGuide(Owner, TypeStr, ActivePlayer, ImgPath, RenderSize, IconOffsetZ, OwnerType, IconStyle, IconColor, TalkTriggerId)
  self.Owner = Owner
  self.TypeStr = TypeStr
  self.OwnerType = OwnerType
  self.ActivePlayer = ActivePlayer
  self.IconStyle = IconStyle or "Guide"
  self.DistanceUnit = GText("UI_SCALE_METER")
  self.TalkTriggerId = TalkTriggerId
  self.bAccessed = true
  if self.Owner == nil then
    return
  end
  local Height = 0
  if nil ~= self.Owner.CapsuleComponent then
    Height = self.Owner.CapsuleComponent:GetUnscaledCapsuleHalfHeight()
  elseif nil ~= IconOffsetZ then
    Height = IconOffsetZ
  end
  self:SetComponentHeight(Height)
  local CurrentWidget = self:GetUserWidgetObject()
  if IsValid(CurrentWidget) then
    CurrentWidget:InitConfig(TypeStr, ImgPath, RenderSize)
    if "TalkMechanism" == OwnerType then
      CurrentWidget.TextBlock_Distance:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function M:SetWidgetHiddenByTag(bHidden, Tag)
  local Widget = self:GetUserWidgetObject()
  if not IsValid(Widget) then
    return
  end
  if bHidden then
    Widget:Hide(Tag)
  else
    Widget:Show(Tag)
  end
end

function M:InitAccessibility()
  local bAccessed = false
  local EMCacheKey = self:GetEMCacheKey()
  if EMCacheKey then
    local Cache = EMCache:Get(EMCacheKey, true)
    if nil == Cache then
      Cache = false
    end
    bAccessed = Cache
  end
  self:SetAccessibility(bAccessed)
end

function M:SetAccessibility(bNewAccessed)
  if bNewAccessed == self.bAccessed then
    return
  end
  self.bAccessed = bNewAccessed
  local EMCacheKey = self:GetEMCacheKey()
  if EMCacheKey then
    EMCache:Set(EMCacheKey, self.bAccessed, true)
  end
  local TargetWidget = self:GetUserWidgetObject()
  if IsValid(TargetWidget) and TargetWidget.SetAccessibility then
    TargetWidget:SetAccessibility(self.bAccessed)
  end
end

function M:IsAccessed()
  return self.bAccessed
end

function M:GetEMCacheKey()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  if self.TalkTriggerId then
    return "IconGuide" .. self.TalkTriggerId
  elseif IsValid(self.Owner) and self.Owner.UnitId then
    return "IconGuide" .. self.Owner.UnitId
  end
end

return M
