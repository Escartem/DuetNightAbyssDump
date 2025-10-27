require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Button_Area.OnHovered:Add(self, self.OnBtnHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Button_Area.OnPressed:Add(self, self.OnBtnPressed)
  self.Button_Area.OnReleased:Add(self, self.OnBtnReleased)
  self.Button_Area.OnClicked:Add(self, self.OnBtnClicked)
end

function M:Init(ClickEvent, CantClick, Type, NeedJudgeLockIcon, Index)
  if ClickEvent then
    self:BindEventOnClicked(ClickEvent.Obj, ClickEvent.Func, ClickEvent.Params)
  end
  if CantClick then
    self.Button_Area:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Button_Area:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  self.IsUnlock = true
  self.Type = Type
  self.Index = Index
  if NeedJudgeLockIcon then
    if "Weapon" == Type then
      self.IsUnlock = self:CheckWeaponBuffIsUnlock()
    elseif "Normal" == Type then
      self.IsUnlock = self:CheckNormalBuffIsUnlock()
    end
  end
  if self.IsUnlock then
    self.Icon_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Icon_Lock:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
end

function M:InitBuffInfo(BuffId)
  self.BuffId = BuffId
  if self.BuffId then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
    return
  end
  for _, Info in pairs(DataMgr.PaotaiGameProp) do
    if Info.BuffId == self.BuffId then
      local IconPath = Info.PropIcon or Info.WeaponIcon
      local Icon = LoadObject(IconPath)
      self.Img_Buff:SetBrushFromTexture(Icon)
      return
    end
  end
end

function M:BindEventOnClicked(Obj, Func, Params)
  if not Obj or not Func then
    return
  end
  self.Obj = Obj
  self.Func = Func
  self.Params = Params
end

function M:OnBtnHovered()
  self.IsHovering = true
  if self.IsSelect then
    return
  end
  if self.IsPressing then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  self.IsHovering = false
  if self.IsSelect then
    return
  end
  if not self.IsPressing then
    self:StopAllAnimations()
    self:PlayAnimation(self.Unhover)
  end
end

function M:OnBtnPressed()
  self.IsPressing = true
  if self.IsSelect then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnReleased()
  self.IsPressing = false
  if self.IsSelect then
    return
  end
  if not self.IsHovering then
    self:StopAllAnimations()
    self:PlayAnimationReverse(self.Normal)
  else
    self:StopAllAnimations()
    self:PlayAnimationReverse(self.Hover)
  end
end

function M:OnBtnClicked()
  if self.IsSelect then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  if self.Obj and self.Func then
    self.Func(self.Obj, table.unpack(self.Params))
  end
end

function M:SetSelected(IsSelect)
  self.IsSelect = IsSelect
  self:StopAllAnimations()
  if self.IsSelect then
    self:PlayAnimation(self.Selected)
  else
    self:PlayAnimation(self.Normal)
  end
end

function M:CheckNormalBuffIsUnlock()
  local NormalBuffInfo = DataMgr.PaotaiGameProp
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for Id, Info in pairs(NormalBuffInfo) do
      if not Info.DungeonId then
        return true
      end
      local DungeonsInfo = Avatar.Dungeons[Info.DungeonId]
      if DungeonsInfo and DungeonsInfo.IsPass then
        return true
      end
    end
  end
  return false
end

function M:CheckWeaponBuffIsUnlock()
  local WeaponBuffInfo = DataMgr.PaotaiGameWeapon
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    for Id, Info in pairs(WeaponBuffInfo) do
      if not Info.DungeonId then
        return true
      end
      local DungeonsInfo = Avatar.Dungeons[Info.DungeonId]
      if DungeonsInfo and DungeonsInfo.IsPass then
        return true
      end
    end
  end
  return false
end

return M
