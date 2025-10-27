require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  M.Super.Construct(self)
  self.Image_Click.OnMouseButtonDownEvent:Unbind()
  self.Image_Click.OnMouseButtonDownEvent:Bind(self, self.OnBackgroundClicked)
  self.Btn_Unlock:BindEventOnClicked(self, self.OnUnlockBtnClicked)
  self.Btn_Unlock:SetGamePadImg("Y")
  self.Key_Consume:CreateGamepadKey("LS")
  self:SwitchGamepadKeyState(1)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  self.CurInputDeviceType = self.GameInputModeSubsystem:GetCurrentInputType()
  self:OnInputChange()
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
  self.Parent, self.SelectTraceId, self.SelectMod = ...
  self.MaxGradeLevel = tonumber(DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue)
  self.FocusOnDetail = false
  self.CurSelectCanGrade = false
  self.UnlockPlaying = false
  self.Armory_Inron.SelectTraceId = self.SelectTraceId
  self.Armory_Inron.Details = self
  self.Armory_Inron.IsOpenDetails = true
  self.Armory_Inron:Init(self.Parent.Params)
  if self.Armory_Inron["InronItem_" .. self.SelectTraceId] then
    self.Armory_Inron["InronItem_" .. self.SelectTraceId]:SetFocus()
  end
  self.InFinished = false
  self.IsInOutAnim = false
  self.Parent.Parent:BlockAllUIInput(true)
  self:BindToAnimationFinished(self.Detail_In, {
    self,
    self.OnInAnimFinished
  })
  self:PlayAnimation(self.Detail_In)
  for i = 1, self.Parent.MaxGradeLevel do
    if self.Armory_Inron["InronItem_" .. i] and i ~= self.SelectTraceId then
      self.Armory_Inron["InronItem_" .. i].IsClick = false
      self.Armory_Inron["InronItem_" .. i]:SetNormalState()
    end
  end
  if self.Armory_Inron["InronItem_" .. self.SelectTraceId] then
    self.Armory_Inron["InronItem_" .. self.SelectTraceId].IsClick = false
    self.Armory_Inron["InronItem_" .. self.SelectTraceId]:SetClickState()
    self.Armory_Inron["InronItem_" .. self.SelectTraceId]:SetFocus()
  end
end

function M:UpdateDetailInfo(TraceId, SelectMod)
  self.SelectTraceId = TraceId
  if self.Parent then
    self.Parent.SelectTraceId = TraceId
  end
  self.SelectMod = SelectMod
  self.Text_IntronName:SetText(GText("UI_ROOT_" .. TraceId))
  self.Text_IntronName_World:SetText(EnText("UI_ROOT_" .. TraceId))
  self.Text_IntronDesc:SetText(GText("UI_Armory_IntronDesc_" .. TraceId))
  local Desc = self.Armory_Inron:GetTraceDesc()
  self.Text_IntronDesc:SetText(Desc)
  self.HB_Consume:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.HB_Item:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Panel_Unlock:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if self.CurInputDeviceType == ECommonInputType.GamePad then
    self.Key_Consume:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  self.Text_Consume:SetText(GText("UI_CTL_Armory_Consumables"))
  local Res = self.Armory_Inron:InitResourceNeeded()
  self.Type, self.Resource1, self.Resource2 = Res[1], Res[2], Res[3]
  self.CurSelectCanGrade = false
  local CanUpGrade = self.Armory_Inron:CheckCharCanUpGradeLevel()
  if 1 == SelectMod or 4 == SelectMod then
    self.WidgetSwitcher_Btn:SetActiveWidgetIndex(1)
    self.Hint_Lock.WidgetSwitcher_State:SetActiveWidgetIndex(1)
    self.Hint_Lock.Text_Hint_Positive:SetText(GText("UI_UNLOCKED"))
    self.HB_Consume:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.HB_Item:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Consume:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if 4 == SelectMod then
      self.Panel_Unlock:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  elseif 2 == SelectMod then
    self.WidgetSwitcher_Btn:SetActiveWidgetIndex(0)
    self.Btn_Unlock:SetText(GText("UI_UNLOCK"))
    self.CurSelectCanGrade = true
  else
    self.WidgetSwitcher_Btn:SetActiveWidgetIndex(1)
    self.Hint_Lock.WidgetSwitcher_State:SetActiveWidgetIndex(2)
    self.Hint_Lock.Text_Hint_Locked:SetText(GText("UI_ROOT_CONDITION"))
  end
  self:ShowCollectRewardExpText(TraceId, SelectMod)
  self.Armory_InronItem:Init(self.Armory_Inron, self.SelectTraceId, false)
  self.Armory_InronItem.Num_Intron:SetText(tostring(self.SelectTraceId))
  self.Armory_InronItem:SetNormalState()
  self.Armory_InronItem.VX_CircleNoise11:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Armory_InronItem.VX_CircleNoise10:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Armory_InronItem.VX_CirceMid24:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Armory_InronItem.VX_Dot:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:ShowCollectRewardExpText(TraceId, SelectMod)
  if 2 == SelectMod or 3 == SelectMod then
    self.Panel_ExpHint:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    local CurCharLevelUpData = self.Parent.CharId and DataMgr.CharCardLevelUp[self.Parent.CharId] or {}
    local RewardData = CurCharLevelUpData[TraceId - 1] or {}
    local CollectRewardExp = RewardData.CollectRewardExp or 0
    local HintText = string.format(GText("UI_Armory_CharCardUpExp"), CollectRewardExp)
    self.Text_ExpHint:SetText(HintText)
  else
    self.Panel_ExpHint:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnUnlockBtnClicked()
  self.Armory_Inron:OnClickBTN(self.Type, self.Resource1, self.Resource2)
end

function M:OnBackgroundClicked()
  if not (not self.IsInOutAnim and self.InFinished) or self.UnlockPlaying then
    return
  end
  if self.Parent then
    for i = 1, self.Parent.MaxGradeLevel do
      if self.Parent["InronItem_" .. i] and self.Parent["InronItem_" .. i]:IsAnimationPlaying(self.Parent["InronItem_" .. i].UnLock) then
        return
      end
    end
  end
  self:OnCloseBtnClicked()
end

function M:OnCloseBtnClicked()
  self:StopAllAnimations()
  self.IsInOutAnim = true
  self:BindToAnimationFinished(self.Detail_Out, {
    self,
    self.OnOutAnimFinished
  })
  self:BlockAllUIInput(true)
  self:PlayAnimation(self.Detail_Out)
  if self.Armory_Inron["InronItem_" .. self.SelectTraceId] and self.CurInputDeviceType ~= ECommonInputType.GamePad then
    self.Armory_Inron["InronItem_" .. self.SelectTraceId].IsClick = false
    self.Armory_Inron["InronItem_" .. self.SelectTraceId]:SetNormalState()
  end
  if self.Parent then
    for i = 1, self.Parent.MaxGradeLevel do
      if self.Parent["InronItem_" .. i] then
        self.Parent["InronItem_" .. i].IsClick = false
        self.Parent["InronItem_" .. i]:SetNormalState()
      end
    end
  end
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain then
    ArmoryMain:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    ArmoryMain.Panel_SubUI:SetVisibility(UIConst.VisibilityOp.Hidden)
    ArmoryMain:PlayAnimation(ArmoryMain.RoleList_In)
    ArmoryMain:PlayAnimation(ArmoryMain.BG_BackFirst)
    if ArmoryMain.BackgroundBlurWithMask_39 then
      ArmoryMain.BackgroundBlurWithMask_39:SetVisibility(ESlateVisibility.Collapsed)
    end
    ArmoryMain.Tab_Arm:PlayInAnim()
    ArmoryMain.ReceiveEnterStateNoAnim = true
    ArmoryMain:UpdateMontageAndCamera()
    if ArmoryMain.CurSubTab.Name == "Grade" and ArmoryMain.CurSubTab.Widget and self.Parent and self.Parent.Char then
      local IsRed = not self.Parent.IsPreviewMode and ArmoryMain.CheckCharPromoteReddot and ArmoryMain:CheckCharPromoteReddot(self.Parent.Char)
      ArmoryMain.CurSubTab.Widget:SetReddot(false, IsRed)
    end
  end
end

function M:OnOutAnimFinished()
  self.IsInOutAnim = false
  self:BlockAllUIInput(false)
  self.Parent:OnTraceDetailsDestruct(self.SelectTraceId)
  local ArmoryMain = UIManager(self):GetArmoryUIObj()
  if ArmoryMain and ArmoryMain.BackgroundBlurWithMask_39 then
    ArmoryMain.BackgroundBlurWithMask_39:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
  self:Close()
end

function M:OnInAnimFinished()
  self.Parent.Parent:BlockAllUIInput(false)
  self.InFinished = true
end

function M:OnTipsOpenChanged(bIsOpen)
  if not self.Panel_GamePad then
    return
  end
  if bIsOpen then
    self.HB_Key_GamePad:SetVisibility(UE4.ESlateVisibility.Hidden)
  else
    self.HB_Key_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:ReceiveEnterState(StackAction)
  M.Super.ReceiveEnterState(self, StackAction)
  if self.Parent and self.SelectTraceId then
    self.Armory_Inron:OnClickTraceItem(self.SelectTraceId)
    if self.Armory_Inron["InronItem_" .. self.SelectTraceId] then
      self.Armory_Inron["InronItem_" .. self.SelectTraceId].IsClick = false
      self.Armory_Inron["InronItem_" .. self.SelectTraceId]:SetClickState()
      self.Armory_Inron.LastFocusItem = self["InronItem_" .. self.SelectTraceId]
    end
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self:OnInputChange()
end

function M:OnInputChange()
  if not self.Panel_GamePad then
    return
  end
  if self.CurInputDeviceType == ECommonInputType.GamePad then
    if self.SelectTraceId then
      self.Armory_Inron["InronItem_" .. self.SelectTraceId]:SetFocus()
      self.FocusOnDetail = false
    end
    self.Key_Consume:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_GamePad:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:SwitchGamepadKeyState(1)
  else
    self.Key_Consume:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_GamePad:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if not self.InFinished or self.IsInOutAnim then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
  else
    IsEventHandled = self:Handle_OnPCDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:Handle_OnPCDown(InKeyName)
  if "Escape" == InKeyName then
    self:OnBackgroundClicked()
    return true
  end
  return false
end

function M:Handle_OnGamePadDown(InKeyName)
  if not self.Panel_GamePad then
    return
  end
  if "Gamepad_FaceButton_Right" == InKeyName then
    if not self.FocusOnDetail then
      self:OnBackgroundClicked()
    else
      self.FocusOnDetail = false
      self.Armory_Inron["InronItem_" .. self.SelectTraceId]:SetFocus()
      self.Key_Consume:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self:SwitchGamepadKeyState(1)
    end
    return true
  elseif "Gamepad_FaceButton_Top" == InKeyName then
    if self.CurSelectCanGrade then
      self:OnUnlockBtnClicked()
    end
    return true
  elseif "Gamepad_LeftThumbstick" == InKeyName then
    if self.HB_Item:GetVisibility() ~= UE4.ESlateVisibility.Collapsed and self.HB_Item:GetChildrenCount() > 0 then
      local FirstItem = self.HB_Item:GetChildAt(0)
      FirstItem:SetFocus()
      self.FocusOnDetail = true
      self.Key_Consume:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self:SwitchGamepadKeyState(2)
    end
    return true
  end
  return false
end

function M:SwitchGamepadKeyState(State)
  if not self.HB_Key_GamePad then
    return
  end
  self.HB_Key_GamePad:ClearChildren()
  if 1 == State then
    local Info1 = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
    local Item = self:CreateWidgetNew("ComKeyTextDesc")
    self.HB_Key_GamePad:AddChild(Item)
    Item:CreateCommonKey(Info1)
  elseif 2 == State then
    local Info1 = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Controller_Check")
    }
    local Info2 = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
    local Item1 = self:CreateWidgetNew("ComKeyTextDesc")
    self.HB_Key_GamePad:AddChild(Item1)
    Item1:CreateCommonKey(Info1)
    local Item2 = self:CreateWidgetNew("ComKeyTextDesc")
    self.HB_Key_GamePad:AddChild(Item2)
    Item2:CreateCommonKey(Info2)
  end
end

return M
