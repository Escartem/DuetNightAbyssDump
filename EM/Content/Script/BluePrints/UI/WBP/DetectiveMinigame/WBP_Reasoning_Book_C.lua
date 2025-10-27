require("UnLua")
local ReasoningUtils = require("BluePrints.UI.WBP.DetectiveMinigame.ReasoningUtils")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  self.Btn_QaBook.Btn_Click.OnClicked:Add(self, self.OnClickButton)
  self.Btn_Close.Btn_Close.OnClicked:Add(self, self.OnClickClose)
  self.IsClueUi = false
  self:BindToAnimationFinished(self.kong_lie, {
    self,
    self.OnToLieFinished
  })
  self:BindToAnimationFinished(self.xiang_lie, {
    self,
    self.OnToLieFinished
  })
  self:BindToAnimationFinished(self.lie_kong, {
    self,
    self.OnToKongFinished
  })
  self:BindToAnimationFinished(self.lie_xiang, {
    self,
    self.OnToXiangFinished
  })
  self:BindToAnimationFinished(self.xiang, {
    self,
    self.OnXiangFinished
  })
  self:BindToAnimationFinished(self.kong, {
    self,
    self.OnKongFinished
  })
  ReddotManager.AddListener("DetectiveQuestion", self, self.RefreshReddotAndSolvedUI)
  ReddotManager.AddListener("DetectiveAnswer", self, self.RefreshReddotAndSolvedUI)
  self.Btn_QaBook.Text_Clue:SetText(GText("Minigame_Textmap_100303"))
  self:RefreshReddotAndSolvedUI()
end

function M:Destruct()
  ReddotManager.RemoveListener("DetectiveQuestion", self)
  ReddotManager.RemoveListener("DetectiveAnswer", self)
end

function M:RefreshReddotAndSolvedUI()
  local questionId
  if self.ParentUI then
    questionId = self.ParentUI.CurerntQuestionId
  end
  local HasNewQuestionOrClue = ReasoningUtils:IsHasNewQuestionOrClue(questionId)
  self.Btn_QaBook.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Btn_QaBook.Panel_Clue:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if 1 == HasNewQuestionOrClue then
    self.Btn_QaBook.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  elseif 2 == HasNewQuestionOrClue then
    self.Btn_QaBook.Panel_Clue:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
end

function M:OnToLieFinished()
  self.List_Question:SetFocus()
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  self:PlayAnimation(self.lie)
end

function M:OnToKongFinished()
  self:PlayAnimation(self.kong)
end

function M:OnToXiangFinished()
  self:PlayAnimation(self.xiang)
end

function M:OnKongFinished()
  self.IsEmpty = true
end

function M:OnXiangFinished()
  self.IsEmpty = false
end

function M:OnClickButton()
  self:SwitchToClueUi(false)
end

function M:OnClickClose()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  self:SwitchToClueUi(true)
end

function M:SwitchToClueUi(bVisible)
  if self.IsClueUi == bVisible then
    return
  end
  self.ParentUI:SelectFirstClue()
  self:RefreshReddotAndSolvedUI()
  if bVisible then
    AudioManager(self):PlayUISound(self, "event:/ui/common/tuili_clue_list_to_detail", nil, nil)
    if self.IsEmpty then
      self:PlayAnimation(self.lie_kong)
    else
      self:PlayAnimation(self.lie_xiang)
    end
    if 4 == self.ParentUI.CurrentReasoningState or self.ParentUI.IsClueEmpty then
      self.ParentUI.Panel_Guide:SetVisibility(UE4.ESlateVisibility.Collapsed)
    else
      self.ParentUI.Panel_Guide:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
    self.ParentUI:PlayAnimation(self.ParentUI.Guide_In)
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/tuili_clue_detail_to_list", nil, nil)
    if self.IsEmpty then
      self:PlayAnimation(self.kong_lie)
    else
      self:PlayAnimation(self.xiang_lie)
      EventManager:FireEvent(EventID.OnDetectiveRefreshProgress, self)
    end
    self.ParentUI:PlayAnimation(self.ParentUI.Guide_Out)
  end
  self.IsClueUi = bVisible
end

function M:GetIsClueUi()
  return self.IsClueUi
end

function M:InitUIInfo(ParentQuestions, ParentUI, NewAnswerId, NewQuestionId)
  self:PlayAnimation(self.lie)
  self.ParentQuestions = ParentQuestions
  self.ParentUI = ParentUI
  self.List_Question:ClearListItems()
  local index = 0
  for _, Question in pairs(self.ParentQuestions) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.ParentQuestion = Question.id
    Content.ChildrenQuestions = Question.children
    Content.ParentUI = ParentUI
    Content.IsSolved = ReasoningUtils:IsQuestionSolved(Question.id)
    Content.Index = index
    self.List_Question:AddItem(Content)
    index = index + 1
  end
  self:AddTimer(0.2, function()
    if nil ~= NewAnswerId then
      local answerData = DataMgr.DetectiveAnswer[NewAnswerId]
      self:SelectQuestionByQuestionId(answerData.QuestionID)
      self:PlayAnimation(self.lie_xiang)
      self.IsClueUi = true
      self.ParentUI.Panel_Guide:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.ParentUI:PlayAnimation(self.ParentUI.Guide_In)
    elseif nil ~= NewQuestionId then
      self:SelectQuestionByQuestionId(NewQuestionId)
    end
  end)
  self.Btn_QaBook.Text_Name:SetText(GText("Minigame_Textmap_100306"))
  self.Text_Title:SetText(GText("Minigame_Textmap_100307"))
end

function M:SelectQuestionByQuestionId(QuestionId)
  for i = 0, self.List_Question:GetNumItems() - 1 do
    local Item = self.List_Question:GetItemAt(i)
    if Item and Item.UI and Item.ParentQuestion == QuestionId then
      Item.UI:OnClickButton()
      Item.UI:SetFocus()
      Item.UI.BG:OnCellClicked()
      self.List_Question:SetSelectedIndex(i)
      return
    end
    if Item and Item.UI and Item.UI.List_SubTask then
      for j = 0, Item.UI.List_SubTask:GetNumItems() - 1 do
        local SubItem = Item.UI.List_SubTask:GetItemAt(j)
        if SubItem and SubItem.UI and SubItem.Question == QuestionId then
          SubItem.UI:OnClickButton()
          SubItem.UI.BG:OnCellClicked()
          SubItem.UI:SetFocus()
          self.List_Question:SetSelectedIndex(i)
          return
        end
      end
    end
  end
end

function M:UpdateItemInfo(Content)
  if Content and not Content.IsEmpty then
    self.Icon_Clue:SetBrushResourceObject(Content.Icon)
    self.Text_Name:SetText(GText(Content.Name))
    self.Text_Desc:SetText(GText(Content.Detail))
    self.IsEmpty = false
    local questionId = ReasoningUtils:IsClueFromResult(Content.AnswerId)
    if questionId then
      local DetectiveQuestionData = DataMgr.DetectiveQuestion[questionId]
      if DetectiveQuestionData then
        local Tips = DetectiveQuestionData.Tips
        self.Text_Gain:SetText(string.format(GText("Minigame_Textmap_100331"), GText(Tips)))
        self.Text_Gain:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      end
    else
      self.Text_Gain:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  else
    self.IsEmpty = true
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if "Gamepad_FaceButton_Bottom" == InKeyName then
    if not self:GetIsClueUi() then
      self:OnClickClose()
      self.ParentUI:SetDefaultFocus()
      self.ParentUI.Btn_Associate.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Visible)
    end
    IsHandled = true
  end
  self:AddTimer(0.1, function()
    self.ParentUI:RefreshTabGamepadIcon()
  end)
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

return M
