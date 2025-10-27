local CommonCacheVersion = 1.2
local UserCacheVersion = 1.2
return {
  CommonCacheVersion = CommonCacheVersion,
  UserCacheVersion = UserCacheVersion,
  GetVersion = function(bUseUUID)
    return bUseUUID and UserCacheVersion or CommonCacheVersion
  end
}
