require("UnLua")
local WBP_ModArchive_Recommend_SubItem_C = Class({
  "BluePrints.UI.BP_UIState_C"
})

function WBP_ModArchive_Recommend_SubItem_C:Construct()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
end

function WBP_ModArchive_Recommend_SubItem_C:OnListItemObjectSet(ListItemObject)
  ListItemObject.SelfWidget = self
  self.Content = ListItemObject
  self.Owner = self.Content.Owner
  self.Content.IsShowTips = false
  self.Content.IsSelect = false
  self.HB_ArchiveSuit:SetVisibility(ESlateVisibility.Collapsed)
  self:CheckState()
  self.ItemDetails_MenuAnchor.ParentWidget = self
  self:InitModInfo()
  self.ItemDetails_MenuAnchor:CloseItemDetailsWidget(true)
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
end

function WBP_ModArchive_Recommend_SubItem_C:CheckState()
  self.LockState = 1
  local ArchiveId = DataMgr.RecommendModId2ArchiveId[self.Content.ModId]
  if not ArchiveId then
    return
  end
  local Avatar = GWorld:GetAvatar()
  local ShowCondition = DataMgr.ModGuideBookArchive[ArchiveId].ShowCondition
  local UnlockCondition = DataMgr.ModGuideBookArchive[ArchiveId].UnlockCondition
  if Avatar then
    if ShowCondition and not ConditionUtils.CheckCondition(Avatar, ShowCondition) then
      self.LockState = 2
      self.HB_ArchiveSuit:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Text_ArchiveSuitNum:SetText(GText(DataMgr.Condition[ShowCondition].ConditionText))
    elseif UnlockCondition and not ConditionUtils.CheckCondition(Avatar, UnlockCondition) then
      self.LockState = 3
      self.HB_ArchiveSuit:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Text_ArchiveSuitNum:SetText(GText(DataMgr.Condition[UnlockCondition].ConditionText))
    end
  end
end

function WBP_ModArchive_Recommend_SubItem_C:InitModInfo()
  self.ModData = DataMgr.Mod[self.Content.ModId]
  self.Text_Title:SetText(GText(self.ModData.Name))
  if self.Content.Des then
    self.Text_Desc:SetText(GText(self.Content.Des))
  else
    self.Text_Desc:SetVisibility(ESlateVisibility.Collapsed)
  end
  if not self.Content.HasMod then
    self.Group_DontHave:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_DontHave:SetText(GText("UI_Mod_Not_Get"))
  else
    self.Group_DontHave:SetVisibility(ESlateVisibility.Collapsed)
  end
  local Content = {
    Id = self.Content.ModId,
    Rarity = self.ModData.Rarity,
    Icon = self.ModData.Icon,
    NotInteractive = true,
    ItemType = "Mod"
  }
  if 2 == self.LockState then
    Content.Icon = "/Game/UI/Texture/Dynamic/Atlas/Prop/Mod/T_ModArchive_Unrevealed.T_ModArchive_Unrevealed"
  end
  self.Item:Init(Content)
  if not self.Content.HasMod or 1 ~= self.LockState then
    self.Item.WS:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Item.WS:SetActiveWidgetIndex(0)
  else
    self.Item.WS:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_ModArchive_Recommend_SubItem_C:OnMenuOpenChanged(bIsOpen)
  if not bIsOpen and self.CurInputDeviceType == ECommonInputType.Gamepad then
    DebugPrint("zw456789 ")
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
  end
  if self.Owner then
    DebugPrint("zwjkjk Owner Name ", self.Owner:GetName())
    self.Owner:OnMenuOpenChanged(bIsOpen)
  end
end

function WBP_ModArchive_Recommend_SubItem_C:OnFocusReceived(MyGeometry, InFocusEvent)
  DebugPrint("zw456789 OnFocusReceived", self:GetName())
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:StopAllAnimations()
    self:PlayAnimation(self.Hover)
  end
end

function WBP_ModArchive_Recommend_SubItem_C:OnFocusLost(InFocusEvent)
  DebugPrint("zw456789 OnFocusLost", self:GetName())
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:StopAllAnimations()
    self:PlayAnimation(self.Normal)
  end
end

function WBP_ModArchive_Recommend_SubItem_C:OnMouseEnter(MyGeometry, MouseEvent)
  DebugPrint("zwjk11 OnMouseEnter", self:GetName())
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if self.Content.IsSelect or self.Content.IsShowTips then
    return
  end
  if self.CurInputDeviceType == ECommonInputType.Gamepad and not self:HasAnyUserFocus() then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.Hover)
end

function WBP_ModArchive_Recommend_SubItem_C:OnMouseLeave(MyGeometry, MouseEvent)
  DebugPrint("zwjk11 OnMouseLeave", self:GetName())
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if self.Content.IsSelect or self.Content.IsShowTips then
    return
  end
  if self.CurInputDeviceType == ECommonInputType.Gamepad and not self:HasAnyUserFocus() then
    return
  end
  self:StopAllAnimations()
  self:PlayAnimation(self.UnHover)
end

function WBP_ModArchive_Recommend_SubItem_C:OnTouchEnded(MyGeometry, TouchEvent)
  DebugPrint("zwjk OnTouchEnded")
  return self:OnMouseButtonUp(MyGeometry, TouchEvent)
end

function WBP_ModArchive_Recommend_SubItem_C:OnTouchStarted(MyGeometry, TouchEvent)
  DebugPrint("zwjk OnTouchStarted")
  return self:OnMouseButtonDown(MyGeometry, TouchEvent)
end

function WBP_ModArchive_Recommend_SubItem_C:OnMouseButtonDown(MyGeometry, MouseEvent)
  DebugPrint("zwjk OnMouseButtonDown")
  if self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen() or self.Content.IsSelect or self.Content.IsShowTips then
    return UWidgetBlueprintLibrary.Handled()
  end
  self:StopAllAnimations()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self:PlayAnimation(self.Press)
  end
  return UWidgetBlueprintLibrary.Handled()
end

function WBP_ModArchive_Recommend_SubItem_C:OnMouseButtonUp(MyGeometry, MouseEvent)
  DebugPrint("zwjk OnMouseButtonUp")
  if self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor:IsOpen() or self.Content.IsSelect or self.Content.IsShowTips then
    return UWidgetBlueprintLibrary.Unhandled()
  end
  local Content = {
    ItemType = self.Content.ItemType,
    ItemId = self.Content.ModId,
    MenuPlacement = self.MenuPlacement
  }
  if 2 ~= self.LockState then
    self.ItemDetails_MenuAnchor:OpenItemDetailsWidget(false, Content)
    self.Content.IsShowTips = true
    self.Content.IsSelect = true
    self:StopAllAnimations()
    self:PlayAnimation(self.Click)
  end
  AudioManager(self):PlayItemSound(self, self.Content.ModId, "Click", self.Content.ItemType)
  return UWidgetBlueprintLibrary.Unhandled()
end

function WBP_ModArchive_Recommend_SubItem_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("zwkkk   RefreshOpInfoByInputDevice ", CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
end

function WBP_ModArchive_Recommend_SubItem_C:Destruct()
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
  WBP_ModArchive_Recommend_SubItem_C.Super.Destruct(self)
end

return WBP_ModArchive_Recommend_SubItem_C
