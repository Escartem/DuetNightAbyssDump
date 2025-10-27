require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.Overridden.Construct(self)
  self.MinPointerAngle = -120
  self.MaxPointerAngle = 120
  self.CurrentPointerAngle = self.MinPointerAngle
  self.bGameStart = false
  self.bCanClick = false
  self.PipeList = {}
  self.CurrentPipeIndex = 1
  self.LastPipeIndex = 0
  self.InPC = CommonUtils.GetDeviceTypeByPlatformName(self) == "PC"
end

function M:InitListenEvent()
  self:BindToAnimationFinished(self.Fail, {
    self,
    function()
      self.RootPage:Close(false)
    end
  })
  self:BindToAnimationFinished(self.Success, {
    self,
    function()
      self.RootPage:Close(true)
    end
  })
end

function M:InitAfterBeginPlay()
  self:InitListenEvent()
  self:GetPipeArea()
  self.Panel_Pipe:ClearChildren()
  for i, Area in pairs(self.PipeArea) do
    local Pipe = self:CreatePipe()
    local PipeAngle = Area[2] - Area[1]
    Pipe:SetRenderTransformAngle(Area[1])
    self:SetPipeParam(Pipe, PipeAngle, self.PipeLevel[i])
    self:SetPipePercent(Pipe)
  end
  self.MiniGame_Text.Text_Fail:SetText(GText("UI_MiniGame_Fail"))
  self.MiniGame_Text.Text_Success:SetText(GText("UI_MiniGame_Success"))
  self.MiniGame_Time.Key:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "SpaceBar"}
    }
  })
  self.MiniGame_Time.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
  self.bGameStart = true
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    self.MiniGame_Time.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
  end
end

function M:GetPipeArea()
  local Info = DataMgr["MiniGameClick" .. self.RootPage.Difficulty][self.RootPage.MapIndex]
  local LevelInfo = Info.ClickLevelInfo
  local StartInfo = Info.ClickStartInfo
  local EndInfo = Info.ClickEndInfo
  if #LevelInfo ~= #StartInfo or #EndInfo ~= #StartInfo or #LevelInfo ~= #EndInfo then
    GWorld.logger.error("\232\189\172\230\176\180\233\152\128\229\176\143\230\184\184\230\136\143\231\188\150\229\143\183" .. self.RootPage.MapIndex .. "\228\184\137\228\184\170Info\233\149\191\229\186\166\228\184\141\228\184\128\232\135\180\239\188\140\229\161\171\232\161\168\233\148\153\232\175\175")
    return
  end
  self.PipeLevel = {}
  self.PipeArea = {}
  self.RealPipeArea = {}
  for i, v in pairs(LevelInfo) do
    table.insert(self.PipeLevel, v)
    table.insert(self.PipeArea, {
      StartInfo[i],
      EndInfo[i]
    })
    table.insert(self.RealPipeArea, {
      StartInfo[i] - 120,
      EndInfo[i] - 120
    })
  end
  self.PointerSpeed = Info.PointerSpeed
  self.PointerSpeedLow = Info.PointerSpeedLow
  self.PointerSpeedMid = Info.PointerSpeedMid
  self.PointerSpeedHigh = Info.PointerSpeedHigh
  self.PointerSpeedResis = Info.PointerSpeedResis
end

function M:Tick()
  if not self.bGameStart or self.RootPage.bGameOver then
    return
  end
  if not self.bCanClick then
    self.CurrentPointerAngle = math.min(self.CurrentPointerAngle + self.PointerSpeed, self.MaxPointerAngle)
    self.Panel_Pointer:SetRenderTransformAngle(self.CurrentPointerAngle)
  else
    if self.CurrentPointerAngle - self.PointerSpeedResis <= self.MinPointerAngle and self.CurrentPointerAngle > self.MinPointerAngle then
      self:StopReleaseSound()
    end
    self.CurrentPointerAngle = math.max(self.CurrentPointerAngle - self.PointerSpeedResis, self.MinPointerAngle)
    self.Panel_Pointer:SetRenderTransformAngle(self.CurrentPointerAngle)
  end
  if self.CurrentPipeIndex > #self.PipeArea then
    return
  end
  self:SetPipePercent(self.PipeList[self.CurrentPipeIndex])
  if self.CurrentPointerAngle >= self.RealPipeArea[self.CurrentPipeIndex][1] and self.CurrentPointerAngle <= self.RealPipeArea[self.CurrentPipeIndex][2] and self.LastPipeIndex ~= self.CurrentPipeIndex then
    self.MinPointerAngle = self.RealPipeArea[self.CurrentPipeIndex][1]
    self.bCanClick = true
    self:OnPointerEnterNewPipe(self.PipeList[self.CurrentPipeIndex])
    self.LastPipeIndex = self.CurrentPipeIndex
  end
  if self.CurrentPointerAngle > self.RealPipeArea[self.CurrentPipeIndex][2] then
    self:OnPointerLeaveNewPipe()
    self.CurrentPipeIndex = self.CurrentPipeIndex + 1
    self.bCanClick = false
  end
  if self.CurrentPointerAngle >= self.MaxPointerAngle then
    self.Panel_Pointer:SetRenderTransformAngle(self.CurrentPointerAngle)
    self:OnPointerLeaveNewPipe()
    self.RootPage:GameOver(true)
    self.bCanClick = false
    return
  end
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
end

function M:OnClickSpaceBar()
  if not self.bCanClick then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/shuifa_push", nil, nil)
  self.Panel_Pointer:SetRenderTransformAngle(self.CurrentPointerAngle)
  self.CurrentPointerAngle = self.CurrentPointerAngle + self["PointerSpeed" .. self.PipeLevel[self.CurrentPipeIndex]]
  local Pipe = self.PipeList[self.CurrentPipeIndex]
  if not Pipe:IsAnimationPlaying(Pipe.Click) then
    Pipe:PlayAnimation(Pipe.Click)
  end
  if self.InPC then
    if self.RootPage.Key_Hint:IsAnimationPlaying(self.RootPage.Key_Hint.PromptSpace) then
      local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
      self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
      if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
        self.RootPage.Key_Hint_GamePad:PlayAnimation(self.RootPage.Key_Hint_GamePad.Prompt)
      else
        self.RootPage.Key_Hint:PlayAnimation(self.RootPage.Key_Hint.PromptSpace)
      end
    end
  elseif self.RootPage:IsAnimationPlaying(self.RootPage.Hint) then
    self.RootPage:StopAnimation(self.RootPage.Hint)
  end
  self:RemoveTimer(self.ShowTipsHandle)
  self:StopReleaseSound()
  if self.CurrentPointerAngle >= self.MaxPointerAngle then
    self:SetPipePercent(self.PipeList[self.CurrentPipeIndex])
    self.Panel_Pointer:SetRenderTransformAngle(self.MaxPointerAngle)
    self:OnPointerLeaveNewPipe()
    self.RootPage:GameOver(true)
    return
  end
  self.ShowTipsHandle = self:AddTimer(self.WaitWarningTime, self.ShowTips)
  self.PlayReleaseSoundHandle = self:AddTimer(0.2, self.PlayReleaseSound)
end

function M:CreatePipe()
  local Pipe = self:CreateWidgetNew("MiniGameShuifaPipe")
  self.Panel_Pipe:AddChild(Pipe)
  table.insert(self.PipeList, Pipe)
  Pipe:BindToAnimationFinished(Pipe.Progress_Success, {
    self,
    function()
      Pipe:SetVisibility(ESlateVisibility.Collapsed)
      Pipe:UnBindAllFromAnimationFinished(Pipe.Progress_Success)
    end
  })
  return Pipe
end

function M:SetPipeParam(Pipe, PipeAngle, PipeType)
  local TargetHeight = (360 - PipeAngle) / 360
  Pipe.Base:GetDynamicMaterial():SetScalarParameterValue("TargetHeight", TargetHeight)
  Pipe.Base_Border:GetDynamicMaterial():SetScalarParameterValue("TargetHeight", TargetHeight - 0.0175)
  Pipe.Progress_Pipe:GetDynamicMaterial():SetScalarParameterValue("TargetHeight", TargetHeight)
  Pipe.Progress_Pipe:GetDynamicMaterial():SetVectorParameterValue("Gradient_1", Pipe["Gradient1_" .. PipeType])
  Pipe.Progress_Pipe:GetDynamicMaterial():SetVectorParameterValue("Gradient_2", Pipe["Gradient2_" .. PipeType])
  Pipe.Progress_Pipe_Success:GetDynamicMaterial():SetScalarParameterValue("TargetHeight", TargetHeight)
  Pipe.Progress_Pipe_Success:GetDynamicMaterial():SetVectorParameterValue("Gradient_1", Pipe["Gradient1_" .. PipeType])
  Pipe.Progress_Pipe_Success:GetDynamicMaterial():SetVectorParameterValue("Gradient_2", Pipe["Gradient2_" .. PipeType])
end

function M:SetPipePercent(Pipe)
  local PercentAngle = math.max(self.CurrentPointerAngle - self.RealPipeArea[self.CurrentPipeIndex][1], 0)
  local AllAngle = self.RealPipeArea[self.CurrentPipeIndex][2] - self.RealPipeArea[self.CurrentPipeIndex][1]
  local Percent = math.min(PercentAngle / AllAngle, 1)
  Pipe.Progress_Pipe:GetDynamicMaterial():SetScalarParameterValue("Percent", Percent)
  AudioManager(self):SetEventSoundParam(self, "ShuifaPlaying", {Progress = Percent})
  if Percent >= 1 then
    if self.CurrentPipeIndex >= #self.PipeArea then
      self.bCanClick = false
    end
    Pipe:PlayAnimation(Pipe.Progress_Success)
    AudioManager(self):PlayUISound(self, "event:/ui/minigame/shuifa_push_water_success", nil, nil)
  end
end

function M:OnPointerEnterNewPipe(Pipe)
  if 1 == self.CurrentPipeIndex then
    if self.InPC then
      local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
      self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
      if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
        self.RootPage.Key_Hint_GamePad:PlayAnimation(self.RootPage.Key_Hint_GamePad.Prompt, 0, 0)
      else
        self.RootPage.Key_Hint:PlayAnimation(self.RootPage.Key_Hint.PromptSpace, 0, 0)
      end
    else
      self.RootPage:PlayAnimation(self.RootPage.Hint, 0, 0)
    end
  end
  self.ShowTipsHandle = self:AddTimer(5, self.ShowTips)
  Pipe.Base_Border:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
end

function M:OnPointerLeaveNewPipe()
  if 1 == self.CurrentPipeIndex then
    if self.InPC then
      local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
      self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
      if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
        self.RootPage.Key_Hint_GamePad:PlayAnimation(self.RootPage.Key_Hint_GamePad.Prompt)
      else
        self.RootPage.Key_Hint:PlayAnimation(self.RootPage.Key_Hint.PromptSpace)
      end
    else
      self.RootPage:StopAnimation(self.RootPage.Hint)
    end
  end
  AudioManager(self):SetEventSoundParam(self, "ShuifaPlaying", {Progress = 0})
  self:RemoveTimer(self.ShowTipsHandle)
  self:StopReleaseSound()
end

function M:ShowTips()
  if self.InPC then
    local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
    if self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
      self.RootPage.Key_Hint_GamePad:PlayAnimation(self.RootPage.Key_Hint_GamePad.Prompt, 0, 0)
    else
      self.RootPage.Key_Hint:PlayAnimation(self.RootPage.Key_Hint.PromptSpace, 0, 0)
    end
  end
end

function M:PlayReleaseSound()
  AudioManager(self):PlayUISound(self, "event:/ui/minigame/shuifa_release", "ShuifaRelease", nil)
end

function M:StopReleaseSound()
  self:RemoveTimer(self.PlayReleaseSoundHandle)
  AudioManager(self):StopSound(self, "ShuifaRelease")
end

return M
