require("UnLua")
local WBP_Play_Common_Item_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Play_Common_Item_C:Initialize(Initializer)
  self.IsSelected = false
  self.Parent = nil
end

function WBP_Play_Common_Item_C:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Entry = self
  self:PlayAnimation(self.In)
  if self.Content.Empty then
    self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    self.Group_Normal:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Group_Empty:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    return
  end
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Group_Normal:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Group_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local BtnInfo = DataMgr.PlaySubTab
  local Text = BtnInfo[self.Content.SubWidgetUIName].SubTabName
  local HeadSculpture = LoadObject(BtnInfo[self.Content.SubWidgetUIName].EnterImage)
  self.Text_PermanentName:SetText(GText(Text))
  self.Image_PermanentSmall:SetBrushFromTexture(HeadSculpture)
  self:SetNavigationRuleCustom(EUINavigation.Left, {
    self.Content.Parent,
    self.Content.Parent.OnUINavigation
  })
  self:SetNavigationRuleCustom(EUINavigation.Right, {
    self.Content.Parent,
    self.Content.Parent.OnUINavigation
  })
  if self.Content.IsSelect then
    self:PlayAnimation(self.Click)
  else
    self:PlayAnimation(self.Normal)
  end
  if self.Content.SelectOnListItemObjectSet then
    self.Content.SelectOnListItemObjectSet = false
    self:OnCellClicked()
    self:SetFocus()
  end
  if 0 == self.Content.Index - 1 then
    self.Content.Parent:TrySelectFirstTime(self)
  end
  if DataMgr.ReddotNode[self.Content.SubWidgetUIName] then
    if not ReddotManager.GetTreeNode(self.Content.SubWidgetUIName) then
      ReddotManager.AddNode(self.Content.SubWidgetUIName)
    end
    ReddotManager.AddListener(self.Content.SubWidgetUIName, self, self["On" .. self.Content.SubWidgetUIName .. "ReddotChange"])
  end
end

function WBP_Play_Common_Item_C:OnCellClicked()
  self:SelectCell()
end

function WBP_Play_Common_Item_C:OnCellClickedWithoutSound()
  self:SelectCell(true)
end

function WBP_Play_Common_Item_C:SelectCell(DoNotPlaySound)
  if self.Content.IsSelect then
    return
  end
  if not DoNotPlaySound then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
  end
  if not self:IsAnimationPlaying(self.Click) then
    self.Content.IsSelect = true
    self.Content.Parent:RefreshListPermanentInfo(self.Content.Index)
    self:PlayAnimation(self.Click)
  end
end

function WBP_Play_Common_Item_C:OnCellHovered()
  if self.Content.IsSelect then
    return
  end
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.Hover)
  end
end

function WBP_Play_Common_Item_C:OnCellUnhovered()
  if self.Content.IsSelect then
    return
  end
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Hover)
    self:StopAnimation(self.Press)
    self:PlayAnimation(self.Normal)
  end
end

function WBP_Play_Common_Item_C:OnCellPressed()
  if self.Content.IsSelect then
    return
  end
  self:PlayAnimation(self.Press)
end

function WBP_Play_Common_Item_C:OnCellReleased()
  if self.Content.IsSelect then
    return
  end
  self:StopAnimation(self.Press)
  self:PlayAnimation(self.Normal)
end

function WBP_Play_Common_Item_C:StopBtnAnimations()
  self:StopAnimation(self.Normal)
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Unhover)
  self:StopAnimation(self.Press)
  self:StopAnimation(self.Click)
end

function WBP_Play_Common_Item_C:OnRougeMainReddotChange()
  if not ReddotManager.GetTreeNode("RougeMain") then
    ReddotManager.AddNode("RougeMain")
  end
  local TreeNode = ReddotManager.GetTreeNode("RougeMain")
  if TreeNode.Count > 0 then
    self.Reddot:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Play_Common_Item_C:OnAbyssMainReddotChange()
  if not ReddotManager.GetTreeNode("AbyssMain") then
    ReddotManager.AddNode("AbyssMain")
  end
  local TreeNode = ReddotManager.GetTreeNode("AbyssMain")
  if TreeNode.Count > 0 then
    self.Reddot:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Play_Common_Item_C:Destruct()
  ReddotManager.RemoveListener(self.Content.SubWidgetUIName, self)
end

return WBP_Play_Common_Item_C
