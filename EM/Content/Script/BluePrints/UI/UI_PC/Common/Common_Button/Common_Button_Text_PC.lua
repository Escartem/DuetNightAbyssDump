require("UnLua")
local Common_Button_Text_PC = Class("BluePrints.UI.UI_PC.Common.Common_Button.Common_Button_PC")

function Common_Button_Text_PC:Construct()
  self.Text:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:BindInputMethodChangedDelegate()
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  self:SetGamePadImg(self.GamePadImgName)
  self.bAutoButtonChange = true
  self:RefreshIconAndGamePadVisibility()
  self.Reddot:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Super.Construct(self, self.Button_Area)
  self.bGamepadIconVisible = true
  self:PlayButtonUnForbidAnim()
end

function Common_Button_Text_PC:Destruct()
  self:UnBindInputMethodChangedDelegate()
  self.Super.Destruct(self)
end

function Common_Button_Text_PC:RefreshIconAndGamePadVisibility()
  if not self.bAutoButtonChange then
    return
  end
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    if self.bGamepadIconVisible or self.bGamepadIconVisible == nil then
      self:SetGamePadVisibility(self.OverrideGamePadVisibilityOp or UIConst.VisibilityOp.SelfHitTestInvisible)
      self:SetIconPanelVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
      self:SetIconPanelVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    self:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    self:SetIconPanelVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function Common_Button_Text_PC:BindInputMethodChangedDelegate()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(GameInputModeSubsystem) then
    GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.OnInputMethodChanged)
  end
end

function Common_Button_Text_PC:UnBindInputMethodChangedDelegate()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(GameInputModeSubsystem) then
    GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.OnInputMethodChanged)
  end
end

function Common_Button_Text_PC:OnInputMethodChanged(NewGameInputType, NewGamepadName)
  self.CurInputDeviceType = NewGameInputType
  self.CurGamepadName = NewGamepadName
  self:RefreshIconAndGamePadVisibility()
end

function Common_Button_Text_PC:GetText()
  local button_text = self.Text_Button:GetText()
  return button_text
end

function Common_Button_Text_PC:SetText(Text)
  self.Text_Button:SetText(Text)
end

function Common_Button_Text_PC:SetNewIcon(ImgPath)
  self:SetIconPanelVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  UE4.UResourceLibrary.LoadObjectAsync(self, ImgPath, {
    self,
    function(_, Image)
      local ImageWidget = self.Img_Slot:GetChildAt(0)
      if ImageWidget then
        ImageWidget:SetBrushResourceObject(Image)
      end
    end
  })
end

function Common_Button_Text_PC:SetIconPanelVisibility(Op)
  self.Img_Slot:SetVisibility(Op)
  if Op ~= UIConst.VisibilityOp.Collapsed and Op ~= UIConst.VisibilityOp.Hidden then
    self:UpdateSpacerVisibility()
  else
    self.Spacer_L:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Spacer_R:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function Common_Button_Text_PC:SetTextColor(InColorAndOpacity)
  self.Text_Button:SetColorAndOpacity(InColorAndOpacity)
end

function Common_Button_Text_PC:SetIconColor(HexColorString)
  if not HexColorString then
    return
  end
  local ImageWidget = self.Img_Slot:GetChildAt(0)
  if ImageWidget then
    ImageWidget:SetBrushTintColor(UE4.UUIFunctionLibrary.StringToSlateColor(HexColorString))
  end
end

function Common_Button_Text_PC:UpdateSpacerVisibility()
  if self.Img_Slot:GetVisibility() ~= UIConst.VisibilityOp.Collapsed and self.Img_Slot:HasAnyChildren() then
    self.Spacer_L:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Spacer_R:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Spacer_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Spacer_R:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function Common_Button_Text_PC:SetReddotVisibility(Op)
  self.Reddot:SetVisibility(Op)
end

function Common_Button_Text_PC:SetReddotStyle(ImgPath)
  self:SetReddotVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  UE4.UResourceLibrary.LoadObjectAsync(self, ImgPath, {
    self,
    function(_, Image)
      self.Reddot.Img_Light:SetBrushResourceObject(Image)
      self.Reddot.WS_Icon:SetActiveWidgetIndex(0)
    end
  })
end

function Common_Button_Text_PC:SetReddot(IsNew, Upgradeable, OhterReddot)
  if IsNew then
    self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    return
  end
  self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if OhterReddot then
    self.Reddot:SetReddotStyle(1)
    self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  elseif Upgradeable then
    self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function Common_Button_Text_PC:SwitchNormalAnimation()
  DebugPrint(LXYTag, "\232\166\134\231\155\150\230\142\137\232\147\157\229\155\190\231\154\132SwitchNormalAnimation")
  self:StopAllAnimations()
  self:PlayAnimation(self.Normal)
end

function Common_Button_Text_PC:SetGamePadImg(ImgShortPath, ImgLongPath)
  self.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = ImgShortPath,
        ImgLongPath = ImgLongPath
      }
    },
    bLongPress = self:GetIsLongPressButton(),
    bButton = self:GetIsLongPressButton()
  })
end

function Common_Button_Text_PC:SetDefaultGamePadImg(ImgShortPath)
  self.GamePadImgName = ImgShortPath
  self:SetGamePadImg(self.GamePadImgName)
end

function Common_Button_Text_PC:SetGamePadVisibility(Op)
  self.Key_GamePad:SetVisibility(Op)
end

function Common_Button_Text_PC:OverrideGamePadVisibility(Op)
  self.OverrideGamePadVisibilityOp = Op
end

function Common_Button_Text_PC:SetPCVisibility(IsShow)
  if IsShow then
    self:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    self:SetIconPanelVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self:SetGamePadVisibility(self.OverrideGamePadVisibilityOp or UIConst.VisibilityOp.SelfHitTestInvisible)
    self:SetIconPanelVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function Common_Button_Text_PC:SetGamepadIconVisibility(bShow)
  self.bGamepadIconVisible = bShow
  self:RefreshIconAndGamePadVisibility()
end

function Common_Button_Text_PC:PlayLongPressAnimation()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Key_GamePad:OnButtonPressed(false, true, 0, self.LongPressDuration)
  else
    local Speed = self.LongPress:GetEndTime() / self.LongPressDuration
    self:PlayAnimation(self.LongPress, 0, 1, EUMGSequencePlayMode.Forward, Speed, false)
  end
end

function Common_Button_Text_PC:StopLongPressAnimation()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Key_GamePad:OnButtonReleased()
    self.Key_GamePad:StopAllAnimations()
    self.Key_GamePad:PlayAnimation(self.Key_GamePad.Normal)
  else
    self:PlayAnimation(self.LongPress)
    self:StopAnimation(self.LongPress)
  end
end

function Common_Button_Text_PC:PlayButtonForbidAnim()
  self.Key_GamePad:DisableKey()
  self.Super.PlayButtonForbidAnim(self)
end

function Common_Button_Text_PC:PlayButtonUnForbidAnim()
  self.Key_GamePad:EnableKey()
  self.Super.PlayButtonUnForbidAnim(self)
end

return Common_Button_Text_PC
