require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  local RougeLikeManager = GWorld.RougeLikeManager
  assert(RougeLikeManager, "@zyh RougeLikeManager is nil!")
  self.SuitId = Content.SuitId
  self.Parent = Content.Parent
  self.Index = Content.Index
  self.Count = Content.Count
  Content.UI = self
  if Content.IsSelected then
    self.IsSelected = true
  else
    self:PlayAnimation(self.Normal)
  end
  if Content.UseBigFont then
    self.Text_IconNum:SetTextStyleSet(self.RichText_26)
  else
    self.Text_IconNum:SetTextStyleSet(self.RichText_18)
  end
  if Content.IsPreAdd then
    self.Text_IconNum:SetText("<G>" .. Content.Count .. "</>")
  else
    self.Text_IconNum:SetText(Content.Count)
  end
  self.ActivateNeedMap = Content.ActivateNeedMap
  self:SetSuitImage(self.SuitId, Content.Count)
  self.Btn_Click.OnClicked:Add(self, self.OpenDetail)
  self.Btn_Click.OnHovered:Add(self, self.OnHover)
end

function M:SetSuitImage(SuitId, CurrentCount)
  local Icon = LoadObject(DataMgr.BlessingGroup[SuitId].Icon)
  self.Image_SuitIcon.Image_SuitIcon:SetBrushFromTexture(Icon)
  local IconDynaMaterial = self.Image_SuitIcon.Image_SuitIcon_Color:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("Mask", Icon)
  end
  for i = 1, 4 do
    if CurrentCount < self.ActivateNeedMap[SuitId][i] then
      self.Image_SuitIcon:PlayAnimation(self.Image_SuitIcon[i - 1])
      self.CurrentLevel = i - 1
      break
    end
    if 4 == i then
      self.CurrentLevel = i
      self.Image_SuitIcon:PlayAnimation(self.Image_SuitIcon[i])
    end
  end
end

function M:OpenDetail()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/choose_point_btn_affix_click", nil, nil)
  self.IsSelected = true
  self.Parent:UpdateSuitInfo(self.SuitId, self.Index)
end

function M:OnHover()
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/choose_point_btn_affix_hover", nil, nil)
end

function M:BP_OnItemSelectionChanged(IsSelected)
  if IsSelected then
    self.IsSelected = true
    self:PlayAnimation(self.Click)
    if self.IsPreAdd then
      self.Text_IconNum:SetText("<G>" .. self.Count + 1 .. "</>")
      self:ChooseLevelAnimation(self.Count + 1)
    else
      self.Text_IconNum:SetText(self.Count)
      self:ChooseLevelAnimation(self.Count)
    end
  else
    if self:IsAnimationPlaying(self.Click) then
      self:StopAnimation(self.Click)
    end
    self.IsSelected = false
    self:PlayAnimation(self.Normal)
    if self.IsPreAdd then
      self.Text_IconNum:SetText("<G>" .. self.Count + 1 .. "</>")
      self:ChooseLevelAnimation(self.Count + 1)
    else
      self.Text_IconNum:SetText(self.Count)
      self:ChooseLevelAnimation(self.Count)
    end
  end
end

function M:ChooseLevelAnimation(CurCount)
  local NextLevelCount = self.ActivateNeedMap[self.SuitId][self.CurrentLevel + 1]
  if NextLevelCount and CurCount >= NextLevelCount then
    if CurCount == NextLevelCount then
      self:PlayAnimation(self.Upgrade)
    end
    self.Image_SuitIcon:PlayAnimation(self.Image_SuitIcon[self.CurrentLevel + 1])
  else
    self.Image_SuitIcon:PlayAnimation(self.Image_SuitIcon[self.CurrentLevel])
  end
end

return M
