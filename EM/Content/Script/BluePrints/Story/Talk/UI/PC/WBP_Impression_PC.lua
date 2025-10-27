local MiscUtils = require("Utils.MiscUtils")
local EImpressionButtonState = require("BluePrints.UI.UI_PC.Impression.ImpressionConst").EImpressionButtonState
local Scroll_Mouse = MiscUtils.LazyLoadObject("/Game/UI/Texture/Dynamic/Atlas/Key/PC/T_Key_MouseScroll.T_Key_MouseScroll")
local Scroll_Xbox = MiscUtils.LazyLoadObject("/Game/UI/Texture/Dynamic/Atlas/Key/XBOX/T_Key_LV.T_Key_LV")
local Scroll_PS = MiscUtils.LazyLoadObject("/Game/UI/Texture/Dynamic/Atlas/Key/PS5/T_Key_LV.T_Key_LV")
local ImpressionItemNum = 5
require("UnLua")
local ETalkOptionType = require("BluePrints.Story.Talk.Model.TalkOptionData").ETalkOptionType
local WBP_Impression_PC = Class("BluePrints.Story.Talk.UI.Common.WBP_Impression_Common")
WBP_Impression_PC._components = {
  "BluePrints.UI.UI_PC.Common.LSFocusComp"
}

function WBP_Impression_PC:InitImpressionUI()
  WBP_Impression_PC.Super.InitImpressionUI(self)
  self:InitKeyInfo()
  self:RefreshBaseInfo()
  self:AddLSFocusTarget(self.Btn_DimensionDrawArea.Key_Dimension, self.Btn_DimensionDrawArea, "Menu", true)
  self:AddLSFocusTarget(self.Com_Cost.Key, self.Com_Cost, "RS", true)
end

function WBP_Impression_PC:InitKeyInfo()
  self.Key_PickUp:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText(CommonUtils:GetActionMappingKeyName("Interactive"))
      }
    }
  })
  self.Key_Controller:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "A"}
    }
  })
  if self.KeyNode then
    self.KeyNode:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Impression_PC:OnOptionInAnimationStarted()
  WBP_Impression_PC.Super.OnOptionInAnimationStarted(self)
  local LastItem
  self.Button_Area:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.Button_Area:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  for i = 1, ImpressionItemNum do
    local ImpressionItem = self:GetImpressionItem(i)
    if ImpressionItem and ImpressionItem.State ~= EImpressionButtonState.None then
      if LastItem then
        LastItem:SetNavigationRuleExplicit(EUINavigation.Down, ImpressionItem)
        ImpressionItem:SetNavigationRuleExplicit(EUINavigation.Up, LastItem)
      end
      self.Button_Area:SetNavigationRuleExplicit(EUINavigation.Up, ImpressionItem)
      ImpressionItem:SetNavigationRuleExplicit(EUINavigation.Down, self.Button_Area)
      LastItem = ImpressionItem
    end
  end
end

function WBP_Impression_PC:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  if not self.SelectImpressionItemIndex then
    return UIUtils.Unhandled
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if "Gamepad_LeftX" == InKeyName then
    self.MoveDeltaX = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
  elseif "Gamepad_LeftY" == InKeyName then
    self.MoveDeltaY = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
  end
  local InKeyName
  if self.MoveDeltaY and 0 ~= self.MoveDeltaY then
    if self.MoveDeltaY > 0.5 then
      InKeyName = "Gamepad_LeftStick_Up"
    elseif self.MoveDeltaY < -0.5 then
      InKeyName = "Gamepad_LeftStick_Down"
    end
  end
  if "Gamepad_LeftStick_Up" == InKeyName then
    if self.CdTimer then
      return UIUtils.Unhandled
    else
      self:CreateCDTimer()
    end
    self:OnUpSelectItem()
  elseif "Gamepad_LeftStick_Down" == InKeyName then
    if self.CdTimer then
      return UIUtils.Unhandled
    else
      self:CreateCDTimer()
    end
    self:OnDownSelectItem()
  end
  return UIUtils.Handled
end

function WBP_Impression_PC:CreateCDTimer()
  self.CdTimer = self:AddTimer(0.2, function()
    self.CdTimer = nil
  end, nil, nil, nil, true)
end

function WBP_Impression_PC:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if not self.SelectImpressionItemIndex then
    return UIUtils.Unhandled
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local Handled = true
  if "Gamepad_DPad_Up" == InKeyName then
    self:OnUpSelectItem()
  elseif "Gamepad_DPad_Down" == InKeyName then
    self:OnDownSelectItem()
  end
  return UIUtils.Unhandled
end

function WBP_Impression_PC:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self:IsTipsOpen() and InKey.KeyName == "Gamepad_FaceButton_Right" then
    self:SetFocus()
    return UIUtils.Handled
  end
  return WBP_Impression_PC.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
end

function WBP_Impression_PC:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsHandled = false
  IsHandled = self:OnKeyDownForLSComp(MyGeometry, InKeyEvent)
  if IsHandled then
    return UIUtils.Handled
  end
  return WBP_Impression_PC.Super.OnKeyUp(self, MyGeometry, InKeyEvent)
end

function WBP_Impression_PC:OnImpressionItemPressed()
  if self:IsTipsOpen() then
    return
  end
  WBP_Impression_PC.Super.OnImpressionItemPressed(self)
end

function WBP_Impression_PC:OnImpressionItemReleased()
  if self:IsTipsOpen() then
    return
  end
  WBP_Impression_PC.Super.OnImpressionItemReleased(self)
end

function WBP_Impression_PC:OnReviewButtonClicked()
  if self:IsTipsOpen() then
    return
  end
  WBP_Impression_PC.Super.OnReviewButtonClicked(self)
end

function WBP_Impression_PC:OnWikiButtonClicked()
  if self:IsTipsOpen() then
    return
  end
  WBP_Impression_PC.Super.OnWikiButtonClicked(self)
end

function WBP_Impression_PC:IsTipsOpen()
  return self.Com_Cost:HasFocusedDescendants() or self.Com_Cost:HasAnyUserFocus()
end

function WBP_Impression_PC:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  DebugPrint("WBP_Impression_PC:RefreshOpInfoByInputDevice", CurInputDevice, CurGamepadName)
  local IsGamePad = CurInputDevice == ECommonInputType.Gamepad
  self.IsGamePad = IsGamePad
  for i = 1, ImpressionItemNum do
    local ImpressionItem = self:GetImpressionItem(i)
    if ImpressionItem then
      ImpressionItem:UpdateKeyImg(IsGamePad)
    end
  end
  if IsGamePad then
    if not self:HasFocusedDescendants() or self:HasAnyUserFocus() then
      self:SetFocus()
    end
    if "XBOX" == CurGamepadName then
      self.Img_Mouse:SetBrushResourceObject(Scroll_Xbox:get())
    else
      self.Img_Mouse:SetBrushResourceObject(Scroll_PS:get())
    end
    self.WS_Node:SetActiveWidgetIndex(1)
  else
    self.Img_Mouse:SetBrushResourceObject(Scroll_Mouse:get())
    self.WS_Node:SetActiveWidgetIndex(0)
  end
  self.WBP_Story_PlayKey_P:UpdateKeyImg(IsGamePad)
end

function WBP_Impression_PC:ClearOptions()
  WBP_Impression_PC.Super.ClearOptions(self)
  self:RefreshBaseInfo()
end

function WBP_Impression_PC:AdaptPlatform()
  self.Img_Mouse:SetVisibility(ESlateVisibility.HitTestInvisible)
end

function WBP_Impression_PC:OnExitButtonSelectedPlatform(bIsSelect)
  if bIsSelect then
    self.KeyNode:SetVisibility(ESlateVisibility.HitTestInvisible)
  else
    self.KeyNode:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function WBP_Impression_PC:OnExitButtonReleasedByPlatform()
  if self:IsExitButtonSelect() then
    self:PlayAnimation(self.BtnQuit_Hover, 0, 1)
  end
end

function WBP_Impression_PC:PlayExitButtonHoveredPerformanceByPlatform()
  self:StopAnimation(self.BtnQuit_UnHover)
  self:PlayAnimation(self.BtnQuit_Hover, 0, 1)
end

function WBP_Impression_PC:PlayExitButtonUnhoveredPerformanceByPlatform()
  self:StopAnimation(self.BtnQuit_Hover)
  self:PlayAnimation(self.BtnQuit_UnHover)
end

function WBP_Impression_PC:InitPlayKey()
  self.WBP_Story_PlayKey_P:Init(self.IsGamePad)
end

function WBP_Impression_PC:InitAutoPlay()
end

function WBP_Impression_PC:ChangeImgMouseVisibility(OptionData)
  if OptionData.OptionType == ETalkOptionType.Check then
    self.Img_Mouse:SetVisibility(ESlateVisibility.HitTestInvisible)
    return
  end
  if self.OptionMaxNum >= 2 then
    self.Img_Mouse:SetVisibility(ESlateVisibility.HitTestInvisible)
    return
  end
  self.Img_Mouse:SetVisibility(ESlateVisibility.Collapsed)
end

function WBP_Impression_PC:PreExitTalkTask(TalkTask, TalkData, OnPreExitTalkTaskFinished, OutType, OutTime)
  WBP_Impression_PC.Super.PreExitTalkTask(self, TalkTask, TalkData, OnPreExitTalkTaskFinished, OutType, OutTime)
  self:RemoveFocusTarget("Menu")
end

AssembleComponents(WBP_Impression_PC)
return WBP_Impression_PC
