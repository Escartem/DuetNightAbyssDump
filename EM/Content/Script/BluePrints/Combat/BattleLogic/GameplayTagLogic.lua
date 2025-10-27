local Component = {}

function Component:HasAnyTags_Table(Source, FilterTags, bExactMatch)
  if nil == Source then
    return false
  end
  self.GameplayTagsTable = self.GameplayTagsTable or {}
  if self.GameplayTagsTable[FilterTags] or self.GameplayTagsTable[FilterTags] == false then
    return self.GameplayTagsTable[FilterTags]
  end
  local TagsArray = TArray(FGameplayTag)
  for _, FilterTag in pairs(FilterTags) do
    URuntimeCommonFunctionLibrary.GetTagsArray(TagsArray, FilterTag)
  end
  if URuntimeCommonFunctionLibrary.HasAnyTags(Source.GameplayTags, TagsArray, bExactMatch) then
    self.GameplayTagsTable[FilterTags] = true
    return true
  end
  self.GameplayTagsTable[FilterTags] = false
  return false
end

function Component:HasAnyTags_Table_CaptureMonster()
  return self:HasAnyTags_Table(self, Const.CaptureMonster, false)
end

return Component
