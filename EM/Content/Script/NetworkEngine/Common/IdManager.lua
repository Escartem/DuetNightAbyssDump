local CommonUtils = require("Utils.CommonUtils")
local bson = require("bson")
local IdManager = {}

function IdManager.GenId()
  return bson.objectid()
end

function IdManager.IsObjId(ObjId)
  return CommonUtils.IsObjId(ObjId)
end

function IdManager.ObjId2Str(ObjId)
  return CommonUtils.ObjId2Str(ObjId)
end

function IdManager.Str2ObjId(ObjIdStr)
  return CommonUtils.Str2ObjId(ObjIdStr)
end

return IdManager
