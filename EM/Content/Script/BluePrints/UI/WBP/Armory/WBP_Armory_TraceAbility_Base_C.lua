require("UnLua")
local SkillUtils = require("Utils.SkillUtils")
local UpgradeUtils = require("Utils.UpgradeUtils")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  M.Super.Construct(self)
  self:AddDispatcher(EventID.OnCharGradeLevelUp, self, self.OnCharGradeLevelUp)
  self:AddDispatcher(EventID.OnMenuClose, self, self.OnClickBtnFullClose)
  self.UnLockedText = GText("UI_UNLOCKED")
  self.UnLockText = GText("UI_UNLOCK")
  self.Common_Button_Text_PC:BindEventOnClicked(self, self.OnClickBTN)
  self.Common_Button_Text_PC:SetText(self.UnLockText)
  self.Common_Button_Text_PC:SetIconPanelVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Common_Button_Text_PC:SetReddotVisibility(UE4.ESlateVisibility.Collapsed)
  self.Common_Button_Text_PC:SetDefaultGamePadImg("Y")
  self.Text_UnlockTitle:SetText(GText("UI_ROOT_UNLOCK"))
  self.Text_UnlockDesc:SetText(GText("UI_ROOT_CONDITION"))
  self.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RS"}
    }
  })
  self.bIsFocusable = true
  self:AddInputMethodChangedListen()
  self:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType())
end

function M:Init(Params)
  self.Parent = Params.Parent
  self.Char = Params.Target
  self.Type = Params.Type
  self.Tag = Params.Tag
  self.IsPreviewMode = Params.IsPreviewMode
  self._OnAddedToFocusPath = Params.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Params.OnRemovedFromFocusPath
  self:InitTraceMain()
  self:InitNavigationRules()
end

function M:InitTraceMain()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Char = self.Char
  self.CharId = Char.CharId
  self.CharGradeLevel = Char.GradeLevel
  self.SelectTraceId = -1
  self.MaxGradeLevel = tonumber(DataMgr.GlobalConstant.CharCardLevelMax.ConstantValue)
  for i = 1, self.CharGradeLevel do
    if self["Armory_TraceAbilityItem_" .. i] then
      self["Armory_TraceAbilityItem_" .. i]:Init(self, i, false)
      self["Armory_TraceAbilityItem_" .. i]:SetNormalState()
      self["Armory_TraceAbilityItem_" .. i].Text_TraceAbilityTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
  for j = self.CharGradeLevel + 1, self.MaxGradeLevel do
    if self["Armory_TraceAbilityItem_" .. j] then
      self["Armory_TraceAbilityItem_" .. j]:Init(self, j, true)
      self["Armory_TraceAbilityItem_" .. j]:SetNormalState()
      self["Armory_TraceAbilityItem_" .. j].Text_TraceAbilityTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  end
  if self["Armory_TraceAbilityItem_" .. self.CharGradeLevel + 1] then
    self["Armory_TraceAbilityItem_" .. self.CharGradeLevel + 1]:SetReddotState(self:CheckCharCanUpGradeLevel())
  end
end

function M:OnClickTraceItem(TraceId)
  if self.IsOutAnimPlayed then
    return
  end
  if TraceId <= self.CharGradeLevel + 1 then
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  else
    AudioManager(self):PlayUISound(self, "event:/ui/common/click_select_lock", nil, nil)
  end
  if self.SelectTraceId == TraceId then
    return
  end
  if self["Armory_TraceAbilityItem_" .. self.SelectTraceId] then
    self["Armory_TraceAbilityItem_" .. self.SelectTraceId].IsClick = false
    self["Armory_TraceAbilityItem_" .. self.SelectTraceId]:SetNormalState()
    self:PlayAnimation(self.Expand_Change)
  else
    self:PlayAnimation(self.Expand)
  end
  self.SelectTraceId = TraceId
  self.Text_Title:SetText(GText("UI_ROOT_" .. self.SelectTraceId))
  self:SetTraceDesc()
  self.Common_Button_Text_PC:UnBindEventOnClickedByObj(self)
  self.Group_LockIcon:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Group_LockIcon:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self:InitResourceNeeded()
  self.Group_Currency:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  if self.SelectTraceId <= self.CharGradeLevel then
    self.Group_LockIcon:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Common_Button_Text_PC:ForbidBtn(true)
    self.Common_Button_Text_PC:SetText(self.UnLockedText)
    self.Common_Button_Text_PC:SetIconPanelVisibility(UE4.ESlateVisibility.Collapsed)
    self.Common_Button_Text_PC:SetReddotVisibility(UE4.ESlateVisibility.Collapsed)
    self.Text_UnlockTitle:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Text_UnlockDesc:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Group_Currency:SetVisibility(UE4.ESlateVisibility.Collapsed)
  elseif self.SelectTraceId == self.CharGradeLevel + 1 then
    self.Common_Button_Text_PC:SetIconPanelVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Common_Button_Text_PC:SetText(self.UnLockText)
    self.Common_Button_Text_PC:BindEventOnClicked(self, self.OnClickBTN)
    if self:CheckCharCanUpGradeLevel() then
      self.Common_Button_Text_PC:SetReddotVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Common_Button_Text_PC:ForbidBtn(false)
    else
      self.Common_Button_Text_PC:SetReddotVisibility(UE4.ESlateVisibility.Collapsed)
      self.Common_Button_Text_PC:ForbidBtn(true)
      self.Common_Button_Text_PC:BindForbidStateExecuteEvent(self, self.OnClickBTN)
    end
    self.Text_UnlockTitle:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Text_UnlockDesc:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Common_Button_Text_PC:ForbidBtn(true)
    self.Common_Button_Text_PC:SetIconPanelVisibility(UE4.ESlateVisibility.Collapsed)
    self.Common_Button_Text_PC:SetReddotVisibility(UE4.ESlateVisibility.Collapsed)
    self.Common_Button_Text_PC:SetText(self.UnLockText)
    self.Text_UnlockTitle:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Text_UnlockDesc:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  end
  if self.SelectTraceId ~= self.CharGradeLevel + 1 and self["Armory_TraceAbilityItem_" .. self.CharGradeLevel + 1] then
    self["Armory_TraceAbilityItem_" .. self.CharGradeLevel + 1]:SetReddotState(self:CheckCharCanUpGradeLevel())
  end
  if self.IsPreviewMode then
    self.Group_Btn:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Group_Currency:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_UnlockTitle:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Text_UnlockDesc:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Group_Btn:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:InitResourceNeeded()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Char = self.Char
  local ResourceNeeded = {}
  if DataMgr.CharCardLevelUp[Char.CharId][self.SelectTraceId - 1] then
    local Data = DataMgr.CharCardLevelUp[Char.CharId][self.SelectTraceId - 1]
    ResourceNeeded = Char:CalculateCharGradeLevelUpResources(Data)
  end
  self.HB_Currency:ClearChildren()
  for Key, Value in pairs(ResourceNeeded) do
    local Resource = Avatar.Resources[Key]
    local ResourceConf = DataMgr.Resource[Key]
    local FakeContent = {
      Id = Key,
      Icon = ResourceConf.Icon,
      Count = Resource and Resource.Count or 0,
      ItemType = CommonConst.ItemType.Resource,
      Rarity = ResourceConf.Rarity,
      IsShowDetails = true,
      NeedCount = Value,
      OnAddedToFocusPathEvent = {
        Obj = self,
        Callback = function()
          self.IsResourceFocused = true
          self:UpdateGamepadKeyState()
        end
      },
      OnRemovedFromFocusPathEvent = {
        Obj = self,
        Callback = function()
          self.IsResourceFocused = false
        end
      }
    }
    local Item = self:CreateWidgetNew("ComItemUniversalS")
    self.HB_Currency:AddChild(Item)
    Item:Init(FakeContent)
    self.CurrencyName:SetText(GText(ResourceConf.ResourceName))
  end
  self.CurrencyTitle:SetText(GText("UI_Armory_Trace_Cost"))
end

function M:SetTraceDesc()
  if DataMgr.BattleChar[self.CharId].CharGradeDescription and DataMgr.BattleChar[self.CharId].CharGradeDescription[self.SelectTraceId] then
    local CharGradeDescription = GText(DataMgr.BattleChar[self.CharId].CharGradeDescription[self.SelectTraceId])
    for Index, value in pairs(DataMgr.BattleChar[self.CharId].CharGradeParameter) do
      local CharGradeParameter = value
      local Parameter = SkillUtils.CalcSkillDesc(CharGradeParameter, self.SelectTraceId)
      local SignIndex = string.find(Parameter, "%%", 1)
      if SignIndex then
        Parameter = Parameter .. "%"
      end
      CharGradeDescription = string.gsub(CharGradeDescription, "#" .. Index, Parameter)
    end
    self.Text_Desc:SetText(CharGradeDescription)
  end
end

function M:OnClickBtnFullClose()
  if -1 == self.SelectTraceId then
    return
  else
    if self["Armory_TraceAbilityItem_" .. self.SelectTraceId] then
      self["Armory_TraceAbilityItem_" .. self.SelectTraceId].IsClick = false
      self["Armory_TraceAbilityItem_" .. self.SelectTraceId]:SetNormalState()
    end
    if self["Armory_TraceAbilityItem_" .. self.CharGradeLevel + 1] then
      self["Armory_TraceAbilityItem_" .. self.CharGradeLevel + 1].IsClick = false
      self["Armory_TraceAbilityItem_" .. self.CharGradeLevel + 1]:SetReddotState(self:CheckCharCanUpGradeLevel())
    end
    self:PlayAnimation(self.Fold)
    self.SelectTraceId = -1
  end
end

function M:OnClickBTN()
  if self.CharGradeLevel == self.MaxGradeLevel or self.SelectTraceId ~= self.CharGradeLevel + 1 then
    return
  end
  if not self:CheckCharCanUpGradeLevel() then
    UIManager(self):ShowUITip("CommonToastMain", "UI_FORGING_MATERIAL_NOTENOUGH")
    return
  end
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    self.Parent:BlockAllUIInput(true)
    local Char = self.Char
    local CallServerFunc = Avatar.UpCharGradeLevel
    CallServerFunc(Avatar, Char.Uuid, tonumber(Char.GradeLevel))
  end
end

function M:CheckCharCanUpGradeLevel()
  if self.IsPreviewMode then
    return
  end
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return
  end
  local Char = self.Char
  return UpgradeUtils.CheckCharCanUpgradeCardLevel(Char)
end

function M:OnCharGradeLevelUp(Ret, CharUuid, CurrentGradeLevel)
  self.Parent:BlockAllUIInput(false)
  if ErrorCode:Check(Ret) then
    local Avatar = GWorld:GetAvatar()
    self.Char = Avatar.Chars[self.Char.Uuid]
    self.CharGradeLevel = CurrentGradeLevel + 1
    self.Group_LockIcon:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Group_Currency:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Common_Button_Text_PC:ForbidBtn(true)
    self.Common_Button_Text_PC:SetIconPanelVisibility(UE4.ESlateVisibility.Collapsed)
    self.Common_Button_Text_PC:SetReddotVisibility(UE4.ESlateVisibility.Collapsed)
    self.Common_Button_Text_PC:SetText(self.UnLockedText)
    self.Group_LockIcon:SetVisibility(UE4.ESlateVisibility.Collapsed)
    if self["Armory_TraceAbilityItem_" .. self.SelectTraceId] then
      AudioManager(self):PlayUISound(self, "event:/ui/armory/card_level_unlock", nil, nil)
      self["Armory_TraceAbilityItem_" .. self.SelectTraceId]:PlayUnLockAnim()
    end
  end
end

function M:ClickToNextTraceItem()
  self.Parent:BlockAllUIInput(false)
  if self["Armory_TraceAbilityItem_" .. self.CharGradeLevel + 1] then
    self["Armory_TraceAbilityItem_" .. self.CharGradeLevel + 1]:SetClickState()
    self["Armory_TraceAbilityItem_" .. self.CharGradeLevel + 1]:SetFocus()
  end
end

function M:PlayInAnim()
  self.IsOutAnimPlayed = false
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:StopAllAnimations()
  self:FlushAnimations()
  self:PlayAnimation(self.Auto_In)
end

function M:PlayOutAnim()
  self.IsOutAnimPlayed = true
  self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self:StopAllAnimations()
  self:FlushAnimations()
  self:PlayAnimation(self.Auto_Out)
  return self.Auto_Out:GetEndTime()
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.IsGamepadInput = CurInputDevice == ECommonInputType.Gamepad
  self:UpdateGamepadKeyState()
end

function M:UpdateGamepadKeyState()
  if self.IsGamepadInput then
    if self.IsResourceFocused then
      self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
    else
      self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
  else
    self.Key_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.LastFocusItem then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.LastFocusItem)
  else
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Armory_TraceAbilityItem_1)
  end
end

function M:OnAddedToFocusPath()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Parent)
  end
end

function M:OnRemovedFromFocusPath()
  self:OnClickBtnFullClose()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Parent)
  end
end

function M:OnParentKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.RightThumb and self.Group_Currency:IsVisible() then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.WBP_Com_Item_Universal_S_C_0), true
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    self:OnClickBTN()
    return UIUtils.Handled, true
  end
  return UIUtils.Unhandled
end

function M:InitNavigationRules()
  local i = 1
  while self["Armory_TraceAbilityItem_" .. i] do
    local PreItemWidget = self["Armory_TraceAbilityItem_" .. i - 1]
    local ItemWidget = self["Armory_TraceAbilityItem_" .. i]
    local NextItemWidget = self["Armory_TraceAbilityItem_" .. i + 1]
    ItemWidget:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    if PreItemWidget then
      ItemWidget:SetNavigationRuleExplicit(EUINavigation.Up, PreItemWidget)
    end
    if NextItemWidget then
      ItemWidget:SetNavigationRuleExplicit(EUINavigation.Down, NextItemWidget)
    end
    ItemWidget:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Escape)
    i = i + 1
  end
end

function M:InitKeySetting()
end

return M
