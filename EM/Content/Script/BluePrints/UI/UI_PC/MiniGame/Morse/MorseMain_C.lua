require("UnLua")
local WBP_MiniGame_Mima_P_C = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.Common.TimerMgr"
})

function WBP_MiniGame_Mima_P_C:InitUIInfo(Name, IsInUIMode, EventList, ...)
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.Panel_L:SetRenderOpacity(1)
  self.Circle:SetRenderOpacity(1)
  self.MiniGame_Time.Text_Time:SetRenderOpacity(1)
  self.MiniGame_Text:SetVisibility(ESlateVisibility.Collapsed)
  self:InitDeviceInfo()
  self:InitListenEvent()
end

function WBP_MiniGame_Mima_P_C:OnLoaded(...)
  DebugPrint("thy      WBP_MiniGame_Mima_P_C:InitUIInfo")
  self.GameDifficulty, self.GameTotalTime, self.RougueLikeComponent, self.RougueLikeCallback = ...
  if self.RougueLikeComponent then
    self.IsInRougeLike = true
  end
  self.IsWin = false
  self.IsClosing = false
  self.PasswordMap = {
    [1] = {
      0,
      1,
      1,
      1,
      1
    },
    [2] = {
      0,
      0,
      1,
      1,
      1
    },
    [3] = {
      0,
      0,
      0,
      1,
      1
    },
    [4] = {
      0,
      0,
      0,
      0,
      1
    },
    [5] = {
      0,
      0,
      0,
      0,
      0
    },
    [6] = {
      1,
      0,
      0,
      0,
      0
    },
    [7] = {
      1,
      1,
      0,
      0,
      0
    },
    [8] = {
      1,
      1,
      1,
      0,
      0
    },
    [9] = {
      1,
      1,
      1,
      1,
      0
    },
    [0] = {
      1,
      1,
      1,
      1,
      1
    }
  }
  if self.IsInRougeLike then
    self:InitAfterBeginPlay()
  end
end

function WBP_MiniGame_Mima_P_C:InitAfterBeginPlay()
  if not self.GameDifficulty then
    self.GameDifficulty = self.Difficulty
  end
  if not self.GameTotalTime then
    self.GameTotalTime = self.GameTime
  end
  DebugPrint("thy      self.GameDifficulty", self.GameDifficulty)
  self.GameDifficulty = self.GameDifficulty or 1
  self.GameTotalTime = self.GameTotalTime or 60
  self:InitDataInfo()
  self:InitTime()
  self:InitUIContent()
  self:InitCrack()
  self:BindToAnimationFinished(self.Succeed_Out, {
    self,
    self.Close
  })
  self:BindToAnimationFinished(self.Fail_Out, {
    self,
    self.Close
  })
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/morse_start", "MorseGameStart", nil)
end

function WBP_MiniGame_Mima_P_C:InitCrack()
  if not self.bCanCrack then
    self.MiniGame_Crack:SetVisibility(ESlateVisibility.Collapsed)
    return
  end
  local Param = {
    RootPage = self,
    SuccCallBack = self.CrackGame,
    ResetCallBack = self.Reset,
    NeedCrack = self.bCanCrack or false,
    NeedReset = false
  }
  self.MiniGame_Crack:SetVisibility(ESlateVisibility.Visibility)
  self.MiniGame_Crack:Init(Param)
end

function WBP_MiniGame_Mima_P_C:InitTime()
  self.MiniGame_Time.Text_Time:SetText("00:" .. tostring(self.GameTotalTime))
  self:AddTimer(1, self.CountDown, true, 0.1, "MorseGameTimer", true)
end

function WBP_MiniGame_Mima_P_C:CountDown()
  self.GameTotalTime = self.GameTotalTime - 1
  if self.GameTotalTime < 0 then
    if self.IsClosing then
      return
    end
    self:TimeOut()
    self.IsClosing = true
    return
  end
  if self.GameTotalTime < 10 then
    self:PlayAnimation(self.Warning)
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/morse_countdown_warning", "CountDownNormal", nil)
    self.MiniGame_Time.Text_Time:SetText("00:0" .. tostring(self.GameTotalTime))
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/tiaopin_countdown", "CountDownNormal", nil)
  self.MiniGame_Time.Text_Time:SetText("00:" .. tostring(self.GameTotalTime))
end

function WBP_MiniGame_Mima_P_C:InitUIContent()
  self:HideSomeWidgetAboutPasswordLen()
  self:InitText()
  self:InitInputPassword()
  self:InitPasswordBtn()
  self:InitPasswordIcon()
  self:InitPasswordInfo()
  self:InitBtnTipsUI()
  self:UpdateCurTipAndInputPos()
  self:InitButtonInMainUI()
end

function WBP_MiniGame_Mima_P_C:InitButtonInMainUI()
  if self.Button_Close then
    self.Button_Close:Init("Close", self, self.NormalExit)
  end
end

function WBP_MiniGame_Mima_P_C:InitBtnTipsUI()
  if not self.CurInputDeviceType or self.CurInputDeviceType == ECommonInputType.Touch then
    DebugPrint("thy    InitBtnTipsUI", self.CurInputDeviceType)
    return
  end
  if self.CurInputDeviceType == ECommonInputType.MouseAndKeyboard then
    if self.Key_Move then
      self.Key_Move:SetVisibility(ESlateVisibility.Collapsed)
    end
    self.KeyInfo1 = {
      KeyInfoList = {
        {
          ClickCallback = self.NormalExit,
          Owner = self,
          Type = "Text",
          Text = "Esc"
        }
      },
      Desc = GText("UI_BACK")
    }
    if self.Key_Close then
      self.Key_Close:CreateCommonKey(self.KeyInfo1)
    end
  else
    if self.Key_Move then
      self.Key_Move:SetVisibility(ESlateVisibility.Visibility)
    end
    self.KeyInfo1 = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "B"}
      },
      Desc = GText("UI_BACK")
    }
    self.KeyInfo2 = {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Input_Input")
    }
    if self.Key_Close and self.Key_Switch and self.Key_Move then
      self.Key_Close:CreateCommonKey(self.KeyInfo1)
      self.Key_Move:CreateCommonKey(self.KeyInfo2)
    end
  end
end

function WBP_MiniGame_Mima_P_C:UpdateTurnInfo()
  if self.CurTurn + 1 > self.TotalTurn then
    self:CompleteGame()
  else
    self.CurTurn = self.CurTurn + 1
    self:BindToAnimationFinished(self.CompletePrompt, {
      self,
      self.UpdatePasswordInfo
    })
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/morse_next_round", "NextRound", nil)
    self:PlayAnimation(self.CompletePrompt)
  end
end

function WBP_MiniGame_Mima_P_C:UpdatePasswordInfo()
  self:PlayAnimation(self.BoutRefresh)
  self:InitText()
  self.CurInputPasswordIndex = 1
  self:HideSomeWidgetAboutPasswordLen()
  self:InitPasswordInfo()
  self:InitInputPassword()
  self:UpdateCurTipAndInputPos()
  self.IsLock = false
end

function WBP_MiniGame_Mima_P_C:HideSomeWidgetAboutPasswordLen()
  for i = 1, 4 do
    self["Tips0" .. i]:SetVisibility(ESlateVisibility.Collapsed)
    self["Num_Enter0" .. i]:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_MiniGame_Mima_P_C:InitPasswordInfo()
  local _, Password = self:GetCurPassword()
  for i = 1, self.PasswordLen[self.CurTurn] do
    self["Tips0" .. i]:SetVisibility(ESlateVisibility.Visibility)
    self["Tips0" .. i]:InitIcon(Password[i])
  end
end

function WBP_MiniGame_Mima_P_C:InitPasswordIcon()
  for i = 1, 10 do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.Password = 10 == i and self.PasswordMap[0] or self.PasswordMap[i]
    Content.Index = 10 == i and 0 or i
    self.TileView_Clue:AddItem(Content)
  end
end

function WBP_MiniGame_Mima_P_C:InitInputPassword()
  for i = 1, self.PasswordLen[self.CurTurn] do
    self["Num_Enter0" .. i]:SetVisibility(ESlateVisibility.Visibility)
    self["Num_Enter0" .. i]:InitInfo(self, i)
    self.InputPasswordItemList[i] = self["Num_Enter0" .. i]
  end
  self.CurInputPasswordIndex = 1
end

function WBP_MiniGame_Mima_P_C:UpdateCurTipAndInputPos()
  for i = 1, self.PasswordLen[self.CurTurn] do
    self["Tips0" .. i]:PlayAnimation(self["Tips0" .. i].Normal)
    self["Num_Enter0" .. i]:StopAllAnimations()
    self["Num_Enter0" .. i]:PlayAnimation(self["Num_Enter0" .. i].Normal)
  end
  self["Tips0" .. self.CurInputPasswordIndex]:PlayAnimation(self["Tips0" .. self.CurInputPasswordIndex].Click)
  self["Num_Enter0" .. math.max(1, self.CurInputPasswordIndex - 1)]:StopAllAnimations()
  self["Num_Enter0" .. math.max(1, self.CurInputPasswordIndex - 1)]:PlayAnimation(self["Num_Enter0" .. math.max(1, self.CurInputPasswordIndex - 1)].Normal)
  self["Num_Enter0" .. self.CurInputPasswordIndex]:PlayAnimation(self["Num_Enter0" .. self.CurInputPasswordIndex].Click)
end

function WBP_MiniGame_Mima_P_C:InputPassword(Password)
  if self.IsLock then
    return
  end
  self.IsLock = true
  local InputPasswordItem = self.InputPasswordItemList[self.CurInputPasswordIndex]
  InputPasswordItem:SetNum(Password)
  if self:CheckPasswordCorrect(Password) then
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/morse_btn_click_correct", "InputCorrect", nil)
    if self.CurInputPasswordIndex < self.PasswordLen[self.CurTurn] then
      self.CurInputPasswordIndex = self.CurInputPasswordIndex + 1
      self:UpdateCurTipAndInputPos()
      self.IsLock = false
    else
      self:UpdateTurnInfo()
    end
  else
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/morse_btn_click_wrong", "InputWrong", nil)
    InputPasswordItem:PlayErrorInputAnimation()
  end
end

function WBP_MiniGame_Mima_P_C:UnLock()
  self.IsLock = false
end

function WBP_MiniGame_Mima_P_C:CheckPasswordCorrect(Password)
  local _, PasswordArr = self:GetCurPassword()
  for key, value in pairs(PasswordArr) do
    DebugPrint("thy    PasswordArr  key", key)
    DebugPrint("thy    PasswordArr  value", value)
  end
  local CorrectPassword = PasswordArr[self.CurInputPasswordIndex]
  DebugPrint("thy    CorrectPassword", CorrectPassword)
  DebugPrint("thy    Password", Password)
  return CorrectPassword == Password
end

function WBP_MiniGame_Mima_P_C:InitPasswordBtn()
  for i = 1, 10 do
    if 10 == i then
      self.Btn_List.Btn0:InitBtnInfo(self, 0)
    else
      self.Btn_List["Btn" .. i]:InitBtnInfo(self, i)
    end
  end
end

function WBP_MiniGame_Mima_P_C:PasswordBtnNormal(Index)
  Index = 0 == Index and 10 or Index
  for i = 1, 10 do
    if i == Index then
    elseif 10 == i then
      self.Btn_List.Btn0:PlayAnimation(self.Btn_List.Btn0.Normal)
    else
      self.Btn_List["Btn" .. i]:PlayAnimation(self.Btn_List["Btn" .. i].Normal)
    end
  end
end

function WBP_MiniGame_Mima_P_C:InitText()
  self.Text_Float:SetText(GText("UI_MiniGame_Morse_Intro"))
  self.Text_Tips:SetText(string.format(GText("UI_MiniGame_Morse_Turn"), self.CurTurn, self.TotalTurn))
  self.Text_Top:SetText(GText("UI_MiniGame_Morse_Password"))
  self.Text_Down:SetText(GText("UI_MiniGame_Morse_Password_Clue"))
end

function WBP_MiniGame_Mima_P_C:InitDataInfo()
  self.GameDataList = DataMgr["MiniGameMorse" .. self.GameDifficulty]
  if self.GameDataList and #self.GameDataList > 0 then
    self.GameDataInfo = self.GameDataList[math.random(1, #self.GameDataList)]
  end
  self.TotalTurn = self.GameDataInfo.Turn
  self.CurTurn = 1
  self.PasswordLen = self.GameDataInfo.PasswordLen
  self.PasswordList = {}
  self.InputPasswordItemList = {}
  self.CurInputPasswordIndex = 1
  self.IsLock = false
  for i = 1, self.TotalTurn do
    self.PasswordList[i] = self:InitPassword(i)
  end
end

function WBP_MiniGame_Mima_P_C:InitPassword(CurTurn)
  local CurPasswordArr = {}
  local CurPasswordList = {}
  local ArrLen = 0
  local IsNeedContinue = true
  local CurPassword = 0
  while IsNeedContinue do
    local num = math.random(0, 9)
    if not CurPasswordArr[num] then
      CurPasswordArr[num] = num
      ArrLen = ArrLen + 1
    end
    if ArrLen == self.PasswordLen[CurTurn] then
      IsNeedContinue = false
    end
  end
  for key, value in pairs(CurPasswordArr) do
    CurPassword = CurPassword * 10 + value
  end
  if self:CheckIsRepeat(CurPassword) then
    self:InitPassword()
    return
  end
  table.insert(CurPasswordList, CurPassword)
  for key, value in pairs(CurPasswordArr) do
    table.insert(CurPasswordList, value)
  end
  return CurPasswordList
end

function WBP_MiniGame_Mima_P_C:CheckIsRepeat(CurPassword)
  for _, Password in pairs(self.PasswordList) do
    if CurPassword == Password[1] then
      return true
    end
  end
  return false
end

function WBP_MiniGame_Mima_P_C:GetCurPassword()
  local PasswordArr = {}
  DebugPrint("thy    CurTurn", self.CurTurn)
  local PasswordList = self.PasswordList[self.CurTurn]
  table.move(PasswordList, 2, #PasswordList, 1, PasswordArr)
  return self.PasswordList[self.CurTurn][1], PasswordArr
end

function WBP_MiniGame_Mima_P_C:CompleteGame()
  self.IsWin = true
  self.MiniGame_Text:SetVisibility(ESlateVisibility.Visible)
  self.MiniGame_Text.Text_Success:SetText(GText("UI_MiniGame_Success"))
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/morse_sucess", "MorseGameSuccess", nil)
  self:PlayAnimation(self.Succeed_Out)
  self.MiniGame_Text.Switcher_Tip:SetActiveWidgetIndex(0)
  self:RemoveTimer("MorseGameTimer")
end

function WBP_MiniGame_Mima_P_C:CrackGame()
  self.IsWin = true
  self.MiniGame_Text:SetVisibility(ESlateVisibility.Visible)
  self.MiniGame_Text.Text_Success:SetText(GText("UI_MiniGame_Decode_Success"))
  self:PlayAnimation(self.Succeed_Out)
  self.MiniGame_Text.Switcher_Tip:SetActiveWidgetIndex(0)
  self:RemoveTimer("MorseGameTimer")
end

function WBP_MiniGame_Mima_P_C:Reset()
  self:InitInputPassword()
  self:UpdateCurTipAndInputPos()
end

function WBP_MiniGame_Mima_P_C:TimeOut()
  self.MiniGame_Text:SetVisibility(ESlateVisibility.Visible)
  self.MiniGame_Text.Text_Fail:SetText(GText("UI_MiniGame_Fail"))
  self.MiniGame_Text.Switcher_Tip:SetActiveWidgetIndex(1)
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/morse_fail", "MorseGameFail", nil)
  self:PlayAnimation(self.Fail_Out)
  self:RemoveTimer("MorseGameTimer")
end

function WBP_MiniGame_Mima_P_C:NormalExit()
  self.MiniGame_Text:SetVisibility(ESlateVisibility.Visible)
  self.MiniGame_Text.Text_Fail:SetText(GText("UI_MiniGame_Fail"))
  self.MiniGame_Text.Switcher_Tip:SetActiveWidgetIndex(1)
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/morse_fail", "MorseGameFail", nil)
  self:PlayAnimation(self.Fail_Out)
  self:RemoveTimer("MorseGameTimer")
end

function WBP_MiniGame_Mima_P_C:Close()
  DebugPrint("thy     CloseGame")
  if self.RougueLikeCallback then
    self.RougueLikeCallback(self.RougueLikeComponent, self.IsWin)
  end
  self:RemoveTimer("MorseGameTimer")
  if self.UseActor then
    self.UseActor:SetVariableBool("IsGameSuccess", self.IsWin, UE4.UGameplayStatics.GetPlayerPawn(self, 0).Eid)
    self.UseActor.ChestInteractiveComponent:EndInteractive(UE4.UGameplayStatics.GetPlayerPawn(self, 0))
  end
  self.Super.Close(self)
end

function WBP_MiniGame_Mima_P_C:InitDeviceInfo()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function WBP_MiniGame_Mima_P_C:InitListenEvent()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function WBP_MiniGame_Mima_P_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("thy     CurGamepadName", CurGamepadName)
  DebugPrint("thy     CurInputDevice", CurInputDevice)
  if self.CurInputDeviceType == CurInputDevice then
    DebugPrint("thy    \229\183\178\231\187\143\230\152\190\231\164\186\231\154\132\230\152\175\232\175\165\232\190\147\229\133\165\230\168\161\229\188\143\239\188\140\228\184\141\233\156\128\232\166\129\232\191\155\232\161\140\229\136\183\230\150\176")
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self.CurGamepadName = CurGamepadName
  self:InitMainUI()
end

function WBP_MiniGame_Mima_P_C:InitMainUI()
  self:InitBtnTipsUI()
  self.Btn_List.Btn5:SetFocus()
end

function WBP_MiniGame_Mima_P_C:Handle_OnPCDown(InKeyName)
  DebugPrint("thy   Handle_OnPCDown", InKeyName)
  if "Escape" == InKeyName then
    self:NormalExit()
    return true
  end
  if "One" == InKeyName or "NumPadOne" == InKeyName then
    self:InputPassword(1)
    return true
  end
  if "Two" == InKeyName or "NumPadTwo" == InKeyName then
    self:InputPassword(2)
    return true
  end
  if "Three" == InKeyName or "NumPadThree" == InKeyName then
    self:InputPassword(3)
    return true
  end
  if "Four" == InKeyName or "NumPadFour" == InKeyName then
    self:InputPassword(4)
    return true
  end
  if "Five" == InKeyName or "NumPadFive" == InKeyName then
    self:InputPassword(5)
    return true
  end
  if "Six" == InKeyName or "NumPadSix" == InKeyName then
    self:InputPassword(6)
    return true
  end
  if "Seven" == InKeyName or "NumPadSeven" == InKeyName then
    self:InputPassword(7)
    return true
  end
  if "Eight" == InKeyName or "NumPadEight" == InKeyName then
    self:InputPassword(8)
    return true
  end
  if "Nine" == InKeyName or "NumPadNine" == InKeyName then
    self:InputPassword(9)
    return true
  end
  if "Zero" == InKeyName or "NumPadZero" == InKeyName then
    self:InputPassword(0)
    return true
  end
  if "F" == InKeyName and self.bCanCrack then
    self:CrackGame()
    return true
  end
  return false
end

function WBP_MiniGame_Mima_P_C:Handle_OnGamePadDown(InKeyName)
  DebugPrint("thy    Handle_OnGamePadDown", InKeyName)
  if "Gamepad_FaceButton_Top" == InKeyName then
    if self.bCanCrack then
      self:CrackGame()
    end
    return true
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    self:NormalExit()
    return true
  end
  return false
end

function WBP_MiniGame_Mima_P_C:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
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

return WBP_MiniGame_Mima_P_C
