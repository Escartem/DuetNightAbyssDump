require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})

function M:Construct()
  M.Super.Construct(self)
  EventManager:AddEvent(EventID.EntryReceiveEnterState, self, self.OnEntryReceiveEnterState)
  self.List_Default:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.List_Default:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
  self.List_Default:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.List_Default:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self:AddInputMethodChangedListen()
  EventManager:AddEvent(EventID.NightBookSpecialRightUp, self, self.OnSpecialRightUp)
  self.IsShow = false
  self.Btn_Build:SetVisibility(UE4.ESlateVisibility.Collapsed)
  local ArmoryConfigData = {
    OwnerWidget = self,
    TextContent = GText("UI_ArmourySquad_Tips"),
    OnMenuOpenChangedCallBack = self.OnMenuOpenChangedCallBack
  }
  local DefaultConfigData = {
    OwnerWidget = self,
    TextContent = GText("UI_CustomSquad_Tips"),
    OnMenuOpenChangedCallBack = self.OnMenuOpenChangedCallBack
  }
  self.Btn_Qa_Default:Init(DefaultConfigData)
  self.Team_Armory:SetNavigationRuleCustom(EUINavigation.Down, {
    self,
    function()
      self.List_Default:NavigateToIndex(0)
    end
  })
  self.Team_Armory:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
  self.Team_Armory:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
  self.Team_Armory:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
  self.Text_Title_Armory:SetText(GText("UI_ArmourySquad_Title"))
  self.Text_Title_Default:SetText(GText("UI_CustomSquad_Title"))
end

function M:OnSpecialRightUp()
  local Parent = self.Parent
  if not Parent then
    return
  end
  if Parent.GetName then
    DebugPrint("OnSpecialRightUp Parent", Parent:GetName())
  end
  local hasFocusFn = type(Parent.IsFocusList) == "function"
  local isFocus = hasFocusFn and Parent:IsFocusList() and true or false
  local doOpen = not self.IsShow and (not hasFocusFn or not isFocus)
  local doClose = self.IsShow and (not hasFocusFn or not isFocus)
  if doOpen then
    self:OnOpenSquadGamepad()
    Parent.CurrentFocusType = "DefaultList"
  elseif doClose then
    self:OnCloseSquadGamepad()
  end
end

function M:OpeArmorynMenuAnchor()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
end

function M:OpenDefaultMenuAnchor()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_level_01", nil, nil)
  self.Btn_Qa_Default:PlayAnimation(self.Btn_Qa_Default.Click)
  self.Btn_Qa_Default.Btn_Click:SetChecked(true)
  self.Btn_Qa_Default:OpenMenuAnchor()
end

function M:IsMenuAnchorOpen()
  return self.Btn_Qa_Default:IsMenuAnchorOpen()
end

function M:CloseMenuAnchor()
  self.Btn_Qa_Default:CloseMenuAnchor()
end

function M:OnMenuOpenChangedCallBack(bIsOpen)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    if bIsOpen then
      self.Key_Default:SetVisibility(UE4.ESlateVisibility.Collapsed)
      self.Btn_Build:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
      self.Btn_Close:SetVisibility(UE4.ESlateVisibility.Visible)
      self:UpdatKeyDisplay("")
    else
      self.Key_Default:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
      self.Btn_Build:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
      self.Btn_Close:SetVisibility(UE4.ESlateVisibility.HitTestInvisible)
      self:UpdatKeyDisplay("Selected")
    end
  elseif bIsOpen then
    self.Btn_Close:SetVisibility(UE4.ESlateVisibility.Collapsed)
  else
    self.Btn_Close:SetVisibility(UE4.ESlateVisibility.Visible)
  end
end

function M:Init(Parent, bDisablePhantom, Index, CurSelectedDungeonId)
  self.Avatar = GWorld:GetAvatar()
  if not self.Avatar then
    return
  end
  self.CurSelectedDungeonId = CurSelectedDungeonId
  self.CurrentSquad = Index
  self.bDisablePhantom = bDisablePhantom
  self.Parent = Parent
  self:SetVisibility(ESlateVisibility.SelfHitTestInvisible)
  self.Panel_List:SetRenderOpacity(0)
  self.BackgroundBlur_59:SetRenderOpacity(0)
  self.Btn_Close:SetVisibility(ESlateVisibility.Collapsed)
  self.Btn_Close.OnClicked:Add(self.Preview, self.Preview.OnClicked)
  self.List_Default.BP_OnItemClicked:Add(self, self.OnListItemSelected)
  self.List_Default.BP_OnItemIsHoveredChanged:Add(self, self.OnItemIsHoverChanged)
  self.Btn_Build:SetText(GText("UI_Squad_Edit"))
  self.Btn_Build.Button_Area.OnClicked:Add(self, self.OnGoToSystem)
  self:InitWidgetInfoInGamePad()
  self:RefreshData()
  if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" then
    self.List_Default:SetControlScrollbarInside(false)
  else
    self.List_Default:SetControlScrollbarInside(true)
  end
  if 0 == self.CurrentSquad then
    self.Team_Armory:UpSelected()
  end
end

function M:RefreshData()
  self.SquadList = self.Avatar.Squad
  self:UpdateSquadListInfo()
  self:InitSquadList()
  self:UpdateCurrentDungeonSquad(self.CurrentSquad)
  self.Preview:InitSquadData(self, self.bDisablePhantom, self.CurrentSquad)
end

function M:OnGoToSystem()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
  if 0 == self.CurrentSquad then
    return
  end
  local SquadMainUI = UIManager(self):GetUIObj("SquadMainUINew")
  if SquadMainUI then
    SquadMainUI.IsFromDungeonPage = true
    PageJumpUtils:JumpToTargetPage("SquadMainUINew")
    SquadMainUI:JumpToEditSquadByIndex(self.CurrentSquad)
  else
    PageJumpUtils:JumpToTargetPage("SquadMainUINew", self.CurrentSquad)
  end
end

function M:UpdateCurrentDungeonSquad(Index)
  local function HandleEmptySquadView()
    self.CurrentSquad = 0
    
    self.Preview:UpdateView(self.SquadNewInfo, Index)
    self.CurrentCharId = self.SquadNewInfo.CharId
    self.CurrentCharLevel = self.SquadNewInfo.CharLevel
    if self.CurSelectContent then
      self.CurSelectContent.IsSelected = false
      if self.CurSelectContent.UI then
        self.CurSelectContent.UI:SetIsSelected(false)
      end
      self.CurSelectContent = nil
    end
    self.Preview.WS_Type:SetActiveWidgetIndex(1)
    self.Btn_Build:ForbidBtn(true)
    self.Btn_Build:BindForbidStateExecuteEvent(self, self.OnForbiddenBtnClicked)
    EventManager:FireEvent(EventID.CurrentSquadChange, 0, false, self.CurSelectedDungeonId)
  end
  
  if 0 == Index then
    HandleEmptySquadView()
    return
  end
  self.Btn_Build:ForbidBtn(false)
  self.Preview.WS_Type:SetActiveWidgetIndex(0)
  for _, value in pairs(self.SquadInfoList) do
    if value.Index == Index then
      self.CurrentSquad = Index
      self.Preview:UpdateView(value, Index)
      self.CurrentCharId = value.CharId
      self.CurrentCharLevel = value.CharLevel
      local IsComMissing = value.CharId == nil or nil == value.MeleeWeaponId or nil == value.RangedWeaponId
      EventManager:FireEvent(EventID.CurrentSquadChange, value.Index, IsComMissing, self.CurSelectedDungeonId)
      return
    end
  end
  HandleEmptySquadView()
end

function M:UpdateSquadListInfo()
  self.SquadInfoList = {}
  local Index = 0
  for key, value in pairs(self.SquadList) do
    local SquadInfo = {}
    Index = Index + 1
    if not key then
      SquadInfo.SquadName = GText("Squad_DefaultName1")
    else
      SquadInfo.SquadName = key
    end
    SquadInfo.Index = Index
    for Name, Id in pairs(value.Props) do
      if "Char" == Name or "Phantom1" == Name or "Phantom2" == Name then
        if "" ~= Id and self.Avatar.Chars[Id] then
          SquadInfo[Name .. "Id"] = self.Avatar.Chars[Id].CharId
          SquadInfo[Name .. "Level"] = self.Avatar.Chars[Id].Level
        end
        SquadInfo[Name] = Id
      elseif "MeleeWeapon" == Name or "RangedWeapon" == Name or "PhantomWeapon1" == Name or "PhantomWeapon2" == Name then
        if "" ~= Id and self.Avatar.Weapons[Id] and 0 ~= self.Avatar.Weapons[Id].WeaponId then
          SquadInfo[Name .. "Id"] = self.Avatar.Weapons[Id].WeaponId
          SquadInfo[Name .. "Level"] = self.Avatar.Weapons[Id].Level
        end
        SquadInfo[Name] = Id
      elseif "Pet" == Name and self.Avatar.Pets[Id] then
        SquadInfo[Name .. "Id"] = self.Avatar.Pets[Id].Props.PetId
        SquadInfo[Name .. "Level"] = self.Avatar.Pets[Id].Level
      else
        SquadInfo[Name] = Id
      end
    end
    table.insert(self.SquadInfoList, SquadInfo)
  end
  local TempSquad = self.Avatar:CreateTempSquad()
  self.SquadNewInfo = {}
  for Name, Id in pairs(TempSquad.Props) do
    if "Char" == Name or "Phantom1" == Name or "Phantom2" == Name then
      if "" ~= Id and self.Avatar.Chars[Id] then
        self.SquadNewInfo[Name .. "Id"] = self.Avatar.Chars[Id].CharId
        self.SquadNewInfo[Name .. "Level"] = self.Avatar.Chars[Id].Level
      end
      self.SquadNewInfo[Name] = Id
    elseif "MeleeWeapon" == Name or "RangedWeapon" == Name or "PhantomWeapon1" == Name or "PhantomWeapon2" == Name then
      if "" ~= Id and self.Avatar.Weapons[Id] and 0 ~= self.Avatar.Weapons[Id].WeaponId then
        self.SquadNewInfo[Name .. "Id"] = self.Avatar.Weapons[Id].WeaponId
        self.SquadNewInfo[Name .. "Level"] = self.Avatar.Weapons[Id].Level
      end
      self.SquadNewInfo[Name] = Id
    elseif "Pet" == Name and self.Avatar.Pets[Id] then
      self.SquadNewInfo[Name .. "Id"] = self.Avatar.Pets[Id].Props.PetId
      self.SquadNewInfo[Name .. "Level"] = self.Avatar.Pets[Id].Level
    else
      self.SquadNewInfo[Name] = Id
    end
  end
  self.SquadNewInfo.Name = GText("UI_ArmourySquad_Title")
end

function M:InitSquadList()
  self.List_Default:ClearListItems()
  for _, value in pairs(self.SquadInfoList) do
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.SquadInfo = value
    Content.Parent = self
    self.List_Default:AddItem(Content)
  end
  local SquadMax = DataMgr.GlobalConstant.SquadMax.ConstantValue or 10
  if SquadMax > #self.SquadInfoList then
    local Content = NewObject(UIUtils.GetCommonItemContentClass())
    Content.SquadInfo = nil
    self.List_Default:AddItem(Content)
  end
  self.List_Default:SetNavigationRuleCustom(EUINavigation.Up, {
    self,
    function()
      return self.Team_Armory
    end
  })
  self.Team_Armory:InitItemContent(self.SquadNewInfo, self)
end

function M:OnItemIsHoverChanged(Item, bIsHovered)
  if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
    local Entry = Item.UI
    if not Entry then
      return
    end
    if not Entry.IsSelected then
      self:UpdatKeyDisplay("NotSelected")
    else
      self:UpdatKeyDisplay("Selected")
    end
  end
end

function M:OnListItemSelected(Content)
  if not Content or self.CurSelectContent == Content then
    return
  end
  local IsComMissing = false
  if Content.SquadInfo then
    IsComMissing = Content.SquadInfo.CharId == nil or nil == Content.SquadInfo.MeleeWeaponId or nil == Content.SquadInfo.RangedWeaponId
  end
  if IsComMissing or not Content.SquadInfo then
    if Content.UI then
      Content.UI:ShowMissingComponentHint()
    end
    return
  end
  if self.Team_Armory then
    self.Team_Armory.IsSelected = false
    self.Team_Armory:PlayAnimation(self.Team_Armory.Normal)
  end
  if self.CurSelectContent then
    self.CurSelectContent.IsSelected = false
    if self.CurSelectContent.UI then
      self.CurSelectContent.UI:SetIsSelected(false)
    end
  end
  self.CurSelectContent = Content
  Content.IsSelected = true
  if Content.UI then
    Content.UI:SetIsSelected(true)
  end
end

function M:OnAnimationFinished(InAnimation)
  if InAnimation == self.In then
    self.Btn_Close:SetVisibility(ESlateVisibility.Visible)
  elseif InAnimation == self.Out then
    self.Btn_Close:SetVisibility(ESlateVisibility.Collapsed)
  end
end

function M:OnEntryReceiveEnterState(StackAction)
  if 1 == StackAction and self.IsShow then
    self:UpdatKeyDisplay("NotSelected")
    self:RefreshData()
    self.Team_Armory:SetFocus()
  end
end

function M:OnOpenSquadGamepad()
  self.Preview.Parent = self
  self.Preview:OnClicked()
  if 0 == self.CurrentSquad then
    self.Team_Armory:SetFocus()
    self.Team_Armory:OnMouseButtonDown()
  else
    self.List_Default:NavigateToIndex(0)
    self:UpdatKeyDisplay("")
  end
end

function M:OnCloseSquadGamepad()
  self.Preview.Parent = self
  self.Preview:OnClicked()
  if self.Parent.SelectCell and not self.Parent.SelectCell.Bg_List.Button_Area:HasAnyUserFocus() and type(self.Parent.SelectCellFocus) == "function" then
    self.Parent:SelectCellFocus()
  end
end

function M:InitWidgetInfoInGamePad()
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad then
    return
  end
  if not self.IsShow then
    self.Preview.WS_Controller:SetActiveWidgetIndex(1)
    self.Preview.Key_Controller_Fold:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Menu"}
      }
    })
    self.Preview.Key_Controller_Summon:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Preview.Key_Controller_Summon:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Left"}
      }
    })
    self.Preview.Key_Controller_Summon_Switch:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
    self.Preview.Key_Controller_Summon_Switch:CreateCommonKey({
      KeyInfoList = {
        {Type = "Img", ImgShortPath = "Right"}
      }
    })
  end
  self.Key_Default:SetVisibility(UE4.ESlateVisibility.SelfHitTestInvisible)
  self.Key_Default:CreateCommonKey({
    KeyInfoList = {
      {Type = "Img", ImgShortPath = "LS"}
    },
    bLongPress = false
  })
  self.Btn_Build:SetGamePadImg("X")
  self.Btn_Build:SetGamePadVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  local IsUseKeyAndMouse = CurInputDevice == ECommonInputType.MouseAndKeyboard
  if not IsUseKeyAndMouse then
    if self.IsShow then
      self.Team_Armory:SetFocus()
    end
    self:InitWidgetInfoInGamePad()
  else
    self:ApplyPcUiLayout()
  end
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

function M:ApplyPcUiLayout()
  if CommonUtils.GetDeviceTypeByPlatformName() == "Mobile" then
    return
  end
  self.Key_Default:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Preview.WS_Controller:SetActiveWidgetIndex(0)
  self.Preview.Key_Controller_Summon:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Preview.Key_Controller_Summon_Switch:SetVisibility(UE4.ESlateVisibility.Collapsed)
  self.Btn_Build:SetGamePadVisibility(UIConst.VisibilityOp.Collapsed)
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  if not self.IsShow then
    return UWidgetBlueprintLibrary.UnHandled()
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_LeftThumbstick" == InKeyName then
      if self.IsShow then
        self:OpenDefaultMenuAnchor()
        IsEventHandled = true
      end
    elseif "Gamepad_DPad_Left" == InKeyName and self.IsShow then
      self:OpeArmorynMenuAnchor()
      IsEventHandled = true
    end
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:UpdatKeyDisplay(FocusTypeName)
  local StyleOfPlay = UIManager(self):GetUIObj("StyleOfPlay")
  if not StyleOfPlay then
    return
  end
  if not self.IsShow then
    return
  end
  if "Armory" == FocusTypeName then
    if self:IsMenuAnchorOpen() then
      return
    end
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
    if UIUtils.UtilsGetCurrentInputType() == ECommonInputType.Gamepad then
      self.Btn_More:SetVisibility(ESlateVisibility.Collapsed)
    end
  elseif "NotSelected" == FocusTypeName then
    if self:IsMenuAnchorOpen() then
      return
    end
    local BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("ModFilter_Confirm"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
  elseif "Selected" == FocusTypeName then
    if self:IsMenuAnchorOpen() then
      return
    end
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    }
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
  else
    local BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_CloseTips")
      }
    }
    StyleOfPlay:UpdateOtherPageTab(BottomKeyInfo)
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local IsEventHandled = false
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  end
  if IsEventHandled then
    return UWidgetBlueprintLibrary.Handled()
  else
    return UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == Const.GamepadFaceButtonRight and self.Parent.FocusTypeName ~= "RewardWidget" then
    if self:IsMenuAnchorOpen() then
      self:CloseMenuAnchor()
      if self.Team_Armory.IsSelected then
        self.Team_Armory:SetFocus()
      else
        local Widgets = self.List_Default:GetDisplayedEntryWidgets()
        for _, Widget in pairs(Widgets) do
          if Widget.IsSelected then
            Widget:SetFocus()
            break
          end
        end
      end
      IsEventHandled = true
    else
      IsEventHandled = false
    end
  elseif InKeyName == Const.GamepadFaceButtonLeft and self.Parent.FocusTypeName ~= "RewardWidget" then
    if 0 == self.CurrentSquad then
      self:OnForbiddenBtnClicked()
    end
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:OnForbiddenBtnClicked()
  UIManager(self):ShowUITip(UIConst.Tip_CommonToast, "UI_ArmourySquad_Edit_Toast")
end

return M
