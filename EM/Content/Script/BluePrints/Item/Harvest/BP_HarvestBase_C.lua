require("UnLua")
local M = Class("BluePrints.Item.Chest.BP_MechanismBase_C")

function M:AuthorityInitInfo(Info)
  M.Super.AuthorityInitInfo(self, Info)
  self.CanOpen = true
  self:SetRewardID()
end

function M:OpenMechanism(PlayerId)
  if not self.OpenState then
    self:CreateReward(PlayerId)
  end
  self:UpdateRegionData("OpenState", true)
  if self.ChestInteractiveComponent then
    local Player = Battle(self):GetEntity(PlayerId)
    if Player then
      self.ChestInteractiveComponent:EndInteractive(Player)
    end
  end
end

function M:SetRewardID()
end

function M:AdjustLocation()
  if not self.Data.NeedLocationAdjustment then
    return
  end
  M.Super.AdjustLocation(self)
end

return M
