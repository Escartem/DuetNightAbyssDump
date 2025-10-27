local T = {}
T.RT_1 = {
  [1] = "Text01"
}
T.RT_2 = {
  [1] = "Item_Tip3"
}
T.RT_3 = {
  [1] = "Short_Text",
  [2] = "ItemSubsize"
}
T.RT_4 = {
  [1] = "Item_Currency"
}
T.RT_5 = {
  [1] = "Item_Tip1"
}
T.RT_6 = {
  [1] = "Item_Tip3",
  [2] = "Item_Tip2"
}
T.RT_7 = {
  [1] = "DailyDetail"
}
T.RT_8 = {
  [1] = "Dialog_Ticket"
}
T.RT_9 = {
  [1] = "Dialog_Input_new"
}
T.RT_10 = {
  [1] = "Item_Tip2"
}
T.RT_11 = {
  [1] = "Text02"
}
T.RT_12 = {
  [1] = "ChangeKey"
}
T.RT_13 = {
  [1] = "Shop_BuyPackagePart"
}
T.RT_14 = {
  [1] = "Shop_BuySinglePart"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CommonPopupUIStyle", {
  AP_Dialog = {
    ShowContent = {
      [1] = "ActionPoint_Dialog"
    },
    StyleId = "AP_Dialog"
  },
  Abyss_Last_season_review_Dialog = {
    BigSize = true,
    ShowContent = {
      [1] = "Abyss_DialogReview"
    },
    ShowTip = {
      [1] = "DialogReview_Tip"
    },
    StyleId = "Abyss_Last_season_review_Dialog"
  },
  Activity_BuffDialog = {
    ShowContent = {
      [1] = "WBP_Activity_BuffDialog"
    },
    StyleId = "Activity_BuffDialog"
  },
  Activity_RewardPreview = {
    ShowContent = {
      [1] = "Activity_RewardPreview_1"
    },
    StyleId = "Activity_RewardPreview"
  },
  AlertDefault = {
    ShowContent = T.RT_1,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_2,
    StyleId = "AlertDefault"
  },
  Angling_RodSelect = {
    BigSize = true,
    ShowContent = {
      [1] = "Angling_Rod"
    },
    StyleId = "Angling_RodSelect",
    UseTabTitle = true
  },
  Announcement = {
    ShowContent = {
      [1] = "Announcement_1"
    },
    StyleId = "Announcement"
  },
  Announcement_new = {
    BigSize = true,
    ShowContent = {
      [1] = "Announcement"
    },
    StyleId = "Announcement_new",
    UseTabTitle = true
  },
  Armory_Mod_Import_Dialog = {
    ShowContent = {
      [1] = "Text04_ListView"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    StyleId = "Armory_Mod_Import_Dialog"
  },
  Armory_PosInfo = {
    ShowContent = {
      [1] = "WBP_Armory_PosInfoDialog"
    },
    StyleId = "Armory_PosInfo"
  },
  AttrRestraint_Dialog = {
    ShowContent = {
      [1] = "WBP_Armory_AttrRestraintDialog"
    },
    StyleId = "AttrRestraint_Dialog"
  },
  BagSellConfirm = {
    ShowContent = T.RT_3,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = {
      [1] = "Item_Tip2",
      [2] = "Item_Tip1"
    },
    StyleId = "BagSellConfirm"
  },
  BattlePassDialog = {
    BigSize = true,
    ShowContent = {
      [1] = "BattlePassLevelPurchase"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_4,
    StyleId = "BattlePassDialog"
  },
  ChangeBirth_1 = {
    ShowContent = {
      [1] = "Dialog_Birth"
    },
    ShowLeftButton = 1,
    ShowRightButton = 2,
    ShowTip = T.RT_5,
    StyleId = "ChangeBirth_1"
  },
  Chat_DontDisturbContent_Dialog = {
    ShowContent = {
      [1] = "Chat_DontDisturbContent"
    },
    ShowLeftButton = 1,
    ShowRightButton = 2,
    StyleId = "Chat_DontDisturbContent_Dialog"
  },
  Chat_QuickAnswerEdit = {
    ShowContent = {
      [1] = "Chat_QuickAnswerEdit_1"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_6,
    StyleId = "Chat_QuickAnswerEdit"
  },
  Chat_Report = {
    ShowContent = {
      [1] = "Chat_Report_1"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_6,
    StyleId = "Chat_Report"
  },
  CheckDefault = {
    ShowContent = T.RT_1,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = {
      [1] = "Item_SelectHint"
    },
    StyleId = "CheckDefault"
  },
  CombatData = {
    ShowContent = {
      [1] = "CombatData_List"
    },
    StyleId = "CombatData"
  },
  CommonDialogAttr2 = {
    ShowContent = {
      [1] = "Common_Dialog_Attr_2"
    },
    StyleId = "CommonDialogAttr2"
  },
  Common_Reward_Dialog = {
    BigSize = true,
    ShowBG = "CommonDialogBgEffect",
    ShowContent = {
      [1] = "Common_Reward"
    },
    StyleId = "Common_Reward_Dialog"
  },
  Common_Reward_Dialog2 = {
    BigSize = true,
    ShowBG = "CommonDialogBgEffect",
    ShowContent = {
      [1] = "Common_Reward2"
    },
    StyleId = "Common_Reward_Dialog2"
  },
  DailyDetailDialog = {
    ShowContent = T.RT_7,
    StyleId = "DailyDetailDialog"
  },
  DeputeDetailDialog = {
    ShowContent = {
      [1] = "DeputeDetail"
    },
    StyleId = "DeputeDetailDialog"
  },
  Depute_Dungeon_Ticket = {
    BigSize = true,
    ShowContent = T.RT_8,
    ShowRightButton = 1,
    ShowTip = T.RT_5,
    StyleId = "Depute_Dungeon_Ticket"
  },
  Depute_Ticket = {
    BigSize = true,
    ShowContent = T.RT_8,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_5,
    StyleId = "Depute_Ticket"
  },
  Dispatch_CharDispatchAbility = {
    ShowContent = {
      [1] = "DispatchAbility"
    },
    StyleId = "Dispatch_CharDispatchAbility"
  },
  Dispatch_RewardPreview = {
    ShowContent = {
      [1] = "RewardPreview_icon"
    },
    StyleId = "Dispatch_RewardPreview"
  },
  Dye_dialog_input = {
    ShowContent = T.RT_9,
    StyleId = "Dye_dialog_input"
  },
  EliteDropDialog = {
    ShowContent = {
      [1] = "EliteDrop"
    },
    StyleId = "EliteDropDialog"
  },
  Experience_BuffDialog = {
    BigSize = true,
    ShowContent = {
      [1] = "WBP_Experience_BuffDialog"
    },
    StyleId = "Experience_BuffDialog"
  },
  Experience_EXDialog = {
    ShowContent = {
      [1] = "WBP_Experience_EXDialog"
    },
    StyleId = "Experience_EXDialog"
  },
  Filter = {
    BigSize = true,
    ShowContent = {
      [1] = "Multiple_selection_Button"
    },
    ShowLeftButton = 2,
    ShowRightButton = 1,
    StyleId = "Filter"
  },
  ForgeCancelProduce = {
    ShowContent = {
      [1] = "ItemSubsize"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_5,
    StyleId = "ForgeCancelProduce"
  },
  ForgeConfirm = {
    ShowContent = T.RT_1,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_10,
    StyleId = "ForgeConfirm"
  },
  Forging_BatchDialog = {
    ShowContent = {
      [1] = "Forging_Batch"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = {
      [1] = "Item_ForgingCostTip"
    },
    StyleId = "Forging_BatchDialog"
  },
  Forging_TerminateDialog = {
    ShowContent = {
      [1] = "Forging_Terminate"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    StyleId = "Forging_TerminateDialog"
  },
  Friend_Information = {
    BigSize = true,
    ShowContent = {
      [1] = "List_Friend"
    },
    StyleId = "Friend_Information"
  },
  Gacha_Detail = {
    BigSize = true,
    ShowContent = {
      [1] = "Gacha_DetailContent"
    },
    StyleId = "Gacha_Detail",
    UseTabTitle = true
  },
  Gacha_DetailContent_Skin = {
    BigSize = true,
    ShowContent = {
      [1] = "WBP_Gacha_DetailContent_Skin"
    },
    StyleId = "Gacha_DetailContent_Skin",
    UseTabTitle = true
  },
  Gacha_DetailHistoryContent_Skin = {
    BigSize = true,
    ShowContent = {
      [1] = "WBP_Gacha_DetailHistoryContent_Skin"
    },
    StyleId = "Gacha_DetailHistoryContent_Skin",
    UseTabTitle = true
  },
  Gacha_Histories = {
    ShowContent = {
      [1] = "Gacha_History"
    },
    StyleId = "Gacha_Histories",
    UseTabTitle = true
  },
  Gacha_details = {
    ShowContent = {
      [1] = "Group_Tab",
      [2] = "Gacha_Details_PC"
    },
    StyleId = "Gacha_details"
  },
  Gacha_history = {
    ShowContent = {
      [1] = "Gacha_Dialog_Record"
    },
    ShowFlipPage = 1,
    StyleId = "Gacha_history"
  },
  Gacha_history_Empty = {
    ShowContent = {
      [1] = "Text_Dummy_Status"
    },
    StyleId = "Gacha_history_Empty"
  },
  Impression_Shop_Confirm = {
    ShowContent = T.RT_3,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_2,
    StyleId = "Impression_Shop_Confirm"
  },
  Impression_Shop_Confirm_1 = {
    ShowContent = T.RT_3,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_4,
    StyleId = "Impression_Shop_Confirm_1"
  },
  Invitation_Exchange = {
    ShowContent = {
      [1] = "Text01",
      [2] = "ItemExchange"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    StyleId = "Invitation_Exchange"
  },
  Levelup_1 = {
    ShowContent = {
      [1] = "Levelup_num",
      [2] = "Levelup_Attr",
      [3] = "ItemSubsize_Levelup"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_2,
    StyleId = "Levelup_1"
  },
  Levelup_2 = {
    ShowContent = {
      [1] = "Levelup_Star",
      [2] = "Levelup_Attr",
      [3] = "ItemSubsize_Levelup"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_2,
    StyleId = "Levelup_2"
  },
  Levelup_3 = {
    ShowContent = {
      [1] = "Levelup_Mod",
      [2] = "ItemSubsize_Levelup"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_2,
    StyleId = "Levelup_3"
  },
  LongTextDefault = {
    ShowContent = T.RT_11,
    ShowLeftButton = 1,
    StyleId = "LongTextDefault"
  },
  LongTextDefault_1 = {
    ShowContent = T.RT_11,
    StyleId = "LongTextDefault_1"
  },
  LongTextDefault_2 = {
    ShowContent = T.RT_11,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    StyleId = "LongTextDefault_2"
  },
  LongTextDefault_Line = {
    ShowContent = {
      [1] = "Text03_ListView"
    },
    StyleId = "LongTextDefault_Line"
  },
  Menu_Head_Dialog = {
    BigSize = true,
    ShowContent = {
      [1] = "Menu_Head"
    },
    StyleId = "Menu_Head_Dialog",
    UseTabTitle = true
  },
  OverSea_Shop_Brithday = {
    ShowContent = {
      [1] = "WBP_Shop_Brithday "
    },
    StyleId = "OverSea_Shop_Brithday "
  },
  OverSea_Shop_RechargePart = {
    ShowContent = {
      [1] = "WBP_Shop_RechargePart"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_5,
    StyleId = "OverSea_Shop_RechargePart"
  },
  Play_Task_RewardPreview = {
    ShowContent = {
      [1] = "WBP_Play_Task_RewardPreview"
    },
    StyleId = "Play_Task_RewardPreview"
  },
  ResourceUseConfirm = {
    ShowContent = T.RT_3,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    StyleId = "ResourceUseConfirm"
  },
  RewardWithTabDialog = {
    ShowContent = T.RT_7,
    StyleId = "RewardWithTabDialog",
    UseTabTitle = true
  },
  SettingChangeKey = {
    ShowContent = T.RT_12,
    ShowLeftButton = 1,
    ShowRightButton = 2,
    ShowTip = {
      [1] = "Item_Tip1",
      [2] = "Item_Tip2",
      [3] = "Item_Tip3"
    },
    StyleId = "SettingChangeKey"
  },
  SettingChangeKey_1 = {
    ShowContent = T.RT_12,
    ShowLeftButton = 1,
    ShowRightButton = 2,
    ShowTip = T.RT_5,
    StyleId = "SettingChangeKey_1"
  },
  SettingChangeKey_2 = {
    ShowContent = T.RT_12,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_5,
    StyleId = "SettingChangeKey_2"
  },
  SettingChangeKey_3 = {
    ShowContent = T.RT_12,
    ShowLeftButton = 1,
    ShowRightButton = 2,
    ShowTip = T.RT_2,
    StyleId = "SettingChangeKey_3"
  },
  SettingChangeKey_4 = {
    ShowContent = T.RT_12,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_10,
    StyleId = "SettingChangeKey_4"
  },
  Shop_BuyPackagePart_1 = {
    ShowContent = T.RT_13,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_4,
    StyleId = "Shop_BuyPackagePart_1"
  },
  Shop_BuyPackagePart_2 = {
    ShowContent = T.RT_13,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_2,
    StyleId = "Shop_BuyPackagePart_2"
  },
  Shop_BuySinglePart_1 = {
    ShowContent = T.RT_14,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_4,
    StyleId = "Shop_BuySinglePart_1"
  },
  Shop_BuySinglePart_2 = {
    ShowContent = T.RT_14,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_2,
    StyleId = "Shop_BuySinglePart_2"
  },
  Shop_ExchangePart_Dialog = {
    ShowContent = {
      [1] = "Shop_ExchangePart"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = {
      [1] = "Item_Currency",
      [2] = "Item_Tip3"
    },
    StyleId = "Shop_ExchangePart_Dialog"
  },
  ShortTextComfirm = {
    ShowContent = T.RT_1,
    ShowRightButton = 1,
    StyleId = "ShortTextComfirm"
  },
  ShortTextDefault = {
    ShowContent = T.RT_1,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    StyleId = "ShortTextDefault"
  },
  ShortTextDefault_1 = {
    ShowContent = T.RT_1,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    StyleId = "ShortTextDefault_1"
  },
  ShortTextDefault_2 = {
    ShowContent = T.RT_1,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_2,
    StyleId = "ShortTextDefault_2"
  },
  ShortTextDefault_3 = {
    ShowContent = T.RT_1,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_5,
    StyleId = "ShortTextDefault_3"
  },
  ShortTextDefault_4 = {
    ShowContent = T.RT_1,
    StyleId = "ShortTextDefault_4"
  },
  SkinPreview_Suit = {
    ShowContent = {
      [1] = "WBP_SkinPreview_Suit"
    },
    StyleId = "SkinPreview_Suit"
  },
  TestStyle = {
    ShowContent = T.RT_1,
    ShowLeftButton = 1,
    ShowRightButton = 1,
    StyleId = "TestStyle",
    UseTabTitle = true
  },
  Unlock_node_level_Dialog = {
    ShowContent = {
      [1] = "Unlock_node_level"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    StyleId = "Unlock_node_level_Dialog"
  },
  WBP_Bag_OptionalAvatar = {
    BigSize = true,
    ShowContent = {
      [1] = "WBP_Bag_OptionalAvatar_Content"
    },
    ShowLeftButton = 1,
    ShowRightButton = 2,
    ShowTip = T.RT_5,
    StyleId = "WBP_Bag_OptionalAvatar"
  },
  WBP_Bag_OptionalGift = {
    ShowContent = {
      [1] = "WBP_Bag_OptionalGift_Content"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    StyleId = "WBP_Bag_OptionalGift"
  },
  WBP_Bag_OptionalProp = {
    ShowContent = {
      [1] = "WBP_Bag_OptionalProp_Content"
    },
    ShowLeftButton = 1,
    ShowRightButton = 2,
    ShowTip = T.RT_5,
    StyleId = "WBP_Bag_OptionalProp"
  },
  WBP_Login_OverSeaSever = {
    ShowContent = {
      [1] = "WBP_Login_OverSeaSeverContent"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    StyleId = "WBP_Login_OverSeaSever"
  },
  WBP_PersonalInfo_Title = {
    BigSize = true,
    ShowContent = {
      [1] = "WBP_PersonalInfo_Title_Content"
    },
    StyleId = "WBP_PersonalInfo_Title",
    UseTabTitle = true
  },
  WBP_Set_MultipleLangContent_Dialog = {
    ShowContent = {
      [1] = "WBP_Set_MultipleLangContent"
    },
    ShowLeftButton = 1,
    ShowRightButton = 2,
    StyleId = "WBP_Set_MultipleLangContent_Dialog"
  },
  WeaponResolveDialog = {
    ShowContent = {
      [1] = "WeaponResolve"
    },
    ShowLeftButton = 1,
    ShowRightButton = 1,
    ShowTip = T.RT_2,
    StyleId = "WeaponResolveDialog"
  },
  catching_pets = {
    ShowContent = {
      [1] = "catching_pets_Probability_statement"
    },
    StyleId = "catching_pets"
  },
  common_dialog_input = {
    ShowContent = T.RT_9,
    ShowLeftButton = 1,
    ShowRightButton = 2,
    ShowTip = {
      [1] = "Item_Tip3",
      [2] = "Item_Tip2",
      [3] = "Item_Tip1"
    },
    StyleId = "common_dialog_input"
  },
  common_dialog_input_red = {
    ShowContent = T.RT_9,
    ShowLeftButton = 1,
    ShowRightButton = 2,
    ShowTip = T.RT_2,
    StyleId = "common_dialog_input_red"
  },
  lineup_changes_Dialog = {
    ShowContent = {
      [1] = "lineup_changes"
    },
    ShowRightButton = 1,
    StyleId = "lineup_changes_Dialog"
  }
})
