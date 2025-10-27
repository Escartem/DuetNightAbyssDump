local Component = {}

function Component:SetCamp(CampValue)
  local CampValueType = type(CampValue)
  if "number" == CampValueType then
    self.Overridden.SetCamp(self, CampValue)
  elseif "string" == CampValueType then
    self.Overridden.SetCamp(self, Const.CampType[CampValue])
  end
end

return Component
