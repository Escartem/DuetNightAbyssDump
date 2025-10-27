local WBP_Abyss_Slot_C = Class("BluePrints.UI.BP_EMUserWidget_C")
local DefaultSoundPath = "event:/ui/common/click_mid"
local SlotName2Type = require("BluePrints.UI.UI_PC.Abyss.WBP_Abyss_Lineup_C").SlotName2Type

function WBP_Abyss_Slot_C:Construct()
  self.Checked = false
  self.CurrentClickIsForbid = false
  self.IsForbidden = false
  self.IsEmpty = true
  self.DungeonIndex = -1
  self.WeaponType = "Melee"
  self:BindButtonPerformances()
  self.Icon_Item:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Abyss_Slot_C:Destruct()
  self:UnBindButtonPerformances()
end

function WBP_Abyss_Slot_C:Init(Name, LineupPage, DungeonIndex, bExpanded)
  self.SlotName = Name
  self.IsExpanded = bExpanded
  self.LineupPage = LineupPage
  self.DungeonIndex = DungeonIndex
  self.IsForbidden = false
  self.CurrentClickIsForbid = false
  self.Icon_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:SetIsChecked(false)
end

function WBP_Abyss_Slot_C:Update(Content)
  if not self:IsContentCompatible(Content) then
    self:Clear()
    return
  end
  self.Uuid = Content.Uuid
  local Uuid2SlotMap = self.LineupPage.Uuid2SlotMap
  if Uuid2SlotMap then
    Uuid2SlotMap[self.Uuid] = {
      SlotName = self.SlotName,
      DungeonIndex = self.DungeonIndex
    }
  end
  if self.IsEmpty then
    self.IsEmpty = false
    self.Icon_Empty:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Icon_Item:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    if self.WeaponSlot then
      self.WeaponSlot:SetForbidden(false)
    end
  end
  self:SetSoundPath(Content.Type)
  self:SetRarity(Content.Rarity)
  self:SetIcon(Content.Icon)
  self:PlaySelectAnim()
end

function WBP_Abyss_Slot_C:IsContentCompatible(Content)
  if not Content then
    return false
  end
  local Type = SlotName2Type[self.SlotName]
  if Content.Type == "Weapon" then
    if "Weapon" == Type then
      return true
    end
    if Type == Content.Tag then
      return true
    end
  elseif Content.Type == Type then
    return true
  end
  return false
end

function WBP_Abyss_Slot_C:SetSoundPath(Type)
  if "Char" == Type then
    self.SoundPath = "event:/ui/armory/click_select_role"
  elseif "Weapon" == Type then
    self.SoundPath = "event:/ui/armory/click_select_weapon"
  elseif "Pet" == Type then
    self.SoundPath = "event:/ui/common/click_select_pet"
  end
end

function WBP_Abyss_Slot_C:SetRarity(Rarity)
  if not Rarity then
    self.Panel_Info:SetVisibility(UE4.ESlateVisibility.Collapsed)
    DebugPrint("lhr@WBP_Abyss_Slot_C:SetRarity@ \231\168\128\230\156\137\229\186\166\230\151\160\230\149\136")
    return
  end
  if self.IsExpanded then
    self.Panel_Info:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  local RarityLight = self["Img_Quality_" .. Rarity]
  if RarityLight then
    self.Bg_Light:SetBrushTintColor(RarityLight)
  end
  local RarityLine = self["Img_Line_" .. Rarity]
  if RarityLine then
    self.Img_Line:SetBrush(RarityLine)
  end
end

function WBP_Abyss_Slot_C:SetIcon(IconPath)
  if not IconPath then
    DebugPrint("lhr@WBP_Abyss_Slot_C:SetIcon@ \229\155\190\230\160\135\232\183\175\229\190\132\230\151\160\230\149\136")
    return
  end
  local IconDynaMaterial = self.Icon_Item:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("IconMap", LoadObject(IconPath))
  end
end

function WBP_Abyss_Slot_C:Clear()
  if self.IsEmpty then
    return false
  end
  self.IsEmpty = true
  local Uuid2SlotMap = self.LineupPage.Uuid2SlotMap
  if Uuid2SlotMap then
    Uuid2SlotMap[self.Uuid] = nil
  end
  self.Uuid = nil
  self.WeaponType = "Melee"
  self.Icon_Item:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Icon_Empty:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:PlayRemindAnim()
  if self.WeaponSlot then
    if nil ~= self.WeaponSlot.Uuid and self.LineupPage.UpdateSingleTeamIcon then
      self.LineupPage:UpdateSingleTeamIcon(self.WeaponSlot.Uuid, false, self.WeaponSlot.WeaponType)
    end
    self.WeaponSlot:Clear()
    self.WeaponSlot:SetForbidden(true)
  end
  self.Panel_Info:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Bg_Light:SetBrushTintColor(self.Img_Quality_0)
  return true
end

function WBP_Abyss_Slot_C:Expand()
  self.IsExpanded = true
  if not self.IsEmpty then
    self.Panel_Info:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_Abyss_Slot_C:Collapse()
  self.IsExpanded = false
  if not self.IsEmpty then
    self.Panel_Info:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Abyss_Slot_C:OnClicked()
  if self.LineupPage then
    self.LineupPage:SlotSelectionChanged(self.SlotName, self.DungeonIndex)
  elseif self.AbyssMenu then
    if self.AbyssMenu.LineupSlot and self.AbyssMenu.LineupSlot ~= self then
      self.AbyssMenu.LineupSlot:StopAllAnimations()
      self.AbyssMenu.LineupSlot:SetIsChecked(false)
    end
    self.AbyssMenu.LineupSlot = self
  else
    DebugPrint("lhr@WBP_Abyss_Slot_C:OnClicked\239\188\140\233\152\181\229\174\185\233\133\141\231\189\174\231\149\140\233\157\162\229\164\177\230\149\136")
  end
end

function WBP_Abyss_Slot_C:OnForbiddenClicked()
  UIManager(GWorld.GameInstance):ShowUITip(UIConst.Tip_CommonToast, GText("Abyss_Sigil_ConditionsAreNot"))
  return
end

function WBP_Abyss_Slot_C:BindButtonPerformances()
  self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Btn_Click.OnReleased:Add(self, self.OnBtnReleased)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
    self.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  end
end

function WBP_Abyss_Slot_C:UnBindButtonPerformances()
  if not self.Btn_Click then
    return
  end
  self.Btn_Click.OnClicked:Clear()
  self.Btn_Click.OnPressed:Clear()
  self.Btn_Click.OnReleased:Clear()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Click.OnHovered:Clear()
    self.Btn_Click.OnUnhovered:Clear()
  end
end

function WBP_Abyss_Slot_C:SwitchNormalAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function WBP_Abyss_Slot_C:PlayButtonClickSound()
  if self.IsEmpty then
    AudioManager(self):PlayUISound(self, DefaultSoundPath, nil, nil)
  else
    AudioManager(self):PlayUISound(self, self.SoundPath or DefaultSoundPath, nil, nil)
  end
end

function WBP_Abyss_Slot_C:PlayButtonClickAnimation()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Click)
end

function WBP_Abyss_Slot_C:OnBtnClicked(bNotPlaySound)
  if self.CurrentClickIsForbid ~= self.IsForbidden then
    return
  end
  if self.IsForbidden == true then
    self:OnForbiddenClicked()
  else
    if self.Checked == false then
      self.Checked = true
      if not bNotPlaySound then
        self:PlayButtonClickSound()
      end
      self:PlayButtonClickAnimation()
    end
    self:OnClicked()
  end
end

function WBP_Abyss_Slot_C:PlayForbiddenButtonPressSound()
  UIUtils.PlayCommonForbiddenBtnSe(self)
end

function WBP_Abyss_Slot_C:PlayButtonPressAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Press)
end

function WBP_Abyss_Slot_C:OnBtnPressed()
  if self.Checked == true then
    return
  end
  if true == self.IsForbidden then
    self.CurrentClickIsForbid = true
    return
  end
  self.CurrentClickIsForbid = false
  self.IsPressing = true
  self:PlayButtonPressAnim()
end

function WBP_Abyss_Slot_C:PlayButtonHoverAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
  self:PlayAnimation(self.Hover)
end

function WBP_Abyss_Slot_C:OnBtnHovered()
  if self.Checked == true then
    return
  end
  if true == self.IsForbidden then
    return
  end
  self.IsHovering = true
  self:PlayButtonHoverAnim()
end

function WBP_Abyss_Slot_C:SetBtnHovered(IsHovered)
  if IsHovered then
    self:OnBtnHovered()
  else
    self:OnBtnUnhovered()
  end
end

function WBP_Abyss_Slot_C:PlayButtonReleaseButHoverAnim()
  self:StopAllAnimations()
  self:PlayButtonHoverAnim()
end

function WBP_Abyss_Slot_C:PlayButtonReleaseAndUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function WBP_Abyss_Slot_C:OnBtnReleased()
  self.IsPressing = false
  if self.Checked == true then
    return
  end
  if true ~= self.IsForbidden and not self.IsHovering then
    self:PlayButtonReleaseAndUnHoverAnim()
  elseif true ~= self.IsForbidden then
    self:PlayButtonReleaseButHoverAnim()
  end
end

function WBP_Abyss_Slot_C:PlayButtonUnHoverAnim()
  self:StopAllAnimations()
  self:SwitchNormalAnimation()
end

function WBP_Abyss_Slot_C:OnBtnUnhovered()
  self.IsHovering = false
  if self.Checked == true then
    return
  end
  if true ~= self.IsForbidden and not self.IsPressing then
    self:PlayButtonUnHoverAnim()
  end
end

function WBP_Abyss_Slot_C:PlayButtonForbidAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Forbidden)
end

function WBP_Abyss_Slot_C:PlayButtonUnForbidAnim()
  self:StopAllAnimations()
  if self.IsHovering then
    self:PlayButtonHoverAnim()
  else
    self:SwitchNormalAnimation()
  end
end

function WBP_Abyss_Slot_C:SetForbidden(IsForbid)
  if true == IsForbid then
    self.IsForbidden = true
    self:PlayButtonForbidAnim()
  else
    self.IsForbidden = false
    self:PlayButtonUnForbidAnim()
  end
end

function WBP_Abyss_Slot_C:SetIsChecked(IsChecked)
  if self.Checked == false and true == IsChecked then
    self.Checked = true
    self:PlayButtonClickAnimation()
  elseif self.Checked == true and false == IsChecked then
    self.Checked = false
    self:SwitchNormalAnimation()
    if self.IsForbidden then
      self:PlayButtonForbidAnim()
    end
  end
end

function WBP_Abyss_Slot_C:PlayRemindAnim()
  self:PlayAnimation(self.Remind)
end

function WBP_Abyss_Slot_C:PlaySelectAnim()
  self:StopAllAnimations()
  self:PlayAnimation(self.Select)
end

return WBP_Abyss_Slot_C
