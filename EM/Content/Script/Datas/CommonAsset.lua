local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CommonAsset", {
  All = {
    AssetPath = {
      [1] = {
        Path = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_Interactive_P.WBP_Battle_Interactive_P_C'",
        PlatformName = "PC"
      },
      [2] = {
        Path = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/WBP_Battle_Interactive_M.WBP_Battle_Interactive_M_C'",
        PlatformName = "Mobile"
      },
      [3] = {
        Path = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_BlackScreen.WBP_Com_BlackScreen'"
      },
      [4] = {
        Path = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Drops/WBP_Battle_SpecialDrops.WBP_Battle_SpecialDrops_C'"
      },
      [5] = {
        Path = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Drops/WBP_Battle_Drops.WBP_Battle_Drops_C'"
      },
      [6] = {
        Path = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Drops/WBP_Battle_DropItem.WBP_Battle_DropItem_C'"
      },
      [7] = {
        Path = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/PC/WBP_Com_ToastList_P.WBP_Com_ToastList_P_C'",
        PlatformName = "PC"
      },
      [8] = {
        Path = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/Mobile/WBP_Com_ToastList_M.WBP_Com_ToastList_M_C'",
        PlatformName = "Mobile"
      }
    },
    Type = "All"
  },
  Dungeon = {
    AssetPath = {
      [1] = {
        Path = "WidgetBlueprint'/Game/UI/WBP/Settlement/Widget/WBP_Settlement_BlackScreen.WBP_Settlement_BlackScreen'"
      }
    },
    Type = "Dungeon"
  },
  Region = {Type = "Region"}
})
