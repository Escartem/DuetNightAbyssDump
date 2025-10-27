require("UnLua")
local RewardModel = require("BluePrints.UI.UI_PC.Archive.WBP_Archive_Reward_Model")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Collect.OnClicked:Add(self, self.ClickRewardBtn)
  self.Btn_Collect.OnHovered:Add(self, self.OnCellHovered)
  self.Btn_Collect.OnUnhovered:Add(self, self.OnCellUnhovered)
  self.Btn_Collect.OnPressed:Add(self, self.OnCellPressed)
  self.Btn_Collect.OnReleased:Add(self, self.OnCellReleased)
  self.Text_Reward:SetText(GText("UI_ArchiveCollectionReward"))
  if not ReddotManager.GetTreeNode("ArchiveReward") then
    ReddotManager.AddNode("ArchiveReward")
  end
  ReddotManager.AddListener("ArchiveReward", self, self.RefreshReddot)
end

function M:Destruct()
  ReddotManager.RemoveListener("ArchiveReward", self)
end

function M:Init(Parent)
  self.Parent = Parent
end

function M:ClickRewardBtn()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  self:PlayAnimation(self.Click)
  self:OpenReward()
end

function M:OpenReward()
  RewardModel:OpenReward(self.Parent or self)
end

function M:OnCellHovered()
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.Hover)
  end
end

function M:OnCellUnhovered()
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Hover)
    self:StopAnimation(self.Press)
    self:PlayAnimation(self.Unhover)
  end
end

function M:OnCellPressed()
  self:PlayAnimation(self.Press)
end

function M:OnCellReleased()
  self:StopAnimation(self.Press)
  self:PlayAnimation(self.Normal)
end

function M:RefreshReddot()
  local Node = ReddotManager.GetTreeNode("ArchiveReward")
  if not Node then
    self:PlayAnimation(self.No_Reward)
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  if Node.Count and Node.Count > 0 then
    self:PlayAnimation(self.Reward_Remind)
    self.Reddot:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self:PlayAnimation(self.No_Reward)
    self.Reddot:SetVisibility(ESlateVisibility.Collapsed)
  end
end

return M
