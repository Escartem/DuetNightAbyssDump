require("UnLua")
local EMCache = require("EMCache.EMCache")
local WBP_Play_HardBoss_Item_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Play_HardBoss_Item_C:Initialize(Initializer)
  self.IsSelected = false
  self.Parent = nil
end

function WBP_Play_HardBoss_Item_C:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Entry = self
  self:PlayAnimation(self.In)
  if self.Content.Empty then
    self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    self.Group_Normal:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Group_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    return
  end
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Group_Normal:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Group_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local BtnInfo = DataMgr.HardBossMain
  local Text = BtnInfo[self.Content.Id].HardBossName
  local HeadSculpture = LoadObject(BtnInfo[self.Content.Id].MonsterIcon)
  self.Text_BossName:SetText(GText(Text))
  self.Image_Boss:SetBrushFromTexture(HeadSculpture)
  self:UpdateReddot()
  if 0 == self.Content.Index - 1 then
    self.Content.Parent:TrySelectFirstTime(self)
  end
end

function WBP_Play_HardBoss_Item_C:OnCellClicked()
  self:SelectCell()
end

function WBP_Play_HardBoss_Item_C:OnCellClickedWithoutSound()
  self:SelectCell(true, true)
end

function WBP_Play_HardBoss_Item_C:SelectCell(IsFirstTime, DoNotPlaySound)
  if self.IsSelect then
    return
  end
  if not DoNotPlaySound then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
  end
  if not ReddotManager.GetTreeNode("HardBossItem") then
    ReddotManager.AddNode("HardBossItem")
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("HardBossItem")
  if CacheDetail[self.Content.Id] then
    CacheDetail[self.Content.Id] = nil
    ReddotManager.DecreaseLeafNodeCount("HardBossItem")
    self.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if not self:IsAnimationPlaying(self.Click) then
    self.IsSelect = true
    self.Content.Parent:RefreshListBossInfo(self.Content.Index, IsFirstTime)
    self:PlayAnimation(self.Click)
  end
end

function WBP_Play_HardBoss_Item_C:OnCellHovered()
  if self.IsSelect then
    return
  end
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Normal)
    self:PlayAnimation(self.Hover)
  end
end

function WBP_Play_HardBoss_Item_C:OnCellUnhovered()
  if self.IsSelect then
    return
  end
  if not self:IsAnimationPlaying(self.Click) then
    self:StopAnimation(self.Hover)
    self:StopAnimation(self.Press)
    self:PlayAnimation(self.Normal)
  end
end

function WBP_Play_HardBoss_Item_C:OnCellPressed()
  if self.IsSelect then
    return
  end
  self:PlayAnimation(self.Press)
end

function WBP_Play_HardBoss_Item_C:OnCellReleased()
  if self.IsSelect then
    return
  end
  self:StopAnimation(self.Press)
  self:PlayAnimation(self.Normal)
end

function WBP_Play_HardBoss_Item_C:UpdateReddot()
  if not ReddotManager.GetTreeNode("HardBossItem") then
    ReddotManager.AddNode("HardBossItem")
  end
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("HardBossItem")
  if CacheDetail[self.Content.Id] then
    self.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

return WBP_Play_HardBoss_Item_C
