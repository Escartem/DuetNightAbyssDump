require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Button_Area.OnClicked:Clear()
  self.Button_Area.OnHovered:Add(self, self.OnBtnHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Button_Area.OnPressed:Add(self, self.OnBtnPressed)
  self.Button_Area.OnClicked:Add(self, self.OnClicked)
  self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Owner = Content.Owner
  self._OnAddedToFocusPath = Content.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Content.OnRemovedFromFocusPath
  self.Content.Entry = self
  self.IsPreviewMode = Content.IsPreviewMode
  self.ItemId = Content.AccessoryId
  self.TipType = Content.TipType
  self.IsDressed = Content.IsDressed
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
  self:SetIcon(Content.IconPath, Content.IsNoneIcon)
  self:SetIsDressed(self.IsDressed)
  self.IsCharacterTrialMode = Content.IsCharacterTrialMode
  self:InitButton()
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.Entry = nil
  end
end

function M:OnClicked()
  if self.Content and self.Content.OnClicked then
    if self.IsPreviewMode then
      local Content = {
        ItemType = self.TipType,
        ItemId = self.ItemId,
        bCustomStype = true
      }
      local AccessoryDefaultValue = DataMgr.GlobalConstant.EmptyCharAccessoryID.ConstantValue
      if self.Content.AccessoryId ~= AccessoryDefaultValue and -1 ~= self.Content.AccessoryId then
        self.ItemDetails_MenuAnchor.ParentWidget = self
        self.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, Content)
        self:SetSelect()
      end
    else
      self.Content.OnClicked(self.Content.Owner)
      self:SetSelect()
    end
    if self.IsCharacterTrialMode then
      self.Content.OnClicked(self.Content.Owner)
      self:SetSelect()
    end
  end
end

function M:SetReddot(IsNew)
  self:SetIsNew(IsNew)
end

function M:SetIsNew(IsNew)
  if IsNew then
    self.New:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetIcon(IconPath, IsNoneIcon)
  local IconDynaMaterial = self.Icon_Item:GetDynamicMaterial()
  if IconPath and IconDynaMaterial then
    local Icon = LoadObject(IconPath)
    IconDynaMaterial:SetTextureParameterValue("IconMap", Icon)
    if IsNoneIcon then
      IconDynaMaterial:SetVectorParameterValue("IconColor", self.UnequippedColor)
    else
      IconDynaMaterial:SetVectorParameterValue("IconColor", self.EquippedColor)
    end
  end
end

function M:SetIsDressed(IsDressed)
  local IconDynaMaterial = self.Icon_Item:GetDynamicMaterial()
  if IconDynaMaterial then
    local Value = IsDressed and 1 or 0
    IconDynaMaterial:SetScalarParameterValue("IsDressed", Value)
  end
end

function M:InitButton()
  if not self.IsPreviewMode or self.IsCharacterTrialMode then
    return
  end
  local AccessoryDefaultValue = DataMgr.GlobalConstant.EmptyCharAccessoryID.ConstantValue
  if self.Content.AccessoryId == nil or self.Content.AccessoryId == AccessoryDefaultValue or -1 == self.Content.AccessoryId then
    self.Button_Area:SetIsEnabled(false)
  else
    self.Button_Area:SetIsEnabled(true)
  end
end

function M:SetSelect()
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Click)
  self.Content.IsSelect = true
end

function M:SetUnSelect()
  if EMUIAnimationSubsystem:EMAnimationIsPlaying(self, self.Click) then
    EMUIAnimationSubsystem:EMStopAnimation(self, self.Click)
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
  self.Content.IsSelect = false
end

function M:OnBtnHovered()
  if self.Content.IsSelect then
    return
  end
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:SetSelect()
  else
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Hover)
  end
end

function M:OnBtnUnhovered()
  if self.Content.IsSelect then
    return
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.UnHover)
end

function M:OnBtnPressed()
  if self.Content.IsSelect then
    return
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Press)
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Owner, self.Content)
  end
end

function M:OnRemovedFromFocusPath()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Owner, self.Content)
  end
end

return M
