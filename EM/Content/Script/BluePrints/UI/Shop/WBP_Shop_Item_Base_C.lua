require("UnLua")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.Button_Item.OnHovered:Add(self, self.OnBtnHovered)
  self.Button_Item.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Button_Item.OnPressed:Add(self, self.OnBtnPressed)
  self.Button_Item.OnReleased:Add(self, self.OnBtnReleased)
  self.Button_Item.OnClicked:Add(self, self.OnBtnClicked)
  if self.Text_CanUpgrade then
    self.Text_CanUpgrade:SetText(GText("UI_RougeLike_Blessing_CanUpgrade"))
  end
  if self.Text_SoldOut then
    self.Text_SoldOut:SetText(GText("UI_SHOP_SOLDOUT"))
  end
end

function M:InitEmptyItem()
  self.Group_Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Bg_Base:SetRenderOpacity(0.5)
  if self.Bg_Pattern then
    self.Bg_Pattern:SetRenderOpacity(0.5)
  end
  if self.Bg_Base2 then
    self.Bg_Base2:SetColorAndOpacity(UE4.UUIFunctionLibrary.StringToLinearColor("000000CC"))
  end
end

function M:OnBtnHovered()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function M:OnBtnPressed()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self.StartPressTime = os.clock()
  self:PlayAnimation(self.Press)
end

function M:OnBtnReleased()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  self.PressedTime = os.clock() - self.StartPressTime or os.clock()
  if self.PressedTime > 0.2 then
    self.IsLongPress = true
    self:PlayAnimation(self.Normal)
  end
end

function M:OnBtnClicked()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  if not self.IsLongPress then
    self:PlayAnimation(self.Click)
    self:ShowItemDetail()
  end
  self.IsLongPress = false
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.UnHover then
    self:PlayAnimation(self.Normal)
  end
end

return M
