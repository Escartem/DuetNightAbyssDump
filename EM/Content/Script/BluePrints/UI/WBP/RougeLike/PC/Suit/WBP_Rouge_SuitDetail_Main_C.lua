require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.ActivateNeedMap = {}
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/affix_info_panel_show", "RougeSuitDetail", nil)
  assert(GWorld.RougeLikeManager, "\230\137\190\228\184\141\229\136\176RougeLikeManager,\229\143\175\232\131\189\228\184\141\229\156\168\232\130\137\233\184\189\229\133\179\229\134\133")
  local Param = (...)
  if Param and Param[1] then
    self.SelectedSuit = Param[1]
  else
    self.SelectedSuit = 1
  end
  if Param and Param[2] then
    self.PreAddSuit = Param[2]
  end
  self:InitVariables()
  self:InitTextInfo()
  self.CurrentListIndex = self.SuitIdToIndex[self.SelectedSuit]
  self:SetListView()
  self:UpdateSuitInfo(self.SelectedSuit, self.CurrentListIndex)
  self:InitKey()
  self:SetFocus()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:InitGamepadView()
    self.ScrollBox_List:SetFocus()
  else
    self:InitKeyboardView()
  end
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
end

function M:OnLoaded(...)
  self.Super.OnLoaded(...)
  self.Btn_FullClose.OnClicked:Add(self, self.Close)
end

function M:InitKey()
  self.Btn_Left.Btn.OnClicked:Add(self, self.TabToLeft)
  self.Btn_Right.Btn.OnClicked:Add(self, self.TabToRight)
  if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" then
    self.Btn_KeyLeft:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Btn_KeyRight:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.PC:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Btn_KeyLeft:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "A"}
      },
      bLongPress = false
    })
    self.Key_L:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LB"}
      }
    })
    self.Key_R:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RB"}
      }
    })
    self.Btn_KeyRight:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "D"}
      },
      bLongPress = false
    })
    self.Key_Esc:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = GText("Esc")
        }
      },
      Desc = GText("UI_BACK"),
      bLongPress = false
    })
    self.Btn_KeyLeft:AddExecuteLogic(self, self.TabToLeft)
    self.Btn_KeyRight:AddExecuteLogic(self, self.TabToRight)
    self.Key_Esc:AddExecuteLogic(self, self.Close)
  end
end

function M:InitVariables()
  self.SuitIdToCount = {}
  self.SuitIdToIndex = {}
  self.BlessingGroupData = DataMgr.BlessingGroup
  local Index = 0
  for _, v in pairs(self.BlessingGroupData) do
    local SuitCount = GWorld.RougeLikeManager.BlessingGroup:Find(v.GroupId)
    SuitCount = SuitCount or 0
    self.SuitIdToCount[v.GroupId] = SuitCount
    self.SuitIdToIndex[v.GroupId] = Index
    for _, ActiveNeed in ipairs(v.ActivateNeed) do
      if self.ActivateNeedMap[v.GroupId] == nil then
        self.ActivateNeedMap[v.GroupId] = {}
      end
      table.insert(self.ActivateNeedMap[v.GroupId], ActiveNeed + GWorld.RougeLikeManager.BlessingGroupDiscount)
    end
    Index = Index + 1
  end
  self.MaxSuitNum = Index
end

function M:InitTextInfo()
  self.Text_GotTitle:SetText(GText("RLBlessingGroup_HavingNum") .. ":")
  self.Text_Tip:SetText(GText("UI_RougeLike_End__ClickEmpty"))
end

function M:UpdateSuitInfo(SuitId, Index)
  self:SetFocus()
  self:PlayAnimation(self.Switch)
  self:PlayAnimation(self.Change)
  self.CurrentListIndex = Index
  self.List_BottomTab:SetSelectedIndex(Index)
  self:DisableKeyWhenNeed()
  local CurrentCount = self.SuitIdToCount[SuitId]
  self.Text_GotNum:SetText(CurrentCount)
  self.Text_SuitTitle:SetText(GText(self.BlessingGroupData[SuitId].Name))
  self.Text_SuitDesc:SetText(GText(self.BlessingGroupData[SuitId].GroupEffectDesc))
  self:SetSuitImage(SuitId, CurrentCount)
  if self.PreAddSuit and self.PreAddSuit == SuitId then
    CurrentCount = CurrentCount + 1
  end
  self.ScrollBox_List:ClearChildren()
  for i = 1, 4 do
    local DetailWidget = UIManager(self):CreateWidget("/Game/UI/WBP/RougeLike/Widget/Suit/WBP_Rouge_SuitDetail_SubItem.WBP_Rouge_SuitDetail_SubItem", false)
    local DetailInfo = {}
    if self.PreAddSuit and self.PreAddSuit == SuitId then
      DetailInfo = RougeUtils:GenSuitDetail(SuitId, i, true)
    else
      DetailInfo = RougeUtils:GenSuitDetail(SuitId, i, false)
    end
    DetailInfo.Parent = self
    DetailWidget:InitUIInfo(DetailInfo)
    self.ScrollBox_List:AddChild(DetailWidget)
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.ScrollBox_List:SetFocus()
    self:AddDelayFrameFunc(function()
      self:UpdateKeyTips()
    end, 10)
  end
end

function M:SetSuitImage(SuitId, CurrentCount)
  local Icon = LoadObject(self.BlessingGroupData[SuitId].BigIcon)
  self.Image_SuitIcon.Image_SuitIcon:SetBrushFromTexture(Icon)
  local IconDynaMaterial = self.Image_SuitIcon.Image_SuitIcon_Color:GetDynamicMaterial()
  if IconDynaMaterial then
    IconDynaMaterial:SetTextureParameterValue("Mask", Icon)
  end
  for i = 1, 4 do
    if CurrentCount < self.ActivateNeedMap[SuitId][i] then
      self.Image_SuitIcon:PlayAnimation(self.Image_SuitIcon[i - 1])
      break
    end
    if 4 == i then
      self.Image_SuitIcon:PlayAnimation(self.Image_SuitIcon[i])
    end
  end
end

function M:SetListView()
  self.List_BottomTab:ClearListItems()
  local Index = 0
  for _, v in pairs(self.BlessingGroupData) do
    local Content = NewObject(self.SuitInfoContentClass)
    Content.SuitId = v.GroupId
    Content.Count = self.SuitIdToCount[v.GroupId]
    Content.Index = Index
    if self.PreAddSuit == Content.SuitId then
      Content.IsPreAdd = true
    end
    if self.CurrentListIndex == Content.Index then
      Content.IsSelected = true
    end
    Content.ActivateNeedMap = self.ActivateNeedMap
    if self.PreAddSuit and self.PreAddSuit == v.GroupId then
      Content.Count = Content.Count + 1
    end
    Content.Parent = self
    Content.UseBigFont = true
    self.List_BottomTab:AddItem(Content)
    Index = Index + 1
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
    self.ScrollBox_List:SetFocus()
  else
    self:InitKeyboardView()
  end
end

function M:UpdateKeyTips()
  local BottomKeyInfo = {}
  local bScrollBoxCanScroll = UIUtils.CheckScrollBoxCanScroll(self.ScrollBox_List)
  local bShowExplain = type(self.CurrentHoverItem.ExplanationId) == "table" and #self.CurrentHoverItem.ExplanationId > 0
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
  self.Com_KeyTips:UpdateKeyInfo(BottomKeyInfo)
end

function M:InitGamepadView()
  self.Key_Left:SetActiveWidgetIndex(1)
  self.Key_Right:SetActiveWidgetIndex(1)
  self.HB_Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Text_Tip:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Com_KeyTips:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Btn_FullClose:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:AddDelayFrameFunc(function()
    self:UpdateKeyTips()
  end, 10)
end

function M:InitKeyboardView()
  self.Key_Left:SetActiveWidgetIndex(0)
  self.Key_Right:SetActiveWidgetIndex(0)
  self.HB_Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Text_Tip:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Com_KeyTips:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_FullClose:SetVisibility(UIConst.VisibilityOp.Visible)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "A" == InKeyName or InKeyName == Const.GamepadLeftShoulder then
    self:TabToLeft()
  elseif "D" == InKeyName or InKeyName == Const.GamepadRightShoulder then
    self:TabToRight()
  elseif "Escape" == InKeyName or InKeyName == Const.GamepadFaceButtonRight then
    self:Close()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 6
  if "Gamepad_RightY" == InKeyName then
    local CurScrollOffset = self.ScrollBox_List:GetScrollOffset()
    local ScrollOffset = math.clamp(CurScrollOffset - AddOffset, 0, self.ScrollBox_List:GetScrollOffsetOfEnd())
    self.ScrollBox_List:SetScrollOffset(ScrollOffset)
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:TabToRight()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
  if self.CurrentListIndex < self.MaxSuitNum - 1 then
    local SuitId = self.List_BottomTab:GetItemAt(self.CurrentListIndex + 1).SuitId
    self:UpdateSuitInfo(SuitId, self.CurrentListIndex + 1)
  end
end

function M:TabToLeft()
  if self.CurrentListIndex > 0 then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_mid", nil, nil)
    local SuitId = self.List_BottomTab:GetItemAt(self.CurrentListIndex - 1).SuitId
    self:UpdateSuitInfo(SuitId, self.CurrentListIndex - 1)
  end
end

function M:DisableKeyWhenNeed()
  if 0 == self.CurrentListIndex then
    self.Btn_KeyLeft:DisableKey()
  else
    self.Btn_KeyLeft:EnableKey()
  end
  if self.CurrentListIndex == self.MaxSuitNum - 1 then
    self.Btn_KeyRight:DisableKey()
  else
    self.Btn_KeyRight:EnableKey()
  end
end

function M:OnHoverItemChange(HoverItem)
  self.CurrentHoverItem = HoverItem
  self:AddDelayFrameFunc(function()
    self:UpdateKeyTips()
  end, 10)
  self.ScrollBox_List:ScrollWidgetIntoView(self.CurrentHoverItem)
end

function M:Close()
  AudioManager(self):SetEventSoundParam(self, "RougeSuitDetail", {ToEnd = 1})
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/affix_info_panel_show", "SwitchGuideBook", nil)
  self.Super.Close(self)
end

return M
