require("UnLua")
local CommonUtils = require("Utils.CommonUtils")
local M = Class("BluePrints.UI.BP_UIState_C")
M._components = {
  "BluePrints.UI.WBP.DetectiveMinigame.WBP_Reasoning_C_GamepadComp"
}
local ReasoningUtils = require("BluePrints.UI.WBP.DetectiveMinigame.ReasoningUtils")
local EReasoningState = {
  SeeAnswerDetail = 1,
  CommitAnswer = 2,
  InferAnswer = 3,
  CommitAnswerFinish = 4
}

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "DetectiveOpen", nil)
  self.TabNewAnswerId, self.TabNewQuestionId, self.IsInDialogue = ...
  self.InputInit = false
  local Material = self.Img_Animation01:GetDynamicMaterial()
  Material:SetScalarParameterValue("XNum", 1.0)
  Material:SetScalarParameterValue("YNum", 7.0)
  self.NeededAnswerCount = 0
  self.UnlockedNeededAnswerCount = 0
  self.CurrentSelectedAnswers = {}
  self.Avatar = GWorld:GetAvatar()
  self:BindEvents()
  self:InitComTab()
  self.Panel_Guide:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if not ReddotManager.GetTreeNode("DetectiveAnswer") then
    ReddotManager.AddNode("DetectiveAnswer")
  end
  if self.Avatar then
    self:InitQuestion()
    self:InitSortedAnswers()
    self:InitAnswers()
    self:ClearClueWidgetsAnimations()
  end
  self.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.InferOrCommitFailTimes = 0
  self:RefreshButtonUI()
  self:InitGamePadUI()
  if not self.IsClueEmpty and not ReasoningUtils:IsMultiEndingQuestion(self.CurerntQuestionId) then
    self.Clue_01:SelectSelf()
  end
  self:SetPanelGuideText(-1, false, false, true)
  self.AutoClose = false
end

function M:BindEvents()
  self.Btn_Associate.Btn_Click.OnClicked:Add(self, self.OnClickButtonAssociate)
  self.Btn_Close.OnClicked:Add(self, self.OnClickCloseButton)
  ReddotManager.AddListener("DetectiveAnswer", self, self.RefreshReddot)
end

function M:Construct()
  self.ClueWidgets = {
    self.Clue_01,
    self.Clue_02,
    self.Clue_03,
    self.Clue_04,
    self.Clue_05,
    self.Clue_06
  }
  AudioManager(self):PlaySystemUIBGM("event:/bgm/cbt03/0072_story_reasoning", nil, "Reasoning")
end

function M:Destruct()
  self:UnbindEvents()
  ReddotManager.RemoveListener("DetectiveAnswer", self)
  M.Super.Destruct(self)
end

function M:UnbindEvents()
  self.Btn_Associate.Btn_Click.OnClicked:Remove(self, self.OnClickButtonAssociate)
end

function M:Close()
  self.Super.Close(self)
  if self.Book.IsClueUi then
    self:PlayAnimation(self.Guide_Out)
  end
  AudioManager(self):SetEventSoundParam(self, "DetectiveOpen", {ToEnd = 1})
  AudioManager(self):StopSystemUIBGM("Reasoning")
  if self.AutoClose then
    local TaskPanel = UIManager(self):GetUIObj("TaskPanel")
    if TaskPanel then
      TaskPanel.AutoClose = true
    end
  end
end

function M:InitQuestion()
  self.DetectiveGameCurrentQuestions = self.Avatar.DetectiveGameUnlockedQuestions
  self.Index = 1
  local parentQuestions = {}
  local childToParentMap = {}
  for questionId, _ in pairs(self.DetectiveGameCurrentQuestions) do
    local questionData = DataMgr.DetectiveQuestion[questionId]
    if questionData then
      local parentId = questionData.ParentQuestionID
      if not parentId or 0 == parentId then
        if not parentQuestions[questionId] then
          parentQuestions[questionId] = {
            id = questionId,
            children = {}
          }
        end
      else
        childToParentMap[questionId] = parentId
        if not parentQuestions[parentId] then
          parentQuestions[parentId] = {
            id = parentId,
            children = {}
          }
        end
        table.insert(parentQuestions[parentId].children, questionId)
      end
    end
  end
  for parentId, parentQuestion in pairs(parentQuestions) do
    if parentQuestion.children and #parentQuestion.children > 0 then
      table.sort(parentQuestion.children, function(a, b)
        local aSolved = ReasoningUtils:IsQuestionSolved(a)
        local bSolved = ReasoningUtils:IsQuestionSolved(b)
        if aSolved ~= bSolved then
          return not aSolved and bSolved
        end
        return a < b
      end)
    end
  end
  self.ParentQuestions = parentQuestions
  self.ChildToParentMap = childToParentMap
  local firstParentId
  for id, _ in pairs(parentQuestions) do
    firstParentId = id
    break
  end
  DebugPrint("InitQuestion: ", self.CurerntQuestionId)
  if 0 == self.CurerntQuestionId then
    self.Text_Title:SetText(GText("Minigame_Textmap_100301"))
  end
  self.Book:InitUIInfo(self.ParentQuestions, self, self.TabNewAnswerId, self.TabNewQuestionId)
end

function M:InitSortedAnswers()
  local DetectiveQuestionData = DataMgr.DetectiveQuestion[self.CurerntQuestionId]
  if DetectiveQuestionData then
    local Tips = DetectiveQuestionData.Tips
    self.Text_Title:SetText(GText(Tips))
    local ProbablyNeededAnswers = DetectiveQuestionData.ProbablyNeededAnswers
    self.NeededAnswers = {}
    if ProbablyNeededAnswers then
      for _, Answer in pairs(ProbablyNeededAnswers) do
        self.NeededAnswers[Answer] = false
        self.NeededAnswerCount = self.NeededAnswerCount + 1
      end
    end
  end
  self.CurrentUnlockedAnswers = {}
  local UnlockedAnswers = self.Avatar.DetectiveGameUnlockedAnswers
  for AnswerId, Timestamp in pairs(UnlockedAnswers) do
    if self.NeededAnswers and self.NeededAnswers[AnswerId] ~= nil then
      table.insert(self.CurrentUnlockedAnswers, AnswerId)
      if self.NeededAnswers[AnswerId] == false then
        self.NeededAnswers[AnswerId] = true
        self.UnlockedNeededAnswerCount = self.UnlockedNeededAnswerCount + 1
      end
    end
    DebugPrint("AnswerId, Timestamp", AnswerId, Timestamp)
  end
  table.sort(self.CurrentUnlockedAnswers, function(a, b)
    return UnlockedAnswers[a] < UnlockedAnswers[b]
  end)
end

function M:InitAnswers()
  for _, clueWidget in ipairs(self.ClueWidgets) do
    if clueWidget then
      clueWidget:Reset()
    end
  end
  local clueCount = #self.CurrentUnlockedAnswers
  for i = 1, math.min(clueCount, 6) do
    local AnswerId = self.CurrentUnlockedAnswers[i]
    local DetectiveAnswerData = DataMgr.DetectiveAnswer[AnswerId]
    local SubmittedAnswerIds = ReasoningUtils:GetQuestionResultAnswers(self.CurerntQuestionId)
    if DetectiveAnswerData and self.ClueWidgets[i] then
      local clueWidget = self.ClueWidgets[i]
      local Content = NewObject(UIUtils.GetCommonItemContentClass())
      Content.AnswerId = AnswerId
      Content.Name = DetectiveAnswerData.Name
      Content.Detail = DetectiveAnswerData.Detail
      Content.Tips = DetectiveAnswerData.Tips
      Content.Icon = LoadObject(DetectiveAnswerData.Icon)
      Content.IsEmpty = false
      Content.CanMultiSelected = false
      Content.IsSingleSelected = false
      Content.IsMultiSelected = false
      Content.Parent = self
      Content.IsSumbit = SubmittedAnswerIds and ReasoningUtils:TableContains(SubmittedAnswerIds, AnswerId)
      clueWidget:InitUIInfo(Content)
      clueWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      if self.TabNewAnswerId == AnswerId then
        self.TabNewAnswerId = nil
        self:AddTimer(0.2, function()
          clueWidget:OnClickButton()
          clueWidget:SetFocus()
        end)
      end
    end
  end
  self.IsClueEmpty = 0 == clueCount
  if clueCount > 0 then
    self.WS_Type:SetActiveWidgetIndex(0)
    self.Btn_Associate:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.WS_Type:SetActiveWidgetIndex(1)
    self.Text_InProgress:SetText(GText("Minigame_Textmap_100309"))
    self.Btn_Associate:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if ReasoningUtils:IsQuestionSolved(self.CurerntQuestionId) then
    self.WS_Btn:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self:PlayAnimation(self.Closure_In)
    AudioManager(self):PlayUISound(self, "event:/ui/common/tuili_success_stamp", nil, nil)
    self.Panel_Solve:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Complete:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_Complete:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Line:SetRenderOpacity(0.6)
    self.Text_Title:SetRenderOpacity(0.6)
    self.Text_Question:SetRenderOpacity(0.6)
    if self.ParentQuestions[self.CurerntQuestionId] then
      self.Text_Complete:SetText(GText("Minigame_Textmap_100334"))
    else
      self.Text_Complete:SetText(GText("Minigame_Textmap_100323"))
    end
  else
    self.WS_Btn:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Panel_Solve:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Text_Complete:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_Complete:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Line:SetRenderOpacity(1.0)
    self.Text_Title:SetRenderOpacity(1.0)
    self.Text_Question:SetRenderOpacity(1.0)
  end
  if self.IsInDialogue then
    self.WS_Btn:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if self.ParentQuestions[self.CurerntQuestionId] then
    self.Text_Question:SetText(GText("Minigame_Textmap_100308"))
    self.Text_Tip:SetText(GText("Minigame_Textmap_100310"))
    self.Hint:SetText(GText("Minigame_Textmap_100325"))
    self.Text_Solve:SetText(GText("Minigame_Textmap_100302"))
  else
    self.Text_Tip:SetText(GText("Minigame_Textmap_100330"))
    self.Hint:SetText(GText("Minigame_Textmap_100334"))
    self.Text_Solve:SetText(GText("Minigame_Textmap_100335"))
  end
end

function M:InitComTab()
  if self.Tab then
    self.Tab:Init({
      TitleName = GText("Minigame_Textmap_100304"),
      DynamicNode = {"Back", "BottomKey"},
      OwnerPanel = self,
      BackCallback = self.OnClickBackButton,
      BottomKeyInfo = {
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Esc",
              ClickCallback = self.Close,
              Owner = self
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "B",
              Owner = self
            }
          },
          Desc = GText("UI_Controller_Close")
        }
      }
    })
  end
end

function M:UpdateComTab(IsMultiChosen)
  if CommonUtils.GetDeviceTypeByPlatformName(self) ~= "PC" then
    return
  end
end

function M:OnClickBackButton()
  if self.CurrentReasoningState == EReasoningState.InferAnswer then
    self:RefreshButtonUI()
    self:ClearClueWidgetsAnimations()
    self:SetClueUIEmpty()
  else
    self:Close()
  end
end

function M:SetClueUIEmpty()
  if self.Book.IsClueUi then
    self.Book:PlayAnimation(self.Book.kong)
  else
    self.Book.IsEmpty = true
  end
end

function M:OnListItemClicked(Content)
  if self.CurrentReasoningState == EReasoningState.SeeAnswerDetail or self.CurrentReasoningState == EReasoningState.CommitAnswer and self.IsCommitAnswerMultiSelect == false then
    if self.CurrentChosenContent and self.CurrentChosenContent.AnswerId ~= Content.AnswerId then
      self.CurrentChosenContent.UI:SetIsSingleSelected(false)
      self.CurrentChosenContent.UI:PlaySelectAnimation()
    end
    self.CurrentChosenContent = Content
  else
    if self.CurrentChosenContent and self.CurrentChosenContent.AnswerId ~= Content.AnswerId then
      self.CurrentChosenContent.UI:SetIsSingleSelected(false)
      self.CurrentChosenContent.UI:PlaySelectAnimation()
    end
    self.CurrentChosenContent = Content
    if Content.IsMultiSelected then
      self.CurrentSelectedAnswers[Content.AnswerId] = Content
    else
      self.CurrentSelectedAnswers[Content.AnswerId] = nil
    end
  end
  self:UpdateComTab(Content.IsMultiSelected)
  self:RefreshButtonState()
end

function M:OnListItemHovered(Content)
  self:UpdateComTab(Content.IsMultiSelected)
end

function M:SetContentSingleSelected(Content, bSelected)
  if not Content then
    return
  end
  Content.IsSingleSelected = bSelected
end

function M:SetContentMultiSelected(Content, IsSelected)
  if not Content then
    return
  end
  local NewIsMultiSelected = false
  if nil == IsSelected then
    NewIsMultiSelected = not Content:IsMultiSelected()
  else
    NewIsMultiSelected = IsSelected
  end
  Content.UI:SetIsMultiSelected(NewIsMultiSelected)
end

function M:UpdateItemInfo(Content)
  self.Book.Content = Content
  self.Book:UpdateItemInfo(Content)
end

function M:CommitAnswer()
  if not self.Avatar then
    return
  end
  self.AutoClose = false
  local Answers = {}
  if self.IsCommitAnswerMultiSelect then
    for Id, _ in pairs(self.CurrentSelectedAnswers) do
      DebugPrint("Reasoning CommitAnswer: ", Id)
      table.insert(Answers, Id)
    end
  else
    table.insert(Answers, self.CurrentChosenContent.AnswerId)
  end
  self.Avatar:DetectiveQuestionCommit(self.CurerntQuestionId, Answers, function(ErrCode, Result)
    if 0 == ErrCode then
      local AssociateWidget = UIManager(self):LoadUINew("DetectiveAssociate", 0, Answers, nil, self.CurerntQuestionId)
      AssociateWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      AssociateWidget:StartPlayInAnimation()
      self.InferOrCommitFailTimes = 0
      self:PlayInferOrCommitFailAnimation()
      self.CurrentChosenContent = nil
      self.CurrentSelectedAnswers = {}
      self:UpdateItemInfo(self.CurrentChosenContent)
      self:SetClueUIEmpty()
      ReasoningUtils:ClearClueReddot(self.CurerntQuestionId)
    else
      local AssociateWidget = UIManager(self):LoadUINew("DetectiveAssociate", 1, Answers)
      AssociateWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      AssociateWidget:StartPlayInAnimation()
      self.InferOrCommitFailTimes = self.InferOrCommitFailTimes + 1
      self:PlayInferOrCommitFailAnimation()
    end
  end)
end

function M:OnDetectiveAniFinish(QuestionId)
  if self.AutoClose then
    self:Close()
    return
  end
  self:RefreshAnswerByQuestionId(QuestionId)
  if self.CurrentSelectQuestionUI then
    self.CurrentSelectQuestionUI.Content.IsSolved = true
    self.CurrentSelectQuestionUI:RefreshReddotAndSolvedUI()
  end
  local AnswerIds = ReasoningUtils:IsQuestionUnlockNewClue(QuestionId)
  if not self.ParentQuestions[QuestionId] and AnswerIds then
    self:AddTimer(0.8, function()
      UIManager(self):ShowUITip("CommonToastMain", GText("Minigame_Textmap_100332"))
      local Avatar = GWorld:GetAvatar()
      for _, AnswerId in pairs(AnswerIds) do
        Avatar:DetectiveQuestionUnlockAnswer(AnswerId)
      end
    end)
  end
  self:ClearClueWidgetsAnimations()
end

function M:OnAssociateAniFinish(AnswerId)
  if self.AutoClose then
    self:Close()
    return
  end
  self:RefreshAnswerByQuestionId(self.CurerntQuestionId)
  for _, clueWidget in ipairs(self.ClueWidgets) do
    if clueWidget and clueWidget.Content and clueWidget.Content.AnswerId == AnswerId then
      clueWidget:PlayAnimation(clueWidget.Refresh)
      AudioManager(self):PlayUISound(self, "event:/ui/common/tuili_clue_new_appear", nil, nil)
    end
  end
end

function M:OnAssociteUIClose()
  if self.IsNeedPlayGuideTextRefresh then
    self:AddTimer(0.1, function()
      self:PlayAnimation(self.Panel_Guide_TextRefresh)
      self.Text_Content:SetText(self.IsNeedPlayGuideText)
      self.IsNeedPlayGuideTextRefresh = false
      AudioManager(self):PlayUISound(self, "event:/ui/common/tuili_jiaojiao_guider_refresh", nil, nil)
    end)
  end
end

function M:InitInferAnswerState()
  self:UpdateComTab()
  self.CurrentSelectedAnswers = {}
  self:InitSeeAnswerDetailState(EReasoningState.InferAnswer)
  self:RefreshButtonState()
  self:UpdateItemInfo(nil)
  self:SetListItemCanMultiSelected(true)
  self:ClearClueWidgetsAnimations()
  self.CurrentChosenContent = nil
  self:SetClueUIEmpty()
end

function M:InferAnswer()
  if not self.Avatar then
    return
  end
  self.AutoClose = false
  local Answers = {}
  for Id, _ in pairs(self.CurrentSelectedAnswers) do
    DebugPrint("Reasoning InferAnswer: ", Id)
    table.insert(Answers, Id)
  end
  self.Avatar:DetectiveQuestionInfer(Answers, function(ErrCode, NewAnswer)
    if 0 == ErrCode and not self.NeededAnswers[NewAnswer] then
      UIManager(self):LoadUINew("DetectiveReasoningAni", Answers, NewAnswer)
      self:AddTimer(1.0, function()
        self.CurrentChosenContent = nil
        self.CurrentSelectedAnswers = {}
        self:RefreshAnswerByQuestionId(self.CurerntQuestionId)
        self:RefreshButtonUI()
        self:SetClueUIEmpty()
        self:ClearClueWidgetsAnimations()
      end)
      self.InferOrCommitFailTimes = 0
      self:PlayInferOrCommitFailAnimation()
    else
      local AssociateWidget = UIManager(self):LoadUINew("DetectiveAssociate", 3, Answers)
      AssociateWidget:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      AssociateWidget:StartPlayInAnimation()
      self.InferOrCommitFailTimes = self.InferOrCommitFailTimes + 1
      self:PlayInferOrCommitFailAnimation()
    end
  end)
end

function M:PlayInferOrCommitFailAnimation()
  local NeededAnswers
  local bInferAnswer = false
  local bCommitAnswer = false
  local bSuccess = 0
  if self.CurrentReasoningState == EReasoningState.InferAnswer then
    NeededAnswers = ReasoningUtils:GetMissingInferAnswers(self.CurerntQuestionId)
    bInferAnswer = true
  elseif self.CurrentReasoningState == EReasoningState.CommitAnswer then
    NeededAnswers = ReasoningUtils:GetCommitAnswers(self.CurerntQuestionId)
    bCommitAnswer = true
  end
  if self.InferOrCommitFailTimes >= self.WarningFailTimes then
    if not NeededAnswers then
      bSuccess = -2
    else
      for _, clueWidget in ipairs(self.ClueWidgets) do
        if clueWidget and clueWidget:IsVisible() and ReasoningUtils:TableContains(NeededAnswers, clueWidget.Content.AnswerId) then
          clueWidget.Arrow:SetVisibility(UE4.ESlateVisibility.Visible)
        end
      end
    end
  elseif 0 == self.InferOrCommitFailTimes then
    bSuccess = 1
    for _, clueWidget in ipairs(self.ClueWidgets) do
      if clueWidget and clueWidget:IsVisible() then
        clueWidget.Arrow:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
    end
  end
  self:SetPanelGuideText(bSuccess, bInferAnswer, bCommitAnswer, false)
end

function M:SetPanelGuideText(bSuccess, bInferAnswer, bCommitAnswer, bChangeImmediate)
  local bIsParentQuestion = self.ParentQuestions[self.CurerntQuestionId]
  local newText = GText("Minigame_Textmap_BaiTips10")
  if -2 == bSuccess then
    newText = GText("Minigame_Textmap_BaiTips09")
  elseif -1 == bSuccess then
    newText = GText("Minigame_Textmap_BaiTips10")
  elseif 0 == bSuccess then
    if self.InferOrCommitFailTimes >= self.WarningFailTimes then
      newText = GText("Minigame_Textmap_BaiTips11")
    elseif bInferAnswer then
      if bIsParentQuestion then
        newText = GText("Minigame_Textmap_BaiTips06")
      else
        newText = GText("Minigame_Textmap_BaiTips02")
      end
    elseif bCommitAnswer then
      if bIsParentQuestion then
        newText = GText("Minigame_Textmap_BaiTips08")
      else
        newText = GText("Minigame_Textmap_BaiTips04")
      end
    end
  elseif 1 == bSuccess then
    if bInferAnswer then
      if bIsParentQuestion then
        newText = GText("Minigame_Textmap_BaiTips05")
      else
        newText = GText("Minigame_Textmap_BaiTips01")
      end
    elseif bCommitAnswer then
      self.Panel_Guide:SetVisibility(UE4.ESlateVisibility.Collapsed)
      if bIsParentQuestion then
        newText = GText("Minigame_Textmap_BaiTips07")
      else
        newText = GText("Minigame_Textmap_BaiTips03")
      end
    end
  end
  local currentText = self.Text_Content:GetText()
  if currentText ~= newText then
    self.IsNeedPlayGuideTextRefresh = true
    self.IsNeedPlayGuideText = newText
  end
  if bChangeImmediate then
    self.Text_Content:SetText(newText)
  end
end

function M:ClearClueWidgetsAnimations()
  for _, clueWidget in ipairs(self.ClueWidgets) do
    if clueWidget and clueWidget:IsVisible() then
      if clueWidget.Content.CanMultiSelected or self.CurrentReasoningState == EReasoningState.CommitAnswer then
        clueWidget:PlayAnimation(clueWidget.Multi_Normal)
      else
        clueWidget:PlayAnimation(clueWidget.Normal)
      end
      clueWidget:SetIsSingleSelected(false)
      clueWidget:SetIsMultiSelected(false)
    end
  end
end

function M:ClearMultiSelect()
  if self.CurrentSelectedAnswers then
    for _, CurrentContent in pairs(self.CurrentSelectedAnswers) do
      self:SetContentMultiSelected(CurrentContent, false)
    end
    self.CurrentSelectedAnswers = {}
  end
end

function M:SetListItemCanMultiSelected(bCanMultiSelected)
  DebugPrint("SetListItemCanMultiSelected", bCanMultiSelected)
  for _, clueWidget in ipairs(self.ClueWidgets) do
    if clueWidget and clueWidget:IsVisible() then
      clueWidget:SetCanMultiSelected(bCanMultiSelected)
      clueWidget.IsCommitAnswer = self.CurrentReasoningState == EReasoningState.CommitAnswer
    end
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    self:OnGamepadKeyDown(InKeyName)
  elseif "Escape" == InKeyName then
    self:OnClickBackButton()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:RefreshAnswerByQuestionId(QuestionId, Index)
  local bClearClueWidgetsAnimations = false
  if QuestionId ~= self.CurerntQuestionId then
    bClearClueWidgetsAnimations = true
    self.CurrentChosenContent = nil
    self.CurrentSelectedAnswers = {}
  end
  self.CurerntQuestionId = QuestionId
  self:InitSortedAnswers()
  self:InitAnswers()
  self.InferOrCommitFailTimes = 0
  self:PlayInferOrCommitFailAnimation()
  self:RefreshButtonUI()
  if bClearClueWidgetsAnimations then
    self:ClearClueWidgetsAnimations()
  end
  self:UpdateItemInfo(self.CurrentChosenContent)
  if Index then
    self.Text_Question:SetText(string.format(GText("Minigame_Textmap_100336"), Const.IndexNum[Index]))
  end
  for _, clueWidget in ipairs(self.ClueWidgets) do
    if clueWidget and clueWidget.Content then
      clueWidget:PlayAnimation(clueWidget.In)
    end
  end
end

function M:SelectFirstClue()
  if not self.IsClueEmpty and not ReasoningUtils:IsMultiEndingQuestion(self.CurerntQuestionId) and self.CurrentChosenContent == nil then
    self.Clue_01:OnClickButton()
  end
end

function M:OnClickButtonAssociate()
  if self.IsInDialogue then
    return
  end
  if self.Btn_Associate.Btn_Click:GetForbidden() then
    if self.IsLackClue then
      UIManager(self):ShowUITip("CommonToastMain", GText("Minigame_Textmap_100339"))
      return
    end
    if self.CurrentReasoningState == EReasoningState.SeeAnswerDetail then
      UIManager(self):ShowUITip("CommonToastMain", GText("Minigame_Textmap_100305"))
    elseif self.CurrentReasoningState == EReasoningState.InferAnswer then
      UIManager(self):ShowUITip("CommonToastMain", GText("Minigame_Textmap_100316"))
    elseif self.CurrentReasoningState == EReasoningState.CommitAnswer then
      UIManager(self):ShowUITip("CommonToastMain", GText("Minigame_Textmap_100316"))
    end
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  self.Book:OnClickClose()
  if self.CurrentReasoningState == EReasoningState.SeeAnswerDetail then
    self:InitInferAnswerState()
  elseif self.CurrentReasoningState == EReasoningState.InferAnswer then
    self:InferAnswer()
  elseif self.CurrentReasoningState == EReasoningState.CommitAnswer then
    self:CommitAnswer()
    self:RefreshButtonUI()
  end
end

function M:OnClickCloseButton()
  self.Book:OnClickClose()
end

function M:RefreshButtonUI()
  self:InitSeeAnswerDetailState()
  self:RefreshButtonState()
end

function M:InitSeeAnswerDetailState(state)
  if nil ~= state then
    self.CurrentReasoningState = state
  elseif ReasoningUtils:IsCanInferAnswer(self.CurerntQuestionId) then
    self.CurrentReasoningState = EReasoningState.SeeAnswerDetail
    self:SetListItemCanMultiSelected(false)
  elseif ReasoningUtils:IsQuestionSolved(self.CurerntQuestionId) then
    self.CurrentReasoningState = EReasoningState.CommitAnswerFinish
    self:SetListItemCanMultiSelected(false)
  else
    self.CurrentReasoningState = EReasoningState.CommitAnswer
    self.IsCommitAnswerMultiSelect = ReasoningUtils:IsMultiSelectCommitQuestion(self.CurerntQuestionId)
    self:SetListItemCanMultiSelected(self.IsCommitAnswerMultiSelect)
  end
end

function M:RefreshButtonState()
  self.Text_Warn:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  local WarnInText
  if self.CurrentReasoningState == EReasoningState.SeeAnswerDetail then
    self.Btn_Associate.Text:SetText(GText("Minigame_Textmap_100313"))
    self:SetTextWarnText(nil)
  elseif self.CurrentReasoningState == EReasoningState.InferAnswer then
    WarnInText = GText("Minigame_Textmap_100314")
    local currentClueCount = CommonUtils.TableLength(self.CurrentSelectedAnswers)
    local totalClueCount = ReasoningUtils:GetMissingInferAnswersNum(self.CurerntQuestionId)
    self.Btn_Associate.Text:SetText(string.format(GText("Minigame_Textmap_100315"), currentClueCount, totalClueCount))
    AudioManager(self):PlayUISound(self, "event:/ui/common/tuili_clue_msg_select", nil, nil)
  elseif self.CurrentReasoningState == EReasoningState.CommitAnswer then
    self.Btn_Associate.Text:SetText(GText("Minigame_Textmap_100320"))
    if self.IsCommitAnswerMultiSelect then
      WarnInText = GText("Minigame_Textmap_100329")
    else
      WarnInText = GText("Minigame_Textmap_100328")
    end
  elseif self.CurrentReasoningState == EReasoningState.CommitAnswerFinish then
    self:SetTextWarnText(nil)
    self.Btn_Associate.Text:SetText(GText("Minigame_Textmap_100325"))
  end
  local isForbidden = true
  local NeededAnswers
  if self.CurrentReasoningState == EReasoningState.InferAnswer or self.CurrentReasoningState == EReasoningState.SeeAnswerDetail then
    NeededAnswers = ReasoningUtils:GetMissingInferAnswers(self.CurerntQuestionId)
  elseif self.CurrentReasoningState == EReasoningState.CommitAnswer then
    NeededAnswers = ReasoningUtils:GetCommitAnswers(self.CurerntQuestionId)
  else
    NeededAnswers = {}
  end
  if not NeededAnswers then
    isForbidden = true
    WarnInText = GText("Minigame_Textmap_100339")
    self.IsLackClue = true
  elseif self.CurrentReasoningState == EReasoningState.SeeAnswerDetail then
    if #self.CurrentUnlockedAnswers > 0 then
      isForbidden = false
    end
  elseif self.CurrentReasoningState == EReasoningState.InferAnswer then
    if CommonUtils.TableLength(self.CurrentSelectedAnswers) > 0 then
      isForbidden = false
    end
  elseif self.CurrentReasoningState == EReasoningState.CommitAnswer then
    if self.IsCommitAnswerMultiSelect then
      if CommonUtils.TableLength(self.CurrentSelectedAnswers) > 0 then
        isForbidden = false
        if ReasoningUtils:IsMultiEndingQuestion(self.CurerntQuestionId) then
          WarnInText = GText("Minigame_Textmap_100333")
        end
      end
    elseif self.CurrentChosenContent then
      isForbidden = false
      if ReasoningUtils:IsMultiEndingQuestion(self.CurerntQuestionId) then
        WarnInText = GText("Minigame_Textmap_100333")
      end
    end
  end
  self.Btn_Associate.Btn_Click:SetForbidden(isForbidden)
  self:SetTextWarnText(WarnInText)
end

function M:SetTextWarnText(Text)
  if self.IsInDialogue then
    self.Text_Warn:SetVisibility(UE4.ESlateVisibility.Collapsed)
    return
  end
  if self.IsClueEmpty then
    self.Text_Warn:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif self.WarnInText ~= Text and nil ~= Text then
    self.Text_Warn:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self:PlayAnimation(self.Text_Warn_In)
    self.WarnInText = Text
    self.Text_Warn:SetText(Text)
  elseif nil == Text then
    self.Text_Warn:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.WarnInText = nil
  end
end

AssembleComponents(M)
return M
