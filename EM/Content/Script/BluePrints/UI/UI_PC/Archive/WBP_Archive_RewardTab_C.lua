require("UnLua")
local WBP_Archive_RewardTab_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Archive_RewardTab_C:Construct()
  self.IsSelect = false
  self.AddListenerFinish = false
  self.Btn_Click.OnClicked:Add(self, self.OnCellClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnCellHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnCellUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnCellPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnCellReleased)
end

function WBP_Archive_RewardTab_C:Destruct()
  ReddotManager.RemoveListener("ArchiveReward", self)
end

function WBP_Archive_RewardTab_C:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Entry = self
  self.IsSelect = false
  if self.Content.Root.SelectedContent and self.Content.Root.SelectedContent.Index == self.Content.Index then
    self.IsSelect = true
  end
  self.Text_Type:SetText(GText(DataMgr.ArchiveInfo[self.Content.Type].ArchiveTitle))
  if not ReddotManager.GetTreeNode("ArchiveReward") then
    ReddotManager.AddNode("ArchiveReward")
  end
  if not self.AddListenerFinish then
    self.AddListenerFinish = true
    ReddotManager.AddListener("ArchiveReward", self, self.RefreshReddot)
  end
end

function WBP_Archive_RewardTab_C:UnSelected()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self.IsSelect = false
end

function WBP_Archive_RewardTab_C:Selected()
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  self.IsSelect = true
end

function WBP_Archive_RewardTab_C:OnCellClicked()
  if self.IsSelect then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
  self.Content.Root:RefreshListRewardInfo(self)
end

function WBP_Archive_RewardTab_C:OnCellHovered()
  if self.IsSelect then
    return
  end
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.Hover)
  end
end

function WBP_Archive_RewardTab_C:OnCellUnhovered()
  if self.IsSelect then
    return
  end
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Hover)
    self:StopAnimation(self.Press)
    self:PlayAnimation(self.Normal)
  end
end

function WBP_Archive_RewardTab_C:OnCellPressed()
  if self.IsSelect then
    return
  end
  self:PlayAnimation(self.Press)
end

function WBP_Archive_RewardTab_C:OnCellReleased()
  if self.IsSelect then
    return
  end
  self:StopAnimation(self.Press)
  self:PlayAnimation(self.Normal)
end

function WBP_Archive_RewardTab_C:RefreshReddot()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("ArchiveReward")
  if not CacheDetail[self.Content.Type] then
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

return WBP_Archive_RewardTab_C
