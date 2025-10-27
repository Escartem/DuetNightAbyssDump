require("UnLua")
local ActivityReddotHelper = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.UI.WBP.Activity.Widget.JumpToOtherPage.ActivityJumpPageBase"
})
M._components = {
  "BluePrints.UI.WBP.Activity.Widget.View.ActivityJumpPageView"
}

function M:Initialize(Initializer)
  self.OwnerPlayer = nil
  self.ParentWidget = nil
  self.CurActivityId = nil
  self.ParentTabId = nil
  self.FocusWidgetName = nil
end

function M:UpdatePage(OperateSrc)
  local IsReBindClickFunction = false
  if IsReBindClickFunction then
    self:BindAllClickFunction(self.ViewInfoBtnClick, self.GoToShopClick, self.GoToTargetPageClick)
  end
  self:ResetVariable()
  self:RefreshPageDynamicView()
  self.FocusWidgetName = "BackToPageWithJump"
end

function M:IsCanChangeToGamePadViewMode()
  return self.FocusWidgetName ~= "CheckRewardDetailView"
end

function M:OnUpdateSubUIViewStyle(IsUseGamePad, bIsWithButton)
  IsUseGamePad = IsUseGamePad and self:IsCanChangeToGamePadViewMode()
  self.Com_BtnExplanation:UpdateUIStyleInPlatform(IsUseGamePad)
  local ChildItemSubWidget = self:GetSupportsKeyDownSubWidget()
  if ChildItemSubWidget and type(ChildItemSubWidget.OnUpdateSubUIViewStyle) == "function" then
    ChildItemSubWidget:OnUpdateSubUIViewStyle(IsUseGamePad)
  end
  if bIsWithButton then
    if IsUseGamePad then
      self.Btn_Confirm:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    else
      self.Btn_Confirm:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
    end
  end
  if IsUseGamePad then
    self.Key_RewardTitle:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Btn_Buy.Key_Shop:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_Task:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_More:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_RewardTitle:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Btn_Buy.Key_Shop:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Task:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_More:SetVisibility(UIConst.VisibilityOp.Collapsed)
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

function M:GetCurFocusWidgetInfo()
  return self.FocusWidgetName, self.FocusWidgetWidget
end

function M:EnterStuffViewMode()
  if self.IsHideReward then
    return false
  end
  if self.FocusWidgetName == "CheckRewardDetailView" then
    return self:LeaveStuffViewMode()
  end
  self.List_Reward:SetFocus()
  self.FocusWidgetName = "CheckRewardDetailView"
  self.FocusWidgetWidget = self.List_Reward
  if self.ParentWidget then
    self.ParentWidget:UpdateActivityKeyTips(self.FocusWidgetName, self.FocusWidgetWidget)
  end
  self:OnUpdateSubUIViewStyle(false, true)
  local ChildItemSubWidget = self:GetSupportsFocusSubWidget()
  local SupportCommonSubItemWidget = self:GetSupportCommonSubItemWidget()
  if SupportCommonSubItemWidget and SupportCommonSubItemWidget.OnUpdateSubUIViewStyle then
    SupportCommonSubItemWidget:OnUpdateSubUIViewStyle(false)
  end
  if ChildItemSubWidget then
    ChildItemSubWidget:OnUpdateSubUIViewStyle(false)
  end
  return true
end

function M:LeaveStuffViewMode()
  if self.FocusWidgetName == nil then
    return false
  end
  self.FocusWidgetName = nil
  self.FocusWidgetWidget = nil
  self.List_Reward:BP_ClearSelection()
  if self.ParentWidget then
    self.ParentWidget:UpdateActivityKeyTips()
    self.ParentWidget:SetFocus()
  end
  self:OnUpdateSubUIViewStyle(true, true)
  local ChildItemSubWidget = self:GetSupportsFocusSubWidget()
  if ChildItemSubWidget then
    ChildItemSubWidget:OnUpdateSubUIViewStyle(true)
  end
  local SupportCommonSubItemWidget = self:GetSupportCommonSubItemWidget()
  if SupportCommonSubItemWidget and SupportCommonSubItemWidget.OnUpdateSubUIViewStyle then
    SupportCommonSubItemWidget:OnUpdateSubUIViewStyle(true)
  end
  return true
end

function M:GetSupportsFocusSubWidget()
  local ChildItemSubWidget = self.Group_Task:GetChildAt(0)
  return ChildItemSubWidget
end

function M:GetSupportCommonSubItemWidget()
  local CommonSubItemWidget = self.Group_LimitTimeReward:GetChildAt(0)
  return CommonSubItemWidget
end

function M:GetSupportsKeyDownSubWidget()
  local ChildItemSubWidget = self.Group_Task:GetChildAt(0)
  ChildItemSubWidget = ChildItemSubWidget or self.Group_TaskProgress:GetChildAt(0)
  ChildItemSubWidget = ChildItemSubWidget or self.Group_Common_SubItem:GetChildAt(0)
  return ChildItemSubWidget
end

function M:GetCurFocusWidgetInfo()
  local ActivityMain = UIManager(self):GetUIObj("ActivityMain")
  if ActivityMain then
    local JumpPageBG = ActivityMain.WidgetBGAnchor:GetChildAt(0)
    if JumpPageBG then
      return JumpPageBG.FocusWidgetName, JumpPageBG.FocusWidgetWidget
    end
  end
  return self.FocusWidgetName, self.FocusWidgetWidget
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
  if InKeyName == UIConst.GamePadKey.SpecialLeft then
    local ChildItemSubWidget = self:GetSupportsFocusSubWidget()
    if ChildItemSubWidget and type(ChildItemSubWidget.OnSubWidgetReceivedFocus) == "function" then
      IsEventHandled = true
      self:OnUpdateSubUIViewStyle(false, true)
      self.FocusWidgetName, self.FocusWidgetWidget = ChildItemSubWidget:OnSubWidgetReceivedFocus()
      if self.ParentWidget then
        self.ParentWidget:UpdateActivityKeyTips(self.FocusWidgetName, self.FocusWidgetWidget)
      end
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    local PageConfigData = DataMgr.EventPortal[self.CurActivityId]
    if PageConfigData.TaskId then
      IsEventHandled = true
      self:GoToTaskClick()
    elseif not PageConfigData.EventShop then
      IsEventHandled = false
    else
      IsEventHandled = true
      self:GoToShopClick()
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    local PageConfigData = DataMgr.EventPortal[self.CurActivityId]
    if PageConfigData.IsUseTabJumpBtn ~= nil and PageConfigData.IsUseTabJumpBtn == false then
      IsEventHandled = false
    else
      local GoToBtnWidgetIndex = self.WS:GetActiveWidgetIndex()
      if 0 == GoToBtnWidgetIndex then
        IsEventHandled = true
        self:GoToTargetPageClick()
      end
    end
  elseif InKeyName == UIConst.GamePadKey.LeftThumb then
    IsEventHandled = self:EnterStuffViewMode()
  elseif InKeyName == UIConst.GamePadKey.RightThumb then
    IsEventHandled = true
    self:GoToMoreClick()
  elseif InKeyName == UIConst.GamePadKey.FaceButtonRight then
    local ChildItemSubWidget = self:GetSupportsFocusSubWidget()
    local PlayerController = self:GetOwningPlayer()
    if ChildItemSubWidget and ChildItemSubWidget:HasUserFocusedDescendants(PlayerController) and "function" == type(ChildItemSubWidget.OnSubWidgetLostFocus) then
      IsEventHandled = true
      self:OnUpdateSubUIViewStyle(true, true)
      self.FocusWidgetName, self.FocusWidgetWidget = ChildItemSubWidget:OnSubWidgetLostFocus()
      ChildItemSubWidget:OnUpdateSubUIViewStyle(true)
      if self.ParentWidget then
        self.ParentWidget:UpdateActivityKeyTips()
        self.ParentWidget:SetFocus()
      end
    else
      IsEventHandled = self:LeaveStuffViewMode()
    end
  elseif InKeyName == UIConst.GamePadKey.SpecialRight then
    IsEventHandled = true
    self:ViewInfoBtnClick()
  end
  if not IsEventHandled then
    local ChildItemSubWidget = self:GetSupportsKeyDownSubWidget()
    if ChildItemSubWidget and "function" == type(ChildItemSubWidget.HandleKeyDownOnGamePad) then
      IsEventHandled = ChildItemSubWidget:HandleKeyDownOnGamePad(InKeyName)
    end
  end
  if not IsEventHandled then
    local ChildItemSubWidget = self:GetSupportCommonSubItemWidget()
    if ChildItemSubWidget and "function" == type(ChildItemSubWidget.HandleKeyDownOnGamePad) then
      IsEventHandled = ChildItemSubWidget:HandleKeyDownOnGamePad(InKeyName)
    end
  end
  return IsEventHandled
end

function M:Destruct()
  if self.CurActivityId then
    ActivityReddotHelper.RemoveReddotListenByEventId(self.CurActivityId, self)
  end
end

AssembleComponents(M)
return M
