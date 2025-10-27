require("UnLua")
local TimeUtils = require("Utils.TimeUtils")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})

function M:Construct()
  self.ResourceBarWidget = {}
  self.bIsFocusable = true
  self.bHasFocusedDescendants = false
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self:GetOwningPlayer())
  if IsValid(self.GameInputModeSubsystem) then
    self:OnUpdateUIStyleByInputTypeChange(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.OnUpdateUIStyleByInputTypeChange)
  end
end

function M:Destruct()
  if self.BubbleTimers then
    for TimerId, _ in pairs(self.BubbleTimers) do
      if self:IsExistTimer(TimerId) then
        self:RemoveTimer(TimerId)
      end
    end
    self.BubbleTimers = nil
  end
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.OnUpdateUIStyleByInputTypeChange)
  end
end

function M:InitResourceBar(Info, bShowBubble)
  self.Info = Info
  if nil ~= Info then
    self:ClearChildren()
    for i, CoinId in ipairs(Info) do
      local ResourceBarWidget = self.ResourceBarWidget[CoinId]
      if not IsValid(ResourceBarWidget) then
        ResourceBarWidget = UIManager(self):_CreateWidgetNew("ResourceBar")
        ResourceBarWidget:BindNavigationEvents(self, {
          OnNavigationToBoundary = self.OnResourceNavigationToBoundary,
          OnAddedToFocusPath = self.OnResourceAddedToFocusPath
        })
        ResourceBarWidget:BindEventOnMenuOpenChanged(self, self.OnMenuOpenChanged)
        self.ResourceBarWidget[CoinId] = ResourceBarWidget
      end
      local CoinIcon = LoadObject(DataMgr.Resource[CoinId].Icon)
      ResourceBarWidget.Common_Item_Icon:Init({
        UIName = "BagMain",
        IsShowDetails = true,
        IsCantItemSelection = true,
        MenuPlacement = EMenuPlacement.MenuPlacement_MenuRight,
        Id = CoinId,
        Icon = CoinIcon,
        ItemType = "Resource",
        HandleMouseDown = true
      })
      ResourceBarWidget:SetResourceId(CoinId)
      self.Panel_ResourceBar:AddChild(ResourceBarWidget)
      if bShowBubble then
        self:CheckAndShowLimitedResourceBubble(CoinId, ResourceBarWidget)
      end
    end
    self.Panel_ResourceBar:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Panel_ResourceBar:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:RefreshGamePadKey()
end

function M:CheckAndShowLimitedResourceBubble(ResourceId, ResourceBarWidget)
  local ResourceInfo = DataMgr.Resource[ResourceId]
  local LimitedInfo = ItemUtils.GetItemLimitedInfo(ResourceId)
  if ResourceInfo and LimitedInfo then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      local Count = Avatar:GetResourceNum(ResourceId)
      if Count > 0 then
        local NowTime = TimeUtils.NowTime()
        if LimitedInfo.EndTime then
          local TimeDiff = LimitedInfo.EndTime - NowTime
          if TimeDiff > 0 and TimeDiff < CommonConst.SECOND_IN_DAY then
            local ConfigData = {
              Text = GText("UI_GachaTicket_Bubble"),
              TextColor = 1
            }
            ResourceBarWidget:ShowBubble(ConfigData)
            self:HideLimitedResourceBubbleAfterDelay(ResourceBarWidget, 3.0)
          elseif TimeDiff >= CommonConst.SECOND_IN_DAY and TimeDiff < CommonConst.SECOND_IN_WEEKDAY then
            local ConfigData = {
              Text = GText("UI_GachaTicket_Bubble"),
              TextColor = 0
            }
            ResourceBarWidget:ShowBubble(ConfigData)
            self:HideLimitedResourceBubbleAfterDelay(ResourceBarWidget, 3.0)
          end
        end
      end
    end
  end
end

function M:HideLimitedResourceBubbleAfterDelay(ResourceBarWidget, DelayTime)
  if not self.BubbleTimers then
    self.BubbleTimers = {}
  end
  local TimerId = "LimitedResourceBubble_" .. tostring(ResourceBarWidget.RId)
  if self:IsExistTimer(TimerId) then
    self:RemoveTimer(TimerId)
  end
  
  local function HideBubbleFunc()
    if IsValid(ResourceBarWidget) then
      ResourceBarWidget:HideBubble()
    end
    if self:IsExistTimer(TimerId) then
      self:RemoveTimer(TimerId)
    end
    if self.BubbleTimers then
      self.BubbleTimers[TimerId] = nil
    end
  end
  
  self:AddTimer(DelayTime, HideBubbleFunc, false, 0.1, TimerId, true)
  self.BubbleTimers[TimerId] = true
end

function M:SetResourceBarVisibility(ResourceId, bIsVisible)
  if self.ResourceBarWidget[ResourceId] then
    self.ResourceBarWidget[ResourceId]:SetAddVisibilty(bIsVisible)
  else
    ScreenPrint("\230\151\160\230\149\136\232\181\132\230\186\144Id:" .. ResourceId or "nil")
  end
end

function M:SetResourceBarVisibilityByIndex(Index, bIsVisible)
  local widget = self.Panel_ResourceBar:GetChildAt(Index - 1)
  if IsValid(widget) then
    widget:SetAddVisibilty(bIsVisible)
  else
    ScreenPrint("\230\151\160\230\149\136\232\181\132\230\186\144\231\180\162\229\188\149:" .. Index or nil .. "\231\180\162\229\188\149\228\187\142\229\183\166\229\136\176\229\143\1791\229\188\128\229\167\139\239\188\140\229\166\130\230\158\156\230\156\137\233\154\144\232\151\143\231\154\132tab\228\185\159\231\174\151\228\184\138")
  end
end

function M:FocusToResource()
  if self.Panel_ResourceBar:HasAnyChildren() then
    self:SetFocus()
  end
end

function M:HideGamePadKey(bHide)
  if not bHide and next(self.ResourceBarWidget) then
    self.KeyImg_GamePad:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.KeyImg_GamePad:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetGamePadKeyImgByPath(Path)
  local Img = LoadObject(Path)
  self.KeyImg_GamePad.Img:SetBrushFromTexture(Img)
end

function M:InitGamePadTip(Params)
  self.Tip_GamePad:CreateCommonKey(Params.KeyInfo)
  self.Tip_PC.Button_Area.OnClicked:Clear()
  self.Tip_PC.Button_Area.OnClicked:Add(Params.ClickFuncObj, Params.ClickFunc)
end

function M:HideTip(bHide)
  if bHide then
    self.Panel_Tip:SetVisibility(UIConst.VisibilityOp.Collapsed)
  else
    self.Panel_Tip:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  end
end

function M:SwitchTipStyle(Index)
  self.Panel_Tip:SetActiveWidgetIndex(Index)
end

function M:GetCurrentResourceIndex()
  if self.CurrentResourceWidget then
    return self.Panel_ResourceBar:GetChildIndex(self.CurrentResourceWidget)
  end
  return -1
end

function M:ClearChildren()
  self.Panel_ResourceBar:ClearChildren()
  self.ResourceBarWidget = {}
end

function M:UpdateResource()
  for k, v in pairs(self.ResourceBarWidget) do
    if IsValid(v) then
      v:RefreshResourceInfo()
    end
  end
end

function M:OnPropSetResources(ResourceId, OldValue)
  if self.ResourceBarWidget and self.ResourceBarWidget[ResourceId] then
    self.ResourceBarWidget[ResourceId]:RefreshResourceInfo()
  end
end

function M:BindEvents(Obj, Events)
  Events = Events or {}
  self.Obj = Obj
  self.Event_OnAddedToFocusPath = Events.OnAddedToFocusPath
  self.Event_OnRemovedFromFocusPath = Events.OnRemovedFromFocusPath
  self.Event_OnMenuOpenChanged = Events.OnMenuOpenChanged
end

function M:OnMenuOpenChanged(bIsOpen)
  if self.Event_OnMenuOpenChanged then
    self.Event_OnMenuOpenChanged(self.Obj, bIsOpen)
  end
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.CurInputDeviceType = CurInputType
  self:RefreshGamePadKey()
end

function M:RefreshGamePadKey()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    if self.bHasFocusedDescendants and self.Panel_ResourceBar:IsVisible() then
      self:HideGamePadKey(true)
    else
      self:HideGamePadKey(false)
    end
  else
    self:HideGamePadKey(true)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local WidgetToFocus
  if "Gamepad_LeftShoulder" == InKeyName then
    WidgetToFocus = self:ClickToLeftOnGamePad()
  elseif "Gamepad_RightShoulder" == InKeyName then
    WidgetToFocus = self:ClickToRightOnGamePad()
  elseif "Gamepad_FaceButton_Right" == InKeyName then
    if self.GetReplyOnBack then
      local Reply = self.GetReplyOnBack()
      if Reply then
        return Reply
      end
    end
    WidgetToFocus = self.LastFocusWidget or self:GetParent()
  end
  if WidgetToFocus then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), WidgetToFocus)
  end
  return UIUtils.Unhandled
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  local ResourceWidget = self.Panel_ResourceBar:GetChildAt(0)
  if ResourceWidget then
    return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), ResourceWidget)
  end
  return UIUtils.Unhandled
end

function M:OnResourceNavigationToBoundary(NavigationDirection)
  if NavigationDirection == EUINavigation.Left then
    return self:ClickToLeftOnGamePad()
  elseif NavigationDirection == EUINavigation.Right then
    return self:ClickToRightOnGamePad()
  end
  return nil
end

function M:OnResourceAddedToFocusPath(ResourceWidget)
  if self.NeedOpenMenuWhenResoureFocused and ResourceWidget then
    ResourceWidget.Common_Item_Icon:OnMouseButtonDown()
    ResourceWidget.Common_Item_Icon:OnMouseButtonUp()
  end
  self.CurrentResourceWidget = ResourceWidget
  self.NeedOpenMenuWhenResoureFocused = false
end

function M:OnAddedToFocusPath(InFocusEvent)
  self.bHasFocusedDescendants = true
  self:RefreshGamePadKey()
  if self.Event_OnAddedToFocusPath then
    self.Event_OnAddedToFocusPath(self.Obj, self)
  end
end

function M:OnRemovedFromFocusPath(InFocusEvent)
  self.bHasFocusedDescendants = false
  self:RefreshGamePadKey()
  if self.Event_OnRemovedFromFocusPath then
    self.Event_OnRemovedFromFocusPath(self.Obj, self)
  end
end

function M:IsHasFocusedDescendants()
  return self.bHasFocusedDescendants
end

function M:ClickToLeftOnGamePad()
  local FocusWidget
  local CurrentResourceIdx = self:GetCurrentResourceIndex()
  if CurrentResourceIdx - 1 >= 0 then
    local CurSelectChild = self.Panel_ResourceBar:GetChildAt(CurrentResourceIdx)
    local NextSelectChild = self.Panel_ResourceBar:GetChildAt(CurrentResourceIdx - 1)
    if nil ~= NextSelectChild then
      if CurSelectChild and CurSelectChild:IsMenuOpened() then
        self.NeedOpenMenuWhenResoureFocused = true
      end
      FocusWidget = NextSelectChild
    end
    if nil ~= CurSelectChild then
      CurSelectChild.Common_Item_Icon:OnCloseMenuAnchor(true)
    end
  end
  return FocusWidget
end

function M:ClickToRightOnGamePad()
  self.NeedOpenMenuWhenResoureFocused = false
  local FocusWidget
  local CurrentResourceIdx = self:GetCurrentResourceIndex()
  if CurrentResourceIdx + 1 < self.Panel_ResourceBar:GetChildrenCount() then
    local CurSelectChild = self.Panel_ResourceBar:GetChildAt(CurrentResourceIdx)
    local NextSelectChild = self.Panel_ResourceBar:GetChildAt(CurrentResourceIdx + 1)
    if nil ~= NextSelectChild then
      if CurSelectChild and CurSelectChild:IsMenuOpened() then
        self.NeedOpenMenuWhenResoureFocused = true
      end
      FocusWidget = NextSelectChild
    end
    if nil ~= CurSelectChild then
      CurSelectChild.Common_Item_Icon:OnCloseMenuAnchor(true)
    end
  end
  return FocusWidget
end

function M:SetLastFocusWidget(Widget)
  self.LastFocusWidget = Widget
end

function M:SetGetReplyOnBack(GetReplyOnBack)
  self.GetReplyOnBack = GetReplyOnBack
end

return M
