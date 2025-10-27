require("UnLua")
local ForgeConst = require("Blueprints.UI.Forge.ForgeConst")
local WBP_ForgeWorkableTip_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_ForgeWorkableTip_C:ShowDraftItem(DraftId)
  if not self.CachedItemForShow then
    self.CachedItemForShow = {}
  end
  table.insert(self.CachedItemForShow, DraftId)
  self:TryShowDraftItem()
end

function WBP_ForgeWorkableTip_C:TryShowDraftItem()
  if not self.IsClosing and self.CachedItemForShow and #self.CachedItemForShow > 0 then
    local NextDraftId = table.remove(self.CachedItemForShow, 1)
    self:InitDraftInfo(NextDraftId)
    self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:PlayAnimation(self.In)
  end
end

function WBP_ForgeWorkableTip_C:HideDraftItem()
  self:PlayAnimation(self.Out)
  self.IsClosing = true
end

function WBP_ForgeWorkableTip_C:InitDraftInfo(DraftId)
  local DraftInfo = DataMgr.Draft[DraftId]
  if not DraftInfo then
    DebugPrint("Tianyi@ init ForgeWorkableTip_C failed, DraftInfo is nil")
    return
  end
  local ProductId = DraftInfo.ProductId
  local ProductType = DraftInfo.ProductType
  local ProductRarity = ItemUtils.GetItemRarity(ProductId, ProductType)
  local ProductIcon = ItemUtils.GetItemIcon(ProductId, ProductType)
  self.Img_Item:SetBrushFromTexture(ProductIcon)
  local ProductName = ItemUtils.GetItemName(ProductId, ProductType)
  if ProductName then
    self.Text_Name:SetText(GText(ProductName))
  end
  if 1 == ProductRarity then
    self.Text_Name:SetColorAndOpacity(self.Color_Grey)
  elseif 2 == ProductRarity then
    self.Text_Name:SetColorAndOpacity(self.Color_Green)
  elseif 3 == ProductRarity then
    self.Text_Name:SetColorAndOpacity(self.Color_Blue)
  elseif 4 == ProductRarity then
    self.Text_Name:SetColorAndOpacity(self.Color_Purple)
  elseif 5 == ProductRarity then
    self.Text_Name:SetColorAndOpacity(self.Color_Orange)
  end
end

function WBP_ForgeWorkableTip_C:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    self:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.IsClosing = false
    self:TryShowDraftItem()
  end
end

return WBP_ForgeWorkableTip_C
