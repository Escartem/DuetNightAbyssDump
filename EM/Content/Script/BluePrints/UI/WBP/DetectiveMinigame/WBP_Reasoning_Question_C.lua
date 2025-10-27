require("UnLua")
local ReasoningUtils = require("BluePrints.UI.WBP.DetectiveMinigame.ReasoningUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:OnListItemObjectSet(Content)
  self.Content = Content
  self.Content.UI = self
  self.List_SubTask:ClearListItems()
  for index, Question in ipairs(Content.ChildrenQuestions) do
    local SubContent = NewObject(UIUtils.GetCommonItemContentClass())
    SubContent.Question = Question
    SubContent.ParentUI = Content.ParentUI
    SubContent.Index = index
    SubContent.IsSolved = ReasoningUtils:IsQuestionSolved(Question)
    self.List_SubTask:AddItem(SubContent)
  end
  self:InitUIInfo()
  ReddotManager.AddListener("DetectiveAnswer", self, self.RefreshReddotAndSolvedUI, nil, true)
  self:SetNavigationRule()
  self.IsMainQuestion = true
  if 0 == Content.Index then
    self:OnClickButton()
    self:SetFocus()
    self.BG:OnCellClicked()
  end
end

function M:InitUIInfo()
  local DetectiveQuestionData = DataMgr.DetectiveQuestion[self.Content.ParentQuestion]
  self.Text_Question:SetText(GText(DetectiveQuestionData.Tips))
  if DetectiveQuestionData.QuestName then
    self.Text_Task:SetText(GText(DetectiveQuestionData.QuestName))
    self.Icon_Task:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_Task:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Icon_Task:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Text_Task:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:RefreshReddotAndSolvedUI()
  self.Text_Clue:SetText(GText("Minigame_Textmap_100303"))
end

function M:Construct()
  self.BG.Button_Area.OnClicked:Add(self, self.OnClickButton)
  self.BG.Button_Area.OnHovered:Add(self, self.OnHoverButton)
end

function M:OnHoverButton()
  if self.Content.ParentUI.CurInputDeviceType == ECommonInputType.Gamepad then
    self:OnClickButton()
    self.BG:SelectCell()
  end
end

function M:Destruct()
  ReddotManager.RemoveListener("DetectiveAnswer", self)
end

function M:OnClickButton()
  if self.Content.ParentUI.CurerntQuestionId == self.Content.ParentQuestion then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_02", nil, nil)
  self.Content.ParentUI:RefreshAnswerByQuestionId(self.Content.ParentQuestion)
  self.Content.ParentUI:SetPanelGuideText(-1, false, false)
  local CurrentSelectQuestionUI = self.Content.ParentUI.CurrentSelectQuestionUI
  if CurrentSelectQuestionUI and CurrentSelectQuestionUI ~= self then
    CurrentSelectQuestionUI.BG:OnCellUnSelect()
    CurrentSelectQuestionUI:StopAllAnimations()
    CurrentSelectQuestionUI.IsSelect = false
    if CurrentSelectQuestionUI.Content.IsSolved and CurrentSelectQuestionUI.IsMainQuestion ~= true then
      CurrentSelectQuestionUI:PlayAnimation(CurrentSelectQuestionUI.Text_Forbidden)
    else
      CurrentSelectQuestionUI:PlayAnimation(CurrentSelectQuestionUI.Text_Normal)
    end
  end
  self.Content.ParentUI.CurrentSelectQuestionUI = self
  local CacheKey = self.Content.ParentQuestion
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("DetectiveQuestion")
  if CacheDetail and CacheDetail[CacheKey] then
    CacheDetail[CacheKey] = false
    ReddotManager.DecreaseLeafNodeCount("DetectiveQuestion")
  end
  self:RefreshReddotAndSolvedUI()
  self:StopAllAnimations()
  self:PlayAnimation(self.Text_Select)
  self.IsSelect = true
end

function M:RefreshReddotAndSolvedUI()
  if self.Content.IsSolved then
    self:StopAllAnimations()
    if self.IsSelect == false and 0 ~= self.Content.Index then
      self:PlayAnimation(self.Text_Normal)
    end
    self.Panel_Finish:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_Clue:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Panel_Finish:SetVisibility(UE4.ESlateVisibility.Collapsed)
    local CacheKey = self.Content.ParentQuestion
    if not ReddotManager.GetTreeNode("DetectiveQuestion") then
      ReddotManager.AddNode("DetectiveQuestion")
    end
    local CacheDetail = ReddotManager.GetLeafNodeCacheDetail("DetectiveQuestion")
    if CacheDetail then
      self.Panel_Clue:SetVisibility(UE4.ESlateVisibility.Collapsed)
      if nil == CacheDetail[CacheKey] then
        CacheDetail[CacheKey] = true
        ReddotManager.IncreaseLeafNodeCount("DetectiveQuestion")
        self.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      elseif CacheDetail[CacheKey] then
        self.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      else
        self.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
        if ReasoningUtils:IsQuestionHasNewClue(self.Content.ParentQuestion) then
          self.Panel_Clue:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
        end
      end
    end
  end
end

function M:SetNavigationRule()
  if 0 ~= self.List_SubTask:GetNumItems() then
    self.BG:SetNavigationRuleExplicit(EUINavigation.Down, self.List_SubTask)
  end
  self.List_SubTask:SetNavigationRuleExplicit(EUINavigation.Up, self.BG)
end

return M
