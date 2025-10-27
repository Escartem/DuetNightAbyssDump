local Data = {
  {
    MinKey = "UI_SystemNotice_TestContent",
    MaxKey = "UI_SystemNotice_Title",
    Loader = function()
      return {
        UI_SystemNotice_TestContent = {
          ContentFR = "\230\179\149\232\175\173\230\181\139\232\175\149\230\150\135\230\156\172",
          TextMapId = "UI_SystemNotice_TestContent"
        },
        UI_SystemNotice_Title = {
          ContentFR = "\230\179\149\232\175\173\230\181\139\232\175\149\230\150\135\230\156\172",
          TextMapId = "UI_SystemNotice_Title"
        }
      }
    end
  }
}
local rawset = _ENV.rawset
local TextMap_ContentFR = setmetatable({}, {
  __index = function(t, key)
    local Partition = DataMgr.GetPartitionData(key, Data)
    if Partition then
      for k, v in pairs(Partition) do
        if rawget(t, k) == nil then
          rawset(t, k, v)
        end
      end
      return Partition[key]
    else
      return nil
    end
  end,
  __pairs = function(t)
    for _, partDef in ipairs(Data) do
      local Partition = DataMgr.GetPartitionData(partDef.MinKey, Data)
      if Partition then
        for k, v in pairs(Partition) do
          if rawget(t, k) == nil then
            rawset(t, k, v)
          end
        end
      end
    end
    return next, t, nil
  end
})
return TextMap_ContentFR
