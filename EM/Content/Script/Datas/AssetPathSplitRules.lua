local T = {}
T.RT_1 = {
  Hit = "Combat/Hit/",
  Locomotion = "Locomotion/",
  Skill = "Combat/Skill/",
  SpecialIdle = "SpecialIdle/"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AssetPathSplitRules", {
  [101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 101,
    MontageSuffixList = T.RT_1
  },
  [102] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 102,
    MontageSuffixList = T.RT_1
  },
  [103] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 103,
    MontageSuffixList = T.RT_1
  },
  [104] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 104,
    MontageSuffixList = T.RT_1
  },
  [1101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1101,
    MontageSuffixList = T.RT_1
  },
  [1102] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1102,
    MontageSuffixList = T.RT_1
  },
  [1801] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1801,
    MontageSuffixList = T.RT_1
  },
  [2101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2101,
    MontageSuffixList = T.RT_1
  },
  [2301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2301,
    MontageSuffixList = T.RT_1
  },
  [2401] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2401,
    MontageSuffixList = T.RT_1
  },
  [3101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 3101,
    MontageSuffixList = T.RT_1
  },
  [3102] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 3102,
    MontageSuffixList = T.RT_1
  },
  [3103] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 3103,
    MontageSuffixList = T.RT_1
  },
  [3201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 3201,
    MontageSuffixList = T.RT_1
  },
  [3301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 3301,
    MontageSuffixList = T.RT_1
  },
  [4101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 4101,
    MontageSuffixList = T.RT_1
  },
  [4201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 4201,
    MontageSuffixList = T.RT_1
  },
  [4202] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 4202,
    MontageSuffixList = T.RT_1
  },
  [4301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 4301,
    MontageSuffixList = T.RT_1
  },
  [5101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 5101,
    MontageSuffixList = T.RT_1
  },
  [5301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 5301,
    MontageSuffixList = T.RT_1
  },
  [110101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 110101,
    MontageSuffixList = T.RT_1
  },
  [110102] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 110102,
    MontageSuffixList = T.RT_1
  },
  [180101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 180101,
    MontageSuffixList = T.RT_1
  },
  [180121] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 180121,
    MontageSuffixList = T.RT_1
  },
  [180122] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 180122,
    MontageSuffixList = T.RT_1
  },
  [180123] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 180123,
    MontageSuffixList = T.RT_1
  },
  [180124] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 180124,
    MontageSuffixList = T.RT_1
  },
  [210101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 210101,
    MontageSuffixList = T.RT_1
  },
  [230101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 230101,
    MontageSuffixList = T.RT_1
  },
  [240101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 240101,
    MontageSuffixList = T.RT_1
  },
  [240102] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 240102,
    MontageSuffixList = T.RT_1
  },
  [310101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 310101,
    MontageSuffixList = T.RT_1
  },
  [310102] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 310102,
    MontageSuffixList = T.RT_1
  },
  [310103] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 310103,
    MontageSuffixList = T.RT_1
  },
  [310201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 310201,
    MontageSuffixList = T.RT_1
  },
  [310202] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 310202,
    MontageSuffixList = T.RT_1
  },
  [310203] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 310203,
    MontageSuffixList = T.RT_1
  },
  [310204] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 310204,
    MontageSuffixList = T.RT_1
  },
  [310205] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 310205,
    MontageSuffixList = T.RT_1
  },
  [310206] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 310206,
    MontageSuffixList = T.RT_1
  },
  [310207] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 310207,
    MontageSuffixList = T.RT_1
  },
  [310208] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 310208,
    MontageSuffixList = T.RT_1
  },
  [310301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 310301,
    MontageSuffixList = T.RT_1
  },
  [310303] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 310303,
    MontageSuffixList = T.RT_1
  },
  [310304] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 310304,
    MontageSuffixList = T.RT_1
  },
  [330101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 330101,
    MontageSuffixList = T.RT_1
  },
  [410101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 410101,
    MontageSuffixList = T.RT_1
  },
  [410102] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 410102,
    MontageSuffixList = T.RT_1
  },
  [420101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 420101,
    MontageSuffixList = T.RT_1
  },
  [420201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 420201,
    MontageSuffixList = T.RT_1
  },
  [420202] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 420202,
    MontageSuffixList = T.RT_1
  },
  [420203] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 420203,
    MontageSuffixList = T.RT_1
  },
  [510101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 510101,
    MontageSuffixList = T.RT_1
  },
  [530101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 530101,
    MontageSuffixList = T.RT_1
  },
  [530102] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 530102,
    MontageSuffixList = T.RT_1
  },
  [600101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 600101,
    MontageSuffixList = T.RT_1
  },
  [600201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 600201,
    MontageSuffixList = T.RT_1
  },
  [600202] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 600202,
    MontageSuffixList = T.RT_1
  },
  [600301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 600301,
    MontageSuffixList = T.RT_1
  },
  [600401] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 600401,
    MontageSuffixList = T.RT_1
  },
  [600501] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 600501,
    MontageSuffixList = T.RT_1
  },
  [700001] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700001,
    MontageSuffixList = T.RT_1
  },
  [700101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700101,
    MontageSuffixList = T.RT_1
  },
  [700102] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700102,
    MontageSuffixList = T.RT_1
  },
  [700201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700201,
    MontageSuffixList = T.RT_1
  },
  [700202] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700202,
    MontageSuffixList = T.RT_1
  },
  [700203] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700203,
    MontageSuffixList = T.RT_1
  },
  [700301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700301,
    MontageSuffixList = T.RT_1
  },
  [700302] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700302,
    MontageSuffixList = T.RT_1
  },
  [700401] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700401,
    MontageSuffixList = T.RT_1
  },
  [700402] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700402,
    MontageSuffixList = T.RT_1
  },
  [700403] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700403,
    MontageSuffixList = T.RT_1
  },
  [700404] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700404,
    MontageSuffixList = T.RT_1
  },
  [700405] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700405,
    MontageSuffixList = T.RT_1
  },
  [700601] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700601,
    MontageSuffixList = T.RT_1
  },
  [700701] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700701,
    MontageSuffixList = T.RT_1
  },
  [700702] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700702,
    MontageSuffixList = T.RT_1
  },
  [700801] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700801,
    MontageSuffixList = T.RT_1
  },
  [700802] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700802,
    MontageSuffixList = T.RT_1
  },
  [700803] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 700803,
    MontageSuffixList = T.RT_1
  },
  [701201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 701201,
    MontageSuffixList = T.RT_1
  },
  [701301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 701301,
    MontageSuffixList = T.RT_1
  },
  [800101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 800101,
    MontageSuffixList = T.RT_1
  },
  [800102] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 800102,
    MontageSuffixList = T.RT_1
  },
  [800201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 800201,
    MontageSuffixList = T.RT_1
  },
  [800202] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 800202,
    MontageSuffixList = T.RT_1
  },
  [800301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 800301,
    MontageSuffixList = T.RT_1
  },
  [800302] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 800302,
    MontageSuffixList = T.RT_1
  },
  [850001] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 850001,
    MontageSuffixList = T.RT_1
  },
  [850002] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 850002,
    MontageSuffixList = T.RT_1
  },
  [850101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 850101,
    MontageSuffixList = T.RT_1
  },
  [850102] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 850102,
    MontageSuffixList = T.RT_1
  },
  [850201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 850201,
    MontageSuffixList = T.RT_1
  },
  [850202] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 850202,
    MontageSuffixList = T.RT_1
  },
  [850301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 850301,
    MontageSuffixList = T.RT_1
  },
  [850401] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 850401,
    MontageSuffixList = T.RT_1
  },
  [850402] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 850402,
    MontageSuffixList = T.RT_1
  },
  [850403] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 850403,
    MontageSuffixList = T.RT_1
  },
  [850501] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 850501,
    MontageSuffixList = T.RT_1
  },
  [850502] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 850502,
    MontageSuffixList = T.RT_1
  },
  [850601] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 850601,
    MontageSuffixList = T.RT_1
  },
  [850701] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 850701,
    MontageSuffixList = T.RT_1
  },
  [900101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 900101,
    MontageSuffixList = T.RT_1
  },
  [900301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 900301,
    MontageSuffixList = T.RT_1
  },
  [900401] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 900401,
    MontageSuffixList = T.RT_1
  },
  [900501] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 900501,
    MontageSuffixList = T.RT_1
  },
  [900601] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 900601,
    MontageSuffixList = T.RT_1
  },
  [950001] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 950001,
    MontageSuffixList = T.RT_1
  },
  [950101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 950101,
    MontageSuffixList = T.RT_1
  },
  [950102] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 950102,
    MontageSuffixList = T.RT_1
  },
  [950103] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 950103,
    MontageSuffixList = T.RT_1
  },
  [950104] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 950104,
    MontageSuffixList = T.RT_1
  },
  [980101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 980101,
    MontageSuffixList = T.RT_1
  },
  [980102] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 980102,
    MontageSuffixList = T.RT_1
  },
  [980201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 980201,
    MontageSuffixList = T.RT_1
  },
  [980202] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 980202,
    MontageSuffixList = T.RT_1
  },
  [980301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 980301,
    MontageSuffixList = T.RT_1
  },
  [980302] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 980302,
    MontageSuffixList = T.RT_1
  },
  [980401] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 980401,
    MontageSuffixList = T.RT_1
  },
  [980501] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 980501,
    MontageSuffixList = T.RT_1
  },
  [980601] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 980601,
    MontageSuffixList = T.RT_1
  },
  [980602] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 980602,
    MontageSuffixList = T.RT_1
  },
  [980701] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 980701,
    MontageSuffixList = T.RT_1
  },
  [980801] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 980801,
    MontageSuffixList = T.RT_1
  },
  [980901] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 980901,
    MontageSuffixList = T.RT_1
  },
  [980902] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 980902,
    MontageSuffixList = T.RT_1
  },
  [1010101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1010101,
    MontageSuffixList = T.RT_1
  },
  [1010201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1010201,
    MontageSuffixList = T.RT_1
  },
  [1010301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1010301,
    MontageSuffixList = T.RT_1
  },
  [1010401] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1010401,
    MontageSuffixList = T.RT_1
  },
  [1010501] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1010501,
    MontageSuffixList = T.RT_1
  },
  [1019701] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1019701,
    MontageSuffixList = T.RT_1
  },
  [1019801] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1019801,
    MontageSuffixList = T.RT_1
  },
  [1020101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1020101,
    MontageSuffixList = T.RT_1
  },
  [1020201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1020201,
    MontageSuffixList = T.RT_1
  },
  [1020301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1020301,
    MontageSuffixList = T.RT_1
  },
  [1020401] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1020401,
    MontageSuffixList = T.RT_1
  },
  [1020501] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1020501,
    MontageSuffixList = T.RT_1
  },
  [1020601] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1020601,
    MontageSuffixList = T.RT_1
  },
  [1020701] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1020701,
    MontageSuffixList = T.RT_1
  },
  [1020801] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1020801,
    MontageSuffixList = T.RT_1
  },
  [1020901] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1020901,
    MontageSuffixList = T.RT_1
  },
  [1029801] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1029801,
    MontageSuffixList = T.RT_1
  },
  [1029901] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1029901,
    MontageSuffixList = T.RT_1
  },
  [1030101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1030101,
    MontageSuffixList = T.RT_1
  },
  [1030201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1030201,
    MontageSuffixList = T.RT_1
  },
  [1039801] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1039801,
    MontageSuffixList = T.RT_1
  },
  [1039901] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1039901,
    MontageSuffixList = T.RT_1
  },
  [1050101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1050101,
    MontageSuffixList = T.RT_1
  },
  [1060101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1060101,
    MontageSuffixList = T.RT_1
  },
  [1060102] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1060102,
    MontageSuffixList = T.RT_1
  },
  [1069801] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1069801,
    MontageSuffixList = T.RT_1
  },
  [1069802] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1069802,
    MontageSuffixList = T.RT_1
  },
  [1069901] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1069901,
    MontageSuffixList = T.RT_1
  },
  [1069902] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 1069902,
    MontageSuffixList = T.RT_1
  },
  [2010101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2010101,
    MontageSuffixList = T.RT_1
  },
  [2020101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2020101,
    MontageSuffixList = T.RT_1
  },
  [2020201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2020201,
    MontageSuffixList = T.RT_1
  },
  [2020301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2020301,
    MontageSuffixList = T.RT_1
  },
  [2020401] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2020401,
    MontageSuffixList = T.RT_1
  },
  [2029601] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2029601,
    MontageSuffixList = T.RT_1
  },
  [2029701] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2029701,
    MontageSuffixList = T.RT_1
  },
  [2029801] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2029801,
    MontageSuffixList = T.RT_1
  },
  [2029901] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2029901,
    MontageSuffixList = T.RT_1
  },
  [2030101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2030101,
    MontageSuffixList = T.RT_1
  },
  [2030301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2030301,
    MontageSuffixList = T.RT_1
  },
  [2039801] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2039801,
    MontageSuffixList = T.RT_1
  },
  [2039901] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2039901,
    MontageSuffixList = T.RT_1
  },
  [2040101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2040101,
    MontageSuffixList = T.RT_1
  },
  [2040201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2040201,
    MontageSuffixList = T.RT_1
  },
  [2040301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2040301,
    MontageSuffixList = T.RT_1
  },
  [2040401] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2040401,
    MontageSuffixList = T.RT_1
  },
  [2049801] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2049801,
    MontageSuffixList = T.RT_1
  },
  [2049901] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2049901,
    MontageSuffixList = T.RT_1
  },
  [2050101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2050101,
    MontageSuffixList = T.RT_1
  },
  [2050201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2050201,
    MontageSuffixList = T.RT_1
  },
  [2050301] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2050301,
    MontageSuffixList = T.RT_1
  },
  [2050401] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2050401,
    MontageSuffixList = T.RT_1
  },
  [2050701] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2050701,
    MontageSuffixList = T.RT_1
  },
  [2059801] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2059801,
    MontageSuffixList = T.RT_1
  },
  [2059901] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2059901,
    MontageSuffixList = T.RT_1
  },
  [2060101] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2060101,
    MontageSuffixList = T.RT_1
  },
  [2060201] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2060201,
    MontageSuffixList = T.RT_1
  },
  [2069801] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2069801,
    MontageSuffixList = T.RT_1
  },
  [2069901] = {
    IsPreloadMesh = true,
    IsPreloadWeapon = true,
    ModelId = 2069901,
    MontageSuffixList = T.RT_1
  }
})
