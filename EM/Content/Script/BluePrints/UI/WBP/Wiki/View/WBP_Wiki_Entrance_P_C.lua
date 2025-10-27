require("UnLua")
local UIUtils = require("Utils.UIUtils")
local WikiController = require("BluePrints.UI.WBP.Wiki.WikiController")
local WikiCommon = require("BluePrints.UI.WBP.Wiki.WikiCommon")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Super.Construct(self)
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  local TabInfo = {
    PlatformName = "PC",
    DynamicNode = {"Back", "BottomKey"},
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_Select"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.CloseSelf
          }
        },
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    },
    OwnerPanel = self,
    BackCallback = self.CloseSelf,
    StyleName = "Icon",
    TitleName = GText("UI_Wiki_MainTitle")
  }
  self.Com_Tab:Init(TabInfo)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "WikiEntrance", nil)
  self.WBP_Encyclopedia_Entrance:SetFocus()
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.WBP_Encyclopedia_Entrance:Initialize(self)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local ParentHandled = M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Escape" == InKeyName then
    self:CloseSelf()
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if InKeyName == Const.GamepadFaceButtonRight then
      self:CloseSelf()
    elseif InKeyName == UIConst.GamePadKey.SpecialLeft then
      self.WBP_Encyclopedia_Entrance:OnAwardClicked()
    end
  end
  return ParentHandled
end

function M:Destruct()
  self.IsCloseSelf = false
  self.Super.Destruct(self)
end

function M:CloseSelf()
  self.IsCloseSelf = true
  if self:IsAnimationPlaying(self.Auto_In) or self.WBP_Encyclopedia_Entrance.IsHide then
    return
  end
  AudioManager(self):SetEventSoundParam(self, "WikiEntrance", {ToEnd = 1})
  self:Close()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
end

function M:InitListenEvent()
  local PlayerController = self:GetOwningPlayer()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshBaseInfo()
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
  self.CurGamepadName = CurGamepadName
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  local ActiveWidgetIndex = IsUseKeyAndMouse and 0 or 1
  if IsUseKeyAndMouse then
  elseif self:HasAnyUserFocus() then
    self.WBP_Encyclopedia_Entrance.WBP_Encyclopedia_Influence:SetFocus()
  end
  self.CurInputDevice = CurInputDevice
end

return M
