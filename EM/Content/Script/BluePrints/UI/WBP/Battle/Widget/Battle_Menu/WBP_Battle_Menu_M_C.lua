local TITLE_TEXT_KEYS = {
  "BATTLE_WHEEL_DISPLAY_TITLE1",
  "BATTLE_WHEEL_DISPLAY_TITLE2",
  "BATTLE_WHEEL_DISPLAY_TITLE3"
}
local M = Class("BluePrints.UI.BP_UIState_C")

function M:InitUIInfo(Name, bInUIMode, EventList, ...)
  M.Super.InitUIInfo(self, Name, bInUIMode, EventList, ...)
  self.Button_Area.OnClicked:Add(self, self.SwitchBattleWheel)
  self.Text_Option:SetText(GText("BATTLE_MENU_MOBILE_SWITCH"))
  if self.Battle_Menu and self.Battle_Menu.Owner then
    self.Battle_Menu.Owner = self
  end
end

function M:Hide(HideTag)
  M.Super.Hide(self, HideTag)
  local BattleMainUI = UIManager(self):GetUI("BattleMain")
  if nil ~= BattleMainUI and nil ~= BattleMainUI.Char_Skill and type(BattleMainUI.Char_Skill.HandleEventByInterrupt) == "function" then
    BattleMainUI.Char_Skill:HandleEventByInterrupt()
  end
end

function M:UpdateArgs(Params)
  DebugPrint("gmy@WBP_Battle_Menu_P_C M:UpdateArgs", Params)
  self.Battle_Menu:UpdateArgs(Params)
end

function M:SelectAndCloseMenu()
  self:StopAllAnimations()
  self.Battle_Menu:SelectAndCloseMenu()
  self:Close()
end

function M:BindMenuButton(MenuButton)
  self.Battle_Menu:BindMenuButton(MenuButton)
end

function M:SetWheelCenter(Widget)
  self.Battle_Menu:SetWheelCenter(Widget)
end

function M:SwitchBattleWheel()
  DebugPrint("gmy@WBP_Battle_Menu_M_C M:SwitchBattleWheel")
  self.Battle_Menu:OnChangeDisplayWheel()
  self:RefreshDisplayIndex()
end

function M:RefreshDisplayIndex()
  local DisplayIndex = self.Battle_Menu.DisplayIndex
  local TitleText = GText(TITLE_TEXT_KEYS[DisplayIndex])
end

return M
