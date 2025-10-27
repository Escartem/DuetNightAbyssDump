require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/suit_active_show", "RougeSuitActivate", nil)
  assert(GWorld.RougeLikeManager, "\230\137\190\228\184\141\229\136\176RougeLikeManager,\229\143\175\232\131\189\228\184\141\229\156\168\232\130\137\233\184\189\229\133\179\229\134\133")
  self.SuitId, self.CurActiveLevel, self.bTreasure = ...
  if self.bTreasure then
    self.CurrentCount = GWorld.RougeLikeManager.TreasureGroup:Find(self.SuitId)
  else
    self.CurrentCount = GWorld.RougeLikeManager.BlessingGroup:Find(self.SuitId)
  end
  self:SetText()
  self:SetSuitInfo()
  self.Btn_FullClose.OnClicked:Add(self, self.Close)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
end

function M:SetText()
  self.Text_Title:SetText(GText("RLBlessing_ActivateGroup"))
  self.Text_SuitNum:SetText(self.CurrentCount)
  if self.bTreasure then
    self.Text_SuitTitle:SetText(GText(DataMgr.TreasureGroup[self.SuitId].Name))
  else
    self.Text_SuitTitle:SetText(GText(DataMgr.BlessingGroup[self.SuitId].Name))
  end
  self.Text_Tip:SetText(GText("UI_RougeLike_ClickEmptyContinue"))
end

function M:SetSuitInfo()
  self:SetSuitImage(self.SuitId)
  local ActiveWidgetIndex = self.bTreasure and 1 or 0
  self.WS_Desc:SetActiveWidgetIndex(ActiveWidgetIndex)
  if self.bTreasure then
    self.Text_Desc:SetText(GText(DataMgr.TreasureGroup[self.SuitId].GroupEffectDesc))
  else
    self.ScrollBox_Suit:ClearChildren()
    for i = 1, 4 do
      local DetailWidget = UIManager(self):CreateWidget("/Game/UI/WBP/RougeLike/Widget/Suit/WBP_Rouge_SuitDetail_SubItem.WBP_Rouge_SuitDetail_SubItem", false)
      local DetailInfo = {}
      DetailInfo = RougeUtils:GenSuitDetail(self.SuitId, i, false, i == self.CurActiveLevel)
      DetailInfo.Parent = self
      DetailWidget:InitUIInfo(DetailInfo)
      self.ScrollBox_Suit:AddChild(DetailWidget)
      if i == self.CurActiveLevel then
        self.CurWidget = DetailWidget
      end
    end
    self:AddDelayFrameFunc(function()
      self.ScrollBox_Suit:ScrollWidgetIntoView(self.CurWidget, true)
    end, 2)
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.ScrollBox_Suit:SetFocus()
    self:AddDelayFrameFunc(function()
      self:UpdateKeyTips()
    end, 10)
  end
end

function M:SetSuitImage(SuitId)
  local ActiveWidgetIndex = self.bTreasure and 1 or 0
  self.WS_Icon:SetActiveWidgetIndex(ActiveWidgetIndex)
  local Icon
  if self.bTreasure then
    Icon = LoadObject(DataMgr.TreasureGroup[SuitId].BigIcon)
    self.Image_TreasureIcon:SetBrushFromTexture(Icon)
  else
    Icon = LoadObject(DataMgr.BlessingGroup[SuitId].BigIcon)
    self.Image_SuitIcon.Image_SuitIcon:SetBrushFromTexture(Icon)
  end
  local IconDynaMaterial = self.Image_SuitIcon.Image_SuitIcon_Color:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("Mask", Icon)
  end
  self.Image_SuitIcon:PlayAnimation(self.Image_SuitIcon[self.CurActiveLevel])
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function M:UpdateKeyTips()
  if not self.bTreasure and not self.CurrentHoverItem then
    return
  end
  local BottomKeyInfo = {}
  local CheckTarget = self.WS_Desc:GetActiveWidget()
  local bScrollBoxCanScroll = UIUtils.CheckScrollBoxCanScroll(CheckTarget)
  local bShowExplain = self.CurrentHoverItem and type(self.CurrentHoverItem.ExplanationId) == "table" and #self.CurrentHoverItem.ExplanationId > 0
  if bShowExplain then
    table.insert(BottomKeyInfo, {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_CTL_Explain")
    })
  end
  if bScrollBoxCanScroll then
    table.insert(BottomKeyInfo, {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RV"}
      },
      Desc = GText("UI_Controller_Slide")
    })
  end
  table.insert(BottomKeyInfo, {
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_BACK")
  })
  self.Com_MidKeyTips:UpdateKeyInfo(BottomKeyInfo)
end

function M:InitGamepadView()
  self.Com_MidKeyTips:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Text_Tip:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.ScrollBox_Suit:SetFocus()
    self:AddDelayFrameFunc(function()
      self:UpdateKeyTips()
    end, 10)
    if self.bTreasure then
      local ActiveWidget = self.WS_Desc:GetActiveWidget()
      if ActiveWidget then
        ActiveWidget:SetFocus()
        ActiveWidget:SetIsShowNavigateGuide(false)
      end
    end
  end
end

function M:InitKeyboardView()
  if self.Com_MidKeyTips then
    self.Com_MidKeyTips:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Text_Tip:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == Const.GamepadFaceButtonRight then
    self:Close()
  elseif "Escape" == InKeyName then
    self:Close()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 6
  if "Gamepad_RightY" == InKeyName then
    local CurScrollOffset = self.ScrollBox_Suit:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.ScrollBox_Suit:GetScrollOffsetOfEnd())
    self.ScrollBox_Suit:SetScrollOffset(ScrollOffset)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:Close()
  AudioManager(self):SetEventSoundParam(self, "RougeSuitActivate", {ToEnd = 1})
  self.Super.Close(self)
end

function M:Destruct()
  self.Super.Destruct(self)
  EventManager:FireEvent(EventID.OnGetAwardUIClose)
end

function M:OnHoverItemChange(HoverItem)
  self.CurrentHoverItem = HoverItem
  self:AddDelayFrameFunc(function()
    self:UpdateKeyTips()
  end, 10)
end

return M
