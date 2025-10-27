require("UnLua")
local ForgeModel = require("Blueprints.UI.Forge.ForgeDataModel")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Super.Construct(self)
end

function M:InitItemInfo(ItemType, ItemId, UnitId)
  local DraftInfo = DataMgr.Draft[ItemId]
  local PlayerAvatar = GWorld:GetAvatar()
  self.Text_Result:SetText(GText("UI_FORGING_RESULT"))
  if type(ItemId) == "string" then
    ItemId = math.tointeger(ItemId)
  end
  local DraftServerData = PlayerAvatar.Drafts[ItemId]
  local ProductType = DraftInfo.ProductType
  local ProductId = DraftInfo.ProductId
  local ProductData = DataMgr[ProductType][ProductId]
  local Icon = LoadObject(ProductData.Icon)
  self.Img_Result:SetBrushResourceObject(Icon)
  self.Text_Name:SetText(GText(ProductData.Name or ProductData[ProductType .. "Name"]))
  local FontMaterial = self.Text_Name:GetDynamicFontMaterial()
  if 5 == DraftInfo.Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.ParentWidget.Img_Text_5)
  elseif 4 == DraftInfo.Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.ParentWidget.Img_Text_4)
  elseif 3 == DraftInfo.Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.ParentWidget.Img_Text_3)
  elseif 2 == DraftInfo.Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.ParentWidget.Img_Text_2)
  elseif 1 == DraftInfo.Rarity then
    FontMaterial:SetTextureParameterValue("IconTex", self.ParentWidget.Img_Text_1)
  else
    FontMaterial:SetTextureParameterValue("IconTex", self.ParentWidget.Img_Text_0)
  end
  if DraftInfo and DraftInfo.FunctionDes then
    self.Text_Describe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Describe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_Describe:SetText(GText(DraftInfo.FunctionDes))
  else
    self.Text_Describe:SetVisibility(ESlateVisibility.Collapsed)
    self.Panel_Describe:SetVisibility(ESlateVisibility.Collapsed)
  end
  local ItemInfoWidget
  if "Mod" == ProductType then
    ItemInfoWidget = self:CreateWidgetNew("ModItemDetails")
  elseif "Weapon" == ProductType then
    ItemInfoWidget = self:CreateWidgetNew("WeaponItemDetails")
  elseif "Resource" == ProductType then
    ItemInfoWidget = self:CreateWidgetNew("ResourceItemDetails")
  end
  if ItemInfoWidget then
    ItemInfoWidget.ParentWidget = self.ParentWidget
    ItemInfoWidget:InitItemInfo(ProductType, ProductId, nil)
    self.Details:AddChild(ItemInfoWidget)
  end
  local Count = 0
  if DraftServerData then
    if DraftInfo.IsInfinity then
      Count = "<Img id=\"Infinity\" height=\"36\" width=\"28\"/>"
    else
      Count = DraftServerData.Count
    end
  end
  self.ParentWidget.Text_Hold02:SetText(Count)
  local ItemName = ItemUtils:GetDraftName(ItemId)
  self.ParentWidget.Text_ItemName:SetText(ItemName)
  self.ParentWidget.Line.Switch_Bg:SetActiveWidgetIndex(1)
  self.ParentWidget.Line.Switch_Text:SetActiveWidgetIndex(1)
  for FoundryId, CostNum in pairs(DraftInfo.FoundryCost) do
    local FoundryData = DataMgr.Resource[FoundryId]
    if FoundryData then
      self.ParentWidget.Line.Cost_Resource:InitContent({
        ResourceId = FoundryId,
        Icon = FoundryData.Icon,
        Numerator = CostNum,
        CostText = GText("UI_Armory_Trace_Cost"),
        IsGamePadIconVisible = false,
        NotInteractive = true,
        IsShowDetails = false
      })
      break
    end
  end
  self.ParentWidget.Line.Text_RequiredTime:SetText(string.format(GText("UI_SHOP_REMAINTIME_MINUTE"), DraftInfo.Time))
end

return M
