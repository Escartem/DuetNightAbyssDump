require("UnLua")
require("DataMgr")
local DialogueDataBase_C = require("BluePrints.Story.Talk.Model.DialogueData").DialogueDataBase_C
local WikiController = require("BluePrints.UI.WBP.Wiki.WikiController")
local M = Class("BluePrints.Story.Talk.UI.BP_TalkBaseUINew_C")

function M:Construct()
  M.Super.Construct(self)
  self.bBlackScreenSameScreen = false
  self.bForceAutoPlay = false
  AudioManager(self):PausePlayBGMCauseIsLoadingOrBlackScreen()
  AudioManager(self):PlayUISound(self, "event:/ui/common/loading_black_screen", "BlackScreenSound", nil)
  self.WikiEntryIds = {}
  self:InitializedToolbar()
  self:SetTipImageHidden(true)
  self:SwitchEnableSkipButton(false)
  self:SwitchEnableAutoPlayButton(false)
  self:SwitchEnableReviewButton(false)
  self:SwitchEnableWikiButton(false)
  self:SwitchEnableConfirmButton(false)
  self.BlackScreenText:SetText("")
  self:SetStoryInputModeEnabled(true)
end

function M:Destruct()
  AudioManager(self):SetEventSoundParam(self, "BlackScreenSound", {ToEnd = 1})
  AudioManager(self):ResumePlayBGMCauseIsLoadingOrBlackScreen()
  M.Super.Destruct(self)
end

function M:OnLoaded(...)
  local IsWhite = (...)
  if IsWhite then
    local Color = FLinearColor(1, 1, 1, 1)
    self.BackGround:SetBrushColor(Color)
  end
  M.Super:OnLoaded(...)
end

function M:PreEnterTalkTask(TalkTask, TaskData, OnPreEnterTalkTaskFinished)
  M.Super.PreEnterTalkTask(self, TalkTask, TaskData, OnPreEnterTalkTaskFinished)
end

function M:PostEnterTalkTask(TalkTask, TaskData, OnPostEnterTalkTaskFinished)
  self.bBlackScreenSameScreen = TaskData.ExtraParams.bBlackScreenSameScreen
  if self.bBlackScreenSameScreen then
    self.TextChild = {}
    local CurrentDialogueId = TaskData.FirstDialogueId
    while nil ~= CurrentDialogueId do
      local DialogueData = DataMgr.Dialogue[CurrentDialogueId]
      if nil == DialogueData or DialogueData.NextOptions then
        break
      end
      assert(DialogueData, "Cant find dialogue data from dialogue id: " .. CurrentDialogueId)
      local DialogueDataBase = DialogueDataBase_C.New(self.TalkTask, CurrentDialogueId, DialogueData, self.TalkContext)
      local NewText = self:CreateSameScreenText()
      self.TextChild[CurrentDialogueId] = NewText
      NewText.Text_Talk:SetText(DialogueDataBase.Content)
      NewText:SetRenderOpacity(0)
      CurrentDialogueId = DialogueData.NextDialogue
    end
    self.BlackScreenText:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.BlackScreenText:SetVisibility(ESlateVisibility.Visible)
  end
  self.bForceAutoPlay = TaskData.bForceAutoPlay
  if not self.bForceAutoPlay then
    self:SwitchEnableSkipButton(TaskData.bShowSkipButton)
    self:SwitchEnableAutoPlayButton(TaskData.bShowAutoPlayButton)
  end
  self:SwitchEnableReviewButton(TaskData.bShowReviewButton)
  M.Super.PostEnterTalkTask(self, TalkTask, TaskData, OnPostEnterTalkTaskFinished)
end

function M:PreExitTalkTask(TalkTask, TaskData, OnPreExitTalkTaskFinished)
  M.Super.PreExitTalkTask(self, TalkTask, TaskData, OnPreExitTalkTaskFinished)
end

function M:PostExitTalkTask(TalkTask, TalkData, OnPostExitTalkTaskFinished)
  if self.TextChild == nil then
    M.Super.PostExitTalkTask(self, TalkTask, TalkData, OnPostExitTalkTaskFinished)
    return
  end
  for _, Text in pairs(self.TextChild) do
    Text:UnbindAllFromAnimationFinished()
    Text:RemoveFromParent()
  end
  self.TextChild = nil
  M.Super.PostExitTalkTask(self, TalkTask, TalkData, OnPostExitTalkTaskFinished)
end

function M:PlayDialogue(TalkTask, DialogueData, TaskData)
  DebugPrint("BP_BlackScreenSubtitleUINew_C:PlayDialogue", TalkTask, DialogueData, TaskData, DialogueData.Duration)
  self:SetTextBorderHidden(false)
  self:SetTipImageHidden(true)
  local DialogueId = DialogueData.DialogueId
  local CurrentTextWidget
  if self.bBlackScreenSameScreen then
    self.BlackScreenText:SetText("")
    CurrentTextWidget = self.TextChild[DialogueId]
    CurrentTextWidget:SetRenderOpacity(1)
  else
    self.BlackScreenText:SetText(DialogueData.Content)
    CurrentTextWidget = self
  end
  self.CurrentTextWidget = CurrentTextWidget
  CurrentTextWidget:StopAnimation(CurrentTextWidget.TextOpacityChange)
  CurrentTextWidget:BindToAnimationFinished(CurrentTextWidget.TextOpacityChange, {
    CurrentTextWidget,
    function()
      CurrentTextWidget:UnbindAllFromAnimationFinished(CurrentTextWidget.TextOpacityChange)
      self.CurrentTextWidget = nil
      self:OnWholeDialogueTypingFinished(true)
      if not self.bForceAutoPlay then
        self:SetTipImageHidden(false)
      end
    end
  })
  CurrentTextWidget:PlayAnimation(CurrentTextWidget.TextOpacityChange)
  if DataMgr.Dialogue[DialogueData.DialogueId].RelatedWikiId then
    for _, WikiEntryId in pairs(DataMgr.Dialogue[DialogueData.DialogueId].RelatedWikiId) do
      table.insert(self.WikiEntryIds, WikiEntryId)
    end
    self:TryShowWikiButton(TalkTask)
  end
end

function M:SkipDialogueTyping()
  if IsValid(self.CurrentTextWidget) then
    self.CurrentTextWidget:SetAnimationCurrentTime(self.CurrentTextWidget.TextOpacityChange, self.CurrentTextWidget.TextOpacityChange:GetEndTime() - 0.01)
  end
end

function M:InitializedToolbar()
end

function M:SetTextBorderHidden(bHidden)
  self:StopListeningForInputAction("TalkClick", EInputEvent.IE_Pressed)
  self:StopListeningForInputAction("TalkClick", EInputEvent.IE_Released)
  if bHidden then
    self.BlackScreenText:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.BlackScreenText:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self:ListenForInputAction("TalkClick", EInputEvent.IE_Pressed, false, {
      self,
      self.OnTalkClickPressed
    })
    self:ListenForInputAction("TalkClick", EInputEvent.IE_Released, false, {
      self,
      self.OnTalkClickReleased
    })
    self:ListenForInputAction("TalkClick", EInputEvent.IE_Pressed, false, {
      self,
      self.ActiveUI
    })
    self:ListenForInputAction("TalkClick", EInputEvent.IE_Released, false, {
      self,
      self.ActiveUI
    })
  end
end

function M:SetTipImageHidden(bHidden)
  if bHidden then
    self.Img_Arrow:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Img_Arrow:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:HasPageTypingFinished()
  return true
end

function M:HasWholeDialogueTypingFinished()
  return true
end

function M:Clear()
  DebugPrint("BP_BlackScreenSubtitleUINew_C:Clear")
  self:CleanTimer()
end

function M:OnTalkClickPressed()
  if not self.bForceAutoPlay then
    M.Super.OnTalkClickPressed(self)
  end
end

function M:OnTalkClickReleased()
  if not self.bForceAutoPlay then
    M.Super.OnTalkClickReleased(self)
  end
end

function M:IsAutoPlay()
  if not self.bForceAutoPlay then
    return M.Super.IsAutoPlay(self)
  else
    return true
  end
end

function M:Close()
  M.Super.Close(self)
end

function M:OnPaused()
  DebugPrint("BlackScreenTalk:OnPaused")
  self:SetPlayKeyEnabled(false, "Pause")
  if self.TalkTask then
    self.TalkTask:PauseTaskExternal(true, self)
  end
  self:PauseCurrentText()
end

function M:OnPauseResumed()
  DebugPrint("BlackScreenTalk:OnPauseResumed")
  self:SetPlayKeyEnabled(true, "Pause")
  if self.TalkTask then
    self.TalkTask:PauseTaskExternal(false, self)
  end
  self:ResumeCurrentText()
end

function M:PauseCurrentText()
  if not IsValid(self.CurrentTextWidget) then
    return
  end
  if self.CurrentTextWidget:IsAnimationPlaying(self.CurrentTextWidget.TextOpacityChange) then
    self.TextPausePosition = self.CurrentTextWidget:PauseAnimation(self.CurrentTextWidget.TextOpacityChange)
  end
end

function M:ResumeCurrentText()
  if not IsValid(self.CurrentTextWidget) then
    return
  end
  if self.TextPausePosition then
    self.CurrentTextWidget:PlayAnimation(self.CurrentTextWidget.TextOpacityChange, self.TextPausePosition)
    self.TextPausePosition = nil
  end
end

function M:Hide(HideTag)
  if "Review" == HideTag or "Wiki" == HideTag then
    return
  end
  M.Super.Hide(self, HideTag)
end

function M:Show(ShowTag)
  if HideTag == "Review" or HideTag == "Wiki" then
    return
  end
  M.Super.Show(self, ShowTag)
end

return M
