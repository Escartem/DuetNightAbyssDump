require("UnLua")
local M = Class({
  "BluePrints.UI.BP_UIState_C"
})
M._components = {
  "BluePrints.UI.WBP.Armory.WBP_Armory_PetEnhance_Base_Compoment"
}

function M:Construct()
  self.IsPc = true
  local PlayerController = UE4.UGameplayStatics.GetPlayerController(self, 0)
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(PlayerController)
end

function M:InitTabInfo()
  self.Tab_PetEnhance:Init({
    Tabs = {},
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
        Desc = GText("UI_CTL_Add/Remove")
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
    TitleName = GText("Pet_Affix_Break"),
    BackCallback = function()
      self:OnReturnKeyDown(true)
    end
  })
end

function M:Close()
  M.Super.Close(self)
end

function M:OnLoaded(...)
  M.Super.OnLoaded(self, ...)
  self:PlayInAnim()
  self:AddTimer(0.1, function()
    self:SetOriginFocus()
  end, nil, nil, nil, true)
end

function M:OnReturnKeyDown(bIsForceClose)
  if self.IsListExpanded == true and true ~= bIsForceClose then
    self:ExpandList(false)
    if self.CurInputDeviceType == ECommonInputType.Gamepad then
      self:SetOriginFocus()
    end
    return
  end
  if not self:CheckIsCanCloseSelf() then
    return
  end
  self:PlayOutAnim()
end

function M:OnPreviewKeyDown(MyGeometry, InKeyEvent)
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) and InKeyName == UIConst.GamePadKey.FaceButtonBottom then
    self:OnGamePadADown()
  end
  return UE4.UWidgetBlueprintLibrary.UnHandled()
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  local InputEvent = UWidgetBlueprintLibrary.GetInputEventFromKeyEvent(InKeyEvent)
  if UKismetInputLibrary.InputEvent_IsRepeat(InputEvent) then
    return UIUtils.Handled
  end
  local IsEventHandled = false
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    IsEventHandled = self:OnGamePadDown(InKeyName)
  elseif "Escape" == InKeyName then
    IsEventHandled = true
    self:OnReturnKeyDown()
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if self.GamePadKeyTable == nil then
    self.GamePadKeyTable = {
      [UIConst.GamePadKey.FaceButtonRight] = function()
        self:OnReturnKeyDown()
      end,
      [UIConst.GamePadKey.LeftThumb] = function()
        self.Selective_Listing.Common_Sort_List:SetFocus()
      end,
      [UIConst.GamePadKey.FaceButtonLeft] = function()
        if self.Btn_Enhance.IsForbidden == false then
          self:OnEnhanceClicked()
        end
      end,
      [UIConst.GamePadKey.FaceButtonBottom] = function()
        self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
        local s = self.GameInputModeSubsystem:GetCurrentLocalPlayerFocusWidgetType()
        self:OnGamePadADown()
      end,
      [UIConst.GamePadKey.SpecialRight] = function()
        if self.bItemDetailsShowed then
          self:LockOrUnlockPet()
        end
      end
    }
  end
  if self.GamePadKeyTable[InKeyName] ~= nil then
    self.GamePadKeyTable[InKeyName](self)
    IsEventHandled = true
  end
  if false == IsEventHandled then
    IsEventHandled = self.Tab_PetEnhance:Handle_KeyEventOnGamePad(InKeyName)
  end
  return IsEventHandled
end

function M:OnUpdateUIStyleByInputTypeChange(CurInputType, CurGamepadName)
  self.CurInputDeviceType = CurInputType
  if CurInputType == ECommonInputType.Gamepad then
    if self:HasAnyFocus() then
      self:SetOriginFocus()
    end
    return
  else
  end
end

function M:SetOriginFocus()
  self.GameInputModeSubsystem = UGameInputModeSubsystem.GetGameInputModeSubsystem(self)
  local Type = self.GameInputModeSubsystem:GetCurrentLocalPlayerFocusWidgetType()
  if "SObjectWidget" == Type then
    for i = 1, 3 do
      if self["EntryItem_" .. i]:HasAnyUserFocus() then
        return
      end
    end
  end
  if self.IsListExpanded then
    self.Selective_Listing:SetFocusToList()
    return
  end
  local index = self.CurEntryContent.index
  self.EntryItemWidgets[index]:SetFocus()
  self:SetSingleBottomKeyInfo(2)
end

function M:LuaNavOutItemRight()
  if self.Item_1.Panel_Add.Visibility == UIConst.VisibilityOp.SelfHitTestInvisible then
    return self.Item_1
  end
  return nil
end

function M:OnEntryGamePadNavigationLeft()
  local index = self.CurEntryContent.index - 1
  if index >= 1 and self.EntryItemWidgets[index] then
    local WidgetNameIndex = self.EntryItemWidgets[index].WidgetIndex
    self:OnEntryClicked(WidgetNameIndex)
    return self.EntryItemWidgets[index]
  end
  return nil
end

function M:OnEntryGamePadNavigationRight()
  local index = self.CurEntryContent.index + 1
  if self.EntryItemWidgets[index] then
    local WidgetNameIndex = self.EntryItemWidgets[index].WidgetIndex
    self:OnEntryClicked(WidgetNameIndex)
    return self.EntryItemWidgets[index]
  end
  return nil
end

function M:OnGamePadADown()
  if self.IsListExpanded == false then
    if self.CurEntryContent.IsLocked or self.CurEntryContent.IsEmpty then
      return
    else
      if self.CurEntryContent.EntryId and DataMgr.PetEntry[self.CurEntryContent.EntryId].PetEntryUPID == nil then
        return
      else
      end
    end
    self:ExpandList(true)
    self:FocusListItem()
  else
    local FilteredPets = self:GetFilteredPet(self.CurEntryContent.EntryId)
    if FilteredPets and 0 == #FilteredPets then
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("AvailablePet_Empty"))
    else
      UIManager(self):ShowUITip(UIConst.Tip_CommonToast, GText("UI_Armory_Toast_Material"))
    end
  end
end

function M:SetSingleBottomKeyInfo(KindIndex)
  local Keys = {
    "UI_CTL_Add/Remove",
    "UI_CTL_Pet_Select"
  }
  if nil ~= KindIndex and nil == Keys[KindIndex] then
    ScreenPrint("\228\188\160\229\133\165index\233\148\153\232\175\175\239\188\140\230\178\161\230\156\137\229\175\185\229\186\148\230\150\135\230\156\172")
    return
  end
  local AKeyInfo = {
    GamePadInfoList = {
      {
        Type = "Img",
        ImgShortPath = "A",
        Owner = self
      }
    },
    Desc = GText(Keys[KindIndex])
  }
  if nil == KindIndex then
    AKeyInfo = {}
  end
  if self.Tab_PetEnhance and self.Tab_PetEnhance.BottomKeyWidget[1] then
    self.Tab_PetEnhance:SetSingleBottomKeyInfo(self.Tab_PetEnhance.BottomKeyWidget[1], AKeyInfo)
  end
end

function M:ChanegeSelectEntry()
  if self.CurInputDeviceType == ECommonInputType.Gamepad then
    self:SetSingleBottomKeyInfo(2)
  end
end

function M:InitEnhaceEntry()
end

function M:InitMaxEntry()
end

function M:InitLockedEntry()
end

function M:InitLNullEntry()
  self:SetSingleBottomKeyInfo(nil)
end

AssembleComponents(M)
return M
