local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local CharAccessorySuits = Class("CharAccessorySuits", CustomTypes.CustomList)
CharAccessorySuits.ValueType = CustomTypes.IntList

function CharAccessorySuits:AddCharAccessorySuit()
  local CharAccessorySuit = CustomTypes.IntList()
  for i = 1, 5 do
    CharAccessorySuit:Append(-1)
  end
  self:Append(CharAccessorySuit)
end

return {CharAccessorySuits = CharAccessorySuits}
