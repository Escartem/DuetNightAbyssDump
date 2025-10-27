local CommonFilterUtils = {}
CommonFilterUtils.FilterRule = {And = 0, Or = 1}

local function GetFieldValueByIndex(ItemData, FiledIndex)
  local fieldName = fieldMapping[index]
  if "FilterTag" == fieldName then
    return ModItem.FilterTag
  else
    local modFieldValue = ModItem[fieldName]
    if "Level" == fieldName and type(modFieldValue) == "number" and modFieldValue > 1 then
      modFieldValue = 1
    end
    if type(modFieldValue) == "number" then
      return tostring(modFieldValue)
    else
      return modFieldValue
    end
  end
end

local function IsItemDataMatchFilterTag(ItemData, FilterTags)
  local ItemFilterTags = ItemData.FilterTag
  for i, ItemFilterTag in ipairs(ItemFilterTags) do
    for j, FilterTag in ipairs(FilterTags) do
      if ItemFilterTag == FilterTag then
        return true
      end
    end
  end
  return false
end

local function IsItemDataMatchFilterField(ItemData, FieldName, FieldValues)
  assert(nil ~= ItemData[FieldName], "ItemData[" .. FieldName .. "] is nil")
  local ItemFieldValue = ItemData[FieldName]
  if type(ItemFieldValue) == "number" then
    ItemFieldValue = tostring(ItemFieldValue)
  end
  for _, FilterFieldValue in ipairs(FieldValues) do
    if FilterFieldValue == ItemFieldValue then
      return true
    end
  end
  return false
end

local function IsItemDataMatchFilterData(ItemData, FilterData)
  local FieldName = FilterData.FieldName
  local FieldValues = FilterData.FieldValues
  if nil == ItemData[FieldName] then
    DebugPrint("ItemData[" .. FieldName .. "] is nil")
    return false
  end
  if "FilterTag" == FieldName then
    return IsItemDataMatchFilterTag(ItemData, FieldValues)
  else
    return IsItemDataMatchFilterField(ItemData, FieldName, FieldValues)
  end
end

function CommonFilterUtils.FilterItemDataByFilterData(ItemData, FilterSelectedItems, FilterItemDatas)
  for Index, SelectedItem in pairs(FilterSelectedItems) do
    local FilterItemData = FilterItemDatas[Index]
    local FilterData = {}
    FilterData.FieldName = FilterItemData.SelectionField[1]
    FilterData.FieldValues = {}
    for i, SelectedIndex in pairs(SelectedItem) do
      table.insert(FilterData.FieldValues, FilterItemData.SelectionDatas[SelectedIndex])
    end
    if not IsItemDataMatchFilterData(ItemData, FilterData) then
      return false
    end
  end
  return true
end

function CommonFilterUtils.FilterItemDataListByFilterData(ItemDataList, FilterSelectedItems, FilterItemDatas)
  for Index, SelectedItem in pairs(FilterSelectedItems) do
    local FilterItemData = FilterItemDatas[Index]
    local FilterData = {}
    FilterData.FieldName = FilterItemData.SelectionField[1]
    FilterData.FieldValues = {}
    for i, SelectedIndex in pairs(SelectedItem) do
      table.insert(FilterData.FieldValues, FilterItemData.SelectionDatas[SelectedIndex])
    end
    for i = #ItemDataList, 1, -1 do
      local ItemData = ItemDataList[i]
      if not IsItemDataMatchFilterData(ItemData, FilterData) then
        DebugPrint("Remove ItemData: " .. ItemData.Id .. " FilterIndex : " .. Index)
        table.remove(ItemDataList, i)
      end
    end
  end
  return ItemDataList
end

return CommonFilterUtils
