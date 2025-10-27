local WBP_Abyss_Lineup_Character_C = Class("BluePrints.UI.BP_EMUserWidget_C")

function WBP_Abyss_Lineup_Character_C:Construct()
  self.Checked = false
  self.IsEmpty = true
  self.DungeonIndex = -1
  self.Icon_Item = self.Item.Image_Bg
  self.Img_Empty = self.Item.Image_Empty
  self.Img_Quality = self.Item.Image_Quality
  self:SetEmptyIcon()
  self.Img_Quality:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self:BindButtonPerformances()
end

function WBP_Abyss_Lineup_Character_C:Destruct()
  self:UnBindButtonPerformances()
end

function WBP_Abyss_Lineup_Character_C:Init(Name, LineupPage, DungeonIndex)
  self.SlotName = Name
  self.LineupPage = LineupPage
  self.DungeonIndex = DungeonIndex
  self:SetIsChecked(false)
end

function WBP_Abyss_Lineup_Character_C:Update(Content)
  if not Content then
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
  end
  self:SetIcon(Content.GachaIcon)
  self:SetRarity(Content.Rarity)
  self:PlayRefreshAnim()
  if self.CollapsedSlot then
    self.CollapsedSlot:Update(Content)
  end
end

function WBP_Abyss_Lineup_Character_C:SetRarity(Rarity)
  if not Rarity then
    self.Img_Quality:SetVisibility(UE4.ESlateVisibility.Collapsed)
    DebugPrint("lhr@WBP_Abyss_Lineup_Character_C:SetRarity@ \231\168\128\230\156\137\229\186\166\230\151\160\230\149\136")
    return
  end
  self.Img_Quality:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local RarityTexture = self.Item["Img_Quality_" .. Rarity]
  if RarityTexture then
    self.Img_Quality:SetBrushResourceObject(RarityTexture)
  end
end

function WBP_Abyss_Lineup_Character_C:SetIcon(IconPath)
  if not IconPath then
    DebugPrint("lhr@WBP_Abyss_Lineup_Slot_C:SetIcon@ \229\155\190\230\160\135\232\183\175\229\190\132\230\151\160\230\149\136")
    self:SetEmptyIcon()
    return
  end
  local IconDynaMaterial = self.Icon_Item:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetScalarParameterValue("IconMapOpacity", 1)
    IconDynaMaterial:SetTextureParameterValue("IconMap", LoadObject(IconPath))
  end
end

function WBP_Abyss_Lineup_Character_C:SetEmptyIcon()
  local IconDynaMaterial = self.Icon_Item:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetScalarParameterValue("IconMapOpacity", 0)
  end
end

function WBP_Abyss_Lineup_Character_C:Clear()
  if self.IsEmpty then
    return
  end
  self.IsEmpty = true
  local Uuid2SlotMap = self.LineupPage.Uuid2SlotMap
  if Uuid2SlotMap then
    Uuid2SlotMap[self.Uuid] = nil
  end
  self.Uuid = nil
  self:SetEmptyIcon()
  self:PlayRemindAnim()
  if self.CollapsedSlot then
    self.CollapsedSlot:Clear()
  end
  self.Img_Quality:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function WBP_Abyss_Lineup_Character_C:Expand()
end

function WBP_Abyss_Lineup_Character_C:Collapse()
  if not self.IsEmpty and self.CollapsedSlot then
    self.CollapsedSlot:Collapse()
  end
end

function WBP_Abyss_Lineup_Character_C:OnClicked(bNotToList)
  if self.LineupPage then
    self.LineupPage:SlotSelectionChanged(self.SlotName, self.DungeonIndex, not bNotToList)
  else
    DebugPrint("lhr@WBP_Abyss_Lineup_Character_C:OnClicked\239\188\140\233\152\181\229\174\185\233\133\141\231\189\174\231\149\140\233\157\162\229\164\177\230\149\136")
  end
end

function WBP_Abyss_Lineup_Character_C:BindButtonPerformances()
  self.Item.Btn_Click.OnClicked:Add(self, self.OnBtnClicked)
  self.Item.Btn_Click.OnPressed:Add(self, self.OnBtnPressed)
  self.Item.Btn_Click.OnReleased:Add(self, self.OnBtnReleased)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Item.Btn_Click.OnHovered:Add(self, self.OnBtnHovered)
    self.Item.Btn_Click.OnUnhovered:Add(self, self.OnBtnUnhovered)
  end
end

function WBP_Abyss_Lineup_Character_C:UnBindButtonPerformances()
  if not self.Item.Btn_Click then
    return
  end
  self.Item.Btn_Click.OnClicked:Clear()
  self.Item.Btn_Click.OnPressed:Clear()
  self.Item.Btn_Click.OnReleased:Clear()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Item.Btn_Click.OnHovered:Clear()
    self.Item.Btn_Click.OnUnhovered:Clear()
  end
end

function WBP_Abyss_Lineup_Character_C:SwitchNormalAnimation()
  self.Item:StopAllAnimations()
  self.Item:PlayAnimation(self.Item.Normal)
end

function WBP_Abyss_Lineup_Character_C:PlayButtonClickSound()
  if self.IsEmpty then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
  else
    AudioManager(self):PlayUISound(self, "event:/ui/armory/click_select_role", nil, nil)
  end
end

function WBP_Abyss_Lineup_Character_C:PlayButtonClickAnimation()
  self.Item:StopAllAnimations()
  self.Item:PlayAnimation(self.Item.Click)
end

function WBP_Abyss_Lineup_Character_C:OnBtnClicked(bNotPlaySound, bNotToList)
  if self.Checked == false then
    if not bNotPlaySound then
      self:PlayButtonClickSound()
    end
    self:PlayButtonClickAnimation()
  end
  self:OnClicked(bNotToList)
end

function WBP_Abyss_Lineup_Character_C:PlayButtonPressAnim()
  self.Item:StopAllAnimations()
  self.Item:PlayAnimation(self.Item.Press)
end

function WBP_Abyss_Lineup_Character_C:OnBtnPressed()
  if self.Checked == true then
    return
  end
  self.IsPressing = true
  self:PlayButtonPressAnim()
end

function WBP_Abyss_Lineup_Character_C:PlayButtonHoverAnim()
  self.Item:StopAllAnimations()
  self.Item:PlayAnimation(self.Item.Hover)
end

function WBP_Abyss_Lineup_Character_C:OnBtnHovered()
  if self.Checked == true then
    return
  end
  self.IsHovering = true
  self:PlayButtonHoverAnim()
end

function WBP_Abyss_Lineup_Character_C:SetBtnHovered(IsHovered)
  if IsHovered then
    self:OnBtnHovered()
  else
    self:OnBtnUnhovered()
  end
end

function WBP_Abyss_Lineup_Character_C:PlayButtonReleaseButHoverAnim()
  self:PlayButtonHoverAnim()
end

function WBP_Abyss_Lineup_Character_C:PlayButtonReleaseAndUnHoverAnim()
  self:SwitchNormalAnimation()
end

function WBP_Abyss_Lineup_Character_C:OnBtnReleased()
  self.IsPressing = false
  if self.Checked == true then
    return
  end
  if not self.IsHovering then
    self:PlayButtonReleaseAndUnHoverAnim()
  else
    self:PlayButtonReleaseButHoverAnim()
  end
end

function WBP_Abyss_Lineup_Character_C:PlayButtonUnHoverAnim()
  self:SwitchNormalAnimation()
end

function WBP_Abyss_Lineup_Character_C:OnBtnUnhovered()
  self.IsHovering = false
  if self.Checked == true then
    return
  end
  if not self.IsPressing then
    self:PlayButtonUnHoverAnim()
  end
end

function WBP_Abyss_Lineup_Character_C:PlayButtonSelectAnim()
  self.Item:StopAllAnimations()
  self.Item:PlayAnimation(self.Item.Select)
end

function WBP_Abyss_Lineup_Character_C:SetIsChecked(IsChecked)
  if self.Checked == false and true == IsChecked then
    self.Checked = true
    self:PlayButtonSelectAnim()
  elseif self.Checked == true and false == IsChecked then
    self.Checked = false
    self:SwitchNormalAnimation()
  end
  if self.CollapsedSlot then
    self.CollapsedSlot:SetIsChecked(IsChecked)
  end
end

function WBP_Abyss_Lineup_Character_C:PlayRemindAnim()
  self:PlayAnimation(self.Remind)
end

function WBP_Abyss_Lineup_Character_C:PlayRefreshAnim()
  self.Item:StopAllAnimations()
  self.Item:PlayAnimation(self.Item.Refresh)
end

return WBP_Abyss_Lineup_Character_C
