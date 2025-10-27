require("UnLua")
local WBP_Com_Loading_XiaoBai_C = Class({
  "BluePrints.UI.BP_UIState_C"
})
WBP_Com_Loading_XiaoBai_C._components = {
  "BluePrints.UI.WidgetComponent.ChangeTextToKeyInfoComponent"
}

function WBP_Com_Loading_XiaoBai_C:Construct()
  self:AddInputMethodChangedListen()
  self:Init()
  self.Button_461.OnClicked:Clear()
  self.Button_461.OnClicked:Add(self, self.SetXiaoBaiRandomTips)
  self:SetFocus()
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.CurrentInputDevice = {"GamepadKey"}
  else
    self.CurrentInputDevice = {
      "KeyboardKey",
      "MouseButton"
    }
  end
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  self:UpdateUIStyleInPlatform(UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad)
end

function WBP_Com_Loading_XiaoBai_C:Destruct()
  self:CleanTimer()
  AudioManager(self):ReplayBGMAfterLoading()
end

function WBP_Com_Loading_XiaoBai_C:Tick(MyGeometry, InDeltaTime)
  if not self.IsWaiting then
    return
  end
  self.ElapsedWaitTime = self.ElapsedWaitTime + InDeltaTime
  if self.ElapsedWaitTime >= self.WaitDuration then
    self.IsWaiting = false
    if self.CurrentAnimationMode == "Forward" then
      self:PlayXiaoBaiChangeAnimationReverse()
    else
      self:PlayXiaoBaiChangeAnimationForward()
    end
  end
  if not self.bUseFakeProgress or not self.IsProgressing then
    return
  end
  self.Progress = self.Progress + self.ProgressSpeed * InDeltaTime
  if self.Progress >= 99.0 then
    self.Progress = 99.0
    self.IsProgressing = false
  end
  self:UpdateProgress()
end

function WBP_Com_Loading_XiaoBai_C:UpdateProgress()
  self.ProgressBar:SetPercent(self.Progress / 100)
  self.Text_Progress:SetText(string.format("%.0f", self.Progress))
  self.Text_Progress_Back:SetText(string.format("%.0f", self.Progress))
end

function WBP_Com_Loading_XiaoBai_C:Init()
  self.CurrentInputDevice = {
    "KeyboardKey",
    "MouseButton"
  }
  self.IsPlaying = true
  self.IsWaiting = false
  self.CurrentAnimationMode = "Forward"
  self.WaitDuration = self.ChangeTime
  self.ElapsedWaitTime = 0.0
  self.Progress = 0.0
  self.ProgressSpeed = 100.0
  self.bUseFakeProgress = false
  self.IsProgressing = true
  self:PlayAnimation(self.In)
  self:SetXiaoBaiRandomTips()
  self:PlayXiaoBaiChangeAnimationForward()
  self:UpdateProgress()
end

function WBP_Com_Loading_XiaoBai_C:PlayXiaoBaiChangeAnimationForward()
  if not self.IsPlaying then
    return
  end
  self:PlayAnimation(self.Change, 0, 1, EUMGSequencePlayMode.Forward, 1.0)
  self.CurrentAnimationMode = "Forward"
  DebugPrint("\230\173\163\229\144\145\230\146\173\230\148\190\229\138\168\231\148\187")
end

function WBP_Com_Loading_XiaoBai_C:PlayXiaoBaiChangeAnimationReverse()
  if not self.IsPlaying then
    return
  end
  self:PlayAnimation(self.Change, 0, 1, EUMGSequencePlayMode.Reverse, 1.0)
  self.CurrentAnimationMode = "Reverse"
  DebugPrint("\229\128\146\230\148\190\229\138\168\231\148\187")
end

function WBP_Com_Loading_XiaoBai_C:OnAnimationFinished(InAnimation)
  if InAnimation ~= self.Change then
    return
  end
  if not self.IsPlaying then
    return
  end
  DebugPrint("\229\138\168\231\148\187\229\174\140\230\136\144: " .. self.CurrentAnimationMode)
  self.IsWaiting = true
  self.ElapsedWaitTime = 0.0
end

function WBP_Com_Loading_XiaoBai_C:SetXiaoBaiRandomTips()
  local RandomTips = self:GetRandomLoadingTips()
  self.Text_Title:SetText(RandomTips.Title)
  local Messages = self:GetFinalContentText(RandomTips.Message, self.CurrentInputDevice)
  self.Text_Message:SetText(Messages)
end

function WBP_Com_Loading_XiaoBai_C:GetRandomLoadingTips()
  if not self.TipsPoolByPlatform then
    self.TipsPoolByPlatform = {
      PC = {},
      Mobile = {},
      Gamepad = {}
    }
    local TipsTable = DataMgr.Message
    for _, v in pairs(TipsTable) do
      if v.MessageType == "LoadingText" then
        if v.MessageContentPC then
          table.insert(self.TipsPoolByPlatform.PC, {
            Title = GText(v.MessageTitlePC or ""),
            Message = GText(v.MessageContentPC)
          })
        end
        if v.MessageContentPhone then
          table.insert(self.TipsPoolByPlatform.Mobile, {
            Title = GText(v.MessageTitlePC or ""),
            Message = GText(v.MessageContentPhone)
          })
        end
        local gamepadMsg = v.MessageContentGamePad or v.MessageContentPC
        if gamepadMsg then
          table.insert(self.TipsPoolByPlatform.Gamepad, {
            Title = GText(v.MessageTitlePC or ""),
            Message = GText(gamepadMsg)
          })
        end
      end
    end
  end
  local TipsList
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    TipsList = self.TipsPoolByPlatform.Gamepad
  elseif "PC" == CommonUtils.GetDeviceTypeByPlatformName(self) then
    TipsList = self.TipsPoolByPlatform.PC
  elseif "Mobile" == CommonUtils.GetDeviceTypeByPlatformName(self) then
    TipsList = self.TipsPoolByPlatform.Mobile
  end
  if not TipsList or 0 == #TipsList then
    return {Title = "", Message = ""}
  end
  local RandomIndex = math.random(1, #TipsList)
  return TipsList[RandomIndex]
end

function WBP_Com_Loading_XiaoBai_C:CloseUI()
  self.Progress = 100.0
  self:UpdateProgress()
  self:AddTimer(0.5, function()
    UIManager(self):UnLoadUINew("BlackScreenXiaobai")
  end, false, 0, nil, true)
end

function WBP_Com_Loading_XiaoBai_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  self:SetXiaoBaiRandomTips()
end

function WBP_Com_Loading_XiaoBai_C:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  if IsUseKeyAndMouse then
    self.Com_KeyTitle:SetVisibility(ESlateVisibility.Collapsed)
    self.CurrentInputDevice = {
      "KeyboardKey",
      "MouseButton"
    }
  else
    self.CurrentInputDevice = {"GamepadKey"}
    self.Com_KeyTitle:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Com_KeyTitle:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      bLongPress = false,
      Desc = GText("UI_CTL_Loading_Next")
    })
  end
end

AssembleComponents(WBP_Com_Loading_XiaoBai_C)
return WBP_Com_Loading_XiaoBai_C
