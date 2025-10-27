require("UnLua")
local WBP_Rouge_SettlementBless_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_Rouge_SettlementBless_C:Construct()
  self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.ItemDetails_MenuAnchor.ParentWidget = self
  self.Content = {}
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
end

function WBP_Rouge_SettlementBless_C:Destruct()
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
end

function WBP_Rouge_SettlementBless_C:SetDefault()
  local IconPath = "/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_BlessingType_Unknown.T_Rouge_BlessingType_Unknown"
  self:SetIcon(IconPath)
  self:PlayAnimation(self.Grey)
end

function WBP_Rouge_SettlementBless_C:InitInfo(BlessingItemData)
  self.BlessingItemData = BlessingItemData
  local IconPath = BlessingItemData.Icon
  self:SetIcon(IconPath)
  self:SetRarity(BlessingItemData.BlessingRarity)
end

function WBP_Rouge_SettlementBless_C:SetIcon(IconPath)
  if not IconPath then
    return
  end
  local Material = self.Img_Item:GetDynamicMaterial()
  Material:SetTextureParameterValue("MainTex", LoadObject(IconPath))
end

function WBP_Rouge_SettlementBless_C:SetRarity(Rarity)
  if 1 == Rarity then
    self:PlayAnimation(self.Blue)
  elseif 2 == Rarity then
    self:PlayAnimation(self.Purple)
  elseif 3 == Rarity then
    self:PlayAnimation(self.Yellow)
  elseif 4 == Rarity then
  end
end

function WBP_Rouge_SettlementBless_C:ShowItemDetail()
  if self.BlessingItemData then
    self.Content = {
      ItemType = "RougeLikeBlessing",
      ItemId = self.BlessingItemData.BlessingId,
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
      UIName = "RougeSettlement"
    }
  else
    self.Content = {
      ItemType = "RougeLikeBlessing",
      MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
      Name = "RLBlessing_Name_unknown"
    }
  end
  self.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, self.Content)
  self.Content.IsShowTips = true
end

function WBP_Rouge_SettlementBless_C:OnBtnHovered()
  if self:IsAnimationPlaying(self.In) or self.Content.IsShowTips then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function WBP_Rouge_SettlementBless_C:OnBtnUnhovered()
  if self:IsAnimationPlaying(self.In) or self.Content.IsShowTips then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function WBP_Rouge_SettlementBless_C:OnBtnPressed()
  if self:IsAnimationPlaying(self.In) or self.Content.IsShowTips then
    return
  end
  self:PlayAnimation(self.Press)
end

function WBP_Rouge_SettlementBless_C:OnBtnClicked()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self:PlayAnimation(self.Click)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/level_finish_item_tip_click", nil, nil)
  self:ShowItemDetail()
end

function WBP_Rouge_SettlementBless_C:OnMenuOpenChanged(bIsOpen)
  EventManager:FireEvent(EventID.OnRougeSettlementBoxItemMenuChanged, bIsOpen)
end

function WBP_Rouge_SettlementBless_C:OnAddedToFocusPath(InFocusEvent)
  EventManager:FireEvent(EventID.OnRougeSettlementBoxItemFocused, self, "Bless")
end

return WBP_Rouge_SettlementBless_C
