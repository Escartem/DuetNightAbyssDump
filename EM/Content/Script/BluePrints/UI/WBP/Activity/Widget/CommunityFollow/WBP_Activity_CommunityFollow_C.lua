require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
local DevServerList = require("BluePrints/UI/GameLogin/DevServerList")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ActivityReddotHelper = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")

function M:Construct()
  EventManager:AddEvent(EventID.OnCommunityFollowActivityJJJFinish, self, self.OnCommunityFollowActivityJJJFinish)
end

function M:Destruct()
  EventManager:RemoveEvent(EventID.OnCommunityFollowActivityJJJFinish, self)
end

function M:OnCommunityFollowActivityJJJFinish(CommunityId)
  self:InitUI()
end

function M:InitPage(ActivityId, ParentTabId, AllActivityId, ParentWidget)
  self.CurActivityId = ActivityId
  self.ParentTabId = ParentTabId
  self.AllActivityId = AllActivityId
  self.ParentWidget = ParentWidget
  local ActivityConfigData = DataMgr.EventMain[self.CurActivityId]
  self.ActivityEndTime = ActivityConfigData.EventEndTime and ActivityConfigData.EventEndTime or ActivityConfigData.PermanenEventTime
  self.RewardEndTime = ActivityConfigData.RewardEndTime
  self.FinishCondition = ActivityConfigData.EventEndCondition
  self.IsComplete = false
  local Avatar = GWorld:GetAvatar()
  if Avatar and self.FinishCondition then
    self.IsComplete = ConditionUtils.CheckCondition(Avatar, self.FinishCondition)
  end
  self.Area = "China"
  if Avatar and Avatar.Hostnum then
    self.Area = DevServerList[Avatar.Hostnum].area
  end
  self:InitTimeInfo()
  self.FocusWidgetName = "SelectView"
  self.GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem()
  if IsValid(self.GameInputModeSubsystem) then
    self:UpdateUIByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType())
  end
  self:InitUI()
end

function M:InitUI()
  local PageConfigData = self:GetPageConfigData()
  local CommunityList = PageConfigData.CommunityList
  self.CommunityList = CommunityList
  local SortedCommunityList = {}
  local UnclaimedList = {}
  local ClaimedList = {}
  local CanGetList = {}
  local Avatar = GWorld:GetAvatar()
  if Avatar then
    local Community = Avatar.Community
    for i = 1, #CommunityList do
      local CommunityId = CommunityList[i]
      local IsGetReward = Community:IsRewardGot(CommunityId)
      local IsCanGetReward = Community:IsRewardCanGet(CommunityId)
      if IsGetReward then
        table.insert(ClaimedList, CommunityId)
      elseif IsCanGetReward then
        table.insert(CanGetList, CommunityId)
      else
        table.insert(UnclaimedList, CommunityId)
      end
    end
  end
  for _, id in ipairs(CanGetList) do
    table.insert(SortedCommunityList, id)
  end
  for _, id in ipairs(UnclaimedList) do
    table.insert(SortedCommunityList, id)
  end
  for _, id in ipairs(ClaimedList) do
    table.insert(SortedCommunityList, id)
  end
  self.List_Item:ClearListItems()
  for i = 1, #SortedCommunityList do
    local CommunityId = SortedCommunityList[i]
    local CommunityData = DataMgr.CommunityList[CommunityId]
    local ItemContent = NewObject(UIUtils.GetCommonItemContentClass())
    ItemContent.CommunityId = CommunityId
    ItemContent.Reward = CommunityData.Reward
    ItemContent.Icon = CommunityData.Icon
    ItemContent.RewardMark = CommunityData.RewardMark
    ItemContent.JumpLink = CommunityData.JumpLink
    ItemContent.JumpTips = CommunityData.JumpTips
    ItemContent.CommunityId = CommunityId
    ItemContent.JobTips = CommunityData.JobTips
    ItemContent.ParentWidget = self
    self.List_Item:AddItem(ItemContent)
  end
  local ActivityConfigData = DataMgr.EventMain[self.CurActivityId]
  self.ActivityTitle.Text_ActivityDesc:SetText(GText(ActivityConfigData.EventDes))
  self.ActivityTitle.Text_Title:SetText(GText(ActivityConfigData.EventName))
end

function M:InitTimeInfo()
  if (self.ActivityEndTime ~= nil or nil ~= self.RewardEndTime or self.IsComplete) and self.ActivityTitle.Activity_Time then
    local bCheckNextDayFiveStamp = true
    ActivityUtils.RefreshLeftTime(self, self.ActivityTitle.Activity_Time, bCheckNextDayFiveStamp)
    self:AddTimer(1.0, ActivityUtils.RefreshLeftTime, true, 0, "RefreshLeftTime", true, self.ActivityTitle.Activity_Time, bCheckNextDayFiveStamp)
  else
    ActivityUtils.SetLeftTimeView(self.ActivityTitle.Activity_Time, true)
  end
end

function M:GetPageConfigData()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return nil
  end
  local ServerArea = DevServerList[Avatar.Hostnum].area
  return DataMgr.FollowCommunityEvent[ServerArea]
end

function M:ShowPage(IsNeedPlayInAnim)
  if IsNeedPlayInAnim then
    self:PlayFadeIn()
  end
  self:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:InitUI()
end

function M:HidePage(IsNeedPlayOutAnim)
  if IsNeedPlayOutAnim then
    self:PlayFadeOut()
  end
  self:SetVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:PlayFadeIn()
  self:PlayAnimation(self.In)
end

function M:PlayFadeOut(IsRemoveFromParent)
  self:PlayAnimation(self.Out)
  if IsRemoveFromParent then
    self:BindToAnimationFinished(self.Out, {
      self,
      self.RemoveFromParent
    })
  end
end

function M:UpdatePage(OperateSrc)
  self:InitUI()
end

function M:HandleKeyDownInPage(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadButtonDown(InKeyName)
  else
  end
  return IsEventHandled
end

function M:OnGamePadButtonDown(InKeyName)
  local IsEventHandled = self:Handle_KeyDownOnGamePad(InKeyName)
  return IsEventHandled
end

function M:Handle_KeyDownOnGamePad(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    IsEventHandled = self:LeaveRewardViewMode()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    IsEventHandled = self:EnterRewardViewMode()
  end
  return IsEventHandled
end

function M:GetCurFocusWidgetInfo()
  self:UpdateUIByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType())
  return self.FocusWidgetName, self.FocusWidgetWidget
end

function M:UpdateUIByInputDevice(CurInputDeviceType)
end

function M:EnterRewardViewMode()
  if self.ParentWidget then
    self.FocusWidgetName = "DefaultWidget"
    self.ParentWidget:UpdateActivityKeyTips()
  end
  self.List_Item:SetFocus()
  return true
end

function M:LeaveRewardViewMode()
  if self.ParentWidget then
    self.FocusWidgetName = "SelectView"
    self.ParentWidget:UpdateActivityKeyTips(self.FocusWidgetName)
    self.ParentWidget:SetFocus()
  end
  return true
end

return M
