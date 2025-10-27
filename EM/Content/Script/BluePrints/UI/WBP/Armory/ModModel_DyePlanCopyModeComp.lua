local json = require("rapidjson")
local Component = {}

function Component:CacheDyePlanInfoCopyed(DyePlanInfo)
  self.DyePlanInfoCopyed = {
    MsgCopyed = string.format(GText("UI_Chat_DyeSuitFormat"), DyePlanInfo.TargetName),
    TargetName = DyePlanInfo.TargetName,
    PlanName = DyePlanInfo.PlanName,
    SkinType = DyePlanInfo.SkinType,
    SkinId = DyePlanInfo.SkinId,
    colorStrings = {}
  }
  if DyePlanInfo.Colors then
    for i, colorId in ipairs(DyePlanInfo.Colors) do
      table.insert(self.DyePlanInfoCopyed.colorStrings, tostring(colorId or 0))
    end
  end
  ULowEntryExtendedStandardLibrary.ClipboardSet(self.DyePlanInfoCopyed.MsgCopyed)
end

function Component:GetDyePlanInfoCopyed()
  return self.DyePlanInfoCopyed
end

function Component:IsDyeShareInfoMsg(InMsgStr)
  local DyePlanInfoCopyed = self:GetDyePlanInfoCopyed()
  if not DyePlanInfoCopyed then
    return false
  end
  if InMsgStr ~= DyePlanInfoCopyed.MsgCopyed then
    return false
  end
  return true
end

function Component:GenerateDyeShareMsg()
  local DyePlanInfoCopyed = self:GetDyePlanInfoCopyed()
  if not DyePlanInfoCopyed then
    return nil
  end
  if not DyePlanInfoCopyed.SkinType or not DyePlanInfoCopyed.SkinId then
    return nil
  end
  local Table = {
    TargetName = DyePlanInfoCopyed.TargetName,
    PlanName = DyePlanInfoCopyed.PlanName,
    SkinType = DyePlanInfoCopyed.SkinType,
    SkinId = DyePlanInfoCopyed.SkinId,
    Colors = DyePlanInfoCopyed.colorStrings or {}
  }
  return ChatCommon.DyePlanCopyHeader .. json.encode(Table)
end

function Component:NumberToBase36(num, minLength)
  if not num or num < 0 then
    return string.rep("0", minLength or 1)
  end
  local chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  local result = ""
  if 0 == num then
    result = "0"
  else
    while num > 0 do
      local remainder = num % 36
      result = string.sub(chars, remainder + 1, remainder + 1) .. result
      num = math.floor(num / 36)
    end
  end
  if minLength and minLength > string.len(result) then
    result = string.rep("0", minLength - string.len(result)) .. result
  end
  return result
end

function Component:Base36ToNumber(str)
  if not str or "" == str then
    return 0
  end
  local chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  local result = 0
  local base = 1
  for i = string.len(str), 1, -1 do
    local char = string.sub(str, i, i)
    local value = string.find(chars, char) - 1
    if value < 0 then
      value = 0
    end
    result = result + value * base
    base = base * 36
  end
  return result
end

function Component:GenerateShareCommunityCopyCode(DyePlanInfo)
  if not DyePlanInfo then
    return ""
  end
  local code = ""
  if DyePlanInfo.SkinType == "Char" then
    code = code .. "C"
  else
    code = code .. "W"
  end
  local skinId = tonumber(DyePlanInfo.SkinId) or 0
  code = code .. self:NumberToBase36(skinId, 10)
  if DyePlanInfo.Colors then
    for i = 1, #DyePlanInfo.Colors do
      local colorId = tonumber(DyePlanInfo.Colors[i]) or 0
      code = code .. self:NumberToBase36(colorId, 2)
    end
  end
  return code
end

function Component:AnalysisShareCommunityCopyCode(CommunityCopyCode)
  if not CommunityCopyCode or "" == CommunityCopyCode then
    return nil
  end
  local code = string.upper(CommunityCopyCode)
  local codeLength = string.len(code)
  if codeLength < 11 then
    return nil
  end
  local colorPartLength = codeLength - 11
  if 0 ~= colorPartLength % 2 then
    return nil
  end
  local pos = 1
  local DyePlanInfo = {}
  if pos <= string.len(code) then
    local skinTypeChar = string.sub(code, pos, pos)
    if "C" == skinTypeChar then
      DyePlanInfo.SkinType = "Char"
    elseif "W" == skinTypeChar then
      DyePlanInfo.SkinType = "Weapon"
    else
      return nil
    end
    pos = pos + 1
  else
    return nil
  end
  if pos + 9 <= string.len(code) then
    local skinIdStr = string.sub(code, pos, pos + 9)
    DyePlanInfo.SkinId = self:Base36ToNumber(skinIdStr)
    if not DataMgr.Skin[DyePlanInfo.SkinId] and not DataMgr.WeaponSkin[DyePlanInfo.SkinId] and not DataMgr.Weapon[DyePlanInfo.SkinId] then
      return nil
    end
    pos = pos + 10
  else
    return nil
  end
  DyePlanInfo.Colors = {}
  while pos + 1 <= string.len(code) do
    local colorIdStr = string.sub(code, pos, pos + 1)
    local colorId = self:Base36ToNumber(colorIdStr)
    table.insert(DyePlanInfo.Colors, colorId)
    pos = pos + 2
  end
  return DyePlanInfo
end

return Component
