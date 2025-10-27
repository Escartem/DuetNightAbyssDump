require("UnLua")
require("DataMgr")
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local DialogueButtonListView_C = require("BluePrints.Story.Talk.UI.Common.WBP_TalkSelect_Common")
local WBP_Simple_Common = Class("BluePrints.Story.Talk.UI.BP_TalkBaseUINew_C")

function WBP_Simple_Common:Construct()
  WBP_Simple_Common.Super.Construct(self)
  self.TypingText:SetTypingSpeed(0.5)
  self.bShowingRecall = false
  self.bUseVoiceover = false
  self:SetStoryInputModeEnabled(true)
  DebugPrint("CommonTalkTask:WBP_Simple_Common Construct", UE4.UKismetSystemLibrary.GetFrameCount())
end

function WBP_Simple_Common:Tick(MyGeometry, InDeltaTime)
  WBP_Simple_Common.Super.Tick(self, MyGeometry, InDeltaTime)
  if self.DialogueButtonListView then
    self.DialogueButtonListView:ReceiveTick(InDeltaTime)
  end
end

function WBP_Simple_Common:OnLoaded(...)
  WBP_Simple_Common.Super.OnLoaded(self, ...)
  self.WikiEntryIds = {}
  self:ActiveUI()
  self:SetTextBorderHidden(true)
  self:SetTipImageHidden(true)
  self:ShowWikiButton(false)
  self:ShowSkipButton(false)
  self:ShowReviewButton(false)
  self:ShowConfirmButton(false)
  self:ShowAutoPlayButton(false)
  DebugPrint("CommonTalkTask:WBP_Simple_Common OnLoaded", UE4.UKismetSystemLibrary.GetFrameCount())
end

function WBP_Simple_Common:PreEnterTalkTask(TalkTask, TaskData, OnPreEnterTalkTaskFinished)
  DebugPrint("WBP_Simple_Common:PreEnterTalkTask")
  WBP_Simple_Common.Super.PreEnterTalkTask(self, TalkTask, TaskData, OnPreEnterTalkTaskFinished)
end

function WBP_Simple_Common:SwitchBindTypingEvents(bBind)
  if bBind then
    self.TypingText:BindEventOnFinished(self, self.OnWholeDialogueTypingFinished)
  else
    self.TypingText:UnBindEventOnFinished()
  end
end

function WBP_Simple_Common:PostEnterTalkTask(TalkTask, TaskData, OnPostEnterTalkTaskFinished)
  DebugPrint("WBP_Simple_Common:PostEnterTalkTask")
  self.HasShowWikiButton = false
  self:SwitchEnableWikiButton(false)
  self:SwitchBindTypingEvents(true)
  if -1 == TaskData.BlendInTime then
    self:EnableFilmBack()
  end
  self:RecordData(TaskData)
  self:SwitchEnableSkipButton(self.bDefaultShowSkipButton)
  self:SwitchEnableReviewButton(self.bDefaultShowReviewButton)
  self:SwitchEnableAutoPlayButton(self.bDefaultShowAutoPlayButton)
  self:InitPlayKey()
  self:InitAutoPlay()
  self:PlayAnimation(self.In)
  WBP_Simple_Common.Super.PostEnterTalkTask(self, TalkTask, TaskData, OnPostEnterTalkTaskFinished)
end

function WBP_Simple_Common:RecordData(TaskData)
  self.bDefaultShowAutoPlayButton = TaskData.bShowAutoPlayButton or false
  self.bDefaultShowReviewButton = TaskData.bShowReviewButton or false
  self.bDefaultShowSkipButton = TaskData.bShowSkipButton or false
  self.bDefaultShowWikiButton = TaskData.bShowWikiButton or false
end

function WBP_Simple_Common:PreExitTalkTask(TalkTask, TalkData, OnPreExitTalkTaskFinished)
  DebugPrint("WBP_Simple_Common:PreExitTalkTask")
  self:StopTypingAudio()
  self:TryHideLastDialoguePic()
  self:SetRecallGraphHidden()
  self:SwitchEnableWikiButton(false)
  self:SwitchBindTypingEvents(false)
  self:SwitchEnableSkipButton(false)
  self:SwitchEnableReviewButton(false)
  self:SwitchEnableAutoPlayButton(false)
  self:PlayAnimation(self.Out)
  WBP_Simple_Common.Super.PreExitTalkTask(self, TalkTask, TalkData, OnPreExitTalkTaskFinished, OutType, OutTime)
end

function WBP_Simple_Common:PostExitTalkTask(TalkTask, TaskData, OnPostExitTalkTaskFinished)
  DebugPrint("WBP_Simple_Common:PostExitTalkTask")
  WBP_Simple_Common.Super.PostExitTalkTask(self, TalkTask, TaskData, OnPostExitTalkTaskFinished)
end

function WBP_Simple_Common:EnableFilmBack()
  self.Bg:SetRenderOpacity(1)
end

function WBP_Simple_Common:DisableFilmBack()
  self.Bg:SetRenderOpacity(0)
end

function WBP_Simple_Common:SetTipImageHidden(bHidden)
  self.WS_Type:SetVisibility(bHidden and ESlateVisibility.Collapsed or ESlateVisibility.SelfHitTestInvisible)
end

function WBP_Simple_Common:GetTalkActorName(DialogueData)
  local Name
  if DialogueData.TalkActorName then
    Name = DialogueData.TalkActorName
  else
    local TalkActorData = DialogueData.TalkActorData
    if TalkActorData then
      Name = TalkUtils:GetTalkActorName(TalkActorData.TalkActorType, TalkActorData.TalkActorId)
    else
      Name = TalkUtils:GetTalkActorName("Npc", DialogueData.TalkActorId)
    end
  end
  return GText(Name)
end

function WBP_Simple_Common:OnUseOtherUIPlayDialogue()
  self:SwitchHideDialoguePanel(true)
  self:TryHideLastDialoguePic()
end

function WBP_Simple_Common:TryPlayDialogueAudio(DialogueData)
  if DialogueData and not DialogueData.VoiceName then
    AudioManager(self):PlayUISound(self, "event:/ui/common/dialog_type", "TypingAudioKey", nil)
    self.TypingText:BindEventOnPageEnd(self, self.StopTypingAudio)
  end
end

function WBP_Simple_Common:StopTypingAudio()
  AudioManager(self):StopSound(self, "TypingAudioKey")
  self.TypingText:UnBindEventOnPageEnd()
end

function WBP_Simple_Common:PlayDialogue(TalkTask, DialogueData, TaskData)
  DebugPrint("WBP_Simple_Common:PlayDialogue")
  self:InitDialogueData(DialogueData)
  self:StopTypingAudio()
  local Name = self:GetTalkActorName(DialogueData, DialogueData.DialoguePanelType)
  self.NpcNameText:SetText(Name)
  self.TypingText:Typing(DialogueData.Content)
  self:TryPlayDialogueAudio(DialogueData)
  self:SwitchHideDialoguePanel(false)
  if DialogueData.DialogueId and DataMgr.Dialogue[DialogueData.DialogueId].RelatedWikiId then
    for index, value in pairs(DataMgr.Dialogue[DialogueData.DialogueId].RelatedWikiId) do
      table.insert(self.WikiEntryIds, value)
    end
    self:TryShowWikiButton(TalkTask)
  end
  
  local function Callback()
    if DialogueData.DialoguePanelType == "Voiceover" then
      self.bUseVoiceover = true
      self:SetTipImageHidden(false)
      self:SetTextBorderHidden(false)
      self:SwitchEnableTalkClick(true)
      self.NpcNameText:SetVisibility(ESlateVisibility.Collapsed)
    else
      if self.bUseVoiceover then
        self.bUseVoiceover = false
        self.NpcNameText:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
      end
      if DialogueData.DialoguePanelType == "None" then
        self:SetTipImageHidden(true)
        self:SetTextBorderHidden(true)
        self:SwitchEnableTalkClick(false)
        self.WholeDialogueTypingFinished_Delegate:Fire(true, true)
      else
        self:SetTipImageHidden(false)
        self:SetTextBorderHidden(false)
        self:SwitchEnableTalkClick(true)
      end
    end
    if DialogueData.DialoguePanelType == "AllHide" then
      self:SetVisibility(ESlateVisibility.Collapsed)
      self:SetTipImageHidden(true)
      self:SetTextBorderHidden(true)
      self:SwitchEnableTalkClick(false)
      self.WholeDialogueTypingFinished_Delegate:Fire(true, true)
    end
  end
  
  self:TryHideLastDialoguePic()
  if DialogueData.DialogueGraphPath then
    self:OnPlayRecallGraph(DialogueData)
    Callback()
  else
    self:OnNotPlayRecallGraph()
    self:TryShowDialoguePic(DialogueData)
    if self.bShowingRecall then
      self.bShowingRecall = false
      self:DelayPlayRecallAnim(false)
      Callback()
    else
      Callback()
    end
  end
end

function WBP_Simple_Common:SetTextBorderHidden(bHidden)
  if bHidden then
    self.NpcNameText:SetVisibility(ESlateVisibility.Collapsed)
    self.TypingText:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.NpcNameText:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
    self.TypingText:SetVisibility(ESlateVisibility.Visible)
  end
end

function WBP_Simple_Common:SwitchEnableTalkClick(bEnable)
  DebugPrint("WBP_Simple_Common:SwitchEnableTalkClick", bEnable)
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

function WBP_Simple_Common:SwitchHideDialoguePanel(bHide)
  if bHide then
    self.Panel_SimpleTalk:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Panel_SimpleTalk:SetVisibility(ESlateVisibility.Visible)
  end
end

function WBP_Simple_Common:ShowOptions(TalkTask, OptionTexts, OptionData, OnOptionItemClicked)
  DebugPrint("WBP_Simple_Common:ShowOptions")
  self:StopTypingAudio()
  self:SwitchEnableAutoPlayButton(false)
  self:SwitchEnableSkipButton(false)
  self:SwitchEnableTalkClick(false)
  self:SetTipImageHidden(true)
  self:TryHideLastDialoguePic()
  self.DialogueButtonListView = DialogueButtonListView_C:New()
  self.DialogueButtonListView:Init(self)
  self.DialogueButtonListView:BindItemClicked(nil, function(Obj, ItemIdx)
    self.DialogueButtonListView:UnBindItemClicked()
    self:SwitchEnableAutoPlayButton(self.bDefaultShowAutoPlayButton)
    self:SwitchEnableReviewButton(self.bDefaultShowReviewButton)
    self:SwitchEnableSkipButton(self.bDefaultShowSkipButton)
    if self.HasShowWikiButton then
      self:SwitchEnableWikiButton(self.bDefaultShowWikiButton)
    end
    self:ClearOptions()
    OnOptionItemClicked(ItemIdx)
  end)
  self:SetDialogueButtonListVisibility(ESlateVisibility.Visible)
  for i, v in ipairs(OptionTexts) do
    local Item = NewObject(USimpleDialogueButtonItem)
    Item.Index = v.Index
    Item.OptionTopic = v.Text
    Item.bIsSelected = OptionData.bHasFinalDialogue and v.bIsSelected
    self.DialogueButtonListView:AddItem(Item)
  end
  self.DialogueButtonListView:SetDefaultItem()
  self.DialogueButtonListView:UpdateImgMouse()
end

function WBP_Simple_Common:OnItemClickedStart()
  self:SwitchEnableReviewButton(false)
  self:SwitchEnableWikiButton(false)
end

function WBP_Simple_Common:GetTypingTime(Text)
  if IsValid(self.TypingText) and Text and type(Text) == "string" then
    local TypingSpeed = self.TypingText.TypingSpeed or 0
    local LineSizeX = UE4.UKismetStringLibrary.Len(Text) * 23
    return 1 / (1000 / (1 + LineSizeX) * TypingSpeed)
  end
  return 0
end

function WBP_Simple_Common:ClearOptions()
  DebugPrint("WBP_Simple_Common:ClearOptions")
  if self.DialogueButtonListView then
    self.DialogueButtonListView:ClearListItems()
    self.DialogueButtonListView = nil
  end
  self:SetDialogueButtonListVisibility(ESlateVisibility.Collapsed)
end

function WBP_Simple_Common:SetDialogueButtonListVisibility(Visibility)
  self.Panel_Talk:SetVisibility(Visibility)
end

function WBP_Simple_Common:ToPageEnd()
  if not self.TypingText then
    return
  end
  self.TypingText:ToPageEnd()
end

function WBP_Simple_Common:HasPageTypingFinished()
  if not self.TypingText then
    return false
  end
  return self.TypingText:IsPageEnd()
end

function WBP_Simple_Common:HasWholeDialogueTypingFinished()
  return self.TypingText:IsFinished()
end

function WBP_Simple_Common:InitPlayKey()
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_Simple_Common:InitPlayKey")
end

function WBP_Simple_Common:InitAutoPlay()
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_Simple_Common:InitAutoPlay")
end

return WBP_Simple_Common
