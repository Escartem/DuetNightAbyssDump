local EntityManager = {}
EntityManager._entities = {}
EntityManager._entities_num = 0

function EntityManager:EntityNumber()
  return self._entities_num
end

function EntityManager:HasEntity(entity_id)
  for id, entity in pairs(self._entities) do
    if entity_id == id and nil ~= entity then
      return true
    end
  end
  return false
end

function EntityManager:GetEntity(entity_id)
  return self._entities[entity_id]
end

function EntityManager:AddEntity(entity_id, entity, override)
  if self:HasEntity(entity_id) then
    if not override then
      return
    end
    local old_entity = self:GetEntity(entity_id)
    old_entity:SetOverrideFlag(true)
  else
    self._entities_num = self._entities_num + 1
  end
  self._entities[entity_id] = entity
end

function EntityManager:DelEntity(entity_id)
  if self:HasEntity(entity_id) then
    self._entities_num = self._entities_num - 1
  end
  self._entities[entity_id] = nil
end

function EntityManager:DelAllEntities()
  DebugPrint("EntityManager DelAllEntities")
  local entity_ids = {}
  for id, entity in pairs(self._entities) do
    entity:Destroy()
    entity_ids[#entity_ids + 1] = id
  end
  for i, id in ipairs(entity_ids) do
    self:DelEntity(id)
  end
end

return EntityManager
