require("UnLua")
local EMCache = require("EMCache.EMCache")
local WBP_Setting_PC_C = Class({
  "Blueprints.UI.BP_UIState_C"
})
local Rule = FSlateChildSize()
Rule.SizeRule = UE.ESlateSizeRule.Fill
Rule.Value = 1.0

function WBP_Setting_PC_C:Initialize(Initializer)
  self.NpcId = 900003
  self.IsNeedPlayNpcAnim = true
end

function WBP_Setting_PC_C:Construct()
  WBP_Setting_PC_C.Super.Construct(self)
  self.GameInputModeSubsystem = UIManager(self):GetGameInputModeSubsystem()
end

function WBP_Setting_PC_C:OnLoaded(...)
  self.Super.OnLoaded(self, ...)
  self.IsInLoginMainPage, self.LastSystem = ...
  rawset(self, "SettingUIs", {})
  rawset(self, "HoverContentList", {})
  rawset(self, "Platform", CommonUtils.GetDeviceTypeByPlatformName(self))
  rawset(self, "IsUnfoldListOpen", false)
  rawset(self, "AutoClose", false)
  rawset(self, "IsInFullScreenMode", true)
  rawset(self, "ScreenSize", FVector2D(1920, 1080))
  self:PlayInAnim()
  self.ScrollBox_Option:ClearChildren()
  self:InitSettingParameter()
  self:InitCommonTab(1, false)
  self:AddTimer(0.033, self.ListenScreenResolution, true, 0.0, "ListenScreenResolution", true)
  if not self.IsInLoginMainPage then
    UIManager(self):SwitchUINpcCamera(true, "Setting", self.NpcId, {
      IsHaveInOutAnim = self.IsNeedPlayNpcAnim
    })
  end
  self:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType(), UIUtils.UtilsGetCurrentGamepadName())
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:FocusToOptionFirstWidget()
  end
end

function WBP_Setting_PC_C:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Gamepad then
    self:RefreshAllGamePadOperator(self.OptionUnfold_Prefrence.NowOptionId)
  end
  if self.CurInputDeviceType == CurInputDevice then
    return
  end
  self.CurInputDeviceType = CurInputDevice
  self:UpdateUIStyleInPlatform(self.CurInputDeviceType == ECommonInputType.Gamepad)
end

function WBP_Setting_PC_C:UpdateUIStyleInPlatform(IsUseGamePad)
  if self.Com_KeyImg_L then
    self.Com_KeyImg_L:SetVisibility(IsUseGamePad and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
    self.Com_KeyImg_R:SetVisibility(IsUseGamePad and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
    self.Image_83:SetVisibility(IsUseGamePad and UE4.ESlateVisibility.SelfHitTestInvisible or UE4.ESlateVisibility.Collapsed)
  end
  if IsUseGamePad then
    self:InitGamepadView()
  elseif UIUtils.IsMobileInput() then
    self:InitMobileView()
  else
    self:InitKeyboardView()
  end
end

function WBP_Setting_PC_C:InitGamepadView()
  self.ScrollBox_Option:SetScrollWhenFocusChanges(UE4.EScrollWhenFocusChanges.AnimatedScroll)
  if self:HasAnyFocus() then
    self:FocusToOptionFirstWidget()
  end
end

function WBP_Setting_PC_C:UpdateKeyboardBottonKey()
  local Params = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "R",
          ClickCallback = self.OnPressR,
          Owner = self
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "X",
          ClickCallback = self.OnPressR,
          Owner = self
        }
      },
      Desc = GText("UI_OPTION_DEFAULT")
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.OnPressESC,
          Owner = self
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = self.OnPressESC,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    }
  }
  if self.HasBeenChanged then
    table.insert(Params, 1, {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Y",
          ClickCallback = self.OnPressY,
          Owner = self
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Y",
          ClickCallback = self.OnPressY,
          Owner = self
        }
      },
      Desc = GText("UI_ACCEPT")
    })
  end
  if not UIUtils.IsMobileInput() then
    self.Tab_Set:UpdateBottomKeyInfo(Params)
  end
end

function WBP_Setting_PC_C:InitMobileView()
end

function WBP_Setting_PC_C:InitKeyboardView()
  self.ScrollBox_Option:SetScrollWhenFocusChanges(UE4.EScrollWhenFocusChanges.NoScroll)
  self:UpdateKeyboardBottonKey()
end

function WBP_Setting_PC_C:OnSettingUINavigateUp(Widget, Index)
  local NextWidget = self.SettingUIs[self.CurrentTab][Index - 1]
  if NextWidget then
    return NextWidget:GetLastWidgetToNavigate()
  end
  return nil
end

function WBP_Setting_PC_C:OnSettingUINavigateDown(Widget, Index)
  local NextWidget = self.SettingUIs[self.CurrentTab][Index + 1]
  if NextWidget then
    return NextWidget:GetFirstWidgetToNavigate()
  end
  return nil
end

function WBP_Setting_PC_C:FocusToOptionFirstWidget()
  if not self.CurrentTab then
    return
  end
  if 1 == self.CurrentTab and 2 == self.MultiPlateIndex and not self.IsInLoginMainPage then
    if self.OptionUnfold_Prefrence then
      self:AddDelayFrameFunc(function()
        self.OptionUnfold_Prefrence:SetFocus()
      end, 1)
    end
    return
  end
  local FirstPanel = self.SettingUIs[self.CurrentTab][1]
  if FirstPanel then
    local FirstWidget = FirstPanel:GetFirstWidgetToNavigate()
    FirstWidget:SetFocus()
  else
    self:SetFocus()
  end
end

function WBP_Setting_PC_C:OnGamepadFocusPanelTitle()
  self:UpdateBottomKey({
    {
      UIConst.GamePadImgKey.FaceButtonBottom,
      GText("UI_CTL_Squad_Expand")
    },
    {
      UIConst.GamePadImgKey.FaceButtonRight,
      GText("UI_BACK")
    }
  })
end

function WBP_Setting_PC_C:UpdateBottomKey(Params)
  if UIUtils.IsGamepadInput() then
    local FinalParams = {}
    if self.HasBeenChanged then
      table.insert(FinalParams, {
        UIConst.GamePadImgKey.FaceButtonTop,
        GText("UI_ACCEPT")
      })
    end
    table.insert(FinalParams, {
      UIConst.GamePadImgKey.FaceButtonLeft,
      GText("UI_OPTION_DEFAULT")
    })
    for i, Param in ipairs(Params) do
      table.insert(FinalParams, Param)
    end
    self.Tab_Set:UpdateBottomKeyInfo_Quick(FinalParams)
  end
end

function WBP_Setting_PC_C:SetFocus_Lua()
  if self.CurInputDeviceType and self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:AddDelayFrameFunc(function()
      self:FocusToOptionFirstWidget()
    end, 1)
    return
  end
end

function WBP_Setting_PC_C:ListenScreenResolution()
  local ScreenSize = FVector2D(0, 0)
  UE4.UWidgetLayoutLibrary.GetViewportSize(self, ScreenSize)
  if self.ScreenSize ~= ScreenSize then
    self.ScreenSize = ScreenSize
    if self.IsUnfoldListOpen then
      self.WBP_Set_UnfoldList:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
    self:OnClickAllLeftMouseButton()
  end
end

function WBP_Setting_PC_C:InitSettingParameter()
  self.HasBeenChanged = false
end

function WBP_Setting_PC_C:InitCommonTab(TabId, DontPlayInAnim)
  self:InitCommonTabInfo()
  if self.Platform == "PC" then
    self.Tab_Set:Init({
      LeftKey = "Q",
      RightKey = "E",
      Tabs = self.CommonTabInfo,
      DynamicNode = {"Back", "BottomKey"},
      BottomKeyInfo = {},
      TitleName = GText("UI_Esc_CommonSet"),
      StyleName = "Text",
      OwnerPanel = self,
      BackCallback = self.OnPressESC
    }, DontPlayInAnim)
    self:UpdateKeyboardBottonKey()
  else
    self.Tab_Set:Init({
      Tabs = self.CommonTabInfo,
      DynamicNode = {"Back"},
      TitleName = GText("UI_Esc_CommonSet"),
      StyleName = "Text",
      OwnerPanel = self,
      BackCallback = self.OnPressESC
    }, DontPlayInAnim)
    self.Btn_Default:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Btn_Default:BindEventOnClicked(self, self.OnPressR)
  end
  if self.Tab_MultiPlate then
    self.Tab_MultiPlate:Init({
      LeftKey = "A",
      RightKey = "D",
      Tabs = {
        {
          Text = GText("UI_OPTION_Keyboard"),
          TabId = 1
        },
        {
          Text = GText("UI_OPTION_Gamepad"),
          TabId = 2
        }
      }
    })
  end
  self.MultiPlateIndex = UIUtils.IsGamepadInput() and 2 or 1
  self.Tab_Set:BindEventOnTabSelected(self, self.OnTabSelected)
  self.Tab_Set:SelectTab(TabId)
  if self.Tab_MultiPlate then
    self.Tab_MultiPlate:BindEventOnTabSelected(self, self.OnMultiPlateTabSelected)
    self.Tab_MultiPlate:SelectTab(self.MultiPlateIndex)
  end
  self.WBP_Set_UnfoldList:SetVisibility(UE4.ESlateVisibility.Collapsed)
  if self.OptionUnfold_Prefrence then
    self.OptionUnfold_Prefrence:Init(self, "GamepadPreset", DataMgr.Option.GamepadPreset)
  end
  self.GamePadXBOXDirection = {
    WB_Key_View = "Left",
    WB_Key_LBT = "Left",
    WB_Key_L = "Left",
    WB_Key_Direc = "Left"
  }
  if self.OptionUnfold_Prefrence then
    self.Btn_TabL.OnClicked:Clear()
    self.Btn_TabR.OnClicked:Clear()
    self.GamepadBottomContent = "Combo1"
    self.IsTabLClick = true
    self:PlayAnimation(self.TabL_Click)
    self:PlayAnimation(self.TabR_Normal)
    self.Btn_TabL.OnClicked:Add(self, function()
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
      self:ShowFightGamepadBottomContent()
    end)
    self.Btn_TabR.OnClicked:Add(self, function()
      AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_sort_tab", nil, nil)
      self:ShowSystemGamepadBottomContent()
    end)
    self.Text_TabName_Sel:SetText(GText("UI_CharVoice_Battle"))
    self.Text_TabName_Sel_1:SetText(GText("UI_CTL_System"))
    if self.Com_KeyImg_L then
      self.Com_KeyImg_L:CreateCommonKey({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "Left"}
        }
      })
      self.Com_KeyImg_R:CreateCommonKey({
        KeyInfoList = {
          {Type = "Img", ImgShortPath = "Right"}
        }
      })
    end
    self:RefreshAllGamePadOperator(self.OptionUnfold_Prefrence.NowOptionId)
  end
end

function WBP_Setting_PC_C:ShowFightGamepadBottomContent()
  if self.GamepadBottomContent == "Combo1" then
    return
  end
  self:PlayAnimation(self.TabL_Click)
  self:PlayAnimation(self.TabR_Normal)
  self.IsTabLClick = true
  self.GamepadBottomContent = "Combo1"
  self:RefreshGamepadOperationSystemBottom(self.OptionUnfold_Prefrence.NowOptionId)
end

function WBP_Setting_PC_C:ShowSystemGamepadBottomContent()
  if self.GamepadBottomContent == "Combo2" then
    return
  end
  self:PlayAnimation(self.TabR_Click)
  self:PlayAnimation(self.TabL_Normal)
  self.IsTabLClick = false
  self.GamepadBottomContent = "Combo2"
  self:RefreshGamepadOperationSystemBottom(self.OptionUnfold_Prefrence.NowOptionId)
end

function WBP_Setting_PC_C:OnMultiPlateTabSelected(TabWidget)
  if self.MultiPlateIndex == TabWidget.Idx then
    return
  end
  if self.OptionUnfold_Prefrence.IsListOpen then
    self.OptionUnfold_Prefrence:OnClickSubOptionList()
  end
  if self.HasBeenChanged then
    if 2 == self.MultiPlateIndex and 1 == TabWidget.Idx then
      local Params = {}
      local PopConfig = DataMgr.CommonPopupUIContext[100190]
      local ContentStr = PopConfig.PopoverText
      Params.LeftCallbackObj = self
      
      function Params.LeftCallbackFunction()
        self.MultiPlateTabUpdate = true
        self:RestoreOldValueSet()
        self:InitSettingParameter()
        self:UpdateKeyboardBottonKey()
        self.OptionUnfold_Prefrence:RestoreOldGamepadPresetInLocal()
        self.MultiPlateIndex = TabWidget.Idx
        self.WidgetSwitcher_MP:SetActiveWidgetIndex(self.MultiPlateIndex - 1)
      end
      
      Params.RightCallbackObj = self
      
      function Params.RightCallbackFunction()
        self.MultiPlateTabUpdate = true
        self:SaveAllSetting()
        self.MultiPlateIndex = TabWidget.Idx
        self.WidgetSwitcher_MP:SetActiveWidgetIndex(self.MultiPlateIndex - 1)
      end
      
      Params.ShortText = string.format(GText(ContentStr), self.OptionUnfold_Prefrence:GetGamepadPresetOptionContentText())
      UIManager(self):ShowCommonPopupUI(100190, Params, self)
    elseif 1 == self.MultiPlateIndex and 2 == TabWidget.Idx then
      local Params = {}
      Params.LeftCallbackObj = self
      
      function Params.LeftCallbackFunction()
        self:OnCancelClickOtherSet()
        self.MultiPlateIndex = TabWidget.Idx
        self.WidgetSwitcher_MP:SetActiveWidgetIndex(self.MultiPlateIndex - 1)
      end
      
      Params.RightCallbackObj = self
      
      function Params.RightCallbackFunction()
        self:SaveAllSetting()
        self.MultiPlateIndex = TabWidget.Idx
        self.WidgetSwitcher_MP:SetActiveWidgetIndex(self.MultiPlateIndex - 1)
      end
      
      UIManager(self):ShowCommonPopupUI(100010, Params, self)
    end
  else
    self.MultiPlateIndex = TabWidget.Idx
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(self.MultiPlateIndex - 1)
    self:FocusToOptionFirstWidget()
  end
end

function WBP_Setting_PC_C:RefreshAllGamePadOperator(PreferenceId)
  self:RefreshGamepadOperationSystemByIndex(PreferenceId, self.WBP_Set_GamePadXBOX_C_1)
  self:RefreshGamepadOperationSystemByIndex(PreferenceId, self.WBP_Set_GamePadPS5)
end

function WBP_Setting_PC_C:RefreshGamepadOperationSystemByIndex(PreferenceId, GamePadOperator)
  self.Node_GamePad:SetActiveWidgetIndex(UIUtils.UtilsGetCurrentGamepadName() == "PS" and 1 or 0)
  GamePadOperator.WB_Key_XYBA:ClearChildren()
  GamePadOperator.WB_Key_R:ClearChildren()
  GamePadOperator.WB_Key_RBT:ClearChildren()
  GamePadOperator.WB_Key_Menu:ClearChildren()
  GamePadOperator.WB_Key_View:ClearChildren()
  GamePadOperator.WB_Key_LBT:ClearChildren()
  GamePadOperator.WB_Key_L:ClearChildren()
  GamePadOperator.WB_Key_Direc:ClearChildren()
  local GamepadSet = {}
  for _, V in pairs(DataMgr.GamepadSet) do
    table.insert(GamepadSet, V)
  end
  table.sort(GamepadSet, function(a, b)
    return a.Order < b.Order
  end)
  for _, V in ipairs(GamepadSet) do
    local AreaName = ""
    if V.KeyRegion[PreferenceId] then
      AreaName = V.KeyRegion[PreferenceId]
    else
      AreaName = V.KeyRegion[1]
    end
    local IconList = UIUtils.GetIconListByActionNameAndSetNum(V.ActionName, PreferenceId)
    if GamePadOperator[AreaName] then
      local FilePath = self.GamePadXBOXDirection[AreaName] and "/Game/UI/WBP/Set/Widget/WBP_Set_KeyGamePad_L.WBP_Set_KeyGamePad_L" or "/Game/UI/WBP/Set/Widget/WBP_Set_KeyGamePad_R.WBP_Set_KeyGamePad_R"
      local Widget = UIManager(self):CreateWidget(FilePath, false)
      GamePadOperator[AreaName]:AddChild(Widget)
      Widget.Key_GamePad:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
      local KeyText = V.TextHighLight and string.format("<Highlight>%s</>", GText(V.KeyText)) or GText(V.KeyText)
      Widget.Key_GamePad:CreateCommonKey({
        KeyInfoList = {
          {
            Type = "Img",
            ImgShortPath = IconList and IconList[1] or V.GamepadIcon[1]
          }
        },
        Desc = KeyText
      })
    end
  end
  self:PlayAnimation(self.GamePadChange)
  self:RefreshGamepadOperationSystemBottom(PreferenceId)
end

function WBP_Setting_PC_C:RefreshGamepadOperationSystemBottom(PreferenceId)
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(GWorld.GameInstance, 0)
  if not Player then
    return
  end
  self.HB_Combination:ClearChildren()
  local ComboList = {}
  local GamepadSet = {}
  for _, V in pairs(DataMgr.GamepadSet) do
    if V.KeyRegion[1] and V.KeyRegion[1] == self.GamepadBottomContent then
      table.insert(GamepadSet, V)
    end
  end
  table.sort(GamepadSet, function(a, b)
    return a.Order < b.Order
  end)
  for k, v in ipairs(GamepadSet) do
    if v.KeyRegion then
      local IconList = UIUtils.GetIconListByActionNameAndSetNum(v.ActionName, PreferenceId)
      if IconList then
        local KeyText = v.TextHighLight and string.format("<Highlight>%s</>", GText(v.KeyText)) or GText(v.KeyText)
        table.insert(ComboList, {IconList, KeyText})
      end
    end
  end
  local Count = #ComboList
  if 0 == Count then
    return
  end
  local Circle = math.modf(Count / 2 + 0.5)
  for i = 1, Circle do
    local Index = i * 2 - 1
    local FilePath = "/Game/UI/WBP/Set/Widget/WBP_Set_KeyCombination.WBP_Set_KeyCombination"
    local Widget = UIManager(self):CreateWidget(FilePath, false)
    self.HB_Combination:AddChild(Widget)
    local TeamHeadSlot = UWidgetLayoutLibrary.SlotAsHorizontalBoxSlot(Widget)
    TeamHeadSlot:SetSize(Rule)
    local KeyInfoList = {}
    for j = 1, #ComboList[Index] do
      table.insert(KeyInfoList, {
        Type = "Img",
        ImgShortPath = ComboList[Index][1][j]
      })
    end
    local KeyData = {
      KeyInfoList = KeyInfoList,
      Desc = ComboList[Index][2],
      Type = "Add"
    }
    Widget.Key_Combination_1:CreateSubKeyDesc(KeyData)
    if ComboList[Index + 1] then
      KeyInfoList = {}
      for j = 1, #ComboList[Index + 1] do
        table.insert(KeyInfoList, {
          Type = "Img",
          ImgShortPath = ComboList[Index + 1][1][j]
        })
      end
      KeyData = {
        KeyInfoList = KeyInfoList,
        Desc = ComboList[Index + 1][2],
        Type = "Add"
      }
      Widget.Key_Combination_2:CreateSubKeyDesc(KeyData)
    else
      Widget.Key_Combination_2:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  self:PlayAnimation(self.Combination_Change)
end

function WBP_Setting_PC_C:InitCommonTabInfo()
  self.CommonTabInfo = {}
  self.TabNums = 0
  for TabId, TabInfo in ipairs(DataMgr.OptionTab) do
    if self.Platform == "PC" or self.Platform == "Mobile" and not TabInfo.IsMobileHide then
      local Tag = TabInfo.Tag
      local OptionTags = DataMgr.Option2Tag[Tag .. self.Platform]
      if "Key" == Tag then
        if not self.IsInLoginMainPage then
          self.TabNums = self.TabNums + 1
          self.CommonTabInfo[self.TabNums] = {
            Text = GText(TabInfo.TabName),
            TabId = self.TabNums,
            TabName = TabInfo.Tag,
            IconPath = TabInfo.Icon,
            Regions = 2,
            RegionNames = {
              [1] = GText("UI_Option_Area_6"),
              [2] = GText("UI_Option_Area_7")
            }
          }
        end
      elseif OptionTags and self:CheckSpecialHide(OptionTags) then
        self.TabNums = self.TabNums + 1
        local RegionNums = 0
        local RegionNames = {}
        local OptionInfo
        for index, Cache in pairs(OptionTags) do
          OptionInfo = DataMgr.Option[Cache]
          local Region = OptionInfo.Region
          if nil == RegionNames[Region] then
            RegionNames[Region] = OptionInfo.RegionName
          end
          if RegionNums < Region then
            RegionNums = Region
          end
        end
        self.CommonTabInfo[self.TabNums] = {
          Text = GText(OptionInfo.TagName),
          TabId = self.TabNums,
          TabName = TabInfo.Tag,
          IconPath = TabInfo.Icon,
          Regions = RegionNums,
          RegionNames = RegionNames
        }
      end
    end
  end
end

function WBP_Setting_PC_C:CheckSpecialHide(OptionTags)
  for index, Cache in pairs(OptionTags) do
    local OptionInfo = DataMgr.Option[Cache]
    if self:CheckOptionSpecialHide(Cache, OptionInfo.SpecialHide) then
      return true
    end
  end
  return false
end

function WBP_Setting_PC_C:CheckOptionSpecialHide(OptionId, SpecialHide)
  local Avatar = GWorld:GetAvatar()
  if Avatar and Avatar.CdnHideData then
    local OptionData = Avatar.CdnHideData.option
    if OptionData then
      for _, Data in pairs(OptionData) do
        for __, CtrlOptionId in pairs(Data.gameCtrlOption) do
          if CtrlOptionId == OptionId then
            SpecialHide = Data.config
            return SpecialHide
          end
        end
      end
    end
  end
  if UE4.UUCloudGameInstanceSubsystem.IsCloudGame() and self:CheckIsUCloudHide(OptionId) then
    return false
  end
  if self:CheckIsExamineDistribution(OptionId) then
    return false
  end
  if self:CheckIsInLogin(OptionId) then
    return false
  end
  if SpecialHide and SpecialHide == CommonConst.SpecialHideAnyWhere then
    return false
  end
  if URuntimeCommonFunctionLibrary.IsDLSSSupported() then
    if "FSR" == OptionId then
      return false
    end
  elseif "DLSS" == OptionId then
    return false
  end
  local IsGlobalPak = HeroUSDKSubsystem(self):IsGlobalSDK()
  if nil == SpecialHide or SpecialHide == CommonConst.SpecialHideNoWhere then
    return true
  elseif IsGlobalPak and SpecialHide == CommonConst.SpecialHideCN then
    return true
  elseif not IsGlobalPak and SpecialHide == CommonConst.SpecialHideAboard then
    return true
  end
  return false
end

function WBP_Setting_PC_C:CheckIsUCloudHide(OptionId)
  local OptionInfo = DataMgr.Option[OptionId]
  if OptionInfo.UCloudHide then
    return true
  end
  return false
end

function WBP_Setting_PC_C:CheckIsExamineDistribution(OptionId)
  local OptionList = {
    CustomerService = true,
    ExchangeCode = true,
    LogOffAccount = false
  }
  if OptionList[OptionId] and AHotUpdateGameMode.IsExamineDistribution() then
    return true
  elseif "CustomerService" == OptionId then
    if HeroUSDKSubsystem(self):IsBilibili() then
      return true
    end
  elseif "LogOffAccount" == OptionId then
    if HeroUSDKSubsystem(self):IsBilibili() then
      return true
    end
  else
    return false
  end
  return false
end

function WBP_Setting_PC_C:CheckIsInLogin(OptionId)
  local OptionInfo = DataMgr.Option[OptionId]
  if OptionInfo.GameHide == nil or OptionInfo.GameHide == CommonConst.SpecialHideNoWhere then
    return false
  end
  if self.IsInLoginMainPage and OptionInfo.GameHide == CommonConst.SpecialHideCN then
    return true
  end
  if not self.IsInLoginMainPage and OptionInfo.GameHide == CommonConst.SpecialHideAboard then
    return true
  end
  return false
end

function WBP_Setting_PC_C:ReceiveEnterState(EnteredState)
  self.Super.ReceiveEnterState(self, EnteredState)
  if EnteredState == UE4.EStackAction.Push then
    self:SetFocus()
  end
end

function WBP_Setting_PC_C:ScrollToOffset(Offset)
  self.ScrollBox_Option:SetScrollOffset(Offset)
end

function WBP_Setting_PC_C:GetScrollOffset()
  return self.ScrollBox_Option:GetScrollOffset()
end

function WBP_Setting_PC_C:OnTabSelected(TabWidget, NeedInit)
  self.WBP_Set_UnfoldList:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.NewTabId = TabWidget.Idx
  if self.HasBeenChanged then
    if self.HasBeenChanged == "GamepadPresetSave" then
      local Params = {}
      local PopConfig = DataMgr.CommonPopupUIContext[100190]
      local ContentStr = PopConfig.PopoverText
      Params.LeftCallbackObj = self
      
      function Params.LeftCallbackFunction()
        self.OptionUnfold_Prefrence:RestoreOldGamepadPresetInLocal()
        self:OnCancelClickOtherSet()
      end
      
      Params.RightCallbackObj = self
      Params.RightCallbackFunction = self.OnConfirmClickOtherSet
      Params.ShortText = string.format(GText(ContentStr), self.OptionUnfold_Prefrence:GetGamepadPresetOptionContentText())
      UIManager(self):ShowCommonPopupUI(100190, Params, self)
    else
      local Params = {}
      Params.LeftCallbackObj = self
      Params.LeftCallbackFunction = self.OnCancelClickOtherSet
      Params.RightCallbackObj = self
      Params.RightCallbackFunction = self.OnConfirmClickOtherSet
      UIManager(self):ShowCommonPopupUI(100010, Params, self)
    end
    return
  end
  if self.CurrentTab ~= nil then
    for i, SettingUI in pairs(self.SettingUIs[self.CurrentTab]) do
      if SettingUI.OnParentTabSwitch then
        SettingUI:OnParentTabSwitch()
      end
    end
  end
  self.CurrentTab = TabWidget.Idx
  self.CurrentWidget = TabWidget
  if self.EmptySettingUI then
    self.ScrollBox_Option:RemoveChild(self.EmptySettingUI)
    self.EmptySettingUI = nil
  end
  self.ScrollBox_Option:ScrollToStart()
  local IsInit = false
  if nil == self.SettingUIs[self.CurrentTab] then
    self.SettingUIs[self.CurrentTab] = {}
    for i = 1, self.CommonTabInfo[self.CurrentTab].Regions do
      local SettingUI = self:CreateWidgetNew("SettingList")
      self.ScrollBox_Option:AddChild(SettingUI)
      local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsScrollBoxSlot(SettingUI)
      CanvasSlot:SetPadding(FMargin(0, 0, 0, 0))
      self.SettingUIs[self.CurrentTab][i] = SettingUI
    end
    IsInit = true
  end
  if nil ~= NeedInit then
    IsInit = NeedInit
  end
  for i, j in pairs(self.SettingUIs) do
    for m, n in pairs(j) do
      n:SetVisibility(UE4.ESlateVisibility.Collapsed)
    end
  end
  for i, SettingUI in pairs(self.SettingUIs[self.CurrentTab]) do
    if SettingUI.OnParentTabSwitch then
      SettingUI:OnParentTabSwitch()
    end
    SettingUI:Init(self, self.CommonTabInfo[self.CurrentTab].TabName, i, self.CommonTabInfo[self.CurrentTab].RegionNames[i], IsInit)
    self.ScrollBox_Option:SetConsumeMouseWheel(EConsumeMouseWheel.WhenScrollingPossible)
    SettingUI:PlayInAnim()
    if SettingUI.bIsFocusable then
      SettingUI:SetFocus()
    end
  end
  if nil == self.EmptySettingUI then
    local SettingUI = self:CreateWidgetNew("SettingList")
    self.ScrollBox_Option:AddChild(SettingUI)
    local CanvasSlot = UE4.UWidgetLayoutLibrary.SlotAsScrollBoxSlot(SettingUI)
    CanvasSlot:SetPadding(FMargin(0, 0, 0, 0))
    self.EmptySettingUI = SettingUI
    self.EmptySettingUI:PlayInAnim()
  end
  self:UpdateEmptyGridCount()
  if self.CommonTabInfo[self.CurrentTab].TabName == "Key" then
    if self.Tab_MultiPlate then
      self.WidgetSwitcher_MP:SetActiveWidgetIndex(self.MultiPlateIndex - 1)
      self.Tab_MultiPlate:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Panel_SubTab:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    end
  elseif self.Tab_MultiPlate then
    self.WidgetSwitcher_MP:SetActiveWidgetIndex(0)
    self.Tab_MultiPlate:SetVisibility(UE4.ESlateVisibility.Collapsed)
    self.Panel_SubTab:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  self:AddTimer(0.1, function()
    self:FocusToOptionFirstWidget()
  end)
end

function WBP_Setting_PC_C:UpdateEmptyGridCount()
  if not IsValid(self.EmptySettingUI) then
    return
  end
  local ListItemSize
  if self:IsExistTimer("GetEmptyGridCount") then
    self:RemoveTimer("GetEmptyGridCount")
  end
  
  local function GetEmptyGridCount()
    local GridCountSum = 0
    for i, SettingUI in pairs(self.SettingUIs[self.CurrentTab]) do
      GridCountSum = GridCountSum + SettingUI:GetCurrentStateGrideCount()
    end
    local ListView = self.SettingUIs[self.CurrentTab][1].List_Options
    local ItemUIs = ListView:GetDisplayedEntryWidgets()
    if 0 == ItemUIs:Length() then
      return
    end
    local ItemSize = UIManager(self):GetWidgetRenderSize(ItemUIs:GetRef(1).WidgetTree.RootWidget)
    ListItemSize = ItemSize.Y + ListView.EntrySpacing
    local ListViewSize = UIManager(self):GetWidgetRenderSize(self.ScrollBox_Option)
    local RowInt, RowLeft = math.modf(ListViewSize.Y / ListItemSize)
    if RowLeft >= 0.5 then
      RowInt = RowInt + 1
    end
    if GridCountSum > RowInt then
      self.ScrollBox_Option:SetScrollBarVisibility(ESlateVisibility.Visible)
      self.EmptySettingUI:SetVisibility(ESlateVisibility.Collapsed)
    elseif GridCountSum == RowInt then
      self.ScrollBox_Option:SetScrollBarVisibility(ESlateVisibility.Collapsed)
      self.EmptySettingUI:SetVisibility(ESlateVisibility.Collapsed)
    else
      self.ScrollBox_Option:SetScrollBarVisibility(ESlateVisibility.Collapsed)
      self.EmptySettingUI:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.EmptySettingUI:SetEmptyGrid(self, RowInt - GridCountSum)
    end
  end
  
  self:AddTimer(0.033, GetEmptyGridCount, false, 0, "GetEmptyGridCount", true)
end

function WBP_Setting_PC_C:OnPreviewMouseButtonDown(MyGeometry, InMouseEvent)
  if UE4.UKismetInputLibrary.PointerEvent_IsMouseButtonDown(InMouseEvent, UE4.EKeys.LeftMouseButton) then
    local ScreenSpacePosition = UE4.UKismetInputLibrary.PointerEvent_GetScreenSpacePosition(InMouseEvent)
    local ItemGeometry = self.WBP_Set_UnfoldList:GetCachedGeometry()
    if self.WBP_Set_UnfoldList:IsVisible() and UE4.USlateBlueprintLibrary.IsUnderLocation(ItemGeometry, ScreenSpacePosition) then
      return UE4.UWidgetBlueprintLibrary.Unhandled()
    end
    self:OnClickAllLeftMouseButton()
    if self.OptionUnfold_Prefrence then
      self.OptionUnfold_Prefrence:OnClickLeftMouseButton()
    end
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function WBP_Setting_PC_C:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetStringLibrary.StartsWith(InKeyName, "GamePad") then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  elseif "Escape" == InKeyName then
    UIUtils.PlayCommonBtnSe(self)
    self:OnPressESC()
  elseif "Y" == InKeyName then
    self:OnPressY()
  elseif "R" == InKeyName then
    self:OnPressR()
  elseif "Q" == InKeyName and 1 ~= self.CurrentTab then
    local UICommonTipSecond = UIManager(self):GetUI("CommonTipSecond")
    if UICommonTipSecond then
      UICommonTipSecond:Close()
    end
    self.NextTabIsLeft = true
    self.Tab_Set:TabToLeft()
  elseif "E" == InKeyName and self.CurrentTab ~= self.TabNums then
    local UICommonTipSecond = UIManager(self):GetUI("CommonTipSecond")
    if UICommonTipSecond then
      UICommonTipSecond:Close()
    end
    self.NextTabIsLeft = false
    self.Tab_Set:TabToRight()
  elseif "A" == InKeyName and 1 == self.CurrentTab then
    if 1 ~= self.MultiPlateIndex and self.Tab_MultiPlate then
      self.Tab_MultiPlate:Handle_KeyEventOnPC(InKeyName)
      self.MultiPlateIndex = 1
    end
  elseif "D" == InKeyName and 1 == self.CurrentTab and 2 ~= self.MultiPlateIndex and self.Tab_MultiPlate then
    self.Tab_MultiPlate:Handle_KeyEventOnPC(InKeyName)
    self.MultiPlateIndex = 2
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function WBP_Setting_PC_C:RefreshGamepadOperationSystemBottomContent(InKeyName)
  if InKeyName == UIConst.GamePadKey.DPadLeft and 1 == self.CurrentTab and 2 == self.MultiPlateIndex then
    self:ShowFightGamepadBottomContent()
  elseif InKeyName == UIConst.GamePadKey.DPadRight and 1 == self.CurrentTab and 2 == self.MultiPlateIndex then
    self:ShowSystemGamepadBottomContent()
  end
end

function WBP_Setting_PC_C:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == Const.GamepadFaceButtonRight and self.IsUnfoldListOpen and self.OnUnfoldListClosed then
    self.OnUnfoldListClosed()
    self.OnUnfoldListClosed = nil
    return true
  elseif InKeyName == Const.GamepadFaceButtonUp then
    self:OnPressY()
    IsEventHandled = true
  elseif InKeyName == Const.GamepadFaceButtonLeft then
    self:OnPressR()
    IsEventHandled = true
  end
  IsEventHandled = IsEventHandled or self.Tab_Set:Handle_KeyEventOnGamePad(InKeyName)
  if InKeyName == Const.GamepadLeftTrigger and 1 == self.CurrentTab then
    if 1 ~= self.MultiPlateIndex then
      self.Tab_MultiPlate:Handle_KeyEventOnGamePad(InKeyName)
      self.MultiPlateIndex = 1
    end
  elseif InKeyName == Const.GamepadRightTrigger and 1 == self.CurrentTab then
    if 2 ~= self.MultiPlateIndex then
      self.Tab_MultiPlate:Handle_KeyEventOnGamePad(InKeyName)
      self.MultiPlateIndex = 2
    end
  elseif InKeyName == UIConst.GamePadKey.DPadLeft and 1 == self.CurrentTab and 2 == self.MultiPlateIndex then
    self:ShowFightGamepadBottomContent()
  elseif InKeyName == UIConst.GamePadKey.DPadRight and 1 == self.CurrentTab and 2 == self.MultiPlateIndex then
    self:ShowSystemGamepadBottomContent()
  end
  return IsEventHandled
end

function WBP_Setting_PC_C:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.DPadLeft and 1 == self.CurrentTab and 2 == self.MultiPlateIndex then
    self:ShowFightGamepadBottomContent()
  elseif InKeyName == UIConst.GamePadKey.DPadRight and 1 == self.CurrentTab and 2 == self.MultiPlateIndex then
    self:ShowSystemGamepadBottomContent()
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function WBP_Setting_PC_C:AddHoverContent(Content)
  self.HoverContentList[Content] = true
  for key, value in pairs(self.HoverContentList) do
    if key ~= Content and value and key.OnBtnAreaUnHover then
      key:OnBtnAreaUnHover()
      self.HoverContentList[key] = nil
    end
  end
end

function WBP_Setting_PC_C:RemoveHoverContent(Content)
  if self.HoverContentList[Content] then
    self.HoverContentList[Content] = nil
  end
end

function WBP_Setting_PC_C:OnPressESC()
  if self.HasBeenChanged then
    if self.HasBeenChanged == "GamepadPresetSave" then
      local Params = {}
      local PopConfig = DataMgr.CommonPopupUIContext[100190]
      local ContentStr = PopConfig.PopoverText
      Params.LeftCallbackObj = self
      
      function Params.LeftCallbackFunction()
        self.OptionUnfold_Prefrence:RestoreOldGamepadPresetInLocal()
        self:OnESCClickCancel()
      end
      
      Params.RightCallbackObj = self
      
      function Params.RightCallbackFunction()
        self:SaveAllSetting(true)
        self:CloseSelf()
      end
      
      Params.ShortText = string.format(GText(ContentStr), self.OptionUnfold_Prefrence:GetGamepadPresetOptionContentText())
      UIManager(self):ShowCommonPopupUI(100190, Params, self)
    else
      local Params = {}
      Params.LeftCallbackObj = self
      Params.LeftCallbackFunction = self.OnESCClickCancel
      Params.RightCallbackObj = self
      Params.RightCallbackFunction = self.OnConfirmPressESC
      UIManager(self):ShowCommonPopupUI(100010, Params, self)
    end
  else
    self:SetInputUIOnly(false)
    local UICommonTipSecond = UIManager(self):GetUI("CommonTipSecond")
    if UICommonTipSecond then
      UICommonTipSecond:Close()
    end
    self:CloseSelf()
  end
end

function WBP_Setting_PC_C:OnPressY()
  if self.HasBeenChanged then
    UIUtils.PlayCommonBtnSe(self)
    self:SaveAllSetting()
  else
    return
  end
end

function WBP_Setting_PC_C:OnPressR()
  UIUtils.PlayCommonBtnSe(self)
  local Params = {}
  Params.RightCallbackObj = self
  Params.RightCallbackFunction = self.OnConfirmPressR
  UIManager(self):ShowCommonPopupUI(100011, Params, self)
end

function WBP_Setting_PC_C:CommonTabToLast()
  self.Tab_Set:SelectTab(self.CurrentTab)
end

function WBP_Setting_PC_C:CommonTabToNext()
  self.Tab_Set:SelectTab(self.NewTabId)
end

function WBP_Setting_PC_C:OnConfirmPressESC()
  self:SaveAllSetting(true)
  self.AutoClose = true
end

function WBP_Setting_PC_C:OnESCClickCancel()
  self:RestoreOldValueSet()
  self:CloseSelf()
end

function WBP_Setting_PC_C:OnConfirmPressR()
  self:RestoreAllDefaultSet()
end

function WBP_Setting_PC_C:OnConfirmClickOtherSet()
  self:SaveAllSetting()
  self:CommonTabToNext()
end

function WBP_Setting_PC_C:OnCancelClickOtherSet()
  self:RestoreOldValueSet()
  self:InitSettingParameter()
  self:UpdateKeyboardBottonKey()
  self:CommonTabToNext()
end

function WBP_Setting_PC_C:OnClickBlankArea()
  self:CommonTabToLast()
end

function WBP_Setting_PC_C:ClearSettingListUnfoldState()
  for key, value in pairs(self.SettingUIs[self.CurrentTab]) do
    value:ClearSettingOptionUnfoldState()
  end
end

function WBP_Setting_PC_C:SaveAllSetting()
  self.HasBeenChanged = false
  self:UpdateKeyboardBottonKey()
  if 1 == self.CurrentTab and 2 == self.MultiPlateIndex then
    self.OptionUnfold_Prefrence:SaveGamepadPresetOptionSettingInLocal()
  else
    for key, value in pairs(self.SettingUIs[self.CurrentTab]) do
      if value and value.SaveSetting then
        value:SaveSetting()
      end
    end
  end
end

function WBP_Setting_PC_C:RestoreAllDefaultSet()
  self.HasBeenChanged = false
  self:UpdateKeyboardBottonKey()
  if 1 == self.CurrentTab and 2 == self.MultiPlateIndex then
    self.OptionUnfold_Prefrence:RestoreDefaultGamepadPresetInLocal()
  else
    for key, value in pairs(self.SettingUIs[self.CurrentTab]) do
      if value and value.RestoreDefaultSet then
        value:RestoreDefaultSet()
      end
    end
  end
end

function WBP_Setting_PC_C:RestoreOldValueSet()
  for key, value in pairs(self.SettingUIs[self.CurrentTab]) do
    if value and value.RestoreOldValueSet then
      value:RestoreOldValueSet()
    end
  end
end

function WBP_Setting_PC_C:OnClickAllLeftMouseButton()
  for key, value in pairs(self.SettingUIs[self.CurrentTab]) do
    if value and value.OnClickLeftMouseButton then
      value:OnClickLeftMouseButton()
    end
  end
end

function WBP_Setting_PC_C:UpdateUnfoldListPosition(Position, IsUpper)
  local CanvasSlotTarget = UE4.UWidgetLayoutLibrary.SlotAsCanvasSlot(self.WBP_Set_UnfoldList)
  if IsUpper then
    CanvasSlotTarget:SetAlignment(FVector2D(0.5, 1.0))
  else
    CanvasSlotTarget:SetAlignment(FVector2D(0.5, 0))
  end
  CanvasSlotTarget:SetPosition(Position)
end

function WBP_Setting_PC_C:BindUnfoldListClosedCallback(Callback)
  self.OnUnfoldListClosed = Callback
end

function WBP_Setting_PC_C:ChangeUnfoldListSelection(SelectOptionId)
  local ListItems = self.WBP_Set_UnfoldList.SubOption_List:GetListItems()
  for _, ListItem in pairs(ListItems) do
    ListItem.SelectedOptionId = SelectOptionId
  end
  local GetDisplayedEntryWidgets = self.WBP_Set_UnfoldList.SubOption_List:GetDisplayedEntryWidgets()
  for _, Entry in pairs(GetDisplayedEntryWidgets) do
    Entry:UpdateEntrySelection()
  end
end

function WBP_Setting_PC_C:FocusToSelectedUnfoldListOption()
  local ListItems = self.WBP_Set_UnfoldList.SubOption_List:GetListItems()
  local ListNums = self.WBP_Set_UnfoldList.SubOption_List:GetNumItems()
  for i = 0, ListNums - 1 do
    local Item = ListItems:GetRef(i + 1)
    if Item and Item.SelectedOptionId == Item.Id then
      self.WBP_Set_UnfoldList.SubOption_List:NavigateToIndex(i)
      break
    end
  end
  self:UpdateBottomKey({
    {
      UIConst.GamePadImgKey.FaceButtonBottom,
      GText("UI_Tips_Ensure")
    },
    {
      UIConst.GamePadImgKey.FaceButtonRight,
      GText("UI_Tips_Close")
    }
  })
end

function WBP_Setting_PC_C:SetSettingUnfoldListPC(IsShow)
  if IsShow then
    self.WBP_Set_UnfoldList:StopAllAnimations()
    self.WBP_Set_UnfoldList:PlayAnimation(self.WBP_Set_UnfoldList.In)
    if self:IsExistTimer("SetList") then
      self:RemoveTimer("SetList")
    end
    self.IsUnfoldListOpen = true
    self.WBP_Set_UnfoldList:SetVisibility(UE4.ESlateVisibility.Visible)
    self.ScrollBox_Option:SetConsumeMouseWheel(EConsumeMouseWheel.Never)
    if UIUtils.IsGamepadInput() then
      self:AddTimer(0.1, function()
        self:FocusToSelectedUnfoldListOption()
      end)
    end
  else
    if self.IsUnfoldListOpen then
      self.IsUnfoldListOpen = false
      self.WBP_Set_UnfoldList:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.WBP_Set_UnfoldList:StopAllAnimations()
      self.WBP_Set_UnfoldList:PlayAnimation(self.WBP_Set_UnfoldList.Out)
      self.ScrollBox_Option:SetConsumeMouseWheel(EConsumeMouseWheel.WhenScrollingPossible)
      
      local function SetList()
        self.WBP_Set_UnfoldList:SetVisibility(UE4.ESlateVisibility.Collapsed)
      end
      
      local EndTime = self.WBP_Set_UnfoldList.Out:GetEndTime()
      self:AddTimer(EndTime, SetList, false, 0, "SetList", true)
    end
    self.WBP_Set_UnfoldList:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
end

function WBP_Setting_PC_C:PlayInAnim()
  if self.IsInLoginMainPage then
    self:PlayAnimation(self.logIn)
  else
    self:PlayAnimation(self.In)
  end
  AudioManager(self):PlayUISound(self, "event:/ui/armory/open", "OpenShopSetting", nil)
end

function WBP_Setting_PC_C:CloseSelf()
  if self.OptionUnfold_Prefrence and self.OptionUnfold_Prefrence.IsListOpen then
    self.OptionUnfold_Prefrence:OnClickSubOptionList()
  end
  self:BlockAllUIInput(true)
  self:StopAnimation(self.In)
  self:PlayAnimation(self.Out)
  AudioManager(self):SetEventSoundParam(self, "OpenShopSetting", {ToEnd = 1})
  self:BindToAnimationFinished(self.Out, {
    self,
    self.Close
  })
end

function WBP_Setting_PC_C:Close()
  self:UnbindAllFromAnimationFinished(self.Out)
  for i, j in pairs(self.SettingUIs) do
    for m, n in pairs(j) do
      if n and n.OnParentClosed then
        n:OnParentClosed()
      end
    end
  end
  local ESCUI = UIManager(self):GetUI(UIConst.MenuWorld) or UIManager(self):GetUI(UIConst.MenuLevel)
  if ESCUI and not self.CloseEsc then
    ESCUI:PlayInAnim()
  end
  if ESCUI and self.CloseEsc then
    ESCUI.CloseByChild = true
  end
  if not self.IsInLoginMainPage then
    UIManager(self):SwitchUINpcCamera(false, "Setting", self.NpcId, {
      bDestroyNpc = true,
      IsHaveInOutAnim = self.IsNeedPlayNpcAnim
    })
  end
  if self.LastSystem and self.LastSystem.SetFocus then
    self.LastSystem:SetFocus()
  end
  self.Super.Close(self)
end

function WBP_Setting_PC_C:CloseSelfAndEsc()
  self.CloseEsc = true
  self:Close()
end

return WBP_Setting_PC_C
