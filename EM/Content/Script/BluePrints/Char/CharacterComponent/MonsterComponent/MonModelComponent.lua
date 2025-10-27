require("UnLua")
local Component = Class({
  "BluePrints.Char.CharacterComponent.CharModelComponent"
})

function Component:LoadCurrentModel()
  if self:IsMonster() and self.IsFromCache and (not self.ShadowModelId or 0 == self.ShadowModelId) then
    return
  end
  self:GetCharModelComponent():LoadCurrentModel()
end

return Component
