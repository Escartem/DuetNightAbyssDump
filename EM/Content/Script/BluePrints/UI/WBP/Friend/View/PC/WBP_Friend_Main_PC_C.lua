require("UnLua")
local FriendCommon = require("BluePrints.UI.WBP.Friend.FriendCommon")
local FriendController = require("BluePrints.UI.WBP.Friend.FriendController")
local M = Class("BluePrints.UI.WBP.Friend.View.Base.WBP_Friend_MainBase")

function M:Initialize()
  M.Super.Initialize(self)
  self.InputSwitch = {
    [UIConst.GamePadKey.SpecialRight] = function()
      if self._TeamHeadPanel then
        self._TeamHeadPanel:DoGamepadBtnPress()
      end
    end,
    [UIConst.GamePadKey.FaceButtonRight] = function()
      DebugPrint(LXYTag, "=====self._TeamHeadPanel.bIsFocusable", self._TeamHeadPanel.bIsFocusable)
      if self._TeamHeadPanel and self._TeamHeadPanel.bIsFocusable then
        self:SetFocus()
        self._TeamHeadPanel.bIsFocusable = false
      end
    end
  }
end

function M:OnRemovedFromFocusPath()
  if not (FriendController:IsGamepad() and self._TeamHeadPanel) or self._TeamHeadPanel:HasAnyUserFocus() then
  end
end

function M:OnKeyUp(MyGeometry, InKeyEvent)
  local ParentHandled = M.Super.OnKeyUp(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.SpecialRight and self._TeamHeadPanel then
    self._TeamHeadPanel:DoGamepadBtnRelease()
  end
  return ParentHandled
end

function M:Construct()
  M.Super.Construct(self)
  self.Button_Copy.OnClicked:Add(self, self.OnBtnCopyClicked)
  self.Button_Copy.OnHovered:Add(self, self.OnBtnCopyHover)
  self.Button_Copy.OnPressed:Add(self, self.OnBtnCopyPressed)
  self.Button_Copy.OnReleased:Add(self, self.OnBtnCopyReleased)
  self.Button_Copy.OnUnhovered:Add(self, self.OnBtnCopyUnHover)
  self.Main:ClearChildren()
  ReddotManager.AddListener(FriendCommon.ReddotName, self, function(self, Count)
    if not self.WBP_Com_Tab_P.Tabs or not next(self.WBP_Com_Tab_P.Tabs) then
      return
    end
    local ReddotType = DataMgr.ReddotNode[FriendCommon.ReddotName].Type
    local IsNew = 1 == ReddotType and Count > 0
    local Upgradeable = 0 == ReddotType and Count > 0
    self.WBP_Com_Tab_P.Tabs[1].UI:SetReddot(IsNew, Upgradeable)
  end)
  UIManager(self):GetGameInputModeSubsystem().OnInputMethodChanged:Add(self, self.OnInputDeviceChange)
  self:OnInputDeviceChange()
  self.Key_UID:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "RS"}
    }
  })
end

function M:OnInputDeviceChange()
  if not ChatController:IsGamepad() then
    self.bChatBtnListOpen = false
  end
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.Copy_UnHover then
    self:PlayAnimation(self.Copy_Normal)
  elseif InAnimation == self.Copy_Click then
    self:PlayAnimation(self.Copy_Normal)
  end
end

function M:StopCopyBtnAnim()
  self:StopAnimation(self.Copy_Click)
  self:StopAnimation(self.Copy_UnHover)
  self:StopAnimation(self.Copy_Press)
  self:StopAnimation(self.Copy_Hover)
  self:StopAnimation(self.Copy_Normal)
end

function M:OnBtnCopyHover()
  self:StopCopyBtnAnim()
  self:PlayAnimation(self.Copy_Hover)
end

function M:OnBtnCopyPressed()
  self:StopCopyBtnAnim()
  self:PlayAnimation(self.Copy_Press)
end

function M:OnBtnCopyReleased()
  self:StopCopyBtnAnim()
  self:PlayAnimation(self.Copy_Click)
end

function M:OnBtnCopyUnHover()
  self:StopCopyBtnAnim()
  self:PlayAnimation(self.Copy_UnHover)
end

function M:OnBtnCopyClicked()
  self:StopCopyBtnAnim()
  self:PlayAnimation(self.Copy_Click)
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_small", nil, nil)
  UUIFunctionLibrary.ClipboardCopy(tostring(FriendController:GetModel():GetSelfUid()))
  FriendController:ShowToast(GText("UI_Tosat_Menu_CopyUID"))
end

function M:InitUIInfo(Name, IsInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, IsInUIMode, EventList, ...)
  self.InitTabType = (...)
  if not self.InitTabType then
    self.InitTabType = FriendCommon.FriendTabType.MyFriend
  end
  
  local function CloseCb(self)
    if IsValid(self._TeamHeadPanel) and self._TeamHeadPanel.bIsFocusable then
      return
    end
    self:Close()
  end
  
  local Tabs = {}
  local Avatar = GWorld:GetAvatar()
  local IsInRegionOnline = Avatar and Avatar.IsInRegionOnline
  local CurrentOnlineType = Avatar and Avatar.CurrentOnlineType
  for Id, TabConf in pairs(DataMgr.FriendTab) do
    local IsShow = TabConf.WidgetName ~= "RegionFriend" or TabConf.WidgetName == "RegionFriend" and IsInRegionOnline and -1 ~= CurrentOnlineType
    if IsShow then
      table.insert(Tabs, {
        Text = GText(TabConf.Text),
        TabId = Id,
        IconPath = TabConf.IconPath,
        WidgetName = TabConf.WidgetName
      })
    end
  end
  table.sort(Tabs, function(a, b)
    return a.TabId < b.TabId
  end)
  self.BottomKeyInfo = {
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "View"}
      },
      Desc = GText("UI_Controller_CheckPlayer")
    },
    {
      GamePadInfoList = {
        {Type = "Img", ImgShortPath = "A"}
      },
      Desc = GText("UI_Tips_Ensure")
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = CloseCb,
          Owner = self
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = CloseCb,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    }
  }
  local TabKeyInfo = {}
  for _, KeyInfo in ipairs(self.BottomKeyInfo) do
    table.insert(TabKeyInfo, KeyInfo)
  end
  local TabInfo = {
    LeftKey = "Q",
    RightKey = "E",
    StyleName = "TextImage",
    OwnerPanel = self,
    DynamicNode = {"Back", "BottomKey"},
    BackCallback = CloseCb,
    Tabs = Tabs,
    InfoCallback = "NotShow",
    BottomKeyInfo = TabKeyInfo
  }
  self.WBP_Com_Tab_P:Init(TabInfo)
  self.WBP_Com_Tab_P:BindEventOnTabSelected(self, self.OnTabSelected)
  self:SelectTab(self.InitTabType)
  self:ShowCheckBtn(false)
end

function M:ReceiveEnterState(StackAction)
  M.Super.ReceiveEnterState(self, StackAction)
  if self._TeamHeadPanel then
    self._TeamHeadPanel:OnFocusLost()
  end
end

function M:AddTabItem(idx)
  if not self.WBP_Com_Tab_P then
    return
  end
  local BottomKeyInfo = self.WBP_Com_Tab_P.ConfigData.BottomKeyInfo
  BottomKeyInfo[idx] = self.BottomKeyInfo[idx]
end

function M:RemoveTabItem(idx)
  if not self.WBP_Com_Tab_P then
    return
  end
  local BottomKeyInfo = self.WBP_Com_Tab_P.ConfigData.BottomKeyInfo
  BottomKeyInfo[idx] = {}
end

function M:ShowPlayerInfoBtn(bShow)
  if not self.WBP_Com_Tab_P then
    return
  end
  if FriendController:IsMobile() then
    return
  end
  if bShow then
    self:AddTabItem(1)
  else
    self:RemoveTabItem(1)
  end
  self.WBP_Com_Tab_P:UpdateHotKeyInfo()
end

function M:ShowCheckBtn(bShow)
  if not self.WBP_Com_Tab_P then
    return
  end
  if FriendController:IsMobile() then
    return
  end
  if bShow then
    self:AddTabItem(2)
  else
    self:RemoveTabItem(2)
  end
  self.WBP_Com_Tab_P:UpdateHotKeyInfo()
end

function M:ShowBackBtn(bShow)
  if not self.WBP_Com_Tab_P then
    return
  end
  if ModController:IsMobile() then
    return
  end
  if bShow then
    self:AddTabItem(3)
  else
    self:RemoveTabItem(3)
  end
  self.WBP_Com_Tab_P:UpdateHotKeyInfo()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  M.Super.OnKeyDown(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if not self.bChatBtnListOpen then
    if ChatController:IsGamepad() then
      self.WBP_Com_Tab_P:Handle_KeyEventOnGamePad(InKeyName)
    else
      self.WBP_Com_Tab_P:Handle_KeyEventOnPC(InKeyName)
    end
  end
  if "Gamepad_RightThumbstick" == InKeyName then
    self:OnBtnCopyClicked()
  end
  if self.InputSwitch[InKeyName] then
    self.InputSwitch[InKeyName]()
  end
  return UIUtils.Handled
end

function M:OnTabSelected(TabWidget, TabItemInfo)
  if IsValid(self.CurrWidget) then
    self.Main:RemoveChild(self.CurrWidget)
    self.CurrWidget = nil
  end
  self.CurrWidget = self:CreateWidgetNew(TabItemInfo.WidgetName)
  self.Main:AddChild(self.CurrWidget)
  self.CurrWidget:InitWidget(self)
  if FriendController:IsGamepad() then
    self.CurrWidget:SetIsLimitNavigationInside(true)
    self.CurrWidget:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    self.CurrWidget:SetFocus()
  end
end

function M:SelectTab(TabType)
  self.WBP_Com_Tab_P:SelectTab(TabType)
end

function M:Destruct()
  self.Button_Copy.OnClicked:Remove(self, self.OnBtnCopyClicked)
  self.Button_Copy.OnHovered:Remove(self, self.OnBtnCopyHover)
  self.Button_Copy.OnPressed:Remove(self, self.OnBtnCopyPressed)
  self.Button_Copy.OnReleased:Remove(self, self.OnBtnCopyReleased)
  self.Button_Copy.OnUnhovered:Remove(self, self.OnBtnCopyUnHover)
  ReddotManager.RemoveListener(FriendCommon.ReddotName, self)
  self.Main:RemoveChild(self.CurrWidget)
  self.GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  UIManager(self):GetGameInputModeSubsystem().OnInputMethodChanged:Remove(self, self.OnInputDeviceChange)
  M.Super.Destruct(self)
end

function M:BP_GetDesiredFocusTarget()
  return self.CurrWidget or self
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputDevice, CurGamepadName)
  if CommonUtils.GetDeviceTypeByPlatformName(self) == "Mobile" then
    return
  end
  if CurInputDevice == ECommonInputType.MouseAndKeyboard then
    self.Key_UID:SetVisibility(UIConst.VisibilityOp.Collapsed)
  elseif CurInputDevice == ECommonInputType.Gamepad then
    self.Key_UID:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

return M
