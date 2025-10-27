require("UnLua")
local WBP_Common_Dialog_Title_SubTab_PC_C = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")
WBP_Common_Dialog_Title_SubTab_PC_C._components = {
  "Blueprints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_Title.Common_Dialog_TitleBase"
}

function WBP_Common_Dialog_Title_SubTab_PC_C:InitContent(Params, PopupData, Owner)
  self.Super.InitContent(self, Params, PopupData, Owner)
  self:RegisterCloseButton(self.BtnClose, PopupData)
  if not PopupData.NotShowCloseButton then
    self.BtnClose:SetVisibility(UE4.ESlateVisibility.Visible)
  else
    self.BtnClose:SetVisibility(UE4.ESlateVisibility.Collapsed)
  end
  if Params and Params.TabConfigData then
    self.Com_Tab:Init(Params.TabConfigData)
    self.Com_Tab:BindEventOnTabSelected(self, self.OnTabSelected)
    self.Com_Tab:SelectTab(Params.TabConfigData.DefaultTabId or 1)
  end
  self:BindDialogEvent(DialogEvent.DoSelectTab, function(self, Index)
    self.Com_Tab:SelectTab(Index)
  end)
end

function WBP_Common_Dialog_Title_SubTab_PC_C:OnTabSelected(TabWidget)
  self:BroadcastDialogEvent(DialogEvent.OnTitleTabSelected, TabWidget)
end

function WBP_Common_Dialog_Title_SubTab_PC_C:OnContentKeyDown(MyGeometry, InKeyEvent)
  self.Super.OnContentKeyDown(self, MyGeometry, InKeyEvent)
  local InKey = UE4.UKismetInputLibrary.GetKey(InKeyEvent)
  local InKeyName = UE4.UFormulaFunctionLibrary.Key_GetFName(InKey)
  if UE4.UKismetInputLibrary.Key_IsGamepadKey(InKey) then
    self.Com_Tab:Handle_KeyEventOnGamePad(InKeyName)
  else
    self.Com_Tab:Handle_KeyEventOnPC(InKeyName)
  end
end

AssembleComponents(WBP_Common_Dialog_Title_SubTab_PC_C)
return WBP_Common_Dialog_Title_SubTab_PC_C
