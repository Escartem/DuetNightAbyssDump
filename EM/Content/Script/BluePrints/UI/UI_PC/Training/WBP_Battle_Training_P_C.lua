local WBP_Battle_Training_P_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Battle_Training_P_C:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.bIsFocusable = true
  self.IsAllowEscape = true
  self.IsInLSMode = false
  self.Super.InitUIInfo(self, Name, true, EventList, ...)
  self.Tab:Init({
    DynamicNode = {"Back", "BottomKey"},
    TitleName = GText("UI_DUNGEON_DES_TRAINING_1"),
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.Close,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.Close,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    },
    StyleName = "Text",
    OwnerPanel = self,
    BackCallback = self.Close,
    InfoCallback = "NotShow",
    LeftKey = "NotShow",
    RightKey = "NotShow"
  })
  self.WBP_Training_Root:InitMonsterGallery(self)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "Training", nil)
  self:RefreshBaseInfo()
  self:InitListenEvent()
end

function WBP_Battle_Training_P_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
end

function WBP_Battle_Training_P_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
  self.WBP_Training_Root:InitListenEvent()
end

function WBP_Battle_Training_P_C:RefreshBaseInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
  self.WBP_Training_Root:RefreshBaseInfo()
end

function WBP_Battle_Training_P_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if IsUseKeyAndMouse then
  else
    local DefaultFocusWidget = self:GetDesiredFocusTarget()
    if nil ~= DefaultFocusWidget then
      self.GameInputModeSubsystem:SetTargetUIFocusWidget(DefaultFocusWidget)
    end
  end
end

function WBP_Battle_Training_P_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if "F4" == InKeyName then
    IsEventHandled = true
    self:Close()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return self.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
  end
end

function WBP_Battle_Training_P_C:ReceiveEnterState(StackAction)
  self.DelayFuncs = {}
  self.Overridden.ReceiveEnterState(self, StackAction)
end

function WBP_Battle_Training_P_C:ReceiveExitState(StackAction)
  self.Overridden.ReceiveExitState(self, StackAction)
  self.WBP_Training_Root:UnInitMonsterGallery()
end

function WBP_Battle_Training_P_C:Close()
  AudioManager(self):SetEventSoundParam(self, "Training", {ToEnd = 1})
  self.Super.Close(self)
end

return WBP_Battle_Training_P_C
