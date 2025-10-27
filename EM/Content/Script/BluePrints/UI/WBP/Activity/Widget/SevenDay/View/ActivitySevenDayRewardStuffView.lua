require("UnLua")
local EnumPlayerSignRewardState = require("Blueprints.UI.WBP.Activity.ActivityUtils").EnumPlayerSignRewardState
local M = Class("BluePrints.UI.BP_EMUserWidget_C")

function M:FillWithData(Content)
  self.Content = Content
  self.ParentWidget = Content.ParentWidget
  self.ItemType = Content.ItemType
  self.Id = Content.Id
  self.Index = Content.Index
  self.Count = Content.Count
  self.StuffClickCallback = Content.StuffClickCallback
  self:UpdateView(Content)
  self:UnBindButtonPerformances()
  self:BindButtonPerformances()
end

function M:GetRewardStuffIndex()
  return self.Index
end

function M:UpdateView(Content)
  local IconDynaMaterial = self.Image_Item:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("IconMap", Content.Icon)
  end
  self.Text_ItemNum:SetText("x" .. tostring(self.Count))
  self.ItemDetails_MenuAnchor:SetLastFocusWidget(self.ParentWidget)
  self.ItemDetails_MenuAnchor.ParentWidget = self
  self:PlayAnimation(self.Normal)
end

function M:RefreshState(RewardState)
  if RewardState == EnumPlayerSignRewardState.Completed then
    self.Image_Got:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Image_Got:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:BindButtonPerformances()
  self.Btn_Item.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Item.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Item.OnHovered:Add(self, self.OnBtnHovered)
  self.Btn_Item.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.OnStuffDetailViewOpenChanged)
end

function M:UnBindButtonPerformances()
  self.Btn_Item.OnClicked:Clear()
  self.Btn_Item.OnPressed:Clear()
  self.Btn_Item.OnHovered:Clear()
  self.Btn_Item.OnUnhovered:Clear()
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.OnStuffDetailViewOpenChanged)
end

function M:OnStuffDetailViewOpenChanged(IsOpened)
  if type(self.StuffClickCallback) == "function" then
    self.StuffClickCallback(self.ParentWidget, IsOpened, self.Index)
  end
end

function M:OnBtnClicked()
  if not self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen() then
    local Content = {
      ItemType = self.ItemType,
      ItemId = self.Id,
      Uuid = self.Content.Uuid,
      MenuPlacement = self.Content.MenuPlacement,
      UIName = self.Content.UIName
    }
    self.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, Content)
    AudioManager(self):PlayItemSound(self, self.Id, "Click", self.ItemType)
  end
end

function M:HideBtn(bHide)
  if bHide then
    self.Btn_Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Btn_Item:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:OnBtnPressed()
end

function M:OnBtnHovered()
  if self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen() then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function M:OnBtnUnhovered()
  if self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen() then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.UnHover)
end

return M
