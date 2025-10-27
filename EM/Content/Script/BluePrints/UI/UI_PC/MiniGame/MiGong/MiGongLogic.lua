require("UnLua")
local MiGongLogic = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})

function MiGongLogic:OnKeyDown(MyGeometry, InKeyEvent)
  if self.bIsAnim then
    return
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = true
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    DebugPrint("thy    Key_IsGamepadKey", InKeyName)
    IsEventHandled = self:Handle_OnGamePadDown(InKeyName)
  else
    DebugPrint("thy    Key_IsPC", InKeyName)
    IsEventHandled = self:Handle_OnPCDown(InKeyName)
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function MiGongLogic:Construct()
  self.Overridden.Construct(self)
  self.GameMap = {}
  self.bMapIndexIsLocked = false
  self.ArrowArray = {}
  self.StartBarArray = {}
  self.EndBarArray = {}
  self.EndAnimSequenceComponent = {}
  self.BarMap:Clear()
  self.Path = {}
  self.Symmetry = {1, 1}
  self.Finish = false
  self.DeviceInPc = CommonUtils.GetDeviceTypeByPlatformName(self) ~= "Mobile"
  self.Overridden.Construct(self)
  self.Radius = 90
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/mech_rotate_start", "", nil)
  self.UseGamepadControl = false
  self.GamepadCurrentDragArrowIndex = 1
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    self.GamepadStart = true
    self.UseGamepadControl = true
  end
end

function MiGongLogic:InitAfterBeginPlay()
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  self.UIManager = GameInstance:GetGameUIManager()
  self:InitMap()
  self:AddTimer(0.1, self.InitAll, false)
  self.CountDownHandle = self:AddTimer(1, self.SetCountDownText, true, -1)
  self.MobileMoveX = 0
  self.MobileMoveY = 0
  self.MobileMoveHandle = self:AddTimer(0.05, self.MobileMove, true, -1)
  self.bGameStart = true
  self:PlayInAnim()
  self:PlayAnimation(self.Gear_Loop, 0, 0)
end

function MiGongLogic:InitAll()
  local PlayerCharacter = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  local PlayerController = PlayerCharacter:GetController()
  self:SetInputUIOnly(true)
  PlayerCharacter:SetCharacterTag("Interactive")
  self:InitTextTimerAndButton()
  self:InitProgressBar()
  self:InitArrow()
  self:InitCrack()
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
end

function MiGongLogic:InitTextTimerAndButton()
  if self.DeviceInPc then
    self.Key_Close:CreateCommonKey({
      KeyInfoList = {
        {Type = "Text", Text = "Esc"}
      },
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      bLongPress = false,
      Desc = GText("UI_BACK")
    })
    self.Key_Close:AddExecuteLogic(self, self.PlayFailAnim)
    self.Key_Close_GamePad:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    })
    self.Key_Switch:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "LS"}
      },
      Desc = GText("UI_Controller_Switch")
    })
    self.Key_Move:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "L"}
      },
      Desc = GText("UI_CTL_MinGame_Move")
    })
  else
    self.Button_Close:Init("Close", self, self.PlayFailAnim)
  end
  self.Text_Float:SetText(GText("UI_MiniGame_Hint_LianXian_1"))
  self.MiniGame_Text.Text_Success:SetText(GText("UI_MiniGame_Success"))
  self.MiniGame_Text.Text_Fail:SetText(GText("UI_MiniGame_Fail"))
end

function MiGongLogic:InitProgressBar()
  local UIChildren = self.GamePanel:GetAllChildren()
  for i, v in pairs(UIChildren) do
    self:InitAllProgressBar(v)
  end
end

function MiGongLogic:InitAllProgressBar(InActor)
  if InActor.IsArrow then
    return
  end
  InActor.RootWidget = self
  InActor:SetLeftRightTopDown()
  InActor:RegisterSelf()
  InActor:ChangeColor(self.NormalColor)
end

function MiGongLogic:InitCrack()
  local Param = {
    RootPage = self,
    SuccCallBack = self.PlayOnEndAnim,
    ResetCallBack = self.Reset,
    NeedCrack = true,
    NeedReset = true
  }
  if not self.bCanCrack then
    Param.NeedCrack = false
  end
  self.MiniGame_Crack:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.MiniGame_Crack:Init(Param)
end

function MiGongLogic:PlayInAnim()
  self:PlayAnimation(self.In)
  for i, v in pairs(self.ArrowArray) do
    v:PlayAnimation(v.Loop, 0, 3)
  end
end

function MiGongLogic:PlayTimeOutAnim()
  self:PlayAnimation(self.Warning, 0, 15)
end

function MiGongLogic:PlayOnEndAnim()
  AudioManager(self):SetEventSoundParam(self, "MiGongArrowMove", {drag = 0})
  self.bIsAnim = true
  self.MiniGame_Text.Switcher_Tip:SetRenderOpacity(1)
  self.MiniGame_Text.Switcher_Tip:SetActiveWidgetIndex(0)
  self:BindToAnimationFinished(self.FinishAnim, {
    self,
    self.GameOverTrue
  })
  self:PlayAnimationReverse(self.FinishAnim)
  self.UseActor:SetVariableBool("IsGameSuccess", true, UE4.UGameplayStatics.GetPlayerPawn(self, 0).Eid)
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/mech_rotate_pointer_success", "", nil)
end

function MiGongLogic:PlayFailAnim()
  if self.bIsAnim then
    return
  end
  AudioManager(self):SetEventSoundParam(self, "MiGongArrowMove", {drag = 0})
  self.bIsAnim = true
  self:ChangeColor(UE4.UUIFunctionLibrary.StringToLinearColor("B43131"))
  self.MiniGame_Text.Switcher_Tip:SetRenderOpacity(1)
  self.MiniGame_Text.Switcher_Tip:SetActiveWidgetIndex(1)
  self.MiniGame_Text.Text_Fail:SetText(GText("UI_MiniGame_Fail"))
  self:BindToAnimationFinished(self.FailFail, {
    self,
    self.RealGameFailed
  })
  self:PlayAnimation(self.FailFail)
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/mech_rotate_fail", "", nil)
end

function MiGongLogic:PlayErrorAnim()
  AudioManager(self):SetEventSoundParam(self, "MiGongArrowMove", {drag = 0})
  self.bIsAnim = true
  self.MiniGame_Text.Switcher_Tip:SetActiveWidgetIndex(1)
  self.MiniGame_Text.Text_Fail:SetText(GText("UI_MiniGame_Hint_LianXian_2"))
  self:PlayAnimation(self.Error)
end

function MiGongLogic:GameOverTrue()
  AudioManager(self):SetEventSoundParam(self, "MiGongArrowMove", {drag = 0})
  self.bIsAnim = false
  self:GameOver(true)
end

function MiGongLogic:GameFailed()
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/mech_rotate_fail", "", nil)
  self:RealGameFailed()
end

function MiGongLogic:RealGameFailed()
  AudioManager(self):SetEventSoundParam(self, "MiGongArrowMove", {drag = 0})
  self.bIsAnim = false
  self:GameOver(false)
end

function MiGongLogic:SetCountDownText()
  if self.Finish then
    return
  end
  local ShowText = "00:" .. self.Time
  if self.Time < 10 then
    ShowText = "00:0" .. self.Time
  end
  self.MiniGame_Time.Text_Time:SetText(ShowText)
  self.Time = self.Time - 1
  if self.Time <= 9 then
    self:PlayTimeOutAnim()
  end
  if self.Time <= -1 then
    self.Time = 0
    self:RemoveTimer(self.CountDownHandle)
    self:RemoveTimer(self.MobileMoveHandle)
    self:PlayFailAnim()
  end
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/mech_maze_countdown", nil, nil)
end

function MiGongLogic:TryGameOver()
  for i, v in pairs(self.EndBarArray) do
    if 1 ~= v:GetPercent() then
      return
    end
  end
  self.bIsResetting = true
  self.bCanDrag = false
  self.Finish = true
  self:PlayOnEndAnim()
end

function MiGongLogic:GameOver(Value)
  if self.bIsAnim then
    return
  end
  if true == Value then
    UEPrint("game over with true")
  else
    UEPrint("game over with false")
  end
  self:SetInputUIOnly(false)
  AudioManager(self):StopSound(self, "MiGongArrowMove")
  self.bGameStart = false
  self.UseActor:SetVariableBool("IsGameSuccess", Value, UE4.UGameplayStatics.GetPlayerPawn(self, 0).Eid)
  self.UseActor.ChestInteractiveComponent:EndInteractive(UE4.UGameplayStatics.GetPlayerPawn(self, 0))
  self.GamePanel:ClearChildren()
  self:Close()
  self.UIManager:UnLoadUI("ConnectLine")
end

function MiGongLogic:Tick()
  if not (not self.bIsResetting and self.bCanDrag) or self.NowBarArray:Length() < 1 or self.bIsAnim then
    return
  end
  if self.UseGamepadControl then
    return
  end
  local ArrowX, ArrowY = self.NowBarArray[self.CurrentDragArrowIndex]:SetMoveRange(nil, nil)
  self:SetArrowPosition(ArrowX, ArrowY)
end

function MiGongLogic:GetMouseLocal(InputLoc)
  local ViewportPos = FVector2D(0, 0)
  UE4.USlateBlueprintLibrary.LocalToViewport(self, self.GamePanel:GetCachedGeometry(), FVector2D(0, 0), nil, ViewportPos)
  if self.ViewportLocalRate then
    self.PointerPosition = (InputLoc - ViewportPos) / self.ViewportLocalRate
  else
    self.PointerPosition = InputLoc - ViewportPos
  end
end

function MiGongLogic:OnTouchStarted(MyGeometry, InTouchEvent)
  self.bTouchInJoystickArea = self:IsTouchInJoystickArea(InTouchEvent)
  if self.bTouchInJoystickArea then
    local Scale = UE4.UWidgetLayoutLibrary.GetViewportScale(self)
    local ScreenSpacePosition = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InTouchEvent)
    self.StartTouchPos = UE4.USlateBlueprintLibrary.AbsoluteToLocal(MyGeometry, ScreenSpacePosition) * Scale
    self:PlayArrowAnimation()
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/mech_maze_drag", "MiGongArrowMove", nil)
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local Coordinate = UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InTouchEvent)
  local _, ViewportPosition = USlateBlueprintLibrary.AbsoluteToViewport(self, Coordinate)
  self:GetMouseLocal(ViewportPosition)
  self:CheckIfPointerInArrow()
  local UnHandled = UE4.UWidgetBlueprintLibrary.UnHandled()
  return UnHandled
end

function MiGongLogic:OnTouchMoved(MyGeometry, InTouchEvent)
  if self.bTouchInJoystickArea then
    local Scale = UE4.UWidgetLayoutLibrary.GetViewportScale(self)
    local ScreenSpacePosition = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InTouchEvent)
    local CurrentTouchPos = UE4.USlateBlueprintLibrary.AbsoluteToLocal(MyGeometry, ScreenSpacePosition) * Scale
    local DeltaPos = CurrentTouchPos - self.StartTouchPos
    self:ButtonMove(DeltaPos)
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local Coordinate = UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InTouchEvent)
  local _, ViewportPosition = USlateBlueprintLibrary.AbsoluteToViewport(self, Coordinate)
  self:GetMouseLocal(ViewportPosition)
  local Handled = UE4.UWidgetBlueprintLibrary.Handled()
  return Handled
end

function MiGongLogic:OnTouchEnded(InGeometry, InGestureEvent)
  return self:ButtonUp(nil, nil)
end

function MiGongLogic:IsTouchInJoystickArea(InTouchEvent)
  if not self.Joystick then
    return false
  end
  local Coordinate = UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InTouchEvent)
  local Scale = UE4.UWidgetLayoutLibrary.GetViewportScale(self)
  local thisPos = UE4.USlateBlueprintLibrary.AbsoluteToLocal(MyGeometry, Coordinate) * Scale
  local JoystickWorldPos, JoystickWorldSize = self:GetWorldPos(self.Joystick)
  local JoystickWorldPos = UE4.USlateBlueprintLibrary.AbsoluteToLocal(MyGeometry, JoystickWorldPos) * Scale
  if thisPos.X > JoystickWorldPos.X and thisPos.X < JoystickWorldPos.X + JoystickWorldSize.X * Scale and thisPos.Y > JoystickWorldPos.Y and thisPos.Y < JoystickWorldPos.Y + JoystickWorldSize.Y * Scale then
    return true
  end
  return false
end

function MiGongLogic:GetWorldPos(Widget)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  if nil == UIManager then
    return FVector2D(0, 0), FVector2D(0, 0)
  end
  return UIManager:GetWorldPosition(Widget), UIManager:GetWidgetRenderSize(Widget)
end

function MiGongLogic:OnMouseMove(MyGeometry, InTouchEvent)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if Player.UIModePlatform ~= "PC" then
    local UnHandled = UE4.UWidgetBlueprintLibrary.UnHandled()
    return UnHandled
  end
  if self.UseGamepadControl then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  self:GetMouseLocal(UWidgetLayoutLibrary.GetMousePositionOnViewport(self))
  local Handled = UE4.UWidgetBlueprintLibrary.Handled()
  return Handled
end

function MiGongLogic:LuaReset()
  self:AddTimer(2, self.Reset, false)
  self:PlayErrorAnim()
end

function MiGongLogic:Reset()
  for i, v in pairs(self.BarMap) do
    v:Reset()
  end
  self.NowBarArray:Clear()
  self:ResetArrowsPosition()
  self:ChangeColor(self.NormalColor)
  for i, v in pairs(self.Path) do
    v:Clear()
  end
  self.bIsResetting = false
  self.bIsAnim = false
end

function MiGongLogic:OnMousePress()
  self:CheckIfPointerInArrow()
end

function MiGongLogic:OnMouseRelease()
  self.bCanDrag = false
  self.CurrentDragArrowIndex = nil
  self.ArrowItem = nil
  AudioManager(self):SetEventSoundParam(self, "MiGongArrowMove", {drag = 0})
end

function MiGongLogic:CheckIfPointerInArrow()
  for i, v in pairs(self.ArrowArray) do
    print(_G.LogTag, self.PointerPosition, v.Left, v.Right, v.Top, v.Down)
    v:SetLeftRightTopDown()
    if self.PointerPosition.X > v.Left - 10 and self.PointerPosition.X < v.Right + 10 and self.PointerPosition.Y < v.Top + 10 and self.PointerPosition.Y > v.Down - 10 then
      if not self.bCanDrag then
        AudioManager(self):PlayUISound(self, "event:/ui/minigame/mech_maze_drag", "MiGongArrowMove", nil)
      end
      self.bCanDrag = true
      self.CurrentDragArrowIndex = i
      UEPrint("Current Drag Arrow is " .. i)
      return
    end
  end
  self.bCanDrag = false
  self.CurrentDragArrowIndex = nil
  self.ArrowItem = nil
end

function MiGongLogic:InitArrow(Arrow, Direction)
  for i, v in pairs(self.StartBarArray) do
    local x = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(v):GetPosition().X
    local y = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(v):GetPosition().Y
    local Arrow = self:CreateWidgetNew("MiniGameArrow")
    Arrow.RootWidget = self
    self.Arrow = Arrow
    Arrow.ArrowOffset = self.Discrete / 2 - Arrow.GamePanel.Slot:GetSize().X / 2
    self.GamePanel:AddChild(Arrow):SetPosition(FVector2D(x + Arrow.ArrowOffset, y + Arrow.ArrowOffset))
    UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Arrow):SetZOrder(2)
    table.insert(self.ArrowArray, Arrow)
    v.Arrow = Arrow
    self.NowBarArray:Add(v)
    v.ArrowPosition = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(v.Arrow):GetPosition()
    table.insert(self.Path, TArray(UObject))
  end
  for i, v in pairs(self.ArrowArray) do
    v:SetLeftRightTopDown()
    v:SetZOrder(127)
  end
end

function MiGongLogic:SetArrowPosition(PositionX, PositionY)
  local CanSetArrow = true
  local OtherPositionX = PositionX
  local OtherPositionY = PositionY
  if -1 == self.Symmetry[1] then
    OtherPositionX = self.CenterPoint * 2 - PositionX
  end
  if -1 == self.Symmetry[2] then
    OtherPositionY = self.CenterPoint * 2 - PositionY
  end
  local OtherArrowPositions = {}
  for i, v in pairs(self.ArrowArray) do
    if i ~= self.CurrentDragArrowIndex then
      local OtherArrowPositionX, OtherArrowPositionY, HasNeighbor, AllowRange = self.NowBarArray[i]:SetMoveRange(OtherPositionX, OtherPositionY)
      OtherArrowPositions[i] = {OtherArrowPositionX, OtherArrowPositionY}
      if AllowRange < math.abs(OtherArrowPositionX - OtherPositionX) or AllowRange < math.abs(OtherArrowPositionY - OtherPositionY) or not HasNeighbor then
        CanSetArrow = false
        break
      end
    end
  end
  if CanSetArrow then
    for i, v in pairs(self.ArrowArray) do
      if v:IsAnimationPlaying(v.Loop) then
        v:StopAnimation(v.Loop)
      end
      if i == self.CurrentDragArrowIndex then
        v:SetArrowPosition(FVector2D(PositionX, PositionY), FVector2D(v.Width / 2, v.Height / 2))
        local Length = UE4.UKismetMathLibrary.VSize2D(v.TickPosDiff)
        AudioManager(self):SetEventSoundParam(self, "MiGongArrowMove", {
          drag = math.min(Length / 10, 1)
        })
      else
        v:SetArrowPosition(FVector2D(OtherArrowPositions[i][1], OtherArrowPositions[i][2]), FVector2D(v.Width / 2, v.Height / 2))
      end
    end
  end
end

function MiGongLogic:ResetArrowsPosition()
  for i, v in pairs(self.StartBarArray) do
    local StartPrefabPosition = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(v):GetPosition() + FVector2D(self.Discrete / 2, self.Discrete / 2)
    self.ArrowArray[i]:SetArrowPosition(StartPrefabPosition, FVector2D(self.ArrowArray[i].Width / 2, self.ArrowArray[i].Height / 2))
    self.NowBarArray:Add(v)
    v.Arrow = self.ArrowArray[i]
    v.ArrowPosition = StartPrefabPosition
  end
end

function MiGongLogic:GetGameMap()
  if self.MapTable == nil then
    return false
  end
  for i, v in pairs(self.MapTable) do
    local Value = ""
    for j, k in pairs(v) do
      Value = Value .. " " .. string.format("%02d", k)
    end
    print(_G.LogTag, "GameMap value " .. Value)
  end
end

function MiGongLogic:InitMap()
  local Size = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.GamePanel):GetSize()
  local OriginalPos = FVector2D(0, 0)
  local SizePos = FVector2D(0, 0)
  UE4.USlateBlueprintLibrary.LocalToViewport(self, self.GamePanel:GetCachedGeometry(), FVector2D(0, 0), nil, OriginalPos)
  UE4.USlateBlueprintLibrary.LocalToViewport(self, self.GamePanel:GetCachedGeometry(), Size, nil, SizePos)
  self.ViewportLength = (SizePos - OriginalPos) * UWidgetLayoutLibrary.GetViewportScale(self).X
  self.Length = Size.X
  self.Discrete = self.Length / 19
  self.CenterPoint = self.Discrete * 10
  self.MapTable = {}
  self.CrossTable = {}
  self.Index = 1
  for i = 1, 19 do
    local Row = {}
    for j = 1, 19 do
      table.insert(Row, j, 0)
    end
    table.insert(self.MapTable, i, Row)
  end
  if not self.bMapIndexIsLocked then
    self.MapIndex = self.MapIndex % #DataMgr["MiniGameMap" .. self.Difficulty] + 1
  end
  local PresetMap = DataMgr["MiniGameMap" .. self.Difficulty][self.MapIndex]
  for i, v in pairs(PresetMap) do
    if v.Type == "start" then
      self:LoadBar(3, v.Row, v.Row, v.Col, v.Col, v)
      if v.Symmetry == "Horizontal" then
        self.Symmetry[2] = -1
      elseif v.Symmetry == "Vertical" then
        self.Symmetry[1] = -1
      elseif v.Symmetry == "Origin" then
        self.Symmetry[1] = -1
        self.Symmetry[2] = -1
      end
    elseif v.Type == "end" then
      self:LoadBar(4, v.Row, v.Row, v.Col, v.Col, v)
    else
      self:LoadBar(0, v.Row, v.Row, v.Col, v.Col, v)
    end
  end
  for i, v in pairs(self.CrossTable) do
    self:FindInUp(i)
    self:FindInDown(i)
    self:FindInRight(i)
    self:FindInLeft(i)
  end
  self:GetGameMap()
end

function MiGongLogic:LoadBar(Type, StartRow, EndRow, StartCol, EndCol, Info)
  local x, y, z, Bar
  local SetPosNumber = 10
  x = 0
  if 0 == Type then
    z = self.Discrete * (StartRow - 0.5)
    y = self.Discrete * (StartCol - 0.5)
    self.MapTable[StartRow][StartCol] = self.Index
    self.CrossTable[self.Index] = {
      Row = StartRow,
      Col = StartCol,
      Up = 0,
      Down = 0,
      Left = 0,
      Right = 0,
      CanUp = Info.Up,
      CanDown = Info.Down,
      CanLeft = Info.Left,
      CanRight = Info.Right
    }
    Bar = self:CreateWidgetNew("MiniGameCrossBar")
    self.GamePanel:AddChild(Bar):SetPosition(FVector2D(y, z))
    Bar.GamePanel.Slot:SetPosition(FVector2D(self.Discrete / 2, self.Discrete / 2))
    Bar.GamePanel.Slot:SetSize(FVector2D(self.Discrete, self.Discrete))
    Bar:InitPositionAndSize(self.Discrete)
    Bar:CheckAround(Info.Left or 0, Info.Up or 0, Info.Right or 0, Info.Down or 0)
  elseif 1 == Type then
    z = self.Discrete * ((EndRow + StartRow) / 2 - 0.5)
    y = self.Discrete * (StartCol - 0.5)
    for i = StartRow, EndRow do
      self.MapTable[i][StartCol] = self.Index
    end
    Bar = self:CreateWidgetNew("MiniGameVerticalBar")
    self.GamePanel:AddChild(Bar):SetPosition(FVector2D(y, z))
    Bar.GamePanel.Slot:SetPosition(FVector2D(self.Discrete / 2, self.Discrete / 2))
    Bar.GamePanel.Slot:SetSize(FVector2D(self.Discrete / 2, 2))
    UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Bar.GamePanel):SetSize(FVector2D(Bar.Thick, (EndRow - StartRow + 1) * self.Discrete))
  elseif 2 == Type then
    z = self.Discrete * (StartRow - 0.5)
    y = self.Discrete * ((EndCol + StartCol) / 2 - 0.5)
    for i = StartCol, EndCol do
      self.MapTable[StartRow][i] = self.Index
    end
    Bar = self:CreateWidgetNew("MiniGameHorizonBar")
    self.GamePanel:AddChild(Bar):SetPosition(FVector2D(y, z))
    Bar.GamePanel.Slot:SetPosition(FVector2D(self.Discrete / 2, self.Discrete / 2))
    UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Bar.GamePanel):SetSize(FVector2D((EndCol - StartCol + 1) * self.Discrete, Bar.Thick))
  elseif 3 == Type then
    z = self.Discrete * (StartRow - 0.5)
    y = self.Discrete * (StartCol - 0.5)
    self.MapTable[StartRow][StartCol] = self.Index
    self.CrossTable[self.Index] = {
      Row = StartRow,
      Col = StartCol,
      Up = 0,
      Down = 0,
      Left = 0,
      Right = 0,
      CanUp = Info.Up,
      CanDown = Info.Down,
      CanLeft = Info.Left,
      CanRight = Info.Right
    }
    Bar = self:CreateWidgetNew("MiniGameStartBar")
    self.GamePanel:AddChild(Bar):SetPosition(FVector2D(y, z))
    UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Bar):SetZOrder(1)
    Bar.GamePanel.Slot:SetSize(FVector2D(self.Discrete, self.Discrete))
    table.insert(self.StartBarArray, Bar)
  elseif 4 == Type then
    z = self.Discrete * (StartRow - 0.5)
    y = self.Discrete * (StartCol - 0.5)
    self.MapTable[StartRow][StartCol] = self.Index
    self.CrossTable[self.Index] = {
      Row = StartRow,
      Col = StartCol,
      Up = 0,
      Down = 0,
      Left = 0,
      Right = 0,
      CanUp = Info.Up,
      CanDown = Info.Down,
      CanLeft = Info.Left,
      CanRight = Info.Right
    }
    Bar = self:CreateWidgetNew("MiniGameEndBar")
    self.GamePanel:AddChild(Bar):SetPosition(FVector2D(y, z))
    UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(Bar):SetZOrder(1)
    Bar.GamePanel.Slot:SetSize(FVector2D(self.Discrete, self.Discrete))
    table.insert(self.EndBarArray, Bar)
  end
  Bar.Index = self.Index
  self.BarMap:Add(self.Index, Bar)
  self.GameMap[self.Index] = {}
  self.Index = self.Index + 1
end

function MiGongLogic:FindInUp(Index)
  local Cross = self.CrossTable[Index]
  if 0 ~= Cross.Up or Cross.CanUp == nil then
    return
  end
  for i = Cross.Row - 1, 1, -1 do
    local BarIndex = self.MapTable[i][Cross.Col]
    if 0 ~= BarIndex then
      local FoundCross = self.CrossTable[BarIndex]
      if FoundCross and 0 == FoundCross.Down then
        FoundCross.Down = 1
        Cross.Up = 1
        if i == Cross.Row - 1 then
          self.GameMap[Index].Up = BarIndex
          self.GameMap[BarIndex].Down = Index
          return
        end
        self:LoadBar(1, i + 1, Cross.Row - 1, Cross.Col, Cross.Col)
        self.GameMap[Index].Up = self.Index - 1
        self.GameMap[BarIndex].Down = self.Index - 1
        self.GameMap[self.Index - 1].Up = BarIndex
        self.GameMap[self.Index - 1].Down = Index
        return
      end
    end
  end
  UEPrint(Index .. " find Up failed")
end

function MiGongLogic:FindInDown(Index)
  local Cross = self.CrossTable[Index]
  if 0 ~= Cross.Down or Cross.CanDown == nil then
    return
  end
  for i = Cross.Row + 1, 15 do
    local BarIndex = self.MapTable[i][Cross.Col]
    if 0 ~= BarIndex then
      local FoundCross = self.CrossTable[BarIndex]
      if FoundCross and 0 == FoundCross.Up then
        FoundCross.Up = 1
        Cross.Down = 1
        if i == Cross.Row + 1 then
          self.GameMap[Index].Down = BarIndex
          self.GameMap[BarIndex].Up = Index
          return
        end
        self:LoadBar(1, Cross.Row + 1, i - 1, Cross.Col, Cross.Col)
        self.GameMap[Index].Down = self.Index - 1
        self.GameMap[BarIndex].Up = self.Index - 1
        self.GameMap[self.Index - 1].Down = BarIndex
        self.GameMap[self.Index - 1].Up = Index
        return
      end
    end
  end
  UEPrint(Index .. " find Down failed")
end

function MiGongLogic:FindInLeft(Index)
  local Cross = self.CrossTable[Index]
  if 0 ~= Cross.Left or Cross.CanLeft == nil then
    return
  end
  for i = Cross.Col - 1, 1, -1 do
    local BarIndex = self.MapTable[Cross.Row][i]
    if 0 ~= BarIndex then
      local FoundCross = self.CrossTable[BarIndex]
      if FoundCross and 0 == FoundCross.Right then
        FoundCross.Right = 1
        Cross.Left = 1
        if i == Cross.Col - 1 then
          self.GameMap[Index].Left = BarIndex
          self.GameMap[BarIndex].Right = Index
          return
        end
        self:LoadBar(2, Cross.Row, Cross.Row, i + 1, Cross.Col - 1)
        self.GameMap[Index].Left = self.Index - 1
        self.GameMap[BarIndex].Right = self.Index - 1
        self.GameMap[self.Index - 1].Left = BarIndex
        self.GameMap[self.Index - 1].Right = Index
        return
      end
    end
  end
  UEPrint(Index .. " find Left failed")
end

function MiGongLogic:FindInRight(Index)
  local Cross = self.CrossTable[Index]
  if 0 ~= Cross.Right or Cross.CanRight == nil then
    return
  end
  for i = Cross.Col + 1, 15 do
    local BarIndex = self.MapTable[Cross.Row][i]
    if 0 ~= BarIndex then
      local FoundCross = self.CrossTable[BarIndex]
      if FoundCross and 0 == FoundCross.Left then
        FoundCross.Left = 1
        Cross.Right = 1
        if i == Cross.Col + 1 then
          self.GameMap[Index].Right = BarIndex
          self.GameMap[BarIndex].Left = Index
          return
        end
        self:LoadBar(2, Cross.Row, Cross.Row, Cross.Col + 1, i - 1)
        self.GameMap[Index].Right = self.Index - 1
        self.GameMap[BarIndex].Left = self.Index - 1
        self.GameMap[self.Index - 1].Right = BarIndex
        self.GameMap[self.Index - 1].Left = Index
        return
      end
    end
  end
  UEPrint(Index .. " find Right failed")
end

function MiGongLogic:split(str, reps)
  local resultStrList = {}
  string.gsub(str, "[^" .. reps .. "]+", function(w)
    table.insert(resultStrList, w)
  end)
  return resultStrList
end

function MiGongLogic:Handle_OnPCDown(InKeyName)
  if "SpaceBar" == InKeyName then
    self.MiniGame_Crack:OnClickResetButton()
    return true
  elseif "Escape" == InKeyName then
    self:PlayFailAnim()
    return true
  elseif "F" == InKeyName then
    self.MiniGame_Crack:OnClickCrackButton()
    return true
  end
  return false
end

function MiGongLogic:Handle_OnGamePadDown(InKeyName)
  if "Gamepad_FaceButton_Left" == InKeyName then
    self.MiniGame_Crack:OnClickResetButton()
    return true
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    self:PlayFailAnim()
    return true
  elseif "Gamepad_FaceButton_Top" == InKeyName then
    self.MiniGame_Crack:OnClickCrackButton()
    return true
  elseif "Gamepad_DPad_Up" == InKeyName then
    self:ChangeArrowPosition(0, -100)
    return true
  elseif "Gamepad_DPad_Down" == InKeyName then
    self:ChangeArrowPosition(0, 100)
    return true
  elseif "Gamepad_DPad_Left" == InKeyName then
    self:ChangeArrowPosition(-100, 0)
    return true
  elseif "Gamepad_DPad_Right" == InKeyName then
    self:ChangeArrowPosition(100, 0)
    return true
  elseif "Gamepad_LeftThumbstick" == InKeyName then
    if 1 == self.NowBarArray:Length() then
      return true
    end
    self.GamepadCurrentDragArrowIndex = 1 == self.GamepadCurrentDragArrowIndex and 2 or 1
    self:PlayArrowAnimation()
    return true
  end
  return false
end

function MiGongLogic:PlayArrowAnimation()
  for i = 1, #self.ArrowArray do
    if i == self.GamepadCurrentDragArrowIndex then
      self.ArrowArray[i]:PlayAnimation(self.ArrowArray[i].Select)
    else
      self.ArrowArray[i]:PlayAnimation(self.ArrowArray[i].Normal)
    end
  end
end

function MiGongLogic:PlayArrowNormalAnimation()
  for i = 1, #self.ArrowArray do
    self.ArrowArray[i]:PlayAnimation(self.ArrowArray[i].Normal)
  end
end

function MiGongLogic:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  if self.bIsResetting or self.bIsAnim then
    return UE4.UWidgetBlueprintLibrary.Unhandled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local MoveDeltaX = 0
  local MoveDeltaY = 0
  if "Gamepad_LeftX" == InKeyName then
    MoveDeltaX = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
  elseif "Gamepad_LeftY" == InKeyName then
    MoveDeltaY = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
  end
  if math.abs(MoveDeltaX) > 0.1 or math.abs(MoveDeltaY) > 0.1 then
    local moveSpeed = 8
    local deltaX = 0
    local deltaY = 0
    if math.abs(MoveDeltaX) > math.abs(MoveDeltaY) then
      deltaX = MoveDeltaX * moveSpeed
    else
      deltaY = -MoveDeltaY * moveSpeed
    end
    self:ChangeArrowPosition(deltaX, deltaY)
  else
    AudioManager(self):SetEventSoundParam(self, "MiGongArrowMove", {drag = 0})
  end
  if not self.bCanPlayDragSound then
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/mech_maze_drag", "MiGongArrowMove", nil)
    self.bCanPlayDragSound = true
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function MiGongLogic:ChangeArrowPosition(x, y)
  self.CurrentDragArrowIndex = self.GamepadCurrentDragArrowIndex
  if not self.NowBarArray or self.NowBarArray:Length() < 1 then
    return
  end
  local arrow = self.NowBarArray[self.CurrentDragArrowIndex]
  if not arrow then
    return
  end
  if not (arrow.Left and arrow.Right and arrow.Top) or not arrow.Down then
    return
  end
  if self.GamepadStart then
    local newX = (arrow.Left + arrow.Right) / 2 + x
    local newY = (arrow.Top + arrow.Down) / 2 + y
    self.PointerPosition = UE4.FVector2D(newX, newY)
    self.bCanDrag = true
    self.GamepadStart = false
  else
    local newX = self.PointerPosition.X + x
    local newY = self.PointerPosition.Y + y
    local boundedX, boundedY = arrow:SetMoveRange(newX, newY)
    self.PointerPosition = UE4.FVector2D(boundedX, boundedY)
    self.bCanDrag = true
  end
  local finalX, finalY = arrow:SetMoveRange(self.PointerPosition.X, self.PointerPosition.Y)
  self:SetArrowPosition(finalX, finalY)
end

function MiGongLogic:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.UseGamepadControl = CurInputDevice == ECommonInputType.Gamepad
  if ModController:IsMobile() then
    return
  end
  if self.UseGamepadControl then
    self.GamepadStart = true
    self.MoveDeltaX = 0
    self.MoveDeltaY = 0
    self.CurrentDragArrowIndex = 1
    self:AddTimer(0.2, function()
      self:PlayArrowAnimation()
    end)
    if self.WidgetSwitcher_Key then
      self.WidgetSwitcher_Key:SetActiveWidgetIndex(1)
    end
    if self.Key_Move then
      self.Key_Move:SetVisibility(ESlateVisibility.Visible)
    end
    if 1 == self.NowBarArray:Length() then
      self.Key_Switch:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.Key_Switch:SetVisibility(ESlateVisibility.Visible)
    end
  else
    if self.Key_Move then
      self.Key_Move:SetVisibility(ESlateVisibility.Collapsed)
    end
    if self.WidgetSwitcher_Key then
      self.WidgetSwitcher_Key:SetActiveWidgetIndex(0)
    end
    self:PlayArrowNormalAnimation()
  end
  self:SetFocus()
end

function MiGongLogic:ButtonDown(Index, StartPos)
  if self.Joystick then
    self.Joystick:SetRenderOpacity(1.0)
  end
  self.StartPos = StartPos
  self.CurrentDirection = "None"
end

function MiGongLogic:ButtonMove(TotalDeltaDis)
  if self.bIsResetting or self.bIsAnim then
    return
  end
  local MoveDistance = math.sqrt(TotalDeltaDis.X * TotalDeltaDis.X + TotalDeltaDis.Y * TotalDeltaDis.Y)
  self:HandleVirtualJoystickMove(TotalDeltaDis)
  self:UpdateJoystickDisplay(TotalDeltaDis)
end

function MiGongLogic:ButtonUp(Index, StartPos)
  if self.Joystick then
    self.Joystick:SetRenderOpacity(0.5)
  end
  self.MobileMoveX = 0
  self.MobileMoveY = 0
  self.CurrentDirection = "None"
  if self.Joystick then
    local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Joystick)
    if CanvasSlot then
      CanvasSlot:SetPosition(FVector2D(0, 0))
    end
  end
  self:PlayArrowNormalAnimation()
  AudioManager(self):SetEventSoundParam(self, "MiGongArrowMove", {drag = 0})
end

function MiGongLogic:HandleVirtualJoystickMove(Distance)
  local MinSpeed = 1.0
  local MaxSpeed = 64
  local scale = MaxSpeed / self.Radius
  local MoveX = 0
  local MoveY = 0
  if math.abs(Distance.X) > math.abs(Distance.Y) then
    MoveX = Distance.X
  else
    MoveY = Distance.Y
  end
  if 0 ~= MoveX then
    MoveX = math.clamp(math.abs(MoveX), MinSpeed, MaxSpeed) * (MoveX >= 0 and 1 or -1)
  end
  if 0 ~= MoveY then
    MoveY = math.clamp(math.abs(MoveY), MinSpeed, MaxSpeed) * (MoveY >= 0 and 1 or -1)
  end
  self.MobileMoveX = MoveX * scale
  self.MobileMoveY = MoveY * scale
end

function MiGongLogic:UpdateJoystickDisplay(DeltaPos)
  if not self.Joystick then
    return
  end
  local MoveDistance = math.sqrt(DeltaPos.X * DeltaPos.X + DeltaPos.Y * DeltaPos.Y)
  if MoveDistance > self.Radius then
    local Ratio = self.Radius / MoveDistance
    DeltaPos.X = DeltaPos.X * Ratio
    DeltaPos.Y = DeltaPos.Y * Ratio
  end
  local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.Joystick)
  if CanvasSlot then
    CanvasSlot:SetPosition(DeltaPos)
  end
end

function MiGongLogic:MobileMove()
  if 0 == self.MobileMoveX and 0 == self.MobileMoveY then
    return
  end
  self:ChangeArrowPosition(self.MobileMoveX, self.MobileMoveY)
end

function MiGongLogic:Destruct()
  if self.bGameStart then
    self:SetInputUIOnly(false)
    self.UseActor:ChangeState("InteractBreak", self.UseActor.PlayerEid)
  end
  self.Super.Destruct(self)
end

return MiGongLogic
