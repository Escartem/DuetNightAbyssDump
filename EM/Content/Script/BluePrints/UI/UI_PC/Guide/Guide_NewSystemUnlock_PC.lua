require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
end

function M:OnWorking(SystemInfo)
  if self.CurrentUIUnlockName == SystemInfo.UIUnlockName then
    return
  end
  self.CurrentUIUnlockName = SystemInfo.UIUnlockName
  self:InitSystemInfo(SystemInfo)
  self:PlayAnimation(self.In)
  self:AddTimer(0.1, function()
    self.Btn_Click:SetFocus()
  end, false, 0, nil, true)
end

function M:InitSystemInfo(SystemInfo)
  if not SystemInfo then
    return
  end
  local Icon = SystemInfo.Icon or "/Game/UI/Texture/Dynamic/Atlas/Entrance/T_Entrance_Gacha.T_Entrance_Gacha"
  if Icon then
    local SystemIcon = LoadObject(Icon)
    local Img_Icon_DM = self.Img_Icon:GetDynamicMaterial()
    local VX_IconGlow_DM = self.VX_IconGlow:GetDynamicMaterial()
    Img_Icon_DM:SetTextureParameterValue("Mask", SystemIcon)
    VX_IconGlow_DM:SetTextureParameterValue("Mask", SystemIcon)
  end
  local UIUnlockName = SystemInfo.UIUnlockName or "\230\156\170\233\133\141\231\189\174"
  if UIUnlockName then
    local SystemName = GText(UIUnlockName) or UIUnlockName
    self.Text_Name:SetText(SystemName)
  end
  local AfterUIUnlockDesc = SystemInfo.AfterUIUnlockDesc or "\230\156\170\233\133\141\231\189\174"
  if AfterUIUnlockDesc then
    local SystemUnlockDescribe = GText(AfterUIUnlockDesc) or AfterUIUnlockDesc
    local Desc1, ActionName, Desc2 = self:GetDescInfo(SystemUnlockDescribe)
    local KeyName = ActionName and CommonUtils:GetActionMappingKeyName(ActionName)
    if Desc1 then
      self.Text_Describe:SetText(Desc1)
    end
    local UIIndex = 1
    self["Key_" .. UIIndex]:ClearChildren()
    if KeyName then
      local KeyWidget = UE4.UWidgetBlueprintLibrary.Create(self, self:GetCommonKeyBlueprint(true))
      KeyWidget:CreateCommonKey({
        KeyInfoList = {
          {Type = "Text", Text = KeyName}
        }
      })
      self["Key_" .. UIIndex]:AddChild(KeyWidget)
    end
    self.Text_Describe_1:SetText(Desc2 or "")
  end
  self.Text_Tips:SetText(GText("UI_TRAIN_CLOSE"))
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  self.Key_Tips:UpdateKeyInfo({
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_CTL_Continue")
    }
  })
end

function M:RefreshOpInfoByInputDevice(CurInputType, CurGamepadName)
  if CurInputType == ECommonInputType.Gamepad then
    self:InitGamepadView()
  elseif CurInputType == ECommonInputType.MouseAndKeyboard then
    self:InitKeyboardView()
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if self:IsAnimationPlaying(self.In) then
    return
  end
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    IsEventHandled = true
    self:OnBtnClicked_Lua()
  end
  if IsEventHandled then
    return UIUtils.Handled
  else
    return UIUtils.Unhandled
  end
end

function M:InitGamepadView()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Click:SetFocus()
    self.WS_Type:SetActiveWidgetIndex(1)
    self.Key_Tips:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:InitKeyboardView()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.WS_Type:SetActiveWidgetIndex(0)
    self.Key_Tips:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:ForbidNavigate()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Click:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  end
end

function M:RecoverNavigate()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "PC" then
    self.Btn_Click:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:OnBtnClicked_Lua()
  self.Btn_Click.OnClicked:Clear()
  self:PlayAnimation(self.Out)
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    if self.OnOutAnimationFinishedCallback then
      self.OnOutAnimationFinishedCallback()
    end
  elseif InAnimation == self.In then
    self.Btn_Click.OnClicked:Add(self, self.OnBtnClicked_Lua)
  end
end

function M:OnAutoInPlay()
  AudioManager(self):PlayUISound(self, "event:/ui/common/system_unlock", "", nil)
end

function M:BindOnOutAnimationFinished(Delegate)
  self.OnOutAnimationFinishedCallback = Delegate
end

function M:GetDescInfo(SourceText)
  local Ret = CommonUtils.Split(SourceText, "&")
  return table.unpack(Ret)
end

function M:GetCommonKeyBlueprint(bText)
  if bText then
    return UE4.UClass.Load("WidgetBlueprint'/Game/UI/WBP/Common/Key/WBP_Com_KeyText.WBP_Com_KeyText_C'")
  else
    return UE4.UClass.Load("WidgetBlueprint'/Game/UI/WBP/Common/Key/WBP_Com_KeyImg.WBP_Com_KeyImg_C'")
  end
end

return M
