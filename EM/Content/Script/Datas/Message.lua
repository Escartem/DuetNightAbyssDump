local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("Message", {
  [100001] = {
    MessageContentGamePad = "MESSAGE_100001",
    MessageContentPC = "MESSAGE_100001",
    MessageId = 100001,
    MessageType = "Guide"
  },
  [100002] = {
    MessageContentPC = "MESSAGE_100002",
    MessageId = 100002,
    MessageType = "Guide"
  },
  [100003] = {
    MessageContentPC = "MESSAGE_100003",
    MessageId = 100003,
    MessageType = "Guide"
  },
  [100004] = {
    MessageContentPC = "MESSAGE_100004",
    MessageId = 100004,
    MessageType = "Guide"
  },
  [100005] = {
    MessageContentPC = "MESSAGE_100005",
    MessageContentPhone = "MESSAGE_100005",
    MessageId = 100005,
    MessageType = "Guide"
  },
  [100006] = {
    MessageContentPC = "MESSAGE_100006",
    MessageId = 100006,
    MessageType = "Guide"
  },
  [100007] = {
    MessageContentPC = "MESSAGE_100007",
    MessageId = 100007,
    MessageType = "Guide"
  },
  [100008] = {
    MessageContentGamePad = "MESSAGE_100008_Gamepad",
    MessageContentPC = "MESSAGE_100008",
    MessageContentPhone = "MESSAGE_100008_Phone",
    MessageId = 100008,
    MessageType = "Guide"
  },
  [100009] = {
    MessageContentPC = "CAPTURE_BULLETJUMP_PC",
    MessageContentPhone = "CAPTURE_BULLETJUMP_PHONE",
    MessageId = 100009,
    MessageType = "Guide"
  },
  [100010] = {
    MessageContentPC = "MESSAGE_100010",
    MessageContentPhone = "MESSAGE_100010",
    MessageId = 100010,
    MessageType = "Guide"
  },
  [100011] = {
    MessageContentPC = "SURVIVALPRO_LONGPRESS_PC",
    MessageContentPhone = "SURVIVALPRO_LONGPRESS_PHONE",
    MessageId = 100011,
    MessageType = "Guide"
  },
  [200001] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_JUMP_PC",
    MessageContentPC = "MESSAGE_JUMP_PC",
    MessageContentPhone = "MESSAGE_JUMP_PHONE",
    MessageId = 200001,
    MessageLoc = "UpLeft",
    MessageType = "Guide",
    UICompName = "Battle_Skill_Jump.Btn_Jump",
    UIShape = "Circle"
  },
  [200002] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_DOUBLEJUMP_PC",
    MessageContentPC = "MESSAGE_DOUBLEJUMP_PC",
    MessageContentPhone = "MESSAGE_DOUBLEJUMP_PHONE",
    MessageId = 200002,
    MessageLoc = "UpLeft",
    MessageType = "Guide",
    UICompName = "Battle_Skill_Jump.Btn_Jump",
    UIShape = "Circle"
  },
  [200003] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_SLIDE_PC",
    MessageContentPC = "MESSAGE_SLIDE_PC",
    MessageContentPhone = "MESSAGE_SLIDE_PHONE",
    MessageId = 200003,
    MessageLoc = "UpLeft",
    MessageType = "Guide",
    UICompName = "Battle_Skill_Squat.Img_Slide",
    UIShape = "Circle"
  },
  [200004] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_BULLETJUMP1_PC",
    MessageContentPC = "MESSAGE_BULLETJUMP1_PC",
    MessageContentPhone = "MESSAGE_BULLETJUMP1_PHONE",
    MessageId = 200004,
    MessageLoc = "UpLeft",
    MessageTitlePC = "MESSAGE_TITLE_BULLETJUMP_PC",
    MessageType = "Guide",
    UICompName = "Battle_Skill_Squat.Img_Slide",
    UIShape = "Circle"
  },
  [200005] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_WALLJUMP_PC",
    MessageContentPC = "MESSAGE_WALLJUMP_PC",
    MessageContentPhone = "MESSAGE_WALLJUMP_PHONE",
    MessageId = 200005,
    MessageLoc = "UpLeft",
    MessageType = "Guide",
    UICompName = "Battle_Skill_Jump.Btn_Jump",
    UIShape = "Circle"
  },
  [200006] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_ATTACK_GAMEPAD",
    MessageContentPC = "MESSAGE_ATTACK_PC",
    MessageContentPhone = "MESSAGE_ATTACK_PHONE",
    MessageId = 200006,
    MessageLoc = "UpLeft",
    MessageType = "Guide",
    UICompName = "Battle_Skill_Metee.Btn_Attack",
    UIShape = "Circle"
  },
  [200007] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_SHOOT_PC",
    MessageContentPC = "MESSAGE_SHOOT_PC",
    MessageContentPhone = "MESSAGE_SHOOT_PHONE",
    MessageId = 200007,
    MessageLoc = "UpLeft",
    MessageType = "Guide",
    UICompName = "Battle_Skill_Remote.Btn_Remote",
    UIShape = "Circle"
  },
  [200008] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_SKILL1_GAMEPAD",
    MessageContentPC = "MESSAGE_SKILL1_PC",
    MessageContentPhone = "MESSAGE_SKILL1_PHONE",
    MessageId = 200008,
    MessageLoc = "UpLeft",
    MessageType = "Guide",
    UICompName = "Battle_Skill_1.Btn_Skill_SM",
    UIShape = "Circle"
  },
  [200009] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_SKILL2_GAMEPAD",
    MessageContentPC = "MESSAGE_SKILL2_PC",
    MessageContentPhone = "MESSAGE_SKILL2_PHONE",
    MessageId = 200009,
    MessageLoc = "UpLeft",
    MessageType = "Guide",
    UICompName = "Battle_Skill_2.Btn_Skill_SM",
    UIShape = "Circle"
  },
  [200010] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_BULLETJUMP2_PC",
    MessageContentPC = "MESSAGE_BULLETJUMP2_PC",
    MessageContentPhone = "MESSAGE_BULLETJUMP2_PHONE",
    MessageId = 200010,
    MessageTitlePC = "MESSAGE_TITLE_BULLETJUMP_PC",
    MessageType = "Guide",
    UICompName = "Battle_Skill_Metee.Btn_Attack",
    UIShape = "Circle"
  },
  [200011] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_LOADING_1_PC",
    MessageContentPC = "MESSAGE_LOADING_1_PC",
    MessageContentPhone = "MESSAGE_BULLETJUMP_PHONE",
    MessageId = 200011,
    MessageTitlePC = "MESSAGE_TITLE_BULLETJUMP_PC",
    MessageType = "Guide",
    UICompName = "Battle_Skill_Metee.Btn_Attack",
    UIShape = "Circle"
  },
  [200012] = {
    MessageContentGamePad = "MESSAGE_ANGLE_GAMEPAD",
    MessageContentPC = "MESSAGE_ANGLE_PC",
    MessageContentPhone = "MESSAGE_ANGLE_PHONE",
    MessageId = 200012,
    MessageType = "Guide"
  },
  [200013] = {
    MessageContentGamePad = "MESSAGE_MOVE_GAMEPAD",
    MessageContentPC = "MESSAGE_MOVE_PC",
    MessageContentPhone = "MESSAGE_MOVE_PHONE",
    MessageId = 200013,
    MessageType = "Guide"
  },
  [200014] = {
    MessageContentGamePad = "MESSAGE_AVOID_PC",
    MessageContentPC = "MESSAGE_AVOID_PC",
    MessageContentPhone = "MESSAGE_AVOID_Phone",
    MessageId = 200014,
    MessageType = "Guide"
  },
  [200015] = {
    MessageContentGamePad = "MESSAGE_INTERACTIVE_PC",
    MessageContentPC = "MESSAGE_INTERACTIVE_PC",
    MessageContentPhone = "MESSAGE_INTERACTIVE_Phone",
    MessageId = 200015,
    MessageType = "Guide"
  },
  [200016] = {
    MessageContentGamePad = "MESSAGE_RECETCAMERA_PC",
    MessageContentPC = "MESSAGE_RECETCAMERA_PC",
    MessageContentPhone = "MESSAGE_RECETCAMERA_Phone",
    MessageId = 200016,
    MessageType = "Guide"
  },
  [200017] = {
    MessageContentGamePad = "MESSAGE_RECETCAMERA_2_PC",
    MessageContentPC = "MESSAGE_RECETCAMERA_2_PC",
    MessageContentPhone = "MESSAGE_RECETCAMERA_2_PC",
    MessageId = 200017,
    MessageType = "Guide"
  },
  [200018] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_SKILL1_2_GAMEPAD",
    MessageContentPC = "MESSAGE_SKILL1_2_PC",
    MessageContentPhone = "MESSAGE_SKILL1_2_PHONE",
    MessageId = 200018,
    MessageLoc = "UpLeft",
    MessageType = "Guide",
    UICompName = "Battle_Skill_1.Btn_Skill_SM",
    UIShape = "Circle"
  },
  [200019] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_BULLETJUMP_SLIDE_PC",
    MessageContentPC = "MESSAGE_BULLETJUMP_SLIDE_PC",
    MessageContentPhone = "MESSAGE_BULLETJUMP_PHONE",
    MessageId = 200019,
    MessageTitlePC = "MESSAGE_TITLE_BULLETJUMP_PC",
    MessageType = "Guide",
    UICompName = "Battle_Skill_Metee.Btn_Attack",
    UIShape = "Circle"
  },
  [200020] = {
    MessageContentGamePad = "MESSAGE_BULLETCHARGE_GAMEPAD",
    MessageContentPC = "MESSAGE_BULLETCHARGE_PC",
    MessageContentPhone = "MESSAGE_BULLETCHARGE_Phone",
    MessageId = 200020,
    MessageType = "Guide"
  },
  [200021] = {
    MessageContentGamePad = "MESSAGE_HIGHLIGHT_TARGET_PAD",
    MessageContentPC = "MESSAGE_HIGHLIGHT_TARGET_PC",
    MessageContentPhone = "MESSAGE_HIGHLIGHT_TARGET_PC",
    MessageId = 200021,
    MessageType = "Guide"
  },
  [200022] = {
    MessageContentGamePad = "MESSAGE_CHARGEATTACK_PC",
    MessageContentPC = "MESSAGE_CHARGEATTACK_PC",
    MessageContentPhone = "MESSAGE_CHARGEATTACK_PC",
    MessageId = 200022,
    MessageType = "Guide"
  },
  [200023] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_SKILL2ATTACK_PC",
    MessageContentPC = "MESSAGE_SKILL2ATTACK_PC",
    MessageContentPhone = "MESSAGE_SKILL2ATTACK_PHONE",
    MessageId = 200023,
    MessageLoc = "UpLeft",
    MessageType = "Guide",
    UICompName = "Battle_Skill_2.Btn_Skill_SM",
    UIShape = "Circle"
  },
  [200024] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_SKILL2STOP_PC",
    MessageContentPC = "MESSAGE_SKILL2STOP_PC",
    MessageContentPhone = "MESSAGE_SKILL2STOP_PHONE",
    MessageId = 200024,
    MessageLoc = "UpLeft",
    MessageType = "Guide",
    UICompName = "Battle_Skill_2.Btn_Skill_SM",
    UIShape = "Circle"
  },
  [200025] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_BULLETJUMPGUARANT_PC",
    MessageContentPC = "MESSAGE_BULLETJUMPGUARANT_PC",
    MessageContentPhone = "MESSAGE_BULLETJUMPGUARANT_PHONE",
    MessageId = 200025,
    MessageTitlePC = "MESSAGE_TITLE_BULLETJUMP_PC",
    MessageType = "Guide",
    UICompName = "Battle_Skill_Metee.Btn_Attack",
    UIShape = "Circle"
  },
  [200026] = {
    MessageContentGamePad = "MESSAGE_CAMERALENGTH_GAMEPAD",
    MessageContentPC = "MESSAGE_CAMERALENGTH_PC",
    MessageContentPhone = "MESSAGE_CAMERALENGTH_PHONE",
    MessageId = 200026,
    MessageType = "Guide"
  },
  [200027] = {
    MessageContentPC = "MESSAGE_BEACHAREA_PC",
    MessageContentPhone = "MESSAGE_BEACHAREA_PHONE",
    MessageId = 200027,
    MessageType = "Guide"
  },
  [200028] = {
    MessageContentPC = "MESSAGE_REACHQUESTAREA_PC",
    MessageContentPhone = "MESSAGE_REACHQUESTAREA_PC",
    MessageId = 200028,
    MessageType = "Guide"
  },
  [200029] = {
    MessageContentPC = "MESSAGE_DEFEATMONSTERS_PC",
    MessageContentPhone = "MESSAGE_DEFEATMONSTERS_PC",
    MessageId = 200029,
    MessageType = "Guide"
  },
  [200030] = {
    MessageContentPC = "MESSAGE_ESCAPEFROMCAVE_PC",
    MessageContentPhone = "MESSAGE_ESCAPEFROMCAVE_PC",
    MessageId = 200030,
    MessageType = "Guide"
  },
  [200031] = {
    MessageContentPC = "Quest_Tips_LeaveHintTrigger",
    MessageContentPhone = "Quest_Tips_LeaveHintTrigger",
    MessageId = 200031,
    MessageType = "Guide"
  },
  [200032] = {
    HighLightUIPath = "BattleMain.Battle_Skill",
    IsAdapted = true,
    MessageContentGamePad = "MESSAGE_SKILL1_2_GAMEPAD_1st",
    MessageContentPC = "MESSAGE_SKILL1_2_PC_1st",
    MessageContentPhone = "MESSAGE_SKILL1_2_PHONE_1st",
    MessageId = 200032,
    MessageLoc = "UpLeft",
    MessageType = "Guide",
    UICompName = "Battle_Skill_1.Btn_Skill_SM",
    UIShape = "Circle"
  },
  [200033] = {
    MessageContentGamePad = "MESSAGE_APPROACHINTERACTIVE_PC",
    MessageContentPC = "MESSAGE_APPROACHINTERACTIVE_PC",
    MessageContentPhone = "MESSAGE_APPROACHINTERACTIVE_PC",
    MessageId = 200033,
    MessageType = "Guide"
  },
  [200034] = {
    MessageContentGamePad = "MESSAGE_MOVEFORWARD_GAMEPAD",
    MessageContentPC = "MESSAGE_MOVEFORWARD_PC",
    MessageContentPhone = "MESSAGE_MOVEFORWARD_PHONE",
    MessageId = 200034,
    MessageType = "Guide"
  },
  [203001] = {
    MessageContentGamePad = "Message_Guide_Pet_01",
    MessageContentPC = "Message_Guide_Pet_01",
    MessageContentPhone = "Message_Guide_Pet_01",
    MessageId = 203001,
    MessageType = "Guide"
  },
  [203002] = {
    MessageContentGamePad = "Message_Guide_Pet_02",
    MessageContentPC = "Message_Guide_Pet_02",
    MessageContentPhone = "Message_Guide_Pet_02",
    MessageId = 203002,
    MessageType = "Guide"
  },
  [203003] = {
    MessageContentGamePad = "Message_Guide_Pet_03",
    MessageContentPC = "Message_Guide_Pet_03",
    MessageContentPhone = "Message_Guide_Pet_03",
    MessageId = 203003,
    MessageType = "Guide"
  },
  [203004] = {
    MessageContentGamePad = "Message_Guide_Pet_04",
    MessageContentPC = "Message_Guide_Pet_04",
    MessageContentPhone = "Message_Guide_Pet_04",
    MessageId = 203004,
    MessageType = "Guide"
  },
  [203005] = {
    MessageContentGamePad = "Message_Guide_Pet_05",
    MessageContentPC = "Message_Guide_Pet_05",
    MessageContentPhone = "Message_Guide_Pet_05",
    MessageId = 203005,
    MessageType = "Guide"
  },
  [203006] = {
    MessageContentGamePad = "Message_Guide_Pet_06",
    MessageContentPC = "Message_Guide_Pet_06",
    MessageContentPhone = "Message_Guide_Pet_06",
    MessageId = 203006,
    MessageType = "Guide"
  },
  [203007] = {
    MessageContentGamePad = "Message_Guide_Pet_07",
    MessageContentPC = "Message_Guide_Pet_07",
    MessageContentPhone = "Message_Guide_Pet_07",
    MessageId = 203007,
    MessageType = "Guide"
  },
  [203008] = {
    MessageContentGamePad = "Message_Guide_Pet_08_Pad",
    MessageContentPC = "Message_Guide_Pet_08",
    MessageContentPhone = "Message_Guide_Pet_08",
    MessageId = 203008,
    MessageType = "Guide"
  },
  [203009] = {
    MessageContentGamePad = "Message_Guide_Pet_09",
    MessageContentPC = "Message_Guide_Pet_09",
    MessageContentPhone = "Message_Guide_Pet_09",
    MessageId = 203009,
    MessageType = "Guide"
  },
  [203010] = {
    MessageContentGamePad = "Message_Guide_Pet_10",
    MessageContentPC = "Message_Guide_Pet_10",
    MessageContentPhone = "Message_Guide_Pet_10",
    MessageId = 203010,
    MessageType = "Guide"
  },
  [203011] = {
    MessageContentGamePad = "Message_Guide_Pet_11_PAD",
    MessageContentPC = "Message_Guide_Pet_11",
    MessageContentPhone = "Message_Guide_Pet_11_PHONE",
    MessageId = 203011,
    MessageType = "Guide"
  },
  [300001] = {
    MessageContentGamePad = "Message_Guide_ChangeWeapon_1",
    MessageContentPC = "Message_Guide_ChangeWeapon_1",
    MessageContentPhone = "Message_Guide_ChangeWeapon_1",
    MessageId = 300001,
    MessageType = "Text"
  },
  [300002] = {
    MessageContentGamePad = "Message_Guide_OpenArmory_Pad",
    MessageContentPC = "Message_Guide_OpenArmory_PC",
    MessageContentPhone = "Message_Guide_OpenArmory_Phone",
    MessageId = 300002,
    MessageType = "ButtonGuide"
  },
  [300003] = {
    MessageContentGamePad = "Message_Guide_ChangeWeapon_3_Pad",
    MessageContentPC = "Message_Guide_ChangeWeapon_3",
    MessageContentPhone = "Message_Guide_ChangeWeapon_3",
    MessageId = 300003,
    MessageType = "ButtonGuide"
  },
  [300004] = {
    MessageContentGamePad = "Message_Guide_ChangeWeapon_4",
    MessageContentPC = "Message_Guide_ChangeWeapon_4",
    MessageContentPhone = "Message_Guide_ChangeWeapon_4",
    MessageId = 300004,
    MessageType = "Text"
  },
  [300005] = {
    MessageContentGamePad = "Message_Guide_ChangeWeapon_5",
    MessageContentPC = "Message_Guide_ChangeWeapon_5",
    MessageContentPhone = "Message_Guide_ChangeWeapon_5",
    MessageId = 300005,
    MessageType = "ButtonGuide"
  },
  [300006] = {
    MessageContentGamePad = "Message_Guide_ChangeWeapon_6_Pad",
    MessageContentPC = "Message_Guide_ChangeWeapon_6",
    MessageContentPhone = "Message_Guide_ChangeWeapon_6",
    MessageId = 300006,
    MessageType = "ButtonGuide"
  },
  [300007] = {
    MessageContentGamePad = "Message_Guide_ChangeWeapon_7_Pad",
    MessageContentPC = "Message_Guide_ChangeWeapon_7",
    MessageContentPhone = "Message_Guide_ChangeWeapon_7",
    MessageId = 300007,
    MessageType = "ButtonGuide"
  },
  [300008] = {
    MessageContentGamePad = "Message_Guide_ChangeWeapon_8",
    MessageContentPC = "Message_Guide_ChangeWeapon_8",
    MessageContentPhone = "Message_Guide_ChangeWeapon_8",
    MessageId = 300008,
    MessageType = "Text"
  },
  [300009] = {
    MessageContentGamePad = "Message_Guide_ChangeWeapon_9_Pad",
    MessageContentPC = "Message_Guide_ChangeWeapon_9",
    MessageContentPhone = "Message_Guide_ChangeWeapon_9",
    MessageId = 300009,
    MessageType = "ButtonGuide"
  },
  [300010] = {
    MessageContentGamePad = "Message_Guide_ChangeWeapon_10",
    MessageContentPC = "Message_Guide_ChangeWeapon_10",
    MessageContentPhone = "Message_Guide_ChangeWeapon_10",
    MessageId = 300010,
    MessageType = "ButtonGuide"
  },
  [300011] = {
    MessageContentGamePad = "Message_Guide_ChangeWeapon_11",
    MessageContentPC = "Message_Guide_ChangeWeapon_11",
    MessageContentPhone = "Message_Guide_ChangeWeapon_11",
    MessageId = 300011,
    MessageType = "ButtonGuide"
  },
  [300012] = {
    MessageContentGamePad = "Message_Guide_ChangeWeapon_12",
    MessageContentPC = "Message_Guide_ChangeWeapon_12",
    MessageContentPhone = "Message_Guide_ChangeWeapon_12",
    MessageId = 300012,
    MessageType = "ButtonGuide"
  },
  [300013] = {
    MessageContentGamePad = "Message_Guide_WeaponTrigger_5",
    MessageContentPC = "Message_Guide_WeaponTrigger_1",
    MessageContentPhone = "Message_Guide_WeaponTrigger_5",
    MessageId = 300013,
    MessageType = "Text"
  },
  [300014] = {
    MessageContentGamePad = "Message_Guide_WeaponTrigger_2",
    MessageContentPC = "Message_Guide_WeaponTrigger_2",
    MessageContentPhone = "Message_Guide_WeaponTrigger_2",
    MessageId = 300014,
    MessageType = "Text"
  },
  [300015] = {
    MessageContentGamePad = "Message_Guide_WeaponTrigger_3",
    MessageContentPC = "Message_Guide_WeaponTrigger_3",
    MessageContentPhone = "Message_Guide_WeaponTrigger_3",
    MessageId = 300015,
    MessageType = "Text"
  },
  [300016] = {
    MessageContentGamePad = "Message_Guide_WeaponTrigger_4",
    MessageContentPC = "Message_Guide_WeaponTrigger_4",
    MessageContentPhone = "Message_Guide_WeaponTrigger_4",
    MessageId = 300016,
    MessageType = "Text"
  },
  [300017] = {
    MessageContentGamePad = "Message_Guide_ChangeWeapon_13",
    MessageContentPC = "Message_Guide_ChangeWeapon_13",
    MessageContentPhone = "Message_Guide_ChangeWeapon_13",
    MessageId = 300017,
    MessageType = "Text"
  },
  [300101] = {
    MessageContentGamePad = "Message_Guide_Bag_1_PC",
    MessageContentPC = "Message_Guide_Bag_1_PC",
    MessageContentPhone = "Message_Guide_Bag_1_Phone",
    MessageId = 300101,
    MessageType = "ButtonGuide"
  },
  [300102] = {
    MessageContentGamePad = "Message_Guide_Bag_2",
    MessageContentPC = "Message_Guide_Bag_2",
    MessageContentPhone = "Message_Guide_Bag_2",
    MessageId = 300102,
    MessageType = "Text"
  },
  [300103] = {
    MessageContentGamePad = "Message_Guide_Bag_3",
    MessageContentPC = "Message_Guide_Bag_3",
    MessageContentPhone = "Message_Guide_Bag_3",
    MessageId = 300103,
    MessageType = "ButtonGuide"
  },
  [300201] = {
    MessageContentGamePad = "Message_Guide_Achievement_1",
    MessageContentPC = "Message_Guide_Achievement_1",
    MessageContentPhone = "Message_Guide_Achievement_1",
    MessageId = 300201,
    MessageType = "Text"
  },
  [300202] = {
    MessageContentGamePad = "Message_Guide_Achievement_2_Pad",
    MessageContentPC = "Message_Guide_Achievement_2_PC",
    MessageContentPhone = "Message_Guide_Achievement_2_Phone",
    MessageId = 300202,
    MessageType = "ButtonGuide"
  },
  [300203] = {
    MessageContentGamePad = "Message_Guide_Achievement_3",
    MessageContentPC = "Message_Guide_Achievement_3",
    MessageContentPhone = "Message_Guide_Achievement_3",
    MessageId = 300203,
    MessageType = "Text"
  },
  [300204] = {
    MessageContentGamePad = "Message_Guide_Achievement_4_Pad",
    MessageContentPC = "Message_Guide_Achievement_4",
    MessageContentPhone = "Message_Guide_Achievement_4",
    MessageId = 300204,
    MessageType = "ButtonGuide"
  },
  [300205] = {
    MessageContentGamePad = "Message_Guide_Achievement_5",
    MessageContentPC = "Message_Guide_Achievement_5",
    MessageContentPhone = "Message_Guide_Achievement_5",
    MessageId = 300205,
    MessageType = "ButtonGuide"
  },
  [300301] = {
    MessageContentGamePad = "Message_Guide_ReplaceChar_1",
    MessageContentPC = "Message_Guide_ReplaceChar_1",
    MessageContentPhone = "Message_Guide_ReplaceChar_1",
    MessageId = 300301,
    MessageType = "Text"
  },
  [300302] = {
    MessageContentGamePad = "Message_Guide_OpenArmory_Pad",
    MessageContentPC = "Message_Guide_OpenArmory_PC",
    MessageContentPhone = "Message_Guide_OpenArmory_Phone",
    MessageId = 300302,
    MessageType = "Text"
  },
  [300303] = {
    MessageContentGamePad = "Message_Guide_ReplaceChar_3",
    MessageContentPC = "Message_Guide_ReplaceChar_3",
    MessageContentPhone = "Message_Guide_ReplaceChar_3",
    MessageId = 300303,
    MessageType = "Text"
  },
  [300304] = {
    MessageContentGamePad = "Message_Guide_ReplaceChar_4",
    MessageContentPC = "Message_Guide_ReplaceChar_4",
    MessageContentPhone = "Message_Guide_ReplaceChar_4",
    MessageId = 300304,
    MessageType = "Text"
  },
  [300305] = {
    MessageContentGamePad = "Message_Guide_ReplaceChar_5",
    MessageContentPC = "Message_Guide_ReplaceChar_5",
    MessageContentPhone = "Message_Guide_ReplaceChar_5",
    MessageId = 300305,
    MessageType = "Text"
  },
  [300306] = {
    MessageContentGamePad = "Message_Guide_ReplaceChar_6",
    MessageContentPC = "Message_Guide_ReplaceChar_6",
    MessageContentPhone = "Message_Guide_ReplaceChar_6",
    MessageId = 300306,
    MessageType = "Text"
  },
  [300307] = {
    MessageContentGamePad = "Message_Guide_ReplaceChar_7",
    MessageContentPC = "Message_Guide_ReplaceChar_7",
    MessageContentPhone = "Message_Guide_ReplaceChar_7",
    MessageId = 300307,
    MessageType = "Text"
  },
  [300308] = {
    MessageContentGamePad = "Message_Guide_ReplaceChar_8",
    MessageContentPC = "Message_Guide_ReplaceChar_8",
    MessageContentPhone = "Message_Guide_ReplaceChar_8",
    MessageId = 300308,
    MessageType = "Text"
  },
  [300309] = {
    MessageContentGamePad = "Message_Guide_ReplaceChar_9",
    MessageContentPC = "Message_Guide_ReplaceChar_9",
    MessageContentPhone = "Message_Guide_ReplaceChar_9",
    MessageId = 300309,
    MessageType = "Text"
  },
  [300401] = {
    MessageContentGamePad = "Message_Guide_Quest_1",
    MessageContentPC = "Message_Guide_Quest_1",
    MessageContentPhone = "Message_Guide_Quest_1",
    MessageId = 300401,
    MessageType = "Text"
  },
  [300402] = {
    MessageContentGamePad = "Message_Guide_Quest_2_Pad",
    MessageContentPC = "Message_Guide_Quest_2_PC",
    MessageContentPhone = "Message_Guide_Quest_2_Phone",
    MessageId = 300402,
    MessageType = "Text"
  },
  [300403] = {
    MessageContentGamePad = "Message_Guide_Quest_3",
    MessageContentPC = "Message_Guide_Quest_3",
    MessageContentPhone = "Message_Guide_Quest_3",
    MessageId = 300403,
    MessageType = "Text"
  },
  [300404] = {
    MessageContentGamePad = "Message_Guide_Quest_4_Pad",
    MessageContentPC = "Message_Guide_Quest_4",
    MessageContentPhone = "Message_Guide_Quest_4",
    MessageId = 300404,
    MessageType = "Text"
  },
  [300405] = {
    MessageContentGamePad = "Message_Guide_Quest_5_Pad",
    MessageContentPC = "Message_Guide_Quest_5",
    MessageContentPhone = "Message_Guide_Quest_5",
    MessageId = 300405,
    MessageType = "Text"
  },
  [300501] = {
    MessageContentGamePad = "Message_Guide_Forge_1",
    MessageContentPC = "Message_Guide_Forge_1",
    MessageContentPhone = "Message_Guide_Forge_1",
    MessageId = 300501,
    MessageType = "Text"
  },
  [300502] = {
    MessageContentGamePad = "Message_Guide_Forge_2",
    MessageContentPC = "Message_Guide_Forge_2",
    MessageContentPhone = "Message_Guide_Forge_2",
    MessageId = 300502,
    MessageType = "Text"
  },
  [300503] = {
    MessageContentGamePad = "Message_Guide_Forge_3",
    MessageContentPC = "Message_Guide_Forge_3",
    MessageContentPhone = "Message_Guide_Forge_3",
    MessageId = 300503,
    MessageType = "Text"
  },
  [300504] = {
    MessageContentGamePad = "Message_Guide_Forge_4_Pad",
    MessageContentPC = "Message_Guide_Forge_4",
    MessageContentPhone = "Message_Guide_Forge_4",
    MessageId = 300504,
    MessageType = "Text"
  },
  [300505] = {
    MessageContentGamePad = "Message_Guide_Forge_5",
    MessageContentPC = "Message_Guide_Forge_5",
    MessageContentPhone = "Message_Guide_Forge_5",
    MessageId = 300505,
    MessageType = "Text"
  },
  [300506] = {
    MessageContentGamePad = "Message_Guide_Forge_6_Pad",
    MessageContentPC = "Message_Guide_Forge_6",
    MessageContentPhone = "Message_Guide_Forge_6",
    MessageId = 300506,
    MessageType = "Text"
  },
  [300507] = {
    MessageContentGamePad = "Message_Guide_Forge_7_Pad",
    MessageContentPC = "Message_Guide_Forge_7",
    MessageContentPhone = "Message_Guide_Forge_7",
    MessageId = 300507,
    MessageType = "Text"
  },
  [300508] = {
    MessageContentGamePad = "Message_Guide_Forge_8_Pad",
    MessageContentPC = "Message_Guide_Forge_8",
    MessageContentPhone = "Message_Guide_Forge_8",
    MessageId = 300508,
    MessageType = "Text"
  },
  [300509] = {
    MessageContentGamePad = "Message_Guide_Forge_9_Pad",
    MessageContentPC = "Message_Guide_Forge_9",
    MessageContentPhone = "Message_Guide_Forge_9",
    MessageId = 300509,
    MessageType = "Text"
  },
  [300510] = {
    MessageContentGamePad = "Message_Guide_Forge_10",
    MessageContentPC = "Message_Guide_Forge_10",
    MessageContentPhone = "Message_Guide_Forge_10",
    MessageId = 300510,
    MessageType = "Text"
  },
  [300511] = {
    MessageContentGamePad = "Message_Guide_Forge_11_Pad",
    MessageContentPC = "Message_Guide_Forge_11",
    MessageContentPhone = "Message_Guide_Forge_11",
    MessageId = 300511,
    MessageType = "Text"
  },
  [300601] = {
    MessageContentGamePad = "Message_Guide_BattleBag_1",
    MessageContentPC = "Message_Guide_BattleBag_1",
    MessageContentPhone = "Message_Guide_BattleBag_1",
    MessageId = 300601,
    MessageType = "Text"
  },
  [300602] = {
    MessageContentGamePad = "Message_Guide_OpenArmory_Pad",
    MessageContentPC = "Message_Guide_OpenArmory_PC",
    MessageContentPhone = "Message_Guide_OpenArmory_Phone",
    MessageId = 300602,
    MessageType = "Text"
  },
  [300603] = {
    MessageContentGamePad = "Message_Guide_BattleBag_3_Pad",
    MessageContentPC = "Message_Guide_BattleBag_3",
    MessageContentPhone = "Message_Guide_BattleBag_3",
    MessageId = 300603,
    MessageType = "Text"
  },
  [300604] = {
    MessageContentGamePad = "Message_Guide_BattleBag_4_1",
    MessageContentPC = "Message_Guide_BattleBag_4_1",
    MessageContentPhone = "Message_Guide_BattleBag_4_1",
    MessageId = 300604,
    MessageType = "Text"
  },
  [300605] = {
    MessageContentGamePad = "Message_Guide_BattleBag_5",
    MessageContentPC = "Message_Guide_BattleBag_5",
    MessageContentPhone = "Message_Guide_BattleBag_5",
    MessageId = 300605,
    MessageType = "Text"
  },
  [300606] = {
    MessageContentGamePad = "Message_Guide_BattleBag_6",
    MessageContentPC = "Message_Guide_BattleBag_6",
    MessageContentPhone = "Message_Guide_BattleBag_6",
    MessageId = 300606,
    MessageType = "Text"
  },
  [300607] = {
    MessageContentGamePad = "Message_Guide_BattleBag_7",
    MessageContentPC = "Message_Guide_BattleBag_7",
    MessageContentPhone = "Message_Guide_BattleBag_7",
    MessageId = 300607,
    MessageType = "Text"
  },
  [300608] = {
    MessageContentGamePad = "Message_Guide_BattleBag_8",
    MessageContentPC = "Message_Guide_BattleBag_8",
    MessageContentPhone = "Message_Guide_BattleBag_8",
    MessageId = 300608,
    MessageType = "Text"
  },
  [300609] = {
    MessageContentGamePad = "Message_Guide_BattleBag_9",
    MessageContentPC = "Message_Guide_BattleBag_9",
    MessageContentPhone = "Message_Guide_BattleBag_9",
    MessageId = 300609,
    MessageType = "Text"
  },
  [300610] = {
    MessageContentGamePad = "Message_Guide_BattleBag_10",
    MessageContentPC = "Message_Guide_BattleBag_10",
    MessageContentPhone = "Message_Guide_BattleBag_10",
    MessageId = 300610,
    MessageType = "Text"
  },
  [300611] = {
    MessageContentGamePad = "Message_Guide_BattleBag_11",
    MessageContentPC = "Message_Guide_BattleBag_11",
    MessageContentPhone = "Message_Guide_BattleBag_11",
    MessageId = 300611,
    MessageType = "Text"
  },
  [300612] = {
    MessageContentGamePad = "Message_Guide_BattleBag_12_1",
    MessageContentPC = "Message_Guide_BattleBag_12_1",
    MessageContentPhone = "Message_Guide_BattleBag_12_1",
    MessageId = 300612,
    MessageType = "Text"
  },
  [300613] = {
    MessageContentGamePad = "Message_Guide_BattleBag_13",
    MessageContentPC = "Message_Guide_BattleBag_13",
    MessageContentPhone = "Message_Guide_BattleBag_13_phone",
    MessageId = 300613,
    MessageType = "Text"
  },
  [300614] = {
    MessageContentGamePad = "Message_Guide_BattleBag_14",
    MessageContentPC = "Message_Guide_BattleBag_14",
    MessageContentPhone = "Message_Guide_BattleBag_14",
    MessageId = 300614,
    MessageType = "Text"
  },
  [300615] = {
    MessageContentGamePad = "Message_Guide_BattleBag_15",
    MessageContentPC = "Message_Guide_BattleBag_15",
    MessageContentPhone = "Message_Guide_BattleBag_15",
    MessageId = 300615,
    MessageType = "Text"
  },
  [300616] = {
    MessageContentGamePad = "Message_Guide_BattleBag_16",
    MessageContentPC = "Message_Guide_BattleBag_16",
    MessageContentPhone = "Message_Guide_BattleBag_16",
    MessageId = 300616,
    MessageType = "Text"
  },
  [300701] = {
    MessageContentGamePad = "Message_Guide_Mod_1",
    MessageContentPC = "Message_Guide_Mod_1",
    MessageContentPhone = "Message_Guide_Mod_1",
    MessageId = 300701,
    MessageType = "Text"
  },
  [300702] = {
    MessageContentGamePad = "Message_Guide_Mod_2_Pad",
    MessageContentPC = "Message_Guide_Mod_2",
    MessageContentPhone = "Message_Guide_Mod_2",
    MessageId = 300702,
    MessageType = "Text"
  },
  [300703] = {
    MessageContentGamePad = "Message_Guide_Mod_3",
    MessageContentPC = "Message_Guide_Mod_3",
    MessageContentPhone = "Message_Guide_Mod_3",
    MessageId = 300703,
    MessageType = "Text"
  },
  [300704] = {
    MessageContentGamePad = "Message_Guide_Mod_4",
    MessageContentPC = "Message_Guide_Mod_4",
    MessageContentPhone = "Message_Guide_Mod_4",
    MessageId = 300704,
    MessageType = "Text"
  },
  [300705] = {
    MessageContentGamePad = "Message_Guide_Mod_5",
    MessageContentPC = "Message_Guide_Mod_5",
    MessageContentPhone = "Message_Guide_Mod_5",
    MessageId = 300705,
    MessageType = "Text"
  },
  [300706] = {
    MessageContentGamePad = "Message_Guide_Mod_6",
    MessageContentPC = "Message_Guide_Mod_6",
    MessageContentPhone = "Message_Guide_Mod_6",
    MessageId = 300706,
    MessageType = "Text"
  },
  [300707] = {
    MessageContentGamePad = "Message_Guide_Mod_7",
    MessageContentPC = "Message_Guide_Mod_7",
    MessageContentPhone = "Message_Guide_Mod_7",
    MessageId = 300707,
    MessageType = "Text"
  },
  [300708] = {
    MessageContentGamePad = "Message_Guide_Mod_8",
    MessageContentPC = "Message_Guide_Mod_8",
    MessageContentPhone = "Message_Guide_Mod_8",
    MessageId = 300708,
    MessageType = "Text"
  },
  [300709] = {
    MessageContentGamePad = "Message_Guide_Mod_9",
    MessageContentPC = "Message_Guide_Mod_9",
    MessageContentPhone = "Message_Guide_Mod_9",
    MessageId = 300709,
    MessageType = "Text"
  },
  [300710] = {
    MessageContentGamePad = "Message_Guide_Mod_10",
    MessageContentPC = "Message_Guide_Mod_10",
    MessageContentPhone = "Message_Guide_Mod_10",
    MessageId = 300710,
    MessageType = "Text"
  },
  [300711] = {
    MessageContentGamePad = "Message_Guide_Mod_11",
    MessageContentPC = "Message_Guide_Mod_11",
    MessageContentPhone = "Message_Guide_Mod_11",
    MessageId = 300711,
    MessageType = "Text"
  },
  [300712] = {
    MessageContentGamePad = "Message_Guide_Mod_12",
    MessageContentPC = "Message_Guide_Mod_12",
    MessageContentPhone = "Message_Guide_Mod_12",
    MessageId = 300712,
    MessageType = "Text"
  },
  [300713] = {
    MessageContentGamePad = "Message_Guide_Mod_13",
    MessageContentPC = "Message_Guide_Mod_13",
    MessageContentPhone = "Message_Guide_Mod_13",
    MessageId = 300713,
    MessageType = "Text"
  },
  [300714] = {
    MessageContentGamePad = "Message_Guide_Mod_14",
    MessageContentPC = "Message_Guide_Mod_14",
    MessageContentPhone = "Message_Guide_Mod_14",
    MessageId = 300714,
    MessageType = "Text"
  },
  [300715] = {
    MessageContentGamePad = "Message_Guide_Mod_15",
    MessageContentPC = "Message_Guide_Mod_15",
    MessageContentPhone = "Message_Guide_Mod_15",
    MessageId = 300715,
    MessageType = "Text"
  },
  [300801] = {
    MessageContentGamePad = "Message_Guide_Dungeon_1_Pad",
    MessageContentPC = "Message_Guide_Dungeon_1_PC",
    MessageContentPhone = "Message_Guide_Dungeon_1_Phone",
    MessageId = 300801,
    MessageType = "Text"
  },
  [300802] = {
    MessageContentGamePad = "Message_Guide_Dungeon_2",
    MessageContentPC = "Message_Guide_Dungeon_2",
    MessageContentPhone = "Message_Guide_Dungeon_2",
    MessageId = 300802,
    MessageType = "Text"
  },
  [300803] = {
    MessageContentGamePad = "Message_Guide_Dungeon_3",
    MessageContentPC = "Message_Guide_Dungeon_3",
    MessageContentPhone = "Message_Guide_Dungeon_3",
    MessageId = 300803,
    MessageType = "Text"
  },
  [300804] = {
    MessageContentGamePad = "Message_Guide_Dungeon_4",
    MessageContentPC = "Message_Guide_Dungeon_4",
    MessageContentPhone = "Message_Guide_Dungeon_4",
    MessageId = 300804,
    MessageType = "Text"
  },
  [300805] = {
    MessageContentGamePad = "Message_Guide_Dungeon_5_Pad",
    MessageContentPC = "Message_Guide_Dungeon_5",
    MessageContentPhone = "Message_Guide_Dungeon_5",
    MessageId = 300805,
    MessageType = "Text"
  },
  [300806] = {
    MessageContentGamePad = "Message_Guide_Dungeon_6",
    MessageContentPC = "Message_Guide_Dungeon_6",
    MessageContentPhone = "Message_Guide_Dungeon_6",
    MessageId = 300806,
    MessageType = "Text"
  },
  [300807] = {
    MessageContentGamePad = "Message_Guide_Dungeon_7",
    MessageContentPC = "Message_Guide_Dungeon_7",
    MessageContentPhone = "Message_Guide_Dungeon_7",
    MessageId = 300807,
    MessageType = "Text"
  },
  [300808] = {
    MessageContentGamePad = "Message_Guide_Dungeon_8_Pad",
    MessageContentPC = "Message_Guide_Dungeon_8",
    MessageContentPhone = "Message_Guide_Dungeon_8",
    MessageId = 300808,
    MessageType = "Text"
  },
  [300809] = {
    MessageContentGamePad = "Message_Guide_Dungeon_9",
    MessageContentPC = "Message_Guide_Dungeon_9",
    MessageContentPhone = "Message_Guide_Dungeon_9",
    MessageId = 300809,
    MessageType = "Text"
  },
  [300810] = {
    MessageContentGamePad = "Message_Guide_Dungeon_10_Pad",
    MessageContentPC = "Message_Guide_Dungeon_10",
    MessageContentPhone = "Message_Guide_Dungeon_10",
    MessageId = 300810,
    MessageType = "Text"
  },
  [300811] = {
    MessageContentGamePad = "Message_Guide_Dungeon_11_Pad",
    MessageContentPC = "Message_Guide_Dungeon_11",
    MessageContentPhone = "Message_Guide_Dungeon_11",
    MessageId = 300811,
    MessageType = "Text"
  },
  [300812] = {
    MessageContentGamePad = "Message_Guide_Dungeon_12",
    MessageContentPC = "Message_Guide_Dungeon_12",
    MessageContentPhone = "Message_Guide_Dungeon_12",
    MessageId = 300812,
    MessageType = "Text"
  },
  [300813] = {
    MessageContentGamePad = "Message_Guide_Dungeon_13_Pad",
    MessageContentPC = "Message_Guide_Dungeon_13",
    MessageContentPhone = "Message_Guide_Dungeon_13",
    MessageId = 300813,
    MessageType = "Text"
  },
  [300814] = {
    MessageContentGamePad = "Message_Guide_Dungeon_14_Pad",
    MessageContentPC = "Message_Guide_Dungeon_14",
    MessageContentPhone = "Message_Guide_Dungeon_14",
    MessageId = 300814,
    MessageType = "Text"
  },
  [300815] = {
    MessageContentGamePad = "Message_Guide_Dungeon_15_Pad",
    MessageContentPC = "Message_Guide_Dungeon_15",
    MessageContentPhone = "Message_Guide_Dungeon_15",
    MessageId = 300815,
    MessageType = "Text"
  },
  [300816] = {
    MessageContentGamePad = "Message_Guide_Dungeon_16_Pad",
    MessageContentPC = "Message_Guide_Dungeon_16",
    MessageContentPhone = "Message_Guide_Dungeon_16",
    MessageId = 300816,
    MessageType = "Text"
  },
  [300817] = {
    MessageContentGamePad = "Message_Guide_Dungeon_17",
    MessageContentPC = "Message_Guide_Dungeon_17",
    MessageContentPhone = "Message_Guide_Dungeon_17",
    MessageId = 300817,
    MessageType = "Text"
  },
  [300818] = {
    MessageContentGamePad = "Message_Guide_Dungeon_18",
    MessageContentPC = "Message_Guide_Dungeon_18",
    MessageContentPhone = "Message_Guide_Dungeon_18",
    MessageId = 300818,
    MessageType = "Text"
  },
  [300819] = {
    MessageContentGamePad = "Message_Guide_Dungeon_19_Pad",
    MessageContentPC = "Message_Guide_Dungeon_19",
    MessageContentPhone = "Message_Guide_Dungeon_19",
    MessageId = 300819,
    MessageType = "Text"
  },
  [300901] = {
    MessageContentGamePad = "Message_Guide_ModTendency_1",
    MessageContentPC = "Message_Guide_ModTendency_1",
    MessageContentPhone = "Message_Guide_ModTendency_1",
    MessageId = 300901,
    MessageType = "Text"
  },
  [300902] = {
    MessageContentGamePad = "Message_Guide_OpenArmory_Pad",
    MessageContentPC = "Message_Guide_OpenArmory_PC",
    MessageContentPhone = "Message_Guide_OpenArmory_Phone",
    MessageId = 300902,
    MessageType = "Text"
  },
  [300903] = {
    MessageContentGamePad = "Message_Guide_Mod_2",
    MessageContentPC = "Message_Guide_Mod_2",
    MessageContentPhone = "Message_Guide_Mod_2",
    MessageId = 300903,
    MessageType = "Text"
  },
  [300904] = {
    MessageContentGamePad = "Message_Guide_ModTendency_4_Pad",
    MessageContentPC = "Message_Guide_ModTendency_4",
    MessageContentPhone = "Message_Guide_ModTendency_4",
    MessageId = 300904,
    MessageType = "Text"
  },
  [300905] = {
    MessageContentGamePad = "Message_Guide_ModTendency_5_Pad",
    MessageContentPC = "Message_Guide_ModTendency_5",
    MessageContentPhone = "Message_Guide_ModTendency_5",
    MessageId = 300905,
    MessageType = "Text"
  },
  [300906] = {
    MessageContentGamePad = "Message_Guide_ModTendency_6",
    MessageContentPC = "Message_Guide_ModTendency_6",
    MessageContentPhone = "Message_Guide_ModTendency_6",
    MessageId = 300906,
    MessageType = "Text"
  },
  [300907] = {
    MessageContentGamePad = "Message_Guide_ModTendency_7",
    MessageContentPC = "Message_Guide_ModTendency_7",
    MessageContentPhone = "Message_Guide_ModTendency_7",
    MessageId = 300907,
    MessageType = "Text"
  },
  [300908] = {
    MessageContentGamePad = "Message_Guide_ModTendency_8",
    MessageContentPC = "Message_Guide_ModTendency_8",
    MessageContentPhone = "Message_Guide_ModTendency_8",
    MessageId = 300908,
    MessageType = "Text"
  },
  [300909] = {
    MessageContentGamePad = "Message_Guide_ModTendency_9",
    MessageContentPC = "Message_Guide_ModTendency_9",
    MessageContentPhone = "Message_Guide_ModTendency_9",
    MessageId = 300909,
    MessageType = "Text"
  },
  [300910] = {
    MessageContentGamePad = "Message_Guide_ModTendency_10",
    MessageContentPC = "Message_Guide_ModTendency_10",
    MessageContentPhone = "Message_Guide_ModTendency_10",
    MessageId = 300910,
    MessageType = "Text"
  },
  [300911] = {
    MessageContentGamePad = "Message_Guide_ModTendency_11",
    MessageContentPC = "Message_Guide_ModTendency_11",
    MessageContentPhone = "Message_Guide_ModTendency_11",
    MessageId = 300911,
    MessageType = "Text"
  },
  [301001] = {
    MessageContentGamePad = "Message_Guide_Impression_1",
    MessageContentPC = "Message_Guide_Impression_1",
    MessageContentPhone = "Message_Guide_Impression_1",
    MessageId = 301001,
    MessageType = "Text"
  },
  [301002] = {
    MessageContentGamePad = "Message_Guide_Impression_2",
    MessageContentPC = "Message_Guide_Impression_2",
    MessageContentPhone = "Message_Guide_Impression_2",
    MessageId = 301002,
    MessageType = "Text"
  },
  [301003] = {
    MessageContentGamePad = "Message_Guide_Impression_3",
    MessageContentPC = "Message_Guide_Impression_3",
    MessageContentPhone = "Message_Guide_Impression_3",
    MessageId = 301003,
    MessageType = "Text"
  },
  [301004] = {
    MessageContentGamePad = "Message_Guide_Impression_4",
    MessageContentPC = "Message_Guide_Impression_4",
    MessageContentPhone = "Message_Guide_Impression_4",
    MessageId = 301004,
    MessageType = "Text"
  },
  [301101] = {
    MessageContentPC = "Message_Guide_Alt",
    MessageId = 301101,
    MessageType = "Text"
  },
  [301201] = {
    MessageContentGamePad = "Message_Guide_Gacha_1_Gamepad",
    MessageContentPC = "Message_Guide_Gacha_1",
    MessageContentPhone = "Message_Guide_Gacha_1",
    MessageId = 301201,
    MessageType = "Text"
  },
  [301301] = {
    MessageContentGamePad = "Message_Guide_ModLevelUp_1",
    MessageContentPC = "Message_Guide_ModLevelUp_1",
    MessageContentPhone = "Message_Guide_ModLevelUp_1",
    MessageId = 301301,
    MessageType = "Text"
  },
  [301302] = {
    MessageContentGamePad = "Message_Guide_OpenArmory_Pad",
    MessageContentPC = "Message_Guide_OpenArmory_PC",
    MessageContentPhone = "Message_Guide_OpenArmory_Phone",
    MessageId = 301302,
    MessageType = "Text"
  },
  [301303] = {
    MessageContentGamePad = "Message_Guide_Mod_2",
    MessageContentPC = "Message_Guide_Mod_2",
    MessageContentPhone = "Message_Guide_Mod_2",
    MessageId = 301303
  },
  [301304] = {
    MessageContentGamePad = "Message_Guide_ModLevelUp_4_Pad",
    MessageContentPC = "Message_Guide_ModLevelUp_4",
    MessageContentPhone = "Message_Guide_ModLevelUp_4",
    MessageId = 301304,
    MessageType = "Text"
  },
  [301305] = {
    MessageContentGamePad = "Message_Guide_ModLevelUp_5_Pad",
    MessageContentPC = "Message_Guide_ModLevelUp_5",
    MessageContentPhone = "Message_Guide_ModLevelUp_5",
    MessageId = 301305,
    MessageType = "Text"
  },
  [301306] = {
    MessageContentGamePad = "Message_Guide_ModLevelUp_6",
    MessageContentPC = "Message_Guide_ModLevelUp_6",
    MessageContentPhone = "Message_Guide_ModLevelUp_6",
    MessageId = 301306,
    MessageType = "Text"
  },
  [301307] = {
    MessageContentGamePad = "Message_Guide_ModLevelUp_7",
    MessageContentPC = "Message_Guide_ModLevelUp_7",
    MessageContentPhone = "Message_Guide_ModLevelUp_7",
    MessageId = 301307
  },
  [301401] = {
    MessageContentGamePad = "Message_Guide_TrainingGround_PC",
    MessageContentPC = "Message_Guide_TrainingGround_PC",
    MessageContentPhone = "Message_Guide_TrainingGround_Phone",
    MessageId = 301401
  },
  [301501] = {
    MessageContentGamePad = "Message_Guide_TrainingGround_1",
    MessageContentPC = "Message_Guide_TrainingGround_1",
    MessageContentPhone = "Message_Guide_TrainingGround_1",
    MessageId = 301501
  },
  [301502] = {
    MessageContentGamePad = "Message_Guide_TrainingGround_2_Pad",
    MessageContentPC = "Message_Guide_TrainingGround_2",
    MessageContentPhone = "Message_Guide_TrainingGround_2",
    MessageId = 301502
  },
  [301503] = {
    MessageContentGamePad = "Message_Guide_TrainingGround_3",
    MessageContentPC = "Message_Guide_TrainingGround_3",
    MessageContentPhone = "Message_Guide_TrainingGround_3",
    MessageId = 301503
  },
  [301504] = {
    MessageContentGamePad = "Message_Guide_TrainingGround_4_Pad",
    MessageContentPC = "Message_Guide_TrainingGround_4",
    MessageContentPhone = "Message_Guide_TrainingGround_4",
    MessageId = 301504
  },
  [301505] = {
    MessageContentGamePad = "Message_Guide_TrainingGround_5",
    MessageContentPC = "Message_Guide_TrainingGround_5",
    MessageContentPhone = "Message_Guide_TrainingGround_5",
    MessageId = 301505
  },
  [301506] = {
    MessageContentGamePad = "Message_Guide_TrainingGround_6",
    MessageContentPC = "Message_Guide_TrainingGround_6",
    MessageContentPhone = "Message_Guide_TrainingGround_6",
    MessageId = 301506
  },
  [301507] = {
    MessageContentGamePad = "Message_Guide_TrainingGround_7",
    MessageContentPC = "Message_Guide_TrainingGround_7",
    MessageContentPhone = "Message_Guide_TrainingGround_7",
    MessageId = 301507
  },
  [301508] = {
    MessageContentGamePad = "Message_Guide_TrainingGround_8",
    MessageContentPC = "Message_Guide_TrainingGround_8",
    MessageContentPhone = "Message_Guide_TrainingGround_8",
    MessageId = 301508
  },
  [301601] = {
    MessageContentGamePad = "Message_Guide_Rouge_1",
    MessageContentPC = "Message_Guide_Rouge_1",
    MessageContentPhone = "Message_Guide_Rouge_1",
    MessageId = 301601
  },
  [301602] = {
    MessageContentGamePad = "Message_Guide_Dungeon_1_Pad",
    MessageContentPC = "Message_Guide_Dungeon_1_PC",
    MessageContentPhone = "Message_Guide_Dungeon_1_Phone",
    MessageId = 301602
  },
  [301603] = {
    MessageContentGamePad = "Message_Guide_Rouge_3_Pad",
    MessageContentPC = "Message_Guide_Rouge_3",
    MessageContentPhone = "Message_Guide_Rouge_3",
    MessageId = 301603
  },
  [301604] = {
    MessageContentGamePad = "Message_Guide_Rouge_4_Pad",
    MessageContentPC = "Message_Guide_Rouge_4",
    MessageContentPhone = "Message_Guide_Rouge_4",
    MessageId = 301604
  },
  [301605] = {
    MessageContentGamePad = "Message_Guide_Rouge_5",
    MessageContentPC = "Message_Guide_Rouge_5",
    MessageContentPhone = "Message_Guide_Rouge_5",
    MessageId = 301605
  },
  [301606] = {
    MessageContentGamePad = "Message_Guide_Rouge_6",
    MessageContentPC = "Message_Guide_Rouge_6",
    MessageContentPhone = "Message_Guide_Rouge_6",
    MessageId = 301606
  },
  [301607] = {
    MessageContentGamePad = "Message_Guide_Rouge_7_Pad",
    MessageContentPC = "Message_Guide_Rouge_7",
    MessageContentPhone = "Message_Guide_Rouge_7",
    MessageId = 301607
  },
  [301608] = {
    MessageContentGamePad = "Message_Guide_Rouge_8",
    MessageContentPC = "Message_Guide_Rouge_8",
    MessageContentPhone = "Message_Guide_Rouge_8",
    MessageId = 301608
  },
  [301609] = {
    MessageContentGamePad = "Message_Guide_Rouge_9",
    MessageContentPC = "Message_Guide_Rouge_9",
    MessageContentPhone = "Message_Guide_Rouge_9",
    MessageId = 301609
  },
  [301610] = {
    MessageContentGamePad = "Message_Guide_Rouge_10",
    MessageContentPC = "Message_Guide_Rouge_10",
    MessageContentPhone = "Message_Guide_Rouge_10",
    MessageId = 301610
  },
  [301611] = {
    MessageContentGamePad = "Message_Guide_Rouge_11_Pad",
    MessageContentPC = "Message_Guide_Rouge_11",
    MessageContentPhone = "Message_Guide_Rouge_11",
    MessageId = 301611
  },
  [301701] = {
    MessageContentGamePad = "Message_Guide_RougeLantern_1",
    MessageContentPC = "Message_Guide_RougeLantern_1",
    MessageContentPhone = "Message_Guide_RougeLantern_1",
    MessageId = 301701
  },
  [301702] = {
    MessageContentGamePad = "Message_Guide_RougeLantern_2_Pad",
    MessageContentPC = "Message_Guide_RougeLantern_2",
    MessageContentPhone = "Message_Guide_RougeLantern_2",
    MessageId = 301702
  },
  [301703] = {
    MessageContentGamePad = "Message_Guide_RougeLantern_3",
    MessageContentPC = "Message_Guide_RougeLantern_3",
    MessageContentPhone = "Message_Guide_RougeLantern_3",
    MessageId = 301703
  },
  [301704] = {
    MessageContentGamePad = "Message_Guide_RougeLantern_4",
    MessageContentPC = "Message_Guide_RougeLantern_4",
    MessageContentPhone = "Message_Guide_RougeLantern_4",
    MessageId = 301704
  },
  [301705] = {
    MessageContentGamePad = "Message_Guide_RougeLantern_5",
    MessageContentPC = "Message_Guide_RougeLantern_5",
    MessageContentPhone = "Message_Guide_RougeLantern_5",
    MessageId = 301705
  },
  [301706] = {
    MessageContentGamePad = "Message_Guide_RougeLantern_6",
    MessageContentPC = "Message_Guide_RougeLantern_6",
    MessageContentPhone = "Message_Guide_RougeLantern_6",
    MessageId = 301706
  },
  [301707] = {
    MessageContentGamePad = "Message_Guide_RougeLantern_7",
    MessageContentPC = "Message_Guide_RougeLantern_7",
    MessageContentPhone = "Message_Guide_RougeLantern_7",
    MessageId = 301707
  },
  [301708] = {
    MessageContentGamePad = "Message_Guide_RougeLantern_8_Pad",
    MessageContentPC = "Message_Guide_RougeLantern_8",
    MessageContentPhone = "Message_Guide_RougeLantern_8",
    MessageId = 301708
  },
  [301709] = {
    MessageContentGamePad = "Message_Guide_RougeLantern_9_Pad",
    MessageContentPC = "Message_Guide_RougeLantern_9",
    MessageContentPhone = "Message_Guide_RougeLantern_9",
    MessageId = 301709
  },
  [301801] = {
    MessageContentGamePad = "Message_Guide_Rouge3choose1_1",
    MessageContentPC = "Message_Guide_Rouge3choose1_1",
    MessageContentPhone = "Message_Guide_Rouge3choose1_1",
    MessageId = 301801
  },
  [301802] = {
    MessageContentGamePad = "Message_Guide_Rouge3choose1_2",
    MessageContentPC = "Message_Guide_Rouge3choose1_2",
    MessageContentPhone = "Message_Guide_Rouge3choose1_2",
    MessageId = 301802
  },
  [301803] = {
    MessageContentGamePad = "Message_Guide_Rouge3choose1_3",
    MessageContentPC = "Message_Guide_Rouge3choose1_3",
    MessageContentPhone = "Message_Guide_Rouge3choose1_3",
    MessageId = 301803
  },
  [301804] = {
    MessageContentGamePad = "Message_Guide_Rouge3choose1_4",
    MessageContentPC = "Message_Guide_Rouge3choose1_4",
    MessageContentPhone = "Message_Guide_Rouge3choose1_4",
    MessageId = 301804
  },
  [301805] = {
    MessageContentGamePad = "Message_Guide_Rouge3choose1_5",
    MessageContentPC = "Message_Guide_Rouge3choose1_5",
    MessageContentPhone = "Message_Guide_Rouge3choose1_5",
    MessageId = 301805
  },
  [301806] = {
    MessageContentGamePad = "Message_Guide_Rouge3choose1_6",
    MessageContentPC = "Message_Guide_Rouge3choose1_6",
    MessageContentPhone = "Message_Guide_Rouge3choose1_6",
    MessageId = 301806
  },
  [301807] = {
    MessageContentGamePad = "Message_Guide_Rouge3choose1_7",
    MessageContentPC = "Message_Guide_Rouge3choose1_7",
    MessageContentPhone = "Message_Guide_Rouge3choose1_7",
    MessageId = 301807
  },
  [301808] = {
    MessageContentGamePad = "Message_Guide_Rouge3choose1_8_Pad",
    MessageContentPC = "Message_Guide_Rouge3choose1_8",
    MessageContentPhone = "Message_Guide_Rouge3choose1_8",
    MessageId = 301808
  },
  [301809] = {
    MessageContentGamePad = "Message_Guide_Rouge3choose1_9",
    MessageContentPC = "Message_Guide_Rouge3choose1_9",
    MessageContentPhone = "Message_Guide_Rouge3choose1_9",
    MessageId = 301809
  },
  [301901] = {
    MessageContentGamePad = "Message_Guide_RougeShop_1",
    MessageContentPC = "Message_Guide_RougeShop_1",
    MessageContentPhone = "Message_Guide_RougeShop_1",
    MessageId = 301901
  },
  [301902] = {
    MessageContentGamePad = "Message_Guide_RougeShop_2",
    MessageContentPC = "Message_Guide_RougeShop_2",
    MessageContentPhone = "Message_Guide_RougeShop_2",
    MessageId = 301902
  },
  [302001] = {
    MessageContentGamePad = "Message_Guide_GameEvent_1",
    MessageContentPC = "Message_Guide_GameEvent_1",
    MessageContentPhone = "Message_Guide_GameEvent_1",
    MessageId = 302001
  },
  [302002] = {
    MessageContentGamePad = "Message_Guide_GameEvent_2_Pad",
    MessageContentPC = "Message_Guide_GameEvent_2_PC",
    MessageContentPhone = "Message_Guide_GameEvent_2_Phone",
    MessageId = 302002
  },
  [302003] = {
    MessageContentGamePad = "Message_Guide_GameEvent_3_Pad",
    MessageContentPC = "Message_Guide_GameEvent_3",
    MessageContentPhone = "Message_Guide_GameEvent_3",
    MessageId = 302003
  },
  [302101] = {
    MessageContentGamePad = "Message_Guide_RougeSettlement_1",
    MessageContentPC = "Message_Guide_RougeSettlement_1",
    MessageContentPhone = "Message_Guide_RougeSettlement_1",
    MessageId = 302101
  },
  [302102] = {
    MessageContentGamePad = "Message_Guide_RougeSettlement_2",
    MessageContentPC = "Message_Guide_RougeSettlement_2",
    MessageContentPhone = "Message_Guide_RougeSettlement_2",
    MessageId = 302102
  },
  [302201] = {
    MessageContentGamePad = "Message_Guide_RougeContract_1",
    MessageContentPC = "Message_Guide_RougeContract_1",
    MessageContentPhone = "Message_Guide_RougeContract_1",
    MessageId = 302201
  },
  [302202] = {
    MessageContentGamePad = "Message_Guide_RougeContract_2",
    MessageContentPC = "Message_Guide_RougeContract_2",
    MessageContentPhone = "Message_Guide_RougeContract_2",
    MessageId = 302202
  },
  [302203] = {
    MessageContentGamePad = "Message_Guide_RougeContract_3",
    MessageContentPC = "Message_Guide_RougeContract_3",
    MessageContentPhone = "Message_Guide_RougeContract_3",
    MessageId = 302203
  },
  [302204] = {
    MessageContentGamePad = "Message_Guide_RougeContract_4",
    MessageContentPC = "Message_Guide_RougeContract_4",
    MessageContentPhone = "Message_Guide_RougeContract_4",
    MessageId = 302204
  },
  [302205] = {
    MessageContentGamePad = "Message_Guide_RougeContract_5",
    MessageContentPC = "Message_Guide_RougeContract_5",
    MessageContentPhone = "Message_Guide_RougeContract_5",
    MessageId = 302205
  },
  [302206] = {
    MessageContentGamePad = "Message_Guide_RougeContract_6",
    MessageContentPC = "Message_Guide_RougeContract_6",
    MessageContentPhone = "Message_Guide_RougeContract_6",
    MessageId = 302206
  },
  [302301] = {
    MessageContentGamePad = "Guide_Message_AbyssUI_1",
    MessageContentPC = "Guide_Message_AbyssUI_1",
    MessageContentPhone = "Guide_Message_AbyssUI_1",
    MessageId = 302301,
    MessageType = "Guide"
  },
  [302302] = {
    MessageContentGamePad = "Guide_Message_AbyssUI_2",
    MessageContentPC = "Guide_Message_AbyssUI_2",
    MessageContentPhone = "Guide_Message_AbyssUI_2",
    MessageId = 302302,
    MessageType = "Guide"
  },
  [302303] = {
    MessageContentGamePad = "Guide_Message_AbyssUI_3_Pad",
    MessageContentPC = "Guide_Message_AbyssUI_3",
    MessageContentPhone = "Guide_Message_AbyssUI_3",
    MessageId = 302303,
    MessageType = "Guide"
  },
  [302304] = {
    MessageContentGamePad = "Guide_Message_AbyssUI_4",
    MessageContentPC = "Guide_Message_AbyssUI_4",
    MessageContentPhone = "Guide_Message_AbyssUI_4",
    MessageId = 302304,
    MessageType = "Guide"
  },
  [302305] = {
    MessageContentGamePad = "Guide_Message_AbyssUI_5",
    MessageContentPC = "Guide_Message_AbyssUI_5",
    MessageContentPhone = "Guide_Message_AbyssUI_5",
    MessageId = 302305,
    MessageType = "Guide"
  },
  [302306] = {
    MessageContentGamePad = "Guide_Message_AbyssUI_6",
    MessageContentPC = "Guide_Message_AbyssUI_6",
    MessageContentPhone = "Guide_Message_AbyssUI_6",
    MessageId = 302306,
    MessageType = "Guide"
  },
  [302307] = {
    MessageContentGamePad = "Guide_Message_AbyssUI_7",
    MessageContentPC = "Guide_Message_AbyssUI_7",
    MessageContentPhone = "Guide_Message_AbyssUI_7",
    MessageId = 302307,
    MessageType = "Guide"
  },
  [302308] = {
    MessageContentGamePad = "Guide_Message_AbyssUI_8",
    MessageContentPC = "Guide_Message_AbyssUI_8",
    MessageContentPhone = "Guide_Message_AbyssUI_8",
    MessageId = 302308,
    MessageType = "Guide"
  },
  [302401] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_1",
    MessageContentPC = "Guide_Message_ModArchiveUI_1",
    MessageContentPhone = "Guide_Message_ModArchiveUI_1",
    MessageId = 302401,
    MessageType = "Guide"
  },
  [302402] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_2_Pad",
    MessageContentPC = "Guide_Message_ModArchiveUI_2",
    MessageContentPhone = "Guide_Message_ModArchiveUI_PHONE_2",
    MessageId = 302402,
    MessageType = "Guide"
  },
  [302403] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_3_Pad",
    MessageContentPC = "Guide_Message_ModArchiveUI_3_PC",
    MessageContentPhone = "Guide_Message_ModArchiveUI_3_PHONE",
    MessageId = 302403,
    MessageType = "Guide"
  },
  [302404] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_4",
    MessageContentPC = "Guide_Message_ModArchiveUI_4",
    MessageContentPhone = "Guide_Message_ModArchiveUI_4",
    MessageId = 302404,
    MessageType = "Guide"
  },
  [302405] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_5",
    MessageContentPC = "Guide_Message_ModArchiveUI_5",
    MessageContentPhone = "Guide_Message_ModArchiveUI_5",
    MessageId = 302405,
    MessageType = "Guide"
  },
  [302406] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_6_Pad",
    MessageContentPC = "Guide_Message_ModArchiveUI_6",
    MessageContentPhone = "Guide_Message_ModArchiveUI_6",
    MessageId = 302406,
    MessageType = "Guide"
  },
  [302407] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_7",
    MessageContentPC = "Guide_Message_ModArchiveUI_7",
    MessageContentPhone = "Guide_Message_ModArchiveUI_7",
    MessageId = 302407,
    MessageType = "Guide"
  },
  [302408] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_8_Pad",
    MessageContentPC = "Guide_Message_ModArchiveUI_8",
    MessageContentPhone = "Guide_Message_ModArchiveUI_8",
    MessageId = 302408,
    MessageType = "Guide"
  },
  [302409] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_9",
    MessageContentPC = "Guide_Message_ModArchiveUI_9",
    MessageContentPhone = "Guide_Message_ModArchiveUI_9",
    MessageId = 302409,
    MessageType = "Guide"
  },
  [302410] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_10",
    MessageContentPC = "Guide_Message_ModArchiveUI_10",
    MessageContentPhone = "Guide_Message_ModArchiveUI_10",
    MessageId = 302410,
    MessageType = "Guide"
  },
  [302411] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_11_Pad",
    MessageContentPC = "Guide_Message_ModArchiveUI_11",
    MessageContentPhone = "Guide_Message_ModArchiveUI_11",
    MessageId = 302411,
    MessageType = "Guide"
  },
  [302412] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_12_Pad",
    MessageContentPC = "Guide_Message_ModArchiveUI_12",
    MessageContentPhone = "Guide_Message_ModArchiveUI_12",
    MessageId = 302412,
    MessageType = "Guide"
  },
  [302413] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_13_Pad",
    MessageContentPC = "Guide_Message_ModArchiveUI_13",
    MessageContentPhone = "Guide_Message_ModArchiveUI_13",
    MessageId = 302413,
    MessageType = "Guide"
  },
  [302414] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_14",
    MessageContentPC = "Guide_Message_ModArchiveUI_14",
    MessageContentPhone = "Guide_Message_ModArchiveUI_14",
    MessageId = 302414,
    MessageType = "Guide"
  },
  [302415] = {
    MessageContentGamePad = "Guide_Message_ModArchiveUI_15_Pad",
    MessageContentPC = "Guide_Message_ModArchiveUI_15",
    MessageContentPhone = "Guide_Message_ModArchiveUI_15",
    MessageId = 302415,
    MessageType = "Guide"
  },
  [302501] = {
    MessageContentGamePad = "Guide_Message_DailyGoalUI_1",
    MessageContentPC = "Guide_Message_DailyGoalUI_1",
    MessageContentPhone = "Guide_Message_DailyGoalUI_1",
    MessageId = 302501,
    MessageType = "Guide"
  },
  [302502] = {
    MessageContentGamePad = "Guide_Message_DailyGoalUI_2_Pad",
    MessageContentPC = "Guide_Message_DailyGoalUI_2",
    MessageContentPhone = "Guide_Message_DailyGoalUI_PHONE_2",
    MessageId = 302502,
    MessageType = "Guide"
  },
  [302503] = {
    MessageContentGamePad = "Guide_Message_DailyGoalUI_3_Pad",
    MessageContentPC = "Guide_Message_DailyGoalUI_3",
    MessageContentPhone = "Guide_Message_DailyGoalUI_3",
    MessageId = 302503,
    MessageType = "Guide"
  },
  [302504] = {
    MessageContentGamePad = "Guide_Message_DailyGoalUI_4",
    MessageContentPC = "Guide_Message_DailyGoalUI_4",
    MessageContentPhone = "Guide_Message_DailyGoalUI_4",
    MessageId = 302504,
    MessageType = "Guide"
  },
  [302505] = {
    MessageContentGamePad = "Guide_Message_DailyGoalUI_5",
    MessageContentPC = "Guide_Message_DailyGoalUI_5",
    MessageContentPhone = "Guide_Message_DailyGoalUI_5",
    MessageId = 302505,
    MessageType = "Guide"
  },
  [302601] = {
    MessageContentGamePad = "Message_Guide_PetTrain_1_Pad",
    MessageContentPC = "Message_Guide_PetTrain_1",
    MessageContentPhone = "Message_Guide_PetTrain_1",
    MessageId = 302601,
    MessageType = "Guide"
  },
  [302602] = {
    MessageContentGamePad = "Message_Guide_PetTrain_2_Pad",
    MessageContentPC = "Message_Guide_PetTrain_2",
    MessageContentPhone = "Message_Guide_PetTrain_2",
    MessageId = 302602,
    MessageType = "Guide"
  },
  [302603] = {
    MessageContentGamePad = "Message_Guide_PetTrain_3_Pad",
    MessageContentPC = "Message_Guide_PetTrain_3",
    MessageContentPhone = "Message_Guide_PetTrain_3",
    MessageId = 302603,
    MessageType = "Guide"
  },
  [302701] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_1_Pad",
    MessageContentPC = "Message_Guide_ChangeColor_1",
    MessageContentPhone = "Message_Guide_ChangeColor_1",
    MessageId = 302701,
    MessageType = "Guide"
  },
  [302702] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_2_Pad",
    MessageContentPC = "Message_Guide_ChangeColor_2",
    MessageContentPhone = "Message_Guide_ChangeColor_2",
    MessageId = 302702,
    MessageType = "Guide"
  },
  [302703] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_3_Pad",
    MessageContentPC = "Message_Guide_ChangeColor_3",
    MessageContentPhone = "Message_Guide_ChangeColor_3",
    MessageId = 302703,
    MessageType = "Guide"
  },
  [302704] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_4",
    MessageContentPC = "Message_Guide_ChangeColor_4",
    MessageContentPhone = "Message_Guide_ChangeColor_4",
    MessageId = 302704,
    MessageType = "Guide"
  },
  [302705] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_5",
    MessageContentPC = "Message_Guide_ChangeColor_5",
    MessageContentPhone = "Message_Guide_ChangeColor_5",
    MessageId = 302705,
    MessageType = "Guide"
  },
  [302706] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_6",
    MessageContentPC = "Message_Guide_ChangeColor_6",
    MessageContentPhone = "Message_Guide_ChangeColor_6",
    MessageId = 302706,
    MessageType = "Guide"
  },
  [302707] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_7_Pad",
    MessageContentPC = "Message_Guide_ChangeColor_7",
    MessageContentPhone = "Message_Guide_ChangeColor_7",
    MessageId = 302707,
    MessageType = "Guide"
  },
  [302708] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_8_Pad",
    MessageContentPC = "Message_Guide_ChangeColor_8",
    MessageContentPhone = "Message_Guide_ChangeColor_8",
    MessageId = 302708,
    MessageType = "Guide"
  },
  [302709] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_9_Pad",
    MessageContentPC = "Message_Guide_ChangeColor_9",
    MessageContentPhone = "Message_Guide_ChangeColor_9",
    MessageId = 302709,
    MessageType = "Guide"
  },
  [302710] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_10_Pad",
    MessageContentPC = "Message_Guide_ChangeColor_10",
    MessageContentPhone = "Message_Guide_ChangeColor_10",
    MessageId = 302710,
    MessageType = "Guide"
  },
  [302711] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_11_Pad",
    MessageContentPC = "Message_Guide_ChangeColor_11",
    MessageContentPhone = "Message_Guide_ChangeColor_11",
    MessageId = 302711,
    MessageType = "Guide"
  },
  [302712] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_12",
    MessageContentPC = "Message_Guide_ChangeColor_12",
    MessageContentPhone = "Message_Guide_ChangeColor_12",
    MessageId = 302712,
    MessageType = "Guide"
  },
  [302713] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_13_Pad",
    MessageContentPC = "Message_Guide_ChangeColor_13",
    MessageContentPhone = "Message_Guide_ChangeColor_13",
    MessageId = 302713,
    MessageType = "Guide"
  },
  [302714] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_14",
    MessageContentPC = "Message_Guide_ChangeColor_14",
    MessageContentPhone = "Message_Guide_ChangeColor_14",
    MessageId = 302714,
    MessageType = "Guide"
  },
  [302715] = {
    MessageContentGamePad = "Message_Guide_ChangeColor_15",
    MessageContentPC = "Message_Guide_ChangeColor_15",
    MessageContentPhone = "Message_Guide_ChangeColor_15",
    MessageId = 302715,
    MessageType = "Guide"
  },
  [302801] = {
    MessageContentGamePad = "Message_Guide_Mail_1",
    MessageContentPC = "Message_Guide_Mail_1",
    MessageContentPhone = "Message_Guide_Mail_1",
    MessageId = 302801,
    MessageType = "Guide"
  },
  [302802] = {
    MessageContentGamePad = "Message_Guide_Mail_2_Pad",
    MessageContentPC = "Message_Guide_Mail_2_PC",
    MessageContentPhone = "Message_Guide_Mail_2_Phone",
    MessageId = 302802,
    MessageType = "Guide"
  },
  [302803] = {
    MessageContentGamePad = "Message_Guide_Mail_3",
    MessageContentPC = "Message_Guide_Mail_3",
    MessageContentPhone = "Message_Guide_Mail_3",
    MessageId = 302803,
    MessageType = "Guide"
  },
  [302804] = {
    MessageContentGamePad = "Message_Guide_Mail_4",
    MessageContentPC = "Message_Guide_Mail_4",
    MessageContentPhone = "Message_Guide_Mail_4",
    MessageId = 302804,
    MessageType = "Guide"
  },
  [302805] = {
    MessageContentGamePad = "Message_Guide_Mail_5",
    MessageContentPC = "Message_Guide_Mail_5",
    MessageContentPhone = "Message_Guide_Mail_5",
    MessageId = 302805,
    MessageType = "Guide"
  },
  [302806] = {
    MessageContentGamePad = "Message_Guide_Mail_6",
    MessageContentPC = "Message_Guide_Mail_6",
    MessageContentPhone = "Message_Guide_Mail_6",
    MessageId = 302806,
    MessageType = "Guide"
  },
  [302807] = {
    MessageContentGamePad = "Message_Guide_Mail_7",
    MessageContentPC = "Message_Guide_Mail_7",
    MessageContentPhone = "Message_Guide_Mail_7",
    MessageId = 302807,
    MessageType = "Guide"
  },
  [302808] = {
    MessageContentGamePad = "Message_Guide_Mail_8",
    MessageContentPC = "Message_Guide_Mail_8",
    MessageContentPhone = "Message_Guide_Mail_8",
    MessageId = 302808,
    MessageType = "Guide"
  },
  [302809] = {
    MessageContentGamePad = "Message_Guide_Mail_9",
    MessageContentPC = "Message_Guide_Mail_9",
    MessageContentPhone = "Message_Guide_Mail_9",
    MessageId = 302809,
    MessageType = "Guide"
  },
  [302810] = {
    MessageContentGamePad = "Message_Guide_Mail_10_Pad",
    MessageContentPC = "Message_Guide_Mail_10",
    MessageContentPhone = "Message_Guide_Mail_10",
    MessageId = 302810,
    MessageType = "Guide"
  },
  [302811] = {
    MessageContentGamePad = "Message_Guide_Mail_11_Pad",
    MessageContentPC = "Message_Guide_Mail_11",
    MessageContentPhone = "Message_Guide_Mail_11",
    MessageId = 302811,
    MessageType = "Guide"
  },
  [302812] = {
    MessageContentGamePad = "Message_Guide_Mail_12_Pad",
    MessageContentPC = "Message_Guide_Mail_12",
    MessageContentPhone = "Message_Guide_Mail_12",
    MessageId = 302812,
    MessageType = "Guide"
  },
  [302904] = {
    MessageContentGamePad = "Message_Guide_DungeonSec_4",
    MessageContentPC = "Message_Guide_DungeonSec_4",
    MessageContentPhone = "Message_Guide_DungeonSec_4",
    MessageId = 302904,
    MessageType = "Guide"
  },
  [302905] = {
    MessageContentGamePad = "Message_Guide_Mail_2_Pad",
    MessageContentPC = "Message_Guide_Mail_2_PC",
    MessageContentPhone = "Message_Guide_Mail_2_Phone",
    MessageId = 302905,
    MessageType = "Guide"
  },
  [302906] = {
    MessageContentGamePad = "Message_Guide_DungeonSec_6_Pad",
    MessageContentPC = "Message_Guide_DungeonSec_6",
    MessageContentPhone = "Message_Guide_DungeonSec_6",
    MessageId = 302906,
    MessageType = "Guide"
  },
  [302907] = {
    MessageContentGamePad = "Message_Guide_DungeonSec_7",
    MessageContentPC = "Message_Guide_DungeonSec_7",
    MessageContentPhone = "Message_Guide_DungeonSec_7",
    MessageId = 302907,
    MessageType = "Guide"
  },
  [302908] = {
    MessageContentGamePad = "Message_Guide_DungeonSec_8",
    MessageContentPC = "Message_Guide_DungeonSec_8",
    MessageContentPhone = "Message_Guide_DungeonSec_8",
    MessageId = 302908,
    MessageType = "Guide"
  },
  [302909] = {
    MessageContentGamePad = "Message_Guide_DungeonSec_9_Pad",
    MessageContentPC = "Message_Guide_DungeonSec_9",
    MessageContentPhone = "Message_Guide_DungeonSec_9",
    MessageId = 302909,
    MessageType = "Guide"
  },
  [302910] = {
    MessageContentGamePad = "Message_Guide_DungeonSec_10_Pad",
    MessageContentPC = "Message_Guide_DungeonSec_10",
    MessageContentPhone = "Message_Guide_DungeonSec_10",
    MessageId = 302910,
    MessageType = "Guide"
  },
  [302911] = {
    MessageContentGamePad = "Message_Guide_DungeonSec_11",
    MessageContentPC = "Message_Guide_DungeonSec_11",
    MessageContentPhone = "Message_Guide_DungeonSec_11",
    MessageId = 302911,
    MessageType = "Guide"
  },
  [302912] = {
    MessageContentGamePad = "Message_Guide_DungeonSec_12",
    MessageContentPC = "Message_Guide_DungeonSec_12",
    MessageContentPhone = "Message_Guide_DungeonSec_12",
    MessageId = 302912,
    MessageType = "Guide"
  },
  [302913] = {
    MessageContentGamePad = "Message_Guide_DungeonSec_13_Pad",
    MessageContentPC = "Message_Guide_DungeonSec_13",
    MessageContentPhone = "Message_Guide_DungeonSec_13",
    MessageId = 302913,
    MessageType = "Guide"
  },
  [302914] = {
    MessageContentGamePad = "Message_Guide_DungeonSec_14_Pad",
    MessageContentPC = "Message_Guide_DungeonSec_14",
    MessageContentPhone = "Message_Guide_DungeonSec_14",
    MessageId = 302914,
    MessageType = "Guide"
  },
  [303001] = {
    MessageContentGamePad = "UIGuide_HardBoss_01",
    MessageContentPC = "UIGuide_HardBoss_01",
    MessageContentPhone = "UIGuide_HardBoss_01",
    MessageId = 303001,
    MessageType = "Guide"
  },
  [303002] = {
    MessageContentGamePad = "Message_Guide_HardBoss_2_Pad",
    MessageContentPC = "Message_Guide_HardBoss_2",
    MessageContentPhone = "Message_Guide_HardBoss_2",
    MessageId = 303002,
    MessageType = "Guide"
  },
  [303003] = {
    MessageContentGamePad = "Message_Guide_HardBoss_3",
    MessageContentPC = "Message_Guide_HardBoss_3",
    MessageContentPhone = "Message_Guide_HardBoss_3",
    MessageId = 303003,
    MessageType = "Guide"
  },
  [303004] = {
    MessageContentGamePad = "Message_Guide_HardBoss_4",
    MessageContentPC = "Message_Guide_HardBoss_4",
    MessageContentPhone = "Message_Guide_HardBoss_4",
    MessageId = 303004,
    MessageType = "Guide"
  },
  [303005] = {
    MessageContentGamePad = "Message_Guide_HardBoss_5_Pad",
    MessageContentPC = "Message_Guide_HardBoss_5",
    MessageContentPhone = "Message_Guide_HardBoss_5",
    MessageId = 303005,
    MessageType = "Guide"
  },
  [303101] = {
    MessageContentGamePad = "Message_Guide_WalnutShop_1",
    MessageContentPC = "Message_Guide_WalnutShop_1",
    MessageContentPhone = "Message_Guide_WalnutShop_1",
    MessageId = 303101,
    MessageType = "Guide"
  },
  [303102] = {
    MessageContentGamePad = "Message_Guide_Mail_2_Pad",
    MessageContentPC = "Message_Guide_Mail_2_PC",
    MessageContentPhone = "Message_Guide_Mail_2_Phone",
    MessageId = 303102,
    MessageType = "Guide"
  },
  [303103] = {
    MessageContentGamePad = "Message_Guide_WalnutShop_3_Pad",
    MessageContentPC = "Message_Guide_WalnutShop_3",
    MessageContentPhone = "Message_Guide_WalnutShop_3",
    MessageId = 303103,
    MessageType = "Guide"
  },
  [303104] = {
    MessageContentGamePad = "Message_Guide_WalnutShop_4_Pad",
    MessageContentPC = "Message_Guide_WalnutShop_4",
    MessageContentPhone = "Message_Guide_WalnutShop_4",
    MessageId = 303104,
    MessageType = "Guide"
  },
  [303105] = {
    MessageContentGamePad = "Message_Guide_WalnutShop_5_Pad",
    MessageContentPC = "Message_Guide_WalnutShop_5",
    MessageContentPhone = "Message_Guide_WalnutShop_5",
    MessageId = 303105,
    MessageType = "Guide"
  },
  [303106] = {
    MessageContentGamePad = "Message_Guide_WalnutShop_6",
    MessageContentPC = "Message_Guide_WalnutShop_6",
    MessageContentPhone = "Message_Guide_WalnutShop_6",
    MessageId = 303106,
    MessageType = "Guide"
  },
  [303107] = {
    MessageContentGamePad = "Message_Guide_WalnutShop_7",
    MessageContentPC = "Message_Guide_WalnutShop_7",
    MessageContentPhone = "Message_Guide_WalnutShop_7",
    MessageId = 303107,
    MessageType = "Guide"
  },
  [303201] = {
    MessageContentGamePad = "Message_Guide_PetTraits_1",
    MessageContentPC = "Message_Guide_PetTraits_1",
    MessageContentPhone = "Message_Guide_PetTraits_1",
    MessageId = 303201,
    MessageType = "Guide"
  },
  [303202] = {
    MessageContentGamePad = "Message_Guide_PetTraits_2_Pad",
    MessageContentPC = "Message_Guide_PetTraits_2",
    MessageContentPhone = "Message_Guide_PetTraits_2",
    MessageId = 303202,
    MessageType = "Guide"
  },
  [303203] = {
    MessageContentGamePad = "Message_Guide_PetTrain_6",
    MessageContentPC = "Message_Guide_PetTrain_6",
    MessageContentPhone = "Message_Guide_PetTrain_6",
    MessageId = 303203,
    MessageType = "Guide"
  },
  [303204] = {
    MessageContentGamePad = "Message_Guide_PetTraits_4",
    MessageContentPC = "Message_Guide_PetTraits_4",
    MessageContentPhone = "Message_Guide_PetTraits_4",
    MessageId = 303204,
    MessageType = "Guide"
  },
  [303205] = {
    MessageContentGamePad = "Message_Guide_PetTraits_5",
    MessageContentPC = "Message_Guide_PetTraits_5",
    MessageContentPhone = "Message_Guide_PetTraits_5",
    MessageId = 303205,
    MessageType = "Guide"
  },
  [303206] = {
    MessageContentGamePad = "Message_Guide_PetTraits_6_Pad",
    MessageContentPC = "Message_Guide_PetTraits_6",
    MessageContentPhone = "Message_Guide_PetTraits_6",
    MessageId = 303206,
    MessageType = "Guide"
  },
  [303207] = {
    MessageContentGamePad = "Message_Guide_PetTraits_7_Pad",
    MessageContentPC = "Message_Guide_PetTraits_7",
    MessageContentPhone = "Message_Guide_PetTraits_7",
    MessageId = 303207,
    MessageType = "Guide"
  },
  [303301] = {
    MessageContentGamePad = "Message_Guide_MaerJ_Pad",
    MessageContentPC = "Message_Guide_MaerJ",
    MessageContentPhone = "Message_Guide_MaerJ",
    MessageId = 303301,
    MessageType = "Guide"
  },
  [303302] = {
    MessageContentGamePad = "Message_Guide_MaerJ_Pad_1",
    MessageContentPC = "Message_Guide_MaerJ_1",
    MessageContentPhone = "Message_Guide_MaerJ_1",
    MessageId = 303302,
    MessageType = "Guide"
  },
  [303303] = {
    MessageContentGamePad = "Message_Guide_MaerJ_Pad_2",
    MessageContentPC = "Message_Guide_MaerJ_2",
    MessageContentPhone = "Message_Guide_MaerJ_2",
    MessageId = 303303,
    MessageType = "Guide"
  },
  [303401] = {
    MessageContentGamePad = "Message_Guide_Intron_1",
    MessageContentPC = "Message_Guide_Intron_1",
    MessageContentPhone = "Message_Guide_Intron_1",
    MessageId = 303401,
    MessageType = "Guide"
  },
  [303402] = {
    MessageContentGamePad = "Message_Guide_OpenArmory_Pad",
    MessageContentPC = "Message_Guide_OpenArmory_PC",
    MessageContentPhone = "Message_Guide_OpenArmory_Phone",
    MessageId = 303402,
    MessageType = "Guide"
  },
  [303403] = {
    MessageContentGamePad = "Message_Guide_Intron_3_Pad",
    MessageContentPC = "Message_Guide_Intron_3",
    MessageContentPhone = "Message_Guide_Intron_3",
    MessageId = 303403,
    MessageType = "Guide"
  },
  [303404] = {
    MessageContentGamePad = "Message_Guide_Intron_4_Pad",
    MessageContentPC = "Message_Guide_Intron_4",
    MessageContentPhone = "Message_Guide_Intron_4",
    MessageId = 303404,
    MessageType = "Guide"
  },
  [303405] = {
    MessageContentGamePad = "Message_Guide_Intron_5_Pad",
    MessageContentPC = "Message_Guide_Intron_5",
    MessageContentPhone = "Message_Guide_Intron_5",
    MessageId = 303405,
    MessageType = "Guide"
  },
  [303406] = {
    MessageContentGamePad = "Message_Guide_Intron_6_Pad",
    MessageContentPC = "Message_Guide_Intron_6",
    MessageContentPhone = "Message_Guide_Intron_6",
    MessageId = 303406,
    MessageType = "Guide"
  },
  [303407] = {
    MessageContentGamePad = "Message_Guide_Intron_7_Pad",
    MessageContentPC = "Message_Guide_Intron_7",
    MessageContentPhone = "Message_Guide_Intron_7",
    MessageId = 303407,
    MessageType = "Guide"
  },
  [310001] = {
    MessageContentGamePad = "Message_Guide_Fish01",
    MessageContentPC = "Message_Guide_Fish01",
    MessageContentPhone = "Message_Guide_Fish01",
    MessageId = 310001,
    MessageType = "Guide"
  },
  [310002] = {
    MessageContentGamePad = "Message_Guide_Fish02",
    MessageContentPC = "Message_Guide_Fish02",
    MessageContentPhone = "Message_Guide_Fish02",
    MessageId = 310002,
    MessageType = "Guide"
  },
  [310003] = {
    MessageContentGamePad = "Message_Guide_Fish03",
    MessageContentPC = "Message_Guide_Fish03",
    MessageContentPhone = "Message_Guide_Fish03",
    MessageId = 310003,
    MessageType = "Guide"
  },
  [310004] = {
    MessageContentGamePad = "Message_Guide_Fish04",
    MessageContentPC = "Message_Guide_Fish04",
    MessageContentPhone = "Message_Guide_Fish04",
    MessageId = 310004,
    MessageType = "Guide"
  },
  [310005] = {
    MessageContentGamePad = "Message_Guide_Fish05",
    MessageContentPC = "Message_Guide_Fish05",
    MessageContentPhone = "Message_Guide_Fish05",
    MessageId = 310005,
    MessageType = "Guide"
  },
  [310101] = {
    MessageContentGamePad = "Message_Guide_Tracking_1_PAD",
    MessageContentPC = "Message_Guide_Tracking_1",
    MessageContentPhone = "Message_Guide_Tracking_1_PHONE",
    MessageId = 310101,
    MessageType = "Guide"
  },
  [320001] = {
    MessageContentGamePad = "Message_Guide_Dispatch_01",
    MessageContentPC = "Message_Guide_Dispatch_01",
    MessageContentPhone = "Message_Guide_Dispatch_01",
    MessageId = 320001,
    MessageType = "Guide"
  },
  [320002] = {
    MessageContentGamePad = "Message_Guide_Dispatch_02_Pad",
    MessageContentPC = "Message_Guide_Dispatch_02",
    MessageContentPhone = "Message_Guide_Dispatch_02",
    MessageId = 320002,
    MessageType = "Guide"
  },
  [320003] = {
    MessageContentGamePad = "Message_Guide_Dispatch_03",
    MessageContentPC = "Message_Guide_Dispatch_03",
    MessageContentPhone = "Message_Guide_Dispatch_03",
    MessageId = 320003,
    MessageType = "Guide"
  },
  [320004] = {
    MessageContentGamePad = "Message_Guide_Dispatch_04",
    MessageContentPC = "Message_Guide_Dispatch_04",
    MessageContentPhone = "Message_Guide_Dispatch_04",
    MessageId = 320004,
    MessageType = "Guide"
  },
  [320005] = {
    MessageContentGamePad = "Message_Guide_Dispatch_05",
    MessageContentPC = "Message_Guide_Dispatch_05",
    MessageContentPhone = "Message_Guide_Dispatch_05",
    MessageId = 320005,
    MessageType = "Guide"
  },
  [320006] = {
    MessageContentGamePad = "Message_Guide_Dispatch_06",
    MessageContentPC = "Message_Guide_Dispatch_06",
    MessageContentPhone = "Message_Guide_Dispatch_06",
    MessageId = 320006,
    MessageType = "Guide"
  },
  [320007] = {
    MessageContentGamePad = "Message_Guide_Dispatch_07_Pad",
    MessageContentPC = "Message_Guide_Dispatch_07",
    MessageContentPhone = "Message_Guide_Dispatch_07",
    MessageId = 320007,
    MessageType = "Guide"
  },
  [320008] = {
    MessageContentGamePad = "Message_Guide_Dispatch_08",
    MessageContentPC = "Message_Guide_Dispatch_08",
    MessageContentPhone = "Message_Guide_Dispatch_08",
    MessageId = 320008,
    MessageType = "Guide"
  },
  [320009] = {
    MessageContentGamePad = "Message_Guide_Dispatch_09_Pad",
    MessageContentPC = "Message_Guide_Dispatch_09",
    MessageContentPhone = "Message_Guide_Dispatch_09",
    MessageId = 320009,
    MessageType = "Guide"
  },
  [320010] = {
    MessageContentGamePad = "Message_Guide_Dispatch_10",
    MessageContentPC = "Message_Guide_Dispatch_10",
    MessageContentPhone = "Message_Guide_Dispatch_10",
    MessageId = 320010,
    MessageType = "Guide"
  },
  [320011] = {
    MessageContentGamePad = "Message_Guide_Dispatch_11",
    MessageContentPC = "Message_Guide_Dispatch_11",
    MessageContentPhone = "Message_Guide_Dispatch_11",
    MessageId = 320011,
    MessageType = "Guide"
  },
  [320012] = {
    MessageContentGamePad = "Message_Guide_Dispatch_12",
    MessageContentPC = "Message_Guide_Dispatch_12",
    MessageContentPhone = "Message_Guide_Dispatch_12",
    MessageId = 320012,
    MessageType = "Guide"
  },
  [330001] = {
    MessageContentGamePad = "UIGuide_Sojourns_01_Pad",
    MessageContentPC = "UIGuide_Sojourns_01",
    MessageContentPhone = "UIGuide_Sojourns_01",
    MessageId = 330001,
    MessageType = "Guide"
  },
  [330002] = {
    MessageContentGamePad = "UIGuide_Sojourns_02",
    MessageContentPC = "UIGuide_Sojourns_02",
    MessageContentPhone = "UIGuide_Sojourns_02",
    MessageId = 330002,
    MessageType = "Guide"
  },
  [330003] = {
    MessageContentGamePad = "UIGuide_Sojourns_03_Pad",
    MessageContentPC = "UIGuide_Sojourns_03",
    MessageContentPhone = "UIGuide_Sojourns_03",
    MessageId = 330003,
    MessageType = "Guide"
  },
  [330004] = {
    MessageContentGamePad = "UIGuide_Sojourns_04_Pad",
    MessageContentPC = "UIGuide_Sojourns_04",
    MessageContentPhone = "UIGuide_Sojourns_04",
    MessageId = 330004,
    MessageType = "Guide"
  },
  [330005] = {
    MessageContentGamePad = "UIGuide_Sojourns_05",
    MessageContentPC = "UIGuide_Sojourns_05",
    MessageContentPhone = "UIGuide_Sojourns_05",
    MessageId = 330005,
    MessageType = "Guide"
  },
  [330006] = {
    MessageContentGamePad = "UIGuide_Sojourns_06_Pad",
    MessageContentPC = "UIGuide_Sojourns_06",
    MessageContentPhone = "UIGuide_Sojourns_06",
    MessageId = 330006,
    MessageType = "Guide"
  },
  [330007] = {
    MessageContentGamePad = "UIGuide_Sojourns_07",
    MessageContentPC = "UIGuide_Sojourns_07",
    MessageContentPhone = "UIGuide_Sojourns_07",
    MessageId = 330007,
    MessageType = "Guide"
  },
  [900001] = {
    MessageContentPC = "MESSAGE_LOADING_1_PC",
    MessageContentPhone = "MESSAGE_LOADING_1_Phone",
    MessageId = 900001,
    MessageTitlePC = "MESSAGE_TITLE_BULLETJUMP_PC",
    MessageType = "LoadingText"
  },
  [900002] = {
    MessageContentPC = "MESSAGE_LOADING_2_PC",
    MessageContentPhone = "MESSAGE_LOADING_2_Phone",
    MessageId = 900002,
    MessageTitlePC = "UIGUIDE_TITLE_FALLATTACK",
    MessageType = "LoadingText"
  },
  [900003] = {
    MessageContentPC = "MESSAGE_LOADING_3_PC",
    MessageContentPhone = "MESSAGE_LOADING_3_Phone",
    MessageId = 900003,
    MessageTitlePC = "UIGUIDE_TITLE_SLIDEATTACK",
    MessageType = "LoadingText"
  },
  [900010] = {
    MessageContentPC = "MESSAGE_LOADING_10_PC",
    MessageContentPhone = "MESSAGE_LOADING_10_PC",
    MessageId = 900010,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_10_PC",
    MessageType = "LoadingText"
  },
  [900011] = {
    MessageContentPC = "MESSAGE_LOADING_11_PC",
    MessageContentPhone = "MESSAGE_LOADING_11_PC",
    MessageId = 900011,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_11_PC",
    MessageType = "LoadingText"
  },
  [900012] = {
    MessageContentPC = "MESSAGE_LOADING_12_PC",
    MessageContentPhone = "MESSAGE_LOADING_12_PC",
    MessageId = 900012,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_12_PC",
    MessageType = "LoadingText"
  },
  [900013] = {
    MessageContentPC = "MESSAGE_LOADING_13_PC",
    MessageContentPhone = "MESSAGE_LOADING_13_PC",
    MessageId = 900013,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_13_PC",
    MessageType = "LoadingText"
  },
  [900014] = {
    MessageContentPC = "MESSAGE_LOADING_14_PC",
    MessageContentPhone = "MESSAGE_LOADING_14_PC",
    MessageId = 900014,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_14_PC",
    MessageType = "LoadingText"
  },
  [900015] = {
    MessageContentPC = "MESSAGE_LOADING_15_PC",
    MessageContentPhone = "MESSAGE_LOADING_15_PC",
    MessageId = 900015,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_15_PC",
    MessageType = "LoadingText"
  },
  [900016] = {
    MessageContentPC = "MESSAGE_LOADING_16_PC",
    MessageContentPhone = "MESSAGE_LOADING_16_PC",
    MessageId = 900016,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_16_PC",
    MessageType = "LoadingText"
  },
  [900017] = {
    MessageContentPC = "MESSAGE_LOADING_17_PC",
    MessageContentPhone = "MESSAGE_LOADING_17_PC",
    MessageId = 900017,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_17_PC",
    MessageType = "LoadingText"
  },
  [900018] = {
    MessageContentPC = "MESSAGE_LOADING_18_PC",
    MessageContentPhone = "MESSAGE_LOADING_18_PC",
    MessageId = 900018,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_18_PC",
    MessageType = "LoadingText"
  },
  [900019] = {
    MessageContentPC = "MESSAGE_LOADING_19_PC",
    MessageContentPhone = "MESSAGE_LOADING_19_PC",
    MessageId = 900019,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_19_PC",
    MessageType = "LoadingText"
  },
  [900020] = {
    MessageContentPC = "MESSAGE_LOADING_20_PC",
    MessageContentPhone = "MESSAGE_LOADING_20_PC",
    MessageId = 900020,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_20_PC",
    MessageType = "LoadingText"
  },
  [900021] = {
    MessageContentPC = "MESSAGE_LOADING_21_PC",
    MessageContentPhone = "MESSAGE_LOADING_21_PC",
    MessageId = 900021,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_21_PC",
    MessageType = "LoadingText"
  },
  [900022] = {
    MessageContentPC = "MESSAGE_LOADING_22_PC",
    MessageContentPhone = "MESSAGE_LOADING_22_PC",
    MessageId = 900022,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_22_PC",
    MessageType = "LoadingText"
  },
  [900023] = {
    MessageContentPC = "MESSAGE_LOADING_23_PC",
    MessageContentPhone = "MESSAGE_LOADING_23_PC",
    MessageId = 900023,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_23_PC",
    MessageType = "LoadingText"
  },
  [900024] = {
    MessageContentPC = "MESSAGE_LOADING_24_PC",
    MessageContentPhone = "MESSAGE_LOADING_24_PC",
    MessageId = 900024,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_24_PC",
    MessageType = "LoadingText"
  },
  [900029] = {
    MessageContentPC = "MESSAGE_LOADING_29_PC",
    MessageContentPhone = "MESSAGE_LOADING_29_PC",
    MessageId = 900029,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_29_PC",
    MessageType = "LoadingText"
  },
  [900031] = {
    MessageContentPC = "MESSAGE_LOADING_31_PC",
    MessageContentPhone = "MESSAGE_LOADING_31_PC",
    MessageId = 900031,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_31_PC",
    MessageType = "LoadingText"
  },
  [900032] = {
    MessageContentPC = "MESSAGE_LOADING_32_PC",
    MessageContentPhone = "MESSAGE_LOADING_32_PC",
    MessageId = 900032,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_32_PC",
    MessageType = "LoadingText"
  },
  [900033] = {
    MessageContentPC = "MESSAGE_LOADING_33_PC",
    MessageContentPhone = "MESSAGE_LOADING_33_PC",
    MessageId = 900033,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_33_PC",
    MessageType = "LoadingText"
  },
  [900034] = {
    MessageContentPC = "MESSAGE_LOADING_34_PC",
    MessageContentPhone = "MESSAGE_LOADING_34_PC",
    MessageId = 900034,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_34_PC",
    MessageType = "LoadingText"
  },
  [900035] = {
    MessageContentPC = "MESSAGE_LOADING_35_PC",
    MessageContentPhone = "MESSAGE_LOADING_35_PC",
    MessageId = 900035,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_35_PC",
    MessageType = "LoadingText"
  },
  [900036] = {
    MessageContentPC = "MESSAGE_LOADING_36_PC",
    MessageContentPhone = "MESSAGE_LOADING_36_PC",
    MessageId = 900036,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_36_PC",
    MessageType = "LoadingText"
  },
  [900037] = {
    MessageContentPC = "MESSAGE_LOADING_37_PC",
    MessageContentPhone = "MESSAGE_LOADING_37_PC",
    MessageId = 900037,
    MessageTitlePC = "MESSAGE_TITLE_LOADING_37_PC",
    MessageType = "LoadingText"
  },
  [900039] = {
    MessageContentGamePad = "MESSAGE_BossLinen_ShieldTip_PC",
    MessageContentPC = "MESSAGE_BossLinen_ShieldTip_PC",
    MessageContentPhone = "MESSAGE_BossLinen_ShieldTip_PC",
    MessageId = 900039,
    MessageType = "Guide"
  },
  [900040] = {
    MessageContentGamePad = "MESSAGE_BossLinen_CondemnTip_PC",
    MessageContentPC = "MESSAGE_BossLinen_CondemnTip_PC",
    MessageContentPhone = "MESSAGE_BossLinen_CondemnTip_PC",
    MessageId = 900040,
    MessageType = "Guide"
  },
  [910001] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_910001_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_910001_PC",
    MessageId = 910001,
    MessageType = "Guide"
  },
  [990001] = {
    MessageContentPC = "MESSAGE_QUESTFINISHTEST_PC",
    MessageContentPhone = "MESSAGE_QUESTFINISHTEST_PC",
    MessageId = 990001,
    MessageType = "Guide"
  },
  [990002] = {
    MessageContentPC = "MESSAGE_QUESTFINISHTEST1_PC",
    MessageContentPhone = "MESSAGE_QUESTFINISHTEST1_PC",
    MessageId = 990002,
    MessageType = "Guide"
  },
  [990003] = {
    MessageContentPC = "MESSAGE_QUESTFINISHTEST2_PC",
    MessageContentPhone = "MESSAGE_QUESTFINISHTEST2_PC",
    MessageId = 990003,
    MessageType = "Guide"
  },
  [990004] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_PC",
    MessageId = 990004,
    MessageType = "Guide"
  },
  [990005] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_05_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_05_PC",
    MessageId = 990005,
    MessageType = "Guide"
  },
  [990006] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_06_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_06_PC",
    MessageId = 990006,
    MessageType = "Guide"
  },
  [990007] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_07_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_07_PC",
    MessageId = 990007,
    MessageType = "Guide"
  },
  [990008] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_08_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_08_PC",
    MessageId = 990008,
    MessageType = "Guide"
  },
  [990009] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_09_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_09_PC",
    MessageId = 990009,
    MessageType = "Guide"
  },
  [990010] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_10_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_10_PC",
    MessageId = 990010,
    MessageType = "Guide"
  },
  [990011] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_11_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_11_PC",
    MessageId = 990011,
    MessageType = "Guide"
  },
  [990012] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_12_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_12_PC",
    MessageId = 990012,
    MessageType = "Guide"
  },
  [990013] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_13_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_13_PC",
    MessageId = 990013,
    MessageType = "Guide"
  },
  [990014] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_14_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_14_PC",
    MessageId = 990014,
    MessageType = "Guide"
  },
  [990015] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_15_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_15_PC",
    MessageId = 990015,
    MessageType = "Guide"
  },
  [990016] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_16_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_16_PC",
    MessageId = 990016,
    MessageType = "Guide"
  },
  [990017] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_17_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_17_PC",
    MessageId = 990017,
    MessageType = "Guide"
  },
  [990018] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_18_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_18_PC",
    MessageId = 990018,
    MessageType = "Guide"
  },
  [990019] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_19_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_19_PC",
    MessageId = 990019,
    MessageType = "Guide"
  },
  [990020] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_20_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_20_PC",
    MessageId = 990020,
    MessageType = "Guide"
  },
  [990021] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_21_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_21_PC",
    MessageId = 990021,
    MessageType = "Guide"
  },
  [990022] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_22_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_22_PC",
    MessageId = 990022,
    MessageType = "Guide"
  },
  [990023] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_23_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_23_PC",
    MessageId = 990023,
    MessageType = "Guide"
  },
  [990024] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_24_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_24_PC",
    MessageId = 990024,
    MessageType = "Guide"
  },
  [990025] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_25_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_25_PC",
    MessageId = 990025,
    MessageType = "Guide"
  },
  [990026] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_26_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_26_PC",
    MessageId = 990026,
    MessageType = "Guide"
  },
  [990027] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_27_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_27_PC",
    MessageId = 990027,
    MessageType = "Guide"
  },
  [990028] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_28_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_28_PC",
    MessageId = 990028,
    MessageType = "Guide"
  },
  [990029] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_29_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_29_PC",
    MessageId = 990029,
    MessageType = "Guide"
  },
  [990030] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_30_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_30_PC",
    MessageId = 990030,
    MessageType = "Guide"
  },
  [990031] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_31_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_31_PC",
    MessageId = 990031,
    MessageType = "Guide"
  },
  [990032] = {
    MessageContentPC = "MESSAGE_TRACKQUEST_32_PC",
    MessageContentPhone = "MESSAGE_TRACKQUEST_32_PC",
    MessageId = 990032,
    MessageType = "Guide"
  },
  [990033] = {
    MessageContentPC = "Toast_DonglishiJiaoxue",
    MessageContentPhone = "Toast_DonglishiJiaoxue",
    MessageId = 990033,
    MessageType = "Warning"
  },
  [990034] = {
    MessageContentPC = "Toast_MiYao",
    MessageContentPhone = "Toast_MiYao",
    MessageId = 990034,
    MessageType = "Warning"
  },
  [990035] = {
    MessageContentPC = "Toast_PaoJi",
    MessageContentPhone = "Toast_PaoJi",
    MessageId = 990035,
    MessageType = "Warning"
  }
})
