require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnCellClicked)
  self.Btn_Click.OnHovered:Add(self, self.OnCellHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnCellUnhovered)
  self:SetNavRule()
end

function M:SetNavRule()
  self:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.Btn_Click:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.Btn_Click:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
end

function M:OnListItemObjectSet(Content)
  self:SetNavRule()
  if self.IsNew == nil then
    self.IsNew = Content.IsNew
  end
  self.IsUnlocked = Content.IsUnlocked
  self.Index = Content.Index
  self.Data = Content.Data
  self.UnlockNum = Content.UnlockNum
  self.TotalNum = Content.TotalNum
  self.SubItems = Content.SubItems
  self.Parent = Content.Parent
  self.IsSelected = self.Parent.CurSelectIndex == self.Index
  self.Btn_Click:SetChecked(self.IsSelected)
  self:InitEventItem()
end

function M:InitEventItem()
  local EventBg = self.Data.Data.SeriesMainIcon
  if EventBg then
    UE.UResourceLibrary.LoadObjectAsync(self, EventBg, {
      self,
      M.OnEventBGIconLoadFinish
    })
  end
  local EventName = self.Data.Data.SeriesName
  local FormattedNum = string.format("%03d", self.Index + 1)
  local IndexString = string.format(GText("RLArchive_ID"), FormattedNum)
  self.Text_EventIndex:SetText(self.UnlockNum .. "/" .. self.TotalNum)
  self.Text_TitleNum:SetText(IndexString)
  if self.IsNew then
    self.New:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.New:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.IsUnlocked then
    self.Text_Title:SetText(GText(EventName))
    self.Image_Lock:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Text_Title:SetText(GText("RLArchive_UnlockEntry"))
    self.Image_Lock:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  if self.IsSelected then
    self:PlayAnimation(self.Select)
  else
    self:PlayAnimation(self.Normal_S)
  end
  if self.IsUnlocked then
    if self.TotalNum == self.UnlockNum then
      self:PlayAnimation(self.Finish)
    else
      self:PlayAnimation(self.Normal)
    end
  else
    self:PlayAnimation(self.Forbidden)
  end
end

function M:OnCellClicked()
  self.Parent:ChooseItem(self.Index, self)
  self:PlayAnimation(self.Select)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/choose_point_btn_affix_click", nil, nil)
end

function M:OnCellHovered()
  if not self.IsSelected then
    self:PlayAnimation(self.Hover)
    AudioManager(self):PlayUISound(self, "event:/ui/roguelike/choose_point_hover", nil, nil)
  end
end

function M:OnCellUnhovered()
  if not self.IsSelected then
    self:StopAnimation(self.Hover)
    self:PlayAnimation(self.UnHover)
  end
end

function M:BP_OnItemSelectionChanged(IsSelected)
  self.IsSelected = IsSelected
  if IsSelected then
    self:PlayAnimation(self.Select)
    if self.IsNew then
      self.IsNew = false
      self.New:SetVisibility(ESlateVisibility.Collapsed)
    end
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      self.Btn_Click:SetFocus()
    elseif self.Parent.CurSelectIndex ~= self.Index then
      self.Parent:SelectItem(self.Index)
    end
  else
    self:PlayAnimation(self.Unselect)
    self.Btn_Click:SetChecked(false)
  end
end

function M:OnEventBGIconLoadFinish(Object)
  if IsValid(self) and Object then
    local EventItemMat = self.EventItem.Img_Icon:GetDynamicMaterial()
    local EventIconColorMat = self.EventItem.Img_Icon_Color:GetDynamicMaterial()
    EventItemMat:SetTextureParameterValue("IconMap", Object)
    EventIconColorMat:SetTextureParameterValue("DissolveTex", Object)
  end
end

return M
