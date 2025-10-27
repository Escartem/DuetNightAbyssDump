require("UnLua")
local TagComponent = {}
local TagObject = {}
TagObject.TagsDict = {}

function TagObject:BindStateFunc(TwoSideFunc)
  self.TwoSideFunc = TwoSideFunc
end

function TagObject:SetTagState(TagName, State)
  if not TagName then
    return
  end
  if State then
    self.TagsDict[TagName] = 1
  else
    self.TagsDict[TagName] = nil
  end
  local TagEmpty = IsEmptyTable(self.TagsDict)
  local _ = self.TwoSideFunc and self.TwoSideFunc(self.Owner, not TagEmpty)
end

function TagComponent:AddOneSwitchTag(TwoSideFunc)
  local NewTagObject = New(TagObject)
  NewTagObject:BindStateFunc(TwoSideFunc)
  NewTagObject.Owner = self
  return NewTagObject
end

return TagComponent
