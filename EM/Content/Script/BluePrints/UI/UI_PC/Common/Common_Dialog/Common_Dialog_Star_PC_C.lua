require("UnLua")
local M = Class("BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_ContentBase")

function M:PreInitContent(Params, PopupData, Owner)
  self.Super.PreInitContent(self, Params, PopupData, Owner)
  if Params then
    self._components = {
      "BluePrints.UI.UIComponent.StarsUIComponent"
    }
    if Params.BehaviourType == "BreakLevelUp" then
      table.insert(self._components, "BluePrints.UI.WBP.Armory.Armory_CharOrWeaponBreakLvup_Component")
      AssembleComponents(self)
    end
  end
end

return M
