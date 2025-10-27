require("UnLua")
local Common_Button_Reward_PC = Class("BluePrints.UI.UI_PC.Common.Common_Button.Common_Button_PC")

function Common_Button_Reward_PC:Construct()
  self.Super.Construct(self, self.Button_Area)
  self:BindInputMethodChangedDelegate()
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.CurGamepadName = UIUtils.UtilsGetCurrentGamepadName()
  self:SetGamePadImg(self.GamePadImgName)
  self:RefreshIconAndGamePadVisibility()
  self:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  self.IsGamePadIconVisible = false
end

function Common_Button_Reward_PC:SetText(Text)
  self.Text_Button:SetText(Text)
end

function Common_Button_Reward_PC:SwitchNormalAnimation()
  self:PlayAnimation(self.UnHover)
  self:PlayAnimation(self.Normal)
end

function Common_Button_Reward_PC:Destruct()
  self:UnBindInputMethodChangedDelegate()
  self.Super.Destruct(self)
end

function Common_Button_Reward_PC:BindInputMethodChangedDelegate()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(GameInputModeSubsystem) then
    GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.OnInputMethodChanged)
  end
end

function Common_Button_Reward_PC:UnBindInputMethodChangedDelegate()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(GameInputModeSubsystem) then
    GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.OnInputMethodChanged)
  end
end

function Common_Button_Reward_PC:OnInputMethodChanged(NewGameInputType, NewGamepadName)
  self.CurInputDeviceType = NewGameInputType
  self.CurGamepadName = NewGamepadName
  self:RefreshIconAndGamePadVisibility()
end

function Common_Button_Reward_PC:RefreshIconAndGamePadVisibility()
  if not self.IsGamePadIconVisible then
    self:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function Common_Button_Reward_PC:SetGamePadImg(ImgShortPath, ImgLongPath)
  local ImgPath, Img
  if ImgShortPath and "None" ~= ImgShortPath then
    ImgPath = UIUtils.UtilsGetKeyIconPathInGamepad(ImgShortPath, self.CurGamepadName)
    Img = LoadObject(ImgPath)
  elseif ImgLongPath then
    Img = LoadObject(ImgLongPath)
  end
  if not IsValid(Img) then
    DebugPrint("\231\188\186\229\176\145\229\155\190\231\137\135\232\181\132\230\186\144: ImgPath = ", ImgPath, ImgShortPath, ImgLongPath)
    return
  end
  self.Img_GamePad:SetBrushResourceObject(Img)
end

function Common_Button_Reward_PC:SetDefaultGamePadImg(ImgShortPath)
  self.GamePadImgName = ImgShortPath
  self:SetGamePadImg(self.GamePadImgName)
end

function Common_Button_Reward_PC:SetGamePadVisibility(Op)
  self.Img_GamePad:SetVisibility(Op)
end

function Common_Button_Reward_PC:SetGamePadIconVisible(IsVisible)
  self.IsGamePadIconVisible = IsVisible
  self:RefreshIconAndGamePadVisibility()
end

return Common_Button_Reward_PC
