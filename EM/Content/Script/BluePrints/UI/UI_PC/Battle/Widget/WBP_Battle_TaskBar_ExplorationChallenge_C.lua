local WBP_Battle_TaskBar_ExplorationChallenge_C = Class("BluePrints.UI.BP_UIState_C")

function WBP_Battle_TaskBar_ExplorationChallenge_C:Construct()
  self:AddInputMethodChangedListen()
  self.IsLSPress = false
  self.IsRSPress = false
end

function WBP_Battle_TaskBar_ExplorationChallenge_C:Destruct()
  if self:IsListeningForInputAction("ExploraChallengeQuitL") then
    self:StopListeningForInputAction("ExploraChallengeQuitL", EInputEvent.IE_Pressed)
    self:StopListeningForInputAction("ExploraChallengeQuitL", EInputEvent.IE_Released)
  end
  if self:IsListeningForInputAction("ExploraChallengeQuitR") then
    self:StopListeningForInputAction("ExploraChallengeQuitR", EInputEvent.IE_Pressed)
    self:StopListeningForInputAction("ExploraChallenExploraChallengeQuitRgeQuit", EInputEvent.IE_Released)
  end
end

function WBP_Battle_TaskBar_ExplorationChallenge_C:SetQuitButtonByInputDevice(InpuType)
  if InpuType == ECommonInputType.MouseAndKeyboard then
    local KeyName = CommonUtils:GetActionMappingKeyName("QuitChallenge")
    self.Key:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = CommonUtils:GetKeyText(KeyName)
        }
      }
    })
  else
    self.WS_Key:SetActiveWidgetIndex(1)
    self.Key_Controller:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Right"},
        {Type = "Img", ImgShortPath = "RS"}
      },
      Type = "Add"
    })
  end
end

function WBP_Battle_TaskBar_ExplorationChallenge_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    self.WS_Key:SetActiveWidgetIndex(1)
    self.Key_Controller:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Right"},
        {Type = "Img", ImgShortPath = "RS"}
      },
      Type = "Add"
    })
  elseif CurInputDevice == ECommonInputType.MouseAndKeyboard then
    local KeyName = CommonUtils:GetActionMappingKeyName("QuitChallenge")
    self.WS_Key:SetActiveWidgetIndex(0)
    self.Key:CreateCommonKey({
      KeyInfoList = {
        {
          Type = "Text",
          Text = CommonUtils:GetKeyText(KeyName)
        }
      }
    })
  end
end

function WBP_Battle_TaskBar_ExplorationChallenge_C:OnPadActiveGuidePress()
  self.IsLSPress = true
  if not self.IsLSPress or self.IsRSPress then
  end
end

function WBP_Battle_TaskBar_ExplorationChallenge_C:OnPadExploraChallengeQuitPress()
  self.IsRSPress = true
  if not self.IsLSPress or self.IsRSPress then
  end
end

function WBP_Battle_TaskBar_ExplorationChallenge_C:OnPadActiveGuideRelease()
  self.IsLSPress = false
end

function WBP_Battle_TaskBar_ExplorationChallenge_C:OnPadExploraChallengeQuitRelease()
  self.IsRSPress = false
end

return WBP_Battle_TaskBar_ExplorationChallenge_C
