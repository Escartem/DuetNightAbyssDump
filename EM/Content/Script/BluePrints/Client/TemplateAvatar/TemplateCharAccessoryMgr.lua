local Component = {}

function Component:CheckRepeatPressup(AccessoryId)
  return self.CharAccessorys:HasValue(AccessoryId)
end

function Component:AddAccessory(AccessoryId, Reason, GiveNotOpen)
  local Info = DataMgr.CharAccessory[AccessoryId]
  if not AccessoryId or not Info then
    return
  end
  GiveNotOpen = GiveNotOpen or false
  if Info.IsNotOpen and not GiveNotOpen then
    return
  end
  if self:CheckRepeatPressup(AccessoryId) then
    return
  end
  self.CharAccessorys:Append(AccessoryId)
end

function Component:GMAddAccessory(AccessoryId, Reason)
  local Info = DataMgr.CharAccessory[AccessoryId]
  if not Info or 1 == Info.GMNot then
    return
  end
  self:AddAccessory(AccessoryId, Reason, true)
end

return Component
