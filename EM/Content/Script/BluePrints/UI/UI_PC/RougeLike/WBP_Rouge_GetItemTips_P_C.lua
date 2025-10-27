local WBP_Rouge_GetItemTips_P_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Rouge_GetItemTips_P_C:Construct()
  self.Widget_VXMap = {
    4,
    2,
    1,
    0,
    0
  }
end

function WBP_Rouge_GetItemTips_P_C:OnLoaded(InfoDatas, AwardList)
  self.List_BlessingItem:SetVisibility(UIConst.VisibilityOp.Visible)
  self.List_TreasureItem:SetVisibility(UIConst.VisibilityOp.Visible)
  self.List_BlessingItem:ClearListItems()
  self.List_TreasureItem:ClearListItems()
  self.WS_List:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.BlessingItem:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.TreasureItem:SetVisibility(UIConst.VisibilityOp.Collapsed)
  local InfoDataList = InfoDatas.InfoDataList
  local Islose = InfoDatas.Islose
  AudioManager(self):PlayUISound(self, "event:/ui/roguelike/get_award", nil, nil)
  self.AwardList = AwardList
  self.Button_FullClose.OnClicked:Add(self, self.CloseSelf)
  if Islose then
    self:PlayAnimation(self.In_Lose)
  else
    self:PlayAnimation(self.In)
  end
  local IsBlessing = false
  local ClassPath = UIUtils.GetCommonItemContentClass()
  for _, InfoData in pairs(InfoDataList) do
    if InfoData.BlessingId then
      if Islose then
        self.Text_title:SetText(GText("RougeLike_LoseBlessing"))
      else
        self.Text_title:SetText(GText("RougeLike_GetBlessing"))
      end
      self.BlessingId = InfoData.BlessingId
      self.WS_List:SetActiveWidgetIndex(0)
      local MenuContent = NewObject(ClassPath)
      MenuContent.AwardInfo = {
        AwardType = "Blessing",
        AwardId = InfoData.BlessingId,
        NotHit = true,
        not Islose
      }
      MenuContent.Parent = self
      MenuContent.NotHit = true
      self.List_BlessingItem:AddItem(MenuContent)
      IsBlessing = true
    else
      local MenuContent = NewObject(ClassPath)
      if Islose then
        self.Text_title:SetText(GText("RougeLike_LoseTreasure"))
      else
        self.Text_title:SetText(GText("RougeLike_GetTreasure"))
      end
      self.WS_List:SetActiveWidgetIndex(1)
      MenuContent.AwardInfo = {
        AwardType = "Treasure",
        AwardId = InfoData.TreasureId,
        NotHit = true,
        not Islose
      }
      MenuContent.Parent = self
      MenuContent.NotHit = true
      self.List_TreasureItem:AddItem(MenuContent)
    end
  end
  self.UsedList = self.List_BlessingItem
  if not IsBlessing then
    self.UsedList = self.List_TreasureItem
  end
  self.AwardType = IsBlessing and "Blessing" or "Treasure"
  self.UsedList:SetNavigatePosAngle(0)
  self.ItemNum = #InfoDataList
  if 1 == self.ItemNum then
    self.CurrentSelectItem = self.UsedList:GetItemAt(0).SelfWidget
  end
  if not Islose then
    self:AddTimer(0.01, function()
      UIUtils.PlayListViewFramingInAnimation(self, self.UsedList, {AnimName = "In_get"})
    end, false, 0, nil, true)
  end
  self.Text_Tip:SetText(GText("UI_RougeLike_End__ClickEmpty"))
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  self:AddInputMethodChangedListen()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self:InitGamepadView()
  end
end

function WBP_Rouge_GetItemTips_P_C:SetNavigation(Widget)
  Widget:SetNavigationRuleCustom(UE4.EUINavigation.Left, {
    self,
    self.OnNavigateLeft
  })
  Widget:SetNavigationRuleCustom(UE4.EUINavigation.Right, {
    self,
    self.OnNavigateRight
  })
end

function WBP_Rouge_GetItemTips_P_C:OnNavigateLeft()
  if self.SelectedIndex - 1 >= 0 then
    return self:UpdateSelectedWidget(self.SelectedIndex - 1)
  end
  return
end

function WBP_Rouge_GetItemTips_P_C:OnNavigateRight()
  local ItemsCount = self.UsedList:GetNumItems()
  if ItemsCount >= self.SelectedIndex + 1 then
    return self:UpdateSelectedWidget(self.SelectedIndex + 1)
  end
  return
end

function WBP_Rouge_GetItemTips_P_C:UpdateSelectedWidget(SelectedIndex)
  self.SelectedIndex = SelectedIndex
  self.UsedList:NavigateToIndex(self.SelectedIndex)
  local NewFocusItem = self.UsedList:GetItemAt(self.SelectedIndex)
  if NewFocusItem and NewFocusItem.SelfWidget then
    return NewFocusItem.SelfWidget
  end
  return
end

function WBP_Rouge_GetItemTips_P_C:SetInfo(Parent, InfoId, InfoData, AwardType)
  self.Parent = Parent
  self.InfoId = InfoId
  local Name = InfoData.Name
  self.Text_Name:SetText(GText(Name))
  local Desc = InfoData.Desc
  self.Text_Describe:SetText(GText(Desc))
  self.AwardType = AwardType
  self.Btn_Select:SetText(GText("UI_CONFIRM_SELECTION"))
  self.StartTime = UE4.UGameplayStatics.GetRealTimeSeconds(self)
end

function WBP_Rouge_GetItemTips_P_C:OnBtn_SelectClicked()
end

function WBP_Rouge_GetItemTips_P_C:CloseSelf()
  if self:IsAnimationPlaying(self.In) then
    return
  end
  local AnimObj = self:GetAnimationByName("Out")
  
  local function PlayAnimFinished()
    if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
      EventManager:FireEvent(EventID.OnHomeBaseBtnPlayAnim, "RougeBag", "Rouge_Get_Phone")
    else
      EventManager:FireEvent(EventID.OnHomeBaseBtnPlayAnim, "RougeBag", "Rouge_Get")
    end
    if self.AwardType == "Blessing" or self.AwardType == "Treasure" then
      EventManager:FireEvent(EventID.OnGetAwardUIClose)
    end
    self:Close()
    if self.AwardList and next(self.AwardList) then
      table.remove(self.AwardList, 1)
      GWorld.RougeLikeManager:ShowNextAward(self.AwardList)
    end
  end
  
  if self:IsAnimationPlaying(self.Out) then
    return
  end
  self:BindToAnimationFinished(AnimObj, {self, PlayAnimFinished})
  self:PlayAnimation(AnimObj)
  local UIState = UIManager(self):GetCurrentState()
  if UIState then
    UIState:SetFocus()
  end
  self:RemoveInputMethodChangedListen()
end

function WBP_Rouge_GetItemTips_P_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName or InKeyName == UIConst.GamePadKey.FaceButtonRight then
    self:CloseSelf()
  elseif InKeyName == Const.GamepadFaceButtonDown then
    if self.CurrentSelectItem and self.CurrentSelectItem.SelfWidget then
      self.CurrentSelectItem.SelfWidget:OnBtn_DescClicked()
    elseif self.CurrentSelectItem then
      self.CurrentSelectItem:OnBtn_DescClicked()
    end
  elseif InKeyName == Const.GamepadLeftThumbstick then
    if self.CurrentSelectItem and self.CurrentSelectItem.SelfWidget and self.CurrentSelectItem.SelfWidget.Rouge_SuitSign and self.CurrentSelectItem.SelfWidget.Rouge_SuitSign:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
      self.CurrentSelectItem.SelfWidget.Rouge_SuitSign.Com_BtnQa:OnViewInfoClick()
      self:ShowBottomGamePadKey(false)
    elseif self.CurrentSelectItem and self.CurrentSelectItem.Rouge_SuitSign and self.CurrentSelectItem.Rouge_SuitSign:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
      self.CurrentSelectItem.Rouge_SuitSign.Com_BtnQa:OnViewInfoClick()
      self:ShowBottomGamePadKey(false)
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function WBP_Rouge_GetItemTips_P_C:ChangeSelectItem(NewWidget)
  self.CurrentSelectItem = NewWidget
  if 1 == self.ItemNum then
    self.CurrentSelectItem:SetIsShowNavigateGuide(false)
  end
  self:UpdateKeyGamePad()
end

function WBP_Rouge_GetItemTips_P_C:RefreshOpInfoByInputDevice(CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  else
    self:InitKeyboardView()
  end
end

function WBP_Rouge_GetItemTips_P_C:ShowBottomGamePadKey(bShow)
  if 1 ~= self.ItemNum then
    return
  end
  if bShow then
    self:UpdateKeyGamePad()
  else
    self.Key_GamePad01:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_GamePad02:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_GamePad03:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_GamePad04:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Rouge_GetItemTips_P_C:InitGamepadView()
  self.Button_FullClose:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Switch_Key:SetActiveWidgetIndex(1)
  self.SelectedIndex = 0
  self.UsedList:SetFocus()
  self.Key_GamePad01:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    },
    Desc = GText("UI_CTL_ExplainSet")
  })
  self.Key_GamePad02:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RV"}
    },
    Desc = GText("UI_Controller_Slide")
  })
  self.Key_GamePad03:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    },
    Desc = GText("UI_CTL_Explain")
  })
  self.Key_GamePad04:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "B"}
    },
    Desc = GText("UI_Controller_Close")
  })
  self:AddTimer(0.05, function()
    if not self then
      return
    end
    local AllItemCount = self.UsedList:GetNumItems()
    for i = 0, AllItemCount - 1 do
      local Item = self.UsedList:GetItemAt(i)
      if Item.SelfWidget then
        Item.SelfWidget.Btn_Desc:SetVisibility(UIConst.VisibilityOp.Collapsed)
        self.CurrentSelectItem = Item.SelfWidget
      end
    end
    self:UpdateKeyGamePad()
  end)
end

function WBP_Rouge_GetItemTips_P_C:UpdateKeyGamePad()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and self.CurrentSelectItem and self.CurrentSelectItem.ExplanationId ~= nil and #self.CurrentSelectItem.ExplanationId > 0 then
    self.Key_GamePad03:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif self.Key_GamePad03:GetVisibility() ~= ESlateVisibility.Collapsed then
    self.Key_GamePad03:SetVisibility(ESlateVisibility.Collapsed)
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad and self.CurrentSelectItem and 1 == self.ItemNum and self.CurrentSelectItem.bShowSuitSign then
    self.Key_GamePad01:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  elseif self.Key_GamePad01:GetVisibility() ~= ESlateVisibility.Collapsed then
    self.Key_GamePad01:SetVisibility(ESlateVisibility.Collapsed)
  end
  if self.CurrentSelectItem and not UIUtils.CheckScrollBoxCanScroll(self.CurrentSelectItem.ScrollBox_Desc) then
    self.Key_GamePad02:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Key_GamePad02:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.Key_GamePad04:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_GamePad04:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function WBP_Rouge_GetItemTips_P_C:InitKeyboardView()
  self.Button_FullClose:SetVisibility(UIConst.VisibilityOp.Visible)
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile" then
    self.Switch_Key:SetActiveWidgetIndex(0)
  end
  local AllItemCount = self.UsedList:GetNumItems()
  for i = 0, AllItemCount - 1 do
    local Item = self.UsedList:GetItemAt(i)
    if Item.SelfWidget then
      Item.SelfWidget.Btn_Desc:SetVisibility(UIConst.VisibilityOp.Visible)
    end
  end
end

function WBP_Rouge_GetItemTips_P_C:AddInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_GetItemTips_P_C:RemoveInputMethodChangedListen()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_Rouge_GetItemTips_P_C:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
    local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
    local AddOffset = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
    if "Gamepad_RightY" == InKeyName and self.CurrentSelectItem then
      local CurScrollOffset = self.CurrentSelectItem.ScrollBox_Desc:GetScrollOffset()
      self.CurrentSelectItem.ScrollBox_Desc:SetScrollOffset(CurScrollOffset + AddOffset)
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function WBP_Rouge_GetItemTips_P_C:OnItemSelected()
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.CurrentSelectItem:SetNavigatePosAngle(0)
    self.CurrentSelectItem:SetNavigatePosOffsetPercent(UE4.FVector2D(0.5, -0.05))
    self.CurrentSelectItem:SetNavigatePosOffsetAlignment(UE4.FVector2D(0.5, 0.5))
    
    local function HideKeyTips()
      if not UIUtils.CheckScrollBoxCanScroll(self.CurrentSelectItem.ScrollBox_Desc) then
        self.Key_GamePad02:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
    
    self:AddDelayFrameFunc(HideKeyTips, 2)
  end
end

return WBP_Rouge_GetItemTips_P_C
