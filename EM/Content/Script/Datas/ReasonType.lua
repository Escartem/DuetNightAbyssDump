local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ReasonType", {
  ABYSS_REWARD = {
    ReasonId = 9001,
    ReasonName = "ABYSS_REWARD"
  },
  ACHV_FINISH_REWARD = {
    ReasonId = 12001,
    ReasonName = "ACHV_FINISH_REWARD"
  },
  ACTIONPOINT_REWRD = {
    ReasonId = 21008,
    ReasonName = "ACTIONPOINT_REWRD"
  },
  ARCHIVE_COLLECT_REWARD = {
    ReasonId = 26001,
    ReasonName = "ARCHIVE_COLLECT_REWARD"
  },
  AVATAR_LEVEL_REWARD = {
    ReasonId = 28001,
    ReasonName = "AVATAR_LEVEL_REWARD"
  },
  BATTLE_PASS_BUY_LEVEL_CONSUME = {
    ReasonId = 30002,
    ReasonName = "BATTLE_PASS_BUY_LEVEL_CONSUME"
  },
  BATTLE_PASS_REWARDS = {
    ReasonId = 30001,
    ReasonName = "BATTLE_PASS_REWARDS"
  },
  BLUE_ACCELER_RATE_CONSUME = {
    ReasonId = 10005,
    ReasonName = "BLUE_ACCELER_RATE_CONSUME"
  },
  BLUE_CANCEL = {
    ReasonId = 10003,
    ReasonName = "BLUE_CANCEL"
  },
  BLUE_PRODUCT = {
    ReasonId = 10002,
    ReasonName = "BLUE_PRODUCT"
  },
  BLUE_PRODUCT_CONSUME = {
    ReasonId = 10001,
    ReasonName = "BLUE_PRODUCT_CONSUME"
  },
  CHAR_BREAK_CONSUME = {
    ReasonId = 1002,
    ReasonName = "CHAR_BREAK_CONSUME"
  },
  CHAR_LEVELUP_CONSUME = {
    ReasonId = 1001,
    ReasonName = "CHAR_LEVELUP_CONSUME"
  },
  CHAR_LEVELUP_SKILL_CONSUME = {
    ReasonId = 1003,
    ReasonName = "CHAR_LEVELUP_SKILL_CONSUME"
  },
  CHAR_SKILL_TREE_ACTIVATE_CONSUME = {
    ReasonId = 1007,
    ReasonName = "CHAR_SKILL_TREE_ACTIVATE_CONSUME"
  },
  CHAR_TRIAL = {ReasonId = 24003, ReasonName = "CHAR_TRIAL"},
  CHAR_UNLOCK_USE_PIECE = {
    ReasonId = 1009,
    ReasonName = "CHAR_UNLOCK_USE_PIECE"
  },
  CHAR_UPGRADE_CONSUME = {
    ReasonId = 1008,
    ReasonName = "CHAR_UPGRADE_CONSUME"
  },
  CLIENT_REQUEST_USE_CONSUME = {
    ReasonId = 19001,
    ReasonName = "CLIENT_REQUEST_USE_CONSUME"
  },
  COLLECT_REWARD_EXP = {
    ReasonId = 21009,
    ReasonName = "COLLECT_REWARD_EXP"
  },
  COMMUNITY_FOLLOW_REWARD = {
    ReasonId = 35001,
    ReasonName = "COMMUNITY_FOLLOW_REWARD"
  },
  CONDITIONAL_REWRD = {
    ReasonId = 21007,
    ReasonName = "CONDITIONAL_REWRD"
  },
  DAILY_TASK_PROGRESS_GRADE_REWARD = {
    ReasonId = 32002,
    ReasonName = "DAILY_TASK_PROGRESS_GRADE_REWARD"
  },
  DAILY_TASK_PROGRESS_REWARD = {
    ReasonId = 32001,
    ReasonName = "DAILY_TASK_PROGRESS_REWARD"
  },
  DAILY_TASK_TALK_REWARD = {
    ReasonId = 32003,
    ReasonName = "DAILY_TASK_TALK_REWARD"
  },
  DEFAULT_GET_DRAFT = {
    ReasonId = 10004,
    ReasonName = "DEFAULT_GET_DRAFT"
  },
  DELETECHAR_RETURN = {
    ReasonId = 1005,
    ReasonName = "DELETECHAR_RETURN"
  },
  DISPATCH_COMPLETE = {
    ReasonId = 14002,
    ReasonName = "DISPATCH_COMPLETE"
  },
  DISPATCH_GET_ALL_COMPLETE = {
    ReasonId = 14001,
    ReasonName = "DISPATCH_GET_ALL_COMPLETE"
  },
  DISPATCH_LUCKY_REWARD = {
    ReasonId = 14005,
    ReasonName = "DISPATCH_LUCKY_REWARD"
  },
  DISPATCH_SELF_REWARD = {
    ReasonId = 14004,
    ReasonName = "DISPATCH_SELF_REWARD"
  },
  DISPATCH_SKILL_REWARD = {
    ReasonId = 14006,
    ReasonName = "DISPATCH_SKILL_REWARD"
  },
  DISPATCH_UPDATE_REFRESH = {
    ReasonId = 14003,
    ReasonName = "DISPATCH_UPDATE_REFRESH"
  },
  DUNGEON_REWARD = {
    ReasonId = 24001,
    ReasonName = "DUNGEON_REWARD"
  },
  DYNAMICQUEST_SUCCESS = {
    ReasonId = 7001,
    ReasonName = "DYNAMICQUEST_SUCCESS"
  },
  DYNAMIC_ACTIVE = {
    ReasonId = 7002,
    ReasonName = "DYNAMIC_ACTIVE"
  },
  EXPLORE_COMPLETE_REWARDS = {
    ReasonId = 29001,
    ReasonName = "EXPLORE_COMPLETE_REWARDS"
  },
  FEINA_GAME_REWARD = {
    ReasonId = 14007,
    ReasonName = "FEINA_GAME_REWARD"
  },
  FIRSTADDCHAR = {
    ReasonId = 1006,
    ReasonName = "FIRSTADDCHAR"
  },
  FISH_CONSUME = {
    ReasonId = 27001,
    ReasonName = "FISH_CONSUME"
  },
  FISH_GET = {ReasonId = 27002, ReasonName = "FISH_GET"},
  GACHA_CUMULATIVE_REWARD = {
    ReasonId = 22004,
    ReasonName = "GACHA_CUMULATIVE_REWARD"
  },
  GACHA_DRAW_CONSUME = {
    ReasonId = 22001,
    ReasonName = "GACHA_DRAW_CONSUME"
  },
  GACHA_NEW = {ReasonId = 22002, ReasonName = "GACHA_NEW"},
  GACHA_PROLOGUE = {
    ReasonId = 22003,
    ReasonName = "GACHA_PROLOGUE"
  },
  GM = {ReasonId = 0, ReasonName = "GM"},
  GM_CONSUME = {ReasonId = 1, ReasonName = "GM_CONSUME"},
  GUIDE_BOOK = {ReasonId = 15001, ReasonName = "GUIDE_BOOK"},
  HARDBOSS = {ReasonId = 24002, ReasonName = "HARDBOSS"},
  IMPRESSION_DALIY_LOGIN = {
    ReasonId = 13001,
    ReasonName = "IMPRESSION_DALIY_LOGIN"
  },
  IMPRESSION_NODE_CHECK_SUCCESS = {
    ReasonId = 13004,
    ReasonName = "IMPRESSION_NODE_CHECK_SUCCESS"
  },
  IMPRESSION_NODE_COMPLETE_REWARDS = {
    ReasonId = 13002,
    ReasonName = "IMPRESSION_NODE_COMPLETE_REWARDS"
  },
  IMPRESSION_NODE_FAILER_RESOURCE_CONSUME = {
    ReasonId = 13003,
    ReasonName = "IMPRESSION_NODE_FAILER_RESOURCE_CONSUME"
  },
  INIT_AVATAR = {
    ReasonId = 2,
    ReasonName = "INIT_AVATAR"
  },
  MAIL = {ReasonId = 17001, ReasonName = "MAIL"},
  MIDTERM_LEVEL_REWARD = {
    ReasonId = 34001,
    ReasonName = "MIDTERM_LEVEL_REWARD"
  },
  MIDTERM_SCORE_REWARD = {
    ReasonId = 34002,
    ReasonName = "MIDTERM_SCORE_REWARD"
  },
  MOD_BOOK_QUEST_REWARD = {
    ReasonId = 33001,
    ReasonName = "MOD_BOOK_QUEST_REWARD"
  },
  MOD_CARD_LEVEL_UP_CONSUME = {
    ReasonId = 3005,
    ReasonName = "MOD_CARD_LEVEL_UP_CONSUME"
  },
  MOD_CHAR_POLARITY_CONSUME = {
    ReasonId = 3003,
    ReasonName = "MOD_CHAR_POLARITY_CONSUME"
  },
  MOD_DECOMPOSE = {
    ReasonId = 3001,
    ReasonName = "MOD_DECOMPOSE"
  },
  MOD_DECOMPOSE_CONSUME = {
    ReasonId = 3006,
    ReasonName = "MOD_DECOMPOSE_CONSUME"
  },
  MOD_GUIDE_ARCHIVE_REWARD = {
    ReasonId = 33002,
    ReasonName = "MOD_GUIDE_ARCHIVE_REWARD "
  },
  MOD_LEVELUP_CONSUME = {
    ReasonId = 3002,
    ReasonName = "MOD_LEVELUP_CONSUME"
  },
  MOD_WEAPON_POLARITY_CONSUME = {
    ReasonId = 3004,
    ReasonName = "MOD_WEAPON_POLARITY_CONSUME"
  },
  MONTHLY_CARD_BUY = {
    ReasonId = 31001,
    ReasonName = "MONTHLY_CARD_BUY"
  },
  MONTHLY_CARD_DAILY = {
    ReasonId = 31002,
    ReasonName = "MONTHLY_CARD_DAILY"
  },
  MONTHLY_CARD_UNIQUE = {
    ReasonId = 31003,
    ReasonName = "MONTHLY_CARD_UNIQUE"
  },
  OTHER_CHAR_SKIN = {
    ReasonId = 1004,
    ReasonName = "OTHER_CHAR_SKIN"
  },
  PARTY_CONSUME = {
    ReasonId = 6002,
    ReasonName = "PARTY_CONSUME"
  },
  PARTY_REWARD = {
    ReasonId = 6001,
    ReasonName = "PARTY_REWARD"
  },
  PET_BREAK_CONSUME = {
    ReasonId = 21002,
    ReasonName = "PET_BREAK_CONSUME"
  },
  PET_CAPTURE = {
    ReasonId = 21005,
    ReasonName = "PET_CAPTURE"
  },
  PET_ENTRY_REPLACE_CONSUME = {
    ReasonId = 21003,
    ReasonName = "PET_ENTRY_REPLACE_CONSUME"
  },
  PET_FOOD_CONSUME = {
    ReasonId = 21001,
    ReasonName = "PET_FOOD_CONSUME"
  },
  PET_LEVEL_UP = {
    ReasonId = 21006,
    ReasonName = "PET_LEVEL_UP"
  },
  PET_LEVEL_UP_CONSUME = {
    ReasonId = 21004,
    ReasonName = "PET_LEVEL_UP_CONSUME"
  },
  PHASE_DAILYLOGIN = {
    ReasonId = 18002,
    ReasonName = "PHASE_DAILYLOGIN"
  },
  PHASE_QUEST = {
    ReasonId = 18001,
    ReasonName = "PHASE_QUEST"
  },
  PURCHASE_ACTIONPOINT_CONSUME = {
    ReasonId = 20001,
    ReasonName = "PURCHASE_ACTIONPOINT_CONSUME "
  },
  PURCHASE_SHOPITEM = {
    ReasonId = 5001,
    ReasonName = "PURCHASE_SHOPITEM"
  },
  PURCHASE_SHOPITEM_CONSUME = {
    ReasonId = 5002,
    ReasonName = "PURCHASE_SHOPITEM_CONSUME"
  },
  QUEST_COMPLETE = {
    ReasonId = 11001,
    ReasonName = "QUEST_COMPLETE"
  },
  REPEAT_CHAR_ACCESSORY_TRANSFORM_RESOURCE_GET = {
    ReasonId = 4015,
    ReasonName = "REPEAT_CHAR_ACCESSORY_TRANSFORM_RESOURCE_GET"
  },
  REPEAT_RESOURCE_TRANSFORM_RESOURCE_GET = {
    ReasonId = 4016,
    ReasonName = "REPEAT_RESOURCE_TRANSFORM_RESOURCE_GET"
  },
  REPEAT_SKIN_TRANSFORM_RESOURCE_GET = {
    ReasonId = 4013,
    ReasonName = "REPEAT_SKIN_TRANSFORM_RESOURCE_GET"
  },
  REPEAT_WEAPON_ACCESSORY_TRANSFORM_RESOURCE_GET = {
    ReasonId = 4014,
    ReasonName = "REPEAT_WEAPON_ACCESSORY_TRANSFORM_RESOURCE_GET"
  },
  REPEAT_WEAPON_SKIN_TRANSFORM_RESOURCE_GET = {
    ReasonId = 4017,
    ReasonName = "REPEAT_WEAPON_SKIN_TRANSFORM_RESOURCE_GET"
  },
  RESOURCE_CONVERSION = {
    ReasonId = 4003,
    ReasonName = "RESOURCE_CONVERSION"
  },
  RESOURCE_DROP_REWARD = {
    ReasonId = 4004,
    ReasonName = "RESOURCE_DROP_REWARD"
  },
  RESOURCE_FISH_SALE_CONSUME = {
    ReasonId = 4012,
    ReasonName = "RESOURCE_FISH_SALE_CONSUME"
  },
  RESOURCE_FISH_SALE_GET = {
    ReasonId = 4011,
    ReasonName = "RESOURCE_FISH_SALE_GET"
  },
  RESOURCE_OPEN_CHEST = {
    ReasonId = 4006,
    ReasonName = "RESOURCE_OPEN_CHEST"
  },
  RESOURCE_OPEN_CHEST_CONSUME = {
    ReasonId = 4005,
    ReasonName = "RESOURCE_OPEN_CHEST_CONSUME"
  },
  RESOURCE_SALE_CONSUME = {
    ReasonId = 4001,
    ReasonName = "RESOURCE_SALE_CONSUME"
  },
  RESOURCE_SELECT_CONSUME = {
    ReasonId = 4009,
    ReasonName = "RESOURCE_SELECT_CONSUME"
  },
  RESOURCE_SELECT_GET = {
    ReasonId = 4010,
    ReasonName = "RESOURCE_SELECT_GET"
  },
  RESOURCE_TRANSFORM_CONSUME = {
    ReasonId = 4007,
    ReasonName = "RESOURCE_TRANSFORM_CONSUME"
  },
  RESOURCE_TRANSFORM_GET = {
    ReasonId = 4008,
    ReasonName = "RESOURCE_TRANSFORM_GET"
  },
  RESOURCE_WHEEL_USE_CONSUME = {
    ReasonId = 4002,
    ReasonName = "RESOURCE_WHEEL_USE_CONSUME"
  },
  ROUGELIKE_END = {
    ReasonId = 23004,
    ReasonName = "ROUGELIKE_END"
  },
  ROUGELIKE_EVENT_SELECT_CONSUME = {
    ReasonId = 23005,
    ReasonName = "ROUGELIKE_EVENT_SELECT_CONSUME"
  },
  ROUGELIKE_FIRST_PASS = {
    ReasonId = 23010,
    ReasonName = "ROUGELIKE_FIRST_PASS"
  },
  ROUGELIKE_MANUAL = {
    ReasonId = 23015,
    ReasonName = "ROUGELIKE_MANUAL"
  },
  ROUGELIKE_MRT_REFUND = {
    ReasonId = 23009,
    ReasonName = "ROUGELIKE_MRT_REFUND"
  },
  ROUGELIKE_PASS_EVENT = {
    ReasonId = 23011,
    ReasonName = "ROUGELIKE_PASS_EVENT"
  },
  ROUGELIKE_PASS_ROOM = {
    ReasonId = 23012,
    ReasonName = "ROUGELIKE_PASS_ROOM"
  },
  ROUGELIKE_RECOVER_CONSUME = {
    ReasonId = 23013,
    ReasonName = "ROUGELIKE_RECOVER_CONSUME"
  },
  ROUGELIKE_REFRESH_CONSUME = {
    ReasonId = 23001,
    ReasonName = "ROUGELIKE_REFRESH_CONSUME"
  },
  ROUGELIKE_REWARD = {
    ReasonId = 23007,
    ReasonName = "ROUGELIKE_REWARD"
  },
  ROUGELIKE_SERVER_BUILD_CONSUME = {
    ReasonId = 23014,
    ReasonName = "ROUGELIKE_SERVER_BUILD_CONSUME"
  },
  ROUGELIKE_SHOP_PURCHASE_CONSUME = {
    ReasonId = 23003,
    ReasonName = "ROUGELIKE_SHOP_PURCHASE_CONSUME"
  },
  ROUGELIKE_TALENT_SELECT_CONSUME = {
    ReasonId = 23008,
    ReasonName = "ROUGELIKE_TALENT_SELECT_CONSUME"
  },
  ROUGELIKE_UPGRADE_CONSUME = {
    ReasonId = 23002,
    ReasonName = "ROUGELIKE_UPGRADE_CONSUME"
  },
  ROUGELIKE_WEEKLY_REWARD = {
    ReasonId = 23006,
    ReasonName = "ROUGELIKE_WEEKLY_REWARD"
  },
  SYSTEMGUIDE_FINISH_REWARD = {
    ReasonId = 8001,
    ReasonName = "SYSTEMGUIDE_FINISH_REWARD"
  },
  WALNUT_OPEN = {
    ReasonId = 25002,
    ReasonName = "WALNUT_OPEN"
  },
  WALNUT_OPEN_CONSUME = {
    ReasonId = 25001,
    ReasonName = "WALNUT_OPEN_CONSUME"
  },
  WEAPON_ADDCHAR = {
    ReasonId = 2004,
    ReasonName = "WEAPON_ADDCHAR"
  },
  WEAPON_BREAK_CONSUME = {
    ReasonId = 2002,
    ReasonName = "WEAPON_BREAK_CONSUME"
  },
  WEAPON_COLOR_CHANGE_CONSUME = {
    ReasonId = 2005,
    ReasonName = "WEAPON_COLOR_CHANGE_CONSUME"
  },
  WEAPON_LEVELUP_CONSUME = {
    ReasonId = 2001,
    ReasonName = "WEAPON_LEVELUP_CONSUME"
  },
  WEAPON_LEVELUP_SKILL_CONSUME = {
    ReasonId = 2003,
    ReasonName = "WEAPON_LEVELUP_SKILL_CONSUME"
  },
  WEAPON_UPGRADE_CONSUME = {
    ReasonId = 2006,
    ReasonName = "WEAPON_UPGRADE_CONSUME"
  },
  WEAPON_UP_GRADELEVEL_CONSUME = {
    ReasonId = 36001,
    ReasonName = "WEAPON_UP_GRADELEVEL_CONSUME"
  },
  WECHAT_SMALL_APP = {
    ReasonId = 21010,
    ReasonName = "WECHAT_SMALL_APP"
  },
  WIKI_ENTRY = {ReasonId = 16001, ReasonName = "WIKI_ENTRY"}
})
