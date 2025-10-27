require("UnLua")
local M = Class("BluePrints.UI.Shop.Banner.WBP_Shop_Banner_Base_C")

function M:Construct()
  M.Super.Construct(self)
  self.Btn_Qa:BindEventOnClicked(self, self.OnClickQa)
  self.Btn_Qa:TryOverrideSoundFunc(function()
    AudioManager(self):PlayUISound(self, "event:/ui/activity/large_btn_click", nil, nil)
  end)
  self.BannerTab = self:GetBannerTabData("WBP_Shop_Recommend_AvatarSkin")
  self.RefreshTimerName = "WBP_Shop_Banner_Recommend_AvatarSkin_C_RefreshLeftTime"
  self.Btn_Get.Btn_Buy.OnClicked:Add(self, self.OnGoToInterface)
  self.Btn_Get.Btn_Buy.OnHovered:Add(self, self.OnGoToHovered)
end

function M:Destruct()
  if self.Btn_Qa then
    self.Btn_Qa:UnBindEventOnClicked(self, self.OnClickQa)
  end
  if self.Btn_Get and self.Btn_Get.Btn_Buy then
    self.Btn_Get.Btn_Buy.OnClicked:Remove(self, self.OnGoToInterface)
    self.Btn_Get.Btn_Buy.OnHovered:Remove(self, self.OnGoToHovered)
  end
  self:RemoveTimer(self.RefreshTimerName)
  M.Super.Destruct(self)
end

function M:OnClickQa()
  if self.BannerTab and self.BannerTab.PreviewType == "Skin" and self.BannerTab.PreviewId then
    UIManager(self):LoadUINew("SkinPreview", {
      ItemType = "Skin",
      TypeId = self.BannerTab.PreviewId[1],
      SinglePreview = true,
      HidePurchase = true
    })
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    self.Btn_Get.Key_ControllerBuy:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Btn_Get.Key_ControllerBuy:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  else
    IsEventHandled = self:OnPCKeyDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == Const.GamepadFaceButtonDown then
    self:OnGoToInterface()
    IsEventHandled = true
  elseif InKeyName == Const.GamepadFaceButtonLeft then
    self:OnClickQa()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:OnPCKeyDown(InKeyName)
  local IsEventHandled = false
  if "SpaceBar" == InKeyName then
    self:OnGoToInterface()
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:InitBannerPage(BannerId)
  if BannerId and self.BannerTab.Id and self.BannerTab.Id == BannerId then
    self.BannerId = BannerId
  else
    return
  end
  if self.BG_Anchor then
    self.BG_Anchor:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Com_BtnExplanation then
    self.Com_BtnExplanation:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if self.Btn_Get then
    if self.Btn_Get.Image_Get then
      self.Btn_Get.Image_Get:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    if self.Btn_Get.Text_BtnBuy then
      self.Btn_Get.Text_BtnBuy:SetText(GText("UI_Banner_SkinGacha_Goto"))
    end
    if self.Btn_Get.Text_BtnDesc then
      self.Btn_Get.Text_BtnDesc:SetText(GText("UI_Banner_SkinGacha_Get"))
    end
  end
  if self.WBP_Shop_Recommend_Common_TItle_C_0 and self.WBP_Shop_Recommend_Common_TItle_C_0.Text_MainTitle and self.BannerTab.Text1 then
    self.WBP_Shop_Recommend_Common_TItle_C_0.Text_MainTitle:SetText(GText(self.BannerTab.Text1))
  end
  if self.Text_ActivityDesc_White then
    self.Text_ActivityDesc_White:SetText(GText("UI_Skin_Preview"))
  end
  local bQualityTag = false
  local SkinRarity
  if self.Com_QualityTag and self.BannerTab.PreviewId[1] then
    local SkinInfo = DataMgr.Skin[self.BannerTab.PreviewId[1]]
    if SkinInfo then
      SkinRarity = SkinInfo.Rarity
      self.Com_QualityTag:Init(SkinRarity)
      bQualityTag = true
    end
  end
  if self.WBP_Shop_Recommend_Common_TItle_C_0 and self.WBP_Shop_Recommend_Common_TItle_C_0.Text_MainTitle and SkinRarity then
    local SkinNameFonts = {
      nil,
      nil,
      "Font_Blue",
      "Font_Purple",
      "Font_Gold",
      "Font_Red"
    }
    if SkinNameFonts[SkinRarity] and self.WBP_Shop_Recommend_Common_TItle_C_0[SkinNameFonts[SkinRarity]] then
      self.WBP_Shop_Recommend_Common_TItle_C_0.Text_MainTitle:SetFont(self.WBP_Shop_Recommend_Common_TItle_C_0[SkinNameFonts[SkinRarity]])
    end
  end
  if not bQualityTag then
    self.Com_QualityTag:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:InitActivity_TimeInfo()
  self:AdjustGroupDetail()
end

function M:InitActivity_TimeInfo()
  self:AddTimer(1.0, self.RefreshLeftTime, true, 0, self.RefreshTimerName, true)
  self:RefreshLeftTime()
end

function M:RefreshLeftTime()
  local RemainTimeDict, TimeCount = UIUtils.GetLeftTimeStrStyle2(self.BannerTab.EndTime)
  if RemainTimeDict then
    self.Activity_Time:SetTimeText(GText("UI_Banner_RemainTime"), RemainTimeDict)
  else
    self.Activity_Time:SetForeverTimeText(GText("UI_GameEvent_EventTimeRemain"))
    self:RemoveTimer("RefreshLeftTime")
  end
end

function M:PlayAnimationIn()
  self:PlayAnimation(self.In)
end

function M:PlayAnimationOut()
  self:PlayAnimation(self.Out)
end

return M
