local T = {}
T.RT_1 = {DisableEscClose = 1}
T.RT_2 = {
  [1] = "UI_COMMONPOP_TEXT_100099_2"
}
T.RT_3 = {
  [1] = "UI_SHOP_SOLDOUT"
}
T.RT_4 = {
  [1] = "UI_REGISTER_OVERLENGTH",
  [2] = "UI_REGISTER_ILLEGALINPUT"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CommonPopupUIContext", {
  [100000] = {
    ExtraParams = T.RT_1,
    Id = 100000,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "TestStyle",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100001] = {
    Id = 100001,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100001",
    Style = "ShortTextDefault",
    Title = "UI_Esc_ExitDungeon",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100002] = {
    Id = 100002,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100002",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100002",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100003] = {
    Id = 100003,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100003",
    Style = "ShortTextDefault",
    Title = "UI_Esc_Exit",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100004] = {
    Id = 100004,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100004",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100004",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100005] = {
    Id = 100005,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100005",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100005",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100006] = {
    Id = 100006,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100006",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100006",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100007] = {
    Id = 100007,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100007",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100007",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100008] = {
    Id = 100008,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100008",
    Style = "ShortTextDefault",
    Title = "UI_Esc_Exit",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100009] = {
    Id = 100009,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "Mod_Upgrade_Tip",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100009",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100010] = {
    Id = 100010,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100010",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100011] = {
    Id = 100011,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100011",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100012] = {
    Id = 100012,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100012",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100012",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100013] = {
    Id = 100013,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100013",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100013",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100014] = {
    Id = 100014,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100014",
    Style = "ForgeConfirm",
    Tip = T.RT_2,
    Title = "UI_COMMONPOP_TITLE_100014",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100015] = {
    Id = 100015,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100015",
    Style = "ForgeCancelProduce",
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100015"
    },
    Title = "UI_COMMONPOP_TITLE_100015",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100016] = {
    Id = 100016,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100016",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100016",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100017] = {Id = 100017},
  [100018] = {
    Id = 100018,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100018",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100018",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100019] = {
    Id = 100019,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100019",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100019",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100020] = {
    ExtraParams = T.RT_1,
    Id = 100020,
    NoButtonText = "UI_PATCH_CANCEL",
    NotShowCloseButton = 1,
    PopoverText = "UI_PATCH_GETREMOTEVERSIONFAILED",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100020",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100021] = {
    ExtraParams = T.RT_1,
    Id = 100021,
    NoButtonText = "UI_PATCH_CANCEL",
    NotShowCloseButton = 1,
    PopoverText = "UI_PATCH_GETREMOTEPAKLISTFAILED",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100020",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100022] = {
    ExtraParams = T.RT_1,
    Id = 100022,
    NoButtonText = "UI_PATCH_CANCEL",
    NotShowCloseButton = 1,
    PopoverText = "UI_PATCH_DOWNLOADFAILED",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100020",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100023] = {
    ExtraParams = T.RT_1,
    Id = 100023,
    NoButtonText = "UI_PATCH_CANCEL",
    NotShowCloseButton = 1,
    PopoverText = "UI_PATCH_PERSISTENTFAILED",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100020",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100024] = {
    ExtraParams = T.RT_1,
    Id = 100024,
    NoButtonText = "UI_PATCH_CANCEL",
    NotShowCloseButton = 1,
    PopoverText = "UI_Loading_Download_Complete",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100024",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100025] = {
    Id = 100025,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Loading_Download_Addition",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100024",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100026] = {
    Id = 100026,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Loading_Download_Confirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100026",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100027] = {
    HintText = "UI_COMMONPOP_CHECK_100027",
    Id = 100027,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100027",
    Style = "CheckDefault",
    Title = "UI_COMMONPOP_TITLE_100027",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100028] = {
    Id = 100028,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_HardBoss_Abandon_Text",
    Style = "ShortTextDefault",
    Tip = {
      [1] = "UI_HardBoss_Abandon_Tips"
    },
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100029] = {
    Id = 100029,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "Levelup_1",
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100029"
    },
    Title = "UI_FUNC_LEVELUP",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100030] = {
    Id = 100030,
    Style = "Levelup_2",
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100030"
    },
    Title = "UI_FUNC_BREAKLEVELUP"
  },
  [100031] = {
    Id = 100031,
    PopoverText = "UI_PATCH_NEWPAK",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100032] = {
    ExtraParams = T.RT_1,
    Id = 100032,
    NoButtonText = "UI_PATCH_CANCEL",
    NotShowCloseButton = 1,
    PopoverText = "UI_GACHA_OVERDUE",
    Style = "ShortTextComfirm",
    Title = "UI_GACHA_TITLE_OVERDUE",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100033] = {
    ExtraParams = T.RT_1,
    Id = 100033,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "SettingChangeKey_1",
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100033_2"
    },
    Title = "UI_COMMONPOP_TITLE_100033",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100034] = {
    ExtraParams = T.RT_1,
    Id = 100034,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "SettingChangeKey_2",
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100034"
    },
    Title = "UI_COMMONPOP_TITLE_100033",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100035] = {
    ExtraParams = T.RT_1,
    Id = 100035,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "SettingChangeKey_3",
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100035"
    },
    Title = "UI_COMMONPOP_TITLE_100033",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100036] = {
    ExtraParams = T.RT_1,
    Id = 100036,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "SettingChangeKey_4",
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100036"
    },
    Title = "UI_COMMONPOP_TITLE_100033",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100037] = {
    Id = 100037,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100037",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100038] = {
    Id = 100038,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Bag_Sellconfirm_Tips",
    Style = "BagSellConfirm",
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100038"
    },
    Title = "UI_BAG_Sell",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100039] = {
    Id = 100039,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "Shop_BuyPackagePart_1",
    Title = "UI_SHOP_PURCHASE",
    YesButtonText = "UI_SHOP_PURCHASE"
  },
  [100040] = {
    Id = 100040,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "Shop_BuyPackagePart_2",
    Tip = T.RT_3,
    Title = "UI_SHOP_PURCHASE",
    YesButtonText = "UI_SHOP_PURCHASE"
  },
  [100041] = {
    Id = 100041,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "Shop_BuySinglePart_1",
    Title = "UI_SHOP_PURCHASE",
    YesButtonText = "UI_SHOP_PURCHASE"
  },
  [100042] = {
    Id = 100042,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "Shop_BuySinglePart_2",
    Tip = T.RT_3,
    Title = "UI_SHOP_PURCHASE",
    YesButtonText = "UI_SHOP_PURCHASE"
  },
  [100043] = {
    Id = 100043,
    ShowQuitTip = 1,
    Style = "LongTextDefault_Line",
    Title = "UI_Armory_ShowAttribute"
  },
  [100044] = {
    Id = 100044,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100044",
    Style = "ShortTextDefault",
    Title = "UI_Armory_Replace_Weapon",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100045] = {
    Id = 100045,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "Levelup_3",
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100045"
    },
    Title = "UI_FUNC_LEVELUP",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100046] = {
    Id = 100046,
    PopoverText = "UI_Warning_Age_Content",
    ShowQuitTip = 1,
    Style = "LongTextDefault_1",
    Title = "UI_Warning_Age_Title"
  },
  [100047] = {
    Id = 100047,
    ShowQuitTip = 1,
    Style = "LongTextDefault_1",
    Title = "UI_GACHA_DETAIL"
  },
  [100048] = {
    Id = 100048,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100048",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100048",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100049] = {
    Id = 100049,
    ShowQuitTip = 1,
    Style = "Announcement",
    Title = "UI_COMMONPOP_TITLE_100010"
  },
  [100050] = {
    Id = 100050,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100050",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100051] = {
    ExtraParams = T.RT_1,
    Id = 100051,
    NotShowCloseButton = 1,
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100051",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100052] = {
    Id = 100052,
    ShowQuitTip = 1,
    Style = "CombatData",
    Title = "UI_BATTLE_DATA"
  },
  [100053] = {
    ExtraParams = T.RT_1,
    Id = 100053,
    NotShowCloseButton = 1,
    PopoverText = "UI_Loading_NeedRestart",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100056] = {
    Id = 100056,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "ChangeBirth_1",
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100056"
    },
    Title = "UI_COMMONPOP_TITLE_100056",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100057] = {
    Id = 100057,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100057",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100058] = {
    Id = 100058,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100058",
    Style = "ShortTextDefault_2",
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100058_2"
    },
    Title = "UI_Esc_ExitDungeon",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100063] = {
    Id = 100063,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "WeaponResolveDialog",
    Tip = {
      [1] = "UI_Bag_Decompose_Tip_1"
    },
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100064] = {
    HintText = "UI_Bag_Decompose_NotToday",
    Id = 100064,
    PopoverText = "UI_Bag_Decompose_Tip_2",
    Style = "CheckDefault",
    Title = "UI_COMMONPOP_TITLE_100010"
  },
  [100065] = {
    Id = 100065,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Dispatch_StopConfirm_Text",
    Style = "ShortTextDefault_2",
    Tip = {
      [1] = "UI_Dispatch_StopConfirm_Waring"
    },
    Title = "UI_Dispatch_StopConfirm_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100066] = {
    Id = 100066,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100066_2",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100070] = {
    Id = 100070,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100005",
    Style = "ShortTextDefault_1",
    Title = "UI_COMMONPOP_TITLE_100005",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100071] = {
    Id = 100071,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_CBT1_INFOBINDING_TOAST",
    Style = "ShortTextDefault_1",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100072] = {
    ExtraParams = T.RT_1,
    Id = 100072,
    NotShowCloseButton = 1,
    PopoverText = "UI_COMMONPOP_TEXT_100072",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100073] = {
    ExtraParams = T.RT_1,
    Id = 100073,
    NotShowCloseButton = 1,
    PopoverText = "UI_COMMONPOP_TEXT_100073",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100074] = {
    ExtraParams = T.RT_1,
    Id = 100074,
    NotShowCloseButton = 1,
    PopoverText = "UI_COMMONPOP_TEXT_100074",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100075] = {
    Id = 100075,
    NoButtonText = "UI_Restart_Later",
    PopoverText = "UI_COMMONPOP_TEXT_100075",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_Restart_Immediate"
  },
  [100076] = {
    Id = 100076,
    PopoverText = "UI_COMMONPOP_TEXT_100076",
    Style = "ShortTextDefault_2",
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100076_2"
    },
    Title = "UI_COMMONPOP_TITLE_100010"
  },
  [100077] = {
    Id = 100077,
    PopoverText = "UI_COMMONPOP_TEXT_100071",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010"
  },
  [100078] = {
    Id = 100078,
    PopoverText = "UI_COMMONPOP_TEXT_100077",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010"
  },
  [100085] = {
    Id = 100085,
    Style = "common_dialog_input",
    Title = "UI_COMMONPOP_TITLE_100078"
  },
  [100086] = {
    Id = 100086,
    Style = "common_dialog_input",
    Title = "UI_COMMONPOP_TITLE_100082"
  },
  [100087] = {
    Id = 100087,
    PopoverText = "UI_CameraSystem_QuitTips",
    Style = "ShortTextDefault_1",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100089] = {
    Id = 100089,
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010"
  },
  [100090] = {
    Id = 100090,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "Chat_Report",
    Tip = T.RT_4,
    Title = "UI_COMMONPOP_TITLE_100090",
    YesButtonText = "UI_COMMONPOP_TITLE_100090"
  },
  [100091] = {
    Id = 100091,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "Chat_QuickAnswerEdit",
    Tip = T.RT_4,
    Title = "UI_COMMONPOP_TITLE_100091",
    YesButtonText = "UI_RegionMap_Save"
  },
  [100092] = {
    Id = 100092,
    PopoverText = "UI_COMMONPOP_TEXT_100092",
    Style = "ShortTextDefault_1",
    Title = "UI_COMMONPOP_TITLE_100092"
  },
  [100093] = {
    Id = 100093,
    PopoverText = "UI_COMMONPOP_TEXT_100093",
    Style = "ShortTextDefault_1",
    Title = "UI_COMMONPOP_TITLE_100093"
  },
  [100094] = {
    Id = 100094,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100094",
    Style = "ShortTextDefault_1",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100095] = {
    Id = 100095,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100095",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100095",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100096] = {
    Id = 100096,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100096",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100096",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100097] = {
    Id = 100097,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_TEMPLE_CONFIRM",
    Style = "ShortTextDefault",
    Title = "UI_TEMPLE_RESTART",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100098] = {
    Id = 100098,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100098",
    Style = "BagSellConfirm",
    Tip = T.RT_2,
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100099] = {
    Id = 100099,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100099",
    Style = "BagSellConfirm",
    Tip = T.RT_2,
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100100] = {
    Id = 100100,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100100",
    Style = "ResourceUseConfirm",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100101] = {
    Id = 100101,
    Style = "Activity_RewardPreview",
    Title = "UI_GameEvent_StarterQuest_RewardPreview"
  },
  [100102] = {
    Id = 100102,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_DUNGEON_DES_TRAINING_33",
    Style = "ShortTextDefault",
    Title = "UI_DUNGEON_DES_TRAINING_28",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100103] = {
    Id = 100103,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100103",
    Style = "Impression_Shop_Confirm",
    Tip = {
      [1] = "UI_ImpressionShop_UnlockCondition_02"
    },
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100104] = {
    Id = 100104,
    ShowQuitTip = 1,
    Style = "CommonDialogAttr2",
    Title = "UI_COMMONPOP_TITLE_100010"
  },
  [100105] = {
    Id = 100105,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_ExitTeamConfirm",
    Style = "ShortTextDefault",
    Title = "UI_Esc_ExitDungeon",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100106] = {
    Id = 100106,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "DUNGEON_HIJACK_118",
    Style = "ShortTextDefault_1",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100107] = {
    Id = 100107,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Team_Kick_Content",
    Style = "ShortTextDefault_1",
    Title = "UI_Team_Kick",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100108] = {
    Id = 100108,
    PopoverText = "UI_Team_Confirm",
    Style = "ShortTextDefault_1",
    Title = "UI_Team_Leave"
  },
  [100109] = {
    ExtraParams = T.RT_1,
    Id = 100109,
    NotShowCloseButton = 1,
    PopoverText = "UI_COMMONPOP_TEXT_100109",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100109",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100110] = {
    Id = 100110,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "Tips_SpecialQuest_Start",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100111] = {
    ExtraParams = T.RT_1,
    Id = 100111,
    NotShowCloseButton = 1,
    PopoverText = "UI_COMMONPOP_TEXT_100111",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100111",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100112] = {
    Id = 100112,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100103",
    Style = "Impression_Shop_Confirm_1",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100113] = {
    Id = 100113,
    Style = "Gacha_Detail"
  },
  [100114] = {
    Id = 100114,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100114",
    Style = "ShortTextDefault_1",
    Title = "UI_FUNC_LEVELUP",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100115] = {
    Id = 100115,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100115",
    Style = "ShortTextDefault_1",
    Title = "UI_FUNC_BREAKLEVELUP",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100116] = {
    Id = 100116,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100116",
    Style = "ShortTextDefault_1",
    Title = "UI_COMMONPOP_TITLE_100116",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100117] = {
    Id = 100117,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100117",
    Style = "ShortTextDefault_1",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100118] = {
    Id = 100118,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100118",
    Style = "ShortTextDefault_1",
    Title = "UI_FUNC_INCREASE",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100119] = {
    Id = 100119,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100119",
    Style = "ShortTextDefault_1",
    Title = "UI_FUNC_INCREASE",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100120] = {
    Id = 100120,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "Tips_SpecialQuest_GiveUp",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100121] = {
    ExtraParams = T.RT_1,
    Id = 100121,
    NotShowCloseButton = 1,
    PopoverText = "UI_COMMONPOP_TEXT_100121",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100109",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100122] = {
    Id = 100122,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Advanced_Emotions_Popup",
    Style = "Invitation_Exchange",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_Advanced_Emotions_Exchange"
  },
  [100123] = {
    Id = 100123,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "Depute_Ticket",
    Title = "UI_Ticket_Choose",
    YesButtonText = "UI_HardBoss_Start"
  },
  [100124] = {
    Id = 100124,
    PopoverText = "UI_Toast_Dungeon_Detail",
    ShowQuitTip = 1,
    Style = "LongTextDefault_1",
    Title = "UI_Dungeon_Detail"
  },
  [100125] = {
    Id = 100125,
    PopoverText = "UI_Toast_Rouge_Detail",
    ShowQuitTip = 1,
    Style = "LongTextDefault_1",
    Title = "UI_Rouge_Detail"
  },
  [100126] = {
    Id = 100126,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_MOD_Limit_Exceed_MainText",
    Style = "LongTextDefault_2",
    Title = "UI_MOD_Limit_Exceed_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100128] = {
    Id = 100128,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Temple_Abandon_Text",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100129] = {
    Id = 100129,
    NoButtonForbiddenToast = "ModFilter_SelectNone",
    NoButtonIconPath = "Texture2D'/Game/UI/Texture/Static/Atlas/Common/T_Com_IconDelete.T_Com_IconDelete'",
    NoButtonRGBA = "6397b9",
    NoButtonText = "ModFilter_ClearAll",
    Style = "Filter",
    Title = "ModFilter_Title",
    YesButtonText = "ModFilter_Confirm"
  },
  [100130] = {
    Id = 100130,
    Style = "catching_pets",
    Title = "UI_COMMONPOP_TITLE_100130"
  },
  [100131] = {
    Id = 100131,
    Style = "Friend_Information"
  },
  [100132] = {
    Id = 100132,
    Style = "Friend_Information"
  },
  [100133] = {
    Id = 100133,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "common_dialog_input",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100134] = {
    Id = 100134,
    Style = "Announcement_new"
  },
  [100135] = {
    Id = 100135,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Dye_Reset",
    Style = "ShortTextDefault",
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100135_2"
    },
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100136] = {
    Id = 100136,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100136",
    Style = "ResourceUseConfirm",
    Title = "UI_COMMONPOP_TITLE_100136",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100137] = {
    Id = 100137,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100137",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100137",
    YesButtonText = "UI_GameEvent_Goto"
  },
  [100138] = {
    Id = 100138,
    ShowQuitTip = 1,
    Style = "Dispatch_RewardPreview",
    Title = "UI_Disptach_RewardShow"
  },
  [100139] = {
    Id = 100139,
    ShowQuitTip = 1,
    Style = "Dispatch_CharDispatchAbility",
    Title = "UI_Disptach_Ability"
  },
  [100140] = {
    Id = 100140,
    Style = "Menu_Head_Dialog"
  },
  [100141] = {
    Id = 100141,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100096",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100142] = {
    Id = 100142,
    PopoverText = "UI_Rougelike_Contract_Detail",
    ShowQuitTip = 1,
    Style = "LongTextDefault_1",
    Title = "UI_COMMONPOP_TITLE_100010"
  },
  [100143] = {
    Id = 100143,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_RougeLike_GiveUpSelect_Tip",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100144] = {
    Id = 100144,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_RL_SettlementText",
    Style = "ShortTextDefault_3",
    Tip = {
      [1] = "UI_RL_SettlementResultText"
    },
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100145] = {
    Id = 100145,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Disptach_CancelConfirm",
    Style = "ShortTextDefault_1",
    Title = "UI_Disptach_State_Cancel",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100146] = {
    Id = 100146,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Disptach_GotoConfirm",
    Style = "ShortTextDefault_3",
    Tip = {
      [1] = "UI_Dispatch_Toast_ManualWarm"
    },
    Title = "UI_Disptach_Confirm",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100147] = {
    Id = 100147,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "Abyss_FightReConfirm",
    Style = "ShortTextDefault_1",
    Title = "Abyss_FightReConfirm_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100148] = {
    Id = 100148,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "Abyss_LockedReConfirm",
    Style = "ShortTextDefault_1",
    Title = "Abyss_LockedReConfirm_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100149] = {
    Id = 100149,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "Abyss_SaveReConfirm",
    Style = "ShortTextDefault_1",
    Title = "Abyss_SaveReConfirm_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100150] = {
    Id = 100150,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "Abyss_ResetFightConfirm",
    Style = "ShortTextDefault_1",
    Title = "Abyss_ResetFight",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100151] = {
    ExtraParams = T.RT_1,
    Id = 100151,
    NotShowCloseButton = 1,
    PopoverText = "UI_COMMONPOP_TEXT_100151",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100151",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100152] = {
    Id = 100152,
    ShowQuitTip = 1,
    Style = "LongTextDefault_1",
    Title = "Abyss_entry"
  },
  [100153] = {
    Id = 100153,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "Forging_BatchDialog",
    TabCoin = {101},
    Title = "UI_COMMONPOP_TITLE_100014",
    YesButtonText = "UI_FORGING_START"
  },
  [100154] = {
    Id = 100154,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "Forging_TerminateDialog",
    Title = "UI_COMMONPOP_TITLE_100015",
    YesButtonText = "UI_End_Forge_Confirm"
  },
  [100155] = {
    Id = 100155,
    Style = "EliteDropDialog",
    Title = "UI_Dungeon_SpecialMonster"
  },
  [100156] = {
    Id = 100156,
    Style = "DeputeDetailDialog",
    Title = "UI_Dungeon_RewardDetailTitle"
  },
  [100157] = {
    ExtraParams = T.RT_1,
    Id = 100157,
    NotShowCloseButton = 1,
    PopoverText = "UI_COMMONPOP_TEXT_100157",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100158] = {
    Id = 100158,
    Style = "Common_Reward_Dialog"
  },
  [100159] = {
    Id = 100159,
    Style = "Angling_RodSelect",
    Title = "UI_Fishing_SelectFishingRod"
  },
  [100160] = {
    Id = 100160,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Prompt_QuestTrans",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100161] = {
    Id = 100161,
    PopoverText = "UI_CharTrial_LeaveText",
    Style = "ShortTextDefault",
    Title = "UI_CharTrial_LeaveTitle"
  },
  [100162] = {
    Id = 100162,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Dispatch_PhantomConfirm_Text",
    Style = "ShortTextDefault",
    Title = "UI_Dispatch_PhantomConfirm_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100163] = {
    Id = 100163,
    PopoverText = "FeeRefund_Rule_Content",
    ShowQuitTip = 1,
    Style = "LongTextDefault_1",
    Title = "UI_GACHA_RULE"
  },
  [100164] = {
    Id = 100164,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "WeaponResolveDialog",
    Tip = {
      [1] = "UI_Bag_Sellconfirm_Tips"
    },
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100165] = {
    HintText = "UI_Bag_Decompose_NotToday",
    Id = 100165,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Bag_Decompose_Tip_2",
    Style = "CheckDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100166] = {
    Id = 100166,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Mod_PopUp_RemoveAllConfirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100167] = {
    Id = 100167,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Mod_PopUp_ResetPolarityConfirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100168] = {
    Id = 100168,
    Style = "common_dialog_input",
    Title = "UI_Mod_SuitNamePopUpTitle"
  },
  [100169] = {
    Id = 100169,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_PersonInfo_NotSave",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100170] = {
    Id = 100170,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Squad_DeleteReConfirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100171] = {
    Id = 100171,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Squad_SaveReConfirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100172] = {
    Id = 100172,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Squad_ExitReConfirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100173] = {
    Id = 100173,
    Style = "Common_Reward_Dialog2",
    Title = "UI_ArchiveCollectionReward"
  },
  [100174] = {
    Id = 100174,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "Pet_RarePet_ReConfirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100175] = {
    Id = 100175,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "BattleWheel_RemoveAllConfirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100176] = {
    Id = 100176,
    Style = "common_dialog_input",
    Title = "UI_Mod_SuitNamePopUpTitle"
  },
  [100177] = {
    Id = 100177,
    PopoverText = "UI_DailyGoal_RefreshReminder",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100151",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100178] = {
    Id = 100178,
    Style = "Common_Reward_Dialog",
    Title = "UI_Fishing_FishCollectReward"
  },
  [100179] = {
    Id = 100179,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_BattlePass_ClaimConfirm",
    Style = "ShortTextDefault",
    Title = "UI_BattlePass_ClaimConfirmTitle",
    YesButtonText = "UI_BattlePass_ClaimConfirmButton"
  },
  [100180] = {
    Id = 100180,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "Tips_EastNight_Start",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100181] = {
    Id = 100181,
    Style = "DailyDetailDialog",
    Title = "UI_DailyGoal_RewardView"
  },
  [100182] = {
    Id = 100182,
    NoButtonText = "UI_PATCH_CANCEL",
    NotShowCloseButton = 1,
    Style = "Armory_Mod_Import_Dialog",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_MODIMPORT_ENSURE"
  },
  [100183] = {
    Id = 100183,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "BattlePassDialog",
    TabCoin = {100},
    Title = "UI_BattlePass_BuyLevel",
    YesButtonForbiddenToast = "UI_BattlePass_BuyLevelLackMoney",
    YesButtonText = "UI_BattlePass_BuyLevelConfirm"
  },
  [100184] = {
    Id = 100184,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_BattlePass_JumptoPetReward",
    Style = "ShortTextDefault",
    Title = "UI_BattlePass_PetClaimTitle",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100185] = {
    Id = 100185,
    Style = "AP_Dialog",
    Title = "UI_COMMONPOP_TITLE_100083"
  },
  [100186] = {
    Id = 100186,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_PatchFix_Popup",
    Style = "ShortTextDefault",
    Title = "UI_PatchFix_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100187] = {
    Id = 100187,
    NotShowCloseButton = 1,
    Style = "lineup_changes_Dialog",
    Title = "Abyss_PartySetup_Change",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100188] = {
    Id = 100188,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_RougeMiniGame_ClaimConfirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100189] = {
    Id = 100189,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "Abyss_InfiniteNode_Popup",
    Style = "Unlock_node_level_Dialog",
    Title = "Abyss_InfiniteNode_UNLOCKED",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100190] = {
    Id = 100190,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_OPTION_Gamepad_PresetConfirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100191] = {
    Id = 100191,
    ShowQuitTip = 1,
    Style = "Abyss_Last_season_review_Dialog",
    Title = "Abyss_SeasonReview"
  },
  [100192] = {
    Id = 100192,
    ShowQuitTip = 1,
    Style = "LongTextDefault_1",
    Title = "UI_GACHA_RULE"
  },
  [100193] = {
    Id = 100193,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "Chat_DontDisturbContent_Dialog",
    Tip = {
      [1] = "UI_Chat_Ignore_Detail"
    },
    Title = "UI_Chat_Ignore",
    YesButtonForbiddenToast = "UI_Chat_NoChange",
    YesButtonText = "UI_RegionMap_Save"
  },
  [100194] = {
    Id = 100194,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Mail_Delete_Confirm_2",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100195] = {
    Id = 100195,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Mail_Delete_Confirm_1",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100196] = {
    Id = 100196,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Mail_Unstar_Confirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100197] = {
    Id = 100197,
    Style = "Gacha_Histories"
  },
  [100198] = {
    Id = 100198,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "Shop_ExchangePart_Dialog",
    TabCoin = {99, 100},
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100198"
    },
    Title = "UI_COMMONPOP_TITLE_100198",
    YesButtonText = "UI_Exchange_Use"
  },
  [100199] = {
    Id = 100199,
    Style = "Activity_RewardPreview",
    Title = "UI_GameEvent_StarterQuest_RewardPreview"
  },
  [100200] = {
    Id = 100200,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "Impression_Shop_Confirm",
    Tip = {
      [1] = "UI_ROOT_CONDITION"
    },
    Title = "UI_Armory_Trace",
    YesButtonText = "UI_UNLOCK"
  },
  [100201] = {
    Id = 100201,
    Style = "ShortTextDefault_4",
    Title = "UI_Armory_Trace"
  },
  [100202] = {
    Id = 100202,
    Style = "Play_Task_RewardPreview",
    Title = "UI_GameEvent_StarterQuest_RewardPreview"
  },
  [100203] = {
    Id = 100203,
    PopoverText = "UI_BattlePass_RefreshReminder",
    Style = "ShortTextComfirm",
    Title = "UI_BattlePass_RefreshReminder_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100204] = {
    Id = 100204,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "ZhiLiuEntrust_Jump_Tips",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100205] = {
    ExtraParams = T.RT_1,
    Id = 100205,
    NoButtonIconPath = "PaperSprite'/Game/UI/Texture/Static/Atlas/Common/T_Com_IconYes.T_Com_IconYes'",
    NoButtonRGBA = "E1B454",
    NoButtonText = "UI_PATCH_ENSURE",
    NotShowCloseButton = 1,
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonIconPath = "PaperSprite'/Game/UI/Texture/Static/Atlas/Common/T_Com_Goto.T_Com_Goto'",
    YesButtonRGBA = "6397b9",
    YesButtonText = "UI_GameEvent_Goto"
  },
  [100206] = {
    ExtraParams = T.RT_1,
    Id = 100206,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "SettingChangeKey",
    Title = "UI_COMMONPOP_TITLE_100033",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100207] = {
    Id = 100207,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "WBP_Bag_OptionalGift",
    YesButtonText = "UI_Consumable_Open_Confirm"
  },
  [100208] = {
    Id = 100208,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "WBP_Bag_OptionalProp",
    Tip = {
      [1] = "UI_Consumable_Effect_ResourcePack"
    },
    YesButtonForbiddenToast = "UI_Consumable_NotChoose",
    YesButtonText = "UI_Consumable_Get_Confirm"
  },
  [100209] = {
    Id = 100209,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "WBP_Bag_OptionalAvatar",
    Tip = {
      [1] = "UI_Consumable_Choose",
      [2] = "UI_Consumable_Effect"
    },
    YesButtonForbiddenToast = "UI_Consumable_NotChoose",
    YesButtonText = "UI_Consumable_Get_Confirm"
  },
  [100210] = {
    Id = 100210,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100211] = {
    HintText = "UI_COMMONPOP_CHECK_100027",
    Id = 100211,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_WeeklyDungeon_NoChanceConfirm",
    Style = "CheckDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100212] = {
    Id = 100212,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100213] = {
    Id = 100213,
    Style = "Common_Reward_Dialog2",
    Title = "UI_ArchiveCollectionReward"
  },
  [100214] = {
    Id = 100214,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Event_Trial_Confirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100215] = {
    Id = 100215,
    Style = "Armory_PosInfo",
    Title = "UI_Title_CharPositioning"
  },
  [100216] = {
    Id = 100216,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "Popup_Content_Abyss_BattleAgain",
    Style = "ShortTextDefault",
    Title = "Popup_Title_Abyss_BattleAgain",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100217] = {
    ExtraParams = {
      BindScript = "BluePrints.UI.UI_PC.Common.Common_Dialog.Common_Dialog_LuaModel.Common_Dialog_LuaModel_ToArmory",
      DisableEscClose = 1
    },
    Id = 100217,
    NoButtonIconPath = "PaperSprite'/Game/UI/Texture/Static/Atlas/Common/T_Com_IconYes.T_Com_IconYes'",
    NoButtonRGBA = "E1B454",
    NoButtonText = "UI_PATCH_ENSURE",
    NotShowCloseButton = 1,
    PopoverText = "UI_Content_SaiqiBossWarning",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonIconPath = "PaperSprite'/Game/UI/Texture/Static/Atlas/Common/T_Com_Goto.T_Com_Goto'",
    YesButtonRGBA = "6397b9",
    YesButtonText = "UI_BAG_Gotoarmory"
  },
  [100218] = {
    Id = 100218,
    Style = "Activity_BuffDialog"
  },
  [100219] = {
    Id = 100219,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "Pet_Break_ReConfirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100220] = {
    Id = 100220,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "Pet_Affix_Replace_ReConfirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100221] = {
    Id = 100221,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "Pet_Affix_AutoLock_ReConfirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100222] = {
    Id = 100222,
    Style = "common_dialog_input_red",
    Tip = {
      [1] = "UI_Cat_NameChangeTips"
    },
    Title = "UI_COMMONPOP_TITLE_100054"
  },
  [100223] = {
    Id = 100223,
    NoButtonText = "UI_PATCH_CANCEL",
    NotShowCloseButton = 1,
    PopoverText = "Pet_Break_ReConfirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100224] = {
    Id = 100224,
    PopoverText = "UI_Walnut_Gacha_Des_Detail",
    ShowQuitTip = 1,
    Style = "LongTextDefault_1",
    Title = "UI_Walnut_Gacha_Des"
  },
  [100225] = {
    Id = 100225,
    PopoverText = "Abyss_PopupUI_SeasonOver_Content",
    Style = "ShortTextComfirm",
    Title = "Abyss_PopupUI_SeasonOver_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100226] = {
    Id = 100226,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "PaotaiGame_Exit_Content",
    Style = "ShortTextDefault",
    Title = "PaotaiGame_Exit_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100227] = {
    Id = 100227,
    PopoverText = "UI_COMMONPOP_TEXT_100227",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100228] = {
    Id = 100228,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Dye_AutoFill",
    Style = "Invitation_Exchange",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_Dye_Exchange"
  },
  [100229] = {
    Id = 100229,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "FeinaEvent_Exit_Content",
    Style = "ShortTextDefault",
    Title = "FeinaEvent_Exit_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100230] = {
    Id = 100230,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Dye_Delete_Content",
    Style = "ShortTextDefault",
    Title = "UI_Dye_Delete_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100231] = {
    Id = 100231,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Dye_Save_Content",
    Style = "ShortTextDefault",
    Title = "UI_Dye_Save_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100232] = {
    Id = 100232,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Dye_Input_Content",
    Style = "common_dialog_input",
    Title = "UI_Dye_Input_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100233] = {
    Id = 100233,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "OverSea_Shop_RechargePart",
    Title = "UI_Shop_JP_Exchange",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100234] = {
    ExtraParams = T.RT_1,
    Id = 100234,
    NoButtonText = "UI_PATCH_CANCEL",
    NotShowCloseButton = 1,
    PopoverText = "UI_Shop_JP_Excess_Content",
    Style = "ShortTextComfirm",
    Title = "UI_Shop_JP_Excess_Title",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100235] = {
    ExtraParams = T.RT_1,
    Id = 100235,
    NoButtonText = "UI_PATCH_CANCEL",
    NotShowCloseButton = 1,
    PopoverText = "UI_Shop_KR_Confirm_Content",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100051",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100236] = {
    HintText = "UI_Shop_TW_NotRemind",
    Id = 100236,
    NoButtonText = "UI_Shop_TW_Confirm_No",
    PopoverText = "UI_Shop_TW_Confirm",
    Style = "CheckDefault",
    Title = "UI_COMMONPOP_TITLE_100051",
    YesButtonText = "UI_Shop_TW_Confirm_Yes"
  },
  [100237] = {
    Id = 100237,
    PopoverText = "UI_Event_ModDrop_Rule",
    ShowQuitTip = 1,
    Style = "LongTextDefault_1",
    Title = "UI_Common_Rule"
  },
  [100238] = {
    Id = 100238,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "DUNGEON_SYNTHESIS_133",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100239] = {
    Id = 100239,
    Style = "WBP_PersonalInfo_Title"
  },
  [100240] = {
    Id = 100240,
    ShowQuitTip = 1,
    Style = "SkinPreview_Suit",
    Title = "UI_SkinPreview_Suit"
  },
  [100241] = {
    Id = 100241,
    ShowQuitTip = 1,
    Style = "AttrRestraint_Dialog",
    Title = "UI_ElementDes"
  },
  [100242] = {
    Id = 100242,
    Style = "Gacha_DetailHistoryContent_Skin"
  },
  [100243] = {
    Id = 100243,
    Style = "Gacha_DetailContent_Skin"
  },
  [100244] = {
    Id = 100244,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "WBP_Login_OverSeaSever",
    Title = "UI_Select_Server",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100245] = {
    Id = 100245,
    ShowQuitTip = 1,
    Style = "Experience_BuffDialog",
    Title = "PlayerLevel_Buff"
  },
  [100246] = {
    Id = 100246,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Bag_Weapon_Squad",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100247] = {
    Id = 100247,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_MoneyConvertCharPiece",
    Style = "Invitation_Exchange",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100248] = {
    Id = 100248,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_LackOfMoney",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_GameEvent_Goto"
  },
  [100249] = {
    Id = 100249,
    ShowQuitTip = 1,
    Style = "Experience_EXDialog",
    Title = "PlayerLevel_ExpSource"
  },
  [100250] = {
    Id = 100250,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Consumable_Goto_Bag",
    Style = "ShortTextDefault",
    Title = "UI_Consumable_Goto_Bag_Title",
    YesButtonText = "UI_GameEvent_Goto"
  },
  [100251] = {
    Id = 100251,
    Style = "Common_Reward_Dialog",
    Title = "UI_Armory_BreakReward"
  },
  [100252] = {
    Id = 100252,
    NoButtonText = "UI_PATCH_CANCEL",
    NotShowCloseButton = 1,
    Style = "Depute_Dungeon_Ticket",
    Title = "UI_Ticket_Choose",
    YesButtonText = "UI_HardBoss_Start"
  },
  [100253] = {
    Id = 100253,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100228",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100254] = {
    Id = 100254,
    NoButtonText = "UI_OPTION_Swicth_Close",
    Style = "WBP_Set_MultipleLangContent_Dialog",
    Title = "UI_OPTION_Language_Manage"
  },
  [100255] = {
    Id = 100255,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100256] = {
    Id = 100256,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100257] = {
    Id = 100257,
    Style = "RewardWithTabDialog"
  },
  [100258] = {
    Id = 100258,
    Style = "Common_Reward_Dialog2"
  },
  [100259] = {
    Id = 100259,
    NoButtonText = "UI_PATCH_CANCEL",
    Style = "BagSellConfirm",
    Tip = {
      [1] = "UI_COMMONPOP_TEXT_100229"
    },
    Title = "UI_COMMONPOP_TITLE_100057",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100260] = {
    Id = 100260,
    NoButtonText = "UI_PATCH_CANCEL",
    NotShowCloseButton = 1,
    PopoverText = "UI_Weapon_BreakRewardAutoCollect",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100261] = {
    Id = 100261,
    Style = "Common_Reward_Dialog2"
  },
  [100262] = {
    Id = 100262,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Armory_WeaponPurchaseConfirm",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100263] = {
    Id = 100263,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_COMMONPOP_TEXT_100138",
    Style = "ShortTextDefault",
    Title = "UI_COMMONPOP_TITLE_100138",
    YesButtonText = "UI_GameEvent_Goto"
  },
  [100264] = {
    Id = 100264,
    NoButtonText = "UI_PATCH_CANCEL",
    PopoverText = "UI_Consumable_Choose_Confirm_Have_Skin",
    Style = "ResourceUseConfirm",
    Title = "UI_COMMONPOP_TITLE_100057",
    YesButtonText = "UI_PATCH_ENSURE"
  },
  [100265] = {
    ExtraParams = T.RT_1,
    Id = 100265,
    NotShowCloseButton = 1,
    PopoverText = "UI_Login_Waiting",
    Style = "ShortTextComfirm",
    Title = "UI_COMMONPOP_TITLE_100010",
    YesButtonText = "UI_PATCH_ENSURE"
  }
})
