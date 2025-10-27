require("UnLua")
local EMCache = require("EMCache.EMCache")
local WBP_TrueHardBoss_ListItem_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_TrueHardBoss_ListItem_C:Initialize(Initializer)
  self.IsSelected = false
  self.Parent = nil
end

function WBP_TrueHardBoss_ListItem_C:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.Entry = self
  if self.Content.Empty then
    self.Common_List_Subcell_PC:SetRenderOpacity(0.5)
    self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    self.Group_Normal:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Group_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    return
  end
  self.Common_List_Subcell_PC:SetRenderOpacity(1)
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Group_Normal:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Group_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local BtnInfo = DataMgr.HardBossMain
  local Text = BtnInfo[self.Content.Id].HardBossName
  local MonsterId = BtnInfo[self.Content.Id].MonsterId
  local Monster = DataMgr.Monster[MonsterId]
  local MonsterIcon = Monster.Icon
  local HeadSculpture = LoadObject(MonsterIcon)
  self.Text_BossName_Nomal:SetText(GText(Text))
  self.Text_BossEnName_Normal:SetText(EnText(Text))
  self.Common_List_Subcell_PC:BindEventOnClicked(self.Content.Parent, self.Content.Parent.RefreshListBossInfo, self.Content.Index)
  local ImgMat = self.Image_BossHead:GetDynamicMaterial()
  ImgMat:SetTextureParameterValue("IconMap", HeadSculpture)
  local HardBossCache = EMCache:Get("HardBoss", true) or {}
  if HardBossCache[self.Content.Id] then
    self.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Common_Item_Subsize_New_PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if 0 == self.Content.Index - 1 then
    self.Common_List_Subcell_PC:OnCellClicked()
  end
  if self.Content.Index == self.Content.Parent.LastIndex then
    self.Content.Parent:FillWrapBox(self.Content.Index)
  end
end

return WBP_TrueHardBoss_ListItem_C
