require("UnLua")
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:InitInfo(ShopItemData)
  if self.In then
    self:PlayAnimation(self.In)
  end
  self.ShopItemData = ShopItemData
  local ItemType = self.ShopItemData.ItemType
  local Name = ShopItemData.Name
  if self.Text_Name then
    self.Text_Name:SetText(GText(Name))
  end
  local IconPath = ShopItemData.Icon
  self:SetIcon(IconPath)
  local Rarity = ShopItemData[ItemType .. "Rarity"]
  self:SetRarity(Rarity)
  local BuffIconPath = ShopItemData.TypeIcon
  self.Group_Buff:SetVisibility(ESlateVisibility.Collapsed)
  if "Blessing" == ItemType then
    self:SetBuffType(BuffIconPath)
    self:SetLevelUp()
  end
end

function M:SetIcon(IconPath)
  if not IconPath then
    return
  end
  self.Img_Item:SetBrushResourceObject(LoadObject(IconPath))
end

function M:SetRarity(Rarity)
  local Quality, QualityLine
  if Rarity > 0 and Rarity <= 3 then
    Quality = self["Img_Quality_" .. Rarity]
    QualityLine = self["Img_QualityLine_" .. Rarity]
  elseif Rarity > 3 then
    Quality = self.Img_Quality_4
    QualityLine = self.Img_QualityLine_4
  end
  self.Img_Quality:SetBrushResourceObject(Quality)
  self.Img_QualityLine:SetBrushResourceObject(QualityLine)
end

function M:SetBuffType(IconPath)
  if not IconPath then
    return
  end
  self.Group_Buff:SetVisibility(ESlateVisibility.Visible)
  self.Image_BuffType:SetBrushResourceObject(LoadObject(IconPath))
end

function M:SetLevelUp()
  if self.Panel_Upgrade then
    local RougeLikeManager = GWorld.RougeLikeManager
    if not RougeLikeManager then
      DebugPrint("ZDX RougeLikeManager is nil!")
      return
    end
    self.ItemType = self.ShopItemData.ItemType .. "s"
    local ItemList = RougeLikeManager[self.ItemType]
    if ItemList:FindRef(self.ShopItemData[self.ShopItemData.ItemType .. "Id"]) > 1 then
      self.Panel_Upgrade:SetVisibility(ESlateVisibility.Visible)
    else
      self.Panel_Upgrade:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function M:InitEmptyItem()
  self.Group_Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Bg_Base:SetRenderOpacity(0.5)
  if self.Bg_Pattern then
    self.Bg_Pattern:SetRenderOpacity(0.5)
  end
end

return M
