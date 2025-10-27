local T = {}
T.RT_1 = {
  0,
  0,
  0
}
T.RT_2 = {
  1,
  1,
  1
}
T.RT_3 = {
  Location = T.RT_1,
  Rotation = T.RT_1,
  scale = T.RT_2
}
T.RT_4 = {
  Weapon_Accessory = T.RT_3
}
T.RT_5 = {
  [1] = T.RT_4
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WeaponAccessoryOffset", {
  [10101] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10101
  },
  [10102] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10102
  },
  [10103] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10103
  },
  [10104] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10104
  },
  [10105] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10105
  },
  [10198] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10198
  },
  [10199] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10199
  },
  [10201] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10201
  },
  [10202] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10202
  },
  [10203] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10203
  },
  [10204] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10204
  },
  [10205] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10205
  },
  [10206] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10206
  },
  [10207] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10207
  },
  [10208] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10208
  },
  [10209] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10209
  },
  [10298] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10298
  },
  [10299] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10299
  },
  [10301] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10301
  },
  [10302] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10302
  },
  [10303] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10303
  },
  [10304] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10304
  },
  [10398] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10398
  },
  [10399] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10399
  },
  [10401] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10401
  },
  [10402] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10402
  },
  [10403] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10403
  },
  [10498] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10498
  },
  [10499] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10499
  },
  [10501] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10501
  },
  [10502] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10502
  },
  [10503] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10503
  },
  [10504] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10504
  },
  [10598] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10598
  },
  [10599] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10599
  },
  [10601] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10601
  },
  [10602] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10602
  },
  [10603] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10603
  },
  [10698] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10698
  },
  [10699] = {
    OffsetParameter = T.RT_5,
    WeaponId = 10699
  },
  [20101] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20101
  },
  [20102] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20102
  },
  [20103] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20103
  },
  [20198] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20198
  },
  [20199] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20199
  },
  [20201] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20201
  },
  [20203] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20203
  },
  [20205] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20205
  },
  [20296] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20296
  },
  [20298] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20298
  },
  [20301] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20301
  },
  [20302] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20302
  },
  [20303] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20303
  },
  [20304] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20304
  },
  [20305] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20305
  },
  [20398] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20398
  },
  [20399] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20399
  },
  [20401] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20401
  },
  [20402] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20402
  },
  [20403] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20403
  },
  [20405] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20405
  },
  [20498] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20498
  },
  [20499] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20499
  },
  [20501] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20501
  },
  [20502] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20502
  },
  [20503] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20503
  },
  [20504] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20504
  },
  [20507] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20507
  },
  [20508] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20508
  },
  [20509] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20509
  },
  [20510] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20510
  },
  [20598] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20598
  },
  [20599] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20599
  },
  [20601] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20601
  },
  [20602] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20602
  },
  [20603] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20603
  },
  [20698] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20698
  },
  [20699] = {
    OffsetParameter = T.RT_5,
    WeaponId = 20699
  }
})
