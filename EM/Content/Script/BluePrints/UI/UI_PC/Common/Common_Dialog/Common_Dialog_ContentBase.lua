require("UnLua")
local Common_Dialog_ContentBase = Class("BluePrints.UI.BP_UIState_C")

function Common_Dialog_ContentBase:PreInitContent(Params, PopupData, Owner)
  self.Owner = Owner
end

function Common_Dialog_ContentBase:InitContent(Params, PopupData, Owner)
  self.Owner = Owner
end

function Common_Dialog_ContentBase:PostInitContent(Params, PopupData, Owner)
end

function Common_Dialog_ContentBase:HandleDialogFocused()
  return nil
end

function Common_Dialog_ContentBase:OnContentMouseButtonDown(MyGeometry, InPointerEvent)
end

function Common_Dialog_ContentBase:OnContentPreviewKeyDown(MyGeometry, InPointerEvent)
end

function Common_Dialog_ContentBase:OnContentKeyDown(MyGeometry, InKeyEvent)
end

function Common_Dialog_ContentBase:OnContentKeyUp(MyGeometry, InKeyEvent)
end

function Common_Dialog_ContentBase:OnContentAnalogValueChanged(MyGeometry, InAnalogInputEvent)
end

function Common_Dialog_ContentBase:BindDialogEvent(EventName, EventFunc)
  if self.Owner then
    self.Owner:AddEventListener(EventName, self, EventFunc)
  end
end

function Common_Dialog_ContentBase:UnbindDialogEvent(EventName)
  if self.Owner then
    self.Owner:RemoveEventListener(EventName)
  end
end

function Common_Dialog_ContentBase:BroadcastDialogEvent(EventName, ...)
  if self.Owner then
    self.Owner:BroadcastDialogEvent(EventName, ...)
  end
end

function Common_Dialog_ContentBase:PackageData()
  DebugPrint("Tianyi@ PackageData is not implemented")
  return nil
end

function Common_Dialog_ContentBase:SetContentWidgetName(Name)
  self.ContentWidgetName = Name
end

function Common_Dialog_ContentBase:GetContentWidgetName()
  return self.ContentWidgetName
end

function Common_Dialog_ContentBase:InitGamepadView()
end

function Common_Dialog_ContentBase:InitKeyboardView()
end

function Common_Dialog_ContentBase:SetGamepadBtnKeyVisibility(IsShow)
  if self.Owner then
    self.Owner:SetGamepadBtnKeyVisibility(IsShow)
  end
end

function Common_Dialog_ContentBase:ShowGamepadScrollBtn(bIsShow)
  if self.Owner then
    self.Owner:ShowGamepadScrollBtn(bIsShow)
  end
end

function Common_Dialog_ContentBase:ShowGamepadShortcutBtn(Params)
  if self.Owner then
    return self.Owner:InitGamepadShortcut(Params)
  end
end

function Common_Dialog_ContentBase:HideGamepadShortcut(Index)
  if self.Owner and Index then
    self.Owner:HideGamepadShortcut(Index)
  end
end

function Common_Dialog_ContentBase:HideAllGamepadShortcut(Index)
  if self.Owner then
    self.Owner:HideAllGamepadShortcut()
  end
end

function Common_Dialog_ContentBase:ShowGamepadShortcut(Index)
  if self.Owner then
    self.Owner:ShowGamepadShortcut(Index)
  end
end

function Common_Dialog_ContentBase:ShowGamepadCloseBtn(bShow)
  if self.Owner then
    self.Owner:ShowGamepadCloseBtn(bShow)
  end
end

function Common_Dialog_ContentBase:ChangeCloseShortKeyText(Text)
  local Key = self.Owner:GetGamepadShortcutByIndex(self.Owner.GamepadCloseBtnIndex)
  if Key then
    Key:SetDescription(Text)
  end
end

return Common_Dialog_ContentBase
