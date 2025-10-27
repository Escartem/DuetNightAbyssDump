require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.ClickSuit)
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
end

function M:OnListItemObjectSet(Content)
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self.Image_SuitIcon:StopAllAnimations()
  self.Content = Content
  self.Parent = self.Content.Parent
  self.Content.SelfWidget = self
  self.SuitFocusChanged = Content.SuitFocusChanged
  self.GroupId = Content.GroupId
  self:UpdateSuitInfo()
  local GroupData = DataMgr.BlessingGroup[self.GroupId]
  assert(GroupData, "\230\156\170\230\137\190\229\136\176\229\165\151\232\163\133\228\191\161\230\129\175: " .. self.GroupId)
  self:SetIcon(GroupData.Icon)
end

function M:UpdateSuitInfo()
  local RougeLikeManager = GWorld.RougeLikeManager
  assert(RougeLikeManager, "ZDX RougeLikeManager is nil!")
  local BlessingGroup = RougeLikeManager.BlessingGroup
  assert(BlessingGroup, "\230\156\170\230\137\190\229\136\176BlessingGroup")
  local Count = BlessingGroup:FindRef(self.Content.GroupId) or 0
  self.Count = Count
  self.Level = RougeUtils:GetGroupLevel(self.Content.GroupId, Count)
  self.Text_IconNum:SetText(self.Count)
  local Level = self.Level
  self.IsActive = RougeUtils:GetGroupIsActive(self.GroupId, Count)
  if self.Parent and self.GroupId == self.Parent.SelectGroupId then
    self.IsSelected = true
    self:PlayAnimation(self.Click)
    if self.Parent.IsNeedAddCount then
      local Count = self.Count + 1
      self.Text_IconNum:SetText(GText("<G>" .. Count .. "</>"))
      Level = RougeUtils:GetGroupLevel(self.GroupId, Count)
      self.IsActive = RougeUtils:GetGroupIsActive(self.GroupId, Count)
    end
  end
  self:SetRarity(Level)
end

function M:SetIcon(Icon)
  assert(Icon, "\230\156\170\230\137\190\229\136\176\229\165\151\232\163\133\228\191\161\230\129\175: " .. self.GroupId)
  local Icon = LoadObject(Icon)
  self.Image_SuitIcon.Image_SuitIcon:SetBrushFromTexture(Icon)
  local IconDynaMaterial = self.Image_SuitIcon.Image_SuitIcon_Color:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("Mask", Icon)
  end
end

function M:SetRarity(Level)
  if self.IsActive and self.IsNeedAddCount then
    self:PlayAnimation(self.Upgrade)
  end
  self.Image_SuitIcon:PlayAnimation(self.Image_SuitIcon[Level - 1])
end

function M:SetSuitSelect(bSelect)
  self:StopAllAnimations()
  self.IsSelected = bSelect
  if bSelect then
    self:PlayAnimation(self.Click)
  else
    self:PlayAnimation(self.Normal)
  end
  self:UpdateSuitInfo()
end

function M:ClickSuit()
  local SelectGroupId
  if self.Parent and self.Parent.IsNeedAddCount then
    SelectGroupId = self.Parent.SelectGroupId
  end
  UIManager(self):LoadUINew("Rouge_SuitDetail", {
    self.GroupId,
    SelectGroupId
  })
  local EventSoundPath = "event:/ui/roguelike/choose_point_btn_affix_click"
  AudioManager(self):PlayUISound(self, EventSoundPath, nil, nil)
end

function M:OnBtnHovered()
  if self.IsSelected then
    return
  end
  self.bHover = true
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Hover)
  local EventSoundPath = "event:/ui/roguelike/choose_point_btn_affix_hover"
  AudioManager(self):PlayUISound(self, EventSoundPath, nil, nil)
end

function M:OnBtnUnhovered()
  if self.IsSelected then
    return
  end
  self.bHover = false
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.UnHover)
end

function M:OnBtnPressed()
  if self.IsSelected then
    return
  end
  EMUIAnimationSubsystem:EMPlayAnimation(self, self.Press)
end

function M:OnBtnReleased()
  if self.IsSelected then
    return
  end
  if self.bHover then
    EMUIAnimationSubsystem:EMPlayAnimation(self, self.Normal)
  end
end

function M:OnAddedToFocusPath(InFocusEvent)
  if self.SuitFocusChanged then
    self.SuitFocusChanged(self.Parent, true)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  if self.SuitFocusChanged then
    self.SuitFocusChanged(self.Parent, false)
  end
end

return M
