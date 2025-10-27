local Class = _G.TypeClass
local BaseTypes = require("BluePrints.Client.CustomTypes.BaseTypes")
local CustomTypes = require("BluePrints.Client.CustomTypes.CustomTypes")
local prop = require("NetworkEngine.Common.Prop")
local FormatProperties = require("NetworkEngine.Common.Assemble").FormatProperties
local WheelSlot = Class("WheelSlot", CustomTypes.CustomAttr)
WheelSlot.__Props__ = {
  SlotId = prop.prop("Int", "client save"),
  Status = prop.prop("Int", "client save", 0),
  ResourceId = prop.prop("Int", "client save"),
  ResourceCount = prop.prop("Int", "client save", 0)
}

function WheelSlot:Init(SlotId)
  self.SlotId = SlotId
end

function WheelSlot:SetResource(ResourceId)
  self.ResourceId = ResourceId
end

function WheelSlot:Reset()
  self.ResourceId = 0
  self.ResourceCount = 0
end

function WheelSlot:ReduceCount(count)
  count = count or 1
  if count > self.ResourceCount then
    return
  end
  self.ResourceCount = self.ResourceCount - count
end

FormatProperties(WheelSlot)
local Wheel = Class("Wheel", CustomTypes.CustomDict)
Wheel.KeyType = BaseTypes.Int
Wheel.ValueType = WheelSlot

function Wheel:InitSlot()
  for i = 1, DataMgr.GlobalConstant.BattleWheelPlanNum.ConstantValue do
    self[i] = WheelSlot(i)
  end
end

local Wheels = Class("Wheels", CustomTypes.CustomList)
Wheels.ValueType = Wheel

function Wheels:AddWheel()
  local wheel = Wheel()
  wheel:InitSlot()
  self:Append(wheel)
end

return {
  WheelSlot = WheelSlot,
  Wheel = Wheel,
  Wheels = Wheels
}
