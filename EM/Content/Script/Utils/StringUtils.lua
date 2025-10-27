local StringUtils = {}

function StringUtils.Split(Str, Pat)
  local t = {}
  local fpat = "(.-)" .. Pat
  local last_end = 1
  local s, e, cap = string.find(Str, fpat, 1)
  while s do
    if 1 ~= s or "" ~= cap then
      table.insert(t, cap)
    end
    last_end = e + 1
    s, e, cap = string.find(Str, fpat, last_end)
  end
  if last_end <= string.len(Str) then
    cap = string.sub(Str, last_end)
    table.insert(t, cap)
  end
  return t
end

function StringUtils.Utf8ToTable(Str)
  local t = {}
  for ch, _ in string.gmatch(Str, utf8.charpattern) do
    table.insert(t, ch)
  end
  return t
end

local CJKUtf8Ranges = {
  {14844070, 14844070},
  {14844051, 14844061},
  {14909569, 14909589},
  {14989440, 15711391},
  {15380608, 15572655},
  {14909568, 14913471}
}
local DoubleByteRanges = {
  {49847, 49847}
}

function StringUtils.CheckUtf8StrCJKLegal(Str)
  local IllegalRange = {}
  local Index = 1
  
  local function CheckCharInRange(Ch, ByteCount, CharsRange)
    local UtfCh = 0
    for i = 1, ByteCount do
      local ChByte = string.byte(Ch, i)
      UtfCh = UtfCh + ChByte * 16 ^ 2 ^ (3 - i)
    end
    for _, Range in ipairs(CharsRange) do
      if UtfCh >= Range[1] and UtfCh <= Range[2] then
        return true
      end
    end
    return false
  end
  
  for Ch, _ in string.gmatch(Str, utf8.charpattern) do
    local ChBytes = {
      string.byte(Ch)
    }
    local NewIndex = Index
    if ChBytes[1] >= 240 then
      NewIndex = Index + 3
      table.insert(IllegalRange, {Index, NewIndex})
    elseif ChBytes[1] >= 224 then
      NewIndex = Index + 2
      if not CheckCharInRange(Ch, 3, CJKUtf8Ranges) then
        table.insert(IllegalRange, {Index, NewIndex})
      end
    elseif ChBytes[1] >= 192 then
      NewIndex = Index + 1
      if not CheckCharInRange(Ch, 2, DoubleByteRanges) then
        table.insert(IllegalRange, {Index, NewIndex})
      end
    elseif ChBytes[1] < 32 or ChBytes[1] > 126 then
      table.insert(IllegalRange, {Index, Index})
    end
    Index = NewIndex + 1
  end
  local LegalRes = 0 == #IllegalRange
  return LegalRes, IllegalRange
end

return StringUtils
