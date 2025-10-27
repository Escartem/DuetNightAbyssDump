require("UnLua")
local GMObjectUtils = require("BluePrints.UI.GMInterface.GMObjectUtils")
local WBP_GM_Tips_Hotkey_C = Class("BluePrints.UI.GMInterface.WBP_GM_Menu_Base_C")

function WBP_GM_Tips_Hotkey_C:OnLoaded(Command)
  self.Super.OnLoaded(self, Command)
  self:InitMenu(Command)
end

function WBP_GM_Tips_Hotkey_C:InitMenu(Command)
  self.Super.InitMenu(self, Command)
  self.List:ClearListItems()
  Command.Commands:Clear()
  local Objs = GMObjectUtils.GetHotKeyCmdObjs()
  for _, obj in ipairs(Objs) do
    obj.ParentWidget = self
    Command.Commands:Add(obj)
    self.List:AddItem(obj)
  end
end

return WBP_GM_Tips_Hotkey_C
