require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
local FSoundOralComponent = require("BluePrints.Story.Talk.Component.SoundOralComponent").FSoundOralComponent

function M:Construct()
  if not self.SoundOralComponent then
    self.SoundOralComponent = FSoundOralComponent.New()
  end
  self.BtnState = ""
  self:BindToAnimationFinished(self.Press_Fold, {
    self,
    self.PlayHoverAnimation
  })
end

function M:Destruct()
  self.OthersItem = nil
  self:RemoveTimer(self.TalkTimer)
  self:PauseTalkAudio()
end

function M:InitVoiceBtn(DialogueId)
  self.DialogueId = DialogueId
  self.AudioState = "Stop"
  self.BtnState = "Audio"
  self:PlayAnimation(self.Normal_Sound)
  self.Button_Talk.OnClicked:Add(self, self.PlayTalkSound)
  self.Button_Talk.OnHovered:Add(self, function()
    self:PlayAnimation(self.Hover_Sound, 0, 0, 0, 1, true)
  end)
  self.Button_Talk.OnUnhovered:Add(self, function()
    self:StopAnimation(self.Hover_Sound)
    self:PlayAnimation(self.UnHover_Sound)
  end)
  self.Button_Talk.OnPressed:Add(self, function()
    self:PlayAnimation(self.Press_Sound)
  end)
end

function M:InitOptionBtn(TalkWidget, ParentWidget)
  self.IsShowList = false
  self.TalkWidget = TalkWidget
  self.ParentWidget = ParentWidget
  self.BtnState = "Option"
  self:PlayAnimation(self.Normal_Fold)
  self.Button_Talk.OnClicked:Add(self, self.ShowOptionList)
  self.Button_Talk.OnHovered:Add(self, function()
    self.PlayHover = true
    self:PlayAnimation(self.Hover_Fold, 0, 0, 0, 1, true)
  end)
  self.Button_Talk.OnUnhovered:Add(self, function()
    self.PlayHover = false
    self:StopAnimation(self.Hover_Fold)
    self:PlayAnimation(self.UnHover_Fold)
  end)
  self.Button_Talk.OnPressed:Add(self, function()
    self:PlayAnimation(self.Press_Fold)
  end)
end

function M:PlayHoverAnimation()
  if self.PlayHover then
    self:PlayAnimation(self.Hover_Fold, 0, 0, 0, 1, true)
  end
end

function M:ShowOptionList()
  if self.IsShowList then
    self.IsShowList = false
    self:PlayAnimation(self.ArrowFlip, 0, 1, UE4.EUMGSequencePlayMode.Reverse)
    self.TalkWidget:RemoveOtherOptions()
  else
    self.IsShowList = true
    self:PlayAnimation(self.ArrowFlip)
    self.TalkWidget:ListOtherOptions()
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
end

function M:PlayTalkSound()
  if self.AudioState == "IsPlaying" then
    self:PauseTalkAudio()
  elseif self.AudioState == "Stop" then
    self:PlayTalkAudio()
  end
  self:PlayAnimation(self.Click_Sound)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
end

function M:PauseTalkAudio()
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(GWorld.GameInstance, 0)
  AudioManager(self):StopSound(PlayerController, Const.ReviewSoundKey)
  self.AudioState = "Stop"
  self:StopAnimation(self.Click_Sound_Loop)
  self:PlayAnimation(self.Normal_Sound)
end

function M:PlayTalkAudio()
  self.AudioState = "IsPlaying"
  local DialogueConfig = DataMgr.Dialogue[self.DialogueId]
  local AudioInstance = self.SoundOralComponent:PlaySoundWithTalk(AudioManager(self), DialogueConfig.VoiceName, DialogueConfig.ExStoryInfo, DialogueConfig.SnapShot)
  self:PlayAnimation(self.Click_Sound_Loop, 0, 0, 0, 1, true)
  if self.TalkTimer then
    self:RemoveTimer(self.TalkTimer)
  end
  self.TalkTimer = self:AddTimer(0.1, function()
    if AudioManager(self):IsSoundStoped_CPP(AudioInstance) then
      self.AudioState = "Stop"
      self:RemoveTimer(self.TalkTimer)
      self:StopAnimation(self.Click_Sound_Loop)
      self:PlayAnimation(self.Normal_Sound)
    end
  end, true, nil, nil, true)
end

function M:InvokeClick()
  if not self:IsVisible() then
    return
  end
  if self.BtnState == "Audio" then
    self:PlayTalkSound()
  else
    if not self.IsShowList then
      self.ParentWidget:ScrollToEnd()
    end
    self:ShowOptionList()
  end
end

return M
