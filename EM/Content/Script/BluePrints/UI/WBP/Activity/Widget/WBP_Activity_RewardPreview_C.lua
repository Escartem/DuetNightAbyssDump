require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:Construct()
  self.AllQuestPhaseIdValue = {}
  self.AllRewardPreview = {}
  self.List_Reward:SetScrollbarVisibility(UIConst.VisibilityOp.Collapsed)
  self.List_Reward:SetControlScrollbarInside(true)
  self:AddInputMethodChangedListen()
end

function M:InitContent(Params, PopupData, Owner)
  M.Super.InitContent(self, Params, PopupData, Owner)
  self.CurActivityId = Params.ActivityId
  self.IsZhiliuQuest = self.CurActivityId == DataMgr.EventConstant.ZhiLiuEntrustEventID.ConstantValue
  self.IsMidTermGoalQuest = self.CurActivityId == DataMgr.MidTermGoalConstant.MidTermGoalEventId.ConstantValue
  self.List_Reward:ClearListItems()
  for StartIndex, PhaseId in ipairs(self.AllQuestPhaseIdValue) do
    local ItemObject = NewObject(UIUtils.GetCommonItemContentClass())
    ItemObject.Index = StartIndex
    ItemObject.PhaseId = PhaseId
    ItemObject.Parent = self
    ItemObject.RewardPreview = self.AllRewardPreview[PhaseId]
    self.List_Reward:AddItem(ItemObject)
  end
  if self.IsZhiliuQuest then
    local ItemObject = NewObject(UIUtils.GetCommonItemContentClass())
    ItemObject.Index = 1
    ItemObject.Parent = self
    ItemObject.IsZhiliuQuest = true
    ItemObject.RewardPreview = DataMgr.EventConstant.ZhiLiuEntrustGrandRewardView.ConstantValue
    self.List_Reward:AddItem(ItemObject)
  end
  if self.IsMidTermGoalQuest then
    self.List_Reward:ClearListItems()
    local AchievementPrize = DataMgr.AchievementPrize
    local sortedPrize = {}
    for k, v in pairs(AchievementPrize) do
      table.insert(sortedPrize, {Count = k, RewardId = v})
    end
    table.sort(sortedPrize, function(a, b)
      return a.Count < b.Count
    end)
    for StartIndex, PhaseId in ipairs(sortedPrize) do
      local ItemObject = NewObject(UIUtils.GetCommonItemContentClass())
      ItemObject.Index = StartIndex
      ItemObject.PhaseId = PhaseId
      ItemObject.Parent = self
      ItemObject.IsMidTermGoalQuest = true
      local RewardKey = "AchievementRewardView" .. StartIndex
      ItemObject.RewardPreview = DataMgr.MidTermGoalConstant[RewardKey].ConstantValue
      self.List_Reward:AddItem(ItemObject)
    end
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
