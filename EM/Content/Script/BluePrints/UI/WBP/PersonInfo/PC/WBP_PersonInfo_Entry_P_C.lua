require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C", "BluePrints.Common.TimerMgr")
local PersonInfoController = require("BluePrints.UI.WBP.PersonInfo.PersonInfoController")
local PersonInfoModel = require("BluePrints.UI.WBP.PersonInfo.PersonInfoModel")
M._components = {
  "BluePrints.UI.WBP.PersonInfo.Base.PersonInfoEntryBaseView"
}

function M:InitTabInfo()
  if not PersonInfoModel:IsOwener() then
    if self.bHideCharTab then
      self:InitTabOthers()
    else
      self:InitTabOthersWithChar()
    end
  elseif self.bHideCharTab then
    self:InitTabWithOutChar()
  else
    self:InitTabWithChar()
  end
end

function M:InitTabOthers()
  local TabWithoutChar = {
    Tabs = self.AllTabInfo,
    DynamicNode = {
      "Back",
      "Tip",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnReturnKeyDown,
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
    StyleName = "Text",
    OwnerPanel = self,
    TitleName = GText("UI_PersonInfo_Name"),
    BackCallback = self.OnReturnKeyDown
  }
  if not self.bHideCharTab then
    local TabWithChar = {
      LeftKey = "NotShow",
      RightKey = "NotShow",
      Tabs = self.AllTabInfo,
      DynamicNode = {
        "Back",
        "Tip",
        "BottomKey"
      },
      BottomKeyInfo = {
        {
          KeyInfoList = {
            {
              Type = "Text",
              Text = "U",
              ClickCallback = self.OnUKeyDown,
              Owner = self
            }
          },
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "Y",
              ClickCallback = self.OnUKeyDown,
              Owner = self
            }
          },
          Desc = GText("UI_Dye_HideUI"),
          bLongPress = false
        },
        {
          GamePadInfoList = {
            {
              Type = "Img",
              ImgShortPath = "RH",
              Owner = self
            }
          },
          Desc = GText("UI_CTL_RotatePreview"),
          bLongPress = false
        },
        {
          KeyInfoList = {
            {
              Type = "Text",
              ImgShortPath = "Mouse_Button"
            }
          },
          GamePadInfoList = {
            {
              Type = "Or",
              ImgShortPath = "RT",
              Owner = self
            },
            GamePadSubKeyInfoList = {
              {
                Type = "Img",
                ImgShortPath = "LT",
                Owner = self
              },
              {
                Type = "Img",
                ImgShortPath = "RT",
                Owner = self
              }
            }
          },
          Desc = GText("UI_Dye_Zoom"),
          bLongPress = false
        },
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
              ClickCallback = self.OnReturnKeyDown,
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
      StyleName = "Text",
      OwnerPanel = self,
      TitleName = GText("UI_PersonInfo_Name"),
      BackCallback = self.OnReturnKeyDown
    }
  end
  self.Com_Tab:Init(TabWithoutChar)
  self.Com_Tab:SetSingleBottomKeyInfoVisibility(3, UIConst.VisibilityOp.HitTestInvisible)
  self.KeyAindex = 1
end

function M:InitTabOthersWithChar()
  local TabWithChar = {
    LeftKey = "NotShow",
    RightKey = "NotShow",
    Tabs = self.AllTabInfo,
    DynamicNode = {
      "Back",
      "Tip",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "U",
            ClickCallback = self.OnUKeyDown,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "Y",
            ClickCallback = self.OnUKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_Dye_HideUI"),
        bLongPress = false
      },
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RH",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_RotatePreview"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            ImgShortPath = "Mouse_Button"
          }
        },
        GamePadInfoList = {
          {
            Type = "Or",
            ImgShortPath = "RT",
            Owner = self
          },
          GamePadSubKeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "LT",
              Owner = self
            },
            {
              Type = "Img",
              ImgShortPath = "RT",
              Owner = self
            }
          }
        },
        Desc = GText("UI_Dye_Zoom"),
        bLongPress = false
      },
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
            ClickCallback = self.OnReturnKeyDown,
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
    StyleName = "Text",
    OwnerPanel = self,
    TitleName = GText("UI_PersonInfo_Name"),
    BackCallback = self.OnReturnKeyDown
  }
  self.Com_Tab:Init(TabWithChar)
  self.Com_Tab:SetSingleBottomKeyInfoVisibility(3, UIConst.VisibilityOp.HitTestInvisible)
  self.KeyAindex = 4
end

function M:InitTabWithChar()
  self.bIsHide = false
  local TabWithChar = {
    LeftKey = "NotShow",
    RightKey = "NotShow",
    Tabs = self.AllTabInfo,
    DynamicNode = {
      "Back",
      "Tip",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "U",
            ClickCallback = self.OnUKeyDown,
            Owner = self
          }
        },
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "Y",
            ClickCallback = self.OnUKeyDown,
            Owner = self
          }
        },
        Desc = GText("UI_Dye_HideUI"),
        bLongPress = false
      },
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "RH",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_RotatePreview"),
        bLongPress = false
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            ImgShortPath = "Mouse_Button"
          }
        },
        GamePadInfoList = {
          {
            Type = "Or",
            ImgShortPath = "RT",
            Owner = self
          },
          GamePadSubKeyInfoList = {
            {
              Type = "Img",
              ImgShortPath = "LT",
              Owner = self
            },
            {
              Type = "Img",
              ImgShortPath = "RT",
              Owner = self
            }
          }
        },
        Desc = GText("UI_Dye_Zoom"),
        bLongPress = false
      },
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
            ClickCallback = self.OnReturnKeyDown,
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
    StyleName = "Text",
    OwnerPanel = self,
    TitleName = GText("UI_PersonInfo_Name"),
    BackCallback = self.OnReturnKeyDown
  }
  self.Com_Tab:Init(TabWithChar)
  self.KeyAindex = 4
  self.Com_Tab:SetSingleBottomKeyInfoVisibility(3, UIConst.VisibilityOp.HitTestInvisible)
end

function M:InitTabWithOutChar()
  local TabWithoutChar = {
    Tabs = self.AllTabInfo,
    DynamicNode = {
      "Back",
      "Tip",
      "BottomKey"
    },
    BottomKeyInfo = {
      {
        GamePadInfoList = {
          {
            Type = "Img",
            ImgShortPath = "A",
            Owner = self
          }
        },
        Desc = GText("UI_CTL_Add")
      },
      {
        KeyInfoList = {
          {
            Type = "Text",
            Text = "Esc",
            ClickCallback = self.OnReturnKeyDown,
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
    StyleName = "Text",
    OwnerPanel = self,
    TitleName = GText("UI_PersonInfo_Name"),
    BackCallback = self.OnReturnKeyDown
  }
  self.Com_Tab:Init(TabWithoutChar)
  self.KeyAindex = 1
end

function M:Hideui()
  self.bIsHide = true
  self.HideUI_Key:SetVisibility(UIConst.VisibilityOp.Visible)
  self.PersonInfoMainPage.MainPanel:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
  self.Com_Tab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self:Playanimation(self.HideUi)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if GameInputModeSubsystem then
    GameInputModeSubsystem:SetNavigateWidgetOpacity(0)
  end
end

function M:Recoverui()
  self.bIsHide = false
  self.HideUI_Key:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.PersonInfoMainPage.MainPanel:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self.Com_Tab:SetVisibility(UIConst.VisibilityOp.SelfHitTestInvisible)
  self:Playanimation(self.ShowUi)
  local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  if GameInputModeSubsystem then
    GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
  end
end

function M:Close()
  M.Super.Close(self)
end

function M:InitListenEvent()
end

function M:OnLoaded()
  M.Super.OnLoaded(self)
  self:InitTabInfo()
  self:InitListenEvent()
end

function M:RefreshBaseInfo()
  self.HideUI_Key:CreateCommonKey({
    KeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText("U"),
        ClickCallback = self.OnUKeyDown,
        Owner = self
      }
    },
    GamePadInfoLst = {
      {
        Type = "Img",
        ImgShortPath = "Y",
        ClickCallback = self.OnUKeyDown,
        Owner = self
      }
    },
    Desc = GText("UI_Dye_HideUI"),
    bLongPress = false
  })
  self.PersonInfoMainPage = self:CreatePersonInfoMainPage({
    PCBluePrint = "WidgetBlueprint'/Game/UI/WBP/PersonalInfo/PC/WBP_PersonalInfo_Main_P.WBP_PersonalInfo_Main_P'"
  })
  if self.PersonInfoMainPage then
    self.PersonInfoMainPage:PlayAnimation(self.PersonInfoMainPage.In)
  end
  self.PersonInfoMainPage.RootPage = self
  if self.bIsHide == true then
    self:Hideui()
  else
    self:Recoverui()
  end
  self:OnMainPageLoaded()
end

function M:CreatHideUiKey(IsGamePad)
  local MyKeyInfoList = {}
  if IsGamePad then
    MyKeyInfoList = {
      {
        Type = "Img",
        ImgShortPath = "Y",
        ClickCallback = self.OnUKeyDown,
        Owner = self
      }
    }
  else
    MyKeyInfoList = {
      {
        Type = "Text",
        Text = CommonUtils:GetKeyText("U"),
        ClickCallback = self.OnUKeyDown,
        Owner = self
      }
    }
  end
  self.HideUI_Key:CreateCommonKey({
    KeyInfoList = MyKeyInfoList,
    Desc = GText("UI_Dye_HideUI"),
    bLongPress = false
  })
end

function M:OnMainPageLoaded()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:FreshViewByInputDevice(true)
  end
  self.PersonInfoMainPage.Btn_EditSign.OnHovered:Add(self, function()
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      self:UpdataGamePadBottomAInfo(4)
    end
  end)
end

function M:OnReturnKeyDown()
  if not self:CheckIsCanCloseSelf() then
    return
  end
  self:PlayOutAnim()
end

function M:OnUKeyDown()
  self.bIsHide = not self.bIsHide
  if self.bIsHide == true then
    self:Hideui()
  else
    self:Recoverui()
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    self.IsGamePad = true
    IsEventHandled = self:OnGamePadDown(InKeyName)
  else
    self.IsGamePad = false
    if "U" == InKeyName then
      if self.bHideCharTab then
        return UE4.UWidgetBlueprintLibrary.Handled()
      end
      self:OnUKeyDown()
    end
    if "Escape" == InKeyName then
      if true ~= self.bIsHide then
        self:OnReturnKeyDown()
      else
        if self.bHideCharTab then
          return UE4.UWidgetBlueprintLibrary.Handled()
        end
        self.bIsHide = not self.bIsHide
        self:Recoverui()
      end
      IsEventHandled = true
    end
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnAnalogValueChanged(MyGeometry, InAnalogInputEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InAnalogInputEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if self.bHideCharTab then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    if "Gamepad_RightTriggerAxis" == InKeyName then
      self.PersonInfoMainPage:ZoomCamare(-0.2)
      IsEventHandled = true
    elseif "Gamepad_LeftTriggerAxis" == InKeyName then
      self.PersonInfoMainPage:ZoomCamare(0.2)
      IsEventHandled = true
    else
      local MoveDeltaX = UKismetInputLibrary.GetAnalogValue(InAnalogInputEvent)
      if "Gamepad_RightX" == InKeyName and nil ~= MoveDeltaX then
        if self.PersonInfoMainPage then
          self.PersonInfoMainPage:RotateActorForGamePad(MoveDeltaX)
        end
        IsEventHandled = true
      end
    end
  end
  if IsEventHandled then
    return UE4.UWidgetBlueprintLibrary.Handled()
  else
    return UE4.UWidgetBlueprintLibrary.UnHandled()
  end
end

function M:OnGamePadDown(InKeyName)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  local s = self.GameInputModeSubsystem:GetCurrentLocalPlayerFocusWidgetType()
  local IsEventHandled = self.Com_Tab:Handle_KeyEventOnGamePad(InKeyName)
  if InKeyName == UIConst.GamePadKey.FaceButtonTop then
    if self.bHideCharTab then
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
    self:OnUKeyDown()
  elseif self.bIsHide == true then
    return false
  elseif "Gamepad_Special_Left" == InKeyName then
    if not self.PersonInfoMainPage.IsEditOpen then
      self.PersonInfoMainPage:OnCopyUID()
    end
  elseif InKeyName == UIConst.GamePadKey.SpecialRight then
    if not self.PersonInfoMainPage.IsEditOpen then
      self.PersonInfoMainPage:OnClickOpenDataPage()
    end
  elseif InKeyName == UIConst.GamePadKey.FaceButtonLeft then
    if not self.PersonInfoMainPage.IsEditOpen then
      self.PersonInfoMainPage:OnClickOpenEditPage()
      if self.PersonInfoMainPage.IsEditOpen == false then
        DebugPrint("\232\129\154\231\132\166\231\154\132\228\191\157\229\173\152\231\154\132widget")
        self:FocusToSavedWidget()
        self.PersonInfoMainPage:FreshFocusLeaveEditListView()
      end
      if self.PersonInfoMainPage.Panel_Edit:HasFocusedDescendants() then
        DebugPrint("Panel_Edit\232\191\152\230\156\137\232\129\154\231\132\166\239\188\140\232\129\154\231\132\166\229\155\158\229\142\187")
        self:SetFocus()
      end
    end
  elseif "Gamepad_LeftThumbstick" == InKeyName then
    if not PersonInfoModel:IsOwener() then
      return UE4.UWidgetBlueprintLibrary.Handled()
    end
    if not self.PersonInfoMainPage.IsEditOpen then
      self.PersonInfoMainPage:OnClickEdit()
      self:UpdataGamePadBottomAInfo(4)
      self:SaveCurrentFocusedWidget()
      self:AddTimer(0.1, function()
        local firstUi = self.PersonInfoMainPage:GetFisrtEditItem()
        if firstUi then
          DebugPrint("\232\129\154\231\132\166\229\136\176\231\172\172\228\184\128\228\184\170ui")
          firstUi:SetFocus()
          self.PersonInfoMainPage.Edit_List:SetSelectedIndex(0)
          if self.PersonInfoMainPage.Panel_Edit:HasFocusedDescendants() then
            self.PersonInfoMainPage:FreshFocusOnEditListView()
          end
        end
      end)
    else
      self.PersonInfoMainPage:OnClickEdit()
      if false == self.PersonInfoMainPage.IsEditOpen then
        DebugPrint("\232\129\154\231\132\166\229\136\176\228\191\157\229\173\152\231\154\132widget")
        self:FocusToSavedWidget()
        if self.PersonInfoMainPage.Panel_Edit:HasFocusedDescendants() then
          DebugPrint("\229\176\157\232\175\149\229\133\179\233\151\173\231\149\140\233\157\162\239\188\140\232\129\154\231\132\166\229\155\158\230\157\165")
          self:SetFocus()
        end
        self.PersonInfoMainPage:FreshFocusLeaveEditListView()
      end
    end
  end
  return IsEventHandled
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.CurInputDeviceType = CurInputType
  if PersonInfoController.CurPage == PersonInfoController.PageEnum.EditPage and IsValid(PersonInfoController.EditPage) then
    PersonInfoController.EditPage:SetFocus()
    PersonInfoController.EditPage:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  elseif PersonInfoController.CurPage == PersonInfoController.PageEnum.MainPage and IsValid(PersonInfoController.MainPage) then
    if not self:HasAnyFocus() then
      return
    end
    self.PersonInfoMainPage.CurInputDeviceType = CurInputType
    if CurInputType == ECommonInputType.Gamepad then
      if self.PersonInfoMainPage then
        if not UIManager(self):GetUIObj("CommonDialog") then
          self.PersonInfoMainPage:SetOriginFocus()
        end
        self:FreshViewByInputDevice(true)
        self:CreatHideUiKey(true)
      end
    else
      self:CreatHideUiKey(false)
      self:FreshViewByInputDevice(false)
    end
  end
end

function M:FreshViewByInputDevice(bIsGamePad)
  if not self.PersonInfoMainPage then
    return
  end
  if bIsGamePad then
    if PersonInfoModel:IsOwener() then
      self.PersonInfoMainPage.Key_Controller:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
      self.PersonInfoMainPage.Key_ControllerImg:SetVisibility(UIConst.VisibilityOp.HitTestInvisible)
    end
    self.PersonInfoMainPage.WS_Copy:SetActiveWidgetIndex(1)
    self.PersonInfoMainPage:SetOriginFocus()
  else
    self.PersonInfoMainPage.Key_Controller:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.PersonInfoMainPage.Key_ControllerImg:SetVisibility(UIConst.VisibilityOp.Collapsed)
    self.PersonInfoMainPage.WS_Copy:SetActiveWidgetIndex(0)
  end
end

function M:Handle_KeyDownOnGamePad()
  return true
end

function M:UpdataGamePadBottomAInfo(KindNum)
  local keytable = {}
  if KindNum then
    local Kind2KeyTable = {
      "UI_CTL_Add",
      "UI_Controller_CheckDetails",
      "UI_Controller_Switch",
      "UI_Tips_Ensure"
    }
    keytable = {
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
          Owner = self
        }
      },
      Desc = GText(Kind2KeyTable[KindNum]),
      bLongPress = false
    }
  end
  self.Com_Tab:SetSingleBottomKeyInfo(self.Com_Tab.BottomKeyWidget[self.KeyAindex], keytable)
  return
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  M.Super.OnFocusReceived(self, MyGeometry, InFocusEvent)
  if PersonInfoController.CurPage == PersonInfoController.PageEnum.EditPage and IsValid(PersonInfoController.EditPage) then
    PersonInfoController.EditPage:SetFocus()
  elseif PersonInfoController.CurPage == PersonInfoController.PageEnum.DataPage then
    ScreenPrint("\231\187\159\232\174\161\231\149\140\233\157\162\230\137\147\229\188\128\228\184\173\239\188\140\232\129\154\231\132\166\229\136\176\231\187\159\232\174\161\231\149\140\233\157\162")
    PersonInfoController.DataPage:SetFocus()
  else
    ScreenPrint("\228\184\187\231\149\140\233\157\162\230\137\147\229\188\128\228\184\173\239\188\140\232\129\154\231\132\166\229\136\176\228\184\187\231\149\140\233\157\162")
    if self.PersonInfoMainPage then
      self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
      self:OnUpdateUIStyleByInputTypeChange(self.GameInputModeSubsystem:GetCurrentInputType(), self.GameInputModeSubsystem:GetCurrentGamepadName())
      self.PersonInfoMainPage:SetOriginFocus()
      local GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
      GameInputModeSubsystem:SetNavigateWidgetOpacity(1)
    end
  end
  return UIUtils.Handled
end

function M:OnAddedToFocusPath(InFocusEvent)
  self:AddTimer(0.1, function()
    if self.PersonInfoMainPage and self.CurInputDeviceType == ECommonInputType.Gamepad and not self:HasFocusedDescendants() then
      self:FocusToSavedWidget()
      self.PersonInfoMainPage:FreshFocusLeaveEditListView()
      if not self:HasFocusedDescendants() then
        self.PersonInfoMainPage:SetOriginFocus()
      end
      DebugPrint("Yklua1111  OnAddedToFocusPath")
    end
  end)
end

function M:OnItemFocus()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:UpdataGamePadBottomAInfo(1)
  end
end

function M:OnCheckBoxFocus()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:UpdataGamePadBottomAInfo(3)
  end
end

function M:GamePadOpenEditList()
end

AssembleComponents(M)
return M
