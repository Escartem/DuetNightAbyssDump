require("UnLua")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ActivityCommon = require("BluePrints.UI.WBP.Activity.ActivityCommon")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.DelayFrameComponent"
})
M._components = {
  "BluePrints.UI.WBP.Activity.Widget.SevenDay.View.ActivitySevenDayView"
}

function M:Initialize(Initializer)
  self.OwnerPlayer = nil
  self.CurActivityId = nil
  self.ParentTabId = nil
  self.ParentWidget = nil
  self.AllSignInfo = {}
end

function M:GetPageName()
  return DataMgr.EventTab[self.ParentTabId].EventTabName
end

function M:GetActivityId()
  return self.CurActivityId
end

function M:GetParentTabId()
  return self.ParentTabId
end

function M:ResetVariable()
  self.FocusWidgetName = nil
end

function M:InitPage(ActivityId, ParentTabId, AllActivityId, ParentWidget)
  self.CurActivityId = ActivityId
  self.ParentTabId = ParentTabId
  self.ParentWidget = ParentWidget
  local PlayerAvatar = GWorld:GetAvatar()
  if nil == PlayerAvatar then
    return
  end
  local ActivityConfigData = DataMgr.EventMain[self.CurActivityId]
  self.ActivityEndTime = ActivityConfigData.EventEndTime and ActivityConfigData.EventEndTime or ActivityConfigData.PermanenEventTime
  self.RewardEndTime = ActivityConfigData.RewardEndTime
  local PageConfigData = DataMgr.DailyLogin[self.CurActivityId]
  local DailyLoginServerData = PlayerAvatar.DailyLogin[self.CurActivityId]
  local DailyLoginConfigData = DataMgr.DailyLogin[self.CurActivityId]
  if nil ~= DailyLoginServerData then
    for idx = 1, DailyLoginConfigData.LoginDuration do
      self.AllSignInfo[idx] = ActivityUtils.GetCurSignRewardState(idx, DailyLoginServerData)
    end
  end
  self:RefreshPageStaticView(ActivityConfigData, PageConfigData, self.ViewInfoBtnClick)
  self:RefreshPageDynamicView(PageConfigData, self.AllSignInfo)
  self:InitTimeInfo()
end

function M:InitTimeInfo()
  if (self.ActivityEndTime ~= nil or nil ~= self.RewardEndTime) and self.ActivityTitle.Activity_Time.Com_Time then
    ActivityUtils.RefreshLeftTime(self, self.ActivityTitle.Activity_Time.Com_Time)
    self:AddTimer(1.0, ActivityUtils.RefreshLeftTime, true, 0, "RefreshLeftTime", true, self.ActivityTitle.Activity_Time.Com_Time)
  else
    ActivityUtils.SetLeftTimeView(self.ActivityTitle.Activity_Time.Com_Time, true)
  end
end

function M:UpdatePage(OperateSrc)
  local IsReBindClickFunction = false
  local IsRefreshCacheServerData = OperateSrc == ActivityCommon.AllUpdateTag.ActivityTab
  local DailyLoginConfigData = DataMgr.DailyLogin[self.CurActivityId]
  if IsRefreshCacheServerData then
    local PlayerAvatar = GWorld:GetAvatar()
    local DailyLoginServerData = PlayerAvatar.DailyLogin[self.CurActivityId]
    if nil ~= DailyLoginServerData then
      for idx = 1, DailyLoginConfigData.LoginDuration do
        self.AllSignInfo[idx] = ActivityUtils.GetCurSignRewardState(idx, DailyLoginServerData)
      end
    end
  end
  if IsReBindClickFunction then
    self:BindAllClickFunction(self.ViewInfoBtnClick)
  end
  self:ResetVariable()
  self:RefreshPageDynamicView(DailyLoginConfigData, self.AllSignInfo)
end

function M:GetPageConfigData()
  return DataMgr.DailyLogin[self.CurActivityId]
end

function M:RefreshItemStyleByAction(ActionName, EventId, RewardIndex)
  if "SignGetReward" == ActionName then
    local PlayerAvatar = GWorld:GetAvatar()
    if nil ~= PlayerAvatar then
      local DailyLoginServerData = PlayerAvatar.DailyLogin[EventId]
      self.AllSignInfo[RewardIndex] = ActivityUtils.GetCurSignRewardState(RewardIndex, DailyLoginServerData)
      self:RefreshItemStyleView(RewardIndex, self.AllSignInfo[RewardIndex])
    end
  end
end

function M:CleanSelf(bIsRemoveSelf)
  self:RemoveTimer("RefreshLeftTime")
  if bIsRemoveSelf then
    self:RemoveFromParent()
  end
end

function M:GetCurFocusWidgetInfo()
  return self.FocusWidgetName, self.FocusWidgetWidget
end

function M:IsCanChangeToGamePadViewMode()
  return true
end

function M:OnUpdateSubUIViewStyle(IsUseGamePad, bIsWithButton)
  IsUseGamePad = IsUseGamePad and self:IsCanChangeToGamePadViewMode()
end

function M:EnterRewardViewMode()
  if self.FocusWidgetName ~= nil then
    return false
  end
  self.SevenDayItems:SetFocus()
  return true
end

function M:LeaveRewardViewMode()
  if self.FocusWidgetName == nil then
    return false
  end
  self.FocusWidgetName = nil
  if self.ParentWidget then
    self.ParentWidget:UpdateActivityKeyTips()
    self.ParentWidget:SetFocus()
  end
  return true
end

function M:UpdateParentActivityKeyTips(FocusWidgetName, FocusWidgetWidget, bIsFocusToParent)
  self.FocusWidgetName = FocusWidgetName
  self.FocusWidgetWidget = FocusWidgetWidget
  if self.ParentWidget then
    self.ParentWidget:UpdateActivityKeyTips(FocusWidgetName, FocusWidgetWidget)
    if bIsFocusToParent then
      self.ParentWidget:SetFocus()
    end
  end
end

function M:GetDefaultBottomTips()
  local ResultKeyInfo = {
    {
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_CTL_Select")
    },
    {
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = self.OnReturnKeyDown,
          Owner = self
        }
      },
      Desc = GText("UI_Tips_Close")
    }
  }
  return ResultKeyInfo
end

function M:ViewInfoBtnClick()
  local ActivityConfigData = DataMgr.EventMain[self.CurActivityId]
  if not ActivityConfigData.EventRule then
    DebugPrint("ViewInfoBtn Click, EventRule is nil, EventId is", self.CurActivityId)
    return
  end
  local Params = {
    ShortText = GText(ActivityConfigData.EventRule)
  }
  UIManager(self):ShowCommonPopupUI(100192, Params, self)
end

function M:HandleKeyDownInPage(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadButtonDown(InKeyName)
  else
    IsEventHandled = false
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

function M:HandlePreviewKeyDownInPage(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  return IsEventHandled
end

function M:OnSubTabNavigationRight()
  self:EnterRewardViewMode()
end

AssembleComponents(M)
return M
