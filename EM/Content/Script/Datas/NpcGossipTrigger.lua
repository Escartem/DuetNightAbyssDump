local T = {}
T.RT_1 = {
  "ShowNpc_Scene1",
  "ShowNpc_Scene2",
  "ShowNpc_Scene3"
}
T.RT_2 = {
  "ShowNpc_Scene1",
  "ShowNpc_Scene2"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("NpcGossipTrigger", {
  [910101] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {81101},
    NpcGossipId = 910101,
    RelatedTalks = 910101,
    TriggerArea = 500
  },
  [910102] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {82101},
    NpcGossipId = 910102,
    RelatedTalks = 910102,
    TriggerArea = 500
  },
  [910103] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {82301},
    NpcGossipId = 910103,
    RelatedTalks = 910103,
    TriggerArea = 500
  },
  [910104] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {83201},
    NpcGossipId = 910104,
    RelatedTalks = 910104,
    TriggerArea = 500
  },
  [910105] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {84201},
    NpcGossipId = 910105,
    RelatedTalks = 910105,
    TriggerArea = 500
  },
  [910106] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {84202},
    NpcGossipId = 910106,
    RelatedTalks = 910106,
    TriggerArea = 500
  },
  [910107] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {84301},
    NpcGossipId = 910107,
    RelatedTalks = 910107,
    TriggerArea = 500
  },
  [910108] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {85301},
    NpcGossipId = 910108,
    RelatedTalks = 910108,
    TriggerArea = 500
  },
  [910109] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {82401},
    NpcGossipId = 910109,
    RelatedTalks = 910109,
    TriggerArea = 500
  },
  [910110] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {85101},
    NpcGossipId = 910110,
    RelatedTalks = 910110,
    TriggerArea = 500
  },
  [910111] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {83101},
    NpcGossipId = 910111,
    RelatedTalks = 910111,
    TriggerArea = 500
  },
  [910112] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {83102},
    NpcGossipId = 910112,
    RelatedTalks = 910112,
    TriggerArea = 500
  },
  [910113] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {81801},
    NpcGossipId = 910113,
    RelatedTalks = 910113,
    TriggerArea = 500
  },
  [910114] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {85102},
    NpcGossipId = 910114,
    RelatedTalks = 910114,
    TriggerArea = 500
  },
  [910115] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {83301},
    NpcGossipId = 910115,
    RelatedTalks = 910115,
    TriggerArea = 500
  },
  [910116] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {83103},
    NpcGossipId = 910116,
    RelatedTalks = 910116,
    TriggerArea = 500
  },
  [910117] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {85401},
    NpcGossipId = 910117,
    RelatedTalks = 910117,
    TriggerArea = 500
  },
  [910118] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {81103},
    NpcGossipId = 910118,
    RelatedTalks = 910118,
    TriggerArea = 500
  },
  [910119] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {84101},
    NpcGossipId = 910119,
    RelatedTalks = 910119,
    TriggerArea = 500
  },
  [910120] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {81502},
    NpcGossipId = 910120,
    RelatedTalks = 910120,
    TriggerArea = 500
  },
  [910121] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {84102},
    NpcGossipId = 910121,
    RelatedTalks = 910121,
    TriggerArea = 500
  },
  [910122] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {81503},
    NpcGossipId = 910122,
    RelatedTalks = 910122,
    TriggerArea = 500
  },
  [910123] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_1,
    NpcCombination = {81501},
    NpcGossipId = 910123,
    RelatedTalks = 910123,
    TriggerArea = 500
  },
  [920101] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81101, 85401},
    NpcGossipId = 920101,
    RelatedTalks = 920101,
    TriggerArea = 500
  },
  [920102] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81101, 85101},
    NpcGossipId = 920102,
    RelatedTalks = 920102,
    TriggerArea = 500
  },
  [920103] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81101, 84301},
    NpcGossipId = 920103,
    RelatedTalks = 920103,
    TriggerArea = 500
  },
  [920104] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81101, 85102},
    NpcGossipId = 920104,
    RelatedTalks = 920104,
    TriggerArea = 500
  },
  [920105] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {82101, 83201},
    NpcGossipId = 920105,
    RelatedTalks = 920105,
    TriggerArea = 500
  },
  [920106] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {82101, 82301},
    NpcGossipId = 920106,
    RelatedTalks = 920106,
    TriggerArea = 500
  },
  [920107] = {NpcGossipId = 920107},
  [920108] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {82301, 83201},
    NpcGossipId = 920108,
    RelatedTalks = 920108,
    TriggerArea = 500
  },
  [920109] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {82301, 82101},
    NpcGossipId = 920109,
    RelatedTalks = 920109,
    TriggerArea = 500
  },
  [920110] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {82301, 81501},
    NpcGossipId = 920110,
    RelatedTalks = 920110,
    TriggerArea = 500
  },
  [920111] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83201, 84301},
    NpcGossipId = 920111,
    RelatedTalks = 920111,
    TriggerArea = 500
  },
  [920112] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83201, 82101},
    NpcGossipId = 920112,
    RelatedTalks = 920112,
    TriggerArea = 500
  },
  [920113] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83201, 84202},
    NpcGossipId = 920113,
    RelatedTalks = 920113,
    TriggerArea = 500
  },
  [920114] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {84201, 85102},
    NpcGossipId = 920114,
    RelatedTalks = 920114,
    TriggerArea = 500
  },
  [920115] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {84201, 81503},
    NpcGossipId = 920115,
    RelatedTalks = 920115,
    TriggerArea = 500
  },
  [920116] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {84201, 83201},
    NpcGossipId = 920116,
    RelatedTalks = 920116,
    TriggerArea = 500
  },
  [920117] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {84202, 84301},
    NpcGossipId = 920117,
    RelatedTalks = 920117,
    TriggerArea = 500
  },
  [920118] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {84202, 83101},
    NpcGossipId = 920118,
    RelatedTalks = 920118,
    TriggerArea = 500
  },
  [920119] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {84202, 81101},
    NpcGossipId = 920119,
    RelatedTalks = 920119,
    TriggerArea = 500
  },
  [920120] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {84301, 85401},
    NpcGossipId = 920120,
    RelatedTalks = 920120,
    TriggerArea = 500
  },
  [920121] = {NpcGossipId = 920121},
  [920122] = {NpcGossipId = 920122},
  [920123] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {84301, 85102},
    NpcGossipId = 920123,
    RelatedTalks = 920123,
    TriggerArea = 500
  },
  [920124] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {84301, 84202},
    NpcGossipId = 920124,
    RelatedTalks = 920124,
    TriggerArea = 500
  },
  [920125] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {85301, 85102},
    NpcGossipId = 920125,
    RelatedTalks = 920125,
    TriggerArea = 500
  },
  [920126] = {NpcGossipId = 920126},
  [920127] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {85301, 85101},
    NpcGossipId = 920127,
    RelatedTalks = 920127,
    TriggerArea = 500
  },
  [920128] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {82401, 84202},
    NpcGossipId = 920128,
    RelatedTalks = 920128,
    TriggerArea = 500
  },
  [920129] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {82401, 84102},
    NpcGossipId = 920129,
    RelatedTalks = 920129,
    TriggerArea = 500
  },
  [920130] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {82401, 83103},
    NpcGossipId = 920130,
    RelatedTalks = 920130,
    TriggerArea = 500
  },
  [920131] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {85101, 83301},
    NpcGossipId = 920131,
    RelatedTalks = 920131,
    TriggerArea = 500
  },
  [920132] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {85101, 83101},
    NpcGossipId = 920132,
    RelatedTalks = 920132,
    TriggerArea = 500
  },
  [920133] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {85101, 81501},
    NpcGossipId = 920133,
    RelatedTalks = 920133,
    TriggerArea = 500
  },
  [920134] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83101, 84202},
    NpcGossipId = 920134,
    RelatedTalks = 920134,
    TriggerArea = 500
  },
  [920135] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83101, 84301},
    NpcGossipId = 920135,
    RelatedTalks = 920135,
    TriggerArea = 500
  },
  [920136] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83101, 84101},
    NpcGossipId = 920136,
    RelatedTalks = 920136,
    TriggerArea = 500
  },
  [920137] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83102, 85301},
    NpcGossipId = 920137,
    RelatedTalks = 920137,
    TriggerArea = 500
  },
  [920138] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83102, 81501},
    NpcGossipId = 920138,
    RelatedTalks = 920138,
    TriggerArea = 500
  },
  [920139] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83102, 83301},
    NpcGossipId = 920139,
    RelatedTalks = 920139,
    TriggerArea = 500
  },
  [920140] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81801, 85102},
    NpcGossipId = 920140,
    RelatedTalks = 920140,
    TriggerArea = 500
  },
  [920141] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81801, 85101},
    NpcGossipId = 920141,
    RelatedTalks = 920141,
    TriggerArea = 500
  },
  [920142] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81801, 81501},
    NpcGossipId = 920142,
    RelatedTalks = 920142,
    TriggerArea = 500
  },
  [920143] = {NpcGossipId = 920143},
  [920144] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {85102, 81801},
    NpcGossipId = 920144,
    RelatedTalks = 920144,
    TriggerArea = 500
  },
  [920145] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {85102, 85301},
    NpcGossipId = 920145,
    RelatedTalks = 920145,
    TriggerArea = 500
  },
  [920146] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcGossipId = 920146,
    RelatedTalks = 920146,
    TriggerArea = 500
  },
  [920147] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcGossipId = 920147,
    RelatedTalks = 920147,
    TriggerArea = 500
  },
  [920148] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83301, 83102},
    NpcGossipId = 920148,
    RelatedTalks = 920148,
    TriggerArea = 500
  },
  [920149] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83301, 81801},
    NpcGossipId = 920149,
    RelatedTalks = 920149,
    TriggerArea = 500
  },
  [920150] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83301, 83201},
    NpcGossipId = 920150,
    RelatedTalks = 920150,
    TriggerArea = 500
  },
  [920151] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83301, 83101},
    NpcGossipId = 920151,
    RelatedTalks = 920151,
    TriggerArea = 500
  },
  [920152] = {NpcGossipId = 920152},
  [920153] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83103, 81103},
    NpcGossipId = 920153,
    RelatedTalks = 920153,
    TriggerArea = 500
  },
  [920154] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83103, 85101},
    NpcGossipId = 920154,
    RelatedTalks = 920154,
    TriggerArea = 500
  },
  [920155] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {83103, 83201},
    NpcGossipId = 920155,
    RelatedTalks = 920155,
    TriggerArea = 500
  },
  [920156] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {85401, 82401},
    NpcGossipId = 920156,
    RelatedTalks = 920156,
    TriggerArea = 500
  },
  [920157] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {85401, 83201},
    NpcGossipId = 920157,
    RelatedTalks = 920157,
    TriggerArea = 500
  },
  [920158] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {85401, 84301},
    NpcGossipId = 920158,
    RelatedTalks = 920158,
    TriggerArea = 500
  },
  [920159] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {85401, 81103},
    NpcGossipId = 920159,
    RelatedTalks = 920159,
    TriggerArea = 500
  },
  [920160] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81103, 84101},
    NpcGossipId = 920160,
    RelatedTalks = 920160,
    TriggerArea = 500
  },
  [920161] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81103, 81801},
    NpcGossipId = 920161,
    RelatedTalks = 920161,
    TriggerArea = 500
  },
  [920162] = {NpcGossipId = 920162},
  [920163] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81103, 82301},
    NpcGossipId = 920163,
    RelatedTalks = 920163,
    TriggerArea = 500
  },
  [920164] = {NpcGossipId = 920164},
  [920165] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {84101, 83102},
    NpcGossipId = 920165,
    RelatedTalks = 920165,
    TriggerArea = 500
  },
  [920166] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {84101, 84202},
    NpcGossipId = 920166,
    RelatedTalks = 920166,
    TriggerArea = 500
  },
  [920167] = {NpcGossipId = 920167},
  [920168] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81502, 85102},
    NpcGossipId = 920168,
    RelatedTalks = 920168,
    TriggerArea = 500
  },
  [920169] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81502, 82401},
    NpcGossipId = 920169,
    RelatedTalks = 920169,
    TriggerArea = 500
  },
  [920170] = {NpcGossipId = 920170},
  [920171] = {NpcGossipId = 920171},
  [920172] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {84102, 82101},
    NpcGossipId = 920172,
    RelatedTalks = 920172,
    TriggerArea = 500
  },
  [920173] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {84102, 81503},
    NpcGossipId = 920173,
    RelatedTalks = 920173,
    TriggerArea = 500
  },
  [920174] = {NpcGossipId = 920174},
  [920175] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81503, 83102},
    NpcGossipId = 920175,
    RelatedTalks = 920175,
    TriggerArea = 500
  },
  [920176] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81503, 84201},
    NpcGossipId = 920176,
    RelatedTalks = 920176,
    TriggerArea = 500
  },
  [920177] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81503, 81501},
    NpcGossipId = 920177,
    RelatedTalks = 920177,
    TriggerArea = 500
  },
  [920178] = {NpcGossipId = 920178},
  [920179] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81501, 82301},
    NpcGossipId = 920179,
    RelatedTalks = 920179,
    TriggerArea = 500
  },
  [920180] = {
    BubbleWaitTime = 10,
    GossipPoint = T.RT_2,
    NpcCombination = {81501, 83101},
    NpcGossipId = 920180,
    RelatedTalks = 920180,
    TriggerArea = 500
  },
  [920181] = {NpcGossipId = 920181}
})
