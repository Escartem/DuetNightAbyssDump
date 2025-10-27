require("UnLua")
local G = Class("BluePrints.UI.BP_EMUserWidget_C")

function G:Construct()
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
end

function G:OnListItemObjectSet(Obj)
  Obj.SelfWidget = self
  if Obj.IsEmpty then
    self:SetEmptyState()
    return
  else
    self.IsEmpty = false
    self.WS_PoolItem:SetActiveWidgetIndex(0)
  end
  self.Obj = Obj
  local GachaTabInfo = DataMgr.GachaTab[Obj.TabId]
  if GachaTabInfo then
    self.Text_PoolTitle:SetText(GText(GachaTabInfo.TabName))
    local Icon = LoadObject(GachaTabInfo.Icon)
    if Icon then
      self.Image_Pool:SetBrushResourceObject(Icon)
    end
  end
  self:InitReddotUpSign()
  if Obj.IsSelected and Obj.ParentWidget.NowTabId == Obj.Id then
    self:OnListItemObjectClicked()
  else
    self:SetUnselected()
  end
  self:PlayAnimation(self.In)
end

function G:SetEmptyState()
  self.WS_PoolItem:SetActiveWidgetIndex(1)
  self.IsEmpty = true
end

function G:InitReddotUpSign()
  if self.Obj.IsShowUp then
    self.Reddot_UpSign:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Reddot_UpSign:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function G:OnBtnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/common/gacha_pool_click", nil, nil)
  self:OnListItemObjectClicked()
end

function G:OnListItemObjectClicked()
  if self.IsSelected or self.IsEmpty then
    return
  end
  self:SetSelected()
end

function G:OnBtnPressed()
  if self.IsSelected or self.IsEmpty then
    return
  end
  self:PlayAnimation(self.Press)
end

function G:OnBtnHovered()
  if self.IsSelected or self.IsEmpty then
    return
  end
  if not self.Obj.ParentWidget.IsPCPlatform then
    return
  end
  self:StopAnimation(self.Unhover)
  self:PlayAnimation(self.Hover)
end

function G:OnBtnUnhovered()
  if self.IsSelected or self.IsEmpty then
    return
  end
  if not self.Obj.ParentWidget.IsPCPlatform then
    return
  end
  self:StopAnimation(self.Hover)
  self:PlayAnimation(self.Unhover)
end

function G:SetSelected()
  if self.IsEmpty then
    return
  end
  self.Obj.ParentWidget:OnTabSelected(self.Obj)
  self:PlayAnimation(self.Click)
  self.Obj.IsSelected = true
  self.IsSelected = true
end

function G:SetUnselected()
  if self.IsEmpty then
    return
  end
  self:StopAnimation(self.Click)
  self:PlayAnimation(self.Normal)
  self.Obj.IsSelected = false
  self.IsSelected = false
end

return G
