require("UnLua")
local TeamModel = TeamController:GetModel()
local M = Class({
  "BluePrints.UI.WBP.Team.View.WBP_Team_PlayerItem_Base"
})

function M:SetOnMenuOpenChangeCb(Cb)
  self.MenuOpenChangedCb = Cb
end

function M:Construct()
  M.Super.Construct(self)
  self.Head_Anchor:SetPlacement(EMenuPlacement.MenuPlacement_MenuLeft)
end

function M:OnMenuOpenChanged(bOpen)
  if self.MenuOpenChangedCb then
    self.MenuOpenChangedCb(bOpen and self.bOpenMenu)
  end
  if bOpen and self.bOpenMenu then
    return
  end
  self.Button_Area:SetChecked(false)
end

return M
