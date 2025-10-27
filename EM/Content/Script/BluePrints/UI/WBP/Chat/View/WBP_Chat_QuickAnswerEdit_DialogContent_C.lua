require("UnLua")
local ChatModel = ChatController:GetModel()
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:Construct()
  self.SendIndex = {}
  self.TipTimerKey = "WBP_Chat_QuickAnswerEdit_C_Tip"
  ChatController:RegisterEvent(self, function(self, EventId, ...)
    if EventId == ChatCommon.EventID.QuickMsgChanged then
      local Index = (...)
      if self.SendIndex[Index] then
        self.SendIndex[Index] = nil
      end
      self:TrySuccessClose()
    end
  end)
  AudioManager(self):PlayUISound(self, "event:/ui/common/team_quick_msg_show", "QuickAnswerEditOpen", nil)
end

function M:TrySuccessClose()
  if not next(self.SendIndex) then
    ChatController:ShowToast(GText("UI_Chat_QuickMsgEditSuccess"))
    self.Owner:OnClose()
  end
end

function M:Destruct()
  ChatController:UnRegisterEvent(self)
  self.Params.OnDialogCloseCallback()
  AudioManager(self):SetEventSoundParam(self, "QuickAnswerEditOpen", {ToEnd = 1})
end

function M:PreInitContent(Parmas, PopupData, Owner)
  M.Super.PreInitContent(self, Parmas, PopupData, Owner)
  self.Owner = Owner
  self.Params = Parmas
  self.Params.OwnerDialog = self.Owner
  self.IsEditting = false
  self.IsEdittingMode = false
  self.Changes = {}
  
  function self.Owner.ForbiddenRightBtnClickedCallback()
    if self.IsEditting then
      ChatController:ShowToast(GText("UI_Chat_QuickMsgEditing"))
    else
      ChatController:ShowToast(GText("UI_Chat_NoChange"))
    end
    AudioManager(self):PlayUISound(self, "event:/ui/common/input_err", nil, nil)
  end
  
  function self.Owner.RightBtnClickedCallback()
    self:OnRightBtnClicked()
  end
end

function M:OnRightBtnClicked()
  for i, Item in ipairs(self.ItemUIs) do
    if Item:IsChanged() then
      ChatController:SendChangeQuickMessage(i, Item.Text)
      self.SendIndex[i] = true
    end
    self:AddTimer(Item.AnimInterval * (i - 1), function()
      Item:Close()
    end)
  end
  self:TrySuccessClose()
  AudioManager(self):PlayUISound(self, "event:/ui/common/click_btn_confirm", nil, nil)
end

function M:InitContent(Parmas, PopupData, Owner)
  M.Super.InitContent(self, Parmas, PopupData, Owner)
  self.ItemUIs = {}
  self.VB:ClearChildren()
  local MsgDataList = ChatModel:GetQuickMsgDatas()
  local MsgDataNum = #MsgDataList
  local PrevItem
  for i, Text in ipairs(MsgDataList) do
    local Item = self:CreateItem()
    self.VB:AddChild(Item)
    if 1 == i then
      Item:SetFocus()
      Item:SetNavigationRuleBase(EUINavigation.Up, EUINavigationRule.Stop)
    end
    if i == MsgDataNum then
      Item:SetNavigationRuleBase(EUINavigation.Down, EUINavigationRule.Stop)
    end
    if PrevItem then
      PrevItem:SetNavigationRuleExplicit(EUINavigation.Down, Item)
      Item:SetNavigationRuleExplicit(EUINavigation.Up, PrevItem)
    end
    PrevItem = Item
    Item:SetNavigationRuleBase(EUINavigation.Left, EUINavigationRule.Stop)
    Item:SetNavigationRuleBase(EUINavigation.Right, EUINavigationRule.Stop)
    self:AddTimer(Item.AnimInterval * (i - 1), function()
      Item:Init(self, i, Text)
    end)
    table.insert(self.ItemUIs, Item)
  end
  self.Owner:HideDialogTip(1, false)
  self.Owner:HideDialogTip(2, false)
  self.Btn_Yes = self.Owner:GetButtonBar().Btn_Yes
  self.Btn_Quit = self.Owner:GetButtonBar().Btn_Quit
  
  function self.Btn_Yes.SoundFunc()
  end
  
  self.Btn_Yes:SetGamePadImg("Y")
end

function M:ForbidRightBtn(bOn)
  self.Btn_Yes:ForbidBtn(bOn)
end

function M:OnEditingItem(Item)
  if self.CurrItem and self.CurrItem ~= Item then
    self.CurrItem:OnNoReleased(true)
  end
  self.IsEditting = true
  self.CurrItem = Item
  self.CurrEdittingItem = Item
  if table.isempty(self.Changes) then
    self:ForbidRightBtn(true)
  end
end

function M:ExitEditing()
  if not self.IsEditting then
    return
  end
  self.IsEditting = false
end

function M:UpdateEdittingMode(IsEditting)
  self.IsEdittingMode = IsEditting
  local IsShow = not IsEditting
  self.Btn_Yes:SetGamepadIconVisibility(IsShow)
  self.Btn_Quit:SetGamepadIconVisibility(IsShow)
end

function M:OnSelectItem(Item)
  if self.CurrSelectItem and self.CurrSelectItem ~= Item then
    self.CurrSelectItem:UnSelect()
  end
  if self.IsEditting and Item ~= self.CurrItem then
    self:ExitEditing()
  end
  self.CurrSelectItem = Item
end

function M:ShowTip(bWarning, TipText)
  if self:IsExistTimer(self.TipTimerKey) then
    self:RemoveTimer(self.TipTimerKey)
    self.Owner:HideDialogTip(1, false)
    self.Owner:HideDialogTip(2, false)
  end
  local TipIndex = bWarning and 1 or 2
  local Params = {
    DialogItemIndex = TipIndex,
    bHideDialogItem = false,
    bShouldPlayAnim = true,
    Tips = {TipText, TipText}
  }
  AudioManager(self):PlayUISound(self, "event:/ui/common/input_err", nil, nil)
  self:BroadcastDialogEvent("UpdateDialogTipText", Params)
  self:BroadcastDialogEvent(DialogEvent.HideDialogItem, Params)
end

function M:OnContentFocusReceived()
  if self.IsEditting then
    if self.CurrItem then
      self.CurrItem:SetFocus()
    end
  elseif self.CurrSelectItem then
    self.CurrSelectItem:SetFocus()
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
  end
  return UWidgetBlueprintLibrary.UnHandled()
end

function M:OnGamePadDown(InKeyName)
  local IsEventHandled = false
  if InKeyName == Const.GamepadFaceButtonUp then
    if not self.IsEdittingMode and not self.Btn_Yes:IsBtnForbidden() then
      self:OnRightBtnClicked()
    end
    IsEventHandled = true
  end
  return IsEventHandled
end

return M
