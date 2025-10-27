require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
local FlowType = {ToEX = 1, ToMain = 2}
local SexType = {Male = 0, Female = 1}
local Side = {Main = "Main", EX = "EX"}
M._components = {
  "BluePrints.UI.WidgetComponent.ChangeTextToKeyInfoComponent"
}

function M:Initialize(Initializer)
end

function M:Construct()
  M.Super.Construct(self)
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

function M:Destruct()
  self:CleanTimer()
end

function M:Tick(MyGeometry, InDeltaTime)
  self.Spine_Male:Tick(InDeltaTime, true)
  self.Spine_Female:Tick(InDeltaTime, true)
  self.Spine_MaleEX:Tick(InDeltaTime, true)
  self.Spine_FemaleEX:Tick(InDeltaTime, true)
  self.Spine_Shalou:Tick(InDeltaTime, true)
  self.Spine_Bg:Tick(InDeltaTime, true)
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

function M:UpdateProgress()
  self.ProgressBar:SetPercent(self.Progress / 100)
  self.Text_Progress:SetText(string.format("%.0f", self.Progress))
  self.Text_Progress_Back:SetText(string.format("%.0f", self.Progress))
end

function M:Init()
  self.CurrentInputDevice = {
    "KeyboardKey",
    "MouseButton"
  }
  self:PrepareSpineForTransition()
  self.Progress = 0.0
  self.ProgressSpeed = 100.0
  self.bUseFakeProgress = false
  self.IsProgressing = true
  self:PlayAnimation(self.In)
  self:SetXiaoBaiRandomTips()
  self:UpdateProgress()
  self:Play_In_Loading()
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Out then
    UIManager(self):UnLoadUINew("BlackScreeCharChange")
  end
end

function M:IsValidSex(s)
  return s == SexType.Female or s == SexType.Male
end

function M:SetActiveBySex(Switcher, SexVal)
  if not Switcher then
    return
  end
  local idx = SexVal == SexType.Male and 0 or 1
  Switcher:SetActiveWidgetIndex(idx)
end

function M:GetSpineBySideSex(side, sex)
  if side == Side.Main then
    return sex == SexType.Male and self.Spine_Male or self.Spine_Female
  else
    return sex == SexType.Male and self.Spine_MaleEX or self.Spine_FemaleEX
  end
end

function M:SafeSetAnim(side, sex, anim, loop)
  if not anim or "" == anim then
    return true
  end
  local comp = self:GetSpineBySideSex(side, sex)
  if not comp then
    return false
  end
  local entry = comp:SetAnimation(0, anim, loop or false)
  if not entry then
    DebugPrint(string.format("[Spine] FAIL side=%s sex=%s anim=%s", side, tostring(sex), tostring(anim)))
    return false
  end
  return true
end

function M:ComputeFlowAndSexSnapshot()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return nil
  end
  local SceneId = WorldTravelSubsystem():GetCurrentSceneId()
  local LastSceneId = WorldTravelSubsystem():GetLastSceneId()
  local Region = DataMgr.Region[SceneId]
  local LastRegion = DataMgr.Region[LastSceneId]
  if not Region or not LastRegion then
    return nil
  end
  local ToEX = Region.RegionType == Side.EX and LastRegion.RegionType == Side.Main
  local ToMain = Region.RegionType == Side.Main and LastRegion.RegionType == Side.EX
  if not ToEX and not ToMain then
    return nil
  end
  local CurrSex = 0
  local PrevSex = 0
  if ToEX then
    CurrSex = Avatar.WeitaSex
    PrevSex = Avatar.Sex
  elseif ToMain then
    CurrSex = Avatar.Sex
    PrevSex = Avatar.WeitaSex
  end
  local CurrSide = ToEX and Side.EX or Side.Main
  local PrevSide = ToEX and Side.Main or Side.EX
  self.SpSnapshot = {
    Flow = ToEX and FlowType.ToEX or FlowType.ToMain,
    CurrSex = CurrSex,
    PrevSex = PrevSex,
    CurrSide = CurrSide,
    PrevSide = PrevSide
  }
  return self.SpSnapshot
end

function M:ApplyFacingFromFlow()
  local S = self.SpSnapshot
  if not S then
    return
  end
  local FaceLeft = S.Flow == FlowType.ToMain
  
  local function SetFace(Comp, Left)
    if not Comp then
      return
    end
    if Comp.SetScaleX and Comp.GetScaleX then
      local V = math.abs(Comp:GetScaleX() or 1)
      Comp:SetScaleX(Left and -V or V)
      if Comp.UpdateWorldTransform then
        Comp:UpdateWorldTransform()
      end
      return
    end
  end
  
  SetFace(self.Spine_Female, FaceLeft)
  SetFace(self.Spine_Male, FaceLeft)
  SetFace(self.Spine_FemaleEX, FaceLeft)
  SetFace(self.Spine_MaleEX, FaceLeft)
end

function M:ApplySwitchersFromSnapshot()
  local S = self.SpSnapshot
  if not S then
    return
  end
  if S.CurrSide == Side.Main then
    self:SetActiveBySex(self.WS_Char, S.CurrSex)
    self:SetActiveBySex(self.WS_EXChar, S.PrevSex)
  else
    self:SetActiveBySex(self.WS_Char, S.PrevSex)
    self:SetActiveBySex(self.WS_EXChar, S.CurrSex)
  end
end

function M:PrepareSpineForTransition()
  if not self:ComputeFlowAndSexSnapshot() then
    DebugPrint("[Spine] ComputeFlowAndSexSnapshot failed")
    return
  end
  self:ApplySwitchersFromSnapshot()
  self:ApplyFacingFromFlow()
end

function M:Play_In_Loading()
  local S = self.SpSnapshot
  if not S then
    return
  end
  self:SafeSetAnim(S.PrevSide, S.PrevSex, "Open_Loading", false)
  self:SafeSetAnim(S.CurrSide, S.CurrSex, "Close_Loading", false)
end

function M:OnUiAnimNotify_Open()
  local S = self.SpSnapshot
  if not S then
    return
  end
  self:SafeSetAnim(S.CurrSide, S.CurrSex, "Open", false)
end

function M:OnUiAnimNotify_Close()
  local S = self.SpSnapshot
  if not S then
    return
  end
  self:SafeSetAnim(S.PrevSide, S.PrevSex, "Close", false)
end

function M:SetXiaoBaiRandomTips()
  local RandomTips = self:GetRandomLoadingTips()
  self.Text_Title:SetText(RandomTips.Title)
  local Messages = self:GetFinalContentText(RandomTips.Message, self.CurrentInputDevice)
  self.Text_Message:SetText(Messages)
end

function M:GetRandomLoadingTips()
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

function M:CloseUI()
  self.Progress = 100.0
  self:UpdateProgress()
  self:AddTimer(0.5, function()
    self:PlayAnimation(self.Out)
    self.Spine_Shalou:SetAnimation(0, "Change", false)
    self.Spine_Bg:SetAnimation(0, "Loop", true)
  end, false, 0, nil, true)
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  self:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
  self:SetXiaoBaiRandomTips()
end

function M:UpdateUIStyleInPlatform(IsUseKeyAndMouse)
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

AssembleComponents(M)
return M
