local SWITCH_BTN_KEYBOARD = "RightMouseButton"
local SWITCH_BTN_GAMEPAD = "Gamepad_RightShoulder"
local TITLE_TEXT_KEYS = {
  "BATTLE_WHEEL_DISPLAY_TITLE1",
  "BATTLE_WHEEL_DISPLAY_TITLE2",
  "BATTLE_WHEEL_DISPLAY_TITLE3"
}
local M = Class("BluePrints.UI.BP_UIState_C")

function M:UpdateArgs(Params)
  DebugPrint("gmy@WBP_Battle_Menu_P_C M:UpdateArgs", Params)
  self:InitEvents()
  self.Battle_Menu:UpdateArgs(Params)
end

function M:SelectAndCloseMenu()
  self:StopAllAnimations()
  self.Battle_Menu:SelectAndCloseMenu()
  self:Close()
end

function M:InitUIInfo(Name, bInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, bInUIMode, EventList, ...)
  local ShortPath = "RightMouseButton"
  local CurMode = self.GameInputModeSubsystem:GetCurrentInputType()
  local KeyInfoList = {}
  if CurMode == ECommonInputType.Gamepad then
    ShortPath = "RB"
    self.bIsGamepad = true
    self.GameInputModeSubsystem:SetNavigateWidgetVisibility(true)
    self.GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
    KeyInfoList = {
      {Type = "Img", ImgShortPath = ShortPath}
    }
  else
    KeyInfoList = {
      {Type = "Text", Text = ShortPath}
    }
  end
  self.Key_Option:CreateCommonKey({KeyInfoList = KeyInfoList})
  if self.Battle_Menu then
    self.Battle_Menu.Owner = self
  end
end

function M:OnLoaded()
  DebugPrint("gmy@WBP_Battle_Menu_P_C M:OnLoaded", self, self.Battle_Menu, self.Com_Bg)
end

function M:CalculateMousePos()
  local Geometry = self.Battle_Menu.Bg01:GetTickSpaceGeometry()
  local LocalCenter = USlateBlueprintLibrary.GetLocalSize(Geometry) / 2
  local WheelCenter = USlateBlueprintLibrary.LocalToAbsolute(Geometry, LocalCenter)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local _, ViewportPosition = USlateBlueprintLibrary.AbsoluteToViewport(self, WheelCenter)
  local WidgetGeometry = self:GetTickSpaceGeometry()
  local LocalSize = USlateBlueprintLibrary.GetLocalSize(WidgetGeometry)
  local PixelSize = UIManager(self):GetViewportSize()
  local MouseX = ViewportPosition.X / LocalSize.X * PixelSize.X
  local MouseY = ViewportPosition.Y / LocalSize.Y * PixelSize.Y
  PlayerController:SetMouseLocation(math.floor(MouseX), math.floor(MouseY))
end

function M:Construct()
  self.FrameCounter = 0
end

function M:Tick(MyGeometry, InDeltaTime)
  self.FrameCounter = self.FrameCounter + 1
  if 3 == self.FrameCounter then
    self:CalculateMousePos()
  end
end

function M:InitEvents()
  DebugPrint("gmy@WBP_Battle_Menu_P_C M:InitEvents")
  self:AddDispatcher(EventID.GameViewportInputKeyReleased, self, self.HandleKeyReleased)
  self:AddDispatcher(EventID.OnDisplayIndexChanged, self, self.RefreshDisplayIndex)
end

function M:HandleKeyReleased(Key)
  DebugPrint("gmy@WBP_Battle_Menu_P_C M:HandleKeyReleased", self.Battle_Menu, Key.KeyName)
  local BattleWheelKey = CommonUtils:GetKeyName("OpenBattleWheel")
  if SWITCH_BTN_KEYBOARD == Key.KeyName or SWITCH_BTN_GAMEPAD == Key.KeyName then
    self.Battle_Menu:OnChangeDisplayWheel()
  elseif Key.KeyName == BattleWheelKey then
    self:AddTimer(2, function()
      DebugPrint("gmy@WBP_Battle_Menu_P_C M:HandleKeyReleased11111", self.Battle_Menu.bIsClosing)
      local PlayerCharacter = GWorld:GetMainPlayer()
      if PlayerCharacter and not self.Battle_Menu.bIsClosing then
        PlayerCharacter:CloseBattleWheel()
      end
    end)
  end
end

function M:RefreshDisplayIndex(DisplayIndex)
  local TitleText = GText(TITLE_TEXT_KEYS[DisplayIndex])
  DebugPrint("gmy@WBP_Battle_Menu_P_C M:RefreshDisplayIndex", TitleText)
  self.Text_Name:SetText(GText("MAIN_UI_BATTLEWHEEL"))
  self.Text_Num:SetText(DisplayIndex)
  self.Text_Option:SetText(GText("BattleWheel_SwitchWheel"))
end

function M:Destruct()
  M.Super.Destruct(self)
  self:RemoveAllDispatcher()
end

function M:CloseMenu()
  self:StopAllAnimations()
  self.Battle_Menu:CloseMenu()
  self:Close()
end

return M
