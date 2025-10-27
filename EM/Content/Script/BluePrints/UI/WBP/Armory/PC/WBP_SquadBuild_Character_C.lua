local ModController = require("BluePrints.UI.WBP.Armory.Mod.Utils.ModController")
require("UnLua")
local WBP_Build_Character_P_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function WBP_Build_Character_P_C:Construct()
  self:InitBtn()
  self.ItemInfo = nil
  self.Item:BindToAnimationFinished(self.Item.Click, {
    self,
    function()
      self.Item:PlayAnimation(self.Item.Select)
    end
  })
end

function WBP_Build_Character_P_C:InitSlot(Params)
  self.Params = Params
  self.Owner = Params.Owner
  self.Uuid = Params.Uuid
  self.Id = Params.Id
  self.ModSuit = Params.ModSuit
  self.Type = Params.Type
  self.Rarity = Params.Rarity
  self.IsEmpty = true
  if self.Uuid == "" or self.Uuid == nil then
    self.IsEmpty = true
  else
    self.IsEmpty = false
  end
  self:UpdateListItemState(Params.ItemInfo)
  self:ChangeRoleModel()
  self:SetTitleName()
  self:UpdateIcon()
  self:GetRarityAndSetRarity()
  self:AddDelelteIcon()
  self:UpdateCurSquadInfo()
  self.Item:Init({Owner = self})
end

function WBP_Build_Character_P_C:PlayRefreshAnimation()
  if not self.IsEmpty then
    self.Item:PlayAnimation(self.Item.Refresh)
  end
end

function WBP_Build_Character_P_C:AddDelelteIcon()
  if self.Uuid and self.Id and self.Owner.IsInEditor then
    self.Minus.Btn_Minus.Button_Area.OnClicked:Clear()
    self.Minus.Btn_Minus.Button_Area.OnClicked:Add(self, self.ClearSlot)
    self:SwitchDeleteIconVisible()
  else
    self.Minus.Btn_Minus.Button_Area.OnClicked:Clear()
    self.Minus:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Build_Character_P_C:SwitchDeleteIconVisible()
  if self.Owner.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Minus:SetVisibility(ESlateVisibility.HitTestInvisible)
  else
    self.Minus:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_Build_Character_P_C:ShowListItemStateOnce(CurItemInfo)
  if CurItemInfo then
    CurItemInfo.SelfWidget:SetInGear(true)
  end
end

function WBP_Build_Character_P_C:UpdateListItemState(CurItemInfo)
  if self.ItemInfo then
    self.ItemInfo.IsSelected = false
    if self.ItemInfo.SelfWidget then
      self.ItemInfo.SelfWidget:SetInGear(self.ItemInfo.IsSelected)
    end
  end
  self.ItemInfo = CurItemInfo
  if CurItemInfo then
    self.ItemInfo.IsSelected = true
    if self.ItemInfo.SelfWidget then
      self.ItemInfo.SelfWidget:SetInGear(self.ItemInfo.IsSelected)
    end
  end
end

function WBP_Build_Character_P_C:ClearItemFlag()
  if self.ItemInfo then
    self.ItemInfo.IsSelected = false
    if self.ItemInfo.SelfWidget then
      self.ItemInfo.SelfWidget:SetWeaponMiniPhantomIcon()
      self.ItemInfo.SelfWidget:SetInGear(self.ItemInfo.IsSelected)
    end
  end
end

function WBP_Build_Character_P_C:GetRarityAndSetRarity()
  if not self.Id then
    self.Item.Image_Quality:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  self.Item.Image_Quality:SetVisibility(ESlateVisibility.Visible)
  local CharInfo = DataMgr.Char[self.Id]
  if CharInfo then
    self.Rarity = CharInfo.CharRarity
    self:SetItemRarity()
  end
end

function WBP_Build_Character_P_C:SetItemRarity()
  if self.Rarity then
    self.Item.Image_Quality:SetBrushResourceObject(self.Item["Img_Quality_" .. self.Rarity])
  else
    self.Item.Image_Quality:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Build_Character_P_C:ChangeRoleModel()
  if self.Id and self.Uuid then
    self.Owner.ActorController:ChangeCharModel({
      CharId = self.Id,
      Uuid = self.Uuid
    })
    self.Owner.ActorController:FixedCameraTransTimeOnce(0)
    self.Owner.ActorController:SetMontageAndCamera(CommonConst.ArmoryType.Char, nil)
    self.Owner.ActorController:HidePlayerActor("SuqadRole", false)
  else
    self.Owner.ActorController:HidePlayerActor("SuqadRole", true)
  end
end

function WBP_Build_Character_P_C:UpdateCurSquadInfo()
  self.Owner:UpdateCurSquadInfo("Char", self.Uuid or "")
  self.Owner:UpdateCurSquadInfo("ModSuit", self.ModSuit or 0)
end

function WBP_Build_Character_P_C:UpdateListItemEquipped()
  if not self.ItemInfo then
    self.ItemInfo = self.Params.ItemInfo
    if self.ItemInfo and self.ItemInfo.UI then
      self.ItemInfo.UI.Rarity = self.ItemInfo.Rarity
      self.ItemInfo.UI:SetPhantomIconInWeaponItem()
      self.ItemInfo.UI:SetIsEquipped(true)
    end
  else
    if self.ItemInfo and self.ItemInfo.UI then
      self.ItemInfo.UI.Rarity = self.ItemInfo.Rarity
      self.ItemInfo.UI:SetIsEquipped(false)
      self.ItemInfo.UI:SetPhantomIconInWeaponItem()
    end
    self.ItemInfo = self.Params.ItemInfo
    if self.ItemInfo and self.ItemInfo.UI then
      self.ItemInfo.UI.Rarity = self.ItemInfo.Rarity
      self.ItemInfo.UI:SetPhantomIconInWeaponItem()
      self.ItemInfo.UI:SetIsEquipped(true)
    end
  end
end

function WBP_Build_Character_P_C:GetItemId()
  return self.Uuid
end

function WBP_Build_Character_P_C:GetIsEmpty()
  return self.IsEmpty
end

function WBP_Build_Character_P_C:GetParams()
  return self.Params
end

function WBP_Build_Character_P_C:OnClickCallback()
  if self.Id then
    AudioManager(self):PlayUISound(nil, "event:/ui/armory/click_select_role", nil, nil)
  else
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
  end
  if self.Owner.IsInClickCD then
    DebugPrint("thy    InClickCD")
    return
  end
  if self.IsClicking then
    self.Owner:FocusOnItemList()
    return
  end
  self.IsClicking = true
  self.Item:PlayAnimation(self.Item.Click)
  self.MyClickCD = self.Owner.ClickCD
  self.AlreadyRemoved = false
  self.Owner.IsInClickCD = true
  self:AddTimer(0.05, function()
    self.MyClickCD = math.max(self.MyClickCD - 0.05, 0)
    if 0 == self.MyClickCD and not self.AlreadyRemoved then
      self.Owner.IsInClickCD = false
      self.AlreadyRemoved = true
      self:RemoveTimer("ClickCD")
      return
    end
  end, true, 0, "ClickCD", true)
  self.Owner:SwitchToSelectItemList(self, self.Type)
  self.Owner.List_Build:SetEmptyText(GText("UI_Armory_Char_Empty"))
  self.Item:PlayAnimation(self.Item.Click)
end

function WBP_Build_Character_P_C:ClearSlot()
  local Params = {
    Owner = self.Owner,
    Type = self.Type
  }
  self.IsEmpty = true
  if self.ItemInfo and self.ItemInfo.SelfWidget then
    self.ItemInfo.SelfWidget:SetInGear(false)
  end
  self.ItemInfo = nil
  self:InitSlot(Params)
end

function WBP_Build_Character_P_C:PlayNormalAnimation()
  self.Item:PlayAnimation(self.Item.Normal)
end

function WBP_Build_Character_P_C:UpdateIcon()
  self.Item.Image_Bg:SetVisibility(ESlateVisibility.Visible)
  if not self.Id then
    self.Item.Image_Empty:SetVisibility(ESlateVisibility.Visible)
    self.Item.Image_Bg:GetDynamicMaterial():SetScalarParameterValue("IconMapOpacity", 0)
    return
  end
  self.Item.Image_Bg:GetDynamicMaterial():SetScalarParameterValue("IconMapOpacity", 1)
  local IconPath = DataMgr.Char[self.Id].GUIPathVariable
  self:SetImage(IconPath)
end

function WBP_Build_Character_P_C:SetModTextBgVisbile(bShow)
  local DynamciMaterial = self.Item.Image_Bg:GetDynamicMaterial()
  if DynamciMaterial then
    DynamciMaterial:SetScalarParameterValue("TextBGOpacity", bShow and self.Item.TaskBG_Opacity or 0)
  end
end

function WBP_Build_Character_P_C:SetTitleName()
  if not self.Uuid then
    self.Text_Name:SetVisibility(ESlateVisibility.Collapsed)
    self:SetModTextBgVisbile(false)
    return
  end
  self.Text_Name:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:SetModTextBgVisbile(true)
  ModController:SyncTarget(self.Uuid)
  local SuitName = ModController:GetModel():GetSuitName(self.ModSuit)
  self.Text_Name:SetText(SuitName)
end

function WBP_Build_Character_P_C:SetImage(ImgShortPath, ImgLongPath)
  local ImgPath, Img
  if ImgShortPath then
    local FixPath = "Texture2D'/Game/UI/Texture/Dynamic/Image/Gacha/Avatar/T_Gacha_Avatar%s.T_Gacha_Avatar%s'"
    local ReplaceKey = string.gsub(ImgShortPath, " ", "_")
    ImgPath = string.format(FixPath, ReplaceKey, ReplaceKey)
    Img = LoadObject(ImgPath)
    if not IsValid(Img) then
      ImgPath = UIUtils.UtilsGetKeyIconPathInGamepad(ImgShortPath)
      Img = LoadObject(ImgPath)
    end
  else
    Img = LoadObject(ImgLongPath)
  end
  if not IsValid(Img) then
    DebugPrint("\231\188\186\229\176\145\229\155\190\231\137\135\232\181\132\230\186\144: ImgPath = " .. ImgPath)
    return
  end
  local IconDynaMaterial = self.Item.Image_Bg:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("IconMap", Img)
    self.Item.Image_Bg:SetVisibility(ESlateVisibility.Visible)
    self.Item.Image_Empty:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Build_Character_P_C:InitBtn()
  self.Item.Btn_Click.OnClicked:Add(self, function()
    self:OnBtnClickClicked()
  end)
  self.Item.Btn_Click.OnPressed:Add(self, function()
    self:OnBtnClickPressed()
  end)
  self.Item.Btn_Click.OnHovered:Add(self, function()
    self:OnBtnClickHovered()
  end)
  self.Item.Btn_Click.OnUnhovered:Add(self, function()
    self:OnBtnClickUnhovered()
  end)
  self:PlayAnimation(self.Item.Normal)
end

function WBP_Build_Character_P_C:OnBtnClickClicked()
  if self.OnClickCallback then
    self:OnClickCallback()
  end
end

function WBP_Build_Character_P_C:OnBtnClickPressed()
  if self.IsClicking then
    return
  end
  self.Item:PlayAnimation(self.Item.Press)
end

function WBP_Build_Character_P_C:OnBtnClickHovered()
  if self.IsClicking then
    return
  end
  self.Item:PlayAnimation(self.Item.Hover)
end

function WBP_Build_Character_P_C:OnBtnClickUnhovered()
  if self.IsClicking then
    return
  end
  self.Item:PlayAnimation(self.Item.UnHover)
end

function WBP_Build_Character_P_C:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.Owner.IsInEditor then
    if self.Owner.CurFocusSlot and self.Owner.CurFocusSlot.Uuid then
      self.Owner:InitBottomTab(false, 3)
    else
      self.Owner:InitBottomTab(false, 2)
    end
  end
  return true
end

return WBP_Build_Character_P_C
