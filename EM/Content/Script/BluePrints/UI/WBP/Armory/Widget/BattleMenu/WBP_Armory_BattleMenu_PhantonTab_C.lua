require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Owner = Content.Owner
  self._OnAddedToFocusPath = Content.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Content.OnRemovedFromFocusPath
  Content.Widget = self
  self:SetIcon(Content.Icon)
  self:SetWeaponIcon(Content.UnitId)
  self:SetLevel(Content.Level)
  self:SetRarity(Content.Rarity)
  self:SetSelected(Content.IsSelect)
  self.OwningList = UE4.UUserListEntryLibrary.GetOwningListView(self)
  if self.OwningList then
    self.OwningList.BP_OnItemClicked:Remove(self, self.OnOwningListItemClicked)
    self.OwningList.BP_OnItemClicked:Add(self, self.OnOwningListItemClicked)
  end
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.UI = nil
  end
end

function M:SetRarity(Rarity)
  local RariryName = UIConst.RarityColorName[Rarity]
  local Path = "/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Corner_" .. RariryName .. ".T_Armory_Corner_" .. RariryName
  self.Quality_Bar:SetBrushResourceObject(LoadObject(Path))
end

function M:SetLevel(Level)
  self.Text_Level:SetText(Level)
end

function M:SetIcon(Icon)
  self.Img_Phantom:SetBrushResourceObject(LoadObject(Icon))
end

function M:SetWeaponIcon(ResourceId)
  local Avatar = GWorld:GetAvatar()
  local resource = Avatar.Resources[ResourceId]
  local WeaponUuid = resource and resource.WeaponUuid
  local Icon
  if WeaponUuid then
    local Weapon = Avatar.Weapons[WeaponUuid]
    if Weapon then
      Icon = LoadObject(DataMgr.Weapon[Weapon.WeaponId].Icon)
    end
  end
  self.Tag_Weapon:SetWeaponIcon(Icon)
  self.Tag_Weapon.Switch_Type:SetActiveWidgetIndex(0)
end

function M:SetSelected(IsSelect)
  self.IsSelect = IsSelect
  if IsSelect then
    self:StopAllAnimations()
    self:PlayAnimation(self.Click)
  else
    self:StopAnimation(self.Click)
    self:PlayAnimation(self.Normal)
  end
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  if self.IsSelect then
    return
  end
  self:PlayAnimationForward(self.Hover)
end

function M:OnMouseLeave(MouseEvent)
  if self.IsSelect then
    return
  end
  self:StopAnimation(self.Press)
  self:PlayAnimationReverse(self.Hover)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if self.IsSelect then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  self:PlayAnimation(self.Press)
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  if self.IsSelect then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  if self:IsHovered() then
    self:OnMouseEnter()
  else
    self:PlayAnimation(self.Normal)
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnOwningListItemClicked(Content)
  if not self.Content or Content ~= self.Content then
    return
  end
  AudioManager(self):PlayItemSound(self, self.Content.UnitId, "Click", self.Content.Type)
end

function M:OnTouchStarted(MyGeometry, InTouchEvent)
  return UIUtils.UnHandled
end

function M:OnTouchEnded(MyGeometry, InTouchEvent)
  return UIUtils.UnHandled
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
