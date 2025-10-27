require("UnLua")
require("DataMgr")
local WikiController = require("BluePrints.UI.WBP.Wiki.WikiController")
local WBP_Impression_Common = Class("BluePrints.Story.Talk.UI.BP_TalkBaseUINew_C")
local EImpressionButtonState = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").EImpressionButtonState
local ETalkOptionType = require("BluePrints.Story.Talk.Model.TalkOptionData").ETalkOptionType
local TalkUtils = require("BluePrints.Story.Talk.View.TalkUtils")
local ImpressionTypes = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").ImpressionTypes
local ImpressionItemHideUITag = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").ImpressionItemHideUITag
local ImpressionItemNum = 5

function WBP_Impression_Common:Construct()
  WBP_Impression_Common.Super.Construct(self)
  self:SetStoryInputModeEnabled(true)
end

function WBP_Impression_Common:OnLoaded(...)
  WBP_Impression_Common.Super.OnLoaded(self, ...)
  DebugPrint("WBP_Impression_Common:OnLoaded")
  self.WikiEntryIds = {}
  self:InitImpressionUI()
end

function WBP_Impression_Common:InitImpressionUI()
  DebugPrint("WBP_Impression_Common:InitImpressionUI")
  self:InitData_Lua()
  self:InitVisibility()
  self:InitGText()
  self:InitTypingText()
  self:AdaptPlatform()
  self:ShowSkipButton(false)
  self:ShowReviewButton(false)
  self:ShowConfirmButton(false)
  self:ShowAutoPlayButton(false)
  self:SwitchBindAnimationEvents(true)
  self:SwitchBindDimensionButtonEvents(true)
end

function WBP_Impression_Common:SwitchBindAnimationEvents(bBind)
  self:SwitchBindOptionAnimationEvents(bBind)
  self:SwitchBindExitAnimationEvents(bBind)
end

function WBP_Impression_Common:InitData_Lua()
  DebugPrint("WBP_Impression_Common:InitData_Lua")
  self.SelectImpressionItemIndex = nil
  self.OptionMaxNum = -1
  self.bIsTextBorderHidden = true
  self.bImpressionMapVisibility = false
end

function WBP_Impression_Common:InitTypingText()
  self.TypingText:SetTypingSpeed(0.5)
  self:SwitchBindTypingTextOnFinishEvent(true, self, self.OnWholeDialogueTypingFinished)
end

function WBP_Impression_Common:InitGText()
  DebugPrint("WBP_Impression_Common:InitGText")
  self.Text_TipsTitle:SetText(GText("Impression_Repeat_Dice"))
  self.Text_Button:SetText(GText("Impression_UI_Back"))
end

function WBP_Impression_Common:InitVisibility()
  DebugPrint("WBP_Impression_Common:InitVisibility")
  self.Group_Dimension:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_DimensionDrawArea:SetVisibility(ESlateVisibility.Collapsed)
  self.NpcNameText:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Icon_Arrow:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self:SetTextBorderHidden(true)
  self:ShowAutoPlayButton(false)
  self:ShowConfirmButton(false)
  self:ShowReviewButton(false)
  self:ShowSkipButton(false)
  self:ShowWikiButton(false)
  self:SwitchShowOptionUI(false)
end

function WBP_Impression_Common:InitGroupCost(ImpressionAreaId, Count, Cost, bCanCheck)
  DebugPrint("WBP_Impression_Common:InitGroupCost", ImpressionAreaId, Count, Cost, bCanCheck)
  local ImpressionResourceInfo = DataMgr.ImpressionResource[ImpressionAreaId]
  local Params = {
    ResourceId = ImpressionResourceInfo.ResourceId,
    bShowDenominator = true,
    Numerator = Count,
    Denominator = Cost,
    KeyIconName = "RS"
  }
  self.Com_Cost:InitContent(Params)
  return bCanCheck
end

function WBP_Impression_Common:InitOptions(OptionData, TalkTriggerId, ImpressionAreaId, OnOptionItemClicked)
  local OptionState = self:GetOptionState(OptionData, ImpressionAreaId)
  local ImpressionDone = false
  DebugPrint("WBP_Impression_Common:InitOptions", OptionState)
  local Avatar = GWorld:GetAvatar()
  local OverrideType
  local SavedOptions = OptionData.SavedOptions
  local OptionId2Idx = OptionData.OptionId2Idx
  if next(SavedOptions) ~= nil then
    ImpressionDone = true
    self.OptionMaxNum = #SavedOptions
  end
  for i = 1, ImpressionItemNum do
    local OptionType = OverrideType or OptionData.OptionType
    local ImpressionItem = self:GetImpressionItem(i)
    if not ImpressionDone then
      local Option = OptionData.Options[i]
      if Option then
        local IsUsingGM = self.TalkTask.TaskData.UsingGM
        local IsSelected = OptionData.bHasFinalDialogue and Option.bIsSelected
        ImpressionItem:Init(self, i, TalkTriggerId, OptionState, OptionType, Option, nil, function(SpecifyFinishType)
          self:OnOptionItemEnd(i, SpecifyFinishType)
        end, IsUsingGM, IsSelected)
        ImpressionItem:SetOnBeginShowCheckOrPlusUI({
          self,
          self.OnBeginShowCheckOrPlusUI
        })
        ImpressionItem:SetOnEndShowCheckOrPlusUI({
          self,
          self.OnEndShowCheckOrPlusUI
        })
        ImpressionItem:SetOnInterruptedExit({
          self,
          self.StopStoryLine
        })
        ImpressionItem:SetOnHovered({
          self,
          self.OnImpressionItemHovered
        })
        ImpressionItem:SetOnUnhovered({
          self,
          self.OnImpressionItemUnhovered
        })
        ImpressionItem:SetOnClicked({
          self,
          self.OnImpressionItemClicked
        })
      else
        ImpressionItem:OnNotWorking()
      end
    elseif i <= #SavedOptions then
      local OptionIdx = OptionId2Idx[SavedOptions[i]]
      local Option = OptionData.Options[OptionIdx]
      if Option then
        OptionType = ETalkOptionType.Normal
        ImpressionItem:Init(self, i, TalkTriggerId, OptionState, OptionType, Option, nil, function(SpecifyFinishType)
          self:OnOptionItemEnd(OptionIdx, SpecifyFinishType)
        end)
        ImpressionItem:SetOnBeginShowCheckOrPlusUI({
          self,
          self.OnBeginShowCheckOrPlusUI
        })
        ImpressionItem:SetOnEndShowCheckOrPlusUI({
          self,
          self.OnEndShowCheckOrPlusUI
        })
        ImpressionItem:SetOnInterruptedExit({
          self,
          self.StopStoryLine
        })
        ImpressionItem:SetOnHovered({
          self,
          self.OnImpressionItemHovered
        })
        ImpressionItem:SetOnUnhovered({
          self,
          self.OnImpressionItemUnhovered
        })
        ImpressionItem:SetOnClicked({
          self,
          self.OnImpressionItemClicked
        })
      else
        ImpressionItem:OnNotWorking()
      end
    else
      ImpressionItem:OnNotWorking()
    end
  end
end

function WBP_Impression_Common:InitPlayKey()
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_Impression_Common:InitPlayKey")
end

function WBP_Impression_Common:InitAutoPlay()
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_Impression_Common:InitAutoPlay")
end

function WBP_Impression_Common:SwitchBindExitButtonEvents(bBind)
  DebugPrint("WBP_Impression_Common:SwitchBindExitButtonEvents", bBind)
  if bBind then
    self.Button_Area.OnClicked:Add(self, self.OnExitButtonClicked)
    self.Button_Area.OnHovered:Add(self, self.OnExitButtonHovered)
    self.Button_Area.OnUnhovered:Add(self, self.OnExitButtonUnhovered)
    self.Button_Area.OnPressed:Add(self, self.OnExitButtonPressed)
    self.Button_Area.OnReleased:Add(self, self.OnExitButtonReleased)
  else
    self.Button_Area.OnClicked:Remove(self, self.OnExitButtonClicked)
    self.Button_Area.OnHovered:Remove(self, self.OnExitButtonHovered)
    self.Button_Area.OnUnhovered:Remove(self, self.OnExitButtonUnhovered)
    self.Button_Area.OnPressed:Remove(self, self.OnExitButtonPressed)
    self.Button_Area.OnReleased:Remove(self, self.OnExitButtonReleased)
  end
end

function WBP_Impression_Common:SwitchBindExitAnimationEvents(bBind)
  if bBind then
    self:BindToAnimationFinished(self.BtnQuit_Click, {
      self,
      self.OnExitButtonClickAnimFinished
    })
  else
    self:UnbindFromAnimationFinished(self.BtnQuit_Click, {
      self,
      self.OnExitButtonClickAnimFinished
    })
  end
end

function WBP_Impression_Common:SwitchBindTypingTextOnFinishEvent(bBind, Obj, Func)
  if bBind then
    self.TypingText:BindEventOnFinished(Obj, Func)
  else
    self.TypingText:UnBindEventOnFinished()
  end
end

function WBP_Impression_Common:SwitchBindDimensionButtonEvents(bBind)
  if bBind then
    self.Btn_DimensionDrawArea:BindEventOnClicked(self, self.SwitchShowImpressionMap)
    self.Btn_DimensionFullClose.OnClicked:Add(self, self.SwitchShowImpressionMap)
  else
    self.Btn_DimensionDrawArea:UnBindEventOnClicked(self, self.SwitchShowImpressionMap)
    self.Btn_DimensionFullClose.OnClicked:Clear()
  end
end

function WBP_Impression_Common:SwitchBindDimensionAnimationEvents(bBind)
  if not self.DimensionGraph then
    return
  end
  if bBind then
    self.DimensionGraph:BindToAnimationStarted(self.DimensionGraph.In, {
      self,
      self.OnDetails_InStarted
    })
    self.DimensionGraph:BindToAnimationFinished(self.DimensionGraph.Out, {
      self,
      self.OnDetails_OutFinished
    })
  else
    self.DimensionGraph:UnbindFromAnimationStarted(self.DimensionGraph.In, {
      self,
      self.OnDetails_InStarted
    })
    self.DimensionGraph:UnbindFromAnimationFinished(self.DimensionGraph.Out, {
      self,
      self.OnDetails_OutFinished
    })
  end
end

function WBP_Impression_Common:SwitchBindOptionAnimationEvents(bBind)
  if bBind then
    self:BindToAnimationFinished(self.Option_In, {
      self,
      self.OnOptionInAnimationFinished
    })
    self:BindToAnimationFinished(self.Option_Out, {
      self,
      self.OnOptionOutAnimationFinished
    })
    self:BindToAnimationStarted(self.Option_Out, {
      self,
      self.OnOptionOutAnimationStarted
    })
    self:BindToAnimationStarted(self.Option_In, {
      self,
      self.OnOptionInAnimationStarted
    })
  else
    self:UnbindFromAnimationFinished(self.Option_In, {
      self,
      self.OnOptionInAnimationFinished
    })
    self:UnbindFromAnimationFinished(self.Option_Out, {
      self,
      self.OnOptionOutAnimationFinished
    })
    self:UnbindFromAnimationStarted(self.Option_In, {
      self,
      self.OnOptionInAnimationStarted
    })
    self:UnbindFromAnimationStarted(self.Option_Out, {
      self,
      self.OnOptionOutAnimationStarted
    })
  end
end

function WBP_Impression_Common:SwitchEnableImpressionItemClick(bBind)
  DebugPrint("WBP_Impression_Common:SwitchBindImpressionItemButtonEvents", bBind)
  for i = 1, ImpressionItemNum do
    local ImpressionItem = self:GetImpressionItem(i)
    ImpressionItem:SwitchEnableClickEvents(bBind)
  end
end

function WBP_Impression_Common:SwitchEnableItemEvents(Enable)
  self:StopListeningForInputAction("TalkOption", EInputEvent.IE_Released)
  self:StopListeningForInputAction("TalkOption", EInputEvent.IE_Pressed)
  if Enable then
    self:ListenForInputAction("TalkOption", EInputEvent.IE_Pressed, true, {
      self,
      self.OnImpressionItemPressed
    })
    self:ListenForInputAction("TalkOption", EInputEvent.IE_Released, true, {
      self,
      self.OnImpressionItemReleased
    })
  end
end

function WBP_Impression_Common:SwitchEnableMouseWheelEvents(Enable)
  DebugPrint("WBP_Impression_Common:SetMouseWheelEventEnable", Enable)
  self:StopListeningForInputAction("TalkUpSelect", EInputEvent.IE_Pressed)
  self:StopListeningForInputAction("TalkDownSelect", EInputEvent.IE_Pressed)
  if Enable then
    self:ListenForInputAction("TalkUpSelect", EInputEvent.IE_Pressed, true, {
      self,
      self.OnUpSelectItem
    })
    self:ListenForInputAction("TalkDownSelect", EInputEvent.IE_Pressed, true, {
      self,
      self.OnDownSelectItem
    })
  end
end

function WBP_Impression_Common:SwitchEnableOptionClick(bIsEnable)
  DebugPrint("WBP_Impression_Common:SetOptionClickEnable", bIsEnable)
  self:SwitchBindExitButtonEvents(bIsEnable)
  self:SwitchEnableImpressionItemClick(bIsEnable)
  self:SwitchEnableItemEvents(bIsEnable)
end

function WBP_Impression_Common:PreEnterTalkTask(TalkTask, TaskData, OnPreEnterTalkTaskFinished)
  DebugPrint("WBP_Impression_Common:PreEnterTalkTask")
  WBP_Impression_Common.Super.PreEnterTalkTask(self, TalkTask, TaskData, OnPreEnterTalkTaskFinished)
end

function WBP_Impression_Common:PostEnterTalkTask(TalkTask, TaskData, OnPostEnterTalkTaskFinished)
  self.HasShowWikiButton = false
  DebugPrint("WBP_Impression_Common:PostEnterTalkTask")
  self:RecordData(TaskData)
  self:SwitchEnableWikiButton(false)
  self:SwitchEnableSkipButton(self.bDefaultShowSkipButton)
  self:SwitchEnableReviewButton(self.bDefaultShowReviewButton)
  self:SwitchEnableAutoPlayButton(self.bDefaultShowAutoPlayButton)
  self:InitPlayKey()
  self:InitAutoPlay()
  self:PlayAnimation(self.Dialog_In)
  WBP_Impression_Common.Super.PostEnterTalkTask(self, TalkTask, TaskData, OnPostEnterTalkTaskFinished)
end

function WBP_Impression_Common:RecordData(TaskData)
  self.bDefaultShowAutoPlayButton = TaskData.bShowAutoPlayButton or false
  self.bDefaultShowReviewButton = TaskData.bShowReviewButton or false
  self.bDefaultShowSkipButton = TaskData.bShowSkipButton or false
  self.bDefaultShowWikiButton = TaskData.bShowWikiButton or false
end

function WBP_Impression_Common:PreExitTalkTask(TalkTask, TalkData, OnPreExitTalkTaskFinished, OutType, OutTime)
  DebugPrint("WBP_Impression_Common:PreExitTalkTask", TalkTask, TalkData, OnPreExitTalkTaskFinished, OutType, OutTime)
  self:TryHideLastDialoguePic()
  self:SetRecallGraphHidden()
  self:StopTypingAudio()
  self:SwitchEnableWikiButton(false)
  self:SwitchBindAnimationEvents(false)
  self:SwitchBindDimensionAnimationEvents(false)
  self:SwitchEnableSkipButton(false)
  self:SwitchEnableReviewButton(false)
  self:SwitchEnableAutoPlayButton(false)
  self:ClearOptions()
  self:StopAllAnimations()
  self:PlayAnimation(self.Dialog_Out)
  WBP_Impression_Common.Super.PreExitTalkTask(self, TalkTask, TalkData, OnPreExitTalkTaskFinished, OutType, OutTime)
end

function WBP_Impression_Common:PlayDialogue(TalkTask, DialogueData, TaskData)
  DebugPrint("WBP_Impression_Common:PlayDialogue", TalkTask, DialogueData, TaskData)
  self:StopTypingAudio()
  self:InitDialogueData(DialogueData)
  self:SetTalkActorName(DialogueData)
  self.TypingText:Typing(DialogueData.Content)
  self:TryPlayDialogueTypingAudio(DialogueData)
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
      if DialogueData.DialoguePanelType == "AllHide" then
        self:SetVisibility(ESlateVisibility.Collapsed)
        self:SetTipImageHidden(true)
        self:SetTextBorderHidden(true)
        self:SwitchEnableTalkClick(false)
        self.WholeDialogueTypingFinished_Delegate:Fire(true, true)
      end
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

function WBP_Impression_Common:OnOptionItemEnd(ItemIdx, SpecifyFinishType)
  DebugPrint("WBP_Impression_Common:OnOptionItemEnd")
  
  function self.OnOptionOutAnimationFinishedCallback()
    if self.OnOptionItemClicked then
      self.OnOptionItemClicked(ItemIdx, SpecifyFinishType)
    end
    self.OnOptionItemClicked = nil
  end
  
  self:SwitchEnableSkipButton(self.bDefaultShowSkipButton)
  self:SwitchEnableReviewButton(self.bDefaultShowReviewButton)
  self:SwitchEnableAutoPlayButton(self.bDefaultShowAutoPlayButton)
  if self.HasShowWikiButton then
    self:SwitchEnableWikiButton(self.bDefaultShowWikiButton)
  end
  self:PlayAnimation(self.Option_Out)
end

function WBP_Impression_Common:OnBeginShowCheckOrPlusUI()
  DebugPrint("WBP_Impression_Common:OnBeginShowCheckOrPlusUI")
  self:Hide(ImpressionItemHideUITag)
  self:SwitchEnableReviewButton(false)
end

function WBP_Impression_Common:OnEndShowCheckOrPlusUI()
  DebugPrint("WBP_Impression_Common:OnEndShowCheckOrPlusUI")
  self:Show(ImpressionItemHideUITag)
  self:SwitchEnableReviewButton(self.bDefaultShowReviewButton)
end

function WBP_Impression_Common:OnUpSelectItem()
  local NewSelectImpressionItemIndex = math.max(1, self.SelectImpressionItemIndex - 1)
  if NewSelectImpressionItemIndex ~= self.SelectImpressionItemIndex then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_add", "", nil)
  end
  self:SetSelectImpressionItem(NewSelectImpressionItemIndex)
end

function WBP_Impression_Common:OnDownSelectItem()
  local MaxNum = self.Group_Button:IsVisible() and self.OptionMaxNum + 1 or self.OptionMaxNum
  local NewSelectImpressionItemIndex = math.min(MaxNum, self.SelectImpressionItemIndex + 1)
  if NewSelectImpressionItemIndex ~= self.SelectImpressionItemIndex then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_add", "", nil)
  end
  self:SetSelectImpressionItem(NewSelectImpressionItemIndex)
end

function WBP_Impression_Common:SwithShowExitButton(bShow)
  if bShow then
    self.Group_Button:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_Button:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Impression_Common:SwitchShowDimensionGroup(bShow)
  if bShow then
    self.Btn_DimensionDrawArea:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Btn_DimensionDrawArea:SetVisibility(ESlateVisibility.Collapsed)
    self.Group_Dimension:SetVisibility(ESlateVisibility.Collapsed)
    if self.DimensionGraph then
      self.DimensionGraph:StopLoop()
    end
  end
end

function WBP_Impression_Common:SwitchShowCostGroup(bShow)
  if bShow then
    self.Group_Cost:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.Group_Cost:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Impression_Common:ChangeExitButtonVisibilityFromOptionType(OptionData)
  if OptionData.OptionType == ETalkOptionType.Check then
    self:SwithShowExitButton(true)
  else
    self:SwithShowExitButton(false)
  end
end

function WBP_Impression_Common:IsOptionCanCheck(ImpressionAreaId, OptionData)
  local bCanCheck = true
  local OptionType = OptionData.OptionType
  if OptionType == ETalkOptionType.Check then
    local Avatar = GWorld:GetAvatar()
    if self:IsRetryCheck(OptionData) then
      return Avatar:CanImpressionCheck(ImpressionAreaId).bCanCheck
    end
  end
  return bCanCheck
end

function WBP_Impression_Common:IsRetryCheck(OptionData)
  local Avatar = GWorld:GetAvatar()
  if nil == Avatar then
    return false
  end
  local Options = OptionData.Options
  if not Options then
    return false
  end
  for _, Option in pairs(Options) do
    local DialogueId = Option.OptionId
    if Avatar:IsImpressionCheckFailure(DialogueId) then
      return true
    end
  end
  return false
end

function WBP_Impression_Common:GetOptionState(OptionData, ImpressionAreaId)
  local OptionState = EImpressionButtonState.Enabled
  local bCanCheck = self:IsOptionCanCheck(ImpressionAreaId, OptionData)
  if not bCanCheck then
    OptionState = EImpressionButtonState.Disabled
  end
  return OptionState
end

function WBP_Impression_Common:GetOptionImpressionAreaId(OptionData)
  local ImpressionAreaId
  local OptionType = OptionData.OptionType
  if OptionType == ETalkOptionType.Plus then
    local PlusId = OptionData.Options[1].PlusId
    local PlusData = DataMgr.ImpressionPlus[PlusId]
    if PlusData then
      ImpressionAreaId = PlusData.RegionId
    else
      local Title = "\229\141\176\232\177\161\229\138\160\229\128\188Id\228\184\141\229\173\152\229\156\168"
      local Message = string.format("\229\138\160\229\128\188Id: %s \229\156\168ImpressionPlus\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168\239\188\140\232\175\183\230\163\128\230\159\165\233\133\141\231\189\174", tostring(PlusId))
      UStoryLogUtils.PrintToFeiShu(self, Title, Message)
      return nil, false
    end
  elseif OptionType == ETalkOptionType.Check then
    local CheckId = OptionData.Options[1].CheckId
    local CheckData = DataMgr.ImpressionCheck[CheckId]
    if CheckData then
      ImpressionAreaId = CheckData.RegionId
    else
      local Title = "\229\141\176\232\177\161\230\163\128\229\174\154Id\228\184\141\229\173\152\229\156\168"
      local Message = string.format("\230\163\128\229\174\154Id: %s \229\156\168ImpressionCheck\232\161\168\228\184\173\228\184\141\229\173\152\229\156\168\239\188\140\232\175\183\230\163\128\230\159\165\233\133\141\231\189\174", tostring(CheckId))
      UStoryLogUtils.PrintToFeiShu(self, Title, Message)
      return nil, false
    end
  end
  return ImpressionAreaId, true
end

function WBP_Impression_Common:GetImpressionItem(Index)
  if Index then
    return self["BP_Impression_Item_PC_" .. Index]
  end
end

function WBP_Impression_Common:GetCurrentSelectIndex()
  return self.SelectImpressionItemIndex
end

function WBP_Impression_Common:TryDisplayCostGroup(OptionType, ImpressionAreaId, bIsRetryCheck)
  DebugPrint("WBP_Impression_Common:TryDisplayCostGroup", ImpressionAreaId)
  self:SwitchShowCostGroup(false)
  if not bIsRetryCheck then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if OptionType == ETalkOptionType.Check then
    local Ret = Avatar:CanImpressionCheck(ImpressionAreaId)
    local bCanCheck = Ret.bCanCheck
    local Count = Ret.ResourceCount or 0
    self:InitGroupCost(ImpressionAreaId, Count, Ret.Cost, bCanCheck)
    self:SwitchShowCostGroup(true)
  end
end

function WBP_Impression_Common:IsExitButtonHidden()
  return self.Group_Button:GetVisibility() ~= ESlateVisibility.Collapsed
end

function WBP_Impression_Common:IsExitButtonIndex(i)
  return i > self.OptionMaxNum
end

function WBP_Impression_Common:SetSelectImpressionItem(Index)
  DebugPrint("WBP_Impression_Common:SetSelectImpressionItem", Index)
  if self:IsExitButtonHidden() == false then
    Index = math.min(Index, self.OptionMaxNum)
  end
  if self.SelectImpressionItemIndex == Index then
    return
  end
  if self.SelectImpressionItemIndex then
    if self:IsExitButtonIndex(self.SelectImpressionItemIndex) then
      self:OnExitButtonSelected(false)
    else
      local Item = self:GetImpressionItem(self.SelectImpressionItemIndex)
      Item:SetSelect(false)
    end
  end
  self.SelectImpressionItemIndex = Index
  if self:IsExitButtonIndex(self.SelectImpressionItemIndex) then
    self:OnExitButtonSelected(true)
  else
    self.ScrollBox_Items:ScrollWidgetIntoView(self:GetImpressionItem(self.SelectImpressionItemIndex), true)
    local Item = self:GetImpressionItem(self.SelectImpressionItemIndex)
    Item:SetSelect(true)
  end
end

function WBP_Impression_Common:SwitchShowOptionUI(bShow)
  if bShow then
    self.VB_GroupItem:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  else
    self.VB_GroupItem:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Impression_Common:InitOptionData(TalkTask, OptionData, OnOptionItemClicked)
  self.TalkTask = TalkTask
  self.OptionData = OptionData
  self.OptionMaxNum = #OptionData.Options
  self.OnOptionItemClicked = OnOptionItemClicked
end

function WBP_Impression_Common:ShowOptions(TalkTask, OptionTexts, OptionData, OnOptionItemClicked)
  DebugPrint("WBP_Impression_Common:ShowOptions", TalkTask, OptionTexts, OptionData, OnOptionItemClicked)
  self:TryHideLastDialoguePic()
  self:StopTypingAudio()
  self:InitOptionData(TalkTask, OptionData, OnOptionItemClicked)
  self:PlayAnimation(self.Option_In)
  EventManager:FireEvent(EventID.ImpressionTalk)
end

function WBP_Impression_Common:ClearOptions()
  DebugPrint("WBP_Impression_Common:ClearOptions")
  for i = 1, ImpressionItemNum do
    local ImpressionItem = self:GetImpressionItem(i)
    if ImpressionItem then
      ImpressionItem:Clear()
    end
  end
  self.SelectImpressionItemIndex = nil
end

function WBP_Impression_Common:TryDisplayImpressionDimension(ImpressionAreaId, OptionData)
  local OptionType = OptionData.OptionType
  if OptionType == ETalkOptionType.Plus or OptionType == ETalkOptionType.Check then
    self:InitDimensionGraph(ImpressionAreaId)
    self:SwitchShowDimensionGroup(true)
    self.Btn_DimensionDrawArea:Init(ImpressionAreaId)
  end
end

function WBP_Impression_Common:InitDimensionGraph(ImpressionAreaId)
  if self.bDimensionGraphInited then
    self.DimensionGraph:Init(ImpressionAreaId, self.TalkTask.TaskData.UsingGM)
    return
  end
  self.DimensionGraph = self.BP_DimensionDrawArea
  local RegionInfo = DataMgr.ImpressionRegion[ImpressionAreaId]
  if RegionInfo and RegionInfo.UIName then
    local Widget = self:CreateWidgetNew(RegionInfo.UIName)
    if Widget then
      self.Group_Anchor:ClearChildren()
      self.Group_Anchor:AddChild(Widget)
      self.DimensionGraph = Widget
    end
  end
  self.DimensionGraph:Init(ImpressionAreaId, self.TalkTask.TaskData.UsingGM)
  self:SwitchBindDimensionAnimationEvents(true)
  self.bDimensionGraphInited = true
end

function WBP_Impression_Common:SetExitButtonNormal()
  self:PlayAnimation(self.BtnQuit_Normal)
end

function WBP_Impression_Common:SetTalkActorName(DialogueData)
  local Name = DialogueData.TalkActorName
  if not Name then
    local TalkActorData = DialogueData.TalkActorData
    if TalkActorData then
      Name = TalkUtils:GetTalkActorName(TalkActorData.TalkActorType, TalkActorData.TalkActorId)
    else
      Name = TalkUtils:GetTalkActorName("Npc", DialogueData.TalkActorId)
    end
  end
  local Name = GText(Name)
  self.NpcNameText:SetText(Name)
end

function WBP_Impression_Common:SetTextBorderHidden(bHidden)
  if bHidden then
    self.Group_Dialog:SetVisibility(ESlateVisibility.Collapsed)
  else
    self.Group_Dialog:SetVisibility(ESlateVisibility.HitTestInvisible)
  end
end

function WBP_Impression_Common:ToPageEnd()
  self.TypingText:ToPageEnd()
end

function WBP_Impression_Common:HasPageTypingFinished()
  return self.TypingText:IsPageEnd()
end

function WBP_Impression_Common:HasWholeDialogueTypingFinished()
  return self.TypingText:IsFinished()
end

function WBP_Impression_Common:SetSelectExitButton()
  DebugPrint("WBP_Impression_Common:SetSelectExitButton")
  self:SetSelectImpressionItem(self.OptionMaxNum + 1)
end

function WBP_Impression_Common:OnExitButtonSelected(bIsSelect)
  DebugPrint("WBP_Impression_Common:OnExitButtonSelected", bIsSelect)
  self.bExitButtonSelect = bIsSelect
  if bIsSelect then
    self:PlayExitButtonHoveredPerformance()
  else
    self:PlayExitButtonUnhoveredPerformance()
  end
  self:OnExitButtonSelectedPlatform(bIsSelect)
end

function WBP_Impression_Common:TryPlayDialogueTypingAudio(DialogueData)
  if DialogueData and not DialogueData.VoiceName then
    AudioManager(self):PlayUISound(self, "event:/ui/common/dialog_type", "TypingAudioKey", nil)
    self.TypingText:BindEventOnPageEnd(self, self.StopTypingAudio)
  end
end

function WBP_Impression_Common:StopTypingAudio()
  AudioManager(self):StopSound(self, "TypingAudioKey")
  self.TypingText:UnBindEventOnPageEnd()
end

function WBP_Impression_Common:SwitchEnableTalkClick(bEnable)
  DebugPrint("WBP_Impression_Common:SwitchEnableTalkClick", bEnable)
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

function WBP_Impression_Common:SetTipImageHidden(bHidden)
  DebugPrint("WBP_Impression_Common:SetTipImageHidden", bHidden)
  self.WS_Type:SetVisibility(bHidden and ESlateVisibility.Collapsed or ESlateVisibility.SelfHitTestInvisible)
end

function WBP_Impression_Common:SwitchShowImpressionMap()
  self.bImpressionMapVisibility = not self.bImpressionMapVisibility
  if self.bImpressionMapVisibility then
    self:SwitchDimensionBg(true)
    self.DimensionGraph:SwitchActive(true)
  else
    self:SwitchDimensionBg(false)
    self.DimensionGraph:SwitchActive(false)
  end
  self.Btn_DimensionFullClose:SetVisibility(self.bImpressionMapVisibility and ESlateVisibility.Visible or ESlateVisibility.Collapsed)
end

function WBP_Impression_Common:SwitchDimensionBg(bShow)
  if bShow then
    self:StopAnimation(self.BtnBg_Out)
    self:StopAnimation(self.BtnBg_In)
    self:PlayAnimation(self.BtnBg_In)
  else
    self:StopAnimation(self.BtnBg_Out)
    self:StopAnimation(self.BtnBg_In)
    self:PlayAnimation(self.BtnBg_Out)
  end
end

function WBP_Impression_Common:OnExitButtonClicked()
  DebugPrint("WBP_Impression_Common:OnExitButtonClicked")
  self:SwitchEnableOptionClick(false)
  self:PlayAnimation(self.BtnQuit_Click)
  if self.bImpressionMapVisibility then
    self:SwitchShowImpressionMap()
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_return", "", nil)
end

function WBP_Impression_Common:OnExitButtonHovered()
  DebugPrint("WBP_Impression_Common:OnExitButtonHovered")
  self:SetSelectExitButton()
end

function WBP_Impression_Common:OnExitButtonUnhovered()
  DebugPrint("WBP_Impression_Common:OnExitButtonUnhovered")
end

function WBP_Impression_Common:PlayExitButtonHoveredPerformance()
  DebugPrint("WBP_Impression_Common:PlayExitButtonHoveredPerformance")
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_add", "", nil)
  self:SetSelectExitButton()
  self:PlayExitButtonHoveredPerformanceByPlatform()
end

function WBP_Impression_Common:PlayExitButtonUnhoveredPerformance()
  DebugPrint("WBP_Impression_Common:PlayExitButtonUnhoveredPerformance")
  self:PlayExitButtonUnhoveredPerformanceByPlatform()
end

function WBP_Impression_Common:OnExitButtonPressed()
  DebugPrint("WBP_Impression_Common:OnExitButtonPressed")
  self:PlayAnimation(self.BtnQuit_Press)
end

function WBP_Impression_Common:OnExitButtonReleased()
  DebugPrint("WBP_Impression_Common:OnExitButtonReleased")
  self:OnExitButtonReleasedByPlatform()
end

function WBP_Impression_Common:OnExitButtonClickAnimFinished()
  DebugPrint("WBP_Impression_Common:OnExitButtonClickAnimFinished")
  self:StopAllAnimations()
  
  function self.OnOptionOutAnimationFinishedCallback()
    self:StopStoryLine()
  end
  
  self:PlayAnimation(self.Option_Out)
end

function WBP_Impression_Common:StopStoryLine()
  DebugPrint("WBP_Impression_Common:StopStoryLine")
  self.StopStoryline_Delegate:Fire()
end

function WBP_Impression_Common:OnImpressionItemHovered(ItemIndex)
  self:SetSelectImpressionItem(ItemIndex)
end

function WBP_Impression_Common:OnImpressionItemUnhovered(ItemIndex)
end

function WBP_Impression_Common:OnImpressionItemClicked(Item)
  DebugPrint("WBP_Impression_Common:OnClickedItem", Item.State)
  self:StopAllAnimations()
  if Item.State == EImpressionButtonState.Enabled then
    self:SwitchEnableOptionClick(false)
    if self.bImpressionMapVisibility then
      self:SwitchShowImpressionMap()
    end
    if self.OptionData.OptionType == ETalkOptionType.Check then
      local Options = {}
      for i, Option in ipairs(self.OptionData.Options) do
        table.insert(Options, Option.OptionId)
      end
      local OptionData = {
        bImpression = true,
        OptionType = "Check",
        Options = Options,
        VisitedOptions = {},
        SelectedOption = Item.Option.OptionId
      }
      self.TalkTask.DialogueRecordComponent:OnOptionRecord(OptionData.SelectedOption, OptionData, true)
    end
    self:SwitchEnableReviewButton(false)
    self:SwitchEnableWikiButton(false)
  end
end

function WBP_Impression_Common:OnImpressionItemPressed()
  if self.SelectImpressionItemIndex then
    if self.SelectImpressionItemIndex > self.OptionMaxNum then
      self:OnExitButtonPressed()
    else
      local ImpressionItem = self:GetImpressionItem(self.SelectImpressionItemIndex)
      ImpressionItem:OnPressed()
    end
  end
end

function WBP_Impression_Common:OnImpressionItemReleased()
  if self.SelectImpressionItemIndex then
    if self.SelectImpressionItemIndex > self.OptionMaxNum then
      self:OnExitButtonClicked()
    else
      local ImpressionItem = self:GetImpressionItem(self.SelectImpressionItemIndex)
      ImpressionItem:OnClicked()
    end
  end
end

function WBP_Impression_Common:GetCurrentImpressionItem()
  if not self.SelectImpressionItemIndex then
    return nil
  end
  if self.SelectImpressionItemIndex > self.OptionMaxNum then
    return self.Button_Area
  else
    return self:GetImpressionItem(self.SelectImpressionItemIndex)
  end
end

function WBP_Impression_Common:OnDetails_InStarted()
  self.Group_Dimension:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
end

function WBP_Impression_Common:OnDetails_OutFinished()
  self.Group_Dimension:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_Impression_Common:OnOptionInAnimationStarted()
  DebugPrint("WBP_Impression_Common:OnOptionInAnimationStarted")
  self.SelectImpressionItemIndex = nil
  local TalkTriggerId = self.TalkTask.TaskData.TalkTriggerId
  local ImpressionAreaId, Ret = self:GetOptionImpressionAreaId(self.OptionData)
  if not Ret then
    return
  end
  local bIsRetryCheck = self:IsRetryCheck(self.OptionData)
  self:InitOptions(self.OptionData, TalkTriggerId, ImpressionAreaId)
  self:SwitchEnableTalkClick(false)
  self:SwitchEnableAutoPlayButton(false)
  self:SwitchEnableSkipButton(false)
  self:SetSelectImpressionItem(1)
  self:SetExitButtonNormal()
  self:SwitchShowOptionUI(true)
  self:SetTipImageHidden(true)
  self:ChangeExitButtonVisibilityFromOptionType(self.OptionData)
  self:ChangeImgMouseVisibility(self.OptionData)
  self:TryDisplayCostGroup(self.OptionData.OptionType, ImpressionAreaId, bIsRetryCheck)
  self:TryDisplayImpressionDimension(ImpressionAreaId, self.OptionData)
end

function WBP_Impression_Common:OnOptionInAnimationFinished()
  DebugPrint("WBP_Impression_Common:OnOptionInAnimationFinished")
  self:SwitchEnableOptionClick(true)
  self:SwitchEnableMouseWheelEvents(true)
end

function WBP_Impression_Common:OnOptionOutAnimationStarted()
  DebugPrint("WBP_Impression_Common:OnOptionOutAnimationStarted", self.OnOptionOutAnimationFinishedCallback)
  self:SwitchEnableOptionClick(false)
  self:SwitchEnableMouseWheelEvents(false)
  self:SwitchShowOptionUI(false)
  self:SwitchShowDimensionGroup(false)
  self:SwitchShowCostGroup(false)
  if self.OnOptionOutAnimationFinishedCallback then
    self.OnOptionOutAnimationFinishedCallback()
    self.OnOptionOutAnimationFinishedCallback = nil
  end
  self.SelectImpressionItemIndex = nil
end

function WBP_Impression_Common:IsExitButtonSelect()
  return self.bExitButtonSelect
end

function WBP_Impression_Common:OnOptionOutAnimationFinished()
  DebugPrint("WBP_Impression_Common:OnOptionOutAnimationFinished")
end

function WBP_Impression_Common:OnUseOtherUIPlayDialogue()
  self:SwitchHideDialoguePanel(true)
  self:TryHideLastDialoguePic()
end

function WBP_Impression_Common:SwitchHideDialoguePanel(bHide)
  self:SetTextBorderHidden(bHide)
end

function WBP_Impression_Common:AdaptPlatform()
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_Impression_Common:AdaptPlatform")
end

function WBP_Impression_Common:OnExitButtonSelectedPlatform(bIsSelect)
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_Impression_Common:OnExitButtonSelectedPlatform", bIsSelect)
end

function WBP_Impression_Common:OnExitButtonReleasedByPlatform()
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_Impression_Common:OnExitButtonReleasedByPlatform")
end

function WBP_Impression_Common:PlayExitButtonHoveredPerformanceByPlatform()
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_Impression_Common:PlayExitButtonHoveredPerformanceByPlatform")
end

function WBP_Impression_Common:PlayExitButtonUnhoveredPerformanceByPlatform()
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_Impression_Common:PlayExitButtonUnhoveredPerformanceByPlatform")
end

function WBP_Impression_Common:ChangeImgMouseVisibility(OptionData)
  DebugPrint("Error: \230\156\170\229\174\158\231\142\176\231\154\132\229\135\189\230\149\176WBP_Impression_Common:ChangeImgMouseVisibility")
end

return WBP_Impression_Common
