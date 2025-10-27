require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})

function M:Construct()
  self:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.Btn_Area.bIsFocusable = false
  rawset(self, "IsInFocusPath", false)
  rawset(self, "bHideGamepadKey", false)
  rawset(self, "GameInputModeSubsystem", UGameInputModeSubsystem.GetGameInputModeSubsystem(self))
  if rawget(self, "GameInputModeSubsystem") then
    self.GameInputModeSubsystem.OnInputMethodChanged:Add(self, self.RefreshOpInfoByInputDevice)
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  rawset(self, "IsGamepadInput", CurInputDevice == ECommonInputType.Gamepad)
  self:OnFocusChanged()
end

function M:OnFocusChanged()
  if self.IsInFocusPath or self.bHideGamepadKey or not self.IsGamepadInput then
    self.Key_Consume:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_Unlock:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Spacer1:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Key_Consume:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Key_Unlock:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Spacer1:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:Destruct()
  if IsValid(self.GameInputModeSubsystem) then
    self.GameInputModeSubsystem.OnInputMethodChanged:Remove(self, self.RefreshOpInfoByInputDevice)
  end
end

function M:HideGamepadKey(bHide)
  self.bHideGamepadKey = bHide
end

function M:Init(Params)
  self.Owner = Params.Owner
  self._OnClicked = Params.OnClicked
  self._OnAddedToFocusPath = Params.OnAddedToFocusPath
  self._OnRemovedFromFocusPath = Params.OnRemovedFromFocusPath
  local Resource1 = Params.Resources[1] or {}
  if Resource1 then
    self.Icon_Piece:Init(Resource1)
    if Resource1.bShowNeedCount then
      self.Num_Hold:SetText(Resource1.NeedCount)
    else
      self.Num_Hold:SetText(Resource1.Count)
    end
  end
  local Resource2 = Params.Resources[2]
  if Resource2 and Resource2.NeedCount then
    self.Num_Hold:SetColorAndOpacity(self.Color_Normal)
  elseif Resource1 and Resource1.Count < Resource1.NeedCount then
    self.Num_Hold:SetColorAndOpacity(self.Color_NotEnough)
  else
    self.Num_Hold:SetColorAndOpacity(self.Color_Normal)
  end
  if Resource2 and Resource2.NeedCount > 0 then
    self.Com_ItemIcon_1:Init(Resource2)
    self.Num_Extra:SetText(Resource2.NeedCount)
    if Resource2.Count < Resource2.NeedCount then
      self.Num_Extra:SetColorAndOpacity(self.Color_NotEnough)
    else
      self.Num_Extra:SetColorAndOpacity(self.Color_Normal)
    end
    self.Add:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Num_Extra:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Com_ItemIcon_1:SetVisibility(UIConst.VisibilityOp.Visible)
  else
    self.Add:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Com_ItemIcon_1:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Num_Extra:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self.Key_Consume:CreateCommonKey(Params.ResourceKeyInfos)
  self.Key_Unlock:CreateCommonKey(Params.KeyInfos)
  self.Text_Unlock:SetText(Params.Text)
  if Params.ShowReddot then
    self.Reddot:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self.Reddot:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
  self:UpdateNavigationRules()
end

function M:OnClicked()
  AudioManager(self):PlayUISound(self, "event:/ui/activity/large_btn_click", nil, nil)
  if self._OnClicked then
    self._OnClicked(self.Owner)
  end
end

function M:UpdateNavigationRules()
  self.Icon_Piece:SetNavigationRuleExplicit(EUINavigation.Right, self.Com_ItemIcon_1)
  self.Com_ItemIcon_1:SetNavigationRuleExplicit(EUINavigation.Left, self.Icon_Piece)
end

function M:OnAddedToFocusPath()
  self.IsInFocusPath = true
  self:OnFocusChanged()
  if self._OnAddedToFocusPath then
    self._OnAddedToFocusPath(self.Owner, self)
  end
end

function M:OnRemovedFromFocusPath()
  self.IsInFocusPath = false
  self:OnFocusChanged()
  if self._OnRemovedFromFocusPath then
    self._OnRemovedFromFocusPath(self.Owner, self)
  end
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.Icon_Piece)
end

return M
