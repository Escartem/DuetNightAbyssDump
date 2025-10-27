require("UnLua")
local M = Class("BluePrints.UI.WBP.Armory.WBP_Armory_Skin_Base_C")

function M:Construct()
  self.TabStyleName = "Armory"
  M.Super.Construct(self)
  self.Btn_Hide.OnCheckStateChanged:Add(self, self.OnHideBtnCheckStateChanged)
  self.Btn_Hide:SetCheckedState(ECheckBoxState.Unchecked)
end

function M:OnHideBtnCheckStateChanged(IsCheck)
  if IsCheck then
    if not self.bSelfHidden then
      self:OnHideUIKeyDown()
    end
  elseif self.bSelfHidden then
    self:OnHideUIKeyDown()
  end
end

function M:OnHideUIKeyDown()
  M.Super.OnHideUIKeyDown(self)
  if self.bSelfHidden then
    self.Btn_Hide:SetCheckedState(ECheckBoxState.Checked)
  else
    self.Btn_Hide:SetCheckedState(ECheckBoxState.Unchecked)
  end
end

return M
