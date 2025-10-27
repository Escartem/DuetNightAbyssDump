require("UnLua")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ActivityCommon = require("BluePrints.UI.WBP.Activity.ActivityCommon")
local EMCache = require("EMCache.EMCache")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})
M._components = {
  "BluePrints.UI.WBP.Activity.Widget.View.ActivityTryOutView"
}

function M:Initialize(Initializer)
  self.OwnerPlayer = nil
  self.CurActivityId = nil
  self.CurSelectIndex = nil
  self.OriginalActivityId = nil
  self.CurCharId = nil
  self.CurSkinId = nil
  self.AllActivityIds = nil
  self.ParentTabId = nil
  self.ParentWidget = nil
  self.FocusWidgetName = nil
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
  self.CurSelectIndex = 1
  self.CurActivityId = self.OriginalActivityId
  self.FocusWidgetName = nil
end

function M:InitPage(ActivityId, ParentTabId, AllActivityId, ParentWidget)
  self.CurSelectIndex = 1
  self.CurActivityId = ActivityId
  self.OriginalActivityId = ActivityId
  self.ParentTabId = ParentTabId
  self.AllActivityIds = AllActivityId
  self.ParentWidget = ParentWidget
  self:UpdateSubPage()
end

function M:UpdateSubPage()
  local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
  if ActivityMain and ActivityMain.TryOutActivityNeedJumpToTabIndex then
    local TabIndex = ActivityMain.TryOutActivityNeedJumpToTabIndex
    ActivityMain.NeedJumpToActivityId = nil
    ActivityMain.TryOutActivityNeedJumpToTabIndex = nil
    self.CurSelectIndex = TabIndex
  end
  local PlayerAvatar = GWorld:GetAvatar()
  local ActivityConfigData = DataMgr.EventMain[self.CurActivityId]
  self.ActivityEndTime = ActivityConfigData.EventEndTime and ActivityConfigData.EventEndTime or ActivityConfigData.PermanenEventTime
  self.RewardEndTime = ActivityConfigData.RewardEndTime
  local PageConfigData = DataMgr.CharTrialEvent[self.CurActivityId]
  self.CurCharId = PageConfigData.CharId
  self:RefreshPageStaticView(ActivityConfigData, PageConfigData, PlayerAvatar.CharTrial, self.ViewInfoBtnClick, self.GoToGachaClick, self.GoToTargetPageClick, self.TryToGetReward, self.TryToViewCharDetail, self.TryToSelectChar, self.OnStuffDetailOpenChanged)
  self:RefreshPageDynamicView(PlayerAvatar.CharTrial[self.CurActivityId])
  self:InitTimeInfo()
end

function M:InitTimeInfo()
  if (self.ActivityEndTime ~= nil or nil ~= self.RewardEndTime) and self.Activity_Time.Com_Time then
    ActivityUtils.RefreshLeftTime(self, self.Activity_Time.Com_Time)
    self:AddTimer(1.0, ActivityUtils.RefreshLeftTime, true, 0, "RefreshLeftTime", true, self.Activity_Time.Com_Time)
  else
    ActivityUtils.SetLeftTimeView(self.Activity_Time.Com_Time, true)
  end
end

function M:IsCanChangeToGamePadViewMode()
  return self.FocusWidgetName ~= "CheckRewardDetailView"
end

function M:OnUpdateSubUIViewStyle(IsUseGamePad, bIsWithButton)
  IsUseGamePad = IsUseGamePad and self:IsCanChangeToGamePadViewMode()
  if IsUseGamePad then
    if #self.AllActivityIds > 1 then
      self.Key_Left:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Key_Right:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
      self.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    self.Key_RewardTitle:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.TryOutChar_Title.WS_DetailImg:SetActiveWidgetIndex(1)
    self.Btn_Buy.Key_Shop:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    if self.ActivityTryOutAvatarNeedWidget then
      self.ActivityTryOutAvatarNeedWidget.Key_Click:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    end
  else
    self.Key_Left:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Right:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_RewardTitle:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.TryOutChar_Title.WS_DetailImg:SetActiveWidgetIndex(0)
    self.Btn_Buy.Key_Shop:SetVisibility(UIConst.VisibilityOp.Collapsed)
    if self.ActivityTryOutAvatarNeedWidget then
      self.ActivityTryOutAvatarNeedWidget.Key_Click:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  if bIsWithButton then
    if IsUseGamePad then
      self.Btn_Gacha:SetGamepadIconVisibility(true)
      self.Btn_Goto:SetGamepadIconVisibility(true)
      self.Btn_Reward:SetGamePadIconVisible(true)
      if self.ActivityTryOutAvatarNeedWidget then
        self.ActivityTryOutAvatarNeedWidget.Key_Click:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      end
    else
      self.Btn_Gacha:SetGamepadIconVisibility(false)
      self.Btn_Goto:SetGamepadIconVisibility(false)
      self.Btn_Reward:SetGamePadIconVisible(false)
      if self.ActivityTryOutAvatarNeedWidget then
        self.ActivityTryOutAvatarNeedWidget.Key_Click:SetVisibility(UIConst.VisibilityOp.Collapsed)
      end
    end
  end
end

function M:UpdatePage(OperateSrc)
  local IsReBindClickFunction = false
  if IsReBindClickFunction then
    self:BindAllClickFunction(self.ViewInfoBtnClick, self.GoToGachaClick, self.GoToTargetPageClick)
  end
  local PlayerAvatar = GWorld:GetAvatar()
  if OperateSrc == ActivityCommon.AllUpdateTag.ActivityTab then
    self:ResetVariable()
  end
  self:UpdateSubPage()
  self:RefreshPageDynamicView(PlayerAvatar.CharTrial[self.CurActivityId])
end

function M:GetPageConfigData()
  return DataMgr.CharTrialEvent[self.CurActivityId]
end

function M:RefreshItemStyleByAction(ActionName, ActivityID)
  local PlayerAvatar = GWorld:GetAvatar()
  if "TryOutGetReward" == ActionName then
    self:RefreshItemStyleView(PlayerAvatar.CharTrial[ActivityID])
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

function M:EnterStuffViewMode()
  if self.FocusWidgetName == "CheckRewardDetailView" then
    return self:LeaveStuffViewMode()
  end
  self.Item_1:SetFocus()
  self.FocusWidgetName = "CheckRewardDetailView"
  self.FocusWidgetWidget = self.Item_1
  if self.ParentWidget then
    self.ParentWidget:UpdateActivityKeyTips("CheckRewardDetailView", self.Item_1)
  end
  self:OnUpdateSubUIViewStyle(false, true)
  self.IsInStuffViewMode = true
  return true
end

function M:LeaveStuffViewMode()
  if self.FocusWidgetName == nil then
    return false
  end
  self.FocusWidgetName = nil
  self.FocusWidgetWidget = nil
  if self.ParentWidget then
    self.ParentWidget:UpdateActivityKeyTips()
    self.ParentWidget:SetFocus()
  end
  self:OnUpdateSubUIViewStyle(true, true)
  self.IsInStuffViewMode = false
  return true
end

function M:SelectOtherCharItem(bIsNext)
  local NextChooseIndex
  if bIsNext then
    NextChooseIndex = math.min(ActivityCommon.MaxTryOutItemCount, self.CurSelectIndex + 1)
  else
    NextChooseIndex = math.max(0, self.CurSelectIndex - 1)
  end
  local CharItemWidget = self["CharacterItem_" .. NextChooseIndex]
  if CharItemWidget then
    CharItemWidget:OnBtnStateChange(true)
  end
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

function M:GoToTargetPageClick()
  local Params = {
    RightCallbackFunction = function(Obj, Result, PopUI)
      local PageConfigData = DataMgr.CharTrialEvent[self.CurActivityId]
      local CharTrialId = PageConfigData.CharTrialId
      local TrialDungeonId = DataMgr.CharTrial[CharTrialId].TrialDungeonId
      local PlayerAvatar = GWorld:GetAvatar()
      PlayerAvatar:EnterCharTrialByEvent(nil, TrialDungeonId, self.CurActivityId)
      local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
      local CurTabIndex = 1
      if ActivityMain then
        CurTabIndex = ActivityMain.CurTabIndex
      end
      local ExitDungeonInfo = {
        Type = "TryOut",
        CurTabIndex = CurTabIndex,
        ActivityId = self.CurActivityId,
        CurSelectIndex = self.CurSelectIndex
      }
      GWorld.GameInstance:SetExitDungeonData(ExitDungeonInfo)
    end,
    RightCallbackObj = self
  }
  UIManager(self):ShowCommonPopupUI(100214, Params, self)
end

function M:GoToGachaClick()
  if self.IsInStuffViewMode then
    return
  end
  local PageConfigData = DataMgr.CharTrialEvent[self.CurActivityId]
  if PageConfigData.GachaTabId then
    PageJumpUtils:JumpToGachaPage(PageConfigData.GachaTabId)
  elseif PageConfigData.InterfaceJumpId then
    PageJumpUtils:JumpToTargetPageByJumpId(PageConfigData.InterfaceJumpId)
  end
end

function M:OnStuffDetailOpenChanged(bIsOpen, Stuff)
  if not self.ParentWidget then
    return
  end
  if bIsOpen then
    self.ParentWidget:UpdateActivityKeyTips("EmptyView", nil, false)
  else
    self.ParentWidget:UpdateActivityKeyTips(self.FocusWidgetName, self.FocusWidgetWidget, false)
  end
end

function M:TryToGetReward()
  local PlayerAvatar = GWorld:GetAvatar()
  if nil == PlayerAvatar then
    return
  end
  PlayerAvatar:GetCharTrialReward(ActivityUtils.OnGetTryOutActivityRewardBack, self.CurActivityId)
end

function M:TryToViewCharDetail()
  if self.IsInStuffViewMode then
    return
  end
  local PageConfigData = self:GetPageConfigData()
  local CharId = PageConfigData.CharId
  UIManager(self):LoadUINew("ArmoryDetail", {
    PreviewCharIds = {CharId},
    bHideCharAppearance = true,
    bHideWeaponAppearance = true,
    EPreviewSceneType = CommonConst.EPreviewSceneType.PreviewCommon,
    OnCloseDelegate = nil
  })
end

function M:TryToSelectChar(NewActivityId, Index, CharId)
  if self.CurActivityId == NewActivityId then
    return
  end
  self:CancelCharSelectView()
  self.CurSelectIndex = Index
  self.CurActivityId = NewActivityId
  self.CurCharId = CharId
  self:UnBindAllClickFunction()
  self:UpdateSubPage()
  if self.ParentWidget then
    local ActivityConfigData = DataMgr.EventMain[self.CurActivityId]
    self.ParentWidget:RefreshViewAfterPageDataSet(ActivityConfigData, self:GetPageConfigData())
    self.ParentWidget:UpdateTabRedInfoByActivityID(nil, NewActivityId)
  end
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
  if InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    IsEventHandled = true
    self:GoToGachaClick()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    IsEventHandled = true
    self:GoToTargetPageClick()
  elseif InKeyName == UIConst.GamePadKey.LeftThumb then
    IsEventHandled = self:EnterStuffViewMode()
  elseif InKeyName == UIConst.GamePadKey.RightThumb then
    if self.ActivityTryOutAvatarNeedWidget and not self.IsInStuffViewMode then
      self.ActivityTryOutAvatarNeedWidget:OnClick()
      IsEventHandled = true
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
    IsEventHandled = self:LeaveStuffViewMode()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    IsEventHandled = true
    self:TryToGetReward()
  elseif InKeyName == UIConst.GamePadKey.SpecialLeft then
    if self.TryOutChar_Title.SkinId then
      return
    end
    IsEventHandled = true
    self:TryToViewCharDetail()
  elseif InKeyName == UIConst.GamePadKey.SpecialRight then
    IsEventHandled = true
    self:ViewInfoBtnClick()
  elseif InKeyName == UIConst.GamePadKey.LeftTriggerThreshold then
    self:SelectOtherCharItem(false)
  elseif InKeyName == UIConst.GamePadKey.RightTriggerThreshold then
    self:SelectOtherCharItem(true)
  end
  return IsEventHandled
end

AssembleComponents(M)
return M
