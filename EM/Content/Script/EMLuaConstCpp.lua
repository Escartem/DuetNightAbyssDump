local EMLuaConst = require("EMLuaConst")
local EMLuaConstCpp = Class()

function EMLuaConstCpp:FillVars()
  for Key, Value in pairs(EMLuaConst) do
    self.TempVars[Key] = Value
  end
  rawset(EMLuaConst, "EMLuaConstCpp", self)
end

return EMLuaConstCpp
