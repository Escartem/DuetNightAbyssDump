require("UnLua")
local CircleAroundMap = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})

function CircleAroundMap:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.PointerArray = {}
  self.BlockArray = {}
  self.Difficulty = 0
  self.MapIndex = 0
  self.UseActor = nil
  self.Time = 0
  self.ActiveSwitch = 0
  self.IsQuitGame = false
  self.PointerSpeed = 0
  self.KeyDown = false
  self.bMapIndexIsLocked = false
  self.bCanEscape = false
  self.MiniGame_Time.Text_Time:SetColorAndOpacity(UE4.UUIFunctionLibrary.GetSlateColorByRGBA(1, 1, 1, 1))
  self.IsShowingCursor = false
  self.bGameStart = true
  self.isPC = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
  self.InputDevice = UIUtils.UtilsGetCurrentInputType()
  self:InitUIWithPlatform()
  self:InitItemArray()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local PlayerController = PlayerCharacter:GetController()
  self:SetInputUIOnly(true)
  self:SetCursor(0)
  PlayerCharacter:SetCharacterTag("Interactive")
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/mech_rotate_start", "", nil)
end

function CircleAroundMap:InitUIWithPlatform()
  if self.isPC then
    self.WidgetSwitcher_Hint:SetActiveWidgetIndex(0)
    self.Key_Hint:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_Hint:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "SpaceBar"}
      }
    })
    self.Key_Hint_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_Hint_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      }
    })
    self.MiniGame_Time.Key:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.MiniGame_Time.Key:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "SpaceBar"}
      }
    })
    self.MiniGame_Time.Key_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.MiniGame_Time.Key_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      }
    })
  else
    self.WidgetSwitcher_Hint:SetActiveWidgetIndex(1)
  end
end

function CircleAroundMap:InitItemArray()
  table.insert(self.PointerArray, self.MiniGame_Pointer_PC)
  table.insert(self.PointerArray, self.MiniGame_Pointer_PC_1)
  table.insert(self.BlockArray, self.MiniGame_Block_PC)
  for i = 1, 23 do
    table.insert(self.BlockArray, self["MiniGame_Block_PC_" .. i])
  end
end

function CircleAroundMap:InitCrack()
  if not self.bCanCrack then
    return
  end
  local Param = {
    RootPage = self,
    SuccCallBack = self.GameSuccess,
    NeedCrack = true,
    NeedReset = false
  }
  self.MiniGame_Crack:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.MiniGame_Crack:Init(Param)
end

function CircleAroundMap:InitAfterBeginPlay()
  self:PlayAnimation(self.In)
  self:PlayAnimation(self.Gear_Loop, 0, 0)
  self:PlayAnimation(self.KeyClose_In)
  self:AddTimer(self.KeyClose_In:GetEndTime(), self.RealBeginGameAfterIn)
  EventManager:FireEvent(EventID.CircleAroundGameStart)
  if not self.bMapIndexIsLocked then
    self.MapIndex = self.MapIndex % #DataMgr["MiniGameBattery" .. self.Difficulty] + 1
    local MinMapIndex
    if 0 == self.MapIndex % 4 then
      MinMapIndex = self.MapIndex - 3
    else
      MinMapIndex = 4 * math.floor(self.MapIndex / 4) + 1
    end
    self.MapIndex = math.max(MinMapIndex, self.MapIndex - math.floor(self.FailedTime / 4))
  end
  self.PointerSpeed = DataMgr["MiniGameBattery" .. self.Difficulty][self.MapIndex].PointerSpeed
  local MinPointerSpeed = DataMgr.MiniGameBattery1[1].PointerSpeed
  self.PointerSpeed = math.min(MinPointerSpeed, self.PointerSpeed + math.floor(self.FailedTime / 2))
  self:InitPointerAndBlock()
  self:InitTextTimerAndButton()
  self:InitCrack()
  self:RefreshHintWidget()
  self:BindInputMethodChangedDelegate()
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    self.MiniGame_Time.WidgetSwitcher_MP:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function CircleAroundMap:RealBeginGameAfterIn()
  self.bCanEscape = true
  if not self.isPC then
    self.Btn_Close:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function CircleAroundMap:InitPointerAndBlock()
  local TableInfo = DataMgr["MiniGameBattery" .. self.Difficulty][self.MapIndex]
  self.SwitchPosition = TableInfo.SwitchPosition
  self.SwitchStatus = TableInfo.SwitchStatus
  if #self.SwitchPosition ~= #self.SwitchStatus then
    self:Close()
    return
  end
  for i = 1, #self.SwitchStatus do
    if 1 == self.SwitchStatus[i] then
      self.BlockArray[self.SwitchPosition[i] + 1]:ChangeActiveState("IsActived")
      self.ActiveSwitch = self.ActiveSwitch + 1
    else
      self.BlockArray[self.SwitchPosition[i] + 1]:ChangeActiveState("CanActive")
    end
  end
  if 1 == TableInfo.PointerNum then
    self.PointerArray[1]:InitPointer(self, 0, 10, self.PointerSpeed)
  elseif 2 == TableInfo.PointerNum then
    if 6 == #self.SwitchPosition then
      self.PointerArray[1]:InitPointer(self, 0, 10, self.PointerSpeed)
      self.PointerArray[2]:InitPointer(self, 60, 10, self.PointerSpeed)
    elseif 8 == #self.SwitchPosition then
      self.PointerArray[1]:InitPointer(self, 0, 10, self.PointerSpeed)
      self.PointerArray[2]:InitPointer(self, 90, 10, self.PointerSpeed)
    end
  end
  self:CheckIfGameSuccess()
end

function CircleAroundMap:InitTextTimerAndButton()
  local FloatHintText = GText("UI_MiniGame_Hint_ZhuanQuanQuan")
  local index = string.find(FloatHintText, "%$")
  self.Text_Float_1:SetText(string.sub(FloatHintText, 1, index - 1))
  self.Text_Float_2:SetText(GText("UI_MiniGame_Hint_ZhuanQuanQuan_Portal"))
  self.Text_Float:SetText(string.sub(FloatHintText, index + 1))
  local time_str = string.format("%02d:%02d", math.floor(self.Time / 60), self.Time % 60)
  self.MiniGame_Time.Text_Time:SetText(time_str)
  self:AddTimer(1, self.CountDown, true, 0, "CountDown", true)
  self.MiniGame_Text.Text_Success:SetText(GText("UI_MiniGame_Success"))
  self.MiniGame_Text.Text_Fail:SetText(GText("UI_MiniGame_Fail"))
  if self.isPC then
    self:RfreshCloseWidget()
    self.Key_Close:AddExecuteLogic(self, self.GameFailed)
  else
    self.Btn_Close:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_Close:Init("Close", self, self.OnBtnCloseClicked)
    self.Button_Area.OnPressed:Add(self, self.OnButtonAreaPressed)
    self.Button_Area.OnReleased:Add(self, self.OnButtonAreaReleased)
  end
end

function CircleAroundMap:OnButtonAreaPressed()
  if self.IsQuitGame or self.KeyDown then
    return
  end
  EventManager:FireEvent(EventID.CircleAroundTryToTriggerPointer)
  self.KeyDown = true
end

function CircleAroundMap:OnButtonAreaReleased()
  if self.IsQuitGame then
    return
  end
  self.KeyDown = false
end

function CircleAroundMap:OnBtnCloseClicked()
  if self.IsQuitGame or self.KeyDown then
    return
  end
  self:GameFailed()
end

function CircleAroundMap:OnKeyDown(MyGeometry, InKeyEvent)
  if self.IsQuitGame or self.KeyDown then
    return UE4.UWidgetBlueprintLibrary.Handled
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "SpaceBar" == InKeyName or InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    EventManager:FireEvent(EventID.CircleAroundTryToTriggerPointer)
    self.KeyDown = true
  end
  if "Escape" == InKeyName and self.bCanEscape then
    self:GameFailed()
  end
  if "LeftAlt" == InKeyName and not self.IsShowingCursor then
    self.IsShowingCursor = true
    self:ResetCursor()
  end
  if "F" == InKeyName or "Gamepad_FaceButton_Top" == InKeyName then
    self.MiniGame_Crack:OnClickCrackButton()
  end
  if InKeyName == UIConst.GamePadKey.FaceButtonRight and self.bCanEscape then
    self:GameFailed()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function CircleAroundMap:OnKeyUp(MyGeometry, InKeyEvent)
  if self.IsQuitGame then
    return UE4.UWidgetBlueprintLibrary.Handled
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "SpaceBar" == InKeyName or InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    self.KeyDown = false
  end
  if "LeftAlt" == InKeyName and self.IsShowingCursor then
    self.IsShowingCursor = false
    self:SetCursor(0)
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function CircleAroundMap:OnFocusReceived(MyGeometry, InFocusEvent)
  self.IsShowingCursor = false
  self:SetCursor(0)
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function CircleAroundMap:Close(Value)
  self.bGameStart = false
  self.UseActor:SetVariableBool("IsGameSuccess", Value, UE4.UGameplayStatics.GetPlayerPawn(self, 0).Eid)
  self.UseActor.ChestInteractiveComponent:EndInteractive(UE4.UGameplayStatics.GetPlayerPawn(self, 0))
  self:UnBindInputMethodChangedDelegate()
  self.Super.Close(self)
end

function CircleAroundMap:GameSuccess()
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/mech_rotate_pointer_success", "", nil)
  self.IsQuitGame = true
  self:RemoveTimer("CountDown", true)
  for i = 1, 2 do
    self.PointerArray[i].BeginTick = false
  end
  EventManager:FireEvent(EventID.CircleAroundGameSuccess)
  self:PlayAnimation(self.Success, 0, 1, UE4.EUMGSequencePlayMode.Reverse)
  self:AddTimer(1, self.Close, false, 0, "CircleAroundClose", true, true)
end

function CircleAroundMap:GameFailed()
  if self.IsQuitGame then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/mech_rotate_fail", "", nil)
  self.IsQuitGame = true
  self:RemoveTimer("CountDown", true)
  for i = 1, 2 do
    self.PointerArray[i].BeginTick = false
  end
  EventManager:FireEvent(EventID.CircleAroundGameFailed)
  self:PlayAnimation(self.Fail)
  self:AddTimer(1, self.Close, false, 0, "CircleAroundClose", true, false)
end

function CircleAroundMap:CheckIfInputRegionHasSwitch(LowIndex, HighIndex)
  for i = 1, #self.SwitchPosition do
    if LowIndex <= self.SwitchPosition[i] and HighIndex >= self.SwitchPosition[i] then
      return self.SwitchPosition[i]
    end
  end
  return nil
end

function CircleAroundMap:CountDown()
  local time_str = string.format("%02d:%02d", math.floor(self.Time / 60), self.Time % 60)
  self.MiniGame_Time.Text_Time:SetText(time_str)
  if self.Time <= 3 then
    self.MiniGame_Time:PlayAnimation(self.MiniGame_Time.Warning)
  end
  if self.Time <= 0 then
    self:GameFailed()
    return
  end
  self.Time = self.Time - 1
end

function CircleAroundMap:TriggerBlock(BlockIndex)
  self.BlockArray[BlockIndex]:Trigger()
  if self.BlockArray[BlockIndex].ActiveState == "IsActived" then
    self.ActiveSwitch = self.ActiveSwitch + 1
  else
    self.ActiveSwitch = self.ActiveSwitch - 1
  end
  self:CheckIfGameSuccess()
end

function CircleAroundMap:CheckIfGameSuccess()
  if self.ActiveSwitch == #self.SwitchPosition then
    self:GameSuccess()
  end
end

function CircleAroundMap:BindInputMethodChangedDelegate()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(GameInputModeSubsystem) then
    GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.OnInputMethodChanged)
  end
end

function CircleAroundMap:UnBindInputMethodChangedDelegate()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(GameInputModeSubsystem) then
    GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.OnInputMethodChanged)
  end
end

function CircleAroundMap:OnInputMethodChanged(NewGameInputType, NewGamepadName)
  if self.InputDevice == NewGameInputType then
    return
  end
  self.InputDevice = NewGameInputType
  self:RefreshHintWidget()
  self:RfreshCloseWidget()
end

function CircleAroundMap:RefreshHintWidget()
  if not self.isPC then
    return
  end
  if self.InputDevice == ECommonInputType.Gamepad then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
    self.MiniGame_Time.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
  else
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
    self.MiniGame_Time.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
  end
end

function CircleAroundMap:RfreshCloseWidget()
  if not self.isPC then
    return
  end
  if self.InputDevice == ECommonInputType.Gamepad then
    self.Key_Close:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    })
  else
    self.Key_Close:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "Escape"}
      },
      Desc = GText("UI_BACK"),
      bLongPress = false,
      bEnableEvent = true
    })
  end
end

function CircleAroundMap:Destruct()
  if self.bGameStart then
    self:SetInputUIOnly(false)
    self.UseActor:ChangeState("InteractBreak", self.UseActor.PlayerEid)
  end
  self.Super.Destruct(self)
end

return CircleAroundMap
