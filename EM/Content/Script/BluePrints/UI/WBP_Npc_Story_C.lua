require("UnLua")
local BP_Npc_Story_C = Class("BluePrints.UI.BP_UIState_C")
local UIUtils = require("Utils.UIUtils")

function BP_Npc_Story_C:Construct()
  self.Super.Construct(self)
  self.Btn_Cloce.OnClicked:Add(self, self.BtnBackOnClick)
  self:ChangePlayerInputable(false)
  AudioManager(self):PlayUISound(self, "event:/ui/common/npc_info_panel", "NpcStory", nil)
  self.Text_Tips:SetText(GText("UI_TRAIN_CLOSE"))
  self.ExecOnClose = nil
end

function BP_Npc_Story_C:InitUIInfo(Name, IsInUIMode, EventList, Title, Context, AnimationName, AgeInfo)
  BP_Npc_Story_C.Super.InitUIInfo(self, Name, IsInUIMode, EventList, Title, Context, AnimationName, AgeInfo)
  self.Text_StoryDetail:SetText(Context)
  self.Text_NpcStoryTitle:SetText(Title)
  if AgeInfo then
    self.Text_AgeTitle:SetVisibility(ESlateVisibility.Visible)
    self.Text_AgeNum:SetVisibility(ESlateVisibility.Visible)
    self.Text_AgeTitle:SetText(GText("NpcBiography_AgeText"))
    self.Text_AgeNum:SetText(AgeInfo)
  else
    self.Text_AgeTitle:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_AgeNum:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function BP_Npc_Story_C:OnLoaded(Title, Context, AnimationName, AgeInfo)
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:SetCanInteractiveTrigger(false, "WBP_Story_NPC_C")
  self:UnbindAllFromAnimationFinished(self.In)
  self:BindToAnimationFinished(self.In, {
    self,
    function()
      self:InitDeviceInfo()
      self:InitListenEvent()
    end
  })
  self:PlayAnimation(self.In)
end

function BP_Npc_Story_C:Destruct()
  self.ExecOnClose = nil
  BP_Npc_Story_C.Super.Destruct(self)
end

function BP_Npc_Story_C:BtnBackOnClick()
  self:ChangePlayerInputable(true)
  AudioManager(self):PlayUISound(self, "event:/ui/common/npc_info_panel", "NpcStory", nil)
  self:Close()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  PlayerCharacter:SetCanInteractiveTrigger(true, "WBP_Story_NPC_C")
end

function BP_Npc_Story_C:Close()
  AudioManager(self):SetEventSoundParam(self, "NpcStory", {ToEnd = 1})
  self.Super.Close(self)
  local ExecOnClose = self.ExecOnClose
  self.ExecOnClose = nil
  if ExecOnClose then
    ExecOnClose()
  end
end

function BP_Npc_Story_C:RealClose()
  BP_Npc_Story_C.Super.RealClose(self)
  local ExecOnRealClose = self.ExecOnRealClose
  self.ExecOnRealClose = nil
  if ExecOnRealClose then
    ExecOnRealClose()
  end
end

function BP_Npc_Story_C:BindOnRealClose(OnClose)
  self.ExecOnRealClose = OnClose
end

function BP_Npc_Story_C:UnBindOnRealClose()
  self.ExecOnRealClose = nil
end

function BP_Npc_Story_C:BindOnClose(OnClose)
  self.ExecOnClose = OnClose
end

function BP_Npc_Story_C:UnBindOnClose()
  self.ExecOnClose = nil
end

function BP_Npc_Story_C:ChangePlayerInputable(Inputable)
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local bInMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
  if not Inputable then
    self:SetInputUIOnly(true)
    if not bInMobile then
      local CenterPos = UE4.UWidgetLayoutLibrary.GetViewportSize(self)
      PlayerController:SetMouseLocation(math.floor(CenterPos.X / 2), math.floor(CenterPos.Y / 2))
    end
    UE4.UGameplayStatics.SetGlobalTimeDilation(self, 0)
  else
    self:SetInputUIOnly(false)
    UE4.UGameplayStatics.SetGlobalTimeDilation(self, 1.0)
  end
end

function BP_Npc_Story_C:OnKeyDown(MyGeometry, InKeyEvent)
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

function BP_Npc_Story_C:Handle_OnGamePadDown(InKeyName)
  if "Gamepad_FaceButton_Right" == InKeyName then
    self:BtnBackOnClick()
    return true
  end
  return false
end

function BP_Npc_Story_C:Handle_OnPCDown(InKeyName)
  if "Escape" == InKeyName then
    self:BtnBackOnClick()
    return true
  end
  return false
end

function BP_Npc_Story_C:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightAnalogY then
    local DeltaOffset = -1 * UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 5
    local CurrentOffset = self.ScrollBox_StoryDetail:GetScrollOffset()
    local NextOffset = math.clamp(CurrentOffset + DeltaOffset, 0, self.ScrollBox_StoryDetail:GetScrollOffsetOfEnd())
    self.ScrollBox_StoryDetail:SetScrollOffset(NextOffset)
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

function BP_Npc_Story_C:InitDeviceInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function BP_Npc_Story_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function BP_Npc_Story_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("thy     CurGamepadName", CurGamepadName)
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self:InitUI()
end

function BP_Npc_Story_C:InitUI()
  if self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard or self.CurInputDeviceType == ECommonInputType.Touch then
    self.WS:SetActiveWidgetIndex(0)
  else
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "RV"}
        },
        Desc = GText("UI_Controller_Slide")
      },
      {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_Controller_Close")
      }
    }
    if not UIUtils.CheckScrollBoxCanScroll(self.ScrollBox_StoryDetail) then
      table.remove(BottomKeyInfo, 1)
    end
    self.Key_Tips:UpdateKeyInfo(BottomKeyInfo)
    self.WS:SetActiveWidgetIndex(1)
  end
end

return BP_Npc_Story_C
