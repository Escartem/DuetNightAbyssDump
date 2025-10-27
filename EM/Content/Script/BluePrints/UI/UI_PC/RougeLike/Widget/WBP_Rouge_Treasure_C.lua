require("UnLua")
local WBP_Rouge_Treasure_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Rouge_Treasure_C:Construct()
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.ItemDetails_MenuAnchor.ParentWidget = self
  self.Content = {}
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
end

function WBP_Rouge_Treasure_C:Destruct()
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
end

function WBP_Rouge_Treasure_C:SetDefault()
  local IconPath = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Treasure_Unknown.T_Rouge_Treasure_Unknown"
  self:SetIcon(IconPath)
end

function WBP_Rouge_Treasure_C:InitInfo(TreasureItemData)
  self.TreasureItemData = TreasureItemData
  local IconPath = TreasureItemData.Icon
  self:SetIcon(IconPath)
end

function WBP_Rouge_Treasure_C:SetIcon(IconPath)
  if not IconPath then
    return
  end
  self.Icon:SetBrushResourceObject(LoadObject(IconPath))
end

function WBP_Rouge_Treasure_C:ShowItemDetail()
  if self.TreasureItemData then
    self.Content = {
      ItemType = "RougeLikeTreasure",
      ItemId = self.TreasureItemData.TreasureId,
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
      UIName = "RougeSettlement"
    }
  else
    self.Content = {
      ItemType = "RougeLikeTreasure",
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
      Name = "RLTreasure_Name_Unknown"
    }
  end
  self.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, self.Content)
  self.Content.IsShowTips = true
end

function WBP_Rouge_Treasure_C:OnBtnHovered()
  if self:IsAnimationPlaying(self.In) or self.Content.IsShowTips then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function WBP_Rouge_Treasure_C:OnBtnUnhovered()
  if self:IsAnimationPlaying(self.In) or self.Content.IsShowTips then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function WBP_Rouge_Treasure_C:OnBtnPressed()
  if self:IsAnimationPlaying(self.In) or self.Content.IsShowTips then
    return
  end
  self:PlayAnimation(self.Press)
end

function WBP_Rouge_Treasure_C:OnBtnClicked()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self:PlayAnimation(self.Click)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/level_finish_item_tip_click", nil, nil)
  self:ShowItemDetail()
end

function WBP_Rouge_Treasure_C:OnMenuOpenChanged(bIsOpen)
  EventManager:FireEvent(EventID.OnRougeSettlementBoxItemMenuChanged, bIsOpen)
end

function WBP_Rouge_Treasure_C:OnAddedToFocusPath(InFocusEvent)
  EventManager:FireEvent(EventID.OnRougeSettlementBoxItemFocused, self, "Treasure")
end

return WBP_Rouge_Treasure_C
