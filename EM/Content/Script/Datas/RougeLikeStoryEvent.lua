local T = {}
T.RT_1 = {1, 0.1}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("RougeLikeStoryEvent", {
  [1] = {
    EventCondition = {5167},
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story15.T_Rouge_Story15'",
    EventMoment = 3,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_SeasonFirst01",
    Id = 1,
    RLArchiveSubId = 20000101,
    StoryEventName = "StoryEvent_SeasonFirst01",
    StoryEventType = "StoryEventType_1"
  },
  [2] = {
    CutOffEvent = true,
    EventCondition = {5151},
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story01.T_Rouge_Story01'",
    EventMinRoom = 1,
    EventMoment = 2,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_StoryFailed01",
    Id = 2,
    RLArchiveSubId = 20000201,
    StoryEventName = "StoryEvent_Failed01",
    StoryEventType = "StoryEventType_1"
  },
  [3] = {
    CutOffEvent = true,
    EventCondition = {5152},
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story02.T_Rouge_Story02'",
    EventMinRoom = 8,
    EventMoment = 1,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_StorySuccess01",
    Id = 3,
    RLArchiveSubId = 20000301,
    StoryEventName = "StoryEvent_Success01",
    StoryEventType = "StoryEventType_1"
  },
  [4] = {
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story03.T_Rouge_Story03'",
    EventMoment = -1,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_StoryShop_1",
    Id = 4,
    RLArchiveSubId = 20000401,
    StoryEventName = "StoryEvent_Shop01_1",
    StoryEventType = "StoryEventType_1"
  },
  [5] = {
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story03.T_Rouge_Story03'",
    EventMoment = -1,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_StoryShop_2",
    Id = 5,
    RLArchiveSubId = 20000402,
    StoryEventName = "StoryEvent_Shop01_2",
    StoryEventType = "StoryEventType_1"
  },
  [6] = {
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story03.T_Rouge_Story03'",
    EventMoment = -1,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_StoryShop_3",
    Id = 6,
    RLArchiveSubId = 20000403,
    StoryEventName = "StoryEvent_Shop01_3",
    StoryEventType = "StoryEventType_1"
  },
  [7] = {
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story03.T_Rouge_Story03'",
    EventMoment = -1,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_StoryShop_4",
    Id = 7,
    RLArchiveSubId = 20000404,
    StoryEventName = "StoryEvent_Shop01_4",
    StoryEventType = "StoryEventType_1"
  },
  [8] = {
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story03.T_Rouge_Story03'",
    EventMoment = -1,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_StoryShop_5",
    Id = 8,
    RLArchiveSubId = 20000405,
    StoryEventName = "StoryEvent_Shop01_5",
    StoryEventType = "StoryEventType_1"
  },
  [9] = {
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story03.T_Rouge_Story03'",
    EventMoment = -1,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_StoryShop_6",
    Id = 9,
    RLArchiveSubId = 20000406,
    StoryEventName = "StoryEvent_Shop01_6",
    StoryEventType = "StoryEventType_1"
  },
  [10] = {
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story03.T_Rouge_Story03'",
    EventMoment = -1,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_StoryShop_7",
    Id = 10,
    RLArchiveSubId = 20000407,
    StoryEventName = "StoryEvent_Shop01_7",
    StoryEventType = "StoryEventType_1"
  },
  [11] = {
    EventCondition = {
      5064,
      5155,
      5075
    },
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story07.T_Rouge_Story07'",
    EventMinRoom = 2,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_Story11",
    Id = 11,
    RLArchiveSubId = 20000501,
    StoryEventName = "StoryEventName_11",
    StoryEventType = "StoryEventType_1"
  },
  [12] = {
    EventCondition = {
      5103,
      5155,
      5076
    },
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story05.T_Rouge_Story05'",
    EventMinRoom = 6,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_Story12",
    Id = 12,
    RLArchiveSubId = 20000601,
    StoryEventName = "StoryEventName_12",
    StoryEventType = "StoryEventType_1"
  },
  [13] = {
    EventCondition = {
      5104,
      5155,
      5077
    },
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story06.T_Rouge_Story06'",
    EventMinRoom = 10,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_story13",
    Id = 13,
    RLArchiveSubId = 20000602,
    StoryEventName = "StoryEventName_13",
    StoryEventType = "StoryEventType_1"
  },
  [14] = {
    EventCondition = {
      5065,
      5105,
      5195,
      5075
    },
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story04.T_Rouge_Story04'",
    EventMinRoom = 2,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_story21",
    Id = 14,
    RLArchiveSubId = 20000502,
    StoryEventName = "StoryEventName_21",
    StoryEventType = "StoryEventType_1"
  },
  [15] = {
    EventCondition = {
      5196,
      5195,
      5078
    },
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story08.T_Rouge_Story08'",
    EventMinRoom = 8,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_story22",
    Id = 15,
    RLArchiveSubId = 20000701,
    StoryEventName = "StoryEventName_22",
    StoryEventType = "StoryEventType_1"
  },
  [16] = {
    EventCondition = {
      5197,
      5195,
      5079
    },
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story09.T_Rouge_Story09'",
    EventMinRoom = 14,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_story23",
    Id = 16,
    RLArchiveSubId = 20000702,
    StoryEventName = "StoryEventName_23",
    StoryEventType = "StoryEventType_1"
  },
  [17] = {
    EventCondition = {
      5066,
      5202,
      5198,
      5075
    },
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story10.T_Rouge_Story10'",
    EventMinRoom = 2,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_story31",
    Id = 17,
    RLArchiveSubId = 20000503,
    StoryEventName = "StoryEventName_31",
    StoryEventType = "StoryEventType_1"
  },
  [18] = {
    EventCondition = {
      5199,
      5198,
      5080
    },
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story11.T_Rouge_Story11'",
    EventMinRoom = 11,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_story32",
    Id = 18,
    RLArchiveSubId = 20000801,
    StoryEventName = "StoryEventName_32",
    StoryEventType = "StoryEventType_1"
  },
  [19] = {
    EventCondition = {
      5200,
      5198,
      5081
    },
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story12.T_Rouge_Story12'",
    EventMinRoom = 20,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_story33",
    Id = 19,
    RLArchiveSubId = 20000802,
    StoryEventName = "StoryEventName_33",
    StoryEventType = "StoryEventType_1"
  },
  [20] = {
    CutOffEvent = true,
    EventCondition = {5201, 5198},
    EventMainIcon = "Texture2D'/Game/UI/Texture/Dynamic/Image/RougeLike/T_Rouge_Story14.T_Rouge_Story14'",
    EventMinRoom = 20,
    EventMoment = 1,
    EventProbability = T.RT_1,
    EventStoryline = "Rogue/RouEvent_story34",
    Id = 20,
    RLArchiveSubId = 20000901,
    StoryEventName = "StoryEventName_34",
    StoryEventType = "StoryEventType_1"
  }
})
