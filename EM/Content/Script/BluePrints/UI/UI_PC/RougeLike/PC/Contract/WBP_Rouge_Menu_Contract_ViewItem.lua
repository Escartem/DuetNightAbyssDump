local TimeUtils = require("Utils.TimeUtils")
local EMCache = require("EMCache.EMCache")
local WBP_Rouge_Menu_Contract_ViewItem = Class("BluePrints.UI.BP_UIState_C", "BluePrints.UI.BP_EMUserWidget_C")

function WBP_Rouge_Menu_Contract_ViewItem:OnListItemObjectSet(ListItemObject)
  self.Item = ListItemObject
  self.Owner = ListItemObject.Owner
  self.OnDecreaseLevel = ListItemObject.OnDecreaseLevel
  self.OnIncreaseLevel = ListItemObject.OnIncreaseLevel
  self.Text_Name:SetText(ListItemObject.Name)
  self.Text_Describe:SetText(ListItemObject.Desc)
  self.Text_HeatNum:SetText(ListItemObject.HeatValuePerLevel)
  self.Text_Level:SetText(ListItemObject.SelectedLevel)
  self.Text_TotalNum:SetText(ListItemObject.SelectedLevel * ListItemObject.HeatValuePerLevel)
  self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
  if ListItemObject.Icon then
    local IconObj = LoadObject(ListItemObject.Icon)
    if IconObj then
      self.Icon:GetDynamicMaterial():SetTextureParameterValue("Mask", IconObj)
    end
  end
end

function WBP_Rouge_Menu_Contract_ViewItem:OnAnimationFinished(InAnimation)
  if InAnimation == self.In then
    self:AddTimer(0.1, function()
      self:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
    end)
  end
end

function WBP_Rouge_Menu_Contract_ViewItem:SetVisibility(InVisibility)
  DebugPrint("Tianyi@ InVisibility = ", InVisibility)
  self.Overridden.SetVisibility(self, InVisibility)
end

return WBP_Rouge_Menu_Contract_ViewItem
