local BaseAttributesSet = Class()

function BaseAttributesSet:Initialize(Initializer)
  self.MT = getmetatable(self)
end

function BaseAttributesSet:GetAttr(...)
  return self:GetAttrCpp(...)
end

function BaseAttributesSet:ReceiveBeginPlay()
  if not rawget(self.MT, "bSetCppAttrs") then
    local CppAttrNames = self:GetCppAttrs()
    rawset(self.MT, "bSetCppAttrs", true)
  end
end

return BaseAttributesSet
