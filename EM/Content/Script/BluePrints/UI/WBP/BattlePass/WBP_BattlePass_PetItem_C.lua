require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.IsSelect = false
  self.MaxRarity = 5
  self.MaxStar = 6
  self.Button_Area.OnHovered:Add(self, self.OnBtnHovered)
  self.Button_Area.OnUnhovered:Add(self, self.OnBtnUnhovered)
  self.Button_Area.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Check:BindEventOnClicked(self, self.OnBtnChecked)
  self.Key_Detail:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    },
    Desc = GText("UI_Controller_CheckDetails")
  })
  self:PlayAnimation(self.Normal)
end

function M:Destruct()
  self.Button_Area.OnHovered:Remove(self, self.OnBtnHovered)
  self.Button_Area.OnUnhovered:Remove(self, self.OnBtnUnhovered)
  self.Button_Area.OnClicked:Remove(self, self.OnBtnClicked)
end

function M:InitUI(PetInfo)
  self.PetId = PetInfo.PetId
  self.Parent = PetInfo.Parent
  local PetIconPath = DataMgr.Pet[self.PetId].Icon
  if PetIconPath then
    local PetIcon = LoadObject(PetIconPath)
    self.Img_Pet:SetBrushResourceObject(PetIcon)
    self.Img_Pet_Shadow:SetBrushResourceObject(PetIcon)
    local ImgMat = self.Bg_Pet:GetDynamicMaterial()
    ImgMat:SetTextureParameterValue("IconMap", PetIcon)
  end
  self.PetName = GText(DataMgr.Pet[self.PetId].Name)
  self.Text_Name:SetText(self.PetName)
  local RecommendAttr = DataMgr.PetRecommendAttr[self.PetId].RecommendAttribute
  self.Bg_Color:SetColorAndOpacity(self[RecommendAttr])
  local AttrIconPath = DataMgr.Attribute[RecommendAttr].Icon
  local AttrIcon = LoadObject(AttrIconPath)
  self.Icon_Type:SetBrushResourceObject(AttrIcon)
  local Rarity = DataMgr.Pet[self.PetId].Rarity
  local RarityDiff = self.MaxRarity - Rarity
  for i = 1, RarityDiff do
    self["Star_" .. i]:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Text_Get:SetText(GText("UI_BattlePass_PetHasGot"))
  self.Num_Get:SetText(PetInfo.Num)
  self.Text_Ascend:SetText(GText("UI_BattlePass_PetHasCardUp"))
  if PetInfo.HasOwned then
    self.HB_NotGet:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.HB_Get:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Panel_StarAscend:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    for i = 1, PetInfo.MaxStar do
      self["Star_Ascend_" .. i]:SetRenderOpacity(1)
    end
  else
    self.HB_NotGet:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.HB_Get:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Panel_StarAscend:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if not PetInfo.AlreadyGot then
    self.Icon_Get:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Icon_Get:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  self.ItemDetails_MenuAnchor:SetLastFocusWidget(self.Button_Area)
end

function M:OnBtnHovered()
  if self.IsSelect then
    return
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:AddDelayFrameFunc(function()
      self:OnBtnClicked()
      return
    end, 1)
  end
  if not self.IsSelect then
    AudioManager(self):PlayUISound(self, "event:/ui/common/hover_btn_large_crystal", nil, nil)
    self:PlayAnimation(self.Hover)
  end
end

function M:OnBtnUnhovered()
  if not self.IsSelect then
    self:PlayAnimation(self.UnHover)
  end
end

function M:OnBtnClicked()
  if not self.IsSelect then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large_crystal", nil, nil)
    self:PlayAnimation(self.Click)
  end
  self.IsSelect = true
  self.Parent:SelectItem(self.PetId, self.PetName, self)
end

function M:OnUnSelect()
  if self.IsSelect then
    self:StopAnimation(self.Click)
    self:PlayAnimation(self.Normal)
    self.IsSelect = false
  end
end

function M:OnBtnChecked()
  UIManager(self):LoadUINew("ArmoryDetail", {
    PreviewPetIds = {
      self.PetId
    },
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon
  })
end

return M
