require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr"
})
local PC_PADDING = 60
local HoverTimer
local Unhandled = UE4.UWidgetBlueprintLibrary.Unhandled()

function M:OnMenuClose()
  if self.ParentWidget then
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      if self.ParentWidget and self.ParentWidget.Content and self.ParentWidget.Content.bIsResetFocus then
        self.ParentWidget:SetFocus()
      end
    elseif self.ParentWidget.Normal then
      self.ParentWidget:PlayAnimation(self.ParentWidget.Normal)
    end
    self.ParentWidget.Content.IsShowTips = false
    self.ParentWidget.Content.IsSelect = false
    self.ParentWidget:StopAllAnimations()
    if self.ParentWidget.VX_Loop then
      self.ParentWidget.VX_Loop:SetVisibility(UIConst.VisibilityOp.Collapsed)
    end
    if self.ParentWidget.Item then
      self.ParentWidget.Item:PlayAnimation(self.ParentWidget.Item.Normal)
    end
  end
end

function M:Construct()
  self:InitMenuOpenChangedListen()
  local Platform = CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance)
  if "PC" == Platform then
    self.OriginPadding = FMargin(0)
    local Padding = self.ItemDetailsMenuAnchor.ViewportPadding
    self.OriginPadding.Top = Padding.Top
    self.OriginPadding.Bottom = Padding.Bottom
    self.OriginPadding.Left = Padding.Left
    self.OriginPadding.Right = Padding.Right
    Padding.Top = Padding.Top + PC_PADDING
    Padding.Bottom = Padding.Bottom + PC_PADDING
    self.ItemDetailsMenuAnchor:SetViewportPadding(Padding)
  end
end

function M:InitMenuOpenChangedListen()
  self.ItemDetailsMenuAnchor.OnMenuOpenChanged:Add(self, self.OnMenuOpenChanged)
end

function M:ClearMenuOpenChangedListen()
  self.ItemDetailsMenuAnchor.OnMenuOpenChanged:Remove(self, self.OnMenuOpenChanged)
end

function M:OnMenuOpenChanged(bIsOpen)
  UIManager(self):SetIsMenuAnchorOpen(bIsOpen)
  if not bIsOpen then
    self:OnMenuClose()
  end
end

function M:Destruct()
  if HoverTimer then
    self:StopHoverTimer()
  end
  if not self.bMenuClosing then
    self:CloseItemDetailsWidget(true)
  end
  self.ItemDetailsMenuAnchor:SetViewportPadding(self.OriginPadding)
end

function M:InitializeSetUp(Parent, Content, bAllowHover)
  self.ParentWidget = Parent
  self.Content = Content
  self.bAllowHover = bAllowHover
  if self.Content then
    self.Content.ItemType = self.Content.Type
    self.Content.ItemId = self.Content.UnitId
  end
end

function M:SetConfirmDesc(ConfirmDesc)
  if self.Content then
    self.Content.ConfirmDesc = ConfirmDesc
  end
end

function M:ClearSetup()
  self.ParentWidget, self.Content, self.bAllowHover = nil, nil, nil
end

function M:OnMouseEnter(MyGeometry, MouseEvent)
  DebugPrint("Wbp_itemdetails_Menuanchor_c:: OnMouseEnter")
  local Platform = CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance)
  if "PC" ~= Platform then
    return
  end
  if not self.bAllowHover or not self.Content then
    return
  end
  local bIsHover = true
  if self.Content.IsSelected ~= nil then
    bIsHover = self.Content.IsSelected ~= true
  end
  if nil ~= self.ParentWidget.IsSelected then
    bIsHover = true ~= self.ParentWidget.IsSelected
  end
  self:StopHoverTimer()
  local Delay = 0.15
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    Delay = 0.1
  end
  local _, TimerKey = self:AddTimer(Delay, function()
    self:OpenItemDetailsWidget(bIsHover)
  end, false, 0, nil, true)
  HoverTimer = TimerKey
end

function M:OnMouseLeave(MouseEvent)
  local Platform = CommonUtils.GetDeviceTypeByPlatformName(GWorld.GameInstance)
  if "PC" ~= Platform then
    return
  end
  self:StopHoverTimer()
  if not self.bAllowHover or not self.Content then
    return
  end
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    return
  end
  self:CloseItemDetailsWidget()
end

function M:StopHoverTimer()
  if self:IsExistTimer(HoverTimer) then
    self:RemoveTimer(HoverTimer)
    HoverTimer = nil
  end
end

function M:OpenItemDetailsWidget(bIsHover, Content)
  DebugPrint("ItemDetails_MenuAnchor:: OpenItemDetailsWidget")
  if self.Content then
    Content = self.Content
  end
  if not Content then
    return
  end
  if not Content.IsShowDetails and self.Content then
    return
  end
  if not bIsHover and Content.bDontOpenTipsWhenClick then
    return
  end
  if self.bAllowRetain and self.ItemDetailsMenuAnchor:IsOpen() then
    return
  end
  Content.bIsHoverState = bIsHover
  if Content.MenuPlacement then
    self.ItemDetailsMenuAnchor:SetPlacement(Content.MenuPlacement)
  end
  if self.IsRevertShear then
    local Transform = self.ItemDetailsMenuAnchor.RenderTransform
    Transform.Shear.X = -self.RenderTransform.Shear.X
    self.ItemDetailsMenuAnchor:SetRenderTransform(Transform)
  end
  self.ItemDetailsMenuAnchor:Open(not bIsHover)
  if self.CommonItemDetails then
    self.CommonItemDetails.Parent = self.ItemDetailsMenuAnchor
    self.CommonItemDetails.ParentWidget = self
    if self.ParentWidget then
      self.CommonItemDetails.UIName = self.ParentWidget.UIName
    end
    self.CommonItemDetails:RefreshItemInfo(Content)
  end
end

function M:ExecuteOnGuideTouchOpen()
  self.OriginbAllowHover = self.bAllowHover
  self.bAllowHover = false
  self.bGuideState = true
  if self.ItemDetailsMenuAnchor.SetUseApplicationMenuStack then
    self.ItemDetailsMenuAnchor:SetUseApplicationMenuStack(false)
  end
end

function M:ExecuteOnGuideTouchClose()
  self:OpenItemDetailsWidget(false)
end

function M:CloseItemDetailsWidget(bForce)
  self.bMenuClosing = true
  if not self.ItemDetailsMenuAnchor:IsOpen() then
    return
  end
  if self.bAllowRetain and not bForce then
    return
  end
  self.ItemDetailsMenuAnchor:Close()
  if self.LastFocusWidget then
    self.LastFocusWidget:SetFocus()
  end
  if self.bGuideState then
    if self.ItemDetailsMenuAnchor.SetUseApplicationMenuStack then
      self.ItemDetailsMenuAnchor:SetUseApplicationMenuStack(true)
    end
    self.bGuideState = nil
    self.bAllowHover = self.OriginbAllowHover
  end
end

function M:SetLastFocusWidget(Widget)
  self.LastFocusWidget = Widget
end

function M:SetAllowRetain(bAllowRetain)
  self.bAllowRetain = bAllowRetain
end

function M:SetRevertShear(IsRevertShear)
  self.IsRevertShear = IsRevertShear
end

function M:SetAllowHover(bAllowHover)
  self.bAllowHover = bAllowHover
  self:StopHoverTimer()
end

return M
