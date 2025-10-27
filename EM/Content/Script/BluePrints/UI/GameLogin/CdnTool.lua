local CdnTool = {}
local Private = {}
local CdnPath = require("BluePrints/UI/GameLogin/CdnPath")
local Json = require("rapidjson")

local function print(...)
  _ENV.print(_G.LogTag, "CdnTool", ...)
end

function Private.JsonFileToTable(Content)
  local ok, Tb = pcall(Json.decode, Content)
  if not ok then
    print("[Private.JsonFileToTable] Json.decode Error:", Content)
    return false
  end
  return true, Tb
end

function Private.LuaFileToTable(Content)
  local loadFunction, errorMessage = load(Content)
  if errorMessage then
    print("[Private.LuaFileToTable] Content Error:", Content)
    return false
  end
  local tb = loadFunction()
  if not tb or type(tb) ~= "table" then
    print("[Private.LuaFileToTable] Content is not a table:", Content)
    return false
  end
  return true, tb
end

function Private.CdnGet(CdnUrls, Path, ToTableFunc, Cb)
  local CurrentUrlIndex = 1
  local HttpGetCb
  
  function HttpGetCb(Content)
    print("[Private.CdnGet] URL", CdnUrls[CurrentUrlIndex] .. Path, "Content", Content)
    local ok, Tb = ToTableFunc(Content)
    if ok then
      return Cb(Tb, Content)
    else
      CurrentUrlIndex = CurrentUrlIndex + 1
      if CurrentUrlIndex > #CdnUrls then
        print("[Private.CdnGet] All Failed:", Path)
        return Cb(nil)
      end
      print("[Private.CdnGet] TryAgain Count:", CurrentUrlIndex, CdnUrls[CurrentUrlIndex] .. Path)
      UE.URuntimeCommonFunctionLibrary.HttpGet(CdnUrls[CurrentUrlIndex] .. Path, {
        GWorld.GameInstance,
        function(_, Content)
          HttpGetCb(Content)
        end
      })
    end
  end
  
  print("[Private.CdnGet] First Get:", CdnUrls[CurrentUrlIndex] .. Path)
  UE.URuntimeCommonFunctionLibrary.HttpGet(CdnUrls[CurrentUrlIndex] .. Path, {
    GWorld.GameInstance,
    function(_, Content)
      HttpGetCb(Content)
    end
  })
end

function Private.CdnGetLuaTable(CdnUrls, Path, Cb)
  Private.CdnGet(CdnUrls, Path, Private.LuaFileToTable, Cb)
end

function Private.CdnGetJson(CdnUrls, Path, Cb)
  Private.CdnGet(CdnUrls, Path, Private.JsonFileToTable, Cb)
end

function Private.TryUpdateFileOrUseCache(CdnUrls, VersionFilePath, FilePath, ToTable, Cb)
  print("[Private.TryUpdateFileOrUseCache] VersionFilePath:", VersionFilePath)
  print("[Private.TryUpdateFileOrUseCache] FilePath:", FilePath)
  local CacheFilePath = UEMPathFunctionLibrary.GetProjectSavedDirectory() .. FilePath
  local CacheFileContent = UE4.URuntimeCommonFunctionLibrary.LoadFile(CacheFilePath)
  local ok, CacheTable = ToTable(CacheFileContent)
  if not ok then
    print("[Private.TryUpdateFileOrUseCache] CacheFileContent is Error:", CacheFileContent)
  end
  CacheTable = CacheTable or {}
  local LocalVersion = CacheTable.Version or -1
  print("[Private.TryUpdateFileOrUseCache] LocalVersion:", LocalVersion)
  Private.CdnGet(CdnUrls, VersionFilePath, ToTable, function(VersionTable)
    VersionTable = VersionTable or {}
    local CDNVersion = VersionTable.Version or 0
    print("[Private.TryUpdateFileOrUseCache] CDNVersion:", CDNVersion)
    if CDNVersion == LocalVersion then
      print("[Private.TryUpdateFileOrUseCache] LocalVersion == CDNVersion, CacheTable:", LocalVersion)
      CacheTable.Version = nil
      return Cb(CacheTable)
    else
      Private.CdnGet(CdnUrls, FilePath, ToTable, function(ContentTable, Content)
        if not ContentTable then
          print("[Private.TryUpdateFileOrUseCache] Content is nil")
          return Cb(nil)
        end
        if ContentTable.Version ~= CDNVersion then
          print("[Private.TryUpdateFileOrUseCache] Version Not Match, VersionFile:", CDNVersion, " ContentVersion:", ContentTable.Version)
        end
        UE.URuntimeCommonFunctionLibrary.SaveFile(CacheFilePath, Content)
        ContentTable.Version = nil
        return Cb(ContentTable)
      end)
    end
  end)
end

function CdnTool:GetGameNotice(ServerID, Cb)
  Private.TryUpdateFileOrUseCache(CdnPath:CdnUrl(ServerID), CdnPath:GameNoticeVersion(ServerID), CdnPath:GameNotice(ServerID), Private.LuaFileToTable, Cb, ServerID)
end

function CdnTool:GetMaintenance(ServerID, Cb)
  Private.CdnGetJson(CdnPath:CdnUrl(ServerID), CdnPath:Maintenance(ServerID), Cb)
end

function CdnTool:GetMaintenanceInterceptUrl(ServerID, Cb)
  Private.CdnGetJson(CdnPath:CdnUrl(ServerID), CdnPath:MaintenanceInterceptUrl(ServerID), Cb)
end

function CdnTool:CdnUrl()
  return CdnPath:CdnUrl()[1]
end

function CdnTool:GetServerList(Cb)
  local CdnUrls = CdnPath:CdnUrl()
  Private.CdnGetLuaTable(CdnUrls, CdnPath:ServerList(), function(ContentTable, Content)
    if not ContentTable then
      print("[CdnTool:CBT3GetGateIpPort] Cdn ServerListFile is nil", Content)
      Cb(nil)
      return
    end
    print("[CdnTool:CBT3GetGateIpPort] ServerList Update Success", Content)
    Cb(ContentTable)
  end)
end

function CdnTool:GetCdnHideData(HostId)
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    GWorld.logger.error("\230\137\167\232\161\140GetCdnHideData\229\135\186\233\148\153\239\188\140Avatar\228\184\141\229\173\152\229\156\168!!!")
    return
  end
  local HideDataPath = CdnPath:GetHideUICtrl(HostId)
  print("[CdnTool] \229\188\128\229\167\139\230\137\167\232\161\140GetCdnHideData, Url:", HideDataPath)
  Private.CdnGetJson(CdnPath:CdnUrl(HostId), HideDataPath, function(Infos)
    try({
      exec = function()
        if not Infos then
          print("\230\137\167\232\161\140GetCdnHideData\229\135\186\233\148\153\239\188\140\230\178\161\229\143\150\229\136\176CdnData,CdnPath:" .. tostring(CdnPath:CdnUrl(HostId)) .. HideDataPath)
          return
        end
        local Avatar = GWorld:GetAvatar()
        if not Avatar then
          GWorld.logger.error("\230\137\167\232\161\140GetCdnHideData\229\135\186\233\148\153\239\188\140json\232\167\163\230\158\144\229\164\177\232\180\165!!!")
          return
        end
        local ChanelProvider = GWorld.ServerListMgr:GetChanelProvider()
        if not ChanelProvider then
          print("\230\137\167\232\161\140GetCdnHideData\229\135\186\233\148\153\239\188\140ChannelProvider\228\184\186\231\169\186,CdnPath:" .. tostring(CdnPath:CdnUrl(HostId)) .. HideDataPath)
          return
        end
        if not Infos[ChanelProvider] then
          print("\230\137\167\232\161\140GetCdnHideData\229\135\186\233\148\153\239\188\140\230\148\182\229\136\176\231\154\132\230\149\176\230\141\174\228\184\173\230\178\161\230\156\137\229\175\185\229\186\148\230\184\160\233\129\147\231\154\132\230\149\176\230\141\174,CdnPath:" .. tostring(CdnPath:CdnUrl(HostId)) .. HideDataPath, "\229\189\147\229\137\141\230\184\160\233\129\147:" .. ChanelProvider)
          return
        end
        Avatar.CdnHideData = Infos[ChanelProvider]
        PrintTable(Avatar.CdnHideData, 10, "CdnHideData")
        print("[CdnTool] \230\137\167\232\161\140GetCdnHideData\230\136\144\229\138\159, Url:", HideDataPath, ",\229\143\175\228\187\165\233\128\154\232\191\135gm PrintTable(A.CdnHideData)\230\159\165\231\156\139\232\175\166\231\187\134\230\149\176\230\141\174\227\128\130")
      end,
      catch = function(e)
        GWorld.logger.error("\230\137\167\232\161\140GetCdnHideData\229\135\186\233\148\153\239\188\140\230\156\170\231\159\165\233\148\153\232\175\175\n" .. tostring(e))
      end,
      final = function()
      end
    })
  end)
end

function CdnTool:GetAllAvatars(Account, Callback)
  GWorld.NetworkMgr.IsQuickLogin = false
  
  local function OnGetServerList(Servers)
    if not Servers or 0 == CommonUtils.Size(Servers) then
      print("[CdnTool:GetAllAvatars] ServerList is nil", Servers)
      Callback(false, "Get ServerList Failed")
      return
    end
    local _ServerList = {}
    if not AHotUpdateGameMode.IsGlobalPak() then
      for _, ServerInfo in pairs(Servers) do
        table.insert(_ServerList, ServerInfo)
      end
    else
      local RegionCode = HeroUSDKSubsystem():GetCountryCode()
      if RegionCode then
        local RegionCodeData = DataMgr.CountryRegionCode[RegionCode]
        if RegionCodeData and RegionCodeData.ServerArea then
          for _, ServerInfo in pairs(Servers) do
            if ServerInfo.area == RegionCodeData.ServerArea then
              table.insert(_ServerList, ServerInfo)
            end
          end
        end
      end
      if 0 == #_ServerList then
        for _, ServerInfo in pairs(Servers) do
          table.insert(_ServerList, ServerInfo)
        end
      end
    end
    local RandomIndex = math.random(1, #_ServerList)
    local Info = _ServerList[RandomIndex]
    GWorld.NetworkMgr:ConnectServer(Info.hostnum, Info.ip, Info.port, Account, false, true)
    Callback(true, "Start Connect Server, Please Wait...", Servers)
  end
  
  self:GetServerList(OnGetServerList)
end

return CdnTool
