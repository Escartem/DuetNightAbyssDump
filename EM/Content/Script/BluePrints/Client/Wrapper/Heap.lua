local Heap = {}

function Heap.GetSortValue(Value)
  if type(Value) == "number" then
    return Value
  elseif type(Value) == "table" then
    return Value.SortValue
  end
end

function Heap.BuildMinHeap(Source)
  if not Source or type(Source) ~= "table" then
    return
  end
  local EndIndex = #Source
  local MidIndex
  if 0 == EndIndex % 2 then
    MidIndex = EndIndex / 2
  else
    MidIndex = (EndIndex - 1) / 2
  end
  for i = MidIndex, 1, -1 do
    Heap.AdjustDown(Source, i, EndIndex)
  end
end

function Heap.AdjustDown(Source, ParentIndex, EndIndex)
  local Left = 2 * ParentIndex
  local Right = 2 * ParentIndex + 1
  local MinIndex = ParentIndex
  if EndIndex >= Left and Heap.GetSortValue(Source[Left]) < Heap.GetSortValue(Source[MinIndex]) then
    MinIndex = Left
  end
  if EndIndex >= Right and Heap.GetSortValue(Source[Right]) < Heap.GetSortValue(Source[MinIndex]) then
    MinIndex = Right
  end
  if MinIndex == ParentIndex then
    return
  end
  Source[ParentIndex], Source[MinIndex] = Source[MinIndex], Source[ParentIndex]
  Heap.AdjustDown(Source, MinIndex, EndIndex)
end

function Heap.HeapPush(Source, Item)
  if not Source or type(Source) ~= "table" then
    return
  end
  table.insert(Source, Item)
  if #Source <= 1 then
    return
  end
  Heap.AdjustUp(Source, #Source)
end

function Heap.AdjustUp(Source, ChildIndex)
  if ChildIndex <= 1 then
    return
  end
  local ParentIndex
  if 0 == ChildIndex % 2 then
    ParentIndex = ChildIndex / 2
  else
    ParentIndex = (ChildIndex - 1) / 2
  end
  if Heap.GetSortValue(Source[ParentIndex]) > Heap.GetSortValue(Source[ChildIndex]) then
    Source[ParentIndex], Source[ChildIndex] = Source[ChildIndex], Source[ParentIndex]
    Heap.AdjustUp(Source, ParentIndex)
  end
end

function Heap.HeapPop(Source)
  if not Source or type(Source) ~= "table" then
    return
  end
  local Min = Source[1]
  local EndValue = table.remove(Source, #Source)
  if #Source > 0 then
    Source[1] = EndValue
    Heap.AdjustDown(Source, 1, #Source)
  end
  return Min
end

function Heap.HeapPushWithComp(Source, Item, CompFunc)
  if not Source or type(Source) ~= "table" then
    return
  end
  table.insert(Source, Item)
  if #Source <= 1 then
    return
  end
  Heap.AdjustUpWithComp(Source, #Source, CompFunc)
end

function Heap.AdjustUpWithComp(Source, ChildIndex, CompFunc)
  if ChildIndex <= 1 then
    return
  end
  local ParentIndex
  if 0 == ChildIndex % 2 then
    ParentIndex = ChildIndex / 2
  else
    ParentIndex = (ChildIndex - 1) / 2
  end
  if CompFunc(Source[ParentIndex], Source[ChildIndex]) then
    Source[ParentIndex], Source[ChildIndex] = Source[ChildIndex], Source[ParentIndex]
    Heap.AdjustUpWithComp(Source, ParentIndex, CompFunc)
  end
end

function Heap.HeapPopWithComp(Source, CompFunc)
  if not Source or type(Source) ~= "table" then
    return
  end
  local Min = Source[1]
  local EndValue = table.remove(Source, #Source)
  if #Source > 0 then
    Source[1] = EndValue
    Heap.AdjustDownWithComp(Source, 1, #Source, CompFunc)
  end
  return Min
end

function Heap.AdjustDownWithComp(Source, ParentIndex, EndIndex, CompFunc)
  local Left = 2 * ParentIndex
  local Right = 2 * ParentIndex + 1
  local MinIndex = ParentIndex
  if EndIndex >= Left and CompFunc(Source[MinIndex], Source[Left]) then
    MinIndex = Left
  end
  if EndIndex >= Right and CompFunc(Source[MinIndex], Source[Right]) then
    MinIndex = Right
  end
  if MinIndex == ParentIndex then
    return
  end
  Source[ParentIndex], Source[MinIndex] = Source[MinIndex], Source[ParentIndex]
  Heap.AdjustDownWithComp(Source, MinIndex, EndIndex, CompFunc)
end

function Heap.BuildHeapWithComp(Source, CompFunc, EndIndex)
  if not Source or type(Source) ~= "table" then
    return
  end
  EndIndex = EndIndex or #Source
  local MidIndex
  if 0 == EndIndex % 2 then
    MidIndex = EndIndex / 2
  else
    MidIndex = (EndIndex - 1) / 2
  end
  for i = MidIndex, 1, -1 do
    Heap.AdjustDownWithComp(Source, i, EndIndex, CompFunc)
  end
end

function Heap.SortWithComp(Source, CompFunc)
  if not Source or type(Source) ~= "table" then
    return
  end
  local Length = #Source
  if Length <= 1 then
    return
  end
  Heap.BuildHeapWithComp(Source, CompFunc, Length)
  for i = Length - 1, 1, -1 do
    Source[1], Source[i + 1] = Source[i + 1], Source[1]
    Heap.AdjustDownWithComp(Source, 1, i, CompFunc)
  end
end

return Heap
