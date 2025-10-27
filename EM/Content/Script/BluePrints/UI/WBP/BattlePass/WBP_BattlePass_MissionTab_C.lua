require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.IsSelect = false
  self:PlayAnimation(self.Normal)
  self.Button_Area.OnClicked:Add(self, self.OnCellClicked)
  self.Button_Area.OnHovered:Add(self, self.OnCellHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnCellUnhovered)
  self.Button_Area.OnPressed:Add(self, self.OnCellPressed)
  self.Button_Area.OnReleased:Add(self, self.OnCellReleased)
end

function M:Init(Type, Root)
  self.Avatar = GWorld:GetAvatar()
  self.Type = Type
  self.Root = Root
  self:InitInfo()
  self:InitNavigation()
end

function M:InitInfo()
  if self.Type == "Daily" then
    self.Text_MissionTab:SetText(GText("UI_BattlePass_DailyQuest"))
  elseif self.Type == "Weekly" then
    self.Text_MissionTab:SetText(GText("UI_BattlePass_WeeklyQuest"))
  elseif self.Type == "Version" then
    self.Text_MissionTab:SetText(GText("UI_BattlePass_VersionQuest"))
  end
end

function M:InitNavigation()
  self:SetNavigationRuleCustom(EUINavigation.Up, {
    self.Root,
    self.Root.TryChangeSelectedTab
  })
  self:SetNavigationRuleCustom(EUINavigation.Down, {
    self.Root,
    self.Root.TryChangeSelectedTab
  })
  self:SetNavigationRuleCustom(EUINavigation.Right, {
    self.Root,
    self.Root.FocusToFirstMission
  })
end

function M:OpenMissionList(ForceRefresh)
  self.Root:OpenMissionList(self.Type, ForceRefresh)
end

function M:SetReddotVisibility(Visibility)
  self.Reddot:SetVisibility(Visibility)
end

function M:SetTimeText(TextDesc, TimeDict, TimeIconPath)
  self.Time_Left:SetTimeText(TextDesc, TimeDict, TimeIconPath)
end

function M:UnSelected()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self.IsSelect = false
end

function M:Selected()
  if self.IsSelect then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  self.IsSelect = true
end

function M:OnCellClicked(IsForce)
  AudioManager(self):PlayUISound(self, "event:/ui/common/battle_pass_btn_click_mid", nil, nil)
  if self.IsSelect then
    if IsForce then
      self.Root:OpenMissionList(self, IsForce)
    elseif UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      self.Root:FocusToFirstMission()
    end
  else
    self.Root:OpenMissionList(self, IsForce)
  end
end

function M:OnCellHovered()
  if self.IsSelect then
    return
  end
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.Hover)
  end
end

function M:OnCellUnhovered()
  if self.IsSelect then
    return
  end
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Hover)
    self:StopAnimation(self.Press)
    self:PlayAnimation(self.Normal)
  end
end

function M:OnCellPressed()
  if self.IsSelect then
    return
  end
  self:PlayAnimation(self.Press)
end

function M:OnCellReleased()
  if self.IsSelect then
    return
  end
  self:StopAnimation(self.Press)
  self:PlayAnimation(self.Normal)
end

return M
