require("UnLua")
local M = Class({
  "BluePrints.UI.WBP.Armory.WBP_Armory_PetIndex_Base_C"
})

function M:Construct()
  self.KeyDownEvents = {}
  self.KeyDownEvents[EKeys.Escape.KeyName] = self.OnBackKeyDown
  self.KeyDownEvents[UIConst.GamePadKey.FaceButtonRight] = self.OnBackKeyDown
  self.KeyDownEvents[UIConst.GamePadKey.LeftThumb] = self.FocusToSortWidget
  self.BottomKeyInfo = {
    {
      KeyInfoList = {
        {
          Type = "Text",
          Text = "Esc",
          ClickCallback = self.OnBackKeyDown,
          Owner = self
        }
      },
      GamePadInfoList = {
        {
          Type = "Img",
          ImgShortPath = "B",
          ClickCallback = self.OnBackKeyDown,
          Owner = self
        }
      },
      Desc = GText("UI_BACK")
    }
  }, M.Super.Construct(self)
  self.List_Item.BP_OnItemSelectionChanged:Clear()
  self.List_Item.BP_OnItemSelectionChanged:Add(self, self.OnListItemSelectionChanged)
  self:RefreshOpInfoByInputDevice(UIUtils.UtilsGetCurrentInputType())
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  self.IsGamepadInput = CurInputDevice == ECommonInputType.Gamepad
  if self.IsGamepadInput and self.bInFocusPath and not self.IsSortWidgetFocused and not self.IsListFocused then
    self:NavigateToList()
  end
end

function M:NavigateToList()
  self.List_Item:BP_CancelScrollIntoView()
  self.List_Item:BP_SetSelectedItem(self.SelectedContent)
  self.List_Item:BP_NavigateToItem(self.SelectedContent)
  return self.List_Item
end

function M:OnListItemSelectionChanged(Content, IsSelected)
  if not IsSelected then
    return
  end
  if self.IsGamepadInput then
    self:OnItemClicked(Content)
  end
end

function M:ModifySortWidgetParams(Params)
  function Params.OnAddedToFocusPath()
    self.IsSortWidgetFocused = true
  end
  
  function Params.OnRemovedFromFocusPath()
    self.IsSortWidgetFocused = false
  end
  
  function Params.OnGetBackFocusWidget()
    return self.List_Item
  end
end

function M:OnKeyDown(MyGeometry, InKeyEvent)
  if CommonUtils:IfExistSystemGuideUI(self) then
    return UE4.UWidgetBlueprintLibrary.Handled()
  end
  local InputEvent = UWidgetBlueprintLibrary.GetInputEventFromKeyEvent(InKeyEvent)
  if UKismetInputLibrary.InputEvent_IsRepeat(InputEvent) then
    return UIUtils.Handled
  end
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  local KeyDownEvent = self.KeyDownEvents[InKeyName]
  if KeyDownEvent then
    local Reply, IsHandled = KeyDownEvent(self)
    if IsHandled then
      return Reply
    end
  end
  return UE4.UWidgetBlueprintLibrary.Handled()
end

function M:OnFocusReceived(MyGeometry, InFocusEvent)
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self:NavigateToList())
end

function M:FocusToSortWidget()
  return UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.PetEntryAchive.Pet_Sort), true
end

function M:OnAddedToFocusPath()
  self.bInFocusPath = true
end

function M:OnRemovedFromFocusPath()
  self.bInFocusPath = false
end

return M
