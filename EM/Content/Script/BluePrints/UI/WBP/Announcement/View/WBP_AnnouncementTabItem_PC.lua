require("UnLua")
local AnnouncementUtils = require("BluePrints.UI.WBP.Announcement.AnnounceUtils")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:Construct()
  self.ButtonArea.OnClicked:Add(self, self.OnClick)
  self.ButtonArea.OnHovered:Add(self, function()
    if not self.Content.IsSelected then
      self:PlayAnimation(self.Hover)
    end
  end)
  self.ButtonArea.OnUnhovered:Add(self, function()
    if not self.Content.IsSelected then
      self:PlayAnimation(self.UnHover)
    end
  end)
  self.ButtonArea.OnPressed:Add(self, function()
    if not self.Content.IsSelected then
      self:PlayAnimation(self.Press)
    end
  end)
end

function M:Destruct()
  self.ButtonArea.OnClicked:Remove(self, self.OnClick)
  self.ButtonArea.OnHovered:Clear()
  self.ButtonArea.OnUnhovered:Clear()
  self.ButtonArea.OnPressed:Clear()
  if self.ReddotName then
    self:RemoveReddotListener(self.ReddotName)
  end
end

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Parent = Content.Parent
  Content.Widget = self
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if not Content.Conf then
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Group_Normal:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Group_Empty:SetVisibility(UIConst.VisibilityOp.Visible)
    self.ButtonArea:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  self.ButtonArea:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Text_AnnouncementTitle:SetText(GText(Content.Conf.NoticeTitle))
  if Content.IsSelected then
    self:OnClick(true)
  end
  self.ReddotName = AnnouncementUtils:GetReddotNameByConf(self.Content.Conf)
  self:AddReddotListener(self.ReddotName)
end

function M:OnReddotChange(Count)
  if not self.Content.Conf then
    return
  end
  local CacheKey = tostring(self.Content.Conf.NoticeID)
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(AnnouncementUtils:GetReddotNameByConf(self.Content.Conf))
  self.Common_Item_Subsize_New_PC:SetEnable(CacheDetail[CacheKey] and Count > 0)
end

function M:BP_OnEntryReleased()
  self:PlayNormal()
  self.Group_Normal:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Group_Empty:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if self.Content.Conf then
    self:RemoveReddotListener(self.ReddotName)
  end
  self.Content.Widget = nil
end

function M:AddReddotListener(ReddotNodeName)
  self:RemoveReddotListener(ReddotNodeName)
  ReddotManager.AddListener(ReddotNodeName, self, self.OnReddotChange)
  self.ListenedReddot = true
end

function M:RemoveReddotListener(ReddotNodeName)
  if self.ListenedReddot then
    ReddotManager.RemoveListener(ReddotNodeName, self)
    self.Common_Item_Subsize_New_PC:SetEnable(false)
    self.ListenedReddot = false
  end
end

function M:PlayNormal()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnClick(bMuteSound)
  if self.Parent.CurContent and self.Parent.CurContent.Conf.NoticeID ~= self.Content.Conf.NoticeID then
    if self.Parent.CurContent.Widget then
      self.Parent.CurContent.Widget:PlayNormal()
    end
    self.Parent.CurContent.IsSelected = false
  end
  if not bMuteSound then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  end
  self.Content.IsSelected = true
  self:StopAllAnimations()
  self:PlayAnimation(self.Click)
  self.Parent:ChangeMainContent(self.Content, bMuteSound)
  AnnouncementUtils:TrySubReddotCacheDetail(self.Content.Conf)
end

function M:BP_OnItemSelectionChanged(IsSelected)
  self.IsSelected = IsSelected
  if IsSelected then
    self:OnClick(true)
  end
  self.Parent.List_Announcement:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
end

return M
