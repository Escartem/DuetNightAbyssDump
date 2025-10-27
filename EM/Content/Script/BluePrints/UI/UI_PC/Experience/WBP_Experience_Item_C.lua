local WBP_Experience_Item_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Experience_Item_C:Construct()
  self.EMCustomCheckBox.OnClicked:Add(self, self.OnCellClicked)
  self.EMCustomCheckBox.OnHovered:Add(self, self.OnCellHovered)
  self.EMCustomCheckBox.OnUnhovered:Add(self, self.OnCellUnhovered)
  self.EMCustomCheckBox.OnPressed:Add(self, self.OnCellPressed)
  self.EMCustomCheckBox.OnReleased:Add(self, self.OnCellReleased)
  self.Text_World:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if not ReddotManager.GetTreeNode("ExperienceItem") then
    ReddotManager.AddNode("ExperienceItem")
  end
  ReddotManager.AddListener("ExperienceItem", self, self.RefreshReddot)
end

function WBP_Experience_Item_C:Destruct()
  ReddotManager.RemoveListener("ExperienceItem", self)
end

function WBP_Experience_Item_C:BindEventOnClicked(Obj, Func, ...)
  if not Obj or not Func then
    return
  end
  self.Obj = Obj
  self.Func = Func
  self.Params = {
    ...
  }
end

function WBP_Experience_Item_C:InitSpace(ScrollBoxSizeX, Root)
  self.Root = Root
  self.IsSpace = true
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Panel)
  local ItemSize = CanvasSlot:GetSize()
  CanvasSlot:SetSize(FVector2D(ScrollBoxSizeX / 2 - ItemSize.X / 2, ItemSize.Y))
  local AllChildren = self.Panel:GetAllChildren()
  for i = 1, AllChildren:Length() do
    local ChildItem = AllChildren:GetRef(i)
    ChildItem:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Experience_Item_C:Init(Index, PlayerLevel, Root)
  self.Root = Root
  self.IsSpace = false
  self.Index = Index
  self.Level = PlayerLevel
  self.IsSelect = false
  self.IsGot = false
  self.CanGet = false
  self:RefreshInfo()
  self.Text_Lv:SetText(string.format("%02d", self.Level))
  self:SetRenderTransformPivot(FVector2D(0.5, 1))
  self.Panel:SetRenderTransformPivot(FVector2D(0.5, 1))
end

function WBP_Experience_Item_C:Normalize(value, fromMin, fromMax, toMin, toMax)
  local clampedValue = math.max(fromMin, math.min(fromMax, value))
  local factor = (clampedValue - fromMin) / (fromMax - fromMin)
  local result = toMin + factor * (toMax - toMin)
  return math.max(toMin, math.min(toMax, result))
end

function WBP_Experience_Item_C:SetMagnification(Magnification)
  local normalizedScale = self:Normalize(Magnification, 0.64, 1.0, self.MinScale or 0.64, 1.0)
  self.Lv_Num:SetRenderScale(FVector2D(normalizedScale, normalizedScale))
  local normalizedOpacity = self:Normalize(Magnification, 0.64, 1.0, self.MinOpacity or 0.4, 1.0)
  self.Text_Lv:SetRenderOpacity(normalizedOpacity)
end

function WBP_Experience_Item_C:UnSelected()
  self:StopAnimations()
  self.Text_World:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.IsSelect = false
  self:PlayUnselectAnimation()
end

function WBP_Experience_Item_C:Selected()
  self:StopAnimations()
  self:PlayAnimation(self.Click)
  self.Text_World:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.IsSelect = true
end

function WBP_Experience_Item_C:OnCellClicked(Speed, isDragSelect, IsFirstTime)
  if self.IsSpace then
    return
  end
  self.Root.DragScrollBox = false
  if isDragSelect then
    self.Root.DragScrollBox = true
  end
  if self.IsSelect then
    return
  end
  if self.Obj and self.Func then
    self.Func(self.Obj, table.unpack(self.Params), Speed, isDragSelect, IsFirstTime)
  end
  if self.Root.CanPlayNumChangeSound then
    AudioManager(self):PlayUISound(self, "event:/ui/common/trail_rank_award_num_change", nil, nil)
  end
end

function WBP_Experience_Item_C:OnCellHovered()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    return
  end
  self.IsHovering = true
  if self.IsSelect then
    return
  end
  self:StopAnimations()
  self:PlayUnselectAnimation()
  self:PlayAnimation(self.Hover)
end

function WBP_Experience_Item_C:OnCellUnhovered()
  self.IsHovering = false
  if self.IsSelect then
    return
  end
  self:StopAnimations()
  self:PlayAnimation(self.Unhover)
end

function WBP_Experience_Item_C:OnCellPressed()
  self.Root.DragScrollBox = true
  self.IsPressing = true
  if self.IsLocked or self.IsSelect then
    return
  end
  self:StopAnimations()
  self:PlayAnimation(self.Press)
end

function WBP_Experience_Item_C:OnCellReleased()
  self.IsPressing = false
  if self.IsLocked or self.IsSelect then
    return
  end
  if not self.IsHovering then
    self:StopAnimations()
    self:PlayAnimationReverse(self.Press)
  else
    self:StopAnimations()
    self:PlayUnselectAnimation()
  end
end

function WBP_Experience_Item_C:StopAnimations()
  self:StopAnimation(self.Normal)
  self:StopAnimation(self.Click)
  self:StopAnimation(self.Press)
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Unhover)
end

function WBP_Experience_Item_C:RefreshInfo()
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.IsGot = Avatar.LevelRewardsGot[self.Level]
    if Avatar.Level >= self.Level then
      self.CanGet = true
    else
      self.CanGet = false
    end
  end
  self:PlayUnselectAnimation()
end

function WBP_Experience_Item_C:PlayUnselectAnimation()
  if self.CanGet then
    if self.IsGot then
      self:PlayAnimation(self.Received)
    else
      self:PlayAnimation(self.Complete)
    end
  else
    self:PlayAnimation(self.Normal)
  end
  if self.IsSelect then
    self:PlayAnimation(self.Click)
  end
end

function WBP_Experience_Item_C:RefreshReddot()
  if self.IsSpace then
    return
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("ExperienceItem")
  if not CacheDetail[self.Level] then
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

return WBP_Experience_Item_C
