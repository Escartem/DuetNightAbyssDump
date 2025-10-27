require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:Construct()
  self.AllQuestPhaseIdValue = {}
  self.AllRewardPreview = {}
  self.List_Reward:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
  self.List_Reward:SetControlScrollbarInside(true)
  self:AddInputMethodChangedListen()
end

function M:InitAllRewardInfo()
  for k, v in pairs(DataMgr.StarterQuestPhaseMap) do
    if DataMgr.StarterQuestPhase[k] then
      table.insert(self.AllQuestPhaseIdValue, k)
    end
  end
  table.sort(self.AllQuestPhaseIdValue)
  for _, PhaseId in ipairs(self.AllQuestPhaseIdValue) do
    local QuestPhaseConfigData = DataMgr.StarterQuestPhase[PhaseId]
    self.AllRewardPreview[PhaseId] = QuestPhaseConfigData.RewardPreview
  end
end

function M:InitContent(Params, PopupData, Owner)
  M.Super.InitContent(self, Params, PopupData, Owner)
  self.List_Reward:ClearListItems()
  self:InitAllRewardInfo()
  for StartIndex, PhaseId in ipairs(self.AllQuestPhaseIdValue) do
    local ItemObject = NewObject(UIUtils.GetCommonItemContentClass())
    ItemObject.Index = StartIndex
    ItemObject.PhaseId = PhaseId
    ItemObject.Parent = self
    ItemObject.RewardPreview = self.AllRewardPreview[PhaseId]
    self.List_Reward:AddItem(ItemObject)
  end
  self.List_Reward:NavigateToIndex(0)
end

function M:InitGamepadView()
  if not self.GamepadAKeyIndex then
    self.GamepadAKeyIndex = self:ShowGamepadShortcutBtn({
      KeyInfoList = {
        {
          Type = "Img",
          ImgShortPath = "A",
          Owner = self
        }
      },
      Desc = GText("UI_Controller_CheckDetails"),
      bLongPress = false
    })
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
  if InKeyName == Const.GamepadFaceButtonRight and self.FocusTypeName == "RewardWidget" then
    self:UpdatKeyDisplay("SelfWidget")
    IsEventHandled = true
  end
  return IsEventHandled
end

function M:UpdatKeyDisplay(FocusTypeName)
  if UIUtils.UtilsGetCurrentInputType() ~= ECommonInputType.Gamepad or self.Mobile then
    return
  end
  self.FocusTypeName = FocusTypeName
  if "RewardWidget" == FocusTypeName then
    self:HideAllGamepadShortcut()
  elseif "SelfWidget" == FocusTypeName then
    self:ShowGamepadShortcut(self.GamepadAKeyIndex)
    self:ShowGamepadShortcut(self.GamepadAKeyIndex + 1)
  end
end

function M:RefreshOpInfoByInputDevice(CurInputDevice, CurGamepadName)
  if CurInputDevice == ECommonInputType.Touch then
    return
  end
  self.List_Reward:NavigateToIndex(0)
  self.Super.RefreshOpInfoByInputDevice(self, CurInputDevice, CurGamepadName)
end

return M
