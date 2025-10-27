require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
M._components = {
  "BluePrints.UI.WBP.Play.Widget.Task.NewPlayer.NewPlayerTaskView"
}

function M:Initialize(Initializer)
  M.Super.Initialize(self)
  self.NodeName = "StarterQuest"
  self.CurPhaseId = nil
  self.PlayerPhaseId = nil
  self.IsCurrentPhaseRedPoint = nil
  self.AllQuestServerData = {}
  self.AllQuestConfigData = {}
end

function M:Destruct()
  self.List_Task.OnCreateEmptyContent:Unbind()
  ReddotManager.RemoveListener(self.NodeName, self)
  self.Super.Destruct(self)
end

function M:InitContent(Parent)
  self.InitKey = nil
  local PlayerAvatar = GWorld:GetAvatar()
  if nil == PlayerAvatar then
    return
  end
  self.Parent = Parent
  self.Mobile = "Mobile" == CommonUtils.GetDeviceTypeByPlatformName(self)
  self:AddInputMethodChangedListen()
  self:InitQuestData()
  self:FillWithQuestData(PlayerAvatar)
  self.MaxPhaseIndex = #self.QuestTabInfo
  if self.Mobile then
    self.Btn_CheckReward.Key_RewardPreview:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.TaskObjectClass = LoadClass("/Game/UI/WBP/Play/Mobile/Task/NewPlayer/WBP_Play_NewPlayerTaskItem_M.WBP_Play_NewPlayerTaskItem_M")
  else
    self.TaskObjectClass = LoadClass("/Game/UI/WBP/Play/PC/Task/NewPlayer/WBP_Play_NewPlayerTaskItem_P.WBP_Play_NewPlayerTaskItem_P")
  end
  self.List_Task.OnCreateEmptyContent:Bind(self, function(self)
    local Content = NewObject(self.TaskObjectClass)
    Content.QuestId = -1
    Content.Parent = self
    return Content
  end)
  if not ReddotManager.GetTreeNode(self.NodeName) then
    ReddotManager.AddNode(self.NodeName)
  end
  self.Text_NewPlayerSubTitle:SetText(GText("MAIN_UI_STARTERQUEST01"))
  self.Text_NewPlayerMainTitle:SetText(GText("MAIN_UI_STARTERQUEST02"))
  self:RefreshPhaseIndex(self.PlayerPhaseId)
  self:BindAllClickFunction()
  self.List_Task:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.List_Task:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.List_Task:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.List_Task:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self:AddDispatcher(EventID.UnLoadUI, self, function(self, UIName)
    if "GetItemPage" == UIName and not self.List_Task:HasFocusedDescendants() then
      self.List_Task:SetFocus()
    elseif "ArmoryMain" == UIName then
      self:HideNpc(false)
    end
  end)
  self:AddDispatcher(EventID.LoadUI, self, function(self, UIName)
    if "ArmoryMain" == UIName then
      self:HideNpc(true)
    end
  end)
  self:AddDispatcher(EventID.AllDailyTaskRewardKey, self, self.OnAllDailyTaskRewardKey)
  self:AddDispatcher(EventID.EntryReceiveEnterState, self, function()
    local StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
    if StyleOfPlay and StyleOfPlay:BP_GetDesiredFocusTarget() == self then
      self:RefreshPhaseIndex(self.CurPhaseId)
      self:SetFocus()
    end
  end)
  self.Left_Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:HideNpc(IsHide)
  local GameInstance = UE4.UGameplayStatics.GetGameInstance(self)
  local UIManager = GameInstance:GetGameUIManager()
  UIManager:HideNpcActor(IsHide, "StyleOfPlay")
end

function M:OnUpdateActivityByAction(ActionName, ...)
  local ParamId = (...)
  if "QuestGetReward" == ActionName or "QuestComplete" == ActionName then
    local PlayerAvatar = GWorld:GetAvatar()
    if nil ~= PlayerAvatar then
      local CurrentQuestServerData = PlayerAvatar.StarterQuests[ParamId]
      local CurrentQuestConfigData = DataMgr.StarterQuestDetail[ParamId]
      local CurrentPhaseId = CurrentQuestConfigData.QuestPhaseId
      self.AllQuestServerData[CurrentPhaseId][ParamId] = CurrentQuestServerData
      self:RefreshTabItemInfo(CurrentPhaseId)
    end
  elseif "QuestGetAllReward" == ActionName then
    local PlayerAvatar = GWorld:GetAvatar()
    if nil ~= PlayerAvatar then
      local QuestIdValue = DataMgr.StarterQuestPhaseMap[ParamId]
      for _, v in ipairs(QuestIdValue) do
        self.AllQuestServerData[ParamId][v] = PlayerAvatar.StarterQuests[v]
      end
      self:RefreshTabItemInfo(ParamId)
    end
  elseif "QuestRefreshReddot" == ActionName then
    self:RefreshRightBtnReddot()
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  if CurInputDevice == ECommonInputType.Gamepad and UIUtils.HasAnyFocus(self) and not UIUtils.HasAnyFocus(self.List_Task) then
    self.List_Task:SetFocus()
  end
  self:UpdateUIStyleInPlatform()
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

function M:TryNavigateToIndex(Index)
  Index = Index or 0
  self:AddTimer(0.1, function()
    if self:HasAnyFocus() or self:HasFocusedDescendants() then
      self.List_Task:NavigateToIndex(Index)
    else
      self:ClearLastFocusedWidget()
    end
  end)
end

function M:SwitchIn()
  self:TryNavigateToIndex(0)
  self:UpdateUIStyleInPlatform()
  self:PlayAnimation(self.In)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  if InKeyName == Const.GamepadDPadLeft then
    if self.Key_Left:IsVisible() then
      self:RefreshPhaseIndex(self.CurPhaseId - 1)
      IsHandled = true
    end
  elseif InKeyName == Const.GamepadDPadRight and self.Key_Right:IsVisible() then
    self:RefreshPhaseIndex(self.CurPhaseId + 1)
    IsHandled = true
  end
  if IsHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == Const.GamepadFaceButtonLeft then
    self:PreviewRewardBtnClick()
    IsEventHandled = true
  elseif InKeyName == Const.GamepadFaceButtonUp then
    local CanGetAll = self.Btn_Reward:GetVisibility() ~= UIConst.VisibilityOp.Collapsed
    if CanGetAll then
      self:GetAllRewardBtnClick()
      IsEventHandled = true
    end
  end
  return IsEventHandled
end

function M:OnAllDailyTaskRewardKey()
  if self.Btn_Reward:GetVisibility() ~= UIConst.VisibilityOp.Collapsed then
    self:GetAllRewardBtnClick()
  end
end

function M:SwitchGamepadKeyShow(IsShow, FocusTypeName)
  if not self.InitKey then
    self.InitKey = true
    self.Key_Left:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Left"}
      }
    })
    self.Key_Right:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Right"}
      }
    })
    
    local function ForbidFunc(Widget, bOn)
      local IsGamepad = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
      local CurrentPhaseIndex = self.PhaseId2TabId[self.CurPhaseId]
      if Widget == self.Key_Left then
        self:SetTabWidgetState(Widget, CurrentPhaseIndex > 1, true, IsGamepad)
      else
        self:SetTabWidgetState(self.Key_Right, CurrentPhaseIndex < self.MaxPhaseIndex, true, IsGamepad)
      end
    end
    
    self.Key_Left.SetForbidKey = ForbidFunc
    self.Key_Right.SetForbidKey = ForbidFunc
    self.Btn_Reward:SetGamePadImg("Y")
    self.Btn_CheckReward.Key_RewardPreview:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "X"}
      }
    })
  end
  self.Btn_Reward:SetGamePadIconVisible(IsShow or "RewardWidget" == FocusTypeName)
  local CurrentPhaseIndex = self.PhaseId2TabId[self.CurPhaseId]
  self:SetTabWidgetState(self.Key_Left, CurrentPhaseIndex > 1, true, IsShow)
  self:SetTabWidgetState(self.Key_Right, CurrentPhaseIndex < self.MaxPhaseIndex, true, IsShow)
  local Visibility = IsShow and UIConst.VisibilityOp.SelfHitTestInvisible or UIConst.VisibilityOp.Collapsed
  self.Btn_CheckReward.Key_RewardPreview:SetVisibility(Visibility)
  self.Parent:SwitchGamepadKeyShow(IsShow)
end

function M:UpdateUIStyleInPlatform()
  if self.Mobile then
    return
  end
  local IsGamepad = UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad
  local IsPC = not IsGamepad
  self:SwitchGamepadKeyShow(IsGamepad)
  local StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
  if StyleOfPlay then
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.CloseSelf,
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
        Desc = GText("UI_BACK"),
        bLongPress = false
      }
    }
    if IsPC then
      local IsShowSpace = self.Btn_Reward:GetVisibility() ~= UIConst.VisibilityOp.Collapsed
      if IsShowSpace then
        table.insert(BottomKeyInfo, 1, {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "Space",
              ClickCallback = self.OnAllDailyTaskRewardKey,
              Owner = self
            }
          },
          Desc = GText("UI_GameEvent_ClaimAll"),
          bLongPress = false
        })
      end
    end
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
  end
end

function M:OnSelectChange(Item)
  if self.SelectItem == Item then
    return
  end
  if self.SelectItem then
    self.SelectItem:OnUnselect()
  end
  if Item then
    Item:OnSelect()
  end
  self.SelectItem = Item
end

function M:CloseSelf()
  local Item = UIManager(self):GetUIObj("StyleOfPlay")
  self:PlayAnimation(self.Out)
  Item:OnClickBack()
end

AssembleComponents(M)
return M
