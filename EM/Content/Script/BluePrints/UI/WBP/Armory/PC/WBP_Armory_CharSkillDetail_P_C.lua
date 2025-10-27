require("UnLua")
local M = Class({
  "BluePrints.UI.WBP.Armory.WBP_Armory_CharSkillDetail_Base_C"
})
local FocusStates = {
  CharSkill = 1,
  SkillAttr = 2,
  Resource = 3
}

function M:Construct()
  self:InitKeySetting()
  self.bIsShowNavigateGuide = false
  self.CurInputDeviceType = UIUtils.UtilsGetCurrentInputType()
  self.IsGamepadInput = self.CurInputDeviceType == ECommonInputType.Gamepad
  self.WP_Tip_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Key_Consume:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    }
  })
  self.Keys = {
    self.Key_1,
    self.Key_2,
    self.Key_3
  }
  M.Super.Construct(self)
  self.Panel_LevelUp:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.Panel_LevelUp:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.Panel_LevelUp:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.Panel_LevelUp:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.ScrollBox_Attr:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.ScrollBox_Attr:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.ScrollBox_Attr:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.ScrollBox_Attr:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
end

function M:InitKeySetting()
  self.TableKey = "Tab"
  self.EscapeKey = "Escape"
  self.TrainingClose = "F1"
  self.TabLeftKey = "A"
  self.TabRightKey = "D"
  self.TabLeftGamePadKey = "LeftShoulder"
  self.TabRightGamePadKey = "RightShoulder"
  self.KeyDownEvent = {}
  self.KeyDownEvent[self.TabLeftKey] = self.OnTabLeftKeyDown
  self.KeyDownEvent[self.TabRightKey] = self.OnTabRightKeyDown
  self.KeyDownEvent[UIConst.GamePadKey[self.TabLeftGamePadKey]] = self.OnTabLeftKeyDown
  self.KeyDownEvent[UIConst.GamePadKey[self.TabRightGamePadKey]] = self.OnTabRightKeyDown
  self.KeyDownEvent[self.EscapeKey] = self.OnBackKeyDown
  self.KeyDownEvent[UIConst.GamePadKey.FaceButtonRight] = self.OnBackKeyDown
  self.KeyDownEvent[UIConst.GamePadKey.FaceButtonTop] = self.OnUpgradeKeyDown
  self.KeyDownEvent[UIConst.GamePadKey.FaceButtonLeft] = self.OnFaceButtonLeftKeyDown
  self.KeyDownEvent[UIConst.GamePadKey.LeftThumb] = self.OnLeftThumbKeyDown
  self.KeyDownEvent[UIConst.GamePadKey.RightThumb] = self.OnRightThumbKeyDown
  self.KeyDownEvent[self.TrainingClose] = self.OnTraingCloseKeydown
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurInputDeviceType = CurInputDevice
  self.IsGamepadInput = self.CurInputDeviceType == ECommonInputType.Gamepad
  if self.IsInFocusPath and self.IsGamepadInput or self.IsHyperLinkTipOpened then
    if not self.CurrentFocusState then
      local Widget
      if self.IsNexLevelInfoShowed then
        Widget = self:GetAnyFocusableSkillAttrWidget()
        if not Widget and self.HB_Item:IsVisible() then
          Widget = self
        end
      end
      if not Widget and not self.CurrentFocusState then
        Widget = self.CharSkill
      end
      if Widget then
        Widget:SetFocus()
      else
        self:SetFocus()
      end
    elseif self.CurrentFocusState == FocusStates.SkillAttr and IsValid(self.SkillAttrWidget) then
      self.ScrollBox_Attr:ScrollWidgetIntoView(self.SkillAttrWidget, true)
    end
  end
  self:UpdateGamepadKeyState()
end

function M:UpdateGamepadKeyState()
  if self.IsGamepadInput then
    self.Key_Consume:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Panel_GamePad:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.SizeBox_Check:SetVisibility(UIConst.VisibilityOp.Collapsed)
    local KeyInfoLists = {}
    local bHideBackKeyInfo = false
    if self.CurrentFocusState == FocusStates.Resource then
      self.Key_Consume:SetVisibility(UIConst.VisibilityOp.Collapsed)
      if self.IsItemMenuOpened then
        bHideBackKeyInfo = true
      else
        table.insert(KeyInfoLists, {
          KeyInfoList = {
            {Type = "Img", ImgShortPath = "A"}
          },
          Desc = GText("UI_Controller_Check")
        })
      end
    elseif self.CurrentFocusState == FocusStates.SkillAttr then
      table.insert(KeyInfoLists, {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "A"}
        },
        Desc = GText("UI_CTL_Squad_Expand")
      })
    end
    if 0 == self.WidgetSwitcher_Page:GetActiveWidgetIndex() then
      if self.CurrentNodeInfo.Skill and not self.IsGamepadTermTipShowed and self.DisplayedHyperLinkTers and #self.DisplayedHyperLinkTers > 0 then
        table.insert(KeyInfoLists, {
          KeyInfoList = {
            {Type = "Img", ImgShortPath = "X"}
          },
          Desc = GText("UI_CTL_Explain")
        })
      end
    else
      if self.ShouldShowBtnCheck and 1 == self.CurrentNodeInfo.NodeIdx then
        table.insert(KeyInfoLists, {
          KeyInfoList = {
            {Type = "Img", ImgShortPath = "X"}
          },
          Desc = GText("UI_CTL_NextLevel")
        })
      end
      if self:GetAnyFocusableSkillAttrWidget() and self.CurrentFocusState ~= FocusStates.SkillAttr then
        table.insert(KeyInfoLists, {
          KeyInfoList = {
            {Type = "Img", ImgShortPath = "RS"}
          },
          Desc = GText("UI_CTL_CheckProperty")
        })
      end
    end
    if bHideBackKeyInfo then
      self.Tab_SkillDetail.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Tab_SkillDetail.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      table.insert(KeyInfoLists, {
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "B"}
        },
        Desc = GText("UI_BACK")
      })
      self.Tab_SkillDetail.Key_Left:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      self.Tab_SkillDetail.Key_Right:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
    for i = 1, #self.Keys do
      if KeyInfoLists[i] then
        self.Keys[i]:CreateCommonKey(KeyInfoLists[i])
        self.Keys[i]:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      elseif #KeyInfoLists > 0 then
        self.Keys[i]:SetVisibility(UIConst.VisibilityOp.Collapsed)
      else
        self.Keys[i]:SetVisibility(UIConst.VisibilityOp.Hidden)
      end
    end
  else
    self.Key_Consume:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Panel_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self:UpdateBtnCheckVisibility()
  end
  local CharSkill = self.CurrentNodeInfo.Skill or {}
  local Data = DataMgr.Skill[CharSkill.SkillId]
  local SkillData = Data and Data[1] and Data[1][0]
  if SkillData then
    self:InitSkillKeyInfo(SkillData)
  end
end

function M:OnTreeNodeClicked(BranchInfo, NodeInfo)
  M.Super.OnTreeNodeClicked(self, BranchInfo, NodeInfo)
  self:UpdateGamepadKeyState()
end

function M:InitUIInfo(Name, IsInUIMode, EventList, Params)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, Params)
end

function M:ModifyCharSkillInitParams(Params)
  function Params.OnAddedToFocusPath()
    self.CurrentFocusState = FocusStates.CharSkill
    
    self:OnFocusChanged()
  end
  
  function Params.OnRemovedFromFocusPath()
    self.CurrentFocusState = nil
  end
  
  function Params:OnTreeNodeWidgetAddedToFocusPath(NodeInfo)
    if self.IsGamepadInput and NodeInfo and NodeInfo.UI then
      NodeInfo.UI:OnBtnClicked()
    end
  end
  
  function Params:OnTreeNodeWidgetRemovedFromFocusPath(NodeInfo)
  end
end

function M:OnAddedToFocusPath()
  self.IsInFocusPath = true
end

function M:OnRemovedFromFocusPath()
  self.IsInFocusPath = false
end

function M:OnFocusChanged()
  self:UpdateGamepadKeyState()
end

function M:ShowNextLevelInfo(bShow)
  M.Super.ShowNextLevelInfo(self, bShow)
  if bShow then
    self.KeyDownEvent[self.TabLeftKey] = nil
    self.KeyDownEvent[self.TabRightKey] = nil
  else
    self.KeyDownEvent[self.TabLeftKey] = self.OnTabLeftKeyDown
    self.KeyDownEvent[self.TabRightKey] = self.OnTabRightKeyDown
  end
end

function M:OnLeftThumbKeyDown()
  if self.HB_Item:IsVisible() then
    local Widget = self.HB_Item:GetChildAt(0)
    if Widget then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), Widget), true
    end
  end
end

function M:OnResourceContentCreated(Content)
  if Content then
    Content.OnAddedToFocusPathEvent = {
      Obj = self,
      Callback = function()
        self.CurrentFocusState = FocusStates.Resource
        self:OnFocusChanged()
      end
    }
    Content.OnRemovedFromFocusPathEvent = {
      Obj = self,
      Callback = function()
        self.CurrentFocusState = nil
      end
    }
    Content.OnMenuOpenChangedEvents = {
      Obj = self,
      Callback = function(_self, IsOpen)
        self.IsItemMenuOpened = IsOpen
        self:OnFocusChanged()
      end
    }
  end
end

function M:UpdateResourceList(ResourcesUse)
  M.Super.UpdateResourceList(self, ResourcesUse)
  local AllChildren = self.HB_Item:GetAllChildren():ToTable()
  for index, Widget in ipairs(AllChildren) do
    Widget.bIsFocusable = true
    Widget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    Widget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    local PreWidgt = AllChildren[index - 1]
    if PreWidgt then
      Widget:SetNavigationRuleExplicit(EUINavigation.Left, PreWidgt)
    else
      Widget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    end
    local NextWidget = AllChildren[index + 1]
    if NextWidget then
      Widget:SetNavigationRuleExplicit(EUINavigation.Right, NextWidget)
    else
      Widget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    end
  end
end

function M:UpdateAttrList(...)
  M.Super.UpdateAttrList(self, ...)
  local AllChildren = self.ScrollBox_Attr:GetAllChildren():ToTable()
  local Prewidget
  for _, Widget in ipairs(AllChildren) do
    if Widget.Content then
      Widget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
      Widget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
      local Content = Widget.Content
      if Content.Desc and Content.Desc ~= "" then
        Widget.bIsFocusable = true
        if Prewidget then
          Widget:SetNavigationRuleExplicit(EUINavigation.Up, Prewidget)
          Prewidget:SetNavigationRuleExplicit(EUINavigation.Down, Widget)
        else
          Widget:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
        end
        Prewidget = Widget
      else
        Widget.bIsFocusable = false
      end
      Widget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    end
  end
end

function M:OnRightThumbKeyDown()
  local Widget = self:GetAnyFocusableSkillAttrWidget()
  if Widget then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), Widget), true
  elseif self.IsNexLevelInfoShowed and self.CurrentFocusState ~= FocusStates.Resource then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self), true
  end
end

function M:GetAnyFocusableSkillAttrWidget()
  local AllChildren = self.ScrollBox_Attr:GetAllChildren():ToTable()
  for _, Widget in ipairs(AllChildren) do
    if Widget.bIsFocusable then
      return Widget
    end
  end
end

function M:OnSkillAttrContentCreated(Content)
  Content.Owner = self
  
  function Content.OnAddedToFocusPath(_self, _Content)
    self.CurrentFocusState = FocusStates.SkillAttr
    self.SkillAttrWidget = _Content.Widget
    self.ScrollBox_Attr:ScrollWidgetIntoView(_Content.Widget, true)
    self:UpdateGamepadKeyState()
  end
  
  function Content.OnRemovedFromFocusPath()
    self.CurrentFocusState = nil
    self.SkillAttrWidget = nil
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InputEvent = UWidgetBlueprintLibrary.GetInputEventFromKeyEvent(InKeyEvent)
  local IsRepeat = UKismetInputLibrary.InputEvent_IsRepeat(InputEvent)
  if IsRepeat or self:IsAnimationPlaying(self.Out) or self:IsAnimationPlaying(self.Detail_Out) then
    return UIUtils.Handled
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.KeyDownEvent[InKeyName] then
    local Reply, IsHandled = self.KeyDownEvent[InKeyName](self)
    if IsHandled then
      return Reply
    end
  end
  return UIUtils.Handled
end

function M:OnFaceButtonLeftKeyDown()
  if 0 == self.WidgetSwitcher_Page:GetActiveWidgetIndex() then
    local WidgetToFocus = self:ShowGamepadTermTip(not self.IsGamepadTermTipShowed)
    if WidgetToFocus then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.CurrentNodeInfo.UI), true
    end
  elseif self.ShouldShowBtnCheck and 1 == self.WidgetSwitcher_Page:GetActiveWidgetIndex() then
    self:ShowNextLevelInfo(not self.IsNexLevelInfoShowed)
    if self.CurrentFocusState ~= FocusStates.Resource and self.CurrentFocusState ~= FocusStates.SkillAttr then
      return self:OnRightThumbKeyDown()
    end
  end
end

function M:ShowGamepadTermTip(IsShow)
  local Widget
  if IsShow then
    for Index, Term in ipairs(self.DisplayedHyperLinkTers) do
      local Widget = self.WP_Tip_GamePad:GetChildAt(Index - 1)
      if not Widget then
        Widget = UIManager(self):CreateWidget(self.CharSkillTipPath, false)
        self.WP_Tip_GamePad:AddChild(Widget)
      end
      local TermData = DataMgr.CombatProperTerm[Term] or {}
      Widget:Init({
        Owner = self,
        bNoCloseAnim = true,
        OnClosed = function()
          self:ShowGamepadTermTip(false)
        end,
        Title = GText(Term),
        Desc = GText(TermData.CombatProperTermExplaination)
      })
    end
    local ChildrenCount = self.WP_Tip_GamePad:GetChildrenCount()
    for i = ChildrenCount - 1, #self.DisplayedHyperLinkTers, -1 do
      self.WP_Tip_GamePad:RemoveChildAt(i)
    end
    Widget = self.WP_Tip_GamePad:GetChildAt(0)
    if Widget then
      Widget.bIsFocusable = true
      self.WP_Tip_GamePad:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      self.IsGamepadTermTipShowed = true
    end
  else
    self.IsGamepadTermTipShowed = false
    self.WP_Tip_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:UpdateGamepadKeyState()
  return Widget
end

function M:OnUpgradeKeyDown()
  self:OnLevelUpBtnClicked()
end

function M:OnBackKeyDown()
  if self.IsGamepadInput then
    if self.IsNexLevelInfoShowed then
      self:ShowNextLevelInfo(not self.IsNexLevelInfoShowed)
      if self.CurrentFocusState == FocusStates.SkillAttr then
        return self:OnRightThumbKeyDown()
      end
      return
    elseif self.CurrentFocusState == FocusStates.Resource or self.CurrentFocusState == FocusStates.SkillAttr or self.IsGamepadTermTipShowed then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.CurrentNodeInfo.UI), true
    end
  end
  self:OnCloseBtnClicked()
end

function M:OnTraingCloseKeydown()
  local GameMode = UE4.UGameplayStatics.GetGameMode(self)
  local GameState = UE4.UGameplayStatics.GetGameState(self)
  if nil ~= GameMode and nil ~= GameState and (GameState.GameModeType == "Training" or GameState.GameModeType == "Trial") then
    self:OnCloseBtnClicked()
  end
end

function M:OnTabLeftKeyDown()
  if not (not self.IsNexLevelInfoShowed and self.CurrentNodeInfo) or not self.ScrollBox_Attr:HasAnyChildren() then
    return
  end
  local IsSkillAttrFocused = self.CurrentFocusState == FocusStates.SkillAttr
  self.Tab_SkillDetail:TabToLeft()
  if self.IsGamepadInput and IsSkillAttrFocused then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.CurrentNodeInfo.UI), true
  end
end

function M:OnTabRightKeyDown()
  if not (not self.IsNexLevelInfoShowed and self.CurrentNodeInfo) or not self.ScrollBox_Attr:HasAnyChildren() then
    return
  end
  self.Tab_SkillDetail:TabToRight()
end

function M:OnTabSelected(Tab)
  M.Super.OnTabSelected(self, Tab)
  self:UpdateGamepadKeyState()
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_RightY" == InKeyName then
    local DeltaY = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent) * 10
    if 0 == self.WidgetSwitcher_Page:GetActiveWidgetIndex() then
      local ScrollOffset = math.clamp(self.ScrollBox_Detail:GetScrollOffset() - DeltaY, 0, self.ScrollBox_Detail:GetScrollOffsetOfEnd())
      self.ScrollBox_Detail:SetScrollOffset(ScrollOffset)
    end
    return UIUtils.Handled
  end
  return UIUtils.Unhandled
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.IsNexLevelInfoShowed then
    local Widget = self:GetAnyFocusableSkillAttrWidget()
    if Widget ~= self then
      return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), Widget)
    end
    return UIUtils.Handled
  else
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.CurrentNodeInfo.UI)
  end
end

return M
