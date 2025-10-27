local EntityFactory = {}
EntityFactory.entity_classes = {}

function EntityFactory:RegisterEntity(entity_type, entity_class)
  self.entity_classes[entity_type] = entity_class
end

function EntityFactory:GetEntityClass(entity_type)
  local entity_class
  if type(entity_type) == "string" then
    entity_class = self.entity_classes[entity_type]
  end
  return entity_class
end

function EntityFactory:CreateEntity(entity_type, entity_id)
  local EntityClass = self:GetEntityClass(entity_type)
  if nil == EntityClass then
    return
  end
  return EntityClass(entity_id)
end

return EntityFactory
