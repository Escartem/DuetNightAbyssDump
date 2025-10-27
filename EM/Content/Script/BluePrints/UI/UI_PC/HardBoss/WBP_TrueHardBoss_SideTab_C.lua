require("UnLua")
local WBP_TrueHardBoss_SideTab_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_TrueHardBoss_SideTab_C:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Entry = self
  local AllDifficultyInfo = DataMgr.HardBossDifficulty
  local DifficultyInfo = AllDifficultyInfo[self.Content.Id]
  local DifficultyLevel = DifficultyInfo.DifficultyLevel
  self.UnlockCondition = DifficultyInfo.UnlockCondition
  self.Text_TabLevelNormal:SetText(GText("BATTLE_UI_BLOOD_LV") .. DifficultyLevel)
  self.Text_TabLevelLock:SetText(GText("BATTLE_UI_BLOOD_LV") .. DifficultyLevel)
  self:BindEventOnClicked(self.Content.Parent, self.Content.Parent.RefreshListBossInfo, self.Content.Index)
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar:CheckHardBossCondition(self.Content.Id) then
    self.Content.IsLocked = false
    self.SwitcherIndex = 0
    if self.Content.Parent.Flag then
      self.Content.SelectedIndex[self.Content.Parent.HardBossId] = self.Content.Index
    end
  else
    self.Content.IsLocked = true
  end
  if self.Content.IsLocked then
    self.Switcher_Tab:SetActiveWidgetIndex(1)
  else
    self.Switcher_Tab:SetActiveWidgetIndex(0)
  end
  if self.Content.IsSelect then
    self:PlayAnimation(self.Click)
  else
    self:PlayAnimation(self.Normal)
  end
  if self.Content.Index == self.Content.NumberOfChoices then
    self.Image_TabLine:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Content.Parent:SelectFirstTime()
  end
end

function WBP_TrueHardBoss_SideTab_C:BindEventOnClicked(Obj, Func, ...)
  if not Obj or not Func then
    return
  end
  self.Obj = Obj
  self.Func = Func
  self.Params = {
    ...
  }
end

function WBP_TrueHardBoss_SideTab_C:OnCellClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  return self:OnCellClickedWithoutSound()
end

function WBP_TrueHardBoss_SideTab_C:OnCellClickedWithoutSound()
  if self.Content.IsSelect then
    return false
  end
  if self.Obj and self.Func then
    self.Func(self.Obj, table.unpack(self.Params))
  end
  self.Content.IsSelect = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  return true
end

function WBP_TrueHardBoss_SideTab_C:OnCellHovered()
  if self.Content.IsSelect then
    return
  end
  self:StopAnimation(self.Normal)
  self:PlayAnimation(self.Hover)
end

function WBP_TrueHardBoss_SideTab_C:OnCellUnhovered()
  if self.Content.IsSelect then
    return
  end
  self:StopAnimation(self.Hover)
  self:PlayAnimation(self.Normal)
end

function WBP_TrueHardBoss_SideTab_C:OnCellPressed()
  if self.Content.IsSelect then
    return
  end
  self:PlayAnimation(self.Press)
end

function WBP_TrueHardBoss_SideTab_C:OnCellReleased()
  if self.Content.IsSelect then
    return
  end
  self:StopAnimation(self.Press)
end

return WBP_TrueHardBoss_SideTab_C
