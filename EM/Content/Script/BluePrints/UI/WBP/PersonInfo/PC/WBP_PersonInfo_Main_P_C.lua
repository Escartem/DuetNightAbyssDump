require("UnLua")
local PersonInfoModel = require("BluePrints.UI.WBP.PersonInfo.PersonInfoModel")
local PersonInfoCommon = require("BluePrints.UI.WBP.PersonInfo.PersonInfoCommon")
local M = Class({
  "BluePrints.Common.TimerMgr",
  "BluePrints.UI.BP_EMUserWidget_C"
})
M._components = {
  "BluePrints.UI.WBP.PersonInfo.Base.PersonInfoMainPageView"
}

function M:Construct()
  self.IsPC = true
  self:InitBaseView()
  self.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Ls"}
    }
  })
  self.Key_ControllerImg:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "View"}
    }
  })
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    if self.IsEditOpen then
      self:OnClickEdit()
      if self.RootPage and self.IsEditOpen == false then
        ScreenPrint("\232\191\148\229\155\158\233\148\174\229\133\179\233\151\173List")
        self:FreshFocusLeaveEditListView()
        if not self.RootPage:FocusToSavedWidget() then
          self:SetOriginFocus()
        end
      end
      IsEventHandled = true
    end
  else
    IsEventHandled = false
  end
  return IsEventHandled
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    self.IsGamePad = true
    IsEventHandled = self:OnGamePadDown(InKeyName)
  elseif "Escape" == InKeyName and self.IsEditOpen then
    self.IsEditOpen = false
    self:PlayAnimation(self.Edit_List_Out)
    IsEventHandled = true
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:FreshFocusOnEditListView()
  DebugPrint("FreshFocusOnEditListView")
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad or not self.Panel_Edit:HasFocusedDescendants() then
    return
  end
  self.Key_ControllerImg:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Key_Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Btn_EditShow:SetGamepadIconVisibility(false)
end

function M:FreshFocusLeaveEditListView()
  DebugPrint("FreshFocusLeaveEditListView")
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad or self.IsEditOpen == true then
    return
  end
  self.Key_ControllerImg:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Key_Controller:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Btn_EditShow:SetGamepadIconVisibility(true)
end

function M:InitPage(Data)
  self:RefreshPageView(Data)
end

function M:FocusA()
  self.AvatarItem_1:setFocus()
end

function M:OnClickChangeSelectChar()
  self:SetIsDealWithVirtualAccept(true)
  if self.CurInputDeviceType ~= ECommonInputType.Gamepad then
    self:SetIsDealWithVirtualAccept(true)
  end
end

function M:OnClickChangeSelectWeapon()
  self:SetIsDealWithVirtualAccept(true)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:SetIsDealWithVirtualAccept(true)
  end
end

AssembleComponents(M)
return M
