require("UnLua")
local ActivityUtils = require("Blueprints.UI.WBP.Activity.ActivityUtils")
local ActivityReddotHelper = require("BluePrints.UI.WBP.Activity.ActivityReddotHelper")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C",
  "BluePrints.Common.TimerMgr",
  "BluePrints.Common.DelayFrameComponent"
})

function M:Construct()
end

function M:Destruct()
  if self.TabId then
    ActivityReddotHelper.RemoveReddotListenByTabId(self.TabId, self)
  end
end

function M:OnListItemObjectSet(Content)
  Content.UI = self
  self.Content = Content
  self.Index = Content.Index
  self.TabId = Content.TabId
  self.EventId = Content.EventId
  self.IsTabSelected = Content.IsSelected
  self.IsPlayClick = false
  self.bLimit = Content.bLimit
  self.VirtualClickCallback = Content.VirtualClickCallback
  if Content.ClickCallback then
    self:BindEventOnSwitchOn(Content.ParentWidget, Content.ClickCallback)
  end
  self:InitListItemView(Content)
  ActivityReddotHelper.AddReddotListenByTabId(self.TabId, {
    Obj = self,
    Func = function(self, Count, RdType)
      if 0 == Count then
        self:RefreshReddot(false, nil, nil)
        return
      end
      if RdType == EReddotType.New then
        self:RefreshReddot(true, nil, nil)
      elseif RdType == EReddotType.Normal then
        self:RefreshReddot(false, true, nil)
      end
    end
  })
  if self.Content.TabIconPath then
    local IconObj = LoadObject(self.Content.TabIconPath)
    self.Image_SelectSign:SetBrushFromTexture(IconObj)
  end
  self:SetNavigationRuleCustom(EUINavigation.Right, {
    self,
    self.OnSubTabNavigationRight
  })
  if self.Content.Index == nil then
    self.WS_Tab:SetActiveWidgetIndex(1)
  else
    self.WS_Tab:SetActiveWidgetIndex(0)
  end
  self.bMobile = CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile"
end

function M:OnSubTabNavigationRight()
  local ActivityPage = self.Content.ParentWidget.AllCurrentActivityPage[self.TabId]
  if ActivityPage and ActivityPage.OnSubTabNavigationRight then
    ActivityPage:OnSubTabNavigationRight()
  end
end

function M:InitListItemView(Content)
  local Avatar = GWorld:GetAvatar()
  self.Text_Title:SetText(Content.Name)
  self.Text_Title_Select:SetText(Content.Name)
  UE.UResourceLibrary.LoadObjectAsync(self, Content.BgPath, {
    self,
    function(self, IconObj)
      local TabIconMat = self.Image_SelectTabIcon:GetDynamicMaterial()
      TabIconMat:SetTextureParameterValue("MainTex", IconObj)
    end
  })
  UE.UResourceLibrary.LoadObjectAsync(self, Content.BgPath, {
    self,
    function(self, IconObj)
      local TabIconMat = self.Image_NormalTabIcon:GetDynamicMaterial()
      TabIconMat:SetTextureParameterValue("IconMap", IconObj)
    end
  })
  self:RefreshReddot(Content.IsNew, Content.ShowRedDot)
  self:UpdateIsSelected()
  if not Avatar then
    return
  end
  if self.EventId and self.EventId[1] and Avatar.CompletedActivity[self.EventId[1]] then
    self.Group_Done:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.IsDone = true
  else
    self.Group_Done:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.IsDone = false
  end
end

function M:BP_OnEntryReleased()
  if self.Content then
    self.Content.UI = nil
    if self.TabId then
      ActivityReddotHelper.RemoveReddotListenByTabId(self.TabId, self)
    end
  end
end

function M:GetTabId()
  return self.TabId
end

function M:GetTabIndex()
  return self.Index
end

function M:SetIsSelected(IsSelected)
  self.IsTabSelected = IsSelected
  self:UpdateIsSelected()
  if self.Content then
    self.Content.IsSelected = IsSelected
  end
end

function M:UpdateIsSelected()
  if self.IsTabSelected then
    if self.IsPlayClick == false then
      self:PlayAnimation(self.Click)
      self.IsPlayClick = true
    end
    if self.EventSwitchOn then
      self.EventSwitchOn(self.ObjSwitchOn, self)
    end
  else
    self.IsPlayClick = false
    if self:IsAnimationPlaying(self.Click) then
      self:StopAnimation(self.Click)
    end
    self:PlayAnimation(self.Normal)
    if self.EventSwitchOff then
      self.EventSwitchOff(self.ObjSwitchOff, self)
    end
  end
end

function M:Btn_Click()
  if self.IsTabSelected then
    if type(self.VirtualClickCallback) == "function" then
      self.VirtualClickCallback(self.ObjSwitchOn, self)
    end
    return
  end
  local NewSelected = not self.IsTabSelected
  self:SetIsSelected(NewSelected)
  AudioManager(self):PlayUISound(self, "event:/ui/activity/large_btn_click", nil, nil)
end

function M:Btn_Press()
  if self.IsTabSelected then
    return
  end
  if self:IsAnimationPlaying(self.Press) then
    return
  end
  self:PlayAnimation(self.Press)
  if self.bMobile then
    self:BindToAnimationFinished(self.Press, {
      self,
      function()
        if self.IsTabSelected then
          return
        end
        self:PlayAnimation(self.Normal)
      end
    })
  end
end

function M:Btn_Hover()
  if self.IsTabSelected or self.bMobile then
    return
  end
  self:PlayAnimation(self.Hover)
  if self.EventHoverOnOrOff then
    self.EventHoverOnOrOff(self.ObjHoverOnOrOff, self, true)
  end
end

function M:Btn_UnHover()
  if self.IsTabSelected or self.bMobile then
    return
  end
  if self:IsAnimationPlaying(self.Hover) then
    self:StopAnimation(self.Hover)
  end
  self:PlayAnimation(self.UnHover)
  if self.EventHoverOnOrOff then
    self.EventHoverOnOrOff(self.ObjHoverOnOrOff, self, false)
  end
end

function M:BindEventOnSwitchOn(Obj, Event)
  self.ObjSwitchOn = Obj
  self.EventSwitchOn = Event
end

function M:UnbindEventOnSwitchOn()
  self.ObjSwitchOn = nil
  self.EventSwitchOn = nil
end

function M:BindEventOnSwitchOff(Obj, Event)
  self.ObjSwitchOff = Obj
  self.EventSwitchOff = Event
end

function M:UnbindEventOnSwitchOff()
  self.ObjSwitchOff = nil
  self.EventSwitchOff = nil
end

function M:RefreshReddot(IsNew, Upgradeable, OtherReddot)
  self.IsNew = IsNew
  self.Upgradeable = Upgradeable
  self.OtherReddot = OtherReddot
  if IsNew then
    self.New:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
    return
  end
  self.New:SetVisibility(UIConst.VisibilityOp.Collapsed)
  if not self.Reddot then
    return
  end
  if OtherReddot then
    self.Reddot:SetReddotStyle(1)
    self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  elseif Upgradeable then
    self.Reddot:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Content.IsNew = IsNew
  if Upgradeable or OtherReddot then
    self.Content.ShowRedDot = true
  else
    self.Content.ShowRedDot = false
  end
  self:AddDelayFrameFunc(function()
    if self.Content and self.Content.ParentWidget and self.Content.ParentWidget.EventTypeTab then
      self.Content.ParentWidget.EventTypeTab:UpdateEventTypeTabReddot()
    end
  end, 2)
end

return M
