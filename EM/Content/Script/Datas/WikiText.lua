local T = {}
T.RT_1 = {10100201}
T.RT_2 = {10100601}
T.RT_3 = {10100801}
T.RT_4 = {10101901}
T.RT_5 = {10102401}
T.RT_6 = {11013601}
T.RT_7 = {20000501}
T.RT_8 = {20000601}
T.RT_9 = {10110201}
T.RT_10 = {10110801}
T.RT_11 = {10101601}
T.RT_12 = {10102601}
T.RT_13 = {10105401}
T.RT_14 = {10033953}
T.RT_15 = {11012811}
T.RT_16 = {11017001}
T.RT_17 = {11015301}
T.RT_18 = {11011501}
T.RT_19 = {10033914}
T.RT_20 = {10032101}
T.RT_21 = {10036801}
T.RT_22 = {10100401}
T.RT_23 = {10104001}
T.RT_24 = {10031210}
T.RT_25 = {11017101}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WikiText", {
  [10100301] = {
    EntryId = 101003,
    TextDetail = "WikiText_10100301",
    TextId = 10100301,
    TextRelatedDialogue = T.RT_1,
    TextUnlock = 10100301
  },
  [10100401] = {
    EntryId = 101004,
    TextDetail = "WikiText_10100401",
    TextId = 10100401,
    TextRelatedDialogue = T.RT_2,
    TextUnlock = 10100401
  },
  [10100402] = {
    EntryId = 101004,
    TextDetail = "WikiText_10100402",
    TextId = 10100402,
    TextRelatedDialogue = {11010401},
    TextUnlock = 10100402
  },
  [10100403] = {
    EntryId = 101004,
    TextDetail = "WikiText_10100403",
    TextId = 10100403,
    TextRelatedDialogue = {11011901},
    TextUnlock = 10100403
  },
  [10100501] = {
    EntryId = 101005,
    TextDetail = "WikiText_10100501",
    TextId = 10100501,
    TextRelatedDialogue = T.RT_3,
    TextUnlock = 10100501
  },
  [10100601] = {
    EntryId = 101006,
    TextDetail = "WikiText_10100601",
    TextId = 10100601,
    TextRelatedDialogue = T.RT_4,
    TextUnlock = 10100601
  },
  [10100602] = {
    EntryId = 101006,
    TextDetail = "WikiText_10100602",
    TextId = 10100602,
    TextRelatedDialogue = T.RT_5,
    TextUnlock = 10100602
  },
  [10100701] = {
    EntryId = 101007,
    TextDetail = "WikiText_10100701",
    TextId = 10100701,
    TextRelatedDialogue = {11010501},
    TextUnlock = 10100701
  },
  [10100801] = {
    EntryId = 101008,
    TextDetail = "WikiText_10100801",
    TextId = 10100801,
    TextRelatedDialogue = T.RT_6,
    TextUnlock = 10100801
  },
  [10100901] = {
    EntryId = 101009,
    TextDetail = "WikiText_10100901",
    TextId = 10100901,
    TextRelatedDialogue = T.RT_7,
    TextUnlock = 10100901
  },
  [10101001] = {
    EntryId = 101010,
    TextDetail = "WikiText_10101001",
    TextId = 10101001,
    TextUnlock = 10101001
  },
  [20100101] = {
    EntryId = 201001,
    TextDetail = "WikiText_20100101",
    TextId = 20100101,
    TextRelatedDialogue = {10010101},
    TextUnlock = 20100101
  },
  [20100102] = {
    EntryId = 201001,
    TextDetail = "WikiText_20100102",
    TextId = 20100102,
    TextRelatedDialogue = T.RT_1,
    TextUnlock = 20100102
  },
  [20100201] = {
    EntryId = 201002,
    TextDetail = "WikiText_20100201",
    TextId = 20100201,
    TextRelatedDialogue = {10011901},
    TextUnlock = 20100201
  },
  [20100301] = {
    EntryId = 201003,
    TextDetail = "WikiText_20100301",
    TextId = 20100301,
    TextRelatedDialogue = {10011701},
    TextUnlock = 20100301
  },
  [20100401] = {
    EntryId = 201004,
    TextDetail = "WikiText_20100401",
    TextId = 20100401,
    TextRelatedDialogue = T.RT_1,
    TextUnlock = 20100401
  },
  [20100501] = {
    EntryId = 201005,
    TextDetail = "WikiText_20100501",
    TextId = 20100501,
    TextRelatedDialogue = T.RT_1,
    TextUnlock = 20100501
  },
  [20100502] = {
    EntryId = 201005,
    TextDetail = "WikiText_20100502",
    TextId = 20100502,
    TextRelatedDialogue = T.RT_8,
    TextUnlock = 20100502
  },
  [20100601] = {
    EntryId = 201006,
    TextDetail = "WikiText_20100601",
    TextId = 20100601,
    TextRelatedDialogue = {10101301},
    TextUnlock = 20100601
  },
  [20100602] = {
    EntryId = 201006,
    TextDetail = "WikiText_20100602",
    TextId = 20100602,
    TextRelatedDialogue = T.RT_9,
    TextUnlock = 20100602
  },
  [20100603] = {
    EntryId = 201006,
    TextDetail = "WikiText_20100603",
    TextId = 20100603,
    TextRelatedDialogue = T.RT_10,
    TextUnlock = 20100603
  },
  [20100701] = {
    EntryId = 201007,
    TextDetail = "WikiText_20100701",
    TextId = 20100701,
    TextRelatedDialogue = T.RT_11,
    TextUnlock = 20100701
  },
  [20100702] = {
    EntryId = 201007,
    TextDetail = "WikiText_20100702",
    TextId = 20100702,
    TextRelatedDialogue = {10109401},
    TextUnlock = 20100702
  },
  [20100703] = {
    EntryId = 201007,
    TextDetail = "WikiText_20100703",
    TextId = 20100703,
    TextRelatedDialogue = {10112901},
    TextUnlock = 20100703
  },
  [20100801] = {
    EntryId = 201008,
    TextDetail = "WikiText_20100801",
    TextId = 20100801,
    TextRelatedDialogue = T.RT_12,
    TextUnlock = 20100801
  },
  [20100901] = {
    EntryId = 201009,
    TextDetail = "WikiText_20100901",
    TextId = 20100901,
    TextRelatedDialogue = T.RT_13,
    TextUnlock = 20100901
  },
  [20101001] = {
    EntryId = 201010,
    TextDetail = "WikiText_20101001",
    TextId = 20101001,
    TextRelatedDialogue = {10106101},
    TextUnlock = 20101001
  },
  [20101101] = {
    EntryId = 201011,
    TextDetail = "WikiText_20101101",
    TextId = 20101101,
    TextRelatedDialogue = {10113001},
    TextUnlock = 20101101
  },
  [20101102] = {
    EntryId = 201011,
    TextDetail = "WikiText_20101102",
    TextId = 20101102,
    TextUnlock = 20101102
  },
  [20101103] = {
    EntryId = 201011,
    TextDetail = "WikiText_20101103",
    TextId = 20101103,
    TextRelatedDialogue = T.RT_14,
    TextUnlock = 20101103
  },
  [20101104] = {
    EntryId = 201011,
    TextDetail = "WikiText_20101104",
    TextId = 20101104,
    TextUnlock = 20101104
  },
  [20101105] = {
    EntryId = 201011,
    TextDetail = "WikiText_20101105",
    TextId = 20101105,
    TextRelatedDialogue = {10035231, 10035244},
    TextUnlock = 20101105
  },
  [20101106] = {
    EntryId = 201011,
    TextDetail = "WikiText_20101106",
    TextId = 20101106,
    TextUnlock = 20101106
  },
  [20101201] = {
    EntryId = 201012,
    TextDetail = "WikiText_20101201",
    TextId = 20101201,
    TextRelatedDialogue = {11010301},
    TextUnlock = 20101201
  },
  [20101202] = {
    EntryId = 201012,
    TextDetail = "WikiText_20101202",
    TextId = 20101202,
    TextRelatedDialogue = {11015133},
    TextUnlock = 20101202
  },
  [20101301] = {
    EntryId = 201013,
    TextDetail = "WikiText_20101301",
    TextId = 20101301,
    TextUnlock = 20101301
  },
  [20101302] = {
    EntryId = 201013,
    TextDetail = "WikiText_20101302",
    TextId = 20101302,
    TextRelatedDialogue = T.RT_15,
    TextUnlock = 20101302
  },
  [20101303] = {
    EntryId = 201013,
    TextDetail = "WikiText_20101303",
    TextId = 20101303,
    TextRelatedDialogue = {11013701},
    TextUnlock = 20101303
  },
  [20101304] = {
    EntryId = 201013,
    TextDetail = "WikiText_20101304",
    TextId = 20101304,
    TextUnlock = 20101304
  },
  [20101401] = {
    EntryId = 201014,
    TextDetail = "WikiText_20101401",
    TextId = 20101401,
    TextUnlock = 20101401
  },
  [20101402] = {
    EntryId = 201014,
    TextDetail = "WikiText_20101402",
    TextId = 20101402,
    TextRelatedDialogue = {11013614},
    TextUnlock = 20101402
  },
  [20101501] = {
    EntryId = 201015,
    TextDetail = "WikiText_20101501",
    TextId = 20101501,
    TextRelatedDialogue = {11011801},
    TextUnlock = 20101501
  },
  [20101502] = {
    EntryId = 201015,
    TextDetail = "WikiText_20101502",
    TextId = 20101502,
    TextRelatedDialogue = {11012427},
    TextUnlock = 20101502
  },
  [20101601] = {
    EntryId = 201016,
    TextDetail = "WikiText_20101601",
    TextId = 20101601,
    TextRelatedDialogue = T.RT_6,
    TextUnlock = 20101601
  },
  [20101602] = {
    EntryId = 201016,
    TextDetail = "WikiText_20101602",
    TextId = 20101602,
    TextRelatedDialogue = T.RT_16,
    TextUnlock = 20101602
  },
  [20101701] = {
    EntryId = 201017,
    TextDetail = "WikiText_20101701",
    TextId = 20101701,
    TextRelatedDialogue = T.RT_6,
    TextUnlock = 20101701
  },
  [20101801] = {
    EntryId = 201018,
    TextDetail = "WikiText_20101801",
    TextId = 20101801,
    TextRelatedDialogue = {11015131},
    TextUnlock = 20101801
  },
  [20101901] = {
    EntryId = 201019,
    TextDetail = "WikiText_20101901",
    TextId = 20101901,
    TextRelatedDialogue = T.RT_17,
    TextUnlock = 20101901
  },
  [20101902] = {
    EntryId = 201019,
    TextDetail = "WikiText_20101902",
    TextId = 20101902,
    TextUnlock = 20101902
  },
  [20101903] = {
    EntryId = 201019,
    TextDetail = "WikiText_20101903",
    TextId = 20101903,
    TextRelatedDialogue = {11016701},
    TextUnlock = 20101903
  },
  [20102001] = {
    EntryId = 201020,
    TextDetail = "WikiText_20102001",
    TextId = 20102001,
    TextRelatedDialogue = T.RT_16,
    TextUnlock = 20102001
  },
  [20102002] = {
    EntryId = 201020,
    TextDetail = "WikiText_20102002",
    TextId = 20102002,
    TextRelatedDialogue = {11019107},
    TextUnlock = 20102002
  },
  [20102101] = {
    EntryId = 201021,
    TextDetail = "WikiText_20102101",
    TextId = 20102101,
    TextRelatedDialogue = T.RT_18,
    TextUnlock = 20102101
  },
  [20102102] = {
    EntryId = 201021,
    TextDetail = "WikiText_20102102",
    TextId = 20102102,
    TextRelatedDialogue = T.RT_19,
    TextUnlock = 20102102
  },
  [20102201] = {
    EntryId = 201022,
    TextDetail = "WikiText_20102201",
    TextId = 20102201,
    TextRelatedDialogue = T.RT_20,
    TextUnlock = 20102201
  },
  [20102301] = {
    EntryId = 201023,
    TextDetail = "WikiText_20102301",
    TextId = 20102301,
    TextRelatedDialogue = {10032301},
    TextUnlock = 20102301
  },
  [20102401] = {
    EntryId = 201024,
    TextDetail = "WikiText_20102401",
    TextId = 20102401,
    TextRelatedDialogue = T.RT_14,
    TextUnlock = 20102401
  },
  [20102402] = {
    EntryId = 201024,
    TextDetail = "WikiText_20102402",
    TextId = 20102402,
    TextRelatedDialogue = T.RT_21,
    TextUnlock = 20102402
  },
  [20102501] = {
    EntryId = 201025,
    TextDetail = "WikiText_20102501",
    TextId = 20102501,
    TextRelatedDialogue = {10034301},
    TextUnlock = 20102501
  },
  [20102601] = {
    EntryId = 201026,
    TextDetail = "WikiText_20102601",
    TextId = 20102601,
    TextRelatedDialogue = T.RT_21,
    TextUnlock = 20102601
  },
  [20102602] = {
    EntryId = 201026,
    TextDetail = "WikiText_20102602",
    TextId = 20102602,
    TextUnlock = 20102602
  },
  [20400101] = {
    EntryId = 204001,
    TextDetail = "WikiText_20400101",
    TextId = 20400101,
    TextUnlock = 20400101
  },
  [20400102] = {
    EntryId = 204001,
    TextDetail = "WikiText_20400102",
    TextId = 20400102,
    TextUnlock = 20400102
  },
  [20400103] = {
    EntryId = 204001,
    TextDetail = "WikiText_20400103",
    TextId = 20400103,
    TextRelatedDialogue = {11010101},
    TextUnlock = 20400103
  },
  [20400104] = {
    EntryId = 204001,
    TextDetail = "WikiText_20400104",
    TextId = 20400104,
    TextRelatedDialogue = T.RT_18,
    TextUnlock = 20400104
  },
  [20400105] = {
    EntryId = 204001,
    TextDetail = "WikiText_20400105",
    TextId = 20400105,
    TextRelatedDialogue = {11012430},
    TextUnlock = 20400105
  },
  [20400201] = {
    EntryId = 204002,
    TextDetail = "WikiText_20400201",
    TextId = 20400201,
    TextRelatedDialogue = T.RT_3,
    TextUnlock = 20400201
  },
  [20400301] = {
    EntryId = 204003,
    TextDetail = "WikiText_20400301",
    TextId = 20400301,
    TextRelatedDialogue = T.RT_7,
    TextUnlock = 20400301
  },
  [20400401] = {
    EntryId = 204004,
    TextDetail = "WikiText_20400401",
    TextId = 20400401,
    TextUnlock = 20400401
  },
  [30100101] = {
    EntryId = 301001,
    TextDetail = "WikiText_30100101",
    TextId = 30100101,
    TextUnlock = 30100101
  },
  [30100201] = {
    EntryId = 301002,
    TextDetail = "WikiText_30100201",
    TextId = 30100201,
    TextRelatedDialogue = {10104303},
    TextUnlock = 30100201
  },
  [30100301] = {
    EntryId = 301003,
    TextDetail = "WikiText_30100301",
    TextId = 30100301,
    TextRelatedDialogue = T.RT_22,
    TextUnlock = 30100301
  },
  [30100401] = {
    EntryId = 301004,
    TextDetail = "WikiText_30100401",
    TextId = 30100401,
    TextRelatedDialogue = T.RT_23,
    TextUnlock = 30100401
  },
  [30100402] = {
    EntryId = 301004,
    TextDetail = "WikiText_30100402",
    TextId = 30100402,
    TextRelatedDialogue = {10106310},
    TextUnlock = 30100402
  },
  [30100403] = {
    EntryId = 301004,
    TextDetail = "WikiText_30100403",
    TextId = 30100403,
    TextRelatedDialogue = {80080301},
    TextUnlock = 30100403
  },
  [30100501] = {
    EntryId = 301005,
    TextDetail = "WikiText_30100501",
    TextId = 30100501,
    TextRelatedDialogue = {10100905},
    TextUnlock = 30100501
  },
  [30100601] = {
    EntryId = 301006,
    TextDetail = "WikiText_30100601",
    TextId = 30100601,
    TextRelatedDialogue = T.RT_22,
    TextUnlock = 30100601
  },
  [30300101] = {
    EntryId = 303001,
    TextDetail = "WikiText_30300101",
    TextId = 30300101,
    TextUnlock = 30300101
  },
  [30300201] = {
    EntryId = 303002,
    TextDetail = "WikiText_30300201",
    TextId = 30300201,
    TextRelatedDialogue = T.RT_2,
    TextUnlock = 30300201
  },
  [30300202] = {
    EntryId = 303002,
    TextDetail = "WikiText_30300202",
    TextId = 30300202,
    TextRelatedDialogue = T.RT_8,
    TextUnlock = 30300202
  },
  [30300301] = {
    EntryId = 303003,
    TextDetail = "WikiText_30300301",
    TextId = 30300301,
    TextRelatedDialogue = T.RT_1,
    TextUnlock = 30300301
  },
  [30300302] = {
    EntryId = 303003,
    TextDetail = "WikiText_30300302",
    TextId = 30300302,
    TextRelatedDialogue = T.RT_5,
    TextUnlock = 30300302
  },
  [30300303] = {
    EntryId = 303003,
    TextDetail = "WikiText_30300303",
    TextId = 30300303,
    TextRelatedDialogue = T.RT_13,
    TextUnlock = 30300303
  },
  [30300304] = {
    EntryId = 303003,
    TextDetail = "WikiText_30300304",
    TextId = 30300304,
    TextRelatedDialogue = T.RT_9,
    TextUnlock = 30300304
  },
  [30300305] = {
    EntryId = 303003,
    TextDetail = "WikiText_30300305",
    TextId = 30300305,
    TextRelatedDialogue = T.RT_19,
    TextUnlock = 30300305
  },
  [30300401] = {
    EntryId = 303004,
    TextDetail = "WikiText_30300401",
    TextId = 30300401,
    TextUnlock = 30300401
  },
  [30300402] = {
    EntryId = 303004,
    TextDetail = "WikiText_30300402",
    TextId = 30300402,
    TextUnlock = 30300402
  },
  [30300501] = {
    EntryId = 303005,
    TextDetail = "WikiText_30300501",
    TextId = 30300501,
    TextRelatedDialogue = T.RT_13,
    TextUnlock = 30300501
  },
  [30300601] = {
    EntryId = 303006,
    TextDetail = "WikiText_30300601",
    TextId = 30300601,
    TextRelatedDialogue = T.RT_9,
    TextUnlock = 30300601
  },
  [30300701] = {
    EntryId = 303007,
    TextDetail = "WikiText_30300701",
    TextId = 30300701,
    TextRelatedDialogue = T.RT_5,
    TextUnlock = 30300701
  },
  [30400101] = {
    EntryId = 304001,
    TextDetail = "WikiText_30400101",
    TextId = 30400101,
    TextUnlock = 30400101
  },
  [30400201] = {
    EntryId = 304002,
    TextDetail = "WikiText_30400201",
    TextId = 30400201,
    TextUnlock = 30400201
  },
  [30400202] = {
    EntryId = 304002,
    TextDetail = "WikiText_30400202",
    TextId = 30400202,
    TextRelatedDialogue = {10108001},
    TextUnlock = 30400202
  },
  [30400203] = {
    EntryId = 304002,
    TextDetail = "WikiText_30400203",
    TextId = 30400203,
    TextRelatedDialogue = {10113101},
    TextUnlock = 30400203
  },
  [40100101] = {
    EntryId = 401001,
    TextDetail = "WikiText_40100101",
    TextId = 40100101,
    TextRelatedDialogue = {10011101},
    TextUnlock = 40100101
  },
  [40100201] = {
    EntryId = 401002,
    TextDetail = "WikiText_40100201",
    TextId = 40100201,
    TextRelatedDialogue = T.RT_19,
    TextUnlock = 40100201
  },
  [40200101] = {
    EntryId = 402001,
    TextDetail = "WikiText_40200101",
    TextId = 40200101,
    TextRelatedDialogue = {10125901},
    TextUnlock = 40200101
  },
  [40300101] = {
    EntryId = 403001,
    TextDetail = "WikiText_40300101",
    TextId = 40300101,
    TextUnlock = 40300101
  },
  [40300201] = {
    EntryId = 403002,
    TextDetail = "WikiText_40300201",
    TextId = 40300201,
    TextRelatedDialogue = T.RT_10,
    TextUnlock = 40300201
  },
  [40300301] = {
    EntryId = 403003,
    TextDetail = "WikiText_40300301",
    TextId = 40300301,
    TextRelatedDialogue = T.RT_6,
    TextUnlock = 40300301
  },
  [40300401] = {
    EntryId = 403004,
    TextDetail = "WikiText_40300401",
    TextId = 40300401,
    TextUnlock = 40300401
  },
  [40300402] = {
    EntryId = 403004,
    TextDetail = "WikiText_40300402",
    TextId = 40300402,
    TextRelatedDialogue = {10037623},
    TextUnlock = 40300402
  },
  [40400101] = {
    EntryId = 404001,
    TextDetail = "WikiText_40400101",
    TextId = 40400101,
    TextRelatedDialogue = T.RT_20,
    TextUnlock = 40400101
  },
  [40400201] = {
    EntryId = 404002,
    TextDetail = "WikiText_40400201",
    TextId = 40400201,
    TextRelatedDialogue = {10032801},
    TextUnlock = 40400201
  },
  [40400202] = {
    EntryId = 404002,
    TextDetail = "WikiText_40400202",
    TextId = 40400202,
    TextUnlock = 40400202
  },
  [40400203] = {
    EntryId = 404002,
    TextDetail = "WikiText_40400203",
    TextId = 40400203,
    TextUnlock = 40400203
  },
  [40500101] = {
    EntryId = 405001,
    TextDetail = "WikiText_40500101",
    TextId = 40500101,
    TextRelatedDialogue = T.RT_11,
    TextUnlock = 40500101
  },
  [40500102] = {
    EntryId = 405001,
    TextDetail = "WikiText_40500102",
    TextId = 40500102,
    TextUnlock = 200208
  },
  [40500201] = {
    EntryId = 405002,
    TextDetail = "WikiText_40500201",
    TextId = 40500201,
    TextUnlock = 40500201
  },
  [40500202] = {
    EntryId = 405002,
    TextDetail = "WikiText_40500202",
    TextId = 40500202,
    TextRelatedDialogue = {10106314},
    TextUnlock = 40500202
  },
  [40500203] = {
    EntryId = 405002,
    TextDetail = "WikiText_40500203",
    TextId = 40500203,
    TextRelatedDialogue = {10107101},
    TextUnlock = 40500203
  },
  [40500204] = {
    EntryId = 405002,
    TextDetail = "WikiText_40500204",
    TextId = 40500204,
    TextRelatedDialogue = {10110818},
    TextUnlock = 40500204
  },
  [40500301] = {
    EntryId = 405003,
    TextDetail = "WikiText_40500301",
    TextId = 40500301,
    TextRelatedDialogue = T.RT_4,
    TextUnlock = 40500301
  },
  [40500401] = {
    EntryId = 405004,
    TextDetail = "WikiText_40500401",
    TextId = 40500401,
    TextRelatedDialogue = T.RT_12,
    TextUnlock = 40500401
  },
  [40500501] = {
    EntryId = 405005,
    TextDetail = "WikiText_40500501",
    TextId = 40500501,
    TextRelatedDialogue = {10030801},
    TextUnlock = 40500501
  },
  [40500502] = {
    EntryId = 405005,
    TextDetail = "WikiText_40500502",
    TextId = 40500502,
    TextUnlock = 40500502
  },
  [40500503] = {
    EntryId = 405005,
    TextDetail = "WikiText_40500503",
    TextId = 40500503,
    TextUnlock = 40500503
  },
  [40500504] = {
    EntryId = 405005,
    TextDetail = "WikiText_40500504",
    TextId = 40500504,
    TextRelatedDialogue = {10034518, 10034527},
    TextUnlock = 40500504
  },
  [40500505] = {
    EntryId = 405005,
    TextDetail = "WikiText_40500505",
    TextId = 40500505,
    TextRelatedDialogue = {10036329},
    TextUnlock = 40500505
  },
  [40500506] = {
    EntryId = 405005,
    TextDetail = "WikiText_40500506",
    TextId = 40500506,
    TextUnlock = 40500506
  },
  [40500601] = {
    EntryId = 405006,
    TextDetail = "WikiText_40500601",
    TextId = 40500601,
    TextRelatedDialogue = T.RT_24,
    TextUnlock = 40500601
  },
  [40600101] = {
    EntryId = 406001,
    TextDetail = "WikiText_40600101",
    TextId = 40600101,
    TextRelatedDialogue = T.RT_23,
    TextUnlock = 40600101
  },
  [40600201] = {
    EntryId = 406002,
    TextDetail = "WikiText_40600201",
    TextId = 40600201,
    TextRelatedDialogue = T.RT_24,
    TextUnlock = 40600201
  },
  [40600301] = {
    EntryId = 406003,
    TextDetail = "WikiText_40600301",
    TextId = 40600301,
    TextRelatedDialogue = {10032501},
    TextUnlock = 40600301
  },
  [40700101] = {
    EntryId = 407001,
    TextDetail = "WikiText_40700101",
    TextId = 40700101,
    TextRelatedDialogue = {11011301},
    TextUnlock = 40700101
  },
  [40700201] = {
    EntryId = 407002,
    TextDetail = "WikiText_40700201",
    TextId = 40700201,
    TextRelatedDialogue = T.RT_17,
    TextUnlock = 40700201
  },
  [40700301] = {
    EntryId = 407003,
    TextDetail = "WikiText_40700301",
    TextId = 40700301,
    TextRelatedDialogue = T.RT_15,
    TextUnlock = 40700301
  },
  [40700401] = {
    EntryId = 407004,
    TextDetail = "WikiText_40700401",
    TextId = 40700401,
    TextRelatedDialogue = {10032701},
    TextUnlock = 40700401
  },
  [40800101] = {
    EntryId = 408001,
    TextDetail = "WikiText_40800101",
    TextId = 40800101,
    TextRelatedDialogue = {10025701},
    TextUnlock = 40800101
  },
  [40800201] = {
    EntryId = 408002,
    TextDetail = "WikiText_40800201",
    TextId = 40800201,
    TextRelatedDialogue = {10012801},
    TextUnlock = 40800201
  },
  [40800301] = {
    EntryId = 408003,
    TextDetail = "WikiText_40800301",
    TextId = 40800301,
    TextRelatedDialogue = T.RT_1,
    TextUnlock = 40800301
  },
  [40800302] = {
    EntryId = 408003,
    TextDetail = "WikiText_40800302",
    TextId = 40800302,
    TextUnlock = 40800302
  },
  [40800303] = {
    EntryId = 408003,
    TextDetail = "WikiText_40800303",
    TextId = 40800303,
    TextRelatedDialogue = {10106322},
    TextUnlock = 40800303
  },
  [40800304] = {
    EntryId = 408003,
    TextDetail = "WikiText_40800304",
    TextId = 40800304,
    TextRelatedDialogue = {10031101},
    TextUnlock = 40800304
  },
  [40800305] = {
    EntryId = 408003,
    TextDetail = "WikiText_40800305",
    TextId = 40800305,
    TextUnlock = 40800305
  },
  [40800401] = {
    EntryId = 408004,
    TextDetail = "WikiText_40800401",
    TextId = 40800401,
    TextRelatedDialogue = T.RT_3,
    TextUnlock = 40800401
  },
  [40800501] = {
    EntryId = 408005,
    TextDetail = "WikiText_40800501",
    TextId = 40800501,
    TextRelatedDialogue = {10106301},
    TextUnlock = 40800501
  },
  [40800601] = {
    EntryId = 408006,
    TextDetail = "WikiText_40800601",
    TextId = 40800601,
    TextRelatedDialogue = T.RT_9,
    TextUnlock = 40800601
  },
  [40800701] = {
    EntryId = 408007,
    TextDetail = "WikiText_40800701",
    TextId = 40800701,
    TextRelatedDialogue = {11011101},
    TextUnlock = 40800701
  },
  [40800801] = {
    EntryId = 408008,
    TextDetail = "WikiText_40800801",
    TextId = 40800801,
    TextRelatedDialogue = T.RT_25,
    TextUnlock = 40800801
  },
  [40800901] = {
    EntryId = 408009,
    TextDetail = "WikiText_40800901",
    TextId = 40800901,
    TextRelatedDialogue = T.RT_25,
    TextUnlock = 40800901
  }
})
