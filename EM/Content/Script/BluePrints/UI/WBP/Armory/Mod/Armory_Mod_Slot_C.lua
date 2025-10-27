require("UnLua")
local ArmoryUtils = require("BluePrints.UI.WBP.Armory.ArmoryUtils")
local NonePolarity = CommonConst.NonePolarity
local ModModel = ModController:GetModel()
local Handled = UE.UWidgetBlueprintLibrary.Handled()
local UnHandled = UE.UWidgetBlueprintLibrary.UnHandled()
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self.bClickBegin = false
  self.LinkWidgets = {}
  self.ActiveLinkWidgets = {}
  self.ExtraScale = 1
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, function(self, bOpen)
    UIManager(self):SetIsMenuAnchorOpen(bOpen)
  end)
  if ModController:IsMobile() then
    self.ItemDetails_MenuAnchor.bIsFocusable = true
  end
end

function M:Destruct()
  self.bClickBegin = false
  self:UnbindAllFromAnimationFinished(self.UnHover)
  self:CloseLinkLine()
  for _, LinkWidget in ipairs(self.LinkWidgets) do
    LinkWidget:RemoveFromParent()
  end
  self.LinkWidgets = {}
  for _, LinkWidget in ipairs(self.ActiveLinkWidgets) do
    LinkWidget:RemoveFromParent()
  end
  self.ActiveLinkWidgets = {}
  self.ItemDetails_MenuAnchor:ClearSetup()
  self.ItemDetails_MenuAnchor.ItemDetailsMenuAnchor.OnMenuOpenChanged:Clear()
end

function M:ResetUI()
  self.Img_NoneHint:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Quality_Bar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Select:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.List_ModStar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Icon_Mod:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Polarity:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.HB_ModName:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_Polarity:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Icon_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.WidgetSwitcher_State:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_RightPolarity:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Num_Volume:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Text_ModPolarity:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Text_Mod_Lv:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Text_Num:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.ItemDetails_MenuAnchor:ClearSetup()
  self.ItemDetails_MenuAnchor:ClearMenuOpenChangedListen()
  self:SetRenderOpacity(1)
end

function M:_IsSelected()
  local SelectedStuff = ModModel:GetSelectStuff()
  if not SelectedStuff then
    return false
  end
  return SelectedStuff.SlotId == self.SlotUIData.SlotId
end

function M:SetCallbacks(Callbacks)
  self.OnDragCancelCallback = Callbacks.OnDragCancelCallback
  self.OnDropCallback = Callbacks.OnDropCallback
  self.OnDragEnterCallback = Callbacks.OnDragEnterCallback
  self.OnDragLeaveCallback = Callbacks.OnDragLeaveCallback
  self.OnDragDetectedCallback = Callbacks.OnDragDetectedCallback
  self.OnRemovedFromFocusPathCallback = Callbacks.OnRemovedFromFocusPathCallback
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  if self.OnRemovedFromFocusPathCallback then
    self.OnRemovedFromFocusPathCallback(self, InFocusEvent)
  end
  if ModController:IsGamepad() then
    self.ItemDetails_MenuAnchor:CloseItemDetailsWidget()
  end
end

function M:UpdateSlotUI(SlotUIData)
  self.SlotUIData = SlotUIData
  self.ModContent = nil
  self:ResetUI()
  self:UpdatePolarity(SlotUIData)
  if self:_IsSelected() then
    self:PlayBtnAnimation(self.Click)
  else
    self:PlayNormalAnim()
  end
  if SlotUIData:InState(ModCommon.SlotState.Lock) then
    self:UpdateSlotUILock()
  end
  if SlotUIData:InState(ModCommon.SlotState.Used) then
    self:UpdateSlotUIUsed(SlotUIData)
  end
  if SlotUIData:InState(ModCommon.SlotState.UnLock) then
    self:UpdateSlotUIUnlock()
  end
  if SlotUIData:InState(ModCommon.SlotState.PolarityEdit) then
    self:UpdateSlotUIPolarityEdit(SlotUIData)
  end
  self:CloseLinkLine()
end

function M:UpdateSlotUIUnlock()
end

function M:UpdateSlotUILock()
  self.Icon_Lock:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  if ModModel:IsInPolarityEditMode() then
  end
  if self.Lock then
    self:PlayAnimation(self.Lock)
  end
end

function M:SetModIcon(Mod)
  self.Icon_Mod:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  UResourceLibrary.LoadObjectAsync(self, Mod.Icon, {
    self,
    function(_, Icon)
      if not Icon then
        Icon = LoadObject("Texture2D'/Game/UI/Texture/Dynamic/Image/Head/Monster/T_Head_Empty.T_Head_Empty'")
        DebugPrint(ErrorTag, string.format("Mod%s\230\178\161\230\156\137\233\133\141\231\189\174\229\155\190\230\160\135\230\136\150\232\128\133\231\148\168\233\148\153\229\155\190\230\160\135\232\183\175\229\190\132\228\186\134\239\188\129\239\188\129\239\188\129\232\191\153\233\135\140\231\148\168\233\187\152\232\174\164\231\154\132\229\155\190\230\160\135\233\161\182\228\184\128\228\184\139\n \232\161\168\233\135\140\233\133\141\231\154\132\233\148\153\232\183\175\229\190\132\230\152\175\239\188\154%s", Mod.ModId, Mod.Icon))
      end
      self.Icon_Mod:SetBrushResourceObject(Icon)
    end
  })
end

function M:UpdateSlotUIUsed(SlotUIData)
  local Mod = SlotUIData:GetMod()
  if not Mod then
    return
  end
  self:SetModIcon(Mod)
  self.HB_ModName:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Text_ModName:SetText(GText(Mod:Data().Name))
  if Mod.Level > 0 then
    self.Text_Mod_Lv:SetText("+" .. Mod.Level)
  else
    self.Text_Mod_Lv:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  if Mod.MaxLevel == Mod.Level and SlotUIData.bOverCost then
    local Mat = self.Text_Mod_Lv:GetDynamicFontMaterial()
    Mat:SetScalarParameterValue("FinalPower", 1.0)
    Mat = self.Text_ModName:GetDynamicFontMaterial()
    Mat:SetScalarParameterValue("FinalPower", 1.0)
  else
    local Mat = self.Text_Mod_Lv:GetDynamicFontMaterial()
    Mat:SetScalarParameterValue("FinalPower", 0)
    Mat = self.Text_ModName:GetDynamicFontMaterial()
    Mat:SetScalarParameterValue("FinalPower", 0)
    if SlotUIData.bOverCost then
      self.Img_NoneHint:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  end
  if Mod:HasCardLevel() then
    self.List_ModStar:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.List_ModStar:ClearListItems()
    for i = 1, Mod.ModCardLevelMax do
      local StarContent = NewObject(UIUtils.GetCommonItemContentClass())
      StarContent.Idx = i
      StarContent.bActivate = i <= Mod.CurrentModCardLevel
      StarContent.bGolden = false
      self.List_ModStar:AddItem(StarContent)
    end
  end
  self.Quality_Bar:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  local RarityImgPath
  local Rarity = Mod.Rarity
  if SlotUIData.SlotId == ModCommon.MaxSlotCount then
    RarityImgPath = DataMgr.ModRarity[Rarity].MidSlotBg
  else
    RarityImgPath = DataMgr.ModRarity[Rarity].LRSlotBg
  end
  UResourceLibrary.LoadObjectAsync(self, RarityImgPath, {
    self,
    function(_, Icon)
      self.Quality_Bar:SetBrushResourceObject(Icon)
    end
  })
  self.ModContent = ModModel:CreateModContent(Mod)
  self.ModContent.IsShowDetails = true
  self.ModContent.MenuPlacement = ModCommon.SlotIdToMenuPlacement[SlotUIData.SlotId]
  self.ItemDetails_MenuAnchor:InitializeSetUp(self, self.ModContent, true)
  self.ItemDetails_MenuAnchor:SetRevertShear(true)
  ArmoryUtils:SetReddotRead(self.ModContent, true)
  if SlotUIData.bEquiping then
    self:PlayScanlineAnim(Mod.Rarity)
    SlotUIData.bEquiping = false
  end
  if SlotUIData.bNotOwned then
    self.Img_NoneHint:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:UpdateSlotUIPolarityEdit(SlotUIData)
  if SlotUIData:InState(ModCommon.SlotState.Lock) then
    return
  end
  self.ItemDetails_MenuAnchor:SetAllowHover(false)
  self.Text_Num:SetText(SlotUIData:GetSlotIdStr())
  self.Text_Num:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Icon_Mod:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if SlotUIData:IsPolarityDirty() then
    self.Panel_Select:SetVisibility(UIConst.VisibilityOp.Visible)
    local Polarity = SlotUIData:GetPolarity()
    if Polarity ~= CommonConst.NonePolarity then
      self.Text_Polarity:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      self.Text_Polarity:SetText(ModModel:GetPolarityText(Polarity))
    end
  end
end

function M:UpdatePolarity(SlotUIData, bTrick)
  if SlotUIData:GetCost() > 0 then
    self.Num_Volume:SetText(SlotUIData:GetCost())
  elseif ModModel:IsModUuidValid(SlotUIData.ModEid) then
    self.Num_Volume:SetText(0)
  else
    self.Num_Volume:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:SetPolarityColor(self.PolarityNormal)
  local Polarity = SlotUIData.UIPolarity
  if SlotUIData.PolarityState == ModCommon.SlotPolarityState.BothNoPolarity then
    self:UpdatePolarityBothNoPolarity(SlotUIData, Polarity, bTrick)
  elseif SlotUIData.PolarityState == ModCommon.SlotPolarityState.ModNoPolarity then
    self:UpdatePolarityModNoPolarity(SlotUIData, Polarity)
  elseif SlotUIData.PolarityState == ModCommon.SlotPolarityState.SlotNoPolarity then
    self:UpdatePolaritySlotNoPolarity(SlotUIData, Polarity)
  elseif SlotUIData.PolarityState == ModCommon.SlotPolarityState.Match then
    self:UpdatePolarityMatch(SlotUIData, Polarity)
  elseif SlotUIData.PolarityState == ModCommon.SlotPolarityState.NoMatch then
    self:UpdatePolarityNoMatch(SlotUIData, Polarity)
  end
end

function M:UpdatePolarityBothNoPolarity(SlotUIData, Polarity, bTrick)
  if SlotUIData:InState(ModCommon.SlotState.PolarityEdit) and not bTrick then
    local EditPolarity = SlotUIData.EditPolarity
    SlotUIData:SetPolarity(Polarity)
    self:UpdatePolarity(SlotUIData, true)
    SlotUIData:SetPolarity(EditPolarity)
  else
    self.Text_ModPolarity:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if SlotUIData:GetCost() <= 0 then
      self.Panel_Polarity:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
end

function M:UpdatePolarityModNoPolarity(SlotUIData, Polarity)
  local Mod = SlotUIData:GetMod()
  if Mod then
    self.Text_ModPolarity:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if Mod.Polarity ~= CommonConst.NonePolarity then
      self.Panel_RightPolarity:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
    self.Mod_RightPolarity:SetText(SlotUIData:GetPolarityText(Polarity))
  elseif Polarity ~= NonePolarity then
    self.Text_ModPolarity:SetText(SlotUIData:GetPolarityText(Polarity))
  else
    self.Panel_Polarity:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:UpdatePolaritySlotNoPolarity(SlotUIData, Polarity)
  local Mod = SlotUIData:GetMod()
  self.Text_ModPolarity:SetText(ModModel:GetPolarityText(Mod.Polarity))
  if SlotUIData:InState(ModCommon.SlotState.PolarityEdit) and Polarity ~= NonePolarity then
    self.Panel_RightPolarity:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Mod_RightPolarity:SetText(SlotUIData:GetPolarityText(Polarity))
  end
end

function M:UpdatePolarityMatch(SlotUIData, Polarity)
  local Mod = SlotUIData:GetMod()
  self.Text_ModPolarity:SetText(ModModel:GetPolarityText(Mod.Polarity))
  self:SetPolarityColor(self.PolarityGreen)
  if SlotUIData:InState(ModCommon.SlotState.PolarityEdit) and Polarity ~= NonePolarity then
    self.Panel_RightPolarity:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Mod_RightPolarity:SetText(SlotUIData:GetPolarityText(Polarity))
  end
end

function M:UpdatePolarityNoMatch(SlotUIData, Polarity)
  local Mod = SlotUIData:GetMod()
  self.Text_ModPolarity:SetText(ModModel:GetPolarityText(Mod.Polarity))
  self:SetPolarityColor(self.PolarityRed)
  if Polarity ~= NonePolarity then
    self.Panel_RightPolarity:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Mod_RightPolarity:SetText(SlotUIData:GetPolarityText(Polarity))
  end
end

function M:SetPolarityColor(Color)
  self.Bg_Polarity:SetColorAndOpacity(Color.SpecifiedColor)
  self.Bg_Polarity:SetOpacity(Color.SpecifiedColor.A * 0.3)
  self.Num_Volume:SetColorAndOpacity(Color)
  self.Text_ModPolarity:SetColorAndOpacity(Color)
  self.Text_ModPolarity:SetOpacity(Color.SpecifiedColor.A * 0.8)
end

function M:OnMouseButtonDown(MyGeometry, MouseEvent)
  if self.SlotUIData:InState(ModCommon.SlotState.Lock) then
    return UnHandled
  end
  if self.SlotUIData.ModEid == nil and ModModel:IsModUIPreview() then
    return UnHandled
  end
  local LocalHandle = UnHandled
  if MouseEvent then
    LocalHandle = UE.UWidgetBlueprintLibrary.DetectDragIfPressed(MouseEvent, self, UE.EKeys.LeftMouseButton)
    if not ModModel:IsModUINormal() then
      LocalHandle = UnHandled
    end
  end
  self.bClickBegin = true
  if self:_IsSelected() then
    return LocalHandle
  end
  self:PlayBtnAnimation(self.Press)
  return LocalHandle
end

function M:OnMouseButtonUp(MyGeometry, MouseEvent)
  CommonUtils:CloseGuideTouchIfExist(self)
  if self.SlotUIData:InState(ModCommon.SlotState.Lock) then
    ModController:WarningTipsWhileSlotLock(self.SlotUIData)
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_select_lock", nil, nil)
    return UnHandled
  end
  self.ItemDetails_MenuAnchor:SetAllowHover(false)
  self.ItemDetails_MenuAnchor:CloseItemDetailsWidget(true)
  if self.SlotUIData.ModEid == nil and ModModel:IsModUIPreview() then
    return UnHandled
  end
  if not self.bClickBegin then
    return Handled
  end
  self.bClickBegin = false
  self:PlayBtnAnimation(self.Click)
  self:StopScanlineAnim()
  local Mod = self.SlotUIData:GetMod()
  if not Mod then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click", nil, nil)
  else
    AudioManager(self):PlayItemSound(self, Mod.ModId, "Click", "Mod")
    AudioManager(self):PlayUISound(self, "event:/ui/armory/tip_show", nil, nil)
  end
  local MouseKey = UKismetInputLibrary.PointerEvent_GetEffectingButton(MouseEvent)
  if MouseKey == UE4.EKeys.LeftMouseButton then
    if self.SlotUIData:InState(ModCommon.SlotState.PolarityEdit) and self:_IsSelected() then
      if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
        return Handled
      end
      ModController:SetSelectedStuff(nil, nil)
    else
      ModController:SetSelectedStuff(self.SlotUIData.ModEid, self.SlotUIData.SlotId)
    end
  elseif MouseKey == UE.EKeys.RightMouseButton then
    if Mod and ModModel:IsModUINormal() then
      ModController:SendTakeOffMod(ModModel:GetTarget(), self.SlotUIData.SlotId)
    end
  elseif nil == MyGeometry and nil == MouseEvent then
    if self.SlotUIData:InState(ModCommon.SlotState.PolarityEdit) and self:_IsSelected() then
      ModController:SetSelectedStuff(nil, nil)
    else
      ModController:SetSelectedStuff(self.SlotUIData.ModEid, self.SlotUIData.SlotId)
    end
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    return self.Parent:HandleGamepadModSlotSelection(self.SlotUIData)
  end
  return Handled
end

function M:OnMouseEnter(MyGeometry, InKeyEvent)
  if self.SlotUIData:InState(ModCommon.SlotState.Lock) then
    return
  end
  if not self:_IsSelected() and ModController:IsPC() then
    self:PlayBtnAnimation(self.Hover)
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Parent.LastSelectedItem = self
    if not ModModel:GetGamePadSelectedStuff() then
      if self.SlotUIData:InState(ModCommon.SlotState.Lock) then
        return
      end
      self.ItemDetails_MenuAnchor:SetAllowHover(false)
      self.ItemDetails_MenuAnchor:CloseItemDetailsWidget(true)
      if self.SlotUIData.ModEid == nil and ModModel:IsModUIPreview() then
        return
      end
      local Mod = self.SlotUIData:GetMod()
      if Mod then
        ModController:SetSelectedStuff(self.SlotUIData.ModEid, self.SlotUIData.SlotId)
        self.Parent:SetKeySelectModGamePad(GText("UI_CTL_Replace_Mod"))
      else
        ModController:SetSelectedStuff(nil, self.SlotUIData.SlotId)
        self.Parent:SetKeySelectModGamePad(GText("UI_CTL_Choose_Mod"))
      end
    else
      if ModModel:GetSelectStuff() then
        self:ChangeSlotOutlines(ModModel:GetSelectStuff().ModUuid)
      end
      local GamepadSelectedStuff = ModModel:GetGamePadSelectedStuff()
      local Mod = self.SlotUIData:GetMod()
      if not Mod then
        self.Parent:SetKeySelectModGamePad(GText("UI_CTL_Input_Slot"))
      else
        self.ItemDetails_MenuAnchor:SetConfirmDesc(GText("UI_CTL_Replace_SelectedMod"))
      end
      local Case = ModCommon.CalcVolumeDiffCase.Change
      local Param1 = self.SlotUIData.SlotId
      local Param2 = GamepadSelectedStuff.ModUuid
      local _, CostDiff = ModModel:CalcModVolumeDiff(Case, ModModel:GetTarget(), Param1, Param2)
      self.Parent:SetModCostPreview(CostDiff + self.Parent.CachedCost, false, Param2)
    end
  end
end

function M:OnMouseLeave(MyGeometry, InKeyEvent)
  if self.SlotUIData:InState(ModCommon.SlotState.Lock) then
    return
  end
  if not self:_IsSelected() and ModController:IsPC() then
    self:PlayBtnAnimation(self.UnHover)
    self:UnbindAllFromAnimationFinished(self.UnHover)
    self:BindToAnimationFinished(self.UnHover, {
      self,
      function(self)
        self:PlayAnimation(self.Normal)
      end
    })
  end
  self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Parent:SetKeySelectModGamePad(nil)
    self.ItemDetails_MenuAnchor:SetConfirmDesc(nil)
    self.Parent:UpdateCostUI(self.Parent.CachedCost)
  end
end

function M:StopBtnAnimation()
  self:StopAnimation(self.Normal)
  self:StopAnimation(self.Hover)
  self:StopAnimation(self.Click)
  self:StopAnimation(self.Press)
  self:StopAnimation(self.UnHover)
end

function M:StopScanlineAnim()
  self:StopAnimation(self.ScanLine_Gray)
  self:StopAnimation(self.ScanLine_Green)
  self:StopAnimation(self.ScanLine_Blue)
  self:StopAnimation(self.ScanLine_Purple)
  self:StopAnimation(self.ScanLine_Golden)
end

function M:PlayBtnAnimation(Anim)
  self:StopBtnAnimation()
  self.WidgetSwitcher_State:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:PlayAnimation(Anim)
  if Anim == self.Click then
    self:PlaySelectedAnim(true)
  end
end

function M:PlayRefresh()
  self:PlayAnimation(self.Refresh)
end

function M:PlayConflictVX()
  self:PlayAnimation(self.Mod_Clash)
end

function M:PlayScanlineAnim(Rarity)
  self:StopAnimation(self.Normal)
  if 1 == Rarity then
    self:PlayAnimation(self.ScanLine_Gray)
  elseif 2 == Rarity then
    self:PlayAnimation(self.ScanLine_Green)
  elseif 3 == Rarity then
    self:PlayAnimation(self.ScanLine_Blue)
  elseif 4 == Rarity then
    self:PlayAnimation(self.ScanLine_Purple)
  elseif 5 == Rarity then
    self:PlayAnimation(self.ScanLine_Golden)
  end
  if self.ProgressRefresh then
    self:PlayAnimation(self.ProgressRefresh)
  end
end

function M:InitAsDragUI(ModUuid)
  self.LinkWidgets = {}
  self.ActiveLinkWidgets = {}
  if not ModUuid then
    return
  end
  local Mod = ModModel:GetMod(ModUuid)
  if not Mod then
    return
  end
  local ParentWidget = self.Icon_Mod:GetParent()
  for i = 0, ParentWidget:GetChildrenCount() - 1 do
    local Widget = ParentWidget:GetChildAt(i)
    Widget:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:SetModIcon(Mod)
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.ExtraScale = 0.8
  self:SetRenderScale(FVector2D(self.ExtraScale, self.ExtraScale))
end

function M:OnDragDetected(MyGeometry, PointerEvent)
  if ModModel:IsInPolarityEditMode() then
    return nil
  end
  if not self.SlotUIData.ModEid then
    return nil
  end
  self.bClickBegin = false
  ModController:SetSelectedStuff(nil, nil)
  local DragDropOperation = NewObject(UIUtils.GetCommonDragDropOperationClass())
  local DragUI = ModController:CreateDragUI(self.SlotUIData.ModEid)
  DragDropOperation.DefaultDragVisual = DragUI
  DragDropOperation.Pivot = UE.EDragPivot.CenterCenter
  DragDropOperation.InSlotUIData = self.SlotUIData
  DragDropOperation.Tag = "ArmoryModSlot"
  DragDropOperation.Payload = self.ModContent
  if self.OnDragDetectedCallback then
    self.OnDragDetectedCallback(self, PointerEvent, DragDropOperation)
  end
  return DragDropOperation
end

function M:OnDragEnter(MyGeometry, PointerEvent, Operation)
  if Operation.Tag ~= "ArmoryModSlot" and Operation.Tag ~= "WBP_Com_Item_Universal_L_C" then
    return
  end
  if self.SlotUIData:InState(ModCommon.SlotState.Lock) then
    return
  end
  local InSlotUIData = Operation.InSlotUIData
  if InSlotUIData and InSlotUIData.SlotId == self.SlotUIData.SlotId then
    return
  end
  if self.OnDragEnterCallback then
    self.OnDragEnterCallback(self, PointerEvent, Operation)
  end
  self:ChangeSlotOutlines(Operation.Payload.Uuid)
end

function M:OnDragLeave(PointerEvent, Operation)
  if Operation.Tag ~= "ArmoryModSlot" and Operation.Tag ~= "WBP_Com_Item_Universal_L_C" then
    return
  end
  if self.SlotUIData:InState(ModCommon.SlotState.Lock) then
    return
  end
  local InSlotUIData = Operation.InSlotUIData
  if InSlotUIData and InSlotUIData.SlotId == self.SlotUIData.SlotId then
    return
  end
  if self.OnDragLeaveCallback then
    self.OnDragLeaveCallback(self, PointerEvent, Operation)
  end
  self:PlayNormalAnim()
end

function M:OnDragCancelled(PointerEvent, Operation)
  if Operation.Tag ~= "ArmoryModSlot" and Operation.Tag ~= "WBP_Com_Item_Universal_L_C" then
    return
  end
  if self.OnDragCancelCallback then
    self.OnDragCancelCallback(self, PointerEvent, Operation)
  end
  if not Operation.InSlotUIData then
    return
  end
  ModController:SendTakeOffMod(ModModel:GetTarget(), Operation.InSlotUIData.SlotId)
end

function M:OnDrop(MyGeometry, PointerEvent, Operation)
  if Operation.Tag ~= "ArmoryModSlot" and Operation.Tag ~= "WBP_Com_Item_Universal_L_C" then
    return
  end
  if self.OnDropCallback then
    self.OnDropCallback(self, PointerEvent, Operation)
  end
  if self.SlotUIData:InState(ModCommon.SlotState.Lock) then
    ModController:CheckError(ErrorCode.RET_MOD_SLOT_LOCK, true)
    return true
  end
  self:PlayNormalAnim()
  if Operation.InSlotUIData then
    if Operation.InSlotUIData.SlotId == self.SlotUIData.SlotId then
      return true
    end
    ModController:SendExchangeMod(ModModel:GetTarget(), Operation.InSlotUIData.SlotId, self.SlotUIData.SlotId)
  else
    ModController:SendChangeMod(ModModel:GetTarget(), self.SlotUIData.SlotId, Operation.Payload.Uuid)
  end
  return true
end

function M:ChangeSlotOutlines(ModUuid)
  local Mod = ModModel:GetMod(ModUuid)
  if not Mod then
    return
  end
  local SlotPolarity = self.SlotUIData:GetPolarity()
  self.WidgetSwitcher_State:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  if SlotPolarity == NonePolarity then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  elseif Mod.Polarity == SlotPolarity then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(1)
  elseif Mod.Polarity ~= NonePolarity then
    self.WidgetSwitcher_State:SetActiveWidgetIndex(2)
  else
    self.WidgetSwitcher_State:SetActiveWidgetIndex(0)
  end
  self:PlaySelectedAnim(true)
end

function M:PlaySelectedAnim(bSelected)
  if bSelected then
    if self.Selected then
      self:PlayAnimation(self.Selected, 0, 0)
    end
  elseif self.Selected then
    self:StopAnimation(self.Selected)
  end
end

function M:PlayNormalAnim()
  self:StopScanlineAnim()
  self:StopAnimation(self.Lock)
  self.Icon_Lock:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:PlaySelectedAnim(false)
  self:PlayBtnAnimation(self.Normal)
  self.ItemDetails_MenuAnchor:SetAllowHover(true)
end

function M:ShowLinkLine(bGolden)
  if table.isempty(self.LinkWidgets) then
    local RootWidget = self.WidgetTree.RootWidget
    local LinkUI = UIManager():_CreateWidgetNew(ModCommon.LinkUIName)
    RootWidget:AddChild(LinkUI)
    local CanvasSlot = UWidgetLayoutLibrary.SlotAsCanvasSlot(LinkUI)
    local Anchors = FAnchors()
    Anchors.Minimum = FVector2D(0.5, 0.5)
    Anchors.Maximum = Anchors.Minimum
    CanvasSlot:SetAnchors(Anchors)
    CanvasSlot:SetAutoSize(true)
    local Pivot = FVector2D(0, 0.5)
    CanvasSlot:SetAlignment(Pivot)
    LinkUI:SetRenderTransformPivot(Pivot)
    local Scale = FVector2D(1 / self.ExtraScale, 1 / self.ExtraScale)
    Scale:Div(RootWidget.RenderTransform.Scale.X)
    LinkUI:SetRenderScale(Scale)
    LinkUI:ForceLayoutPrepass()
    table.insert(self.LinkWidgets, LinkUI)
  end
  local ActiveLinkWidget = table.remove(self.LinkWidgets)
  ActiveLinkWidget:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  ActiveLinkWidget:Init(bGolden)
  table.insert(self.ActiveLinkWidgets, ActiveLinkWidget)
  return ActiveLinkWidget
end

function M:CloseLinkLine()
  for _, LinkWidget in ipairs(self.ActiveLinkWidgets) do
    LinkWidget:SetVisibility(UIConst.VisibilityOp.Collapsed)
    table.insert(self.LinkWidgets, LinkWidget)
  end
  self.ActiveLinkWidgets = {}
end

return M
