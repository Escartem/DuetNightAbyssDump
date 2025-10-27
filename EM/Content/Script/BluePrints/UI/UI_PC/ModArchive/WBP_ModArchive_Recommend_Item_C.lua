require("UnLua")
local WBP_ModArchive_Recommend_Item_C = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.DelayFrameComponent"
})

function WBP_ModArchive_Recommend_Item_C:Construct()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
end

function WBP_ModArchive_Recommend_Item_C:OnListItemObjectSet(ListItemObject)
  ListItemObject.SelfWidget = self
  self.Info = ListItemObject
  self.Owner = self.Info.Owner
  self:PlayAnimation(self.In)
  self.Btn_Build:SetText(GText("UI_GameEvent_EventPortal_Goto"))
  self.Avatar = GWorld:GetAvatar()
  self.Btn_Build:ForbidBtn(false)
  self.Btn_Build:UnBindEventOnClicked(self, self.OnClickJumpTo)
  self.Btn_Build:BindEventOnClicked(self, self.OnClickJumpTo)
  self.Owner:UpdateListWidgets(self)
  self:RefreshList()
  self.List_RecommendMod:DisableScroll(true)
end

function WBP_ModArchive_Recommend_Item_C:RefreshList()
  self:InitGroupInfo()
  self:InitListMod()
end

function WBP_ModArchive_Recommend_Item_C:InitGroupInfo()
  self.TargetInfo = {}
  if self.Info.TargetType == "Char" then
    self.Image_Head:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Image_Weapon:SetVisibility(ESlateVisibility.Collapsed)
    self.TargetInfo = DataMgr.Char[self.Info.TargetId]
    local Path = self.TargetInfo.EscMenuBg
    local IconDynaMaterial = self.Image_Head:GetDynamicMaterial()
    if IconDynaMaterial then
      IconDynaMaterial:SetTextureParameterValue("IconMap", LoadObject(Path))
    end
    self.Text_Title:SetText(GText(self.TargetInfo.CharName))
  elseif self.Info.TargetType == "Weapon" then
    self.Image_Head:SetVisibility(ESlateVisibility.Collapsed)
    self.Image_Weapon:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.TargetInfo = DataMgr.Weapon[self.Info.TargetId]
    local Type = self.TargetInfo.GUIPathVariableType
    local Name = self.TargetInfo.GUIPathVariableName
    local Path = "/Game/UI/Texture/Dynamic/Image/Menu/Weapon/T_Menu_" .. Type .. "_" .. Name
    local IconDynaMaterial = self.Image_Weapon:GetDynamicMaterial()
    if IconDynaMaterial then
      local Texture = LoadObject(Path)
      if Texture then
        IconDynaMaterial:SetTextureParameterValue("IconMap", Texture)
      end
    end
    self.Text_Title:SetText(GText(self.TargetInfo.WeaponName))
  end
end

function WBP_ModArchive_Recommend_Item_C:InitListMod()
  self.Mods = {}
  self.List_RecommendMod:ClearListItems()
  for i = 1, #self.Info.ModList do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Owner = self
    Content.Index = i
    Content.ItemType = "Mod"
    Content.ModId = self.Info.ModList[i]
    if self.Info.DesList and self.Info.DesList[i] then
      Content.Des = self.Info.DesList[i]
    end
    Content.HasMod = self.Info.Owner.ModStates[self.Info.ModList[i]]
    self.List_RecommendMod:AddItem(Content)
  end
  self.Btn_Build:SetGamePadImg("X")
  self.Btn_Build:SetGamePadVisibility(ESlateVisibility.Collapsed)
end

function WBP_ModArchive_Recommend_Item_C:OnClickJumpTo()
  DebugPrint("zwkk \232\183\179\232\189\172\239\188\159 ", self.Info.InterfaceJumpId)
  PageJumpUtils:JumpToTargetPageByJumpId(self.Info.InterfaceJumpId)
end

function WBP_ModArchive_Recommend_Item_C:OnClickForbidden()
  if self.Info.TargetType == "Char" then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("\230\178\161\230\156\137\229\189\147\229\137\141\232\167\146\232\137\178111"))
  elseif self.Info.TargetType == "Weapon" then
    UIManager(self):ShowUITip(UIConst.Tip_CommonTop, GText("\230\178\161\230\156\137\229\189\147\229\137\141\230\173\166\229\153\168111"))
  end
end

function WBP_ModArchive_Recommend_Item_C:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    DebugPrint("11122233 OnFocusReceived", self:GetName())
    self.Image_Select:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Image_Head:SetRenderOpacity(1.0)
    self.Image_Weapon:SetRenderOpacity(1.0)
    self.Btn_Build:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:AddDelayFrameFunc(function()
      if self.Owner.SelectingModItem then
        self.List_RecommendMod:SetFocus()
        self.List_RecommendMod:SetSelectedIndex(0)
        self.Owner:OnGamepadEnterKeyDown()
      else
        self.Owner.Owner:HideTabKey(false)
      end
    end, 1, "CheckShouldEnterMod")
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function WBP_ModArchive_Recommend_Item_C:OnFocusLost(InFocusEvent)
  if not self:HasFocusedDescendants() then
    DebugPrint("11122233 OnFocusLost", self:GetName())
    if self.Image_Select then
      self.Image_Select:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.Image_Head:SetRenderOpacity(0.8)
    self.Image_Weapon:SetRenderOpacity(0.8)
    self.Btn_Build:SetGamePadVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_ModArchive_Recommend_Item_C:SetGamepadBtnState(Show)
  if Show then
    self.Btn_Build:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Btn_Build:SetGamePadVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_ModArchive_Recommend_Item_C:OnSelected()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    DebugPrint("11122233 Item\233\128\137\228\184\173", self:GetName())
    self.Image_Select:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Image_Head:SetRenderOpacity(1.0)
    self.Image_Weapon:SetRenderOpacity(1.0)
    self.Btn_Build:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.List_RecommendMod:SetFocus()
    self.List_RecommendMod:SetSelectedIndex(0)
    self.InSelect = true
  end
end

function WBP_ModArchive_Recommend_Item_C:OnDeSelected()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    DebugPrint("11122233 OnDeSelected", self:GetName())
    self.Image_Select:SetVisibility(ESlateVisibility.Collapsed)
    self.Image_Head:SetRenderOpacity(0.8)
    self.Image_Weapon:SetRenderOpacity(0.8)
    self.Btn_Build:SetGamePadVisibility(ESlateVisibility.Collapsed)
    self.InSelect = false
  end
end

function WBP_ModArchive_Recommend_Item_C:OnRemovedFromFocusPath(InFocusEvent)
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return
  end
  if self.Owner.SelectingModItem then
    self.Image_Select:SetVisibility(ESlateVisibility.Collapsed)
    self.Image_Head:SetRenderOpacity(0.8)
    self.Image_Weapon:SetRenderOpacity(0.8)
    self.Btn_Build:SetGamePadVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_ModArchive_Recommend_Item_C:OnMenuOpenChanged(bIsOpen)
  self.HasTipsOpen = bIsOpen
  DebugPrint("zwjki ", self.Owner:GetName())
  self.Owner:OnMenuOpenChanged(bIsOpen)
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    return
  end
  if not (self.Owner and self.Owner.CurWidget) or self.Owner.CurWidget ~= self then
    return
  end
  if bIsOpen then
    self.Btn_Build:SetGamePadVisibility(ESlateVisibility.Collapsed)
  else
    self.Btn_Build:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_ModArchive_Recommend_Item_C:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    DebugPrint("zwk    Key_IsGamepadKey", InKeyName)
    IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
  else
    DebugPrint("zwk    Key_IsPC", InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_ModArchive_Recommend_Item_C:Handle_OnPCDown(InKeyName)
end

function WBP_ModArchive_Recommend_Item_C:Handle_OnGamePadDown(InKeyName)
  DebugPrint("zwkkk  Handle_OnGamePadDown", InKeyName, self:GetName())
  if "Gamepad_DPad_Up" == InKeyName or "Gamepad_LeftStick_Up" == InKeyName then
    return true
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    if self.Owner and self.Info and not self.HasTipsOpen then
      self.Owner:OnGamepadReturnKeyDown(self.Info.Index)
    end
    return true
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    if not self.XInPress then
      self.XInPress = true
      self.Btn_Build:PlayAnimation(self.Btn_Build.Press)
    end
    return true
  end
  return false
end

function WBP_ModArchive_Recommend_Item_C:OnKeyUp(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:Handle_OnGamePadUp(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_ModArchive_Recommend_Item_C:Handle_OnGamePadUp(InKeyName)
  DebugPrint("zwkkk  Handle_OnGamePadUp", InKeyName, self:GetName())
  if "Gamepad_FaceButton_Bottom" == InKeyName then
    self:OnSelected()
    self.Owner:OnGamepadEnterKeyDown()
    return true
  elseif "Gamepad_FaceButton_Left" == InKeyName then
    if self.XInPress then
      self.XInPress = false
      self.Btn_Build:StopAllAnimations()
      self.Btn_Build:PlayAnimation(self.Btn_Build.Normal)
      self:OnClickJumpTo()
    end
    return true
  end
  return false
end

function WBP_ModArchive_Recommend_Item_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("zwkkk   RefreshOpInfoByInputDevice ", CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self:UpdateOnInputDeviceTypeChange()
end

function WBP_ModArchive_Recommend_Item_C:UpdateOnInputDeviceTypeChange()
  DebugPrint("zwzwzwk ", self.CurInputDeviceType)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    if self:HasAnyUserFocus() then
      self.Image_Select:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.Image_Head:SetRenderOpacity(1.0)
      self.Image_Weapon:SetRenderOpacity(1.0)
      self.Btn_Build:SetGamePadVisibility(ESlateVisibility.SelfHitTestInvisible)
      self.List_RecommendMod:SetFocus()
      self.List_RecommendMod:SetSelectedIndex(0)
    else
      self:AddDelayFrameFunc(function()
        self.Image_Select:SetVisibility(ESlateVisibility.Collapsed)
        self.Image_Head:SetRenderOpacity(0.8)
        self.Image_Weapon:SetRenderOpacity(0.8)
        self.Btn_Build:SetGamePadVisibility(ESlateVisibility.Collapsed)
      end, 1, "CollapseBtn")
    end
  elseif self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    DebugPrint("zwzwzwk ")
    if self.Image_Select then
      self.Image_Select:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.Image_Head:SetRenderOpacity(0.8)
    self.Image_Weapon:SetRenderOpacity(0.8)
    self.Btn_Build:SetGamePadVisibility(ESlateVisibility.Collapsed)
  end
end

return WBP_ModArchive_Recommend_Item_C
