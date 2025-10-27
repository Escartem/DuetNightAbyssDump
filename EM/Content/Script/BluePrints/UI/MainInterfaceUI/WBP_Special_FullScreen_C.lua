require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Super.Construct(self)
  self.Common_Text.Common_Text:SetText(GText("UI_GACHA_NEXT"))
  self.Text_New:SetText(GText("UI_NEW_WEAPON"))
  self.Text_Skip:SetText(GText("UI_GACHA_SKIP"))
  self.Btn_Skip.OnClicked:Add(self, self.OnBtnSkipClicked)
end

function M:ShowWeaponTips(WeaponId, IsTenTimes, IsNew, LastUI)
  if nil ~= IsTenTimes then
    self.LoadMode = "Gacha"
  else
    self.LoadMode = "GetWeaponInBattle"
  end
  self.Parent = LastUI
  self:SetFocus()
  self:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.bShow = false
  self.IsGachaTenTimes = IsTenTimes
  if self.IsGachaTenTimes then
    self.Btn_Skip:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Btn_Skip:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  local WeaponInfo = DataMgr.Weapon[WeaponId]
  if not WeaponInfo then
    return
  end
  self:PlayAnimation(self.Fade_In)
  if IsNew then
    self.Text_New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Text_New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  local ImagePath = WeaponInfo.BigIcon
  if nil == string.find(ImagePath, "/Game/") then
    ImagePath = "/Game/" .. ImagePath
  end
  local ResourceObject = LoadObject(ImagePath)
  self.Icon_Weapom:SetBrushResourceObject(ResourceObject)
  local MaterialInstance_b = self.Icon_Weapom_b:GetDynamicMaterial()
  MaterialInstance_b:SetTextureParameterValue("Base", ResourceObject)
  local MaterialInstance_s = self.Icon_Weapom_S:GetDynamicMaterial()
  MaterialInstance_s:SetTextureParameterValue("Base", ResourceObject)
  self.Text_Name:SetText(GText(WeaponInfo.WeaponName))
  for i = 1, 5 do
    if self["Img_Star0" .. tostring(i)] then
      if i <= WeaponInfo.WeaponRarity then
        self["Img_Star0" .. tostring(i)]:SetVisibility(ESlateVisibility.Visible)
      else
        self["Img_Star0" .. tostring(i)]:SetVisibility(ESlateVisibility.Collapsed)
      end
    end
  end
  self.Common_Text:PlayAnimation(self.Common_Text.Loop, 0, 0)
end

function M:OnBtnSkipClicked()
  self.Parent:OnBtnSkipClicked()
end

function M:OnClickClose()
  if not self.bShow then
    return
  end
  if self.LoadMode == "Gacha" and self.IsGachaTenTimes then
    if self.IsGachaTenTimes then
      local GachaMain = UIManager(self):GetUI("GachaMain")
      local GachaOnceUI = GachaMain.GachaOnceUI
      GachaOnceUI:RefreshGachaOnceUI()
    end
    return
  end
  if self:IsAnimationPlaying(self.Fade_Out) then
    return
  end
  self:PlayAnimation(self.Fade_Out, 0, 1, EUMGSequencePlayMode.Forward, 1, true)
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Fade_Out then
    if self.LoadMode == "Gacha" then
      if self.IsGachaTenTimes then
        local GachaMain = UIManager(self):GetUI("GachaMain")
        local GachaOnceUI = GachaMain.GachaOnceUI
        GachaOnceUI:RefreshGachaOnceUI()
        return
      end
      self:SetVisibility(UE4.ESlateVisibility.Collapsed)
      return
    elseif self.LoadMode == "GetWeaponInBattle" then
      self:Close()
    end
  else
    self.bShow = true
  end
end

return M
