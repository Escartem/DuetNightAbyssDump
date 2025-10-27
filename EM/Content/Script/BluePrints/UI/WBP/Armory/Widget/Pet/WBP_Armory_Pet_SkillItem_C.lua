require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.MenuAnchor.OnMenuOpenChanged:Clear()
  self.MenuAnchor.OnMenuOpenChanged:Add(self, self.OnMenuRealOpenChanged)
  self.Btn.OnClicked:Clear()
  self.Btn.OnPressed:Clear()
  self.Btn.OnReleased:Clear()
  self.Btn.OnHovered:Clear()
  self.Btn.OnUnhovered:Clear()
  self.Btn.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn.OnReleased:Add(self, self.OnBtnReleased)
  self.Btn.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn.OnUnhovered:Add(self, self.OnBtnUnhovered)
end

function M:OnListItemObjectSet(Content)
  if not Content then
    return
  end
  self:RealCloseMenu()
  self.Content = Content
  Content.UI = self
  self.Owner = Content.Owner
  self._OnAddedToFocusPath = Content.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Content.OnRemovedFromFocusPath
  self._OnMenuOpenChanged = Content.OnMenuOpenChanged
  local SkillId = Content.SkillId
  self.SkillData = nil
  local Icon
  local SkillData = SkillId and DataMgr.Skill[SkillId]
  if SkillData and SkillData[1] and SkillData[1][0] then
    self.SkillData = SkillData[1][0]
    local IconName = self.SkillData.SkillBtnIcon
    Icon = IconName and LoadObject("/Game/UI/Texture/Dynamic/Atlas/Skill/T_" .. IconName .. ".T_" .. IconName)
  else
    Icon = LoadObject("/Game/UI/Texture/Dynamic/Atlas/Armory/T_Armory_Pet_PassiveSkill01.T_Armory_Pet_PassiveSkill01")
  end
  self.MenuInitParams = {
    Pet = Content.Pet,
    SkillId = SkillId,
    SkillData = self.SkillData,
    SkillName = Content.SkillName,
    SkillDesc = Content.SkillDesc,
    SkillBtnDesc = Content.SkillBtnDesc,
    OnMenuClosed = self.OnMenuClosed,
    OnMenuRealClosed = self.OnMenuRealClosed
  }
  local IconDynaMaterial = self.Icon_Skill:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("IconTex", Icon)
  end
  self.Text_Skill_Name:SetText(Content.SkillName)
end

function M:OnBtnPressed()
  if self.IsMenuOpened then
    self.bNotOpenMenu = true
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnClicked()
  self:OpenMenu()
end

function M:OnBtnReleased()
  if self.IsMenuOpened then
    return
  end
  if not self.Btn:IsHovered() then
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
  end
end

function M:OnBtnHovered()
  if self.IsMenuOpened or CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  if self.IsMenuOpened or CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.UnHover)
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Owner, self)
  end
end

function M:OnRemovedFromFocusPath()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Owner, self)
  end
end

function M:OnMenuRealOpenChanged(IsOpen)
  self.IsMenuRealOpened = IsOpen
  if IsOpen then
    self:StopAllAnimations()
    self:PlayAnimation(self.Click)
    self.MenuWidget:SetFocus()
  else
    self:OnBtnReleased()
  end
end

function M:OnMenuRealClosed()
  self:RealCloseMenu()
end

function M:RealCloseMenu()
  self.IsMenuRealOpened = false
  self.IsMenuOpened = false
  if self.MenuAnchor:IsOpen() then
    self.MenuAnchor:Close()
  end
end

function M:OnMenuClosed()
  if self.Btn:IsHovered() and CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    self:OnBtnHovered()
  else
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
  end
  if self._OnMenuOpenChanged then
    self._OnMenuOpenChanged(self.Owner, false, self)
  end
end

function M:OpenMenu()
  if self.bNotOpenMenu then
    self.bNotOpenMenu = false
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
  if self.IsMenuRealOpened then
    self.IsMenuOpened = true
    if self.MenuWidget then
      self.MenuWidget:Init(self, self.MenuInitParams)
    end
  else
    self.IsMenuOpened = true
    self.MenuAnchor:Open(true)
    if self.MenuWidget then
      self.MenuWidget:Init(self, self.MenuInitParams)
    end
  end
  if self._OnMenuOpenChanged then
    self._OnMenuOpenChanged(self.Owner, true, self)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Btn)
end

return M
