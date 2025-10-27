require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Destruct()
  self.Btn_Click.OnClicked:Remove(self.ExcuteObj, self.ExcuteFunc)
  self:UnBindInputMethodChangedDelegate()
  M.Super.Destruct(self)
end

function M:InitBtn(Text, GamepadImg, Obj, Func)
  self.isPC = CommonUtils.GetDeviceTypeByPlatformName() == "PC"
  self.isGamePad = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
  self.Text_Btn:SetText(Text)
  self.ExcuteObj = Obj
  self.ExcuteFunc = Func
  self.Btn_Click.OnClicked:Add(self.ExcuteObj, self.ExcuteFunc)
  self.Key_Text:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Img",
        Text = nil,
        ImgShortPath = GamepadImg
      }
    }
  })
  self:RefreshUI()
  self:BindInputMethodChangedDelegate()
end

function M:RefreshUI()
  if not self.isPC then
    return
  end
  if self.isGamePad then
    self.Key_Text:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_Text:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:BindInputMethodChangedDelegate()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(GameInputModeSubsystem) then
    GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.OnInputMethodChanged)
  end
end

function M:UnBindInputMethodChangedDelegate()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(GameInputModeSubsystem) then
    GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.OnInputMethodChanged)
  end
end

function M:OnInputMethodChanged(CurInputDevice, CurGamepadName)
  self.isGamePad = CurInputDevice == ECommonInputType.Gamepad
  self:RefreshUI()
end

return M
