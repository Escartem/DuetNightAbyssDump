require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Button_Area.OnClicked:Add(self, self.OnBtnClicked)
  self.Button_Area.OnHovered:Add(self, self.OnBtnHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Button_Area.OnPressed:Add(self, self.OnBtnPressed)
  self.Button_Area.OnReleased:Add(self, self.OnBtnReleased)
  self:FlushAnimations()
end

function M:OnBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/armory/click_skill_icon", nil, nil)
  if self.OnClickedFunc then
    self.OnClickedFunc(self.OnClickedObj, self.Content)
  end
end

function M:Init(Content)
  self.Content = Content
  Content.UI = self
  self.OnClickedObj = Content.OnClickedObj
  self.OnClickedFunc = Content.OnClickedFunc
  self.Button_Area:SetVisibility(UIConst.VisibilityOp.Visible)
  self:SetIcon(Content.IconPath)
  self:SetCanUpgrade(Content.bCanUpgrad)
  if Content.Level then
    self:SetLevel(Content.Level, Content.MaxLevel)
  else
    self.HB_Level:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:SetIsLocked(Content.IsLocked)
  if not Content.IsLocked then
    if Content.IsActivated then
      if not Content.Level then
        self:PlayAnimation(self.Level_Max)
      end
    else
      self:PlayAnimation(self.Level_Normal)
    end
  end
  self:SetIsSelected(Content.IsSelected)
end

function M:SetIsLocked(IsLocked)
  if IsLocked then
    self:PlayAnimation(self.Forbidden)
  else
    self:PlayAnimation(self.Unlock_In, 0, 1, 0, 100)
  end
end

function M:SetIcon(IconPath)
  local IconDynaMaterial = self.Icon_CharSkill:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("IconTex", LoadObject(IconPath))
  end
end

function M:SetLevel(Level, MaxLevel)
  self.Level = Level
  self.MaxLevel = MaxLevel
  self.HB_Level:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Num_Level:SetText(Level)
  if MaxLevel <= Level then
    self:PlayAnimation(self.Level_Max)
  else
    self:PlayAnimation(self.Level_Normal)
  end
end

function M:SetCanUpgrade(bCanUpgrad)
  if bCanUpgrad then
    self:PlayAnimation(self.Remind)
    self.LevelUp_Remind:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.LevelUp_Remind:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Unlock_In then
    self:SetIsSelected(self.IsSelected)
  elseif Animation == self.Normal then
    if self.IsSelected then
      self:PlayAnimation(self.Click)
    end
  elseif Animation == self.Click and not self.IsSelected then
    self:PlayAnimation(self.Normal)
  end
end

function M:UnLock()
  self:StopAnimation(self.Forbidden)
  self:PlayAnimation(self.Unlock_In)
end

function M:OnActice(NewLevel)
  self.NewLevel = NewLevel
  if self.NewLevel and self.MaxLevel and self.NewLevel >= self.MaxLevel then
    self:PlayAnimation(self.Max)
  else
    self:PlayAnimation(self.Actice)
  end
end

function M:ChangeAni()
  self.Num_Level:SetText(self.NewLevel)
end

function M:SetIsSelected(IsSelected)
  self.IsSelected = IsSelected
  if IsSelected then
    self.Button_Area:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Button_Area:SetVisibility(UIConst.VisibilityOp.Visible)
  end
  if self:IsAnimationPlaying(self.Unlock_In) then
    return
  end
  if IsSelected then
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.Click)
  else
    self:StopAnimation(self.Click)
    self:PlayAnimation(self.Normal)
  end
end

function M:OnBtnHovered()
  self:StopAnimation(self.UnHover)
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  self:StopAnimation(self.Hover)
  self:PlayAnimation(self.UnHover)
end

function M:OnBtnPressed()
  if self:IsAnimationPlaying(self.Unlock_In) then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Press)
end

function M:OnBtnReleased()
  if self:IsAnimationPlaying(self.Unlock_In) then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:BindEvents(Obj, Events)
  Events = Events or {}
  self._Obj = Obj
  self._OnAddedToFocusPath = Events.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Events.OnRemovedFromFocusPath
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self._Obj, self.Content)
  end
end

function M:OnRemovedFromFocusPath()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self._Obj, self.Content)
  end
end

return M
