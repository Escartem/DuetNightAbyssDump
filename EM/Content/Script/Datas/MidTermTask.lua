local T = {}
T.RT_1 = {1900101}
T.RT_2 = {30101}
T.RT_3 = {50931}
T.RT_4 = {50930}
T.RT_5 = {
  10206,
  10207,
  10208,
  10209
}
T.RT_6 = {10120}
T.RT_7 = {50938}
T.RT_8 = {10102}
T.RT_9 = {30603}
T.RT_10 = {50933}
T.RT_11 = {
  30301,
  30302,
  30303
}
T.RT_12 = {30302, 30303}
T.RT_13 = {2004}
T.RT_14 = {50934}
T.RT_15 = {10121}
T.RT_16 = {50935}
T.RT_17 = {50936}
T.RT_18 = {10123}
T.RT_19 = {50937}
T.RT_20 = {10124}
T.RT_21 = {60802}
T.RT_22 = {40101}
T.RT_23 = {1400101}
T.RT_24 = {1400201}
T.RT_25 = {2300101}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("MidTermTask", {
  [1001] = {
    EnableDay = 1,
    JumpUIId = 21,
    Target = 3,
    TargetId = T.RT_1,
    TaskDes = "MidTermGoal_Des_0_1",
    TaskId = 1001,
    TaskType = 3
  },
  [1002] = {
    EnableDay = 1,
    JumpUIId = 20,
    Target = 5,
    TargetId = T.RT_2,
    TaskDes = "MidTermGoal_Des_0_2",
    TaskId = 1002,
    TaskType = 3
  },
  [2011] = {
    EnableDay = 1,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_3,
    TaskDes = "MidTermGoal_Des_1_1",
    TaskId = 2011,
    TaskType = 1
  },
  [2012] = {
    EnableDay = 1,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_4,
    TaskDes = "MidTermGoal_Des_1_2",
    TaskId = 2012,
    TaskType = 2
  },
  [2013] = {
    EnableDay = 1,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_1_3",
    TaskId = 2013,
    TaskType = 2
  },
  [2014] = {
    EnableDay = 1,
    JumpUIId = 31,
    Target = 3,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_1_4",
    TaskId = 2014,
    TaskType = 2
  },
  [2021] = {
    EnableDay = 2,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_7,
    TaskDes = "MidTermGoal_Des_2_1",
    TaskId = 2021,
    TaskType = 1
  },
  [2022] = {
    EnableDay = 2,
    JumpUIId = 19,
    Target = 300,
    TargetId = T.RT_8,
    TaskDes = "MidTermGoal_Des_2_2",
    TaskId = 2022,
    TaskType = 2
  },
  [2023] = {
    EnableDay = 2,
    JumpUIId = 47,
    Target = 1,
    TargetId = T.RT_9,
    TaskDes = "MidTermGoal_Des_2_3",
    TaskId = 2023,
    TaskType = 2
  },
  [2024] = {
    EnableDay = 2,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_2_4",
    TaskId = 2024,
    TaskType = 2
  },
  [2031] = {
    EnableDay = 3,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_10,
    TaskDes = "MidTermGoal_Des_3_1",
    TaskId = 2031,
    TaskType = 1
  },
  [2032] = {
    EnableDay = 3,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_11,
    TaskDes = "MidTermGoal_Des_3_2",
    TaskId = 2032,
    TaskType = 2
  },
  [2033] = {
    EnableDay = 3,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_12,
    TaskDes = "MidTermGoal_Des_3_3",
    TaskId = 2033,
    TaskType = 2
  },
  [2034] = {
    EnableDay = 3,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_13,
    TaskDes = "MidTermGoal_Des_3_4",
    TaskId = 2034,
    TaskType = 2
  },
  [2041] = {
    EnableDay = 4,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_1",
    TaskId = 2041,
    TaskType = 1
  },
  [2042] = {
    EnableDay = 4,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_2",
    TaskId = 2042,
    TaskType = 2
  },
  [2043] = {
    EnableDay = 4,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_15,
    TaskDes = "MidTermGoal_Des_4_3",
    TaskId = 2043,
    TaskType = 2
  },
  [2044] = {
    EnableDay = 4,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_4_4",
    TaskId = 2044,
    TaskType = 2
  },
  [2051] = {
    EnableDay = 5,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_1",
    TaskId = 2051,
    TaskType = 1
  },
  [2052] = {
    EnableDay = 5,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_2",
    TaskId = 2052,
    TaskType = 2
  },
  [2053] = {
    EnableDay = 5,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_5_3",
    TaskId = 2053,
    TaskType = 2
  },
  [2054] = {
    EnableDay = 5,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_5_4",
    TaskId = 2054,
    TaskType = 2
  },
  [2061] = {
    EnableDay = 6,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_1",
    TaskId = 2061,
    TaskType = 1
  },
  [2062] = {
    EnableDay = 6,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_2",
    TaskId = 2062,
    TaskType = 2
  },
  [2063] = {
    EnableDay = 6,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_18,
    TaskDes = "MidTermGoal_Des_6_3",
    TaskId = 2063,
    TaskType = 2
  },
  [2064] = {
    EnableDay = 6,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_6_4",
    TaskId = 2064,
    TaskType = 2
  },
  [2071] = {
    EnableDay = 7,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_1",
    TaskId = 2071,
    TaskType = 1
  },
  [2072] = {
    EnableDay = 7,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_2",
    TaskId = 2072,
    TaskType = 2
  },
  [2073] = {
    EnableDay = 7,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_20,
    TaskDes = "MidTermGoal_Des_7_3",
    TaskId = 2073,
    TaskType = 2
  },
  [2074] = {
    EnableDay = 7,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_7_4",
    TaskId = 2074,
    TaskType = 2
  },
  [2081] = {
    EnableDay = 8,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_3,
    TaskDes = "MidTermGoal_Des_1_1",
    TaskId = 2081,
    TaskType = 1
  },
  [2082] = {
    EnableDay = 8,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_4,
    TaskDes = "MidTermGoal_Des_1_2",
    TaskId = 2082,
    TaskType = 2
  },
  [2083] = {
    EnableDay = 8,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_1_3",
    TaskId = 2083,
    TaskType = 2
  },
  [2084] = {
    EnableDay = 8,
    JumpUIId = 31,
    Target = 3,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_1_4",
    TaskId = 2084,
    TaskType = 2
  },
  [2091] = {
    EnableDay = 9,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_7,
    TaskDes = "MidTermGoal_Des_2_1",
    TaskId = 2091,
    TaskType = 1
  },
  [2092] = {
    EnableDay = 9,
    JumpUIId = 19,
    Target = 300,
    TargetId = T.RT_8,
    TaskDes = "MidTermGoal_Des_2_2",
    TaskId = 2092,
    TaskType = 2
  },
  [2093] = {
    EnableDay = 9,
    JumpUIId = 47,
    Target = 1,
    TargetId = T.RT_9,
    TaskDes = "MidTermGoal_Des_2_3",
    TaskId = 2093,
    TaskType = 2
  },
  [2094] = {
    EnableDay = 9,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_2_4",
    TaskId = 2094,
    TaskType = 2
  },
  [2101] = {
    EnableDay = 10,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_10,
    TaskDes = "MidTermGoal_Des_3_1",
    TaskId = 2101,
    TaskType = 1
  },
  [2102] = {
    EnableDay = 10,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_11,
    TaskDes = "MidTermGoal_Des_3_2",
    TaskId = 2102,
    TaskType = 2
  },
  [2103] = {
    EnableDay = 10,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_12,
    TaskDes = "MidTermGoal_Des_3_3",
    TaskId = 2103,
    TaskType = 2
  },
  [2104] = {
    EnableDay = 10,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_13,
    TaskDes = "MidTermGoal_Des_3_4",
    TaskId = 2104,
    TaskType = 2
  },
  [2111] = {
    EnableDay = 11,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_1",
    TaskId = 2111,
    TaskType = 1
  },
  [2112] = {
    EnableDay = 11,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_2",
    TaskId = 2112,
    TaskType = 2
  },
  [2113] = {
    EnableDay = 11,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_15,
    TaskDes = "MidTermGoal_Des_4_3",
    TaskId = 2113,
    TaskType = 2
  },
  [2114] = {
    EnableDay = 11,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_4_4",
    TaskId = 2114,
    TaskType = 2
  },
  [2121] = {
    EnableDay = 12,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_1",
    TaskId = 2121,
    TaskType = 1
  },
  [2122] = {
    EnableDay = 12,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_2",
    TaskId = 2122,
    TaskType = 2
  },
  [2123] = {
    EnableDay = 12,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_5_3",
    TaskId = 2123,
    TaskType = 2
  },
  [2124] = {
    EnableDay = 12,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_5_4",
    TaskId = 2124,
    TaskType = 2
  },
  [2131] = {
    EnableDay = 13,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_1",
    TaskId = 2131,
    TaskType = 1
  },
  [2132] = {
    EnableDay = 13,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_2",
    TaskId = 2132,
    TaskType = 2
  },
  [2133] = {
    EnableDay = 13,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_18,
    TaskDes = "MidTermGoal_Des_6_3",
    TaskId = 2133,
    TaskType = 2
  },
  [2134] = {
    EnableDay = 13,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_6_4",
    TaskId = 2134,
    TaskType = 2
  },
  [2141] = {
    EnableDay = 14,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_1",
    TaskId = 2141,
    TaskType = 1
  },
  [2142] = {
    EnableDay = 14,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_2",
    TaskId = 2142,
    TaskType = 2
  },
  [2143] = {
    EnableDay = 14,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_20,
    TaskDes = "MidTermGoal_Des_7_3",
    TaskId = 2143,
    TaskType = 2
  },
  [2144] = {
    EnableDay = 14,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_7_4",
    TaskId = 2144,
    TaskType = 2
  },
  [2151] = {
    EnableDay = 15,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_3,
    TaskDes = "MidTermGoal_Des_1_1",
    TaskId = 2151,
    TaskType = 1
  },
  [2152] = {
    EnableDay = 15,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_4,
    TaskDes = "MidTermGoal_Des_1_2",
    TaskId = 2152,
    TaskType = 2
  },
  [2153] = {
    EnableDay = 15,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_1_3",
    TaskId = 2153,
    TaskType = 2
  },
  [2154] = {
    EnableDay = 15,
    JumpUIId = 31,
    Target = 3,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_1_4",
    TaskId = 2154,
    TaskType = 2
  },
  [2161] = {
    EnableDay = 16,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_7,
    TaskDes = "MidTermGoal_Des_2_1",
    TaskId = 2161,
    TaskType = 1
  },
  [2162] = {
    EnableDay = 16,
    JumpUIId = 19,
    Target = 300,
    TargetId = T.RT_8,
    TaskDes = "MidTermGoal_Des_2_2",
    TaskId = 2162,
    TaskType = 2
  },
  [2163] = {
    EnableDay = 16,
    JumpUIId = 47,
    Target = 1,
    TargetId = T.RT_9,
    TaskDes = "MidTermGoal_Des_2_3",
    TaskId = 2163,
    TaskType = 2
  },
  [2164] = {
    EnableDay = 16,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_2_4",
    TaskId = 2164,
    TaskType = 2
  },
  [2171] = {
    EnableDay = 17,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_10,
    TaskDes = "MidTermGoal_Des_3_1",
    TaskId = 2171,
    TaskType = 1
  },
  [2172] = {
    EnableDay = 17,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_11,
    TaskDes = "MidTermGoal_Des_3_2",
    TaskId = 2172,
    TaskType = 2
  },
  [2173] = {
    EnableDay = 17,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_12,
    TaskDes = "MidTermGoal_Des_3_3",
    TaskId = 2173,
    TaskType = 2
  },
  [2174] = {
    EnableDay = 17,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_13,
    TaskDes = "MidTermGoal_Des_3_4",
    TaskId = 2174,
    TaskType = 2
  },
  [2181] = {
    EnableDay = 18,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_1",
    TaskId = 2181,
    TaskType = 1
  },
  [2182] = {
    EnableDay = 18,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_2",
    TaskId = 2182,
    TaskType = 2
  },
  [2183] = {
    EnableDay = 18,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_15,
    TaskDes = "MidTermGoal_Des_4_3",
    TaskId = 2183,
    TaskType = 2
  },
  [2184] = {
    EnableDay = 18,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_4_4",
    TaskId = 2184,
    TaskType = 2
  },
  [2191] = {
    EnableDay = 19,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_1",
    TaskId = 2191,
    TaskType = 1
  },
  [2192] = {
    EnableDay = 19,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_2",
    TaskId = 2192,
    TaskType = 2
  },
  [2193] = {
    EnableDay = 19,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_5_3",
    TaskId = 2193,
    TaskType = 2
  },
  [2194] = {
    EnableDay = 19,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_5_4",
    TaskId = 2194,
    TaskType = 2
  },
  [2201] = {
    EnableDay = 20,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_1",
    TaskId = 2201,
    TaskType = 1
  },
  [2202] = {
    EnableDay = 20,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_2",
    TaskId = 2202,
    TaskType = 2
  },
  [2203] = {
    EnableDay = 20,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_18,
    TaskDes = "MidTermGoal_Des_6_3",
    TaskId = 2203,
    TaskType = 2
  },
  [2204] = {
    EnableDay = 20,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_6_4",
    TaskId = 2204,
    TaskType = 2
  },
  [2211] = {
    EnableDay = 21,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_1",
    TaskId = 2211,
    TaskType = 1
  },
  [2212] = {
    EnableDay = 21,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_2",
    TaskId = 2212,
    TaskType = 2
  },
  [2213] = {
    EnableDay = 21,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_20,
    TaskDes = "MidTermGoal_Des_7_3",
    TaskId = 2213,
    TaskType = 2
  },
  [2214] = {
    EnableDay = 21,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_7_4",
    TaskId = 2214,
    TaskType = 2
  },
  [2221] = {
    EnableDay = 22,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_3,
    TaskDes = "MidTermGoal_Des_1_1",
    TaskId = 2221,
    TaskType = 1
  },
  [2222] = {
    EnableDay = 22,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_4,
    TaskDes = "MidTermGoal_Des_1_2",
    TaskId = 2222,
    TaskType = 2
  },
  [2223] = {
    EnableDay = 22,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_1_3",
    TaskId = 2223,
    TaskType = 2
  },
  [2224] = {
    EnableDay = 22,
    JumpUIId = 31,
    Target = 3,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_1_4",
    TaskId = 2224,
    TaskType = 2
  },
  [2225] = {
    EnableDay = 23,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_7,
    TaskDes = "MidTermGoal_Des_2_1",
    TaskId = 2225,
    TaskType = 1
  },
  [2226] = {
    EnableDay = 23,
    JumpUIId = 19,
    Target = 300,
    TargetId = T.RT_8,
    TaskDes = "MidTermGoal_Des_2_2",
    TaskId = 2226,
    TaskType = 2
  },
  [2227] = {
    EnableDay = 23,
    JumpUIId = 47,
    Target = 1,
    TargetId = T.RT_9,
    TaskDes = "MidTermGoal_Des_2_3",
    TaskId = 2227,
    TaskType = 2
  },
  [2228] = {
    EnableDay = 23,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_2_4",
    TaskId = 2228,
    TaskType = 2
  },
  [2229] = {
    EnableDay = 24,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_10,
    TaskDes = "MidTermGoal_Des_3_1",
    TaskId = 2229,
    TaskType = 1
  },
  [2230] = {
    EnableDay = 24,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_11,
    TaskDes = "MidTermGoal_Des_3_2",
    TaskId = 2230,
    TaskType = 2
  },
  [2231] = {
    EnableDay = 24,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_12,
    TaskDes = "MidTermGoal_Des_3_3",
    TaskId = 2231,
    TaskType = 2
  },
  [2232] = {
    EnableDay = 24,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_13,
    TaskDes = "MidTermGoal_Des_3_4",
    TaskId = 2232,
    TaskType = 2
  },
  [2233] = {
    EnableDay = 25,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_1",
    TaskId = 2233,
    TaskType = 1
  },
  [2234] = {
    EnableDay = 25,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_2",
    TaskId = 2234,
    TaskType = 2
  },
  [2235] = {
    EnableDay = 25,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_15,
    TaskDes = "MidTermGoal_Des_4_3",
    TaskId = 2235,
    TaskType = 2
  },
  [2236] = {
    EnableDay = 25,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_4_4",
    TaskId = 2236,
    TaskType = 2
  },
  [2237] = {
    EnableDay = 26,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_1",
    TaskId = 2237,
    TaskType = 1
  },
  [2238] = {
    EnableDay = 26,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_2",
    TaskId = 2238,
    TaskType = 2
  },
  [2239] = {
    EnableDay = 26,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_5_3",
    TaskId = 2239,
    TaskType = 2
  },
  [2240] = {
    EnableDay = 26,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_5_4",
    TaskId = 2240,
    TaskType = 2
  },
  [2241] = {
    EnableDay = 27,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_1",
    TaskId = 2241,
    TaskType = 1
  },
  [2242] = {
    EnableDay = 27,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_2",
    TaskId = 2242,
    TaskType = 2
  },
  [2243] = {
    EnableDay = 27,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_18,
    TaskDes = "MidTermGoal_Des_6_3",
    TaskId = 2243,
    TaskType = 2
  },
  [2244] = {
    EnableDay = 27,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_6_4",
    TaskId = 2244,
    TaskType = 2
  },
  [2245] = {
    EnableDay = 28,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_1",
    TaskId = 2245,
    TaskType = 1
  },
  [2246] = {
    EnableDay = 28,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_2",
    TaskId = 2246,
    TaskType = 2
  },
  [2247] = {
    EnableDay = 28,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_20,
    TaskDes = "MidTermGoal_Des_7_3",
    TaskId = 2247,
    TaskType = 2
  },
  [2248] = {
    EnableDay = 28,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_7_4",
    TaskId = 2248,
    TaskType = 2
  },
  [2249] = {
    EnableDay = 29,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_3,
    TaskDes = "MidTermGoal_Des_1_1",
    TaskId = 2249,
    TaskType = 1
  },
  [2250] = {
    EnableDay = 29,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_4,
    TaskDes = "MidTermGoal_Des_1_2",
    TaskId = 2250,
    TaskType = 2
  },
  [2251] = {
    EnableDay = 29,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_1_3",
    TaskId = 2251,
    TaskType = 2
  },
  [2252] = {
    EnableDay = 29,
    JumpUIId = 31,
    Target = 3,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_1_4",
    TaskId = 2252,
    TaskType = 2
  },
  [2253] = {
    EnableDay = 30,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_7,
    TaskDes = "MidTermGoal_Des_2_1",
    TaskId = 2253,
    TaskType = 1
  },
  [2254] = {
    EnableDay = 30,
    JumpUIId = 19,
    Target = 300,
    TargetId = T.RT_8,
    TaskDes = "MidTermGoal_Des_2_2",
    TaskId = 2254,
    TaskType = 2
  },
  [2255] = {
    EnableDay = 30,
    JumpUIId = 47,
    Target = 1,
    TargetId = T.RT_9,
    TaskDes = "MidTermGoal_Des_2_3",
    TaskId = 2255,
    TaskType = 2
  },
  [2256] = {
    EnableDay = 30,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_2_4",
    TaskId = 2256,
    TaskType = 2
  },
  [2257] = {
    EnableDay = 31,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_10,
    TaskDes = "MidTermGoal_Des_3_1",
    TaskId = 2257,
    TaskType = 1
  },
  [2258] = {
    EnableDay = 31,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_11,
    TaskDes = "MidTermGoal_Des_3_2",
    TaskId = 2258,
    TaskType = 2
  },
  [2259] = {
    EnableDay = 31,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_12,
    TaskDes = "MidTermGoal_Des_3_3",
    TaskId = 2259,
    TaskType = 2
  },
  [2260] = {
    EnableDay = 31,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_13,
    TaskDes = "MidTermGoal_Des_3_4",
    TaskId = 2260,
    TaskType = 2
  },
  [2261] = {
    EnableDay = 32,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_1",
    TaskId = 2261,
    TaskType = 1
  },
  [2262] = {
    EnableDay = 32,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_2",
    TaskId = 2262,
    TaskType = 2
  },
  [2263] = {
    EnableDay = 32,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_15,
    TaskDes = "MidTermGoal_Des_4_3",
    TaskId = 2263,
    TaskType = 2
  },
  [2264] = {
    EnableDay = 32,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_4_4",
    TaskId = 2264,
    TaskType = 2
  },
  [2265] = {
    EnableDay = 33,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_1",
    TaskId = 2265,
    TaskType = 1
  },
  [2266] = {
    EnableDay = 33,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_2",
    TaskId = 2266,
    TaskType = 2
  },
  [2267] = {
    EnableDay = 33,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_5_3",
    TaskId = 2267,
    TaskType = 2
  },
  [2268] = {
    EnableDay = 33,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_5_4",
    TaskId = 2268,
    TaskType = 2
  },
  [2269] = {
    EnableDay = 34,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_1",
    TaskId = 2269,
    TaskType = 1
  },
  [2270] = {
    EnableDay = 34,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_2",
    TaskId = 2270,
    TaskType = 2
  },
  [2271] = {
    EnableDay = 34,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_18,
    TaskDes = "MidTermGoal_Des_6_3",
    TaskId = 2271,
    TaskType = 2
  },
  [2272] = {
    EnableDay = 34,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_6_4",
    TaskId = 2272,
    TaskType = 2
  },
  [2273] = {
    EnableDay = 35,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_1",
    TaskId = 2273,
    TaskType = 1
  },
  [2274] = {
    EnableDay = 35,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_2",
    TaskId = 2274,
    TaskType = 2
  },
  [2275] = {
    EnableDay = 35,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_20,
    TaskDes = "MidTermGoal_Des_7_3",
    TaskId = 2275,
    TaskType = 2
  },
  [2276] = {
    EnableDay = 35,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_7_4",
    TaskId = 2276,
    TaskType = 2
  },
  [2277] = {
    EnableDay = 36,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_3,
    TaskDes = "MidTermGoal_Des_1_1",
    TaskId = 2277,
    TaskType = 1
  },
  [2278] = {
    EnableDay = 36,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_4,
    TaskDes = "MidTermGoal_Des_1_2",
    TaskId = 2278,
    TaskType = 2
  },
  [2279] = {
    EnableDay = 36,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_1_3",
    TaskId = 2279,
    TaskType = 2
  },
  [2280] = {
    EnableDay = 36,
    JumpUIId = 31,
    Target = 3,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_1_4",
    TaskId = 2280,
    TaskType = 2
  },
  [2281] = {
    EnableDay = 37,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_7,
    TaskDes = "MidTermGoal_Des_2_1",
    TaskId = 2281,
    TaskType = 1
  },
  [2282] = {
    EnableDay = 37,
    JumpUIId = 19,
    Target = 300,
    TargetId = T.RT_8,
    TaskDes = "MidTermGoal_Des_2_2",
    TaskId = 2282,
    TaskType = 2
  },
  [2283] = {
    EnableDay = 37,
    JumpUIId = 47,
    Target = 1,
    TargetId = T.RT_9,
    TaskDes = "MidTermGoal_Des_2_3",
    TaskId = 2283,
    TaskType = 2
  },
  [2284] = {
    EnableDay = 37,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_2_4",
    TaskId = 2284,
    TaskType = 2
  },
  [2285] = {
    EnableDay = 38,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_10,
    TaskDes = "MidTermGoal_Des_3_1",
    TaskId = 2285,
    TaskType = 1
  },
  [2286] = {
    EnableDay = 38,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_11,
    TaskDes = "MidTermGoal_Des_3_2",
    TaskId = 2286,
    TaskType = 2
  },
  [2287] = {
    EnableDay = 38,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_12,
    TaskDes = "MidTermGoal_Des_3_3",
    TaskId = 2287,
    TaskType = 2
  },
  [2288] = {
    EnableDay = 38,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_13,
    TaskDes = "MidTermGoal_Des_3_4",
    TaskId = 2288,
    TaskType = 2
  },
  [2289] = {
    EnableDay = 39,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_1",
    TaskId = 2289,
    TaskType = 1
  },
  [2290] = {
    EnableDay = 39,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_2",
    TaskId = 2290,
    TaskType = 2
  },
  [2291] = {
    EnableDay = 39,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_15,
    TaskDes = "MidTermGoal_Des_4_3",
    TaskId = 2291,
    TaskType = 2
  },
  [2292] = {
    EnableDay = 39,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_4_4",
    TaskId = 2292,
    TaskType = 2
  },
  [2293] = {
    EnableDay = 40,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_1",
    TaskId = 2293,
    TaskType = 1
  },
  [2294] = {
    EnableDay = 40,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_2",
    TaskId = 2294,
    TaskType = 2
  },
  [2295] = {
    EnableDay = 40,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_5_3",
    TaskId = 2295,
    TaskType = 2
  },
  [2296] = {
    EnableDay = 40,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_5_4",
    TaskId = 2296,
    TaskType = 2
  },
  [2297] = {
    EnableDay = 41,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_1",
    TaskId = 2297,
    TaskType = 1
  },
  [2298] = {
    EnableDay = 41,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_2",
    TaskId = 2298,
    TaskType = 2
  },
  [2299] = {
    EnableDay = 41,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_18,
    TaskDes = "MidTermGoal_Des_6_3",
    TaskId = 2299,
    TaskType = 2
  },
  [2300] = {
    EnableDay = 41,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_6_4",
    TaskId = 2300,
    TaskType = 2
  },
  [2301] = {
    EnableDay = 42,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_1",
    TaskId = 2301,
    TaskType = 1
  },
  [2302] = {
    EnableDay = 42,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_2",
    TaskId = 2302,
    TaskType = 2
  },
  [2303] = {
    EnableDay = 42,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_20,
    TaskDes = "MidTermGoal_Des_7_3",
    TaskId = 2303,
    TaskType = 2
  },
  [2304] = {
    EnableDay = 42,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_7_4",
    TaskId = 2304,
    TaskType = 2
  },
  [2305] = {
    EnableDay = 43,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_3,
    TaskDes = "MidTermGoal_Des_1_1",
    TaskId = 2305,
    TaskType = 1
  },
  [2306] = {
    EnableDay = 43,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_4,
    TaskDes = "MidTermGoal_Des_1_2",
    TaskId = 2306,
    TaskType = 2
  },
  [2307] = {
    EnableDay = 43,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_1_3",
    TaskId = 2307,
    TaskType = 2
  },
  [2308] = {
    EnableDay = 43,
    JumpUIId = 31,
    Target = 3,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_1_4",
    TaskId = 2308,
    TaskType = 2
  },
  [2309] = {
    EnableDay = 44,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_7,
    TaskDes = "MidTermGoal_Des_2_1",
    TaskId = 2309,
    TaskType = 1
  },
  [2310] = {
    EnableDay = 44,
    JumpUIId = 19,
    Target = 300,
    TargetId = T.RT_8,
    TaskDes = "MidTermGoal_Des_2_2",
    TaskId = 2310,
    TaskType = 2
  },
  [2311] = {
    EnableDay = 44,
    JumpUIId = 47,
    Target = 1,
    TargetId = T.RT_9,
    TaskDes = "MidTermGoal_Des_2_3",
    TaskId = 2311,
    TaskType = 2
  },
  [2312] = {
    EnableDay = 44,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_2_4",
    TaskId = 2312,
    TaskType = 2
  },
  [2313] = {
    EnableDay = 45,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_10,
    TaskDes = "MidTermGoal_Des_3_1",
    TaskId = 2313,
    TaskType = 1
  },
  [2314] = {
    EnableDay = 45,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_11,
    TaskDes = "MidTermGoal_Des_3_2",
    TaskId = 2314,
    TaskType = 2
  },
  [2315] = {
    EnableDay = 45,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_12,
    TaskDes = "MidTermGoal_Des_3_3",
    TaskId = 2315,
    TaskType = 2
  },
  [2316] = {
    EnableDay = 45,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_13,
    TaskDes = "MidTermGoal_Des_3_4",
    TaskId = 2316,
    TaskType = 2
  },
  [2317] = {
    EnableDay = 46,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_1",
    TaskId = 2317,
    TaskType = 1
  },
  [2318] = {
    EnableDay = 46,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_2",
    TaskId = 2318,
    TaskType = 2
  },
  [2319] = {
    EnableDay = 46,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_15,
    TaskDes = "MidTermGoal_Des_4_3",
    TaskId = 2319,
    TaskType = 2
  },
  [2320] = {
    EnableDay = 46,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_4_4",
    TaskId = 2320,
    TaskType = 2
  },
  [2321] = {
    EnableDay = 47,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_1",
    TaskId = 2321,
    TaskType = 1
  },
  [2322] = {
    EnableDay = 47,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_2",
    TaskId = 2322,
    TaskType = 2
  },
  [2323] = {
    EnableDay = 47,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_5_3",
    TaskId = 2323,
    TaskType = 2
  },
  [2324] = {
    EnableDay = 47,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_5_4",
    TaskId = 2324,
    TaskType = 2
  },
  [2325] = {
    EnableDay = 48,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_1",
    TaskId = 2325,
    TaskType = 1
  },
  [2326] = {
    EnableDay = 48,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_2",
    TaskId = 2326,
    TaskType = 2
  },
  [2327] = {
    EnableDay = 48,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_18,
    TaskDes = "MidTermGoal_Des_6_3",
    TaskId = 2327,
    TaskType = 2
  },
  [2328] = {
    EnableDay = 48,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_6_4",
    TaskId = 2328,
    TaskType = 2
  },
  [2329] = {
    EnableDay = 49,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_1",
    TaskId = 2329,
    TaskType = 1
  },
  [2330] = {
    EnableDay = 49,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_2",
    TaskId = 2330,
    TaskType = 2
  },
  [2331] = {
    EnableDay = 49,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_20,
    TaskDes = "MidTermGoal_Des_7_3",
    TaskId = 2331,
    TaskType = 2
  },
  [2332] = {
    EnableDay = 49,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_7_4",
    TaskId = 2332,
    TaskType = 2
  },
  [2333] = {
    EnableDay = 50,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_3,
    TaskDes = "MidTermGoal_Des_1_1",
    TaskId = 2333,
    TaskType = 1
  },
  [2334] = {
    EnableDay = 50,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_4,
    TaskDes = "MidTermGoal_Des_1_2",
    TaskId = 2334,
    TaskType = 2
  },
  [2335] = {
    EnableDay = 50,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_1_3",
    TaskId = 2335,
    TaskType = 2
  },
  [2336] = {
    EnableDay = 50,
    JumpUIId = 31,
    Target = 3,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_1_4",
    TaskId = 2336,
    TaskType = 2
  },
  [2337] = {
    EnableDay = 51,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_7,
    TaskDes = "MidTermGoal_Des_2_1",
    TaskId = 2337,
    TaskType = 1
  },
  [2338] = {
    EnableDay = 51,
    JumpUIId = 19,
    Target = 300,
    TargetId = T.RT_8,
    TaskDes = "MidTermGoal_Des_2_2",
    TaskId = 2338,
    TaskType = 2
  },
  [2339] = {
    EnableDay = 51,
    JumpUIId = 47,
    Target = 1,
    TargetId = T.RT_9,
    TaskDes = "MidTermGoal_Des_2_3",
    TaskId = 2339,
    TaskType = 2
  },
  [2340] = {
    EnableDay = 51,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_2_4",
    TaskId = 2340,
    TaskType = 2
  },
  [2341] = {
    EnableDay = 52,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_10,
    TaskDes = "MidTermGoal_Des_3_1",
    TaskId = 2341,
    TaskType = 1
  },
  [2342] = {
    EnableDay = 52,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_11,
    TaskDes = "MidTermGoal_Des_3_2",
    TaskId = 2342,
    TaskType = 2
  },
  [2343] = {
    EnableDay = 52,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_12,
    TaskDes = "MidTermGoal_Des_3_3",
    TaskId = 2343,
    TaskType = 2
  },
  [2344] = {
    EnableDay = 52,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_13,
    TaskDes = "MidTermGoal_Des_3_4",
    TaskId = 2344,
    TaskType = 2
  },
  [2345] = {
    EnableDay = 53,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_1",
    TaskId = 2345,
    TaskType = 1
  },
  [2346] = {
    EnableDay = 53,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_2",
    TaskId = 2346,
    TaskType = 2
  },
  [2347] = {
    EnableDay = 53,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_15,
    TaskDes = "MidTermGoal_Des_4_3",
    TaskId = 2347,
    TaskType = 2
  },
  [2348] = {
    EnableDay = 53,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_4_4",
    TaskId = 2348,
    TaskType = 2
  },
  [2349] = {
    EnableDay = 54,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_1",
    TaskId = 2349,
    TaskType = 1
  },
  [2350] = {
    EnableDay = 54,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_2",
    TaskId = 2350,
    TaskType = 2
  },
  [2351] = {
    EnableDay = 54,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_5_3",
    TaskId = 2351,
    TaskType = 2
  },
  [2352] = {
    EnableDay = 54,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_5_4",
    TaskId = 2352,
    TaskType = 2
  },
  [2353] = {
    EnableDay = 55,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_1",
    TaskId = 2353,
    TaskType = 1
  },
  [2354] = {
    EnableDay = 55,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_2",
    TaskId = 2354,
    TaskType = 2
  },
  [2355] = {
    EnableDay = 55,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_18,
    TaskDes = "MidTermGoal_Des_6_3",
    TaskId = 2355,
    TaskType = 2
  },
  [2356] = {
    EnableDay = 55,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_6_4",
    TaskId = 2356,
    TaskType = 2
  },
  [2357] = {
    EnableDay = 56,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_1",
    TaskId = 2357,
    TaskType = 1
  },
  [2358] = {
    EnableDay = 56,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_2",
    TaskId = 2358,
    TaskType = 2
  },
  [2359] = {
    EnableDay = 56,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_20,
    TaskDes = "MidTermGoal_Des_7_3",
    TaskId = 2359,
    TaskType = 2
  },
  [2360] = {
    EnableDay = 56,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_7_4",
    TaskId = 2360,
    TaskType = 2
  },
  [2361] = {
    EnableDay = 57,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_3,
    TaskDes = "MidTermGoal_Des_1_1",
    TaskId = 2361,
    TaskType = 1
  },
  [2362] = {
    EnableDay = 57,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_4,
    TaskDes = "MidTermGoal_Des_1_2",
    TaskId = 2362,
    TaskType = 2
  },
  [2363] = {
    EnableDay = 57,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_1_3",
    TaskId = 2363,
    TaskType = 2
  },
  [2364] = {
    EnableDay = 57,
    JumpUIId = 31,
    Target = 3,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_1_4",
    TaskId = 2364,
    TaskType = 2
  },
  [2365] = {
    EnableDay = 58,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_7,
    TaskDes = "MidTermGoal_Des_2_1",
    TaskId = 2365,
    TaskType = 1
  },
  [2366] = {
    EnableDay = 58,
    JumpUIId = 19,
    Target = 300,
    TargetId = T.RT_8,
    TaskDes = "MidTermGoal_Des_2_2",
    TaskId = 2366,
    TaskType = 2
  },
  [2367] = {
    EnableDay = 58,
    JumpUIId = 47,
    Target = 1,
    TargetId = T.RT_9,
    TaskDes = "MidTermGoal_Des_2_3",
    TaskId = 2367,
    TaskType = 2
  },
  [2368] = {
    EnableDay = 58,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_2_4",
    TaskId = 2368,
    TaskType = 2
  },
  [2369] = {
    EnableDay = 59,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_10,
    TaskDes = "MidTermGoal_Des_3_1",
    TaskId = 2369,
    TaskType = 1
  },
  [2370] = {
    EnableDay = 59,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_11,
    TaskDes = "MidTermGoal_Des_3_2",
    TaskId = 2370,
    TaskType = 2
  },
  [2371] = {
    EnableDay = 59,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_12,
    TaskDes = "MidTermGoal_Des_3_3",
    TaskId = 2371,
    TaskType = 2
  },
  [2372] = {
    EnableDay = 59,
    JumpUIId = 20,
    Target = 1,
    TargetId = T.RT_13,
    TaskDes = "MidTermGoal_Des_3_4",
    TaskId = 2372,
    TaskType = 2
  },
  [2373] = {
    EnableDay = 60,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_1",
    TaskId = 2373,
    TaskType = 1
  },
  [2374] = {
    EnableDay = 60,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_14,
    TaskDes = "MidTermGoal_Des_4_2",
    TaskId = 2374,
    TaskType = 2
  },
  [2375] = {
    EnableDay = 60,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_15,
    TaskDes = "MidTermGoal_Des_4_3",
    TaskId = 2375,
    TaskType = 2
  },
  [2376] = {
    EnableDay = 60,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_4_4",
    TaskId = 2376,
    TaskType = 2
  },
  [2377] = {
    EnableDay = 61,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_1",
    TaskId = 2377,
    TaskType = 1
  },
  [2378] = {
    EnableDay = 61,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_16,
    TaskDes = "MidTermGoal_Des_5_2",
    TaskId = 2378,
    TaskType = 2
  },
  [2379] = {
    EnableDay = 61,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_6,
    TaskDes = "MidTermGoal_Des_5_3",
    TaskId = 2379,
    TaskType = 2
  },
  [2380] = {
    EnableDay = 61,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_5_4",
    TaskId = 2380,
    TaskType = 2
  },
  [2381] = {
    EnableDay = 62,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_1",
    TaskId = 2381,
    TaskType = 1
  },
  [2382] = {
    EnableDay = 62,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_17,
    TaskDes = "MidTermGoal_Des_6_2",
    TaskId = 2382,
    TaskType = 2
  },
  [2383] = {
    EnableDay = 62,
    JumpUIId = 19,
    Target = 4,
    TargetId = T.RT_18,
    TaskDes = "MidTermGoal_Des_6_3",
    TaskId = 2383,
    TaskType = 2
  },
  [2384] = {
    EnableDay = 62,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_6_4",
    TaskId = 2384,
    TaskType = 2
  },
  [2385] = {
    EnableDay = 63,
    JumpUIId = 19,
    Target = 5,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_1",
    TaskId = 2385,
    TaskType = 1
  },
  [2386] = {
    EnableDay = 63,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_19,
    TaskDes = "MidTermGoal_Des_7_2",
    TaskId = 2386,
    TaskType = 2
  },
  [2387] = {
    EnableDay = 63,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_20,
    TaskDes = "MidTermGoal_Des_7_3",
    TaskId = 2387,
    TaskType = 2
  },
  [2388] = {
    EnableDay = 63,
    JumpUIId = 19,
    Target = 1,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_7_4",
    TaskId = 2388,
    TaskType = 2
  },
  [3101] = {
    EnableDay = 1,
    JumpUIId = 19,
    Target = 20,
    TargetId = T.RT_4,
    TaskDes = "MidTermGoal_Des_A1_1",
    TaskId = 3101,
    TaskType = 4
  },
  [3102] = {
    EnableDay = 1,
    JumpUIId = 19,
    Target = 50,
    TargetId = T.RT_4,
    TaskDes = "MidTermGoal_Des_A1_2",
    TaskId = 3102,
    TaskType = 4
  },
  [3103] = {
    EnableDay = 1,
    JumpUIId = 19,
    Target = 10,
    TargetId = T.RT_3,
    TaskDes = "MidTermGoal_Des_A1_3",
    TaskId = 3103,
    TaskType = 4
  },
  [3104] = {
    EnableDay = 1,
    JumpUIId = 19,
    Target = 15,
    TargetId = T.RT_3,
    TaskDes = "MidTermGoal_Des_A1_4",
    TaskId = 3104,
    TaskType = 4
  },
  [3105] = {
    EnableDay = 1,
    JumpUIId = 19,
    Target = 10,
    TargetId = T.RT_5,
    TaskDes = "MidTermGoal_Des_A1_19",
    TaskId = 3105,
    TaskType = 4
  },
  [3106] = {
    EnableDay = 1,
    Target = 100000,
    TargetId = {10201},
    TaskDes = "MidTermGoal_Des_A1_5",
    TaskId = 3106,
    TaskType = 4
  },
  [3107] = {
    EnableDay = 1,
    Target = 5000,
    TargetId = {10202},
    TaskDes = "MidTermGoal_Des_A1_6",
    TaskId = 3107,
    TaskType = 4
  },
  [3108] = {
    EnableDay = 1,
    JumpUIId = 4,
    Target = 5,
    TargetId = T.RT_21,
    TaskDes = "MidTermGoal_Des_A1_11",
    TaskId = 3108,
    TaskType = 4
  },
  [3109] = {
    EnableDay = 1,
    JumpUIId = 4,
    Target = 10,
    TargetId = T.RT_21,
    TaskDes = "MidTermGoal_Des_A1_12",
    TaskId = 3109,
    TaskType = 4
  },
  [3110] = {
    EnableDay = 1,
    JumpUIId = 4,
    Target = 5,
    TargetId = {60102},
    TaskDes = "MidTermGoal_Des_A1_16",
    TaskId = 3110,
    TaskType = 4
  },
  [3111] = {
    EnableDay = 1,
    JumpUIId = 4,
    Target = 5,
    TargetId = {60203},
    TaskDes = "MidTermGoal_Des_A1_17",
    TaskId = 3111,
    TaskType = 4
  },
  [3112] = {
    EnableDay = 1,
    Target = 5,
    TargetId = T.RT_22,
    TaskDes = "MidTermGoal_Des_A1_9",
    TaskId = 3112,
    TaskType = 4
  },
  [3113] = {
    EnableDay = 1,
    Target = 10,
    TargetId = T.RT_22,
    TaskDes = "MidTermGoal_Des_A1_10",
    TaskId = 3113,
    TaskType = 4
  },
  [3114] = {
    EnableDay = 1,
    JumpUIId = 49,
    Target = 5,
    TargetId = {40202},
    TaskDes = "MidTermGoal_Des_A1_14",
    TaskId = 3114,
    TaskType = 4
  },
  [3115] = {
    EnableDay = 1,
    JumpUIId = 49,
    Target = 5,
    TargetId = {40303},
    TaskDes = "MidTermGoal_Des_A1_15",
    TaskId = 3115,
    TaskType = 4
  },
  [3116] = {
    EnableDay = 1,
    JumpUIId = 20,
    Target = 30,
    TargetId = T.RT_2,
    TaskDes = "MidTermGoal_Des_A1_7",
    TaskId = 3116,
    TaskType = 4
  },
  [3117] = {
    EnableDay = 1,
    JumpUIId = 20,
    Target = 50,
    TargetId = T.RT_2,
    TaskDes = "MidTermGoal_Des_A1_8",
    TaskId = 3117,
    TaskType = 4
  },
  [3118] = {
    EnableDay = 1,
    JumpUIId = 20,
    Target = 50,
    TargetId = T.RT_13,
    TaskDes = "MidTermGoal_Des_A1_20",
    TaskId = 3118,
    TaskType = 4
  },
  [3119] = {
    EnableDay = 1,
    Target = 5,
    TargetId = T.RT_23,
    TaskDes = "MidTermGoal_Des_A1_13",
    TaskId = 3119,
    TaskType = 4
  },
  [3120] = {
    EnableDay = 1,
    JumpUIId = 50,
    Target = 3,
    TargetId = T.RT_24,
    TaskDes = "MidTermGoal_Des_A1_18",
    TaskId = 3120,
    TaskType = 4
  },
  [3201] = {
    EnableDay = 5,
    JumpUIId = 22,
    Target = 3,
    TargetId = T.RT_25,
    TaskDes = "MidTermGoal_Des_A2_1",
    TaskId = 3201,
    TaskType = 4
  },
  [3202] = {
    EnableDay = 5,
    JumpUIId = 22,
    Target = 5,
    TargetId = T.RT_25,
    TaskDes = "MidTermGoal_Des_A2_2",
    TaskId = 3202,
    TaskType = 4
  },
  [3203] = {
    EnableDay = 5,
    JumpUIId = 21,
    Target = 10,
    TargetId = T.RT_1,
    TaskDes = "MidTermGoal_Des_A2_3",
    TaskId = 3203,
    TaskType = 4
  },
  [3204] = {
    EnableDay = 5,
    JumpUIId = 21,
    Target = 30,
    TargetId = T.RT_1,
    TaskDes = "MidTermGoal_Des_A2_4",
    TaskId = 3204,
    TaskType = 4
  },
  [3205] = {
    EnableDay = 5,
    JumpUIId = 4,
    Target = 1,
    TargetId = {60106},
    TaskDes = "MidTermGoal_Des_A2_9",
    TaskId = 3205,
    TaskType = 4
  },
  [3206] = {
    EnableDay = 5,
    JumpUIId = 4,
    Target = 1,
    TargetId = {60206},
    TaskDes = "MidTermGoal_Des_A2_10",
    TaskId = 3206,
    TaskType = 4
  },
  [3207] = {
    EnableDay = 5,
    JumpUIId = 49,
    Target = 1,
    TargetId = {40206},
    TaskDes = "MidTermGoal_Des_A2_7",
    TaskId = 3207,
    TaskType = 4
  },
  [3208] = {
    EnableDay = 5,
    JumpUIId = 49,
    Target = 1,
    TargetId = {40306},
    TaskDes = "MidTermGoal_Des_A2_8",
    TaskId = 3208,
    TaskType = 4
  },
  [3209] = {
    EnableDay = 5,
    Target = 10,
    TargetId = T.RT_23,
    TaskDes = "MidTermGoal_Des_A2_5",
    TaskId = 3209,
    TaskType = 4
  },
  [3210] = {
    EnableDay = 5,
    JumpUIId = 50,
    Target = 5,
    TargetId = T.RT_24,
    TaskDes = "MidTermGoal_Des_A2_6",
    TaskId = 3210,
    TaskType = 4
  },
  [3211] = {
    EnableDay = 5,
    JumpUIId = 19,
    Target = 5,
    TargetId = {50920},
    TaskDes = "MidTermGoal_Des_A2_11",
    TaskId = 3211,
    TaskType = 4
  },
  [3212] = {
    EnableDay = 5,
    JumpUIId = 19,
    Target = 5,
    TargetId = {50921},
    TaskDes = "MidTermGoal_Des_A2_12",
    TaskId = 3212,
    TaskType = 4
  },
  [3213] = {
    EnableDay = 5,
    JumpUIId = 19,
    Target = 5,
    TargetId = {50922},
    TaskDes = "MidTermGoal_Des_A2_13",
    TaskId = 3213,
    TaskType = 4
  },
  [3214] = {
    EnableDay = 5,
    JumpUIId = 19,
    Target = 5,
    TargetId = {50923},
    TaskDes = "MidTermGoal_Des_A2_14",
    TaskId = 3214,
    TaskType = 4
  },
  [3215] = {
    EnableDay = 5,
    JumpUIId = 19,
    Target = 5,
    TargetId = {50924},
    TaskDes = "MidTermGoal_Des_A2_15",
    TaskId = 3215,
    TaskType = 4
  },
  [3216] = {
    EnableDay = 5,
    JumpUIId = 19,
    Target = 5,
    TargetId = {50925},
    TaskDes = "MidTermGoal_Des_A2_16",
    TaskId = 3216,
    TaskType = 4
  },
  [3217] = {
    EnableDay = 5,
    JumpUIId = 19,
    Target = 5,
    TargetId = {50926},
    TaskDes = "MidTermGoal_Des_A2_17",
    TaskId = 3217,
    TaskType = 4
  },
  [3218] = {
    EnableDay = 5,
    JumpUIId = 19,
    Target = 5,
    TargetId = {50927},
    TaskDes = "MidTermGoal_Des_A2_18",
    TaskId = 3218,
    TaskType = 4
  },
  [3219] = {
    EnableDay = 5,
    JumpUIId = 19,
    Target = 5,
    TargetId = {50928},
    TaskDes = "MidTermGoal_Des_A2_19",
    TaskId = 3219,
    TaskType = 4
  },
  [3220] = {
    EnableDay = 5,
    JumpUIId = 19,
    Target = 5,
    TargetId = {50929},
    TaskDes = "MidTermGoal_Des_A2_20",
    TaskId = 3220,
    TaskType = 4
  }
})
