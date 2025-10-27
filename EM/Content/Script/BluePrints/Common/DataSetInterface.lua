local Component = {}

function Component:DataSetInterface_Init()
  if self.DataSetInterface_Data == nil then
    self.DataSetInterface_Data = {
      Int = {},
      Float = {},
      String = {},
      Vector = {},
      Actor = {}
    }
  end
end

function Component:SetInt(Key, Value)
  self:DataSetInterface_Init()
  self.DataSetInterface_Data.Int[Key] = Value
end

function Component:GetInt(Key)
  self:DataSetInterface_Init()
  return self.DataSetInterface_Data.Int[Key] or 0
end

function Component:SetBool(Key, Value)
  self:DataSetInterface_Init()
  self.DataSetInterface_Data.Bool[Key] = Value
end

function Component:GetBool(Key)
  self:DataSetInterface_Init()
  return self.DataSetInterface_Data.Bool[Key] or false
end

function Component:SetFloat(Key, Value)
  self:DataSetInterface_Init()
  self.DataSetInterface_Data.Float[Key] = Value
end

function Component:GetFloat(Key)
  self:DataSetInterface_Init()
  return self.DataSetInterface_Data.Float[Key] or 0
end

function Component:SetString(Key, Value)
  self:DataSetInterface_Init()
  self.DataSetInterface_Data.String[Key] = Value
end

function Component:GetString(Key)
  self:DataSetInterface_Init()
  return self.DataSetInterface_Data.String[Key] or ""
end

function Component:SetVector(Key, Value)
  self:DataSetInterface_Init()
  self.DataSetInterface_Data.Vector[Key] = FVector(Value.X, Value.Y, Value.Z)
end

function Component:GetVector(Key)
  self:DataSetInterface_Init()
  return self.DataSetInterface_Data.Vector[Key] or Const.ZeroVector
end

function Component:SetSaveLoc(Value, Tag)
  self:DataSetInterface_Init()
  local Key = "SaveLoc"
  if Tag and "" ~= Tag then
    Key = Key .. "_" .. tostring(Tag)
  end
  self.DataSetInterface_Data.Vector[Key] = FVector(Value.X, Value.Y, Value.Z)
end

function Component:GetSaveLoc(Tag)
  self:DataSetInterface_Init()
  local Key = "SaveLoc"
  if Tag and "" ~= Tag then
    Key = Key .. "_" .. tostring(Tag)
  end
  return self.DataSetInterface_Data.Vector[Key]
end

function Component:DataSet_SetActor(Key, Value)
  self:DataSetInterface_Init()
  self.DataSetInterface_Data.Actor[Key] = Value
end

function Component:DataSet_GetActor(Value)
  self:DataSetInterface_Init()
  return self.DataSetInterface_Data.Actor[Value]
end

return Component
