require("UnLua")
local MonthCardModel = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardModel")
local MonthCardCommon = require("BluePrints.UI.WBP.Perk.MonthCard.MonthCardCommon")
local M = Class({
  "BluePrints.UI.WBP.Perk.MonthCard.View.MonthCardBaseView"
})

function M:Construct()
  self:InitBaseView()
  self.Key_ControllerBuy:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
  self.Key_ControllerCardInfo:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "View"}
    }
  })
  self.Key_ControllerCardRefresh:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Menu"}
    }
  })
end

function M:InitBannerPage(BannerId)
  self.BannerId = BannerId
  self:StopAllAnimations()
  self:PlayAnimation(self.In)
  AudioManager(self):PlayUISound(self, "event:/ui/common/shop_gift_pack_page_in", nil, nil)
  self:RefreshPageView()
end

function M:Close()
  self:PlayAnimation(self.Out)
  M.Super.Close(self)
  self:OnViewClose()
end

function M:RefreshOpInfoByInputDevice(CurInputType, CurGamepadName)
  M.Super.RefreshOpInfoByInputDevice(self, CurInputType, CurGamepadName)
  self:UpdateFocus()
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  M.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputType, CurGamepadName)
  self:UpdateGamePadIcon(CurInputType)
end

function M:GetKeyNameFromEvent(InKeyEvent)
  if type(InKeyEvent) == "string" then
    return InKeyEvent
  elseif UE4 and UE4.UKismetInputLibrary and UE4.UFormulaFunctionLibrary and InKeyEvent then
    local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
    return UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  end
  return nil
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKeyName = self:GetKeyNameFromEvent(InKeyEvent)
  if type(InKeyEvent) == "string" then
    return UIUtils.UnHandled
  else
    return M.Super.OnPreviewKeyDown(self, MyGeometry, InKeyEvent)
  end
end

function M:ReturnDefaultFocus()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKeyName = self:GetKeyNameFromEvent(InKeyEvent)
  
  function SetFocusToListItem(OwnerWidget, bIsOpen)
    if not bIsOpen and self.ListItem then
      self.ListItem:SetFocus()
    end
  end
  
  if InKeyName == Const.GamepadSpecialRight then
    if not self.Btn_CardRefresh.Tips_MenuAnchor:IsOpen() then
      self.Btn_CardRefresh.OnMenuOpenChangedCallBack = SetFocusToListItem
      self.Btn_CardRefresh:OnViewInfoClick(true)
      self.Btn_CardRefresh.Btn_Click:SetChecked(true)
    end
    return UIUtils.Handled
  elseif InKeyName == Const.GamepadSpecialLeft then
    if not self.Btn_Info.Tips_MenuAnchor:IsOpen() then
      self.Btn_Info.OnMenuOpenChangedCallBack = SetFocusToListItem
      self.Btn_Info:OnViewInfoClick(true)
      self.Btn_Info.Btn_Click:SetChecked(true)
    end
    return UIUtils.Handled
  elseif InKeyName == Const.GamepadFaceButtonRight then
    local bHandle = false
    if self.Btn_Info.Tips_MenuAnchor:IsOpen() then
      self.Btn_Info:OnViewInfoClick(false)
      bHandle = true
    end
    if self.Btn_CardRefresh.Tips_MenuAnchor:IsOpen() then
      self.Btn_CardRefresh:OnViewInfoClick(false)
      bHandle = true
    end
    if bHandle then
      self:ReturnDefaultFocus()
      return UIUtils.Handled
    end
  elseif InKeyName == Const.GamepadFaceButtonDown or "SpaceBar" == InKeyName then
    if not self.Btn_Buy:GetForbidden() then
      self:PlayAnimation(self.Btn_Click)
      self.Btn_Buy.OnClicked:Broadcast()
    end
    return UIUtils.Handled
  end
  if type(InKeyEvent) == "string" then
    return UIUtils.UnHandled
  else
    return M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
  end
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKeyName = self:GetKeyNameFromEvent(InKeyEvent)
  if type(InKeyEvent) == "string" then
    return UIUtils.UnHandled
  else
    return M.Super.OnKeyUp(self, MyGeometry, InKeyEvent)
  end
end

function M:OnAddedToFocusPath(InFocusEvent)
end

function M:OnRemovedFromFocusPath(InFocusEvent)
end

function M:UpdateFocus()
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if self:HasAnyUserFocus() or self:HasFocusedDescendants() then
    self:ReturnDefaultFocus()
  end
end

function M:UpdateGamePadIcon(CurInputType)
  if CurInputType == ECommonInputType.Gamepad then
    self.Key_ControllerBuy:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_ControllerCardInfo:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
    self.Key_ControllerCardRefresh:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.Key_ControllerBuy:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_ControllerCardInfo:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.Key_ControllerCardRefresh:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:SetListItem(ListItem)
  self.ListItem = ListItem
end

return M
