require("UnLua")
local Version = require("EMCache.Version")
local rapidjson = require("rapidjson")
local crypt = require("crypt")
local MiscUtils = require("Utils.MiscUtils")
local CryptKey = crypt.base64encode("DuetNightAbyss")
local MaxFileSize = 16777218
local FileNamePart = "EMCache"
local CommonTag = "Common"
local FileDir = UEMPathFunctionLibrary.GetProjectSavedDirectory() .. "SaveGames/" .. FileNamePart .. "/"
local EMCache = Class()
EMCache.CommonCache = {}
EMCache.UserCache = {}

function EMCache:_GetCacheInstance(bUseUUID, bCreateIfNil)
  if nil == bCreateIfNil then
    bCreateIfNil = true
  end
  if bUseUUID then
    if next(EMCache.UserCache) then
      return EMCache.UserCache
    end
    if bCreateIfNil then
      EMCache.UserCache = self:_RealLoadCache(bUseUUID)
      EMCache.UserCache.IsUserCache = true == bUseUUID
    end
    return EMCache.UserCache
  else
    if next(EMCache.CommonCache) then
      return EMCache.CommonCache
    end
    if bCreateIfNil then
      EMCache.CommonCache = self:_RealLoadCache(bUseUUID)
    end
    return EMCache.CommonCache
  end
end

function EMCache:_IsDedicatedServer()
  if self._bDedicatedServer == nil then
    local GameInstance = GWorld.GameInstance
    if not IsValid(GameInstance) then
      GameInstance = UE4.UGameplayStatics.GetGameInstance(UE.UEngine:GetDefaultObject())
    end
    if not IsValid(GameInstance) then
      DebugPrint(ErrorTag, "GameInstace\233\131\189\232\191\152\230\178\161\229\136\157\229\167\139\229\140\150\229\165\189\239\188\140\228\184\141\229\133\129\232\174\184\228\189\191\231\148\168\230\156\172\229\156\176\231\188\147\229\173\152")
      if self.__DebugKey then
        DebugPrint(ErrorTag, Traceback(nil, string.format("\233\157\158\230\179\149\232\176\131\231\148\168\231\154\132Key\239\188\154%s", self.__DebugKey), false))
      end
      self.__DebugKey = nil
      return true
    end
    self._bDedicatedServer = IsDedicatedServer(GameInstance)
  end
  return self._bDedicatedServer
end

function EMCache:Get(Key, bUseUUID)
  self.__DebugKey = Key
  if self:_IsDedicatedServer() then
    return
  end
  self.__DebugKey = nil
  local Cache = self:_GetCacheInstance(bUseUUID)
  if not Cache or not next(Cache) then
    return nil
  end
  return Cache[Key]
end

function EMCache:Set(Key, Value, bUseUUID)
  self.__DebugKey = Key
  if self:_IsDedicatedServer() then
    return
  end
  self.__DebugKey = nil
  local Cache = self:_GetCacheInstance(bUseUUID)
  if not Cache then
    return
  end
  Cache[Key] = Value
end

function EMCache:Remove(Key, bUseUUID)
  self.__DebugKey = Key
  if self:_IsDedicatedServer() then
    return
  end
  self.__DebugKey = nil
  local Cache = self:_GetCacheInstance(bUseUUID)
  if not Cache or not next(Cache) then
    return
  end
  Cache[Key] = nil
end

function EMCache:_GetCacheName(bUseUUID)
  local Tag = CommonTag
  if bUseUUID then
    local Avatar = GWorld:GetAvatar() or self.TempAvatar
    if not Avatar then
      Utils.Traceback(ErrorTag, LXYTag .. "[EMCache Error]Avatar is nil, Can't Get user Cache")
      return
    end
    Tag = tostring(Avatar.Account)
    if Avatar.Hostnum then
      Tag = tostring(Avatar.Hostnum) .. "_" .. Tag
    end
    return FileNamePart .. "_" .. Tag
  end
  return Tag .. "_" .. FileNamePart
end

function EMCache:_Save(bUseUUID, bNeedClean)
  if self:_IsDedicatedServer() then
    return
  end
  DebugPrint("[laixiaoyang]EMCache:_Save, " .. (bUseUUID and "\231\148\168\230\136\183" or "\229\133\172\229\133\177") .. "\231\188\147\229\173\152\232\167\166\229\143\145\228\191\157\229\173\152\239\188\129\239\188\129\239\188\129 \230\152\175\229\144\166Clean\239\188\154" .. tostring(bNeedClean))
  local Cache = self:_GetCacheInstance(bUseUUID, false)
  if not Cache or not next(Cache) then
    print(_G.LogTag, "[EMCache]_SaveFile, Cache is Empty or nil")
    return
  end
  local Res = self:_RealSaveCache(Cache, bUseUUID)
  if Res and bNeedClean then
    if bUseUUID then
      EMCache.UserCache = {}
    else
      EMCache.CommonCache = {}
    end
  end
  return Res
end

function EMCache:_RealLoadCache(bUseUUID)
  if not self._SaveGameClassWrap then
    self._SaveGameClassWrap = MiscUtils.LazyLoadClass("/Game/BluePrints/Client/BP_EMSaveGame.BP_EMSaveGame_C", true)
  end
  local CacheName = self:_GetCacheName(bUseUUID)
  if not CacheName then
    return {}
  end
  local SaveGame = UE.UGameplayStatics.LoadGameFromSlot(CacheName, 0)
  if not IsValid(SaveGame) then
    print(_G.LogTag, "[EMCache]_LoadFile, Load SaveGame Failed!!")
    return {}
  end
  if #SaveGame.EMCacheContent > MaxFileSize then
    GWorld.logger.error(string.format("\231\188\147\229\173\152\229\134\133\229\174\185\232\182\133\232\191\1352M\228\186\134\239\188\140\232\183\179\232\191\135\230\156\172\230\172\161\229\186\143\229\136\151\229\140\150\229\185\182\229\136\160\233\153\164\232\175\165\231\188\147\229\173\152 \239\188\154%s", CacheName))
    return {}
  end
  local FileContent = ""
  try({
    exec = function()
      FileContent = self:Decryption(SaveGame.EMCacheContent)
    end,
    catch = function(err)
      DebugPrint(ErrorTag, "\230\156\172\229\156\176\231\188\147\229\173\152\232\167\163\229\175\134\229\164\177\232\180\165", err)
    end
  })
  local EMCacheVersion = Version.GetVersion(bUseUUID)
  local Cache = self:Deserialize(FileContent, EMCacheVersion)
  if not Cache or Cache.Version ~= EMCacheVersion then
    if Cache then
      DebugPrint(WarningTag, "[laixiaoyang]EMCache:_RealLoadCache," .. (bUseUUID and "\231\148\168\230\136\183" or "\229\133\172\229\133\177") .. "\231\188\147\229\173\152\231\137\136\230\156\172\232\191\135\228\189\142\239\188\140\232\167\166\229\143\145\233\135\141\229\187\186\231\188\147\229\173\152\239\188\140\230\151\167\231\137\136\230\156\172\229\143\183:" .. Cache.Version .. "\239\188\140\230\150\176\231\137\136\230\156\172\229\143\183:" .. EMCacheVersion)
      EMCache:Reset(false, bUseUUID)
    else
      DebugPrint(ErrorTag, "\230\156\172\229\156\176\231\188\147\229\173\152\230\150\135\228\187\182\228\184\141\229\133\188\229\174\185\\\230\132\143\229\164\150\230\141\159\229\157\143\\\232\162\171\228\186\186\228\184\186\228\191\174\230\148\185\228\186\134\239\188\140\233\135\141\229\187\186\230\150\176\231\154\132\231\169\186\231\153\189\231\188\147\229\173\152")
      DebugPrint(ErrorTag, Traceback(nil, string.format("\229\135\186\233\148\153\231\154\132\231\188\147\229\173\152\230\150\135\228\187\182 %s", CacheName), true))
    end
    Cache = {}
    Cache.Initialized = 1
    Cache.Version = EMCacheVersion
  end
  return Cache
end

function EMCache:_RealSaveCache(Cache, bUseUUID)
  if Cache.IsUserCache == nil then
    Cache.IsUserCache = false
  end
  if nil == bUseUUID then
    bUseUUID = false
  end
  if Cache.IsUserCache ~= bUseUUID then
    local Prediction = bUseUUID and "\231\148\168\230\136\183\231\188\147\229\173\152" or "\229\133\172\229\133\177\231\188\147\229\173\152"
    local Actural = Cache.IsUserCache and "\231\148\168\230\136\183\231\188\147\229\173\152" or "\229\133\172\229\133\177\231\188\147\229\173\152"
    DebugPrint(Traceback(ErrorTag, "\230\156\172\229\156\176\231\188\147\229\173\152\228\191\157\229\173\152\229\164\177\232\180\165\239\188\140\231\188\147\229\173\152\231\177\187\229\158\139\228\184\178\228\186\134" .. "  \233\162\132\232\174\161\232\166\129\228\191\157\229\173\152\231\154\132\239\188\154" .. Prediction .. "  \229\174\158\233\153\133\228\191\157\229\173\152\231\154\132\239\188\154" .. Actural))
    return
  end
  local FileContent = self:Serialize(Cache, Version.GetVersion(bUseUUID))
  if string.isempty(FileContent) then
    DebugPrint(ErrorTag, "\230\156\172\229\156\176\231\188\147\229\173\152\228\191\157\229\173\152\229\164\177\232\180\165\239\188\140\229\142\159\229\155\160\239\188\154\231\188\147\229\173\152\229\186\143\229\136\151\229\140\150\229\164\177\232\180\165")
    return
  end
  local CacheName = self:_GetCacheName(bUseUUID)
  if not CacheName then
    DebugPrint(ErrorTag, "\230\156\172\229\156\176\231\188\147\229\173\152\229\143\141\229\186\143\229\136\151\229\140\150\229\164\177\232\180\165\239\188\140\229\142\159\229\155\160\239\188\154\231\188\147\229\173\152\232\183\175\229\190\132\231\148\159\230\136\144\229\164\177\232\180\165")
    return
  end
  if GWorld.IsDev then
    local FullFileDir = URuntimeCommonFunctionLibrary.ConvertRelativePathToFull(FileDir)
    if not UE4.UBlueprintFileUtilsBPLibrary.DirectoryExists(FullFileDir) then
      DebugPrint(DebugTag, "\229\136\155\229\187\186\230\156\172\229\156\176\231\188\147\229\173\152\230\152\142\230\150\135\231\155\174\229\189\149", FullFileDir)
      UE4.UBlueprintFileUtilsBPLibrary.MakeDirectory(FullFileDir)
    end
    local ExtraPath = FullFileDir .. CacheName .. ".json"
    if #FileContent > MaxFileSize then
      GWorld.logger.error(string.format("\231\188\147\229\173\152\229\134\133\229\174\185\232\182\133\232\191\1352M\228\186\134\239\188\140\229\164\170\229\164\167\231\154\132\231\188\147\229\173\152\230\128\128\231\150\145\230\152\175\230\156\137\229\134\153\229\133\165\230\179\132\230\188\143\239\188\140\230\159\165\228\184\128\228\184\139\229\136\176\229\186\149\229\147\170\233\135\140\230\156\137\229\134\153\229\133\165\230\179\132\230\188\143\n\230\156\137\233\151\174\233\162\152\231\154\132\231\188\147\229\173\152\230\150\135\228\187\182: %s", ExtraPath))
    end
    local file = io.open(ExtraPath, "w")
    if file then
      file:write(FileContent)
      file:close()
    else
      DebugPrint(ErrorTag, "\230\156\172\229\156\176\231\188\147\229\173\152\229\144\141\230\150\135\228\191\157\229\173\152\229\164\177\232\180\165\239\188\140\230\148\190\229\188\131\228\191\157\229\173\152\230\152\142\230\150\135", ExtraPath)
    end
  end
  if not IsValid(UE.UGameplayStatics) then
    DebugPrint(ErrorTag, "\230\156\172\229\156\176\231\188\147\229\173\152\228\191\157\229\173\152\229\164\177\232\180\165\239\188\140\229\142\159\229\155\160\239\188\154\230\178\161\232\190\153\228\186\134\239\188\140\232\147\157\229\155\190\229\135\189\230\149\176\229\186\147\233\131\189\232\162\171GC\228\186\134...")
    return
  end
  if not self._SaveGameClassWrap then
    self._SaveGameClassWrap = MiscUtils.LazyLoadClass("/Game/BluePrints/Client/BP_EMSaveGame.BP_EMSaveGame_C", true)
  end
  local SaveGameClass = self._SaveGameClassWrap:get()
  if not IsValid(SaveGameClass) then
    DebugPrint(ErrorTag, "\230\156\172\229\156\176\231\188\147\229\173\152\228\191\157\229\173\152\229\164\177\232\180\165\239\188\140\229\142\159\229\155\160\239\188\154SaveGameClass\229\136\155\229\187\186\229\164\177\232\180\165")
    return
  end
  local SaveGame = UE.UGameplayStatics.CreateSaveGameObject(SaveGameClass)
  if not IsValid(SaveGame) then
    DebugPrint(ErrorTag, "\230\156\172\229\156\176\231\188\147\229\173\152\228\191\157\229\173\152\229\164\177\232\180\165\239\188\140\229\142\159\229\155\160\239\188\154SaveGame\229\175\185\232\177\161\229\136\155\229\187\186\229\164\177\232\180\165")
    return
  end
  SaveGame.EMCacheContent = self:Encryption(FileContent)
  local Res = UE.UGameplayStatics.SaveGameToSlot(SaveGame, CacheName, 0)
  SaveGame.EMCacheContent = ""
  return Res
end

function EMCache:SaveUser(bNeedClean, TempAvatar)
  self.TempAvatar = TempAvatar
  self:_Save(true, bNeedClean)
  self.TempAvatar = nil
end

function EMCache:SaveCommon(bNeedClean)
  self:_Save(false, bNeedClean)
end

function EMCache:SaveAll(bNeedClean)
  self:SaveUser(bNeedClean)
  self:SaveCommon(bNeedClean)
end

function EMCache:Reset(bClean, bUseUUID)
  if nil == bClean then
    bClean = true
  end
  
  local function RealReset(Dir)
    local FileNames = TArray("")
    local Res = UE4.URuntimeCommonFunctionLibrary.GetAllFileNamesInDic(Dir, FileNames)
    assert(Res, "\230\184\133\231\169\186\230\156\172\229\156\176\231\188\147\229\173\152\229\164\177\232\180\165\239\188\140" .. Dir .. "\232\183\175\229\190\132\228\184\141\229\173\152\229\156\168")
    for i = 1, FileNames:Length() do
      local FileFull = FileNames:GetRef(i)
      if bClean then
        UE4.UBlueprintFileUtilsBPLibrary.DeleteFile(FileFull)
      else
        local FileName = Split(FileFull, "/")
        FileName = FileName[#FileName]
        local CacheName = self:_GetCacheName(bUseUUID)
        if not CacheName then
          return
        end
        if not bUseUUID and string.sub(FileName, 1, #CommonTag) == CommonTag then
          UE4.UBlueprintFileUtilsBPLibrary.DeleteFile(FileFull)
          break
        elseif bUseUUID and string.sub(FileName, 1, #CacheName) == CacheName then
          UE4.UBlueprintFileUtilsBPLibrary.DeleteFile(FileFull)
          break
        end
      end
    end
  end
  
  local SaveGameDir = UKismetSystemLibrary.GetProjectSavedDirectory() .. "SaveGames/"
  RealReset(SaveGameDir)
  if GWorld.IsDev then
    local FullFileDir = URuntimeCommonFunctionLibrary.ConvertRelativePathToFull(FileDir)
    RealReset(FullFileDir)
  end
  if bClean then
    EMCache.UserCache, EMCache.CommonCache = {}, {}
  elseif bUseUUID then
    EMCache.UserCache = {}
  else
    EMCache.CommonCache = {}
  end
end

function EMCache:Serialize(Obj, EMCacheVersion)
  if EMCacheVersion and not Obj.Version then
    Obj.Version = EMCacheVersion
  end
  local Params = {}
  if GWorld.IsDev then
    Params = {
      pretty = true,
      sort_keys = true,
      indent = "    "
    }
  end
  local Content
  try({
    exec = function()
      Content = rapidjson.encode(Obj, Params)
    end,
    catch = function(err)
      DebugPrint(ErrorTag, "\230\156\172\229\156\176\231\188\147\229\173\152\229\186\143\229\136\151\229\140\150\229\164\177\232\180\165", err)
    end
  })
  return Content
end

function EMCache:Deserialize(Str, EMCacheVersion)
  local Type = type(Str)
  if "nil" == Type or "" == Str then
    return nil
  elseif "number" == Type or "string" == Type or "boolean" == Type then
    Str = tostring(Str)
  else
    return nil
  end
  local Cache
  try({
    exec = function()
      Cache = rapidjson.decode(Str, {key2number = true})
      Cache.Initialized = 1
      if not Cache.Version then
        Cache.Version = EMCacheVersion
      end
    end,
    catch = function(err)
      DebugPrint(ErrorTag, "\230\156\172\229\156\176\231\188\147\229\173\152\229\143\141\229\186\143\229\136\151\229\140\150\229\164\177\232\180\165", err)
    end
  })
  return Cache
end

function EMCache:Encryption(ContentStr)
  local Encrypted = crypt.xor_str(ContentStr, CryptKey)
  local EMCacheContent = {}
  for i = 1, string.len(Encrypted) do
    table.insert(EMCacheContent, string.format("%02X", string.byte(Encrypted, i)))
  end
  return table.concat(EMCacheContent)
end

function EMCache:Decryption(ContentStr)
  local EMCacheContent = {}
  for Char in string.gmatch(ContentStr, "(..)") do
    table.insert(EMCacheContent, string.char(tonumber(Char, 16)))
  end
  local Encrypted = table.concat(EMCacheContent)
  return crypt.xor_str(Encrypted, CryptKey)
end

return EMCache
