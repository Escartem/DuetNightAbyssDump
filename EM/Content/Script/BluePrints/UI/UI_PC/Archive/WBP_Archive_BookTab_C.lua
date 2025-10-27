require("UnLua")
local WBP_Archive_BookTab_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Archive_BookTab_C:Construct()
  self.IsSelect = false
  self.AddListenerFnish = false
  self.Btn_Click.OnClicked:Add(self, self.OnCellClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnCellHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnCellUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnCellPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnCellReleased)
end

function WBP_Archive_BookTab_C:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Entry = self
  self.IsSelect = false
  if self.Content.Root.SelectedContent and self.Content.Root.SelectedContent.Index == self.Content.Index then
    self.IsSelect = true
  end
  if not self.IsSelect then
    if self.Content.Unlock then
      self:PlayAnimation(self.Normal)
    else
      self:PlayAnimation(self.Lock)
    end
  else
    self:PlayAnimation(self.Click)
  end
  self.Text_Name:SetText(GText(DataMgr.Resource[self.Content.Id].ResourceName))
  if not self.AddListenerFnish then
    self.AddListenerFnish = true
    if not ReddotManager.GetTreeNode("ArchiveNewReadBook") then
      ReddotManager.AddNode("ArchiveNewReadBook")
    end
    ReddotManager.AddListener("ArchiveNewReadBook", self, self.RefreshReddot)
  else
    self:RefreshReddot()
  end
end

function WBP_Archive_BookTab_C:UnSelected()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self.IsSelect = false
end

function WBP_Archive_BookTab_C:Selected()
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  self.IsSelect = true
end

function WBP_Archive_BookTab_C:OnCellClicked()
  if not self.Content.Unlock then
    UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_BookArchive_BookLockedToast"))
    return
  end
  if self.IsSelect then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
  self.Content.Root:RefreshBookDetailInfo(self)
  self:SetArchiveReddotRead()
end

function WBP_Archive_BookTab_C:OnCellHovered()
  if not self.Content.Unlock then
    return
  end
  if self.IsSelect then
    return
  end
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.Hover)
  end
end

function WBP_Archive_BookTab_C:OnCellUnhovered()
  if not self.Content.Unlock then
    return
  end
  if self.IsSelect then
    return
  end
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Hover)
    self:StopAnimation(self.Press)
    self:PlayAnimation(self.Normal)
  end
end

function WBP_Archive_BookTab_C:OnCellPressed()
  if not self.Content.Unlock then
    return
  end
  if self.IsSelect then
    return
  end
  self:PlayAnimation(self.Press)
end

function WBP_Archive_BookTab_C:OnCellReleased()
  if not self.Content.Unlock then
    return
  end
  if self.IsSelect then
    return
  end
  self:StopAnimation(self.Press)
  self:PlayAnimation(self.Normal)
end

function WBP_Archive_BookTab_C:RefreshReddot()
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("ArchiveNewReadBook")
  if not self.Content or not self.Content.Id then
    return
  end
  if 1 == CacheDetail[self.Content.Id] then
    self.New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.New:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Archive_BookTab_C:SetArchiveReddotRead()
  if self.Content and self.Content.Id then
    if not ReddotManager.GetTreeNode("ArchiveNewReadBook") then
      ReddotManager.AddNode("ArchiveNewReadBook")
    end
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("ArchiveNewReadBook")
    if 1 == CacheDetail[self.Content.Id] then
      CacheDetail[self.Content.Id] = 0
      ReddotManager.DecreaseLeafNodeCount("ArchiveNewReadBook")
    end
  end
end

return WBP_Archive_BookTab_C
