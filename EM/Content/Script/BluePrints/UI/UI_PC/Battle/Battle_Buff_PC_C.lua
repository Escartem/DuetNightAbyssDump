require("UnLua")
local M = Class("BluePrints.UI.BP_UIState_C")

function M:Construct()
  self:OnMainCharacterInitReady()
  self:AddDispatcher(EventID.OnMainCharacterInitReady, self, self.OnMainCharacterInitReady)
end

function M:OnMainCharacterInitReady()
  local Player = UE4.UGameplayStatics.GetPlayerCharacter(self, 0)
  if not IsValid(Player) then
    return
  end
  self:UnRegisterOnBuffsChangedDelegate()
  self:K2_SetBuffsOwner(Player)
  self:RegisterOnBuffsChangedDelegate()
end

return M
