require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
local ChallengeTaskNewReddotName = "JJGameTask_Challenge_New"
local ChallengeRewardReddotName = "JJGameTask_Challenge_Reddot"

function M:Construct()
  self.Text_Doing:SetText(GText("UI_Event_MidTerm_InProgress"))
  self.Btn_Jump:SetText(GText("UI_Event_MidTerm_GotoTask"))
  self.Text_WaitRefresh:SetText(GText("UI_Event_MidTerm_RefreshTask"))
  self.Btn_Jump.Button_Area.OnClicked:Add(self, self.OnJumpClicked)
  self.Btn_Jump:SetGamepadIconVisibility(false)
  self.Btn_CanGet.Text_GetReward:SetText(GText("UI_Achievement_GetReward"))
  self.Btn_CanGet.Btn_GetReward.OnClicked:Add(self, self.OnCanGetClicked)
  self.Btn_Controller.OnClicked:Add(self, self.OnControllerClicked)
  self.Avatar = GWorld:GetAvatar()
  self:InitListenEvent()
  self:RefreshBaseInfo()
end

function M:Destruct()
  self.Btn_Jump.Button_Area.OnClicked:Clear()
  self.Btn_CanGet.Btn_GetReward.OnClicked:Clear()
  self.Btn_Controller.OnClicked:Clear()
  ReddotManager.RemoveListener(ChallengeTaskNewReddotName, self)
end

function M:OnListItemObjectSet(Content)
  self.Owner = Content.Owner
  self.JJGameBase = self.Owner.Owner
  self.Content = Content
  self.TaskId = Content.TaskId
  self.TaskProp = self.Avatar.MidTermTasks[self.TaskId]
  self.TaskConfig = Content.TaskConfig
  Content.SelfWidget = self
  self.Text_RewardNum:SetText(Content.Point)
  self.Text_Desc:SetText(GText(Content.Desc))
  if self.TaskProp.Progress >= self.TaskProp.Target then
    if self.TaskProp.RewardsGot then
      self.WS_Btn:SetActiveWidgetIndex(3)
      if self.Owner and self.Owner.TrySubChallengeTaskRewardReddot then
        self.Owner:TrySubChallengeTaskRewardReddot(self.TaskProp.UniqueID)
      end
      if self.Owner and self.Owner.TrySubChallengeTaskNewReddot then
        self.Owner:TrySubChallengeTaskNewReddot(self.TaskProp.UniqueID)
      end
    else
      self.Content.CanGet = true
      self.WS_Btn:SetActiveWidgetIndex(2)
    end
  elseif Content.TaskConfig.JumpUIId then
    self.WS_Btn:SetActiveWidgetIndex(1)
    self.JumpUIId = Content.TaskConfig.JumpUIId
  else
    self.WS_Btn:SetActiveWidgetIndex(0)
  end
  self:UpdateGetRewardNum()
  ReddotManager.AddListenerEx(ChallengeTaskNewReddotName, self, self.UpdateChallengeTaskNewReddot)
end

function M:BP_OnEntryReleased()
  ReddotManager.RemoveListener(ChallengeTaskNewReddotName, self)
end

function M:OnCanGetClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/activity/wenmingboyi_normal_btn_click", nil, nil)
  self.JJGameBase:GetTaskReward(self, self.Owner, self.TaskId)
end

function M:OnControllerClicked()
  if 2 == self.WS_Btn:GetActiveWidgetIndex() then
    self:OnCanGetClicked()
  elseif 1 == self.WS_Btn:GetActiveWidgetIndex() then
    self:OnJumpClicked()
  end
end

function M:UpdateGetRewardNum()
  local Avatar = GWorld:GetAvatar()
  local TaskProp = Avatar.MidTermTasks[self.TaskId]
  local Num = tostring(TaskProp.Progress) .. "/" .. tostring(TaskProp.Target)
  self.Text_GetRewardNum:SetText(Num)
  self.Text_DoingNum:SetText(Num)
  self.Text_JumpNum:SetText(Num)
  if TaskProp.Progress >= TaskProp.Target and TaskProp.RewardsGot then
    if self.Owner and self.Owner.TrySubChallengeTaskRewardReddot then
      self.Owner:TrySubChallengeTaskRewardReddot(TaskProp.UniqueID)
    end
    if self.Owner and self.Owner.TrySubChallengeTaskNewReddot then
      self.Owner:TrySubChallengeTaskNewReddot(TaskProp.UniqueID)
    end
    self.WS_Btn:SetActiveWidgetIndex(3)
  end
end

function M:OnJumpClicked()
  PageJumpUtils:JumpToTargetPageByJumpId(self.TaskConfig.JumpUIId)
end

function M:TryIncreaceChallengeRewardReddot(Key)
  local CacheKey = ChallengeRewardReddotName .. Key
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeRewardReddotName)
  if CacheData and nil == CacheData[CacheKey] then
    CacheData[CacheKey] = true
    ReddotManager.IncreaseLeafNodeCount(ChallengeRewardReddotName)
  end
end

function M:OnAchvFinished(TaskId)
  if TaskId == self.TaskId then
    self.Content.CanGet = true
    self.WS_Btn:SetActiveWidgetIndex(2)
    self:UpdateGetRewardNum()
    self:TryIncreaceChallengeRewardReddot(self.TaskProp.UniqueID)
    DebugPrint("\228\187\187\229\138\161", self.TaskId, "\229\183\178\229\174\140\230\136\144\239\188\140\229\143\175\228\187\165\233\162\134\229\143\150\229\165\150\229\138\177")
  end
end

function M:OnMidTermTaskProgressChange(TaskId, Progress)
  if TaskId == self.TaskId then
    self:UpdateGetRewardNum()
  end
end

function M:InitListenEvent()
  local PlayerController = self:GetOwningPlayer()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:RefreshBaseInfo()
  if IsValid(self.GameInputModeSubsystem) then
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.CurGamepadName = CurGamepadName
  local IsUseGamepad = CurInputDevice == ECommonInputType.Gamepad
  if IsUseGamepad then
    self.Btn_Controller:SetVisibility(UIConst.VisibilityOp.Visible)
    self:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    if self:HasAnyUserFocus() or self:HasFocusedDescendants() then
      self:PlayAnimation(self.Hover)
    end
  else
    self.Btn_Controller:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self:SetVisibility(UIConst.VisibilityOp.Visible)
    self:StopAnimation(self.Hover)
    self:PlayAnimation(self.Normal)
  end
  self.CurInputDevice = CurInputDevice
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  if self.CurInputDevice == ECommonInputType.Gamepad then
    self.Btn_Controller:SetFocus()
    self:PlayAnimation(self.Hover)
  end
  return UIUtils.Handle
end

function M:OnAddedToFocusPath(InFocusEvent)
  if self.CurInputDevice == ECommonInputType.Gamepad then
    self.Owner.CurFocusTask = self.Content
    self:PlayAnimation(self.Hover)
    self.Btn_Jump:SetGamepadIconVisibility(true)
    self.Btn_CanGet.Key_GetReward:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  self:StopAnimation(self.Hover)
  self:PlayAnimation(self.Normal)
  self.Btn_Jump:SetGamepadIconVisibility(false)
  self.Btn_CanGet.Key_GetReward:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:UpdateChallengeTaskNewReddot(Count)
  if not self.TaskProp then
    return
  end
  local CacheKey = self.TaskProp.UniqueID or ""
  local CacheData = ReddotManager.GetLeafNodeCacheDetail(ChallengeTaskNewReddotName)
  if not CacheData then
    return
  end
  if CacheData[CacheKey] and Count > 0 then
    self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.New:SetVisibility(UIConst.VisibilityOp.Hidden)
  end
end

return M
