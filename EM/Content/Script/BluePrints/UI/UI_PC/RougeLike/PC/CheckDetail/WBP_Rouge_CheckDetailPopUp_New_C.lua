require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local MaxItems = 4

function M:Construct()
  self.Rarity2Color = {
    "Blue",
    "Purple",
    "Yellow"
  }
  self.Button_FullClose.OnClicked:Add(self, self.OnBtnCloseClicked)
  self.Text_SuitNameTitle:SetVisibility(ESlateVisibility.Collapsed)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/item_info_panel_show", nil, nil)
  self.CurInputDeviceType = nil
end

function M:Destruct()
  self.Super.Destruct(self)
  self:ClearListenEvent()
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self)
  self.bIsFocusable = true
  self:SetFocus()
  self.ItemId, self.ItemType, self.Level, self.IsGuide, self.IsUnlock = ...
  local ItemData
  if self.ItemType == "Blessing" then
    ItemData = DataMgr.RougeLikeBlessing
    self.Rarity = ItemData[self.ItemId][self.ItemType .. "Rarity"]
    self.WS_Icon:SetActiveWidgetIndex(0)
    self.Text_TreatureDesc:SetVisibility(ESlateVisibility.Collapsed)
  elseif self.ItemType == "Treasure" then
    ItemData = DataMgr.RougeLikeTreasure
    self.Rarity = ItemData[self.ItemId][self.ItemType .. "Rarity"]
    self.WS_Icon:SetActiveWidgetIndex(1)
    if self.IsGuide then
      local TreatureDesc = self.IsUnlock and GText(ItemData[self.ItemId].IPDesc) or GText("RLTreasure_Desc_Unlock")
      self.Text_TreatureDesc:SetText(TreatureDesc)
      self.Text_TreatureDesc:SetVisibility(ESlateVisibility.Visible)
    else
      self.Text_TreatureDesc:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.Image_Quality:SetColorAndOpacity(self["Quality_" .. self.Rarity2Color[self.Rarity]])
  end
  assert(self.Rarity, "Rarity\231\154\132\232\142\183\229\143\150\230\156\137\233\151\174\233\162\152")
  local Desc, Title
  if self.IsGuide and not self.IsUnlock then
    Desc = ItemData[self.ItemId].UnlockConditionText
    Title = GText("RLArchive_UnlockEntry")
  else
    if self.ItemType == "Blessing" then
      Desc = UIUtils.GenRougeBlessingDesc(self.ItemId, self.Level)
    elseif self.ItemType == "Treasure" then
      Desc = UIUtils.GenRougeTreasureDesc(self.ItemId)
    end
    Title = GText(ItemData[self.ItemId].Name)
  end
  self.Text_Desc:SetText(GText(Desc))
  self.Text_Title:SetText(Title)
  self.Text_SuitName:SetText(string.format(GText("RLArchive_ID"), string.format("%03d", ItemData[self.ItemId].RLArchiveId)))
  self.Text_Tip:SetText(GText("UI_TRAIN_CLOSE"))
  UE.UResourceLibrary.LoadObjectAsync(self, ItemData[self.ItemId].Icon, {
    self,
    M.OnItemTypeIconLoadFinish
  })
  if self.ItemType == "Blessing" then
    self.BlessIcon:PlayAnimation(self.BlessIcon[self.Rarity2Color[self.Rarity]])
  end
  local BuffIconPath = ItemData[self.ItemId].TypeIcon
  if self.ItemType == "Blessing" then
    self.BuffIcon:SetVisibility(ESlateVisibility.Visible)
    self:SetBuffType(BuffIconPath)
  else
    self.BuffIcon:SetVisibility(ESlateVisibility.Collapsed)
  end
  self:InitExplanationList()
  self:InitListenEvent()
  self:PlayAnimation(self.In)
  self:PlayAnimation(self.Change)
end

function M:InitExplanationList()
  self.List_Definition:ClearListItems()
  local ItemData = DataMgr["RougeLike" .. self.ItemType]
  local ExplanationList = ItemData[self.ItemId].ExplanationId or {}
  if self.ItemType == "Treasure" and self.IsGuide then
    ExplanationList = {}
  end
  if #ExplanationList > 0 then
    self.Group_Line:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_Line:SetVisibility(ESlateVisibility.Collapsed)
  end
  for _, ExplanationId in ipairs(ExplanationList) do
    local ExplanationInfo = DataMgr.CombatTerm[ExplanationId]
    local Obj = NewObject(UIUtils.GetCommonItemContentClass())
    Obj.TermName = ExplanationInfo.CombatTerm
    Obj.Explaination = ExplanationInfo.CombatTermExplaination
    self.List_Definition:AddItem(Obj)
  end
end

function M:SetBuffType(IconPath)
  if not IconPath then
    return
  end
  self.BuffIcon:SetVisibility(ESlateVisibility.Visible)
  self.BuffIcon.Image_BlessingBuffIcon:SetBrushResourceObject(LoadObject(IconPath))
  self.BuffIcon:PlayAnimation(self.BuffIcon[self.Rarity2Color[self.Rarity]])
end

function M:InitListenEvent()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:ClearListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  local IsGamePad = CurInputDevice == ECommonInputType.Gamepad
  if IsGamePad then
    self:SetFocus()
  end
  self:UpdateTips(IsGamePad, CurGamepadName)
  self.CurInputDeviceType = CurInputDevice
end

function M:InitTipsInfo()
  self.Key_DetailScroll:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RV"}
    },
    Desc = GText("UI_Controller_Slide")
  })
  self.Key_DetailClose:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_BACK")
  })
end

function M:UpdateTips(IsGamePad, CurGamepadName)
  if IsGamePad then
    self.Text_Tip:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_DetailClose:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    if self.CurGamepadName ~= CurGamepadName then
      self:InitTipsInfo()
      self.CurGamepadName = CurGamepadName
    end
    self:ShowSwipeTip()
    self:AddTimer(0.1, self.ShowSwipeTip)
  else
    self.Text_Tip:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Key_DetailScroll:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_DetailClose:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:ShowSwipeTip()
  local TargetList = self.List_Definition
  if self.ItemType == "Treasure" and self.IsGuide then
    TargetList = self.EMScrollBox_Text
  end
  local TextOverflow = TargetList:GetScrollOffsetOfEnd() >= MaxItems
  if TextOverflow then
    self.Key_DetailScroll:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Key_DetailScroll:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnItemTypeIconLoadFinish(Object)
  if Object and IsValid(self) then
    if self.ItemType == "Treasure" then
      self.Image_TreasureIcon:SetBrushResourceObject(Object)
    else
      local Material = self.BlessIcon.Image_Icon:GetDynamicMaterial()
      if Material then
        Material:SetTextureParameterValue("MainTex", Object)
      end
    end
  end
end

function M:OnBtnCloseClicked()
  if self:IsPlayingAnimation() then
    return
  end
  self:PlayAnimation(self.Out)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", nil, nil)
end

function M:OnAnimationFinished(Animation)
  if Animation == self.Out then
    self:Close()
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:Handle_KeyEventOnGamePad(InKeyName)
  else
    IsEventHandled = self:Handle_KeyEventOnPC(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:Handle_KeyEventOnPC(InKeyName)
  local IsEventHandled = false
  if "Escape" == InKeyName then
    IsEventHandled = true
    self:OnBtnCloseClicked()
  end
  return IsEventHandled
end

function M:Handle_KeyEventOnGamePad(InKeyName)
  local IsEventHandled = false
  if "Gamepad_FaceButton_Right" == InKeyName then
    IsEventHandled = true
    self:OnBtnCloseClicked()
  end
  return IsEventHandled
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local Speed = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
  if "Gamepad_RightY" == InKeyName then
    local TargetList = self.List_Definition
    if self.ItemType == "Treasure" and self.IsGuide then
      TargetList = self.EMScrollBox_Text
    end
    local CurScrollOffset = TargetList:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - Speed, 0, TargetList:GetScrollOffsetOfEnd())
    TargetList:SetScrollOffset(ScrollOffset)
  end
  return self.Unhandle
end

return M
