require("UnLua")
local FEntertainmentUtils = require("BluePrints.UI.WBP.Entertainment.EntertainmentUtils")
local M = Class({
  "BluePrints.UI.WBP.Entertainment.WBP_Entertainment"
})
local EEntertainmentState = FEntertainmentUtils.EEntertainmentState

function M:Initialize(Initializer)
  M.Super.Initialize(self, Initializer)
end

function M:Construct()
  M.Super.Construct(self)
  self.Key_Controller01:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "X"}
    }
  })
  self.Key_Controller02:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "Y"}
    }
  })
  self.Key_GamePad:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "View"}
    },
    Desc = GText("UI_CTL_ExpandList")
  })
  self:AddInputMethodChangedListen()
  self.GetBadge:BindOnClose(self, function()
    local Widget = self:GetDesiredFocusTarget()
    Widget:SetFocus()
  end)
  self.TopicDetail:BindOnTipStateChange(self, self.HideGamePadBottomInfo)
  self:AddDispatcher(EventID.OnLevelDeliverBlackCurtainEnd, self, function()
    self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
  end)
end

function M:HideGamePadBottomInfo(bHide)
  self.bHideGamePadBottom = bHide
  self:UpdateGamePadBottomInfo()
end

function M:UpdateGamePadBottomInfo()
  if not IsValid(self.GameInputModeSubsystem) then
    return
  end
  if not self.GameInputModeSubsystem:GetCurrentInputType() == ECommonInputType.Gamepad then
    return
  end
  if not self.Tab.ConfigData then
    return
  end
  if self.bHideGamePadBottom then
    self.Tab:UpdateBottomKeyInfo({})
  else
    local BottomInfo = self:CreateBottomTab()
    self.Tab:UpdateBottomKeyInfo(BottomInfo)
  end
end

function M:Destruct()
  M.Super.Destruct(self)
end

function M:CreateBottomTab(State)
  local State = State or self.State
  if State == EEntertainmentState.Main or State == EEntertainmentState.SwitchCharacter then
    return {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_Select")
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.ExitCurrentState,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.ExitCurrentState,
            Owner = self
          }
        },
        Desc = self.TabBottomKeyDesc
      }
    }
  else
    return {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_Controller_CheckDetails")
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.ExitCurrentState,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.ExitCurrentState,
            Owner = self
          }
        },
        Desc = self.TabBottomKeyDesc
      }
    }
  end
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.Tab:Init({
    PlatformName = "PC",
    LeftKey = "NotShow",
    RightKey = "NotShow",
    Tabs = {},
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = self:CreateBottomTab(),
    StyleName = "Text",
    TitleName = self.TabTitleName,
    InfoCallback = "NotShow",
    BackCallback = self.ExitCurrentState,
    OwnerPanel = self
  })
  self:RefreshOpInfoByInputDevice(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  M.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
  self.TopicDetail:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.GetBadge:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  M.Super.OnUpdateUIStyleByInputTypeChange(self, CurInputDevice, CurGamepadName)
  self.TopicDetail:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  self.GetBadge:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(1)
    self.Key_Controller02:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  else
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
    self.Key_Controller02:SetVisibility(UIConst.VisibilityOp.Collapsed)
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if self:IsInteractionEnabled() == false then
    return
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  if not UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    return M.Super.OnPreviewKeyDown(self, MyGeometry, InKeyEvent)
  end
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.State == EEntertainmentState.Topic then
    if self.GetBadge:IsPanelOpened() then
      return UIUtils.Unhandled
    end
    if self.TopicDetail:OnGamePadKeyPreviewDown(MyGeometry, InKeyEvent) then
      return UIUtils.Handled
    end
  end
  return M.Super.OnPreviewKeyDown(self, MyGeometry, InKeyEvent)
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if self:IsInteractionEnabled() == false then
    return
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  if not UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    return M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
  end
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  DebugPrint("@@@ OnKeyDown", InKeyName)
  if self.HandleKeyDown then
    return UIUtils.Unhandled
  end
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    self.HandleKeyDown = true
    self:ExitCurrentState()
    return UIUtils.Handled
  end
  if self.State == EEntertainmentState.Topic then
    if self.GetBadge:IsPanelOpened() then
      if self.GetBadge:OnGamePadKeyDown(MyGeometry, InKeyEvent) then
        return UIUtils.Handled
      end
      return UIUtils.Unhandled
    end
    if self.TopicDetail:OnGamePadKeyDown(MyGeometry, InKeyEvent) then
      return UIUtils.Handled
    end
    if self.Tab:Handle_KeyEventOnGamePad(InKeyName) then
      return UIUtils.Handled
    end
    return UIUtils.Unhandled
  end
  if self.Tab:Handle_KeyEventOnGamePad(InKeyName) then
    return UIUtils.Handled
  end
  if self.State == EEntertainmentState.SwitchCharacter and self.SwitchCharacter:OnGamePadKeyDown(MyGeometry, InKeyEvent) then
    return UIUtils.Handled
  end
  if self.State == EEntertainmentState.Main and InKeyName == UIConst.GamePadKey.SpecialLeft then
    self.Btn_Selective:OnBtnPressed()
    return UIUtils.Handled
  end
  if InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    return UIUtils.Handled
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    self.Btn02:HandleOnButtonPressed()
    return UIUtils.Handled
  end
  return M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.FaceButtonRight then
    self.HandleKeyDown = false
  end
  if false == self:IsInteractionEnabled() then
    return
  end
  if not UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    return M.Super.OnKeyUp(self, MyGeometry, InKeyEvent)
  end
  if self.State == EEntertainmentState.Topic then
    if self.GetBadge:IsPanelOpened() then
      return UIUtils.Unhandled
    end
    if self.TopicDetail:OnGamePadKeyUp(MyGeometry, InKeyEvent) then
      return UIUtils.Handled
    end
    return UIUtils.Unhandled
  end
  if self.State == EEntertainmentState.Main and InKeyName == UIConst.GamePadKey.SpecialLeft then
    self.Btn_Selective:OnBtnReleased()
    self.Btn_Selective:OnBtnClicked()
    return UIUtils.Handled
  end
  if InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    return UIUtils.Handled
  elseif InKeyName == UIConst.GamePadKey.FaceButtonTop then
    self.Btn02:HandleOnButtonReleased()
    self.Btn02:HandleOnButtonClicked()
    return UIUtils.Handled
  end
  return M.Super.OnKeyUp(self, MyGeometry, InKeyEvent)
end

function M:BP_GetDesiredFocusTarget()
  if self.GetBadge:IsPanelOpened() then
    return self.GetBadge
  elseif self.State == EEntertainmentState.SwitchCharacter then
    return self.SwitchCharacter
  elseif self.State == EEntertainmentState.Topic then
    return self.TopicDetail
  end
  return self.EMListView_Role
end

function M:SetState(State)
  M.Super.SetState(self, State)
  self:UpdateGamePadBottomInfo()
end

return M
