require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.ReddotName = "DetectiveAnswer"
  self:BindEvents()
  self.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:BindEvents()
  self.Btn_Click.OnClicked:Add(self, self.OnClickButton)
  self.Btn_Click.OnPressed:Add(self, self.OnPressButton)
  self.Btn_Click.OnReleased:Add(self, self.OnReleaseButton)
  self.Btn_Click.OnHovered:Add(self, self.OnHoverButton)
  self.Btn_Click.OnUnhovered:Add(self, self.OnUnhoverButton)
end

function M:Destruct()
  self:UnbindEvents()
end

function M:UnbindEvents()
  self.Btn_Click.OnClicked:Remove(self, self.OnClickButton)
  self.Btn_Click.OnPressed:Remove(self, self.OnPressButton)
  self.Btn_Click.OnReleased:Remove(self, self.OnReleaseButton)
  self.Btn_Click.OnHovered:Remove(self, self.OnHoverButton)
  self.Btn_Click.OnUnhovered:Remove(self, self.OnUnhoverButton)
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.UI = self
  if Content.IsEmpty then
    self:InitEmptyObject(Content)
    return
  end
  self.Text_ItemName:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Image_ItemIcon:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Text_ItemName:SetText(Content.Name)
  self.Image_ItemIcon:SetBrushResourceObject(Content.Icon)
  self:UpdateReddotDetail(Content.AnswerId)
  self:SetIsSingleSelected(Content.IsSingleSelected)
  self:SetIsMultiSelected(Content.IsMultiSelected)
  self:SetCanMultiSelected(Content.CanMultiSelected)
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.UI = nil
  end
end

function M:InitEmptyObject()
  self.Text_ItemName:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Image_ItemIcon:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:PlayAnimation(self.Normal)
  self.Group_Select:SetRenderOpacity(0)
  self.VX_WarningGlow:SetRenderOpacity(0)
end

function M:StopReasonItemAllAnimations()
  self:StopAnimation(self.Normal)
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.UnHover)
  self:StopAnimation(self.Press)
  self:StopAnimation(self.Click)
end

function M:OnClickButton()
  if self.Content.IsEmpty then
    return
  end
  if not self.ForbidDecrease then
    self:DecreaseReddotDetail()
  end
  self.ForbidDecrease = false
  if self.Content.CanMultiSelected then
    self:SetIsMultiSelected(not self.Content.IsMultiSelected)
  end
  if self.Content.IsSingleSelected then
    return
  end
  self:SetIsSingleSelected(true)
  self.Content.Parent:OnListItemClicked(self.Content)
end

function M:OnPressButton()
  if self.Content.IsEmpty then
    return
  end
  if self.Content.IsSingleSelected then
    return
  end
  self:StopReasonItemAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnReleaseButton()
  if self.Content.IsEmpty then
    return
  end
  if self.Content.IsSingleSelected then
    return
  end
  self:StopReasonItemAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnHoverButton()
  if self.Content.IsEmpty then
    return
  end
  if self.Content.Parent.CurInputDevice == ECommonInputType.Gamepad then
    if self.Content.CanMultiSelected then
      self.Content.Parent:UpdateItemInfo(self.Content)
      self.Content.Parent:OnListItemHovered(self.Content)
      if self.Content.IsSingleSelected then
        return
      end
      self:StopReasonItemAllAnimations()
      self:PlayAnimation(self.Hover)
    else
      self:OnClickButton()
    end
  else
    self.Content.Parent:OnListItemHovered(self.Content)
    if self.Content.IsSingleSelected then
      return
    end
    self:StopReasonItemAllAnimations()
    self:PlayAnimation(self.Hover)
  end
end

function M:OnUnhoverButton()
  if self.Content.IsEmpty then
    return
  end
  if self.Content.IsSingleSelected then
    return
  end
  self:StopReasonItemAllAnimations()
  self:PlayAnimation(self.UnHover)
end

function M:SetIsSingleSelected(bIsSingleSelected)
  DebugPrint("Reasoning SetIsSingleSelected: ", self.Content.AnswerId, bIsSingleSelected)
  self.Content.IsSingleSelected = bIsSingleSelected
  self:StopReasonItemAllAnimations()
  if bIsSingleSelected then
    self:PlayAnimation(self.Click)
  else
    self:PlayAnimation(self.Normal)
  end
end

function M:SetIsMultiSelected(bIsMultiSelected)
  DebugPrint("Reasoning SetIsMultiSelected: ", self.Content.AnswerId, bIsMultiSelected)
  self.Content.IsMultiSelected = bIsMultiSelected
  if bIsMultiSelected then
    self:PlayAnimationForward(self.Select)
  else
    self:PlayAnimationReverse(self.Select)
  end
end

function M:SetCanMultiSelected(bCanMultiSelected)
  self.Content.CanMultiSelected = bCanMultiSelected
  if bCanMultiSelected then
    self:PlayAnimationForward(self.Remind)
  else
    self:PlayAnimationReverse(self.Remind)
  end
end

function M:UpdateReddotDetail(AnswerId)
  local CacheKey = AnswerId
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.ReddotName)
  if CacheDetail then
    if nil == CacheDetail[CacheKey] then
      CacheDetail[CacheKey] = true
      ReddotManager.IncreaseLeafNodeCount(self.ReddotName)
      self.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    elseif CacheDetail[CacheKey] then
      self.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function M:DecreaseReddotDetail()
  local AnswerId = self.Content.AnswerId
  local CacheKey = AnswerId
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.ReddotName)
  if CacheDetail and CacheDetail[CacheKey] then
    CacheDetail[CacheKey] = false
    ReddotManager.DecreaseLeafNodeCount(self.ReddotName)
    self.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:PlayerWarningAnimation()
  self:PlayAnimation(self.Warning)
end

return M
