require("UnLua")
require("DataMgr")
local WikiController = require("BluePrints.UI.WBP.Wiki.WikiController")
local WBP_Cinematic_Common = Class("BluePrints.Story.Talk.UI.BP_TalkBaseUINew_C")
local EFilmBackTextShowType = {
  Dialogue = "Dialogue",
  ShortcutKey = "ShortcutKey"
}
local OutAnimationTime = 0.5

function WBP_Cinematic_Common:Construct()
  WBP_Cinematic_Common.Super.Construct(self)
  self.DefaultDeactiveUI = false
  self.EnableDeactiveUI = true
  self.bUseVoiceover = false
  self:SetStoryInputModeEnabled(true)
end

function WBP_Cinematic_Common:Destruct()
  WBP_Cinematic_Common.Super.Destruct(self)
end

function WBP_Cinematic_Common:OnLoaded(...)
  WBP_Cinematic_Common.Super.OnLoaded(self, ...)
  self.WikiEntryIds = {}
  self.FilmBackDisplayShowTypes = {}
  self:AlwaysShowSkipButton()
  self:ActiveUI()
  self:SetTextBorderHidden(true)
  self:InitPlayKey()
  self:ShowSkipButton(false)
  self:ShowReviewButton(false)
  self:ShowConfirmButton(false)
  self:ShowAutoPlayButton(false)
end

function WBP_Cinematic_Common:AlwaysShowSkipButton()
  self.EnableDeactiveUI = false
end

function WBP_Cinematic_Common:PreEnterTalkTask(TalkTask, TaskData, OnPreEnterTalkTaskFinished)
  DebugPrint("WBP_Cinematic_Common:PreEnterTalkTask")
  WBP_Cinematic_Common.Super.PreEnterTalkTask(self, TalkTask, TaskData, OnPreEnterTalkTaskFinished)
  self:ShowVideo(false)
end

function WBP_Cinematic_Common:SwitchEnableActiveUI(bEnable)
  self:StopListeningForInputAction("TalkClick", EInputEvent.IE_Pressed)
  self:StopListeningForInputAction("TalkClick", EInputEvent.IE_Released)
  if bEnable then
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

function WBP_Cinematic_Common:PostEnterTalkTask(TalkTask, TaskData, OnPostEnterTalkTaskFinished)
  DebugPrint("WBP_Cinematic_Common:PostEnterTalkTask")
  self.HasShowWikiButton = false
  self:SwitchEnableWikiButton(false)
  self:SwitchEnableActiveUI(true)
  self:SwitchEnableSkipButton(TaskData.bShowSkipButton or TalkSubsystem():GetForceStorySkipable())
  self:SwitchEnableReviewButton(TaskData.bShowReviewButton)
  self:ShowAutoPlayButton(false)
  self:PlayAnimation(self.In)
  WBP_Cinematic_Common.Super.PostEnterTalkTask(self, TalkTask, TaskData, OnPostEnterTalkTaskFinished)
end

function WBP_Cinematic_Common:PreExitTalkTask(TalkTask, TaskData, OnPreExitTalkTaskFinished)
  DebugPrint("WBP_Cinematic_Common:PreExitTalkTask")
  self:SwitchEnableWikiButton(false)
  self:SwitchEnableSkipButton(false)
  self:SwitchEnableReviewButton(false)
  self:SwitchEnableActiveUI(false)
  self:PlayAnimation(self.Out)
  if OnPreExitTalkTaskFinished then
    OnPreExitTalkTaskFinished:Fire()
  end
end

function WBP_Cinematic_Common:PostExitTalkTask(TalkTask, TaskData, OnPostExitTalkTaskFinished)
  DebugPrint("WBP_Cinematic_Common:PostExitTalkTask")
  WBP_Cinematic_Common.Super.PostExitTalkTask(self, TalkTask, TaskData, OnPostExitTalkTaskFinished)
end

function WBP_Cinematic_Common:EnableFilmBack()
  self:StopAllAnimations()
  self:PlayAnimation(self.Bg_In)
end

function WBP_Cinematic_Common:DisableFilmBack()
  self:StopAllAnimations()
  self:PlayAnimation(self.Bg_Out)
end

function WBP_Cinematic_Common:SetFilmBackDisplay(bDisplay, ShowTag)
  if bDisplay then
    if IsEmptyTable(self.FilmBackDisplayShowTypes) then
      self:EnableFilmBack()
    end
    self.FilmBackDisplayShowTypes[ShowTag] = true
  elseif not IsEmptyTable(self.FilmBackDisplayShowTypes) then
    self.FilmBackDisplayShowTypes[ShowTag] = nil
    if IsEmptyTable(self.FilmBackDisplayShowTypes) then
      self:DisableFilmBack()
    end
  end
end

function WBP_Cinematic_Common:SetTextBorderHidden(bHidden)
  self:SetFilmBackDisplay(not bHidden, EFilmBackTextShowType.Dialogue)
  if bHidden then
    self.Text_Video:SetVisibility(ESlateVisibility.Collapsed)
    self.Text_Video_World_Language:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Text_Video:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.Text_Video_World_Language:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  end
end

function WBP_Cinematic_Common:PlayDialogue(TalkTask, DialogueData, TaskData)
  DebugPrint("Cinematic", DialogueData.Content)
  if DialogueData.DialogueId == nil then
    return
  end
  if DataMgr.Dialogue[DialogueData.DialogueId].RelatedWikiId then
    for index, value in pairs(DataMgr.Dialogue[DialogueData.DialogueId].RelatedWikiId) do
      table.insert(self.WikiEntryIds, value)
    end
    self:TryShowWikiButton(TalkTask)
  end
  if DialogueData.DialoguePanelType == "Voiceover" then
    self.bUseVoiceover = true
    local Content = DialogueData.Content
    local Subtitle = DialogueData.Subtitle
    self.Text_Video:SetText(Content)
    self.Text_Video_World_Language:SetText(Subtitle)
    self.WholeDialogueTypingFinished_Delegate:Fire(true)
  else
    if self.bUseVoiceover then
      self.bUseVoiceover = false
    end
    if DialogueData.DialoguePanelType == "None" then
      self:SetTipImageHidden(true)
      self:SetTextBorderHidden(true)
      self.Bg:SetVisibility(ESlateVisibility.Collapsed)
      self.WholeDialogueTypingFinished_Delegate:Fire(true)
    else
      local Content = DialogueData.Content
      local Subtitle = DialogueData.Subtitle
      self.Text_Video:SetText(Content)
      self.Text_Video_World_Language:SetText(Subtitle)
      self.WholeDialogueTypingFinished_Delegate:Fire(true)
    end
    if DialogueData.DialoguePanelType == "AllHide" then
      self:SetVisibility(ESlateVisibility.Collapsed)
      self:SetTipImageHidden(true)
      self:SetTextBorderHidden(true)
      self.WholeDialogueTypingFinished_Delegate:Fire(true, true)
    end
  end
end

function WBP_Cinematic_Common:ShowVideo(bShow)
  if bShow then
    self.Image_Video:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Image_Video:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Cinematic_Common:OnPlayerActiveUI()
  DebugPrint("WBP_Cinematic_Common:OnPlayerActiveUI")
  self:OnPlayKeyActive()
  self:SetFilmBackDisplay(true, EFilmBackTextShowType.ShortcutKey)
end

function WBP_Cinematic_Common:OnPlayerDeactiveUI()
  DebugPrint("WBP_Cinematic_Common:OnPlayerDeactiveUI")
  self:OnPlayKeyDeactive()
  self:SetFilmBackDisplay(false, EFilmBackTextShowType.ShortcutKey)
end

function WBP_Cinematic_Common:SwitchEnableTalkClick(bEnable)
  DebugPrint("WBP_Cinematic_Common:SwitchEnableTalkClick", bEnable)
  self:SwitchEnableConfirmButton(bEnable)
  self:StopListeningForInputAction("TalkClick", EInputEvent.IE_Pressed)
  self:StopListeningForInputAction("TalkClick", EInputEvent.IE_Released)
  if bEnable then
    self:ListenForInputAction("TalkClick", EInputEvent.IE_Pressed, false, {
      self,
      self.OnTalkClickPressed
    })
    self:ListenForInputAction("TalkClick", EInputEvent.IE_Released, false, {
      self,
      self.OnTalkClickReleased
    })
  end
end

function WBP_Cinematic_Common:OnPlayKeyActive()
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_Cinematic_Common:OnPlayKeyActive")
end

function WBP_Cinematic_Common:OnPlayKeyDeactive()
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_Cinematic_Common:OnPlayKeyDeactive")
end

function WBP_Cinematic_Common:InitPlayKey()
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_Cinematic_Common:InitPlayKey")
end

return WBP_Cinematic_Common
