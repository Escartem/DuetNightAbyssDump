local TimerMgr = require("BluePrints.Common.TimerMgr")
local PlayerNameUtils = {}
local DoubleByteRanges = {
  {49847, 49847}
}
local CjkUTFRanges = {
  {14844070, 14844070},
  {14844051, 14844061},
  {14909569, 14909589},
  {14989440, 15711391},
  {15380608, 15572655},
  {14909568, 14913471}
}

function PlayerNameUtils.CheckIsAllSpace(Name)
  return string.match(Name, "^%s*$")
end

function PlayerNameUtils.ReplaceMultiSpaceInName(Name)
  return string.gsub(NewName, "%s%s+", " ")
end

function PlayerNameUtils.CheckNameLegal(NewName, MaxNum)
  MaxNum = MaxNum or 12
  local IllegalRange = {}
  local SpaceRange = {}
  local RealName = NewName
  local NameLength = 0
  local ErrorType = 0
  local i = 1
  while true do
    local CurByte = string.byte(NewName, i)
    local ByteNum = 1
    if CurByte >= 240 then
      ByteNum = 4
      table.insert(IllegalRange, {
        i,
        i + 3
      })
    elseif CurByte >= 224 then
      if not PlayerNameUtils.CheckCharInAnyRange(NewName, i, CjkUTFRanges) then
        table.insert(IllegalRange, {
          i,
          i + 2
        })
      end
      ByteNum = 3
    elseif CurByte >= 192 then
      ByteNum = 2
      if not PlayerNameUtils.CheckDoubleCharInAnyRange(NewName, i, DoubleByteRanges) then
        table.insert(IllegalRange, {
          i,
          i + 1
        })
      end
    else
      if CurByte < 32 or CurByte > 126 then
        table.insert(IllegalRange, {i, i})
      end
      ByteNum = 1
    end
    NameLength = NameLength + 1
    if MaxNum < NameLength then
      RealName = string.sub(NewName, 1, i - 1)
      break
    end
    i = i + ByteNum
    if i > #NewName then
      break
    end
  end
  if #IllegalRange > 0 then
    ErrorType = -2
  end
  return NameLength, RealName, IllegalRange, ErrorType
end

function PlayerNameUtils.GetWordLength(WordFirstByte)
  if WordFirstByte >= 240 then
    return 4
  elseif WordFirstByte >= 224 then
    return 3
  elseif WordFirstByte >= 192 then
    return 2
  else
    return 1
  end
  return 0
end

function PlayerNameUtils.CheckDoubleCharInAnyRange(NewName, i, AllRange)
  local CharByte1 = string.byte(NewName, i)
  local CharByte2 = string.byte(NewName, i + 1)
  for i, Range in pairs(AllRange) do
    if PlayerNameUtils.ContainsDoubleChar(CharByte1, CharByte2, Range) then
      return true
    end
  end
  return false
end

function PlayerNameUtils.ContainsDoubleChar(CharByte1, CharByte2, Range)
  local ByteNum = CharByte1 * 256.0 + CharByte2
  if ByteNum >= Range[1] and ByteNum <= Range[2] then
    return true
  end
  return false
end

function PlayerNameUtils.CheckCharInAnyRange(NewName, i, AllRange)
  local CharByte1 = string.byte(NewName, i)
  local CharByte2 = string.byte(NewName, i + 1)
  local CharByte3 = string.byte(NewName, i + 2)
  for i, Range in pairs(AllRange) do
    if PlayerNameUtils.ContainsCJK(CharByte1, CharByte2, CharByte3, Range) then
      return true
    end
  end
  return false
end

function PlayerNameUtils.ContainsCJK(CharByte1, CharByte2, CharByte3, Range)
  local ByteNum = CharByte1 * 65536.0 + CharByte2 * 256.0 + CharByte3
  if ByteNum >= Range[1] and ByteNum <= Range[2] then
    return true
  end
  return false
end

function PlayerNameUtils.HighLightWord(Str, WordStart, WordEnd)
  local InsertStrStart = "<Warning>"
  local InsertStrEnd = "</>"
  local first = string.sub(Str, 1, WordStart - 1)
  local Middle = string.sub(Str, WordStart, WordEnd)
  local last = string.sub(Str, WordEnd + 1, -1)
  return string.format("%s%s%s%s%s", first, InsertStrStart, Middle, InsertStrEnd, last)
end

function PlayerNameUtils.HighLightIllegal(Name, IllegalRange)
  local InsertStrStart = "<Warning>"
  local InsertStrEnd = "</>"
  local Res = Name
  for i, v in pairs(IllegalRange) do
    local ExtraLength = 12 * (i - 1)
    Res = PlayerNameUtils.HighLightWord(Res, v[1] + ExtraLength, v[2] + ExtraLength)
  end
  return Res
end

function PlayerNameUtils.DeleteHeadAndTailSpace(Name)
  return string.gsub(Name, "^%s*(.-)%s*$", "%1")
end

return PlayerNameUtils
