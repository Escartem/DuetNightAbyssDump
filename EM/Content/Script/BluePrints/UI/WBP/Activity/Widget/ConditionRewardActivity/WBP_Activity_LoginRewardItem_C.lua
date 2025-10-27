require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

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

function M:UpdateView(Content)
  local ResourceData = DataMgr[Content.ItemType][Content.Id]
  local Icon = LoadObject(ResourceData.Icon)
  self.Image_Icon:SetBrushFromTexture(Icon)
  self.Text_IconName:SetText(GText(ResourceData[self.ItemType .. "Name"] or ResourceData.Name) .. " x" .. Content.Count)
  if self.ItemType == "HeadFrame" then
    self.Text_IconName:SetText(GText(ResourceData[self.ItemType .. "Name"] or ResourceData.Name))
  end
  if Content.IsFinished then
    self.Btn_Click:SetForbidden(true)
  else
    self.Btn_Click:SetForbidden(false)
  end
end

function M:BindButtonPerformances()
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.OnStuffDetailViewOpenChanged)
end

function M:UnBindButtonPerformances()
  self.Btn_Click.OnClicked:Clear()
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.OnStuffDetailViewOpenChanged)
end

function M:OnStuffDetailViewOpenChanged(IsOpened)
  if type(self.StuffClickCallback) == "function" then
    self.StuffClickCallback(self.ParentWidget, IsOpened, self)
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
    self.Btn_Click:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Btn_Click:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:PlayAnimationByType(IsCanGetReward, IsFinished)
  self:StopAllAnimations()
  if IsFinished then
    self:PlayAnimation(self.Received)
  elseif IsCanGetReward then
    self:PlayAnimation(self.Able)
  else
    self:PlayAnimation(self.Normal)
  end
end

return M
