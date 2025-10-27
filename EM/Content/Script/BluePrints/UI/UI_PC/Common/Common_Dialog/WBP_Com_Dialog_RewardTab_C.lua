require("UnLua")
local WBP_Com_Dialog_RewardTab_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Com_Dialog_RewardTab_C:Construct()
  self.IsSelect = false
  self.AddListenerFinish = false
  self.Btn_Click.OnClicked:Add(self, self.OnCellClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnCellHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnCellUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnCellPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnCellReleased)
end

function WBP_Com_Dialog_RewardTab_C:Destruct()
  ReddotManager.RemoveListener(self.ReddotName, self)
end

function WBP_Com_Dialog_RewardTab_C:OnListItemObjectSet(Content)
  self.Content = Content
  self.ReddotName = Content.ReddotName
  self.IsShowIcon = Content.IsShowIcon
  self.IconPath = Content.IconPath
  self.Content.Entry = self
  self.IsSelect = false
  if self.Content.Root.SelectedContent and self.Content.Root.SelectedContent.Index == self.Content.Index then
    self.IsSelect = true
  end
  if self.IsShowIcon == false then
    self.Icon:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Icon:SetVisibility(UIConst.VisibilityOp.Visible)
    if self.IconPath then
      local Icon = LoadObject(self.IconPath)
      self.Icon:SetBrushResourceObject(Icon)
    end
  end
  self.Text:SetText(GText(self.Content.Title))
  if not ReddotManager.GetTreeNode(self.ReddotName) then
    ReddotManager.AddNode(self.ReddotName)
  end
  if not self.AddListenerFinish then
    self.AddListenerFinish = true
    ReddotManager.AddListener(self.ReddotName, self, self.RefreshReddot)
  end
end

function WBP_Com_Dialog_RewardTab_C:UnSelected()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self.Btn_Click:SetChecked(false)
  self.IsSelect = false
end

function WBP_Com_Dialog_RewardTab_C:Selected(NotPlaySound)
  self.Btn_Click:SetChecked(true)
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  self.IsSelect = true
  if NotPlaySound then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
end

function WBP_Com_Dialog_RewardTab_C:OnCellClicked(NotPlaySound)
  if self.IsSelect then
    return
  end
  self.Content.Root:RefreshListRewardInfo(self, NotPlaySound)
end

function WBP_Com_Dialog_RewardTab_C:OnCellHovered()
  if self.IsSelect then
    return
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:SetFocus()
  end
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.Hover)
  end
end

function WBP_Com_Dialog_RewardTab_C:OnCellUnhovered()
  if self.IsSelect then
    return
  end
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Hover)
    self:StopAnimation(self.Press)
    self:PlayAnimation(self.UnHover)
  end
end

function WBP_Com_Dialog_RewardTab_C:OnCellPressed()
  if self.IsSelect then
    return
  end
  self:PlayAnimation(self.Press)
end

function WBP_Com_Dialog_RewardTab_C:OnCellReleased()
  if self.IsSelect then
    return
  end
  self:StopAnimation(self.Press)
  self:PlayAnimation(self.Normal)
end

function WBP_Com_Dialog_RewardTab_C:RefreshReddot()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.ReddotName)
  if not CacheDetail[self.Content.Type] then
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

return WBP_Com_Dialog_RewardTab_C
