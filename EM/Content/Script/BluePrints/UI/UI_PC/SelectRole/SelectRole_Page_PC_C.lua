require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:PreConstruct(IsDesignTime)
  GWorld.GameInstance:GetGameUIManager():CloseResidentUI()
  EventManager:FireEvent(EventID.OnSelectRoleUIOpen, self)
end

function M:Construct()
  self.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile"
  self.RealMousePos = FVector2D(0, 0)
  self.Page_Role.RootPage = self
  self.Page_Role:Init()
  self.Page_Role:SetFocus()
  self.Page_Name.RootPage = self
  self.Page_Name:Init()
  self.PageState = "SelectRole"
  self.bCanChangeRole = true
  if not self.DeviceInPc then
  end
  if self.DeviceInPc then
    self:CreateCommonKeyAndLogic(self, self.Key_Observe, "Esc", GText("UI_Unselect"), self.OnClickButtonObserve, self)
    self.Key_Left:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LB"}
      },
      Desc = GText("Prologue_ChooseGender_Male")
    })
    self.Key_Right:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "RB"}
      },
      Desc = GText("Prologue_ChooseGender_Female")
    })
    self.Key_Continue:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_REGISTER_CONTINUE")
    })
    self.Key_Back:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_Unselect")
    })
    self.Key_Continue:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_Back:SetVisibility(ESlateVisibility.Collapsed)
    self.Key_Observe:SetVisibility(ESlateVisibility.Collapsed)
  end
  self:BindToAnimationFinished(self.Out, {
    self.Page_Name,
    self.Page_Name.FinishNode
  })
  if self.DeviceInPc then
    self.Btn_Click.OnClicked:Add(self, self.OnClickBtn)
  else
    self.Btn_Click:SetVisibility(ESlateVisibility.Collapsed)
  end
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshInfoByInputTypeChange)
  self.CurMode = self.GameInputModeSubsystem:GetCurrentInputType()
  self:RefreshInfoByInputTypeChange(self.CurMode)
  AudioManager(self):PlayUISound(self, "event:/ui/common/gender_select_hud_show", "SelectRoleHud", nil)
  self:PlayAnimation(self.In)
end

function M:CreateCommonKeyAndLogic(Root, Key, Text, DescText, Logic, LogicObj)
  Key:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = Text,
        ClickCallback = Logic,
        Owner = LogicObj
      }
    },
    Desc = DescText
  })
  Key:AddExecuteLogic(Root, Logic)
end

function M:OnClickButtonObserve()
  if self.PageState == "SelectRole" then
    self.Page_Role:OnClickButtonObserve()
  else
    self.Page_Name:OnClickButtonBack()
  end
end

function M:ChangeWidget(Reason)
  if "SelectName" == Reason then
    print(_G.LogTag, "LXZ ChangeWidget SelectName")
    self.Page_Role:StopAnimation(self.Page_Role.In)
    self.Page_Role:PlayAnimation(self.Page_Role.Out)
    self.Page_Role:SetVisibility(ESlateVisibility.Collapsed)
    self.Page_Role:StopAnimation(self.Page_Name.Out)
    self.Page_Name:PlayAnimation(self.Page_Name.In)
    self.Page_Name:SetVisibility(ESlateVisibility.Visible)
    self.Page_Name:CheckStrLen()
    self.Page_Name:SetFocus()
    self.PageState = "SelectName"
  elseif "SelectRole" == Reason then
    print(_G.LogTag, "LXZ ChangeWidget SelectRole")
    self.Page_Role:StopAnimation(self.Page_Role.Out)
    self.Page_Role:PlayAnimation(self.Page_Role.In)
    self.Page_Role:SetVisibility(ESlateVisibility.Visible)
    self.Page_Role:StopAnimation(self.Page_Name.In)
    self.Page_Name:PlayAnimation(self.Page_Name.Out)
    self.Page_Name:SetVisibility(ESlateVisibility.Collapsed)
    self.Page_Role:SetFocus()
    self.PageState = "SelectRole"
    self.Page_Role:ChangeRoleBtnStyle(self.Page_Role.NowRole)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if self.PageState == "SelectRole" then
    IsEventHandled = self.Page_Role:Handle_KeyEventOnGamePad(InKeyName)
  else
    IsEventHandled = self.Page_Name:Handle_KeyEventOnGamePad(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:ShowWidget(MyGeometry, InKeyEvent)
  self.Page_Role:UnlockCanClick()
end

function M:OnTouchStarted(MyGeometry, InTouchEvent)
  if self.DeviceInPc then
    return
  end
  local Coordinate = UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InTouchEvent)
  local _, ViewportPosition = USlateBlueprintLibrary.AbsoluteToViewport(self, Coordinate)
  self.RealMousePos = ViewportPosition
  self:OnClickBtn()
  local UnHandled = UE4.UWidgetBlueprintLibrary.UnHandled()
  return UnHandled
end

function M:OnClickBtn()
  if self.PageState ~= "SelectRole" then
    return
  end
  print(_G.LogTag, "lxz OnClickDetailL", self.Page_Role.NowState)
  if 5 == self.Page_Role.NowState or 4 == self.Page_Role.NowState then
    self:GetSelectImage({
      {
        Btn = self.Btn_Select01_L,
        Tag = "L"
      },
      {
        Btn = self.Btn_Select01_R,
        Tag = "R"
      }
    }, "FullBody", false)
  elseif 6 == self.Page_Role.NowState or 7 == self.Page_Role.NowState then
    self:GetSelectImage({
      {
        Btn = self.Btn_Select02_L,
        Tag = "L"
      },
      {
        Btn = self.Btn_Select02_R,
        Tag = "R"
      }
    }, "Detail", true)
  end
end

function M:GetSelectImage(BtnList, Type, IsFullScreen)
  if self.DeviceInPc then
    self.RealMousePos = UE4.UWidgetLayoutLibrary.GetMousePositionOnViewport(self)
  end
  for i, BtnData in pairs(BtnList) do
    local Slot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(BtnData.Btn)
    local BtnSize = USlateBlueprintLibrary.GetLocalSize(BtnData.Btn:GetCachedGeometry())
    local Pos = FVector2D(0, 0)
    UE4.USlateBlueprintLibrary.LocalToViewport(self, BtnData.Btn:GetCachedGeometry(), FVector2D(0, 0), nil, Pos)
    local Rate = (self.RealMousePos - Pos) / BtnSize
    if IsFullScreen then
      Rate = self.RealMousePos / BtnSize
    end
    local Alpha = BtnData.Btn:GetMousePosAlpha(Rate)
    if Alpha > 0 then
      self.Page_Role["OnClickButton" .. Type](self.Page_Role, BtnData.Tag)
      return
    end
  end
end

function M:OnBackToFullBody()
  if not self.DeviceInPc then
    return
  end
  self.Key_Right:ChangeText(GText("Prologue_ChooseGender_Female"))
  self.Key_Continue:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_Back:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_Observe:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_Left:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Key_Right:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function M:OnBackToDetail()
  if not self.DeviceInPc then
    return
  end
  self.Key_Right:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Key_Right:ChangeText(GText("UI_CTL_SelectRole_Change"))
  self.Key_Left:SetVisibility(ESlateVisibility.Collapsed)
  self.Key_Continue:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Key_Back:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Key_Observe:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function M:OnClickButtonDetail(Tag)
  self.Page_Role:OnClickButtonFullBody(Tag)
end

function M:OnClickButtonFullBody(Tag)
  self:OnBackToDetail()
  self.Page_Role:OnClickButtonDetail(Tag)
end

function M:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
  if not self.DeviceInPc then
    return
  end
  self.CurMode = CurInputDevice
  self.Page_Role:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
  self.Page_Name:RefreshInfoByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.MouseAndKeyboard and self.DeviceInPc then
    self.Switch_Mode:SetActiveWidgetIndex(0)
  elseif CurInputDevice == ECommonInputType.Gamepad and self.DeviceInPc then
    self.Switch_Mode:SetActiveWidgetIndex(1)
    if self.PageState ~= "SelectRole" then
      return
    end
    if 5 == self.Page_Role.NowState or 4 == self.Page_Role.NowState then
      self:OnBackToFullBody()
    elseif 6 == self.Page_Role.NowState or 7 == self.Page_Role.NowState then
      self:OnBackToDetail()
    end
  elseif CurInputDevice == ECommonInputType.Touch then
  end
  if UE4.UUCloudGameInstanceSubsystem.IsCloudGame() then
    self.GameInputModeSubsystem:SetMouseCursorVisable(false)
  end
end

return M
