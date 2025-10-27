require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self.ReddotName = "DetectiveAnswer"
  self:BindEvents()
  self.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:BindEvents()
  self.Btn_Click.OnClicked:Add(self, self.OnClickButton)
  self.Btn_Click.OnPressed:Add(self, self.OnPressButton)
  self.Btn_Click.OnHovered:Add(self, self.OnHoverButton)
  self.Btn_Click.OnUnhovered:Add(self, self.OnUnhoverButton)
end

function M:Destruct()
  self:UnbindEvents()
end

function M:UnbindEvents()
  self.Btn_Click.OnClicked:Remove(self, self.OnClickButton)
  self.Btn_Click.OnPressed:Remove(self, self.OnPressButton)
  self.Btn_Click.OnHovered:Remove(self, self.OnHoverButton)
  self.Btn_Click.OnUnhovered:Remove(self, self.OnUnhoverButton)
end

function M:InitUIInfo(Content)
  self.Content = Content
  self.Content.UI = self
  if Content.IsEmpty then
    self:InitEmptyObject(Content)
    return
  end
  self.Text_Clue:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Icon_Clue:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Text_Clue:SetText(GText(Content.Name))
  self.Icon_Clue:SetBrushResourceObject(Content.Icon)
  self:UpdateReddotDetail(Content.AnswerId)
  self:SetIsSingleSelected(Content.IsSingleSelected)
  self:SetIsMultiSelected(Content.IsMultiSelected)
  self:SetCanMultiSelected(Content.CanMultiSelected)
  self.Text_Submit:SetText(GText("Minigame_Textmap_100324"))
  if Content.IsSumbit then
    self.Panel_Submit:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  else
    self.Panel_Submit:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.UI = nil
  end
end

function M:OnClickButton()
  self:SelectSelf()
  self.Content.Parent:UpdateItemInfo(self.Content)
  if self.Content.Parent.Book:GetIsClueUi() then
    self.Content.Parent.Book:PlayAnimation(self.Content.Parent.Book.xiang)
  else
    self.Content.Parent.Book:SwitchToClueUi(true)
  end
end

function M:SelectSelf()
  if not self.Content or self.Content.IsEmpty then
    return
  end
  if not self.ForbidDecrease then
    self:DecreaseReddotDetail()
  end
  self.ForbidDecrease = false
  self:SetIsSingleSelected(true)
  if self.Content.CanMultiSelected then
    self:SetIsMultiSelected(not self.Content.IsMultiSelected)
  end
  self:PlaySelectAnimation()
  self.Content.Parent:OnListItemClicked(self.Content)
end

function M:OnPressButton()
  if not self.Content or self.Content.IsEmpty then
    return
  end
  if self.Content.IsSingleSelected then
    return
  end
  self:PlayAnimation(self.Press)
end

function M:OnHoverButton()
  if not self.Content or self.Content.IsEmpty then
    return
  end
  local Parent = self.Content.Parent
  Parent:OnListItemHovered(self.Content)
  if self.Content.IsSingleSelected then
    return
  end
  self:PlayAnimation(self.Hover)
  if Parent.CurInputDeviceType == ECommonInputType.Gamepad then
    if 1 == Parent.CurrentReasoningState or 4 == Parent.CurrentReasoningState then
      self:OnClickButton()
    end
    if 2 == Parent.CurrentReasoningState and Parent.CurrentChosenContent and not Parent.IsCommitAnswerMultiSelect then
      self:OnClickButton()
    end
  end
end

function M:OnUnhoverButton()
  if not self.Content or self.Content.IsEmpty then
    return
  end
  if self.Content.IsSingleSelected then
    return
  end
  self:PlayAnimation(self.UnHover)
end

function M:SetIsSingleSelected(bIsSingleSelected)
  DebugPrint("Reasoning SetIsSingleSelected: ", self.Content.AnswerId, bIsSingleSelected)
  self.Content.IsSingleSelected = bIsSingleSelected
end

function M:SetIsMultiSelected(bIsMultiSelected)
  DebugPrint("Reasoning SetIsMultiSelected: ", self.Content.AnswerId, bIsMultiSelected)
  if not self.Content then
    return
  end
  self.Content.IsMultiSelected = bIsMultiSelected
end

function M:PlaySelectAnimation()
  if not self.Content.CanMultiSelected then
    if self.IsCommitAnswer then
      if self.Content.IsSingleSelected then
        if self:IsAnimationPlaying(self.Multi_Normal) then
          self:StopAnimation(self.Multi_Normal)
        end
        self:PlayAnimation(self.Multi_Select_Click)
        AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
      else
        if self:IsAnimationPlaying(self.Multi_Select_Click) then
          self:StopAnimation(self.Multi_Select_Click)
        end
        self:PlayAnimation(self.Multi_Normal)
      end
    elseif self.Content.IsSingleSelected then
      self:PlayAnimation(self.Click)
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_large", nil, nil)
    else
      self:PlayAnimation(self.Normal)
    end
  elseif self.Content.IsSingleSelected then
    if self.Content.IsMultiSelected then
      self:PlayAnimation(self.Multi_Select_Click)
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_checkbox_check", nil, nil)
    else
      self:PlayAnimation(self.Multi_JustClick)
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_checkbox_uncheck", nil, nil)
    end
  elseif self.Content.IsMultiSelected then
    if self:IsAnimationPlaying(self.Multi_Select_Click) then
      self:StopAnimation(self.Multi_Select_Click)
    end
    self:PlayAnimation(self.Multi_JustSelected)
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_checkbox_check", nil, nil)
  else
    self:PlayAnimation(self.Multi_Normal)
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_checkbox_uncheck", nil, nil)
  end
end

function M:SetCanMultiSelected(bCanMultiSelected)
  if not self.Content then
    return
  end
  self.Content.CanMultiSelected = bCanMultiSelected
end

function M:UpdateReddotDetail(AnswerId)
  local CacheKey = AnswerId
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.ReddotName)
  if CacheDetail then
    if nil == CacheDetail[CacheKey] then
      CacheDetail[CacheKey] = true
      ReddotManager.IncreaseLeafNodeCount(self.ReddotName)
      self.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    elseif CacheDetail[CacheKey] then
      self.New:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    else
      self.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
end

function M:DecreaseReddotDetail()
  local AnswerId = self.Content.AnswerId
  local CacheKey = AnswerId
  local CacheDetail = ReddotManager.GetLeafNodeCacheDetail(self.ReddotName)
  if CacheDetail and CacheDetail[CacheKey] then
    CacheDetail[CacheKey] = false
    ReddotManager.DecreaseLeafNodeCount(self.ReddotName)
    self.New:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function M:IsEmpty()
  return self.Content.IsEmpty
end

function M:Reset()
  self.Text_Clue:SetText("")
  self:SetVisibility(UE4.ESlateVisibility.Collapsed)
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if "Gamepad_FaceButton_Bottom" == InKeyName then
    self:OnClickButton()
    IsHandled = true
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

return M
