local M = {}

function M:BattleWheelMain_ReceiveEnterState()
  self.CurrentSubUI = self.CurrentSubUI
  if IsValid(self.CurrentSubUI) and self.CurrentSubUI:IsPhantomWeaponMenuOpened() then
    self.CurrentSubUI:SetPhantomWeaponMenuFocus()
  end
  if self.ActorController then
    self.ActorController:HidePlayerActor("ArmoryBattleWheel", true)
  end
end

function M:BattleWheelMain_Init()
  self.Tab_L:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.EMListView_SubTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.Panel_SubTab:SetVisibility(UIConst.VisibilityOp.Collapsed)
  self.CurSubTab = self.NoneTab
  local ToBattleWheelIndex = self.Params.BattleWheelIndex
  self:DefaultInitSubUI({
    ToBattleWheelIndex = ToBattleWheelIndex,
    bHideWheelPlan = self.Params.bHideWheelPlan
  })
  if not self.CurrentSubUI then
    return
  end
  AudioManager(self):PlayUISound(self, "event:/ui/common/combat_bag_show", "BattleMenuShowSound", nil)
  if self.ActorController then
    self.ActorController:HidePlayerActor("ArmoryBattleWheel", true)
  end
end

function M:BattleWheelMain_PreMainTabChange()
  UWidgetBlueprintLibrary.CancelDragDrop()
  AudioManager(self):SetEventSoundParam(self, "BattleMenuShowSound", {ToEnd = 1})
  if self.ActorController then
    self.ActorController:HidePlayerActor("ArmoryBattleWheel", false)
  end
end

function M:BattleWheelMain_Close()
  UWidgetBlueprintLibrary.CancelDragDrop()
  AudioManager(self):SetEventSoundParam(self, "BattleMenuShowSound", {ToEnd = 1})
  if self.ActorController then
    self.ActorController:HidePlayerActor("ArmoryBattleWheel", false)
  end
end

function M:BattleWheelMain_OnFocusReceived(ReplyInfo)
  if IsValid(self.CurrentSubUI) and self.CurrentSubUI:IsPhantomWeaponMenuOpened() then
    self.CurrentSubUI:SetPhantomWeaponMenuFocus()
    ReplyInfo.Reply = UIUtils.Handled
    ReplyInfo.IsHandled = true
  end
  if not ReplyInfo.IsHandled then
    ReplyInfo.Reply = UWidgetBlueprintLibrary.SetUserFocus(UWidgetBlueprintLibrary.Handled(), self.CurrentSubUI or self)
    ReplyInfo.IsHandled = true
  end
end

function M:BattleWheelMain_InitKeySetting(KeyDownEvents, KeyUpEvents, BottomKeyInfo)
  if not self.bHideSquadBuildBtn or not self.IsPreviewMode then
    self:AddKeyEvents(KeyDownEvents, self.MenuKeyDownEvents)
  end
  self:AddKeyEvents(KeyDownEvents, self.MainTabKeyDownEvents, self.CommonKeyDownEvents)
  if self.CurrentSubUI and self.CurrentSubUI.BottomKeyInfo then
    for key, value in pairs(BottomKeyInfo) do
      BottomKeyInfo[key] = nil
    end
    for key, value in pairs(self.CurrentSubUI.BottomKeyInfo) do
      BottomKeyInfo[key] = value
    end
  end
end

function M:BattleWheelMain_InitNavigationRules()
end

function M:BattleWheelMain_OnSubTabLeftKeyDown()
  self.CurrentSubUI:WheelScrollToRight()
end

function M:BattleWheelMain_OnSubTabRightKeyDown()
  self.CurrentSubUI:WheelScrollToLeft()
end

return M
