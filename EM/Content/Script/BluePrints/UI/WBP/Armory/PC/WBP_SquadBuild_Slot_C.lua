local ModController = require("BluePrints.UI.WBP.Armory.Mod.Utils.ModController")
require("UnLua")
local WBP_Build_Slot_P_C = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr",
  "BluePrints.Common.DelayFrameComponent"
})

function WBP_Build_Slot_P_C:Construct()
  self:InitBtn()
  self.ItemInfo = nil
  self.Item:BindToAnimationFinished(self.Item.Click, {
    self,
    function()
      self.Item:PlayAnimation(self.Item.Select)
    end
  })
end

function WBP_Build_Slot_P_C:InitSlot(Params)
  self.Params = Params
  self.Owner = Params.Owner
  self.Uuid = Params.Uuid
  self.Id = Params.Id
  self.Type = Params.Type or "Melee"
  self.ModSuit = Params.ModSuit
  self.Num = Params.Num
  self.Rarity = Params.Rarity
  self.IsEmpty = true
  self.IsAddSquad = Params.IsAddSquad
  if self.Uuid == "" or self.Uuid == nil then
    self.IsEmpty = true
  else
    self.IsEmpty = false
  end
  self:CheckIsPhantomWeapon()
  self:UpdateListItemState(Params.ItemInfo)
  self:CheckIsNeedLackState()
  self:SetTitleName()
  self:UpdateIcon()
  self:GetItemRarity()
  self:CheckIsColorfulPet()
  self:UpdateCurSquadInfo()
  self:AddDelelteIcon()
  self:CheckClick()
  self.Item:Init({Owner = self})
end

function WBP_Build_Slot_P_C:PlayRefreshAnimation()
  if not self.IsEmpty then
    self.Item:PlayAnimation(self.Item.Refresh)
  end
end

function WBP_Build_Slot_P_C:AddDelelteIcon()
  if self.Uuid and self.Id and self.Owner.IsInEditor then
    self.Minus.Btn_Minus.Button_Area.OnClicked:Clear()
    self.Minus.Btn_Minus.Button_Area.OnClicked:Add(self, self.ClearSlot)
    self:SwitchDeleteIconVisible()
  else
    self.Minus.Btn_Minus.Button_Area.OnClicked:Clear()
    self.Minus:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Build_Slot_P_C:CheckIsColorfulPet()
  if not (self.Uuid and self.Id) or not self.Item.VX_Colorful then
    self.Item.VX_Colorful:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  if self.Type == "Pet" then
    local Premium = DataMgr.Pet[self.Id].Premium
    DebugPrint("thy   CheckIsColorfulPet: Premium", Premium)
    if Premium and 1 == Premium then
      self.Item.VX_Colorful:SetVisibility(ESlateVisibility.Visible)
    else
      self.Item.VX_Colorful:SetVisibility(ESlateVisibility.Collapsed)
    end
  else
    self.Item.VX_Colorful:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Build_Slot_P_C:UpdateListItemState(CurItemInfo)
  if CurItemInfo and self.ItemInfo and self.ItemInfo.Uuid == CurItemInfo.Uuid then
    return
  end
  self.ItemInfo = CurItemInfo
  if CurItemInfo then
    self.ItemInfo.IsSelected = true
    if self.ItemInfo.SelfWidget then
      if self.IsPhantomWeapon then
        self.ItemInfo.SelfWidget:SetWeaponMiniPhantomIcon(self.WeaponOnwerWidget.Id)
      else
        self.ItemInfo.SelfWidget:SetInGear(self.ItemInfo.IsSelected)
      end
    end
  end
end

function WBP_Build_Slot_P_C:ClearItemFlag()
  if self.ItemInfo then
    self.ItemInfo.IsSelected = false
    if self.ItemInfo.SelfWidget then
      self.ItemInfo.SelfWidget:SetWeaponMiniPhantomIcon()
      self.ItemInfo.SelfWidget:SetInGear(self.ItemInfo.IsSelected)
    end
  end
end

function WBP_Build_Slot_P_C:ShowListItemStateOnce(CurItemInfo)
  if CurItemInfo then
    if self.IsPhantomWeapon then
      CurItemInfo.SelfWidget:SetWeaponMiniPhantomIcon(self.WeaponOnwerWidget.Id)
    else
      CurItemInfo.SelfWidget:SetInGear(true)
    end
  end
end

function WBP_Build_Slot_P_C:CheckClick()
  if self.IsClicking then
    self.Item:PlayAnimation(self.Item.Select)
  else
    self.Item:PlayAnimation(self.Item.Normal)
  end
end

function WBP_Build_Slot_P_C:UpdateCurSquadInfo()
  if self.IsPhantomWeapon and self.Num then
    self.Owner:UpdateCurSquadInfo("PhantomWeapon" .. self.Num, self.Uuid or "")
  elseif self.Type == "Char" then
    self.Owner:UpdateCurSquadInfo("Phantom" .. string.sub(self:GetName(), -1), self.Uuid or "")
  elseif self.Type == "Pet" then
    self.Owner:UpdateCurSquadInfo("Pet", self.Uuid or 0)
  elseif self.Type == "Melee" then
    self.Owner:UpdateCurSquadInfo("MeleeWeapon", self.Uuid or "")
    self.Owner:UpdateCurSquadInfo("MeleeWeaponModSuit", self.ModSuit or 0)
  elseif self.Type == "Ranged" then
    self.Owner:UpdateCurSquadInfo("RangedWeapon", self.Uuid or "")
    self.Owner:UpdateCurSquadInfo("RangedWeaponModSuit", self.ModSuit or 0)
  end
end

function WBP_Build_Slot_P_C:GetItemRarity()
  if not self.Id then
    self.Item.Image_Quality:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  if self.Type == "Char" then
    local CharInfo = DataMgr.Char[self.Id]
    if CharInfo then
      return self:SetItemRarity(CharInfo.CharRarity)
    end
  elseif self.Type == "Pet" then
    local PetInfo = DataMgr.Pet[self.Id]
    if PetInfo then
      self.Text_Name:SetVisibility(ESlateVisibility.Collapsed)
      self:SetModTextBgVisbile(false)
      return self:SetItemRarity(PetInfo.Rarity)
    end
  else
    local WeaponInfo = DataMgr.Weapon[self.Id]
    if WeaponInfo then
      return self:SetItemRarity(WeaponInfo.WeaponRarity)
    end
  end
end

function WBP_Build_Slot_P_C:SetItemRarity(Rarity)
  if Rarity then
    self.Item.Image_Quality:SetVisibility(ESlateVisibility.Visible)
    self.Item.Image_Quality:SetBrushResourceObject(self.Item["Img_Quality_" .. Rarity])
  else
    self.Item.Image_Quality:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Build_Slot_P_C:CheckIsNeedLackState()
  if self.Owner.IsInEditor or self.IsAddSquad then
    self.Panel_Lack_Phantom:SetVisibility(ESlateVisibility.Collapsed)
    self.Panel_Lack:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  if self.IsPhantomWeapon and self.WeaponOnwerWidget then
    if self.WeaponOnwerWidget.Id or self.WeaponOnwerWidget.Uuid then
      if not self.Uuid or not self.Id then
        self.Panel_Lack_Phantom:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
        self.Text_Lack_Phantom:SetText(GText("UI_Squad_UnessentialMiss_Tips"))
      else
        self.Panel_Lack_Phantom:SetVisibility(ESlateVisibility.Collapsed)
      end
    else
      self.Panel_Lack_Phantom:SetVisibility(ESlateVisibility.Collapsed)
    end
  elseif self.Owner.PlayerForceSlot[self:GetName()] then
    if not self.Uuid or not self.Id then
      self.Panel_Lack:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Text_Lack:SetText(GText("UI_Squad_EssentialMiss_Tips"))
    else
      self.Panel_Lack:SetVisibility(ESlateVisibility.Collapsed)
    end
  end
end

function WBP_Build_Slot_P_C:WeakClearSlotInfo()
  self.Uuid = nil
  self.Id = nil
end

function WBP_Build_Slot_P_C:PlayNormalAnimation()
  self.Item:PlayAnimation(self.Item.Normal)
end

function WBP_Build_Slot_P_C:GetParams()
  return self.Params
end

function WBP_Build_Slot_P_C:ClearSlot(IsAddSquad)
  local Params = {
    Owner = self.Owner,
    Type = self.Type,
    IsAddSquad = IsAddSquad
  }
  self.IsEmpty = true
  if self.ItemInfo and self.ItemInfo.SelfWidget then
    self.ItemInfo.SelfWidget:SetInGear(false)
    self.ItemInfo.SelfWidget:SetWeaponMiniPhantomIcon()
  end
  self.ItemInfo = nil
  self:InitSlot(Params)
  if self:GetName() == "Head_Phantom01" then
    self.Owner.PhantomSlot.Weapon_Phantom01:ClearSlot(IsAddSquad)
  elseif self:GetName() == "Head_Phantom02" then
    self.Owner.PhantomSlot.Weapon_Phantom02:ClearSlot(IsAddSquad)
  end
end

function WBP_Build_Slot_P_C:CheckIsPhantomWeapon()
  self.IsPhantomWeapon, self.Num = self:IsSubstringContained(self:GetName(), "Weapon_Phantom")
  if self.IsPhantomWeapon then
    self.WeaponOnwerWidget = self.Owner["Head_Phantom0" .. self.Num]
  end
end

function WBP_Build_Slot_P_C:IsSubstringContained(parentStr, subStr)
  local startPos, endPos = string.find(parentStr, subStr)
  if nil ~= startPos then
    return nil ~= startPos, string.sub(parentStr, -1)
  end
  return nil, nil
end

function WBP_Build_Slot_P_C:PlaySound()
  if self:GetName() == "Head_Phantom01" or self:GetName() == "Head_Phantom02" then
    if self.Id then
      AudioManager(self):PlayUISound(nil, "event:/ui/armory/click_select_role", nil, nil)
    else
      AudioManager(self):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
    end
  elseif self:GetName() == "Pet" then
    if self.Id then
      AudioManager(self):PlayUISound(nil, "event:/ui/common/click_select_pet", nil, nil)
    else
      AudioManager(self):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
    end
  elseif self.Id then
    AudioManager(self):PlayUISound(nil, "event:/ui/armory/click_select_weapon", nil, nil)
  else
    AudioManager(self):PlayUISound(nil, "event:/ui/common/click_mid", nil, nil)
  end
end

function WBP_Build_Slot_P_C:OnClickCallback()
  self:PlaySound()
  if self.Owner.IsInClickCD then
    DebugPrint("thy    InClickCD")
    return
  end
  if self.IsClicking then
    self.Owner:FocusOnItemList()
    return
  end
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
  if self.IsPhantomWeapon then
    if not self.WeaponOnwerWidget.Id then
      self.WeaponOnwerWidget.Item:PlayAnimation(self.WeaponOnwerWidget.Item.FlashRed)
      self.Item:StopAllAnimations()
      self.Item:PlayAnimation(self.Item.Hover)
      UIManager(self):ShowUITip("CommonToastMain", GText("UI_Squad_SigilMiss_Toast"))
      return
    end
    self.Owner:PhantomWeaponTypeChanged(self.Type)
  else
    self.Owner:PhantomWeaponTypeChanged()
  end
  if self.Type == "Pet" then
    self.Owner.List_Build:SetEmptyText(GText("UI_Armory_Pet_Empty"))
  elseif self.Type == "Char" then
    self.Owner.List_Build:SetEmptyText(GText("UI_Armory_Char_Empty"))
  else
    self.Owner.List_Build:SetEmptyText(GText("UI_Armory_Weapon_Empty"))
  end
  self.Owner:SwitchToSelectItemList(self, self.Type)
  self:CheckIsNeedLackState()
  self.IsClicking = true
  self.Item:PlayAnimation(self.Item.Click)
end

function WBP_Build_Slot_P_C:UpdateIcon()
  self.Item.Image_Bg:SetVisibility(ESlateVisibility.Visible)
  self.Item.Image_Empty:SetVisibility(ESlateVisibility.Collapsed)
  if not (self.Uuid ~= "" and 0 ~= self.Uuid and self.Uuid) or self.Type == "Pet" and not self:GetPetId() then
    self.Item.Image_Empty:SetVisibility(ESlateVisibility.Visible)
    self.Item.Image_Bg:GetDynamicMaterial():SetScalarParameterValue("IconMapOpacity", 0)
    return
  end
  local IconPath
  if self.Type == "Char" and self.Id then
    IconPath = DataMgr.Char[self.Id].GUIPathVariable
  elseif self.Type == "Pet" and self.Uuid then
    IconPath = "Texture2D'" .. DataMgr.Pet[self:GetPetId()].Icon .. "'"
    self:SetImage(nil, IconPath)
    return
  elseif self.Id then
    IconPath = DataMgr.Weapon[self.Id].GUIPathVariableName
    if not IconPath then
      return
    end
    IconPath = DataMgr.Weapon[self.Id].GUIPathVariableType .. "_" .. IconPath
  end
  if IconPath then
    self:SetImage(IconPath)
  end
end

function WBP_Build_Slot_P_C:GetPetId()
  if self.Owner.Avatar and self.Owner.Avatar.Pets[self.Uuid] then
    return self.Owner.Avatar.Pets[self.Uuid].Props.PetId
  end
end

function WBP_Build_Slot_P_C:SetModTextBgVisbile(bShow)
  local DynamciMaterial = self.Item.Image_Bg:GetDynamicMaterial()
  if DynamciMaterial then
    DynamciMaterial:SetScalarParameterValue("TextBGOpacity", bShow and self.Item.TaskBG_Opacity or 0)
  end
end

function WBP_Build_Slot_P_C:SwitchDeleteIconVisible()
  if self.Owner.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Minus:SetVisibility(ESlateVisibility.HitTestInvisible)
  else
    self.Minus:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_Build_Slot_P_C:SetTitleName()
  if not self.Uuid or not self.Id then
    self.Panel_Text:SetVisibility(ESlateVisibility.Collapsed)
    self:SetModTextBgVisbile(false)
    return
  end
  if self.Owner.PhantomSlot[self:GetName()] then
    self.Panel_Text:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_Name:SetVisibility(ESlateVisibility.Collapsed)
    self:SetModTextBgVisbile(false)
    return
  else
    self.Text_Name:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:SetModTextBgVisbile(true)
  end
  if not self.Owner:CheckSlotTypeIsAboutMainRole(self) then
    self.Panel_Text:SetVisibility(ESlateVisibility.Collapsed)
    self:SetModTextBgVisbile(false)
    return
  end
  if not self.ModSuit then
    self.Panel_Text:SetVisibility(ESlateVisibility.Collapsed)
    self:SetModTextBgVisbile(false)
    return
  end
  self.Panel_Text:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:SetModTextBgVisbile(true)
  ModController:SyncTarget(self.Uuid)
  local SuitName = ModController:GetModel():GetSuitName(self.ModSuit)
  self.Text_Name:SetText(SuitName)
end

function WBP_Build_Slot_P_C:GetItemId()
  return self.Uuid
end

function WBP_Build_Slot_P_C:GetIsEmpty()
  return self.IsEmpty
end

function WBP_Build_Slot_P_C:SetImage(ImgShortPath, ImgLongPath)
  local ImgPath, Img
  local FixPath = ""
  if ImgShortPath then
    if self.Type == "Char" then
      FixPath = "Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Avatar/T_Head_%s.T_Head_%s'"
    else
      FixPath = "Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Weapon/T_Head_%s.T_Head_%s'"
    end
    local ReplaceKey = string.gsub(ImgShortPath, " ", "_")
    ImgPath = string.format(FixPath, ReplaceKey, ReplaceKey)
    Img = LoadObject(ImgPath)
    if not IsValid(Img) and self._GetCurrentGamepadName then
      ImgPath = UIUtils.UtilsGetKeyIconPathInGamepad(ImgShortPath, self:_GetCurrentGamepadName())
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
    IconDynaMaterial:SetScalarParameterValue("IconMapOpacity", 1)
  end
end

function WBP_Build_Slot_P_C:InitBtn()
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
end

function WBP_Build_Slot_P_C:OnBtnClickClicked()
  if self.OnClickCallback then
    self:OnClickCallback()
  end
end

function WBP_Build_Slot_P_C:OnBtnClickPressed()
  if self.IsClicking then
    return
  end
  self.Item:PlayAnimation(self.Item.Press)
end

function WBP_Build_Slot_P_C:OnBtnClickHovered()
  if self.IsClicking then
    return
  end
  self.Item:PlayAnimation(self.Item.Hover)
end

function WBP_Build_Slot_P_C:OnBtnClickUnhovered()
  if self.IsClicking then
    return
  end
  self.Item:PlayAnimation(self.Item.UnHover)
end

function WBP_Build_Slot_P_C:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.Owner.IsInEditor then
    if self.Owner.CurFocusSlot and self.Owner.CurFocusSlot.Uuid and 0 ~= self.Owner.CurFocusSlot.Uuid then
      self.Owner:InitBottomTab(false, 3)
    else
      self.Owner:InitBottomTab(false, 2)
    end
  end
  return true
end

return WBP_Build_Slot_P_C
