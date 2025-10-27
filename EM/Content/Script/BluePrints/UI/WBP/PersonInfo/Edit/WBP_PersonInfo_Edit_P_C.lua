require("UnLua")
local M = Class({
  "BluePrints.UI.BP_EMUserWidget_C"
})
M._components = {
  "BluePrints.UI.WBP.PersonInfo.Edit.WBP_PersonInfo_EditBaseView"
}

function M:Initialize(Initializer)
  self.FocusBoxIndex = nil
end

function M:Construct()
  self.KeyEventTable = {
    A = self.OnAKeyDown,
    D = self.OnDKeyDown,
    Q = self.OnQKeyDown,
    E = self.OnEKeyDown
  }
  self.Key_R:CreateCommonKey({
    KeyInfoList = {
      {Type = "Text", Text = "D"}
    }
  })
  self.Key_Controller_L:SetImage("LT")
  self.Key_Controller_R:SetImage("RT")
  self.Key_R:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Btn_Cancel:SetGamePadImg("B")
  self.Btn_Confirm:SetGamePadImg("X")
  for i = 1, 3 do
    self["Edit_AvatarItem_" .. i]:SetFocusCallback(function()
      self:OnBoxFocus(i)
    end)
    self["Edit_AvatarItem_" .. i]:SetFocusLostCallback(function()
      self:OnBoxFocusLost(i)
    end)
  end
  self.WBP_PersonalInfo_Edit_Tips:SetOnFocusSelectedItemCallback(function(TipsWidget, TipsItemWidget)
    self:OnFocusTipsSelectedItem()
  end)
  self.WBP_PersonalInfo_Edit_Tips:SetOnFocusNotSelectedItemCallback(function()
    self:OnFocusTipsNotSelectedItem()
  end)
  self.TileView_Select_Role.BP_OnItemSelectionChanged:Clear()
  self.TileView_Select_Role.BP_OnItemSelectionChanged:Add(self, self.OnListItemSelectionChanged)
  self.TileView_Select_Role.BP_OnItemIsHoveredChanged:Clear()
  self.TileView_Select_Role.BP_OnItemIsHoveredChanged:Add(self, self.OnItemIsHoverChanged)
end

function M:InitBaseView(TabName)
  self.Root:AddTimer(0.01, function()
    self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
    if self.GameInputModeSubsystem then
      self:OnUpdateUIStyleByInputTypeChange(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
    end
  end)
end

function M:OnQKeyDown()
  if self.CurMainTab.Name == "Char" then
    return
  else
    self.Com_Tab.Tabs[1].UI:SetSwitchOn(true, false)
  end
end

function M:OnEKeyDown()
  if self.CurMainTab.Name ~= "Char" then
    return
  else
    self.Com_Tab.Tabs[2].UI:SetSwitchOn(true, false)
  end
end

function M:OnAKeyDown()
  if self.CurMainTab.Name == "Char" or self.SelectedWeaeponTab == "Melee" then
    return nil
  else
    self:OnMeleeSelect()
  end
end

function M:OnDKeyDown()
  if self.CurMainTab.Name == "Char" or self.SelectedWeaeponTab == "Ranged" then
    return nil
  else
    self:OnRangedSelect()
  end
end

function M:InitTabContent(TabName)
  local TabsData = DataMgr.ShowCaseTab
  local AllTabInfo = {
    [1] = {
      Text = GText(TabsData[1].TabName),
      IconPath = TabsData[1].Icon,
      Name = "Char",
      TabId = TabsData[1].TabId
    },
    [2] = {
      Text = GText(TabsData[2].TabName),
      IconPath = TabsData[2].Icon,
      Name = "Weapon",
      TabId = TabsData[2].TabId
    }
  }
  local TabConfigData = {
    TitleName = GText("UI_PersonInfo_ShowCase_Edit"),
    LeftKey = "Q",
    RightKey = "E",
    StyleName = "TextImage",
    Tabs = AllTabInfo,
    DynamicNode = {
      "Back",
      "ResourceBar",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            Owner = self
          }
        },
        Desc = GText("UI_Tips_Ensure")
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnClose,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "B",
            ClickCallback = self.OnReturnKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_BACK")
      }
    },
    BackCallback = self.OnReturnKeyDown,
    OwnerPanel = self
  }
  self.Com_Tab:Init(TabConfigData)
  self.Com_Tab:BindEventOnTabSelected(self, self.OnTabItemSelected)
  if "Char" == TabName then
    self.Com_Tab:SelectTab(1)
  else
    self.Com_Tab:SelectTab(2)
  end
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    self:OnGamePadDown(InKeyName)
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    if self.KeyEventTable[InKeyName] ~= nil then
      self.KeyEventTable[InKeyName](self)
    elseif "Escape" == InKeyName then
      self:OnReturnKeyDown()
    end
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if self.GamePadKeyTable == nil then
    self.GamePadKeyTable = {
      [UIConst.GamePadKey.FaceButtonBottom] = self.OnGamePadAKeyDonw,
      [UIConst.GamePadKey.FaceButtonTop] = function()
        if not self.EnableY then
          return
        end
        local FocusedIndex = self.FocusBoxIndex or 1
        local CurrentBox = self["Edit_AvatarItem_" .. FocusedIndex]
        self:OnBoxItemRemoveClick(FocusedIndex)
        CurrentBox:PlayAnimation(CurrentBox.Normal)
        CurrentBox.Btn_Click:SetVisibility(UIConst.VisibilityOp.Visible)
        self.EnableY = true
      end,
      [UIConst.GamePadKey.FaceButtonLeft] = function()
        if self.WBP_PersonalInfo_Edit_Tips:HasFocusedDescendants() then
          self.WBP_PersonalInfo_Edit_Tips.Btn_Confirm.Button_Area.OnClicked:Broadcast()
          if self.LastSelectedListContent and self.LastSelectedListContent.UI then
            self.LastSelectedListContent.UI:SetFocus()
          end
          UIUtils.PlayCommonBtnSe(self)
          return
        end
        if self.Btn_Confirm.Visibility == UIConst.VisibilityOp.Visible then
          self:ReallySaveModelData()
          UIUtils.PlayCommonBtnSe(self)
        end
      end,
      [UIConst.GamePadKey.FaceButtonRight] = function()
        if self.WBP_PersonalInfo_Edit_Tips:HasFocusedDescendants() then
          self:TryToCloseTips()
          return
        end
        if self.TileView_Select_Role:HasFocusedDescendants() then
          self["Edit_AvatarItem_" .. self.SelectBoxIdx]:SetFocus()
          return
        else
          UIUtils.PlayCommonBtnSe(self)
          self:OnReturnKeyDown()
        end
      end,
      [UIConst.GamePadKey.LeftThumb] = function()
        if not self.WS_List:HasFocusedDescendants() then
          self.IsFoucsFromBox = true
        else
          self.IsFoucsFromBox = false
        end
        self.Common_Sort_List:SetFocus()
      end,
      [UIConst.GamePadKey.LeftTriggerThreshold] = function()
        self:OnAKeyDown()
        self:RefreshFocusItem()
      end,
      [UIConst.GamePadKey.RightTriggerThreshold] = function()
        self:OnDKeyDown()
        self:RefreshFocusItem()
      end
    }
  end
  if self.GamePadKeyTable[InKeyName] ~= nil then
    self.GamePadKeyTable[InKeyName](self)
    IsEventHandled = true
  end
  if false == IsEventHandled then
    IsEventHandled = self.Com_Tab:Handle_KeyEventOnGamePad(InKeyName)
  end
  IsEventHandled = true
  return IsEventHandled
end

function M:OnGamePadAKeyDonw()
  local FocusedIndex = self.FocusBoxIndex or 1
  if self.WBP_PersonalInfo_Edit_Tips:HasFocusedDescendants() then
    return
  end
  if FocusedIndex ~= self.SelectBoxIdx then
    self:OnBoxItemClick(FocusedIndex)
    return
  end
  local CurrentBox = self["Edit_AvatarItem_" .. FocusedIndex]
  AudioManager(self):PlayUISound(nil, "event:/ui/common/click_btn_large_crystal", nil, nil)
  self:SetFocusToList()
end

function M:GetZOrder()
  return 200
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UIUtils.Handled
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.CurInputDeviceType = CurInputType
  if CurInputType == ECommonInputType.Gamepad then
    self:SetOriginFocus()
    self:FreshSubKeyInfo(true)
    self.Btn_Cancel:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    self.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  else
    self:FreshSubKeyInfo(false)
    self.Btn_Cancel:SetVisibility(UIConst.VisibilityOp.Visible)
    self.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.Visible)
  end
end

function M:FreshSubKeyInfo(bIsGamePad)
  local idx = bIsGamePad and 1 or 0
  self.Switch_Mode_R:SetActiveWidgetIndex(idx)
  self.Switch_Mode_L:SetActiveWidgetIndex(idx)
end

function M:SetOriginFocus()
  local Index = self:FindFirstEmptyBoxIndex()
  self["Edit_AvatarItem_" .. Index]:SetFocus()
end

function M:OnBoxFocus(index)
  self.FocusBoxIndex = index
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:SetButtonPCStyle(false)
    AudioManager(self):PlayUISound(nil, "event:/ui/common/hover_btn_large_crystal", nil, nil)
    self:OnBoxItemClick(index)
  end
  if self["Edit_AvatarItem_" .. index].bIsEmpty then
    self:UpdataGamePadBottomAInfo(1)
  else
    self:UpdataGamePadBottomAInfo(2)
  end
end

function M:OnBoxFocusLost(index)
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:SetButtonPCStyle(true)
  end
end

function M:SetButtonPCStyle(bPC)
  self.Btn_Cancel:SetPCVisibility(bPC)
  self.Btn_Confirm:SetPCVisibility(bPC)
end

function M:SetButtongamePadStyle()
  self.Key_R:SetVisibility(UIConst.VisibilityOp.Visible)
  self.Btn_Cancel:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Btn_Confirm:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
end

function M:OnListItemClickedCommon()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.WBP_PersonalInfo_Edit_Tips:FocuesFirstItem()
  end
end

function M:OnFocusTipsSelectedItem()
  self:UpdataGamePadBottomAInfo(4)
end

function M:OnFocusTipsNotSelectedItem()
  self:UpdataGamePadBottomAInfo(3)
end

function M:RefreshFocusItem()
  self.Root:AddTimer(0.01, function()
    if self.TileView_Select_Role:HasFocusedDescendants() or self.WBP_PersonalInfo_Edit_Tips:HasFocusedDescendants() then
      self:SetFocusToList()
    end
  end)
end

function M:OnSortListWidgetBack(MyGeometry, InKeyEvent)
  if self.LastFocusList:IsVisible() then
    return self.LastFocusList
  end
end

function M:UpdataGamePadBottomAInfo(KindNum)
  self.EnableY = false
  local BottomKeyInfo = {
    {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
          Owner = self
        }
      },
      Desc = GText("UI_Tips_Ensure")
    },
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.OnClose,
          Owner = self
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = self.OnReturnKeyDown,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    }
  }
  if 2 == KindNum then
    table.insert(BottomKeyInfo, 1, {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "Y",
          Owner = self
        }
      },
      Desc = GText("UI_WeaponStrength_Clear")
    })
    self.EnableY = true
  elseif 3 == KindNum then
    BottomKeyInfo[2].Desc = GText("UI_PATCH_CANCEL")
  elseif 4 == KindNum then
    BottomKeyInfo[1] = BottomKeyInfo[2]
    BottomKeyInfo[2] = nil
    BottomKeyInfo[1].Desc = GText("UI_PATCH_CANCEL")
  end
  if nil ~= BottomKeyInfo then
    self.Com_Tab:UpdateBottomKeyInfo(BottomKeyInfo)
  end
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if InKeyName == UIConst.GamePadKey.FaceButtonRight and self.Common_Sort_List:HasAnyFocus() and self.IsFoucsFromBox then
    self:SetOriginFocus()
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  return UE4.UWidgetBlueprintLibrary.Unhandled()
end

function M:OpenTips()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self.Common_Sort_List:SetControllerKeyHidden(true)
  end
end

AssembleComponents(M)
return M
