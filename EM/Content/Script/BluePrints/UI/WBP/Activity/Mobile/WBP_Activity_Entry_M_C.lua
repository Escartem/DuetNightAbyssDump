require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C",
  "BluePrints.UI.WBP.Activity.WBP_Activity_EntryBase_C",
  "BluePrints.Common.DelayFrameComponent"
})
M._components = {
  "BluePrints.UI.WBP.Activity.Widget.View.ActivityEntryBaseView"
}

function M:Initialize(Initializer)
  self.Super.Initialize(self)
  self.OwnerPlayer = nil
  self.CurTabId = nil
  self.CurTabIndex = nil
  self.IsNotFirstOpenSystem = false
  self.AllCurrentActivityID = {}
  self.AllCurrentActivityPage = {}
end

function M:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.OwnerPlayer, self.NeedJumpToTabId, self.NeedJumpToActivityId, self.TryOutActivityNeedJumpToTabIndex = ...
  if self.OwnerPlayer == nil or not UE4.UKismetSystemLibrary.IsValid(self.OwnerPlayer) then
    self.OwnerPlayer = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  end
  local Info = {}
  Info.OwnerPanel = self
  self.EventTypeTab:Init(Info)
  self:InitListenEvent()
  self:GenerateAllDataInfo()
  self:PlayInAnim()
  self.EventTypeTab:InitReddotTreeInfo()
  self:AddTimer(0.05, function()
    if not self or not self.EventTypeTab then
      return
    end
    if not self.NeedJumpToTabId then
      self.EventTypeTab:ResetPos()
    end
  end)
  self.OpenKey = CommonUtils:GetActionMappingKeyName("OpenEvent")
  EventManager:AddEvent(EventID.OnReturnToActivityEntry, self, self.OnReturnToActivityEntry)
  EventManager:AddEvent(EventID.OnLeaveActivityEntry, self, self.OnLeaveActivityEntry)
  EventManager:AddEvent(EventID.OnActivityComplete, self, self.OnActivityComplete)
end

function M:InitListenEvent()
  self:AddDispatcher(EventID.OnUpdateActivityEvent, self, self.OnUpdateActivityByAction)
  self:AddDispatcher(EventID.ActivityControllerEvent, self, self.OnUpdateActivityByControllerEvent)
end

function M:ReceiveEnterState(StackAction)
  if 1 == StackAction then
    self:OnRefreshCurrentPageAfterJump()
    self:UpdateTabRedInfoByActivityID(self.CurTabIndex)
    self:PlayAnimationForward(self.In)
  end
  self.Super.ReceiveEnterState(self, StackAction)
end

function M:Close()
  self.Super.Close(self)
end

function M:Destruct()
  self.WidgetBGAnchor:ClearChildren()
  self.Group_Anchor:ClearChildren()
  self.List_Tab.OnCreateEmptyContent:Unbind()
  EventManager:RemoveEvent(EventID.OnReturnToActivityEntry, self)
  EventManager:RemoveEvent(EventID.OnLeaveActivityEntry, self)
  EventManager:RemoveEvent(EventID.OnActivityComplete, self)
  self.Super.Destruct(self)
end

function M:RefreshBaseInfo(TopTabInfo, SubTabItems, BtnClickFunction, VirtualClickFunction, SelectTabIndex)
  local SubTabInfo = {
    Tabs = SubTabItems,
    SoundFunc = function()
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
    end
  }
  self:InitTabView(TopTabInfo, SubTabInfo, BtnClickFunction, VirtualClickFunction, SelectTabIndex)
  self:ShowContentView(nil == SubTabItems or 0 == #SubTabItems, true)
end

function M:GetTopTabInfo()
  local TopTabInfo = {
    Tabs = self.AllTabInfo,
    DynamicNode = {
      "ResourceBar"
    },
    StyleName = "Image",
    OwnerPanel = self,
    TitleName = GText("MAIN_UI_GAMEEVENT"),
    BackCallback = self.OnReturnKeyDown,
    InfoCallback = "NotShow"
  }
  return TopTabInfo
end

function M:UpdateUIStyleInPlatform(IsUseGamePad)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  else
    IsEventHandled = self.Activity_Tab:Handle_KeyEventOnPC(InKeyName)
  end
  if not IsEventHandled and not IsEventHandled then
    local CurrentActivePage = self.AllCurrentActivityPage[self.CurTabId]
    if nil ~= CurrentActivePage then
      IsEventHandled = CurrentActivePage:HandleKeyDownInPage(MyGeometry, InKeyEvent)
    end
  end
  if InKeyName == self.OpenKey then
    IsEventHandled = true
    self:OnReturnKeyDown()
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:HandleVirtualClickInGamePad(TabWidget)
  if self.GameInputModeSubsystem:GetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  local CurrentActivePage = self.AllCurrentActivityPage[self.CurTabId]
  if nil ~= CurrentActivePage then
    CurrentActivePage:OnGamePadButtonDown(UIConst.GamePadKey.FaceButtonBottom)
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if "Gamepad_FaceButton_Left" == InKeyName then
    IsEventHandled = self:Handle_KeyDownOnGamePad()
  else
    IsEventHandled = self.Activity_Tab:Handle_KeyEventOnGamePad(InKeyName)
  end
  return IsEventHandled
end

function M:Handle_KeyDownOnGamePad()
  return true
end

function M:OnReturnToActivityEntry()
  self:PlayAnimationForward(self.In)
end

function M:OnLeaveActivityEntry()
  self:PlayAnimationForward(self.Out)
end

function M:OnActivityComplete(EventID)
  self:SetActivityComplete(EventID)
end

AssembleComponents(M)
return M
