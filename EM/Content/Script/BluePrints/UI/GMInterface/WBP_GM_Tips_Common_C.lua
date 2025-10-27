require("UnLua")
local GMObjectUtils = require("BluePrints.UI.GMInterface.GMObjectUtils")
local WBP_GM_Tips_Common_C = Class("BluePrints.UI.GMInterface.WBP_GM_Menu_Base_C")

function WBP_GM_Tips_Common_C:InitMenu(Command)
  self.Super.InitMenu(self, Command)
  self.List:ClearListItems()
  for i = 1, Command.Commands:Length() do
    Command.Commands[i].ParentWidget = self
    self.List:AddItem(Command.Commands[i])
  end
  if not Command.Initialized then
    if Command.DataFunc and GMObjectUtils[Command.DataFunc] then
      local Objs = GMObjectUtils[Command.DataFunc]()
      for index, obj in ipairs(Objs) do
        obj.ParentWidget = self
        Command.Commands:Add(obj)
        self.List:AddItem(obj)
      end
    end
    Command.Initialized = true
  end
end

return WBP_GM_Tips_Common_C
