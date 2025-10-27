local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("WidgetUI", {
  AbyssEventMainTitle = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Widget/Abyss/WBP_Activity_Abyss_Title.WBP_Activity_Abyss_Title'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Widget/Abyss/WBP_Activity_Abyss_Title.WBP_Activity_Abyss_Title'",
    UIName = "AbyssEventMainTitle"
  },
  AbyssLineup = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/PC/WBP_Abyss_Lineup_P.WBP_Abyss_Lineup_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/Mobile/WBP_Abyss_Lineup_M.WBP_Abyss_Lineup_M'",
    UIName = "AbyssLineup"
  },
  AbyssMain = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/PC/WBP_Abyss_Main_P.WBP_Abyss_Main_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/Mobile/WBP_Abyss_Main_M.WBP_Abyss_Main_M'",
    UIName = "AbyssMain"
  },
  AbyssMainTitle = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Title/WBP_Rouge_LightLessChasm.WBP_Rouge_LightLessChasm'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Title/WBP_Rouge_LightLessChasm.WBP_Rouge_LightLessChasm'",
    UIName = "AbyssMainTitle"
  },
  AbyssModeSelection = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/Widget/WBP_Abyss_ModeSelection.WBP_Abyss_ModeSelection'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/Widget/WBP_Abyss_ModeSelection.WBP_Abyss_ModeSelection'",
    UIName = "AbyssModeSelection"
  },
  AbyssSelect = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/PC/WBP_Abyss_Select_P.WBP_Abyss_Select_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Abyss/Mobile/WBP_Abyss_Select_M.WBP_Abyss_Select_M'",
    UIName = "AbyssSelect"
  },
  ActivityFeinaEventLevelDetail = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/PC/FeinaEvent/WBP_Activity_FeinaEvent_LevelDetail_P.WBP_Activity_FeinaEvent_LevelDetail_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Mobile/FeinaEvent/WBP_Activity_FeinaEvent_LevelDetail_M.WBP_Activity_FeinaEvent_LevelDetail_M'",
    UIName = "ActivityFeinaEventLevelDetail",
    ZOrder = 57
  },
  ActivityFortBattle = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Widget/Fort/WBP_Activity_Fort_Battle.WBP_Activity_Fort_Battle'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Widget/Fort/WBP_Activity_Fort_Battle.WBP_Activity_Fort_Battle'",
    UIName = "ActivityFortBattle"
  },
  ActivityTryOutAvatarNeed = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Widget/TryOut/WBP_Activity_TryOut_AvatarNeed.WBP_Activity_TryOut_AvatarNeed'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Widget/TryOut/WBP_Activity_TryOut_AvatarNeed.WBP_Activity_TryOut_AvatarNeed'",
    UIName = "ActivityTryOutAvatarNeed"
  },
  AddFriend = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Friend/Widget/WBP_Friend_AddList.WBP_Friend_AddList'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Friend/Widget/WBP_Friend_AddList.WBP_Friend_AddList'",
    UIName = "AddFriend"
  },
  AimLock = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_AimLocked.WBP_Battle_AimLocked'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_AimLocked.WBP_Battle_AimLocked'",
    UIName = "AimLock"
  },
  AnnouncementDefaultContent = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Announcement/Widget/WBP_Announcement_DefaultContent.WBP_Announcement_DefaultContent'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Announcement/Widget/WBP_Announcement_DefaultContent.WBP_Announcement_DefaultContent'",
    UIName = "AnnouncementDefaultContent"
  },
  ArchiveShowItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Archive/Widget/WBP_Archive_ShowItem.WBP_Archive_ShowItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Archive/Widget/WBP_Archive_ShowItem.WBP_Archive_ShowItem'",
    UIName = "ArchiveShowItem"
  },
  ArmoryAddKey = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Unit/WBP_Armory_Add.WBP_Armory_Add'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Unit/WBP_Armory_Add.WBP_Armory_Add'",
    UIName = "ArmoryAddKey"
  },
  ArmoryCharAttribute = {
    UIName = "ArmoryCharAttribute"
  },
  ArmoryCommonLvUp = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Intensify/WBP_Armory_Upgrade.WBP_Armory_Upgrade'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Intensify/WBP_Armory_Upgrade.WBP_Armory_Upgrade'",
    UIName = "ArmoryCommonLvUp"
  },
  ArmoryModBreakLvUp = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Mod/WBP_Armory_ModEnhance.WBP_Armory_ModEnhance'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Mod/WBP_Armory_ModEnhance.WBP_Armory_ModEnhance'",
    UIName = "ArmoryModBreakLvUp"
  },
  ArmoryModItemDetails = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Mod.WBP_Com_Tips_Mod'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Mod.WBP_Com_Tips_Mod'",
    UIName = "ArmoryModItemDetails"
  },
  ArmoryModItemDrag = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Mod/WBP_Armory_Mod_Mid.WBP_Armory_Mod_Mid'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Mod/WBP_Armory_Mod_Mid.WBP_Armory_Mod_Mid'",
    UIName = "ArmoryModItemDrag"
  },
  ArmoryModItemLink = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Mod/WBP_Armory_Mod_Effect.WBP_Armory_Mod_Effect'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Mod/WBP_Armory_Mod_Effect.WBP_Armory_Mod_Effect'",
    UIName = "ArmoryModItemLink"
  },
  ArmoryModPolarity = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Mod/WBP_Armory_Mod_Replace.WBP_Armory_Mod_Replace'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Mod/WBP_Armory_Mod_Replace.WBP_Armory_Mod_Replace'",
    UIName = "ArmoryModPolarity"
  },
  ArmoryPetAttribute = {
    UIName = "ArmoryPetAttribute"
  },
  ArmoryWeaponAttribute = {
    UIName = "ArmoryWeaponAttribute"
  },
  BattleAimAimStarButterfly = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_Butterfly.WBP_Battle_Aim_Butterfly'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_Butterfly.WBP_Battle_Aim_Butterfly'",
    UIName = "BattleAimAimStarButterfly"
  },
  BattleAimArcher = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_Archer.WBP_Battle_Aim_Archer'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_Archer.WBP_Battle_Aim_Archer'",
    UIName = "BattleAimArcher"
  },
  BattleAimBow = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_Bow.WBP_Battle_Aim_Bow'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_Bow.WBP_Battle_Aim_Bow'",
    UIName = "BattleAimBow"
  },
  BattleAimCannon = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_Cannon.WBP_Battle_Aim_Cannon'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_Cannon.WBP_Battle_Aim_Cannon'",
    UIName = "BattleAimCannon"
  },
  BattleAimCrossbow = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_CrossBow.WBP_Battle_Aim_CrossBow'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_CrossBow.WBP_Battle_Aim_CrossBow'",
    UIName = "BattleAimCrossbow"
  },
  BattleAimFire = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_Fire.WBP_Battle_Aim_Fire'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_Fire.WBP_Battle_Aim_Fire'",
    UIName = "BattleAimFire"
  },
  BattleAimRifle = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_Rifle.WBP_Battle_Aim_Rifle'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_Rifle.WBP_Battle_Aim_Rifle'",
    UIName = "BattleAimRifle"
  },
  BattleAimShotgun = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_ShotGun.WBP_Battle_Aim_ShotGun'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_ShotGun.WBP_Battle_Aim_ShotGun'",
    UIName = "BattleAimShotgun"
  },
  BattleAimThunder = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_Thunder.WBP_Battle_Aim_Thunder'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_Thunder.WBP_Battle_Aim_Thunder'",
    UIName = "BattleAimThunder"
  },
  BattleAimTrackingBow = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_TrackingBow.WBP_Battle_Aim_TrackingBow'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim_TrackingBow.WBP_Battle_Aim_TrackingBow'",
    UIName = "BattleAimTrackingBow"
  },
  BattleAmmoBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/Ammo/WBP_Battle_Ammo.WBP_Battle_Ammo'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/Ammo/WBP_Battle_Ammo.WBP_Battle_Ammo'",
    UIName = "BattleAmmoBar"
  },
  BattleAmmoSingle = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/Ammo/WBP_Battle_AmmoSingle.WBP_Battle_AmmoSingle'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/Ammo/WBP_Battle_AmmoSingle.WBP_Battle_AmmoSingle'",
    UIName = "BattleAmmoSingle"
  },
  BattleAmmoUnlimitedSingle = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/Ammo/WBP_Battle_AmmoUnlimited.WBP_Battle_AmmoUnlimited'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/Ammo/WBP_Battle_AmmoUnlimited.WBP_Battle_AmmoUnlimited'",
    UIName = "BattleAmmoUnlimitedSingle"
  },
  BattleEntry = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Entry.WBP_Battle_Entry'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Entry.WBP_Battle_Entry'",
    UIName = "BattleEntry"
  },
  BattleFortBloodUI = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_FortBloodBar.WBP_Battle_FortBloodBar'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_FortBloodBar.WBP_Battle_FortBloodBar'",
    UIName = "BattleFortBloodUI"
  },
  BattleFortBtn = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/WBP_Battle_FortBtn_M.WBP_Battle_FortBtn_M'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/WBP_Battle_FortBtn_M.WBP_Battle_FortBtn_M'",
    UIName = "BattleFortBtn"
  },
  BattleKeyDescList = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Key/WBP_Com_KeyDescList.WBP_Com_KeyDescList'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Key/WBP_Com_KeyDescList.WBP_Com_KeyDescList'",
    UIName = "BattleKeyDescList"
  },
  BattleNormalDrops = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Drops/WBP_Battle_Drops.WBP_Battle_Drops'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Drops/WBP_Battle_Drops.WBP_Battle_Drops'",
    UIName = "BattleNormalDrops"
  },
  BattleObjectiveList = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Survival/WBP_Dungeon_SurvivalPoint.WBP_Dungeon_SurvivalPoint'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Survival/WBP_Dungeon_SurvivalPoint.WBP_Dungeon_SurvivalPoint'",
    UIName = "BattleObjectiveList"
  },
  BattlePassPetItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/BattlePass/Widget/WBP_BattlePass_PetOption.WBP_BattlePass_PetOption'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/BattlePass/Widget/WBP_BattlePass_PetOption.WBP_BattlePass_PetOption'",
    UIName = "BattlePassPetItem"
  },
  BattleProcessPoint = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessPoint.WBP_Battle_ProcessPoint'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessPoint.WBP_Battle_ProcessPoint'",
    UIName = "BattleProcessPoint"
  },
  BattleSpecialDrops = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Drops/WBP_Battle_SpecialDrops.WBP_Battle_SpecialDrops'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Drops/WBP_Battle_SpecialDrops.WBP_Battle_SpecialDrops'",
    UIName = "BattleSpecialDrops"
  },
  BuffBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/Unit/WBP_BuffBar_New.WBP_BuffBar_New'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/Unit/WBP_BuffBar_New.WBP_BuffBar_New'",
    UIName = "BuffBar"
  },
  BuffIcon = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_BuffCell.WBP_Battle_BuffCell'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_BuffCell.WBP_Battle_BuffCell'",
    PreCreateNum = 30,
    UIName = "BuffIcon"
  },
  CharSkillAtrrTitle = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/CharSkill/WBP_Armory_CharSkillAtrrTitle.WBP_Armory_CharSkillAtrrTitle'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/CharSkill/WBP_Armory_CharSkillAtrrTitle.WBP_Armory_CharSkillAtrrTitle'",
    UIName = "CharSkillAtrrTitle"
  },
  CharSkillAttrItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/CharSkill/WBP_Armory_CharSkillAtrr.WBP_Armory_CharSkillAtrr'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/CharSkill/WBP_Armory_CharSkillAtrr.WBP_Armory_CharSkillAtrr'",
    UIName = "CharSkillAttrItem"
  },
  ChatBattleMessage = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Chat/Widget/Dialog/WBP_Chat_SimpleChatItem.WBP_Chat_SimpleChatItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Chat/Widget/Dialog/WBP_Chat_SimpleChatItem.WBP_Chat_SimpleChatItem'",
    UIName = "ChatBattleMessage"
  },
  ChatEmoji = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Chat/Widget/Face/WBP_Chat_Face.WBP_Chat_Face'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Chat/Widget/Face/WBP_Chat_Face.WBP_Chat_Face'",
    UIName = "ChatEmoji"
  },
  ChatHeadOption = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Chat/Widget/WBP_Chat_HeadBtnList.WBP_Chat_HeadBtnList'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Chat/Widget/WBP_Chat_HeadBtnList.WBP_Chat_HeadBtnList'",
    UIName = "ChatHeadOption"
  },
  ChatQuickMsg = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Chat/Widget/QuickAnswer/WBP_Chat_QuickAnswer.WBP_Chat_QuickAnswer'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Chat/Widget/QuickAnswer/WBP_Chat_QuickAnswer.WBP_Chat_QuickAnswer'",
    UIName = "ChatQuickMsg"
  },
  ChatQuickMsgEdit = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Chat/Widget/QuickAnswer/WBP_Chat_QuickAnswerEdit.WBP_Chat_QuickAnswerEdit'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Chat/Widget/QuickAnswer/WBP_Chat_QuickAnswerEdit.WBP_Chat_QuickAnswerEdit'",
    UIName = "ChatQuickMsgEdit"
  },
  ComBgSwitch = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Bg/WBP_Com_BgSwitch.WBP_Com_BgSwitch'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Bg/WBP_Com_BgSwitch.WBP_Com_BgSwitch'",
    UIName = "ComBgSwitch"
  },
  ComClickToClose = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_ClickToClose.WBP_Com_ClickToClose'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_ClickToClose.WBP_Com_ClickToClose'",
    UIName = "ComClickToClose"
  },
  ComItemAbyssTeam = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_AbyssSelect.WBP_Com_Item_AbyssSelect'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_AbyssSelect.WBP_Com_Item_AbyssSelect'",
    UIName = "ComItemAbyssTeam"
  },
  ComItemAdd = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Add.WBP_Com_Item_Add'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Add.WBP_Com_Item_Add'",
    UIName = "ComItemAdd"
  },
  ComItemAttributeTag = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Attribute.WBP_Com_Item_Attribute'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Attribute.WBP_Com_Item_Attribute'",
    UIName = "ComItemAttributeTag"
  },
  ComItemAura = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Aura.WBP_Com_Item_Aura'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Aura.WBP_Com_Item_Aura'",
    UIName = "ComItemAura"
  },
  ComItemBonus = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Bonus.WBP_Com_Item_Bonus'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Bonus.WBP_Com_Item_Bonus'",
    UIName = "ComItemBonus"
  },
  ComItemCanGet = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Available.WBP_Com_Item_Available'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Available.WBP_Com_Item_Available'",
    UIName = "ComItemCanGet"
  },
  ComItemCardLevel = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_WeaponCardLevel.WBP_Com_Item_WeaponCardLevel'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_WeaponCardLevel.WBP_Com_Item_WeaponCardLevel'",
    UIName = "ComItemCardLevel"
  },
  ComItemConflict = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Conflict.WBP_Com_Item_Conflict'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Conflict.WBP_Com_Item_Conflict'",
    UIName = "ComItemConflict"
  },
  ComItemGroup = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Group.WBP_Com_Item_Group'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Group.WBP_Com_Item_Group'",
    UIName = "ComItemGroup"
  },
  ComItemHasGot = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Got.WBP_Com_Item_Got'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Got.WBP_Com_Item_Got'",
    UIName = "ComItemHasGot"
  },
  ComItemInGear = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_InGear.WBP_Com_Item_InGear'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_InGear.WBP_Com_Item_InGear'",
    UIName = "ComItemInGear"
  },
  ComItemLevel = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Level.WBP_Com_Item_Level'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Level.WBP_Com_Item_Level'",
    UIName = "ComItemLevel"
  },
  ComItemLock = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Lock.WBP_Com_Item_Lock'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Lock.WBP_Com_Item_Lock'",
    UIName = "ComItemLock"
  },
  ComItemLockCenter = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Locked.WBP_Com_Item_Locked'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Locked.WBP_Com_Item_Locked'",
    UIName = "ComItemLockCenter"
  },
  ComItemMinus = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Minus.WBP_Com_Item_Minus'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Minus.WBP_Com_Item_Minus'",
    UIName = "ComItemMinus"
  },
  ComItemMoney = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Money.WBP_Com_Item_Money'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Money.WBP_Com_Item_Money'",
    UIName = "ComItemMoney"
  },
  ComItemName = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Name.WBP_Com_Item_Name'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Name.WBP_Com_Item_Name'",
    UIName = "ComItemName"
  },
  ComItemNeedCount = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_NeedCount.WBP_Com_Item_NeedCount'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_NeedCount.WBP_Com_Item_NeedCount'",
    UIName = "ComItemNeedCount"
  },
  ComItemNewReddot = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_New.WBP_Com_Item_New'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_New.WBP_Com_Item_New'",
    UIName = "ComItemNewReddot"
  },
  ComItemNumber = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Number.WBP_Com_Item_Number'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Number.WBP_Com_Item_Number'",
    UIName = "ComItemNumber"
  },
  ComItemPetEntry = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_PetEntry.WBP_Com_Item_PetEntry'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_PetEntry.WBP_Com_Item_PetEntry'",
    UIName = "ComItemPetEntry"
  },
  ComItemPetRare = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Pet_Rare.WBP_Com_Item_Pet_Rare'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Pet_Rare.WBP_Com_Item_Pet_Rare'",
    UIName = "ComItemPetRare"
  },
  ComItemPetStarLevel = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_PetStar.WBP_Com_Item_PetStar'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_PetStar.WBP_Com_Item_PetStar'",
    UIName = "ComItemPetStarLevel"
  },
  ComItemPhantomTag = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_PhantomTag.WBP_Com_Item_PhantomTag'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_PhantomTag.WBP_Com_Item_PhantomTag'",
    UIName = "ComItemPhantomTag"
  },
  ComItemPolarity = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Polarity.WBP_Com_Item_Polarity'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Polarity.WBP_Com_Item_Polarity'",
    UIName = "ComItemPolarity"
  },
  ComItemRareTag = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Rare.WBP_Com_Item_Rare'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Rare.WBP_Com_Item_Rare'",
    UIName = "ComItemRareTag"
  },
  ComItemReddot = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Reddot.WBP_Com_Item_Reddot'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Reddot.WBP_Com_Item_Reddot'",
    UIName = "ComItemReddot"
  },
  ComItemSelect = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Select.WBP_Com_Item_Select'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Select.WBP_Com_Item_Select'",
    UIName = "ComItemSelect"
  },
  ComItemSelectCount = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_SelectCount.WBP_Com_Item_SelectCount'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_SelectCount.WBP_Com_Item_SelectCount'",
    UIName = "ComItemSelectCount"
  },
  ComItemSet = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Set.WBP_Com_Item_Set'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Set.WBP_Com_Item_Set'",
    UIName = "ComItemSet"
  },
  ComItemShadow = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Shadow.WBP_Com_Item_Shadow'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Shadow.WBP_Com_Item_Shadow'",
    UIName = "ComItemShadow"
  },
  ComItemStartLevel = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_StarLevel.WBP_Com_Item_StarLevel'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_StarLevel.WBP_Com_Item_StarLevel'",
    UIName = "ComItemStartLevel"
  },
  ComItemTimeLimit = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_TimeLimit.WBP_Com_Item_TimeLimit'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_TimeLimit.WBP_Com_Item_TimeLimit'",
    UIName = "ComItemTimeLimit"
  },
  ComItemTryOut = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_TryOut.WBP_Com_Item_TryOut'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_TryOut.WBP_Com_Item_TryOut'",
    UIName = "ComItemTryOut"
  },
  ComItemUniversalL = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/WBP_Com_Item_Universal_L.WBP_Com_Item_Universal_L'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/WBP_Com_Item_Universal_L.WBP_Com_Item_Universal_L'",
    UIName = "ComItemUniversalL"
  },
  ComItemUniversalM = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/WBP_Com_Item_Universal_M.WBP_Com_Item_Universal_M'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/WBP_Com_Item_Universal_M.WBP_Com_Item_Universal_M'",
    UIName = "ComItemUniversalM"
  },
  ComItemUniversalS = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/WBP_Com_Item_Universal_S.WBP_Com_Item_Universal_S'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/WBP_Com_Item_Universal_S.WBP_Com_Item_Universal_S'",
    UIName = "ComItemUniversalS"
  },
  ComItemUnreveal = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Unrevealed.WBP_Com_Item_Unrevealed'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Unrevealed.WBP_Com_Item_Unrevealed'",
    UIName = "ComItemUnreveal"
  },
  ComItemWalnutNum = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_WalnutNum.WBP_Com_Item_WalnutNum'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_WalnutNum.WBP_Com_Item_WalnutNum'",
    UIName = "ComItemWalnutNum"
  },
  ComItemWalnutTag = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_WalnutTag.WBP_Com_Item_WalnutTag'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_WalnutTag.WBP_Com_Item_WalnutTag'",
    UIName = "ComItemWalnutTag"
  },
  ComKeyTextDesc = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Key/WBP_Com_KeyTextDesc.WBP_Com_KeyTextDesc'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Key/WBP_Com_KeyTextDesc.WBP_Com_KeyTextDesc'",
    UIName = "ComKeyTextDesc"
  },
  ComLoadingCharChange = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/ChapterStart/Widget/WBP_Chapter_CharChange.WBP_Chapter_CharChange'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ChapterStart/Widget/WBP_Chapter_CharChange.WBP_Chapter_CharChange'",
    UIName = "ComLoadingCharChange"
  },
  ComLoadingXiaoBai = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Loading/Widget/WBP_Com_Loading_XiaoBai.WBP_Com_Loading_XiaoBai'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Loading/Widget/WBP_Com_Loading_XiaoBai.WBP_Com_Loading_XiaoBai'",
    UIName = "ComLoadingXiaoBai"
  },
  ComOptionalAvatarItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Bag/Widget/Optional/WBP_Bag_OptionalAvatarItem.WBP_Bag_OptionalAvatarItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Bag/Widget/Optional/WBP_Bag_OptionalAvatarItem.WBP_Bag_OptionalAvatarItem'",
    UIName = "ComOptionalAvatarItem"
  },
  ComOptionalResourceItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Bag/Widget/Optional/WBP_Bag_OptionalGiftItem.WBP_Bag_OptionalGiftItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Bag/Widget/Optional/WBP_Bag_OptionalGiftItem.WBP_Bag_OptionalGiftItem'",
    UIName = "ComOptionalResourceItem"
  },
  ComTreasureDigable = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_DigHint.WBP_Com_Item_DigHint'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_DigHint.WBP_Com_Item_DigHint'",
    UIName = "ComTreasureDigable"
  },
  CommonCost = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Cost/WBP_Com_Cost.WBP_Com_Cost'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Cost/WBP_Com_Cost.WBP_Com_Cost'",
    UIName = "CommonCost"
  },
  CommonDialogBgEffect = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Bg/WBP_Com_Bg_Effect.WBP_Com_Bg_Effect'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Bg/WBP_Com_Bg_Effect.WBP_Com_Bg_Effect'",
    UIName = "CommonDialogBgEffect"
  },
  CommonDialogCurrency = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Dialog/Widget/WBP_Com_Dialog_Currency.WBP_Com_Dialog_Currency'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Dialog/Widget/WBP_Com_Dialog_Currency.WBP_Com_Dialog_Currency'",
    UIName = "CommonDialogCurrency"
  },
  CommonDialogWidget = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Dialog/WBP_Com_Dialog.WBP_Com_Dialog'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Dialog/WBP_Com_Dialog.WBP_Com_Dialog'",
    UIName = "CommonDialogWidget"
  },
  CommonHead = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/WBP_Com_ItemHead.WBP_Com_ItemHead'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/WBP_Com_ItemHead.WBP_Com_ItemHead'",
    UIName = "CommonHead"
  },
  CommonHudBubble = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_HudBubble.WBP_Com_HudBubble'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/WBP_Com_HudBubble.WBP_Com_HudBubble'",
    UIName = "CommonHudBubble"
  },
  CommonItemDetailsEffect = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_EffectItem.WBP_Com_Tips_EffectItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_EffectItem.WBP_Com_Tips_EffectItem'",
    UIName = "CommonItemDetailsEffect"
  },
  CommonToastItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/WBP_Com_Toast.WBP_Com_Toast'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Toast/WBP_Com_Toast.WBP_Com_Toast'",
    UIName = "CommonToastItem"
  },
  DailyDetailItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Daily/Dialog/WBP_Play_DailyDetailItem.WBP_Play_DailyDetailItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Daily/Dialog/WBP_Play_DailyDetailItem.WBP_Play_DailyDetailItem'",
    UIName = "DailyDetailItem"
  },
  DailyMain = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/Task/Daily/WBP_Play_TaskDaily_P.WBP_Play_TaskDaily_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/Task/Daily/WBP_Play_TaskDaily_M.WBP_Play_TaskDaily_M'",
    UIName = "DailyMain"
  },
  DeathMask = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Death.WBP_Battle_Death'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Death.WBP_Battle_Death'",
    UIName = "DeathMask"
  },
  DeputeDetailItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/Dialog/WBP_Play_DeputeDetailItem.WBP_Play_DeputeDetailItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/Dialog/WBP_Play_DeputeDetailItem.WBP_Play_DeputeDetailItem'",
    UIName = "DeputeDetailItem"
  },
  DeputeEliteInfo = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_DeputeEliteInfo.WBP_Play_DeputeEliteInfo'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_DeputeEliteInfo.WBP_Play_DeputeEliteInfo'",
    UIName = "DeputeEliteInfo"
  },
  DeputeEvent = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_DeputeEvent.WBP_Play_DeputeEvent'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_DeputeEvent.WBP_Play_DeputeEvent'",
    UIName = "DeputeEvent"
  },
  DeputeEventIcon = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_DeputeEventIcon.WBP_Play_DeputeEventIcon'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_DeputeEventIcon.WBP_Play_DeputeEventIcon'",
    UIName = "DeputeEventIcon"
  },
  DeputeTicket = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_Depute_Ticket.WBP_Play_Depute_Ticket'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_Depute_Ticket.WBP_Play_Depute_Ticket'",
    UIName = "DeputeTicket"
  },
  DeputeTypeIcon = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_DeputeTypeIcon.WBP_Play_DeputeTypeIcon'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_DeputeTypeIcon.WBP_Play_DeputeTypeIcon'",
    UIName = "DeputeTypeIcon"
  },
  Depute_NightBook = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/Depute/NightBook/WBP_Play_DeputeNightBook_P.WBP_Play_DeputeNightBook_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/Depute/NightBook/WBP_Play_DeputeNightBook_M.WBP_Play_DeputeNightBook_M'",
    UIName = "Depute_NightBook"
  },
  Depute_Regular = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/Depute/Depute/WBP_Play_Depute_ItemList_P.WBP_Play_Depute_ItemList_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/Depute/Depute/WBP_Play_Depute_ItemList_M.WBP_Play_Depute_ItemList_M'",
    UIName = "Depute_Regular"
  },
  Depute_Walnut = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/Depute/Walnut/WBP_Play_Depute_Walnut_P.WBP_Play_Depute_Walnut_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/Depute/Walnut/WBP_Play_Depute_Walnut_M.WBP_Play_Depute_Walnut_M'",
    UIName = "Depute_Walnut"
  },
  Depute_WeeklySelectDungeon = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/Depute/Weekly/WBP_Play_DeputeWeekly_P.WBP_Play_DeputeWeekly_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/Depute/Weekly/WBP_Play_DeputeWeekly_M.WBP_Play_DeputeWeekly_M'",
    UIName = "Depute_WeeklySelectDungeon"
  },
  DescribeDetails = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Describe.WBP_Com_Tips_Describe'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Describe.WBP_Com_Tips_Describe'",
    UIName = "DescribeDetails"
  },
  DestroyTarget = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_DestroyTarget.WBP_Dungeon_DestroyTarget'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_DestroyTarget.WBP_Dungeon_DestroyTarget'",
    UIName = "DestroyTarget"
  },
  DestroyTaskBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_DestroyTaskBar.WBP_Dungeon_DestroyTaskBar'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Sabotage/WBP_Dungeon_DestroyTaskBar.WBP_Dungeon_DestroyTaskBar'",
    UIName = "DestroyTaskBar"
  },
  DimensionGraph_East = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/Widget/WBP_Impression_DimensionDrawArea_East.WBP_Impression_DimensionDrawArea_East'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/Widget/WBP_Impression_DimensionDrawArea_East.WBP_Impression_DimensionDrawArea_East'",
    UIName = "DimensionGraph_East"
  },
  DimensionGraph_Hyper = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/Widget/WBP_Impression_DimensionDrawArea.WBP_Impression_DimensionDrawArea'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/Widget/WBP_Impression_DimensionDrawArea.WBP_Impression_DimensionDrawArea'",
    UIName = "DimensionGraph_Hyper"
  },
  DispatchAgentList = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_DispatchAgentList.WBP_Map_DispatchAgentList'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_DispatchAgentList.WBP_Map_DispatchAgentList'",
    UIName = "DispatchAgentList"
  },
  DispatchDetail = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_DispatchDetail.WBP_Map_DispatchDetail'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_DispatchDetail.WBP_Map_DispatchDetail'",
    UIName = "DispatchDetail"
  },
  DispatchList = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_DispatchList.WBP_Map_DispatchList'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_DispatchList.WBP_Map_DispatchList'",
    UIName = "DispatchList"
  },
  DraftCompendiumItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Draft.WBP_Com_Item_Draft'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/WBP_Com_Item_Draft.WBP_Com_Item_Draft'",
    UIName = "DraftCompendiumItem"
  },
  DraftItemDetails = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Draft.WBP_Com_Tips_Draft'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Draft.WBP_Com_Tips_Draft'",
    UIName = "DraftItemDetails"
  },
  DungeonMapSelectMobile = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/Depute/WBP_Play_Depute_Root_M.WBP_Play_Depute_Root_M'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/Depute/WBP_Play_Depute_Root_M.WBP_Play_Depute_Root_M'",
    UIName = "DungeonMapSelectMobile"
  },
  DungeonMapSelectPC = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/Depute/WBP_Play_Depute_Root_P.WBP_Play_Depute_Root_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/Depute/WBP_Play_Depute_Root_P.WBP_Play_Depute_Root_P'",
    UIName = "DungeonMapSelectPC"
  },
  DungeonSelectLevel = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_DeputeDetailList.WBP_Play_DeputeDetailList'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/WBP_Play_DeputeDetailList.WBP_Play_DeputeDetailList'",
    UIName = "DungeonSelectLevel"
  },
  DungeonSelectMobile = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/WBP_Play_Depute_M.WBP_Play_Depute_M'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/WBP_Play_Depute_M.WBP_Play_Depute_M'",
    UIName = "DungeonSelectMobile"
  },
  DungeonSelectPC = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/WBP_Play_Depute_P.WBP_Play_Depute_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/WBP_Play_Depute_P.WBP_Play_Depute_P'",
    UIName = "DungeonSelectPC"
  },
  DungeonSettlementData = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Settlement/Widget/WBP_Settlement_Data.WBP_Settlement_Data'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Settlement/Widget/WBP_Settlement_Data.WBP_Settlement_Data'",
    UIName = "DungeonSettlementData"
  },
  DungeonSettlementTarget = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Settlement/Widget/WBP_Settlement_Target.WBP_Settlement_Target'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Settlement/Widget/WBP_Settlement_Target.WBP_Settlement_Target'",
    UIName = "DungeonSettlementTarget"
  },
  DungeonTempleRight = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_Temple_Right.WBP_Dungeon_Temple_Right'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_Temple_Right.WBP_Dungeon_Temple_Right'",
    UIName = "DungeonTempleRight"
  },
  DungeonTempleTime = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_TempleTime.WBP_Dungeon_TempleTime'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_TempleTime.WBP_Dungeon_TempleTime'",
    UIName = "DungeonTempleTime"
  },
  DynamicEvent = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/TaskBar/WBP_Battle_DynamicEvent_P.WBP_Battle_DynamicEvent_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/TaskBar/WBP_Battle_DynamicEvent_M.WBP_Battle_DynamicEvent_M'",
    UIName = "DynamicEvent"
  },
  EliteBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/Unit/WBP_EliteBar.WBP_EliteBar'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/Unit/WBP_EliteBar.WBP_EliteBar'",
    UIName = "EliteBar"
  },
  EscSystemItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Menu/Widget/WBP_Menu_FunctionBtn.WBP_Menu_FunctionBtn'",
    UIName = "EscSystemItem"
  },
  ExperienceItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Experience/Widget/WBP_Experience_Item.WBP_Experience_Item'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Experience/Widget/WBP_Experience_Item.WBP_Experience_Item'",
    UIName = "ExperienceItem"
  },
  ExperienceMainBuffItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Experience/Widget/WBP_Experience_Main_BuffItem.WBP_Experience_Main_BuffItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Experience/Widget/WBP_Experience_Main_BuffItem.WBP_Experience_Main_BuffItem'",
    UIName = "ExperienceMainBuffItem"
  },
  FeinaEventToast = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Widget/FeinaEvent/WBP_Activity_FeinaEvent_Toast.WBP_Activity_FeinaEvent_Toast'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Activity/Widget/FeinaEvent/WBP_Activity_FeinaEvent_Toast.WBP_Activity_FeinaEvent_Toast'",
    UIName = "FeinaEventToast"
  },
  FortBackKey = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_FortBackKey.WBP_Battle_FortBackKey'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/WBP_Battle_FortBackButton.WBP_Battle_FortBackButton'",
    UIName = "FortBackKey"
  },
  FriendHeadOption = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Friend/Widget/WBP_FriendFunction.WBP_FriendFunction'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Friend/Widget/WBP_FriendFunction.WBP_FriendFunction'",
    UIName = "FriendHeadOption"
  },
  GachaAnime = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/GachaNew/Widget/WBP_Gacha_Anime.WBP_Gacha_Anime'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/GachaNew/Widget/WBP_Gacha_Anime.WBP_Gacha_Anime'",
    UIName = "GachaAnime"
  },
  GachaDetails = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/GachaNew/Widget/Detail/WBP_Gacha_DetailContent.WBP_Gacha_DetailContent'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/GachaNew/Widget/Detail/WBP_Gacha_DetailContent.WBP_Gacha_DetailContent'",
    UIName = "GachaDetails"
  },
  GachaGetItemPage = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/GachaNew/Widget/WBP_Gacha_NormalDraw.WBP_Gacha_NormalDraw'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/GachaNew/Widget/WBP_Gacha_NormalDraw.WBP_Gacha_NormalDraw'",
    NeedShowInWindow = true,
    UIName = "GachaGetItemPage",
    ZOrder = 99
  },
  GachaGetItemPageSP = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/GachaNew/PC/WBP_Gacha_ExclusiveDraw_P.WBP_Gacha_ExclusiveDraw_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/GachaNew/Mobile/WBP_Gacha_ExclusiveDraw_M.WBP_Gacha_ExclusiveDraw_M'",
    UIName = "GachaGetItemPageSP"
  },
  GachaOnce = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Gacha/PC/Single/WBP_Gacha_SingleDraw_P.WBP_Gacha_SingleDraw_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Gacha/PC/Single/WBP_Gacha_SingleDraw_P.WBP_Gacha_SingleDraw_P'",
    NeedShowInWindow = true,
    UIName = "GachaOnce",
    ZOrder = 99
  },
  GachaSelect = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Gacha/Widget/Choose/WBP_Gacha_Choose_Tips.WBP_Gacha_Choose_Tips'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Gacha/Widget/Choose/WBP_Gacha_Choose_Tips.WBP_Gacha_Choose_Tips'",
    UIName = "GachaSelect"
  },
  GachaTentimes = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Gacha/PC/TenTimes/WBP_Gacha_TenTimesDraw_P.WBP_Gacha_TenTimesDraw_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Gacha/Mobile/TenTimes/WBP_Gacha_TenTimesDraw_M.WBP_Gacha_TenTimesDraw_M'",
    UIName = "GachaTentimes"
  },
  GachaUpTitle = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Gacha/Widget/WBP_Gacha_UpTitleSign.WBP_Gacha_UpTitleSign'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Gacha/Widget/WBP_Gacha_UpTitleSign.WBP_Gacha_UpTitleSign'",
    UIName = "GachaUpTitle"
  },
  GuideBlackScreenBorder = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_BlackScreen.WBP_BlackScreen'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_BlackScreen.WBP_BlackScreen'",
    NeedShowInWindow = true,
    UIName = "GuideBlackScreenBorder",
    ZOrder = 103
  },
  HPBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/Unit/WBP_HPBar_New.WBP_HPBar_New'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/Unit/WBP_HPBar_New.WBP_HPBar_New'",
    UIName = "HPBar"
  },
  HardBossMainMobile = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/HardBoss/WBP_Play_HardBoss_M.WBP_Play_HardBoss_M'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/HardBoss/WBP_Play_HardBoss_M.WBP_Play_HardBoss_M'",
    UIName = "HardBossMainMobile"
  },
  HardBossMainPC = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/HardBoss/WBP_Play_HardBoss_P.WBP_Play_HardBoss_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/HardBoss/WBP_Play_HardBoss_P.WBP_Play_HardBoss_P'",
    UIName = "HardBossMainPC"
  },
  HardBossMapTips = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_MapTips.WBP_Play_HardBoss_MapTips'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/WBP_Play_HardBoss_MapTips.WBP_Play_HardBoss_MapTips'",
    UIName = "HardBossMapTips"
  },
  HardBossOpenTitle_Haier = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/BattleOpenTitle/WBP_Play_HardBossBattleOpenTitle_Haier.WBP_Play_HardBossBattleOpenTitle_Haier'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/BattleOpenTitle/WBP_Play_HardBossBattleOpenTitle_Haier.WBP_Play_HardBossBattleOpenTitle_Haier'",
    UIName = "HardBossOpenTitle_Haier"
  },
  HardBossOpenTitle_Linen = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/BattleOpenTitle/WBP_Play_HardBossBattleOpenTitle_Linen.WBP_Play_HardBossBattleOpenTitle_Linen'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/BattleOpenTitle/WBP_Play_HardBossBattleOpenTitle_Linen.WBP_Play_HardBossBattleOpenTitle_Linen'",
    UIName = "HardBossOpenTitle_Linen"
  },
  HardBossOpenTitle_Saiqi = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/BattleOpenTitle/WBP_Play_HardBossBattleOpenTitle_Saiqi.WBP_Play_HardBossBattleOpenTitle_Saiqi'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/BattleOpenTitle/WBP_Play_HardBossBattleOpenTitle_Saiqi.WBP_Play_HardBossBattleOpenTitle_Saiqi'",
    UIName = "HardBossOpenTitle_Saiqi"
  },
  HardBossOpenTitle_Shijingzhe = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/BattleOpenTitle/WBP_Play_HardBossBattleOpenTitle_ShiJingZhe.WBP_Play_HardBossBattleOpenTitle_ShiJingZhe'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/BattleOpenTitle/WBP_Play_HardBossBattleOpenTitle_ShiJingZhe.WBP_Play_HardBossBattleOpenTitle_ShiJingZhe'",
    UIName = "HardBossOpenTitle_Shijingzhe"
  },
  HardBossOpenTitle_Xibi = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/BattleOpenTitle/WBP_Play_HardBossBattleOpenTitle_Xibi.WBP_Play_HardBossBattleOpenTitle_Xibi'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/HardBoss/BattleOpenTitle/WBP_Play_HardBossBattleOpenTitle_Xibi.WBP_Play_HardBossBattleOpenTitle_Xibi'",
    UIName = "HardBossOpenTitle_Xibi"
  },
  ImperssionResult = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/PC/WBP_ImperssionResult_P.WBP_ImperssionResult_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/Mobile/WBP_ImperssionResult_M.WBP_ImperssionResult_M'",
    UIName = "ImperssionResult"
  },
  ImpressionDimensionResult = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/Widget/WBP_Impression_DimensionResult.WBP_Impression_DimensionResult'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/Widget/WBP_Impression_DimensionResult.WBP_Impression_DimensionResult'",
    UIName = "ImpressionDimensionResult"
  },
  ImpressionShopItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/Widget/WBP_Impression_ShopItem.WBP_Impression_ShopItem_C'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Impression/Widget/WBP_Impression_ShopItem.WBP_Impression_ShopItem_C'",
    UIName = "ImpressionShopItem "
  },
  InstructionMobile = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Instruction/Mobile/WBP_Instruction_M.WBP_Instruction_M'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Instruction/Mobile/WBP_Instruction_M.WBP_Instruction_M'",
    UIName = "InstructionMobile"
  },
  InstructionPC = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Instruction/PC/WBP_Instruction_P.WBP_Instruction_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Instruction/PC/WBP_Instruction_P.WBP_Instruction_P'",
    UIName = "InstructionPC"
  },
  InteractiveCaptureMobile = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/WBP_Battle_Capture_M.WBP_Battle_Capture_M'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/WBP_Battle_Capture_M.WBP_Battle_Capture_M'",
    UIName = "InteractiveCaptureMobile"
  },
  InteractiveCapturePC = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_Capture_P.WBP_Battle_Capture_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_Capture_P.WBP_Battle_Capture_P'",
    UIName = "InteractiveCapturePC "
  },
  InteractiveItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_InteractiveItem.WBP_Battle_InteractiveItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_InteractiveItem.WBP_Battle_InteractiveItem'",
    PreCreateNum = 3,
    UIName = "InteractiveItem"
  },
  InteractiveStar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/WBP_Map_TempleStarItem.WBP_Map_TempleStarItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/WBP_Map_TempleStarItem.WBP_Map_TempleStarItem'",
    UIName = "InteractiveStar"
  },
  InvitationLoading = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Entertainment/Widget/WBP_Entertainment_EnterTopic.WBP_Entertainment_EnterTopic'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Entertainment/Widget/WBP_Entertainment_EnterTopic.WBP_Entertainment_EnterTopic'",
    UIName = "InvitationLoading"
  },
  ItemDetailAccess = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_AccessItem.WBP_Com_Tips_AccessItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_AccessItem.WBP_Com_Tips_AccessItem'",
    UIName = "ItemDetailAccess"
  },
  ItemDetailPetTextItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_PetTextItem.WBP_Com_Tips_PetTextItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_PetTextItem.WBP_Com_Tips_PetTextItem'",
    UIName = "ItemDetailPetTextItem"
  },
  ItemDetailsMain = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/WBP_Com_Tips.WBP_Com_Tips'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/WBP_Com_Tips.WBP_Com_Tips'",
    UIName = "ItemDetailsMain"
  },
  ItemShowAscend = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/Show/WBP_Item_Show_Ascend.WBP_Item_Show_Ascend'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/Show/WBP_Item_Show_Ascend.WBP_Item_Show_Ascend'",
    UIName = "ItemShowAscend"
  },
  ItemShowAttribute = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/Show/WBP_Item_Show_Attribute.WBP_Item_Show_Attribute'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/Show/WBP_Item_Show_Attribute.WBP_Item_Show_Attribute'",
    UIName = "ItemShowAttribute"
  },
  ItemShowCheckBtn = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/Show/WBP_Item_Show_CheckBtn.WBP_Item_Show_CheckBtn'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/Show/WBP_Item_Show_CheckBtn.WBP_Item_Show_CheckBtn'",
    UIName = "ItemShowCheckBtn"
  },
  ItemShowIntron = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/Show/WBP_Item_Show_Intron.WBP_Item_Show_Intron'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/Show/WBP_Item_Show_Intron.WBP_Item_Show_Intron'",
    UIName = "ItemShowIntron"
  },
  ItemShowName = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/Show/WBP_Item_Show_Name.WBP_Item_Show_Name'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/Show/WBP_Item_Show_Name.WBP_Item_Show_Name'",
    UIName = "ItemShowName"
  },
  ItemShowNew = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/Show/WBP_Item_Show_New.WBP_Item_Show_New'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/Show/WBP_Item_Show_New.WBP_Item_Show_New'",
    UIName = "ItemShowNew"
  },
  ItemShowStar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/Show/WBP_Item_Show_Star.WBP_Item_Show_Star'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/Widget/Show/WBP_Item_Show_Star.WBP_Item_Show_Star'",
    UIName = "ItemShowStar"
  },
  ItemWalnutNum = {
    BPPath = "WidgetBlueprint'/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_WalnutNum.Common_Item_Subsize_WalnutNum'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_WalnutNum.Common_Item_Subsize_WalnutNum'",
    UIName = "ItemWalnutNum"
  },
  ItemWalnutTag = {
    BPPath = "WidgetBlueprint'/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_WalnutTag.Common_Item_Subsize_WalnutTag'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/UI_PC/Common/Item_Subsize_Widget/Common_Item_Subsize_WalnutTag.Common_Item_Subsize_WalnutTag'",
    UIName = "ItemWalnutTag"
  },
  JumpShopItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/PC/JumpShop/WBP_Shop_JumpShop_Item_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Mobile/JumpShop/WBP_Shop_JumpShop_Item_M'",
    UIName = "JumpShopItem"
  },
  MapTabSubItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/Tab/WBP_Map_TabText.WBP_Map_TabText'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/Tab/WBP_Map_TabText.WBP_Map_TabText'",
    UIName = "MapTabSubItem"
  },
  MenuEntranceBtn = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Menu/Widget/WBP_Menu_EntranceBtn.WBP_Menu_EntranceBtn'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Menu/Widget/WBP_Menu_EntranceBtn.WBP_Menu_EntranceBtn'",
    UIName = "MenuEntranceBtn"
  },
  MenuEntranceBtnL = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Menu/Widget/WBP_Menu_EntranceBtn_L.WBP_Menu_EntranceBtn_L'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Menu/Widget/WBP_Menu_EntranceBtn_L.WBP_Menu_EntranceBtn_L'",
    UIName = "MenuEntranceBtnL"
  },
  MenuEntranceBtnS = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Menu/Widget/WBP_Menu_EntranceBtn_S.WBP_Menu_EntranceBtn_S'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Menu/Widget/WBP_Menu_EntranceBtn_S.WBP_Menu_EntranceBtn_S'",
    UIName = "MenuEntranceBtnS"
  },
  MiniGameArrow = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/MiGong/WBP_MiniGame_MiGongPoint.WBP_MiniGame_MiGongPoint'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/MiGong/WBP_MiniGame_MiGongPoint.WBP_MiniGame_MiGongPoint'",
    UIName = "MiniGameArrow"
  },
  MiniGameCrossBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/MiGong/WBP_MiniGame_MiGongCross.WBP_MiniGame_MiGongCross'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/MiGong/WBP_MiniGame_MiGongCross.WBP_MiniGame_MiGongCross'",
    UIName = "MiniGameCrossBar"
  },
  MiniGameEndBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/MiGong/WBP_MiniGame_MiGongEnd.WBP_MiniGame_MiGongEnd'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/MiGong/WBP_MiniGame_MiGongEnd.WBP_MiniGame_MiGongEnd'",
    UIName = "MiniGameEndBar"
  },
  MiniGameHorizonBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/MiGong/WBP_MiniGame_MiGongHorizontal.WBP_MiniGame_MiGongHorizontal'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/MiGong/WBP_MiniGame_MiGongHorizontal.WBP_MiniGame_MiGongHorizontal'",
    UIName = "MiniGameHorizonBar"
  },
  MiniGameShuifaPipe = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/ShuiFa/WBP_MiniGame_ShuiFaPipe.WBP_MiniGame_ShuiFaPipe'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/ShuiFa/WBP_MiniGame_ShuiFaPipe.WBP_MiniGame_ShuiFaPipe'",
    UIName = "MiniGameShuifaPipe"
  },
  MiniGameStartBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/MiGong/WBP_MiniGame_MiGongStart.WBP_MiniGame_MiGongStart'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/MiGong/WBP_MiniGame_MiGongStart.WBP_MiniGame_MiGongStart'",
    UIName = "MiniGameStartBar"
  },
  MiniGameVerticalBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/MiGong/WBP_MiniGame_MiGongVertical.WBP_MiniGame_MiGongVertical'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/MiGong/WBP_MiniGame_MiGongVertical.WBP_MiniGame_MiGongVertical'",
    UIName = "MiniGameVerticalBar"
  },
  ModArchiveArchive = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/PC/WBP_ModArchive_Archive_P.WBP_ModArchive_Archive_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/Mobile/WBP_ModArchive_Archive_M.WBP_ModArchive_Archive_M'",
    UIName = "ModArchiveArchive"
  },
  ModArchiveRecommend = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/PC/WBP_ModArchive_Recommend_P.WBP_ModArchive_Recommend_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/Mobile/WBP_ModArchive_Recommend_M.WBP_ModArchive_Recommend_M'",
    UIName = "ModArchiveRecommend"
  },
  ModArchiveSuitItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/WBP_Com_Item_Universal_L.WBP_Com_Item_Universal_L'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Item/WBP_Com_Item_Universal_L.WBP_Com_Item_Universal_L'",
    UIName = "ModArchiveSuitItem"
  },
  ModArchiveTabSubItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/Widget/WBP_ModArchive_TabSubItem.WBP_ModArchive_TabSubItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/Widget/WBP_ModArchive_TabSubItem.WBP_ModArchive_TabSubItem'",
    UIName = "ModArchiveTabSubItem"
  },
  ModArchiveTask = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/PC/WBP_ModArchive_Task_P.WBP_ModArchive_Task_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/Mobile/WBP_ModArchive_Task_M.WBP_ModArchive_Task_M'",
    UIName = "ModArchiveTask"
  },
  ModArchiveTaskSubItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/Widget/WBP_ModArchive_TaskSubItem.WBP_ModArchive_TaskSubItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/Widget/WBP_ModArchive_TaskSubItem.WBP_ModArchive_TaskSubItem'",
    UIName = "ModArchiveTaskSubItem"
  },
  ModArchiveTaskTips = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/Widget/WBP_ModArchive_HudTips.WBP_ModArchive_HudTips'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/ModArchive/Widget/WBP_ModArchive_HudTips.WBP_ModArchive_HudTips'",
    UIName = "ModArchiveTaskTips"
  },
  ModItemDetails = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Mod.WBP_Com_Tips_Mod'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Mod.WBP_Com_Tips_Mod'",
    UIName = "ModItemDetails"
  },
  MonthCardPage = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/PC/WBP_Shop_MonthCard_P.WBP_Shop_MonthCard_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Mobile/WBP_Shop_MonthCard_M.WBP_Shop_MonthCard_M'",
    UIName = "MonthCardPage"
  },
  MorseClue = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/Mima/WBP_MiniGame_Mima_Clue.WBP_MiniGame_Mima_Clue'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/Mima/WBP_MiniGame_Mima_Clue.WBP_MiniGame_Mima_Clue'",
    UIName = "MorseClue"
  },
  MyFriend = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Friend/Widget/WBP_Friend_MyList.WBP_Friend_MyList'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Friend/Widget/WBP_Friend_MyList.WBP_Friend_MyList'",
    UIName = "MyFriend"
  },
  NewDeputeRootMobile = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/Depute/WBP_Play_DeputeRoot_M.WBP_Play_DeputeRoot_M'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/Depute/WBP_Play_DeputeRoot_M.WBP_Play_DeputeRoot_M'",
    UIName = "NewDeputeRootMobile"
  },
  NewDeputeRootPC = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/Depute/WBP_Play_DeputeRoot_P.WBP_Play_DeputeRoot_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/Depute/WBP_Play_DeputeRoot_P.WBP_Play_DeputeRoot_P'",
    UIName = "NewDeputeRootPC"
  },
  PagePoint = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/PageTurner/WBP_Com_PagePoint'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/PageTurner/WBP_Com_PagePoint'",
    UIName = "PagePoint"
  },
  PartyEndPoint = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_MultTempleProgress_SubItem05.WBP_Dungeon_MultTempleProgress_SubItem05'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_MultTempleProgress_SubItem05.WBP_Dungeon_MultTempleProgress_SubItem05'",
    UIName = "PartyEndPoint"
  },
  PartyHead = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_MultTempleProgress_SubItem03.WBP_Dungeon_MultTempleProgress_SubItem03'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_MultTempleProgress_SubItem03.WBP_Dungeon_MultTempleProgress_SubItem03'",
    UIName = "PartyHead"
  },
  PartyHeadArrow = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_MultTempleProgress_SubItem02.WBP_Dungeon_MultTempleProgress_SubItem02'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_MultTempleProgress_SubItem02.WBP_Dungeon_MultTempleProgress_SubItem02'",
    UIName = "PartyHeadArrow"
  },
  PartyPoint = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_MultTempleProgress_SubItem01.WBP_Dungeon_MultTempleProgress_SubItem01'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_MultTempleProgress_SubItem01.WBP_Dungeon_MultTempleProgress_SubItem01'",
    UIName = "PartyPoint"
  },
  PartyProgress = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_MultTempleProgress.WBP_Dungeon_MultTempleProgress'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_MultTempleProgress.WBP_Dungeon_MultTempleProgress'",
    UIName = "PartyProgress"
  },
  PartyStartPoint = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_MultTempleProgress_SubItem04.WBP_Dungeon_MultTempleProgress_SubItem04'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Dungeon/Temple/WBP_Dungeon_MultTempleProgress_SubItem04.WBP_Dungeon_MultTempleProgress_SubItem04'",
    UIName = "PartyStartPoint"
  },
  PayGiftPage = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/PC/WBP_Shop_PayGift_P.WBP_Shop_PayGift_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Mobile/WBP_Shop_PayGift_M.WBP_Shop_PayGift_M'",
    UIName = "PayGiftPage"
  },
  PetCaptureDefenseProgress = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Pet_Capture/Widget/WBP_Pet_Capture_DefenseProgress.WBP_Pet_Capture_DefenseProgress'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Pet_Capture/Widget/WBP_Pet_Capture_DefenseProgress.WBP_Pet_Capture_DefenseProgress'",
    UIName = "PetCaptureDefenseProgress"
  },
  PetEntryItemDetails = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Pet/WBP_Armory_Pet_EntryTag.WBP_Armory_Pet_EntryTag'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Armory/Widget/Pet/WBP_Armory_Pet_EntryTag.WBP_Armory_Pet_EntryTag'",
    UIName = "PetEntryItemDetails"
  },
  PetItemDetails = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Pet.WBP_Com_Tips_Pet'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Pet.WBP_Com_Tips_Pet'",
    UIName = "PetItemDetails"
  },
  PhantomItemDetails = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Phantom.WBP_Com_Tips_Phantom'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Phantom.WBP_Com_Tips_Phantom'",
    UIName = "PhantomItemDetails"
  },
  PhantomWeaponItemDetails = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_PhantomItem.WBP_Com_Tips_PhantomItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_PhantomItem.WBP_Com_Tips_PhantomItem'",
    UIName = "PhantomWeaponItemDetails"
  },
  PlayCommonMobile = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/Common/WBP_Play_Common_Root_M.WBP_Play_Common_Root_M'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/Common/WBP_Play_Common_Root_M.WBP_Play_Common_Root_M'",
    UIName = "PlayCommonMobile"
  },
  PlayCommonPC = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/Common/WBP_Play_Common_Root_P.WBP_Play_Common_Root_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/Common/WBP_Play_Common_Root_P.WBP_Play_Common_Root_P'",
    UIName = "PlayCommonPC"
  },
  PlayTaskRoot = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/Task/WBP_Play_TaskRoot_P.WBP_Play_TaskRoot_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/Task/WBP_Play_TaskRoot_M.WBP_Play_TaskRoot_M'",
    UIName = "PlayTaskRoot"
  },
  PlayerBloodReturn = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/Unit/WBP_PlayerBloodReturn.WBP_PlayerBloodReturn'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/Lifebar/WBP_PlayerBloodReturn_M.WBP_PlayerBloodReturn_M'",
    UIName = "PlayerBloodReturn"
  },
  PlayerInvincibility = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/Unit/WBP_PlayerInvincibility.WBP_PlayerInvincibility'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/Unit/WBP_PlayerInvincibility.WBP_PlayerInvincibility'",
    UIName = "PlayerInvincibility"
  },
  ProcessEscapePoint = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessEscape_Point.WBP_Battle_ProcessEscape_Point'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessEscape_Point.WBP_Battle_ProcessEscape_Point'",
    UIName = "ProcessEscapePoint"
  },
  ProcessEscortPoint = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessEscort_Point.WBP_Battle_ProcessEscort_Point'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessEscort_Point.WBP_Battle_ProcessEscort_Point'",
    UIName = "ProcessEscortPoint"
  },
  ProcessOngoing = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessOngoing.WBP_Battle_ProcessOngoing'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessOngoing.WBP_Battle_ProcessOngoing'",
    UIName = "ProcessOngoing"
  },
  RecentMatch = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Friend/Widget/WBP_Friend_RecentList.WBP_Friend_RecentList'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Friend/Widget/WBP_Friend_RecentList.WBP_Friend_RecentList'",
    UIName = "RecentMatch"
  },
  RegionFriend = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Friend/Widget/WBP_Friend_Region.WBP_Friend_Region'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Friend/Widget/WBP_Friend_Region.WBP_Friend_Region'",
    UIName = "RegionFriend"
  },
  RegionMapChangeRegion = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Map/PC/WBP_Map_ChangeRegion_P.WBP_Map_ChangeRegion_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Mobile/WBP_Map_ChangeRegion_M.WBP_Map_ChangeRegion_M'",
    UIName = "RegionMapChangeRegion"
  },
  RegionMapConvey = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/WBP_Map_Convey.WBP_Map_Convey'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/WBP_Map_Convey.WBP_Map_Convey'",
    UIName = "RegionMapConvey"
  },
  RegionMapDispatchPointInfo = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_DispatchPointInfo.WBP_Map_DispatchPointInfo'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/Dispatch/WBP_Map_DispatchPointInfo.WBP_Map_DispatchPointInfo'",
    UIName = "RegionMapDispatchPointInfo"
  },
  RegionMapIndicator = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/WBP_Map_Indicator.WBP_Map_Indicator'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/WBP_Map_Indicator.WBP_Map_Indicator'",
    UIName = "RegionMapIndicator"
  },
  RegionMapPoint = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/WBP_Map_Point.WBP_Map_Point'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/WBP_Map_Point.WBP_Map_Point'",
    UIName = "RegionMapPoint"
  },
  RegionMapRegionInfo = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/WBP_Map_RegionInfo.WBP_Map_RegionInfo'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/WBP_Map_RegionInfo.WBP_Map_RegionInfo'",
    UIName = "RegionMapRegionInfo"
  },
  RegionMapSelect = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/WBP_Map_Select.WBP_Map_Select'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/WBP_Map_Select.WBP_Map_Select'",
    UIName = "RegionMapSelect"
  },
  RegionMapSelectItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/Interactive/WBP_Map_InteractiveItem.WBP_Map_InteractiveItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Map/Widget/Interactive/WBP_Map_InteractiveItem.WBP_Map_InteractiveItem'",
    UIName = "RegionMapSelectItem"
  },
  RegionMultiDestroyPoint = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessOverload_Point.WBP_Battle_ProcessOverload_Point'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Task_Process/WBP_Battle_ProcessOverload_Point.WBP_Battle_ProcessOverload_Point'",
    UIName = "RegionMultiDestroyPoint"
  },
  ResourceBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabResourceBar.WBP_Com_TabResourceBar'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabResourceBar.WBP_Com_TabResourceBar'",
    UIName = "ResourceBar"
  },
  ResourceBarNode = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_Tab_Node_ResourceBar.WBP_Com_Tab_Node_ResourceBar'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_Tab_Node_ResourceBar.WBP_Com_Tab_Node_ResourceBar'",
    UIName = "ResourceBarNode"
  },
  ResourceItemDetails = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Resource.WBP_Com_Tips_Resource'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Resource.WBP_Com_Tips_Resource'",
    UIName = "ResourceItemDetails"
  },
  RewardItemDetails = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Reward.WBP_Com_Tips_Reward'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Reward.WBP_Com_Tips_Reward'",
    UIName = "RewardItemDetails"
  },
  RougeArchiveEvent = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/Archive/WBP_Rougelike_Archive_Event_P.WBP_Rougelike_Archive_Event_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/Archive/WBP_Rougelike_Archive_Event_M.WBP_Rougelike_Archive_Event_M'",
    UIName = "RougeArchiveEvent"
  },
  RougeArchiveMain = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Archive/WBP_RougeLike_Archive.WBP_RougeLike_Archive'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Archive/WBP_RougeLike_Archive.WBP_RougeLike_Archive'",
    UIName = "RougeArchiveMain"
  },
  RougeArchiveStory = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/Archive/WBP_RougeLike_Archive_StoryLine_P.WBP_RougeLike_Archive_StoryLine_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/Archive/WBP_RougeLike_Archive_StoryLine_M.WBP_RougeLike_Archive_StoryLine_M'",
    UIName = "RougeArchiveStory"
  },
  RougeBagItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/CheckDetail/WBP_Rouge_CheckDetail_Item.WBP_Rouge_CheckDetail_Item'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/CheckDetail/WBP_Rouge_CheckDetail_Item.WBP_Rouge_CheckDetail_Item'",
    UIName = "RougeBagItem"
  },
  RougeDifficultyListItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/DifficultySelection/WBP_Rouge_DifficultyListItem.WBP_Rouge_DifficultyListItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/DifficultySelection/WBP_Rouge_DifficultyListItem.WBP_Rouge_DifficultyListItem'",
    UIName = "RougeDifficultyListItem"
  },
  RougeDifficultySelection = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/WBP_Rouge_DifficultySelection_P.WBP_Rouge_DifficultySelection_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/WBP_Rouge_DifficultySelection_M.WBP_Rouge_DifficultySelection_M'",
    UIName = "RougeDifficultySelection"
  },
  RougeGameCountDown = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Game/WBP_Rouge_GameCountDown.WBP_Rouge_GameCountDown'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Game/WBP_Rouge_GameCountDown.WBP_Rouge_GameCountDown'",
    UIName = "RougeGameCountDown"
  },
  RougeGameCurrency = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Game/WBP_Rouge_GameCurrency.WBP_Rouge_GameCurrency'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Game/WBP_Rouge_GameCurrency.WBP_Rouge_GameCurrency'",
    UIName = "RougeGameCurrency"
  },
  RougeGameTarget = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Game/WBP_Rouge_GameTarget.WBP_Rouge_GameTarget'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Game/WBP_Rouge_GameTarget.WBP_Rouge_GameTarget'",
    UIName = "RougeGameTarget"
  },
  RougeMain = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/WBP_Rouge_Main_P.WBP_Rouge_Main_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/WBP_Rouge_Main_M.WBP_Rouge_Main_M'",
    UIName = "RougeMain"
  },
  RougeMainTitle = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Title/WBP_Rouge_LightLessChasm.WBP_Rouge_LightLessChasm'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Title/WBP_Rouge_LightLessChasm.WBP_Rouge_LightLessChasm'",
    UIName = "RougeMainTitle"
  },
  RougeRouteItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Route/WBP_Rouge_RouteItem.WBP_Rouge_RouteItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Route/WBP_Rouge_RouteItem.WBP_Rouge_RouteItem'",
    UIName = "RougeRouteItem"
  },
  RougeSettlementBlessItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_SettlementBless.WBP_Rouge_SettlementBless'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_SettlementBless.WBP_Rouge_SettlementBless'",
    UIName = "RougeSettlementBlessItem"
  },
  RougeSettlementEventItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_SettleEvent.WBP_Rouge_SettleEvent'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_SettleEvent.WBP_Rouge_SettleEvent'",
    UIName = "RougeSettlementEventItem"
  },
  RougeSettlementTreasureItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_Treasure.WBP_Rouge_Treasure'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/WBP_Rouge_Treasure.WBP_Rouge_Treasure'",
    UIName = "RougeSettlementTreasureItem"
  },
  RougeShopItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Shop/WBP_Rouge_Shop_Item.WBP_Rouge_Shop_Item'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Widget/Shop/WBP_Rouge_Shop_Item.WBP_Rouge_Shop_Item'",
    UIName = "RougeShopItem"
  },
  RougeTalentMenu = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/TalentTree/WBP_Rouge_TalentMenu_P.WBP_Rouge_TalentMenu_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/TalentTree/WBP_Rouge_TalentMenu_M.WBP_Rouge_TalentMenu_M'",
    UIName = "RougeTalentMenu"
  },
  RougeTalentPage = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/PC/TalentTree/WBP_Rouge_TalentPage_P.WBP_Rouge_TalentPage_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/RougeLike/Mobile/TalentTree/WBP_Rouge_TalentPage_M.WBP_Rouge_TalentPage_M'",
    UIName = "RougeTalentPage"
  },
  SettingList = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Set/Widget/WBP_Set_List.WBP_Set_List'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Set/Widget/WBP_Set_List.WBP_Set_List'",
    UIName = "SettingList"
  },
  ShieldBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/Unit/WBP_ShieldBar_New.WBP_ShieldBar_New'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/Unit/WBP_ShieldBar_New.WBP_ShieldBar_New'",
    UIName = "ShieldBar"
  },
  ShopItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Widget/WBP_Shop_Item.WBP_Shop_Item'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Widget/WBP_Shop_Item.WBP_Shop_Item'",
    UIName = "ShopItem"
  },
  ShopPackageCell = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Widget/WBP_Shop_PackageCell.WBP_Shop_PackageCell'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Widget/WBP_Shop_PackageCell.WBP_Shop_PackageCell'",
    UIName = "ShopPackageCell"
  },
  ShopRechargePage = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/PC/WBP_Shop_Recharge_P.WBP_Shop_Recharge_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Shop/Mobile/WBP_Shop_Recharge_M.WBP_Shop_Recharge_M'",
    UIName = "ShopRechargePage"
  },
  SkillItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_SkillItem_P.WBP_Battle_SkillItem_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_SkillItem_P.WBP_Battle_SkillItem_P'",
    UIName = "SkillItem"
  },
  SpecialItemBonus = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tag/WBP_Com_QualityTag.WBP_Com_QualityTag'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tag/WBP_Com_QualityTag.WBP_Com_QualityTag'",
    UIName = "SpecialItemBonus"
  },
  SquadItemTips = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Build/Widget/WBP_Build_Tips.WBP_Build_Tips'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Build/Widget/WBP_Build_Tips.WBP_Build_Tips'",
    UIName = "SquadItemTips"
  },
  SquadListItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Build/Widget/WBP_Build_Default.WBP_Build_Default'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Build/Widget/WBP_Build_Default.WBP_Build_Default'",
    UIName = "SquadListItem"
  },
  StarterQuest = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/Task/NewPlayer/WBP_Play_Task_NewPlayer_P.WBP_Play_Task_NewPlayer_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/Task/NewPlayer/WBP_Play_Task_NewPlayer_M.WBP_Play_Task_NewPlayer_M'",
    UIName = "StarterQuest"
  },
  StoryImgItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_Story_ImgItem.WBP_Story_ImgItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_Story_ImgItem.WBP_Story_ImgItem'",
    UIName = "StoryImgItem"
  },
  StoryImgRecall = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_Story_ImgRecall.WBP_Story_ImgRecall'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_Story_ImgRecall.WBP_Story_ImgRecall'",
    UIName = "StoryImgRecall"
  },
  StoryInteractiveItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_Story_InteractiveItem.WBP_Story_InteractiveItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_Story_InteractiveItem.WBP_Story_InteractiveItem'",
    UIName = "StoryInteractiveItem"
  },
  SubSystemUnlock = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/Widget/WBP_Guide_SubSystemUnlock.WBP_Guide_SubSystemUnlock'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Guide/Widget/WBP_Guide_SubSystemUnlock.WBP_Guide_SubSystemUnlock'",
    UIName = "SubSystemUnlock"
  },
  SynthesisBuffItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/Weekly/WBP_Play_DeputeWeekly_Hud_BuffItem.WBP_Play_DeputeWeekly_Hud_BuffItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/Weekly/WBP_Play_DeputeWeekly_Hud_BuffItem.WBP_Play_DeputeWeekly_Hud_BuffItem'",
    UIName = "SynthesisBuffItem"
  },
  SynthesisBuffList = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/Weekly/WBP_Play_DeputeWeekly_Hud_Buff.WBP_Play_DeputeWeekly_Hud_Buff'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/Weekly/WBP_Play_DeputeWeekly_Hud_Buff.WBP_Play_DeputeWeekly_Hud_Buff'",
    UIName = "SynthesisBuffList"
  },
  SynthesisDestructionPoint = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/Weekly/WBP_Play_DeputeWeekly_Hud_ClueProgress_PointItem.WBP_Play_DeputeWeekly_Hud_ClueProgress_PointItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Widget/Depute/Weekly/WBP_Play_DeputeWeekly_Hud_ClueProgress_PointItem.WBP_Play_DeputeWeekly_Hud_ClueProgress_PointItem'",
    UIName = "SynthesisDestructionPoint"
  },
  SynthesisDestructionSubTask = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/TaskBar/WBP_Battle_TaskBar_WeeklySubTask.WBP_Battle_TaskBar_WeeklySubTask'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/TaskBar/WBP_Battle_TaskBar_WeeklySubTask.WBP_Battle_TaskBar_WeeklySubTask'",
    UIName = "SynthesisDestructionSubTask"
  },
  TabSubIconItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabSubItem04.WBP_Com_TabSubItem04'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabSubItem04.WBP_Com_TabSubItem04'",
    UIName = "TabSubIconItem"
  },
  TabSubIconTextItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabSubItem02.WBP_Com_TabSubItem02'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabSubItem02.WBP_Com_TabSubItem02'",
    UIName = "TabSubIconTextItem"
  },
  TabSubIconTextItemHorizon = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabSubItem03.WBP_Com_TabSubItem03'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabSubItem03.WBP_Com_TabSubItem03'",
    UIName = "TabSubIconTextItemHorizon"
  },
  TabSubItem6 = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabSubItem06.WBP_Com_TabSubItem06'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabSubItem06.WBP_Com_TabSubItem06'",
    UIName = "TabSubItem6"
  },
  TabSubTextItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabSubItem01.WBP_Com_TabSubItem01'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tab/Widget/WBP_Com_TabSubItem01.WBP_Com_TabSubItem01'",
    UIName = "TabSubTextItem"
  },
  TakeAimIndicator = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim.WBP_Battle_Aim'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/Aim/WBP_Battle_Aim.WBP_Battle_Aim'",
    UIName = "TakeAimIndicator"
  },
  TalkBlackScreenBorder = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_BlackScreen.WBP_BlackScreen'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Story/Widget/WBP_BlackScreen.WBP_BlackScreen'",
    NeedShowInWindow = true,
    UIName = "TalkBlackScreenBorder",
    ZOrder = 53
  },
  TaskBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/TaskBar/WBP_Battle_TaskBar_P.WBP_Battle_TaskBar_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/TaskBar/WBP_Battle_TaskBar_M.WBP_Battle_TaskBar_M'",
    UIName = "TaskBar"
  },
  TaskUnlockCondition = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Task/Widget/WBP_Task_UnlockCondition.WBP_Task_UnlockCondition'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Task/Widget/WBP_Task_UnlockCondition.WBP_Task_UnlockCondition'",
    UIName = "TaskUnlockCondition"
  },
  TeamBattleBloodBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Team/PC/WBP_Team_PlayerBar_P.WBP_Team_PlayerBar_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Mobile/WBP_Team_PlayerBar_M.WBP_Team_PlayerBar_M'",
    UIName = "TeamBattleBloodBar"
  },
  TeamBattleInfoItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Team/PC/WBP_Team_PlayerItem_P.WBP_Team_PlayerItem_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Mobile/WBP_Team_PlayerItem_M.WBP_Team_PlayerItem_M'",
    UIName = "TeamBattleInfoItem"
  },
  TeamBattleInfoPhantom = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Team/PC/WBP_Team_PhantomItem_P.WBP_Team_PhantomItem_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Mobile/WBP_Team_PhantomItem_M.WBP_Team_PhantomItem_M'",
    UIName = "TeamBattleInfoPhantom"
  },
  TeamBattleInfoWeapon = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Widget/WBP_Team_PlayerInfo.WBP_Team_PlayerInfo'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Widget/WBP_Team_PlayerInfo.WBP_Team_PlayerInfo'",
    UIName = "TeamBattleInfoWeapon"
  },
  TeamBattleMobile = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Mobile/WBP_Team_PlayerList_M.WBP_Team_PlayerList_M'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Mobile/WBP_Team_PlayerList_M.WBP_Team_PlayerList_M'",
    UIName = "TeamBattleMobile"
  },
  TeamBattleOverReach = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Overreach.WBP_Battle_Overreach'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_Overreach.WBP_Battle_Overreach'",
    UIName = "TeamBattleOverReach"
  },
  TeamBattlePC = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Team/PC/WBP_Team_PlayerList_P.WBP_Team_PlayerList_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/PC/WBP_Team_PlayerList_P.WBP_Team_PlayerList_P'",
    UIName = "TeamBattlePC"
  },
  TeamBattlePlayerDead = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_ResurrectionCoin.WBP_Battle_ResurrectionCoin'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/WBP_Battle_ResurrectionCoin.WBP_Battle_ResurrectionCoin'",
    UIName = "TeamBattlePlayerDead"
  },
  TeamHead = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Widget/WBP_Team_Head.WBP_Team_Head'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Widget/WBP_Team_Head.WBP_Team_Head'",
    UIName = "TeamHead"
  },
  TeammateBloodBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/WBP_Battle_Teammate_P.WBP_Battle_Teammate_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/WBP_Battle_Teammate_M.WBP_Battle_Teammate_M'",
    UIName = "TeammateBloodBar"
  },
  TempleItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Settlement/PC/WBP_Settlement_TempleItem_P.WBP_Settlement_TempleItem_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Settlement/Mobile/WBP_Settlement_TempleItem_M.WBP_Settlement_TempleItem_M'",
    UIName = "TempleItem"
  },
  TiaoPinDot = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/Tiaopin/WBP_MiniGame_Tiaopin_Dot.WBP_MiniGame_Tiaopin_Dot'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/Tiaopin/WBP_MiniGame_Tiaopin_Dot.WBP_MiniGame_Tiaopin_Dot'",
    UIName = "TiaoPinDot"
  },
  TiaoPinList = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/Tiaopin/WBP_MiniGame_Tiaopin_List.WBP_MiniGame_Tiaopin_List'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/MiniGame/Widget/Tiaopin/WBP_MiniGame_Tiaopin_List.WBP_MiniGame_Tiaopin_List'",
    UIName = "TiaoPinList"
  },
  ToughnessBar = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/Unit/WBP_ToughnessBar.WBP_ToughnessBar'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/HUD_Bar/Unit/WBP_ToughnessBar.WBP_ToughnessBar'",
    UIName = "ToughnessBar"
  },
  TrainingSetting_M = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/Training/WBP_Battle_TrainingSetting_M.WBP_Battle_TrainingSetting_M'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Mobile/Training/WBP_Battle_TrainingSetting_M.WBP_Battle_TrainingSetting_M'",
    UIName = "TrainingSetting_M"
  },
  TrainingSetting_P = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/Training/WBP_Battle_TrainingSetting_P.WBP_Battle_TrainingSetting_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/PC/Training/WBP_Battle_TrainingSetting_P.WBP_Battle_TrainingSetting_P'",
    UIName = "TrainingSetting_P"
  },
  VotePlayerBubble = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Widget/WBP_Team_PlayerBubble.WBP_Team_PlayerBubble'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Team/Widget/WBP_Team_PlayerBubble.WBP_Team_PlayerBubble'",
    UIName = "VotePlayerBubble"
  },
  VoteWaveReward = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Vote/Widget/WBP_Vote_WaveReward.WBP_Vote_WaveReward'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Vote/Widget/WBP_Vote_WaveReward.WBP_Vote_WaveReward'",
    UIName = "VoteWaveReward"
  },
  Walnut_LevelItem = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Play/PC/Depute/Walnut/WBP_Play_Depute_Walnut_LevelItem_P.WBP_Play_Depute_Walnut_LevelItem_P'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Play/Mobile/Depute/Walnut/WBP_Play_Depute_Walnut_LevelItem_M.WBP_Play_Depute_Walnut_LevelItem_M'",
    UIName = "Walnut_LevelItem"
  },
  WeaponItemDetailItems = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_PropertyItem.WBP_Com_Tips_PropertyItem'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_PropertyItem.WBP_Com_Tips_PropertyItem'",
    UIName = "WeaponItemDetailItems"
  },
  WeaponItemDetails = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Weapon.WBP_Com_Tips_Weapon'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Common/Tips/Widget/WBP_Com_Tips_Weapon.WBP_Com_Tips_Weapon'",
    UIName = "WeaponItemDetails"
  },
  Zhenzi_Emoji = {
    BPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_ZhenziEmoji.WBP_Battle_ZhenziEmoji'",
    MobileBPPath = "WidgetBlueprint'/Game/UI/WBP/Battle/Widget/ExclusiveSkill/WBP_Battle_ZhenziEmoji.WBP_Battle_ZhenziEmoji'",
    UIName = "Zhenzi_Emoji"
  }
})
