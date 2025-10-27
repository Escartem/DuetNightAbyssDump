require("UnLua")
local WBP_LevelMap_TempleStarItem_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function WBP_LevelMap_TempleStarItem_C:PlayOnAnim()
  self:PlayAnimation(self.On)
end

function WBP_LevelMap_TempleStarItem_C:PlayOffAnim()
  self:PlayAnimation(self.Off)
end

function WBP_LevelMap_TempleStarItem_C:PlayStarInAnim()
  self:PlayAnimation(self.Star_In)
end

function WBP_LevelMap_TempleStarItem_C:SetBigStar()
  self.Image_BigStar:SetVisibility(ESlateVisibility.Visible)
  self.Image_SmallStar:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_LevelMap_TempleStarItem_C:SetSmallStar()
  self.Image_SmallStar:SetVisibility(ESlateVisibility.Visible)
  self.Image_BigStar:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_LevelMap_TempleStarItem_C:SetTipsNormal()
  self.WS:SetActiveWidgetIndex(0)
end

function WBP_LevelMap_TempleStarItem_C:SetTipsEmpty()
  self.WS:SetActiveWidgetIndex(1)
end

return WBP_LevelMap_TempleStarItem_C
