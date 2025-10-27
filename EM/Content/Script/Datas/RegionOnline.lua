local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RegionOnline", {
  [101] = {SubRegionId = 101},
  [101101] = {OnlineCondition = 100208, SubRegionId = 101101},
  [101901] = {
    OfflineCondition = 8012,
    OnlineCondition = 8011,
    SubRegionId = 101901
  }
})
