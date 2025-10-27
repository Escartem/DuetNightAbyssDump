local Utils = {}
local table_concat = table.concat
local tostring = _ENV.tostring
local type = _ENV.type
local bDistribution = UE4.URuntimeCommonFunctionLibrary.IsDistribution()
local bEnableShippingLog = UE4.URuntimeCommonFunctionLibrary.EnableLogInShipping()
local TextUtils = require("Utils.TextUtils")
local MiscUtils = require("Utils.MiscUtils")
Utils.PrintTable = not (not bDistribution or bEnableShippingLog) and MiscUtils.EmptyFunction or function(Targets, deep, Title, PrettyFormat)
  if nil == Targets then
    return
  end
  if "table" ~= type(Targets) then
    print(LogTag, tostring(Targets))
    return
  end
  deep = deep or 1
  local ct = {
    "PrintTable: ",
    tostring(Title),
    tostring(Targets),
    "\n"
  }
  MiscUtils.GetStrTable(ct, Targets, 1, deep, PrettyFormat)
  local ret = table_concat(ct)
  print(LogTag, ret)
  return ret
end
Utils.Traceback = not (not bDistribution or bEnableShippingLog) and MiscUtils.EmptyFunction or function(logTag, err, bNotPrint)
  local error = debug.traceback()
  if err then
    error = err .. "\n" .. error
  end
  logTag = logTag or LogTag
  if not bNotPrint then
    DebugPrint(logTag, error)
  end
  return error
end

function Utils.IsStandAlone(Actor)
  return UNeModeFunctionLibrary.IsStandAlone(Actor)
end

function Utils.IsDedicatedServer(Actor)
  return UNeModeFunctionLibrary.IsDedicatedServer(Actor)
end

function Utils.IsClient(Actor)
  return UNeModeFunctionLibrary.IsClient(Actor)
end

function Utils.IsAuthority(actor)
  return 3 == actor:GetLocalRole()
end

function Utils.New(Table)
  if nil == Table then
    return Table
  end
  if "table" ~= type(Table) then
    return Table
  end
  local Obj = {}
  local mt = getmetatable(Table)
  if nil ~= mt then
    setmetatable(Obj, mt)
  end
  for i, v in pairs(Table) do
    if "table" == type(v) then
      Obj[i] = New(v)
    else
      Obj[i] = v
    end
  end
  return Obj
end

function Utils.IsEmptyTable(Table)
  return table.isempty(Table)
end

function Utils.Split(str, reps)
  local Results = {}
  string.gsub(str, "[^" .. reps .. "]+", function(w)
    table.insert(Results, w)
  end)
  return Results
end

Utils.ScreenPrint = not (not bDistribution or bEnableShippingLog) and MiscUtils.EmptyFunction or function(text)
  GWorld.logger.error(text)
end

function Utils.GText(Text)
  return TextUtils:GetDisplayText(Text)
end

_G.GText = Utils.GText

function Utils.EnText(Text)
  return TextUtils:GetDisplayText(Text, CommonConst.SystemLanguages.EN)
end

_G.EnText = Utils.EnText

function Utils.GDate(Month, Day, Language)
  Language = Language or CommonConst.SystemLanguage
  if Language == CommonConst.SystemLanguages.CN or Language == CommonConst.SystemLanguages.JP or Language == CommonConst.SystemLanguages.KR then
    return string.format("%02d-%02d", Month, Day)
  else
    return string.format("%02d-%02d", Day, Month)
  end
end

function Utils.GDate_YMD(Year, Month, Day, Language)
  Language = Language or CommonConst.SystemLanguage
  if Language == CommonConst.SystemLanguages.CN or Language == CommonConst.SystemLanguages.JP or Language == CommonConst.SystemLanguages.KR then
    return string.format("%02d-%02d-%02d", Year, Month, Day)
  else
    return string.format("%02d-%02d-%02d", Day, Month, Year)
  end
end

function Utils.GDate_YMD_Timestamp(Timestamp, Language)
  local Date = os.date("*t", Timestamp)
  return Utils.GDate_YMD(Date.year, Date.month, Date.day, Language)
end

function Utils.Split(input, delimiter)
  input = tostring(input)
  delimiter = tostring(delimiter)
  if "" == delimiter then
    return false
  end
  local pos, arr = 0, {}
  for st, sp in function()
    return string.find(input, delimiter, pos, true)
  end, nil, nil, nil do
    table.insert(arr, string.sub(input, pos, st - 1))
    pos = sp + 1
  end
  table.insert(arr, string.sub(input, pos))
  return arr
end

function Utils.UIManager(context)
  if not Utils.IsValid(Utils._UIManager) then
    DebugPrint(WarningTag, "Utils.UIManager \233\135\141\230\150\176\232\142\183\229\190\151UIManager")
    context = context or GWorld.GameInstance
    local GameInstance = UE4.UGameplayStatics.GetGameInstance(context)
    Utils._UIManager = GameInstance:GetGameUIManager()
    return Utils._UIManager
  end
  return Utils._UIManager
end

_G.UIManager = Utils.UIManager

function Utils.GameState(context)
  context = context or GWorld.GameInstance
  return UE4.UGameplayStatics.GetGameState(context)
end

_G.GameState = Utils.GameState
Utils.IsValid = MiscUtils.IsValid
_G.IsValid = Utils.IsValid
Utils.AudioManager_Var = nil

function Utils.AudioManager(context)
  return Utils.AudioManager_Var or MiscUtils.GetAudioManager_Lua(context)
end

_G.AudioManager = Utils.AudioManager

function Utils.HeroUSDKSubsystem(WorldContext)
  WorldContext = WorldContext or GWorld.GameInstance
  return USubsystemBlueprintLibrary.GetGameInstanceSubsystem(WorldContext, UEMHeroUSDKSubsystem)
end

function Utils.WorldTravelSubsystem(WorldContext)
  WorldContext = WorldContext or GWorld.GameInstance
  return USubsystemBlueprintLibrary.GetGameInstanceSubsystem(WorldContext, UWorldTravelSubsystem)
end

function Utils.TalkSubsystem(WorldContext)
  WorldContext = WorldContext or GWorld.GameInstance
  return USubsystemBlueprintLibrary.GetWorldSubsystem(WorldContext, UTalkSubsystem)
end

local function TestCrypt(...)
  local crypt = require("crypt")
  local s = crypt.randomkey()
  local text = crypt.randomkey()
  local rc4 = crypt.rc4_init(s)
  local rc4_1 = crypt.rc4_init(s)
  local c = crypt.rc4_crypt(rc4, text)
  local p = crypt.rc4_crypt(rc4, c)
  local p = crypt.rc4_crypt(rc4_1, p)
  local p = crypt.rc4_crypt(rc4_1, p)
  if p ~= text then
    Utils.ScreenPrint("\229\138\160\229\175\134\231\174\151\230\179\149\233\170\140\232\175\129\229\164\177\232\180\165")
  end
end

TestCrypt()

local function IsDLSSEnabled()
  if UE4.UDLSSLibrary then
    return UE4.UDLSSLibrary.IsDLSSSupported() and (UE4.UDLSSLibrary.IsDLAAEnabled() or UE4.UDLSSLibrary.GetDLSSMode() ~= UE4.UDLSSMode.Off)
  end
  return false
end

local FormatNumberTable = {
  k = 1000,
  M = 1000000,
  B = 1000000000
}

function Utils.FormatNumber(Number, UseFormat)
  if not UseFormat then
    local Result = MiscUtils.FormatNumberWithCommas(Number)
    return Result
  end
  local NumberStr = tostring(math.floor(Number))
  local NumLen = string.len(NumberStr)
  local FormatSign, FormatSignLen, FormatSignText
  if NumLen >= 11 then
    FormatSign = "B"
    FormatSignText = "UI_Amount_Billion"
    FormatSignLen = 9
  elseif NumLen >= 8 then
    FormatSign = "M"
    FormatSignText = "UI_Amount_Million"
    FormatSignLen = 6
  elseif NumLen >= 6 then
    FormatSign = "k"
    FormatSignText = "UI_Amount_Thousand"
    FormatSignLen = 3
  end
  if not FormatSign or nil == FormatNumberTable[FormatSign] then
    return NumberStr
  end
  local IntegerPart = string.sub(NumberStr, 1, NumLen - FormatSignLen)
  IntegerPart = MiscUtils.FormatNumberWithCommas(IntegerPart)
  if 0 == Number % FormatNumberTable[FormatSign] then
    return IntegerPart .. GText(FormatSignText)
  else
    local DecimalNum_1 = 10 * Number // FormatNumberTable[FormatSign] % 10
    if 9 == DecimalNum_1 then
      return IntegerPart .. ".9" .. GText(FormatSignText)
    else
      local DecimalNum_2 = 100 * Number // FormatNumberTable[FormatSign] % 10
      DecimalNum_1 = DecimalNum_1 + (DecimalNum_2 >= 5 and 1 or 0)
      if DecimalNum_1 > 0 then
        return IntegerPart .. "." .. DecimalNum_1 .. GText(FormatSignText)
      else
        return IntegerPart .. GText(FormatSignText)
      end
    end
  end
end

Utils.NPCCreateSubSystem_Var = nil

function Utils.NPCCreateSubSystem(context)
  return Utils.NPCCreateSubSystem_Var or MiscUtils.GetNPCCreateSubSystem_Lua(context)
end

_G.NPCCreateSubSystem = Utils.NPCCreateSubSystem
return Utils
