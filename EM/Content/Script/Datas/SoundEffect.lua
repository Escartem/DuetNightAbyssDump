local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SoundEffect", {
  [1] = {
    NumLimit = 5,
    SoundId = 1,
    SoundPath = "event:/sfx/common/player/hit/common/weapon/single/weaponHit_metal"
  },
  [2] = {
    NumLimit = 5,
    SoundId = 2,
    SoundPath = "event:/sfx/common/player/hit/common/weapon/single/weaponHit_grass"
  },
  [3] = {
    NumLimit = 5,
    SoundId = 3,
    SoundPath = "event:/sfx/common/player/hit/common/weapon/single/weaponHit_glass"
  },
  [4] = {
    NumLimit = 5,
    SoundId = 4,
    SoundPath = "event:/sfx/common/player/hit/common/weapon/single/weaponHit_concrete"
  },
  [5] = {
    NumLimit = 5,
    SoundId = 5,
    SoundPath = "event:/sfx/common/player/hit/common/weapon/single/weaponHit_flesh"
  },
  [11] = {
    NumLimit = 1,
    SoundId = 11,
    SoundPath = "event:/ui/common/pick_up_gold"
  },
  [12] = {
    NumLimit = 1,
    SoundId = 12,
    SoundPath = "event:/ui/common/pick_up_item"
  },
  [13] = {
    NumLimit = 1,
    SoundId = 13,
    SoundPath = "event:/ui/common/pick_up_magic_ball"
  },
  [17] = {
    NumLimit = 5,
    SoundId = 17,
    SoundPath = "event:/sfx/common/scene/gear/coin_get"
  },
  [21] = {
    NumLimit = 5,
    SoundId = 21,
    SoundPath = "event:/sfx/common/player/hit/magic/recover_hp"
  },
  [22] = {
    NumLimit = 5,
    SoundId = 22,
    SoundPath = "event:/sfx/common/player/hit/magic/recover_mp"
  },
  [23] = {
    NumLimit = 5,
    SoundId = 23,
    SoundPath = "event:/sfx/common/player/hit/bullet/hit_death_for_obt"
  },
  [32] = {
    NumLimit = 5,
    SoundId = 32,
    SoundPath = "event:/sfx/boss/Xibi/condemn_end"
  },
  [101] = {
    NumLimit = 5,
    SoundId = 101,
    SoundPath = "event:/sfx/player/Nvzhu/fire_hit"
  },
  [102] = {
    NumLimit = 1,
    SoundId = 102,
    SoundPath = "event:/sfx/common/player/hit/weapon/hit_cri"
  },
  [103] = {
    NumLimit = 2,
    SoundId = 103,
    SoundPath = "event:/sfx/common/player/hit/bullet/hit_normal",
    SubSoundId = 1
  },
  [104] = {
    NumLimit = 3,
    SoundId = 104,
    SoundPath = "event:/sfx/common/player/hit/weapon/$MeleeHit$Hit_$MeleeHitLevel$",
    SubSoundId = 2
  },
  [105] = {
    NumLimit = 5,
    SoundId = 105,
    SoundPath = "event:/sfx/common/player/hit/weapon/dualbladeHit_$MeleeHitLevel$",
    SubSoundId = 7
  },
  [107] = {
    NumLimit = 5,
    SoundId = 107,
    SubSoundId = 3
  },
  [108] = {
    NumLimit = 5,
    SoundId = 108,
    SoundPath = "event:/sfx/common/player/weapon/scythe_fx_appear"
  },
  [109] = {
    NumLimit = 5,
    SoundId = 109,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/shoot_fire"
  },
  [112] = {
    NumLimit = 5,
    SoundId = 112,
    SoundPath = "event:/sfx/common/player/hit/bullet/hit_normal_bow",
    SubSoundId = 4
  },
  [115] = {
    NumLimit = 5,
    SoundId = 115,
    SoundPath = "event:/sfx/common/player/hit/magic/windHit_normal_feina"
  },
  [118] = {
    NumLimit = 5,
    SoundId = 118,
    SoundPath = "event:/sfx/weapon/$MeleeWeapon$/whip_heavyAttack_attack_fx"
  },
  [119] = {
    SoundId = 119,
    SoundPath = "event:/sfx/common/player/hit/weapon/mod_$MeleeHitLevel$"
  },
  [151] = {
    NumLimit = 5,
    SoundId = 151,
    SoundPath = "event:/sfx/common/player/hit/magic/fireHit_normal",
    SubSoundId = 51
  },
  [152] = {
    NumLimit = 5,
    SoundId = 152,
    SubSoundId = 11
  },
  [201] = {
    NumLimit = 5,
    SoundId = 201,
    SoundPath = "event:/voice/$Locale$/char/$PlayerName$/vo_be_hit"
  },
  [202] = {
    NumLimit = 3,
    SoundId = 202,
    SoundPath = "event:/voice/$Locale$/char/$PlayerName$/vo_be_hit_heavy"
  },
  [204] = {
    NumLimit = 5,
    SoundId = 204,
    SoundPath = "event:/sfx/common/scene/gear/teleportPoint"
  },
  [205] = {
    NumLimit = 5,
    SoundId = 205,
    SoundPath = "event:/sfx/common/scene/gear/teleportPoint_loop"
  },
  [206] = {
    NumLimit = 5,
    SoundId = 206,
    SoundPath = "event:/sfx/common/scene/gear/parkour_loop"
  },
  [207] = {
    NumLimit = 5,
    SoundId = 207,
    SoundPath = "event:/sfx/common/scene/gear/parkour_arrived"
  },
  [208] = {
    NumLimit = 5,
    SoundId = 208,
    SoundPath = "event:/sfx/common/scene/gear/energysupply_particle"
  },
  [209] = {
    NumLimit = 5,
    SoundId = 209,
    SoundPath = "event:/sfx/common/scene/gear/energysupply_recover_fx"
  },
  [211] = {
    NumLimit = 5,
    SoundId = 211,
    SoundPath = "event:/voice/$Locale$/char/$PlayerName$/vo_fail"
  },
  [212] = {
    NumLimit = 5,
    SoundId = 212,
    SoundPath = "event:/voice/$Locale$/char/$PlayerName$/vo_lvup"
  },
  [213] = {
    NumLimit = 5,
    SoundId = 213,
    SoundPath = "event:/voice/$Locale$/char/$PlayerName$/vo_appear"
  },
  [214] = {
    NumLimit = 5,
    SoundId = 214,
    SoundPath = "event:/voice/$Locale$/char/$playername$/vo_battleidle"
  },
  [215] = {
    SoundId = 215,
    SoundPath = "event:/sfx/common/scene/shenmiao/buff_common"
  },
  [216] = {
    SoundId = 216,
    SoundPath = "event:/sfx/common/scene/shenmiao/countdown"
  },
  [217] = {
    SoundId = 217,
    SoundPath = "event:/sfx/common/scene/shenmiao/exp_small"
  },
  [218] = {
    SoundId = 218,
    SoundPath = "event:/sfx/common/scene/shenmiao/hammer_hit"
  },
  [219] = {
    SoundId = 219,
    SoundPath = "event:/sfx/common/scene/shenmiao/buff_fly"
  },
  [220] = {
    SoundId = 220,
    SoundPath = "event:/sfx/common/enemy/buff/darkhit"
  },
  [221] = {
    SoundId = 221,
    SoundPath = "event:/sfx/common/scene/shenmiao/hammer_pre"
  },
  [301] = {
    NumLimit = 5,
    SoundId = 301,
    SoundPath = "event:/sfx/common/player/action/highheeled/footstep"
  },
  [302] = {
    NumLimit = 5,
    SoundId = 302,
    SoundPath = "event:/sfx/common/player/action/barefeet/footstep"
  },
  [401] = {
    NumLimit = 5,
    SoundId = 401,
    SoundPath = "event:/voice/$Locale$/char/$PlayerName$/vo_skill01"
  },
  [501] = {
    NumLimit = 5,
    SoundId = 501,
    SoundPath = "event:/sfx/common/enemy/hit/spearHit_$MeleeHitLevel$"
  },
  [502] = {
    NumLimit = 5,
    SoundId = 502,
    SoundPath = "event:/sfx/common/enemy/hit/spearHit_$MeleeHitLevel$_02"
  },
  [503] = {
    NumLimit = 5,
    SoundId = 503,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_$MeleeHitLevel$"
  },
  [504] = {
    NumLimit = 5,
    SoundId = 504,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_$MeleeHitLevel$_02"
  },
  [505] = {
    NumLimit = 5,
    SoundId = 505,
    SoundPath = "event:/sfx/common/enemy/hit/heavySwordHit_$MeleeHitLevel$"
  },
  [601] = {
    NumLimit = 5,
    SoundId = 601,
    SoundPath = "event:/sfx/pet/Zisha/burst"
  },
  [602] = {
    NumLimit = 5,
    SoundId = 602,
    SoundPath = "event:/sfx/pet/Yuyi/skill01_burst"
  },
  [603] = {
    NumLimit = 5,
    SoundId = 603,
    SoundPath = "event:/sfx/pet/Dahuo/skill01_burst"
  },
  [604] = {
    NumLimit = 5,
    SoundId = 604,
    SoundPath = "event:/sfx/pet/Zhamao/skill01_burst_hero"
  },
  [605] = {
    NumLimit = 5,
    SoundId = 605,
    SoundPath = "event:/sfx/pet/Zhamao/skill01_burst_player"
  },
  [606] = {
    NumLimit = 5,
    SoundId = 606,
    SoundPath = "event:/sfx/pet/Yaoye/skill01_burst_hero"
  },
  [607] = {
    NumLimit = 5,
    SoundId = 607,
    SoundPath = "event:/sfx/pet/Shanling/skill01_burst"
  },
  [608] = {
    NumLimit = 5,
    SoundId = 608,
    SoundPath = "event:/sfx/enemy/Jt/BlastRobot/skill01_exp"
  },
  [609] = {
    NumLimit = 5,
    SoundId = 609,
    SoundPath = "event:/sfx/pet/Nihao/skill01_burst"
  },
  [610] = {
    NumLimit = 5,
    SoundId = 610,
    SoundPath = "event:/sfx/pet/Zhenzhu/skill_fx_burst"
  },
  [611] = {
    NumLimit = 5,
    SoundId = 611,
    SoundPath = "event:/sfx/pet/Haomeng/skill01_burst"
  },
  [612] = {
    NumLimit = 5,
    SoundId = 612,
    SoundPath = "event:/sfx/pet/Fuyou/burst"
  },
  [613] = {
    NumLimit = 5,
    SoundId = 613,
    SoundPath = "event:/sfx/pet/Tangshuang/ice_burst"
  },
  [614] = {
    NumLimit = 5,
    SoundId = 614,
    SoundPath = "event:/sfx/pet/YYHW/skill01_burst"
  },
  [615] = {
    NumLimit = 5,
    SoundId = 615,
    SoundPath = "event:/sfx/pet/Pipa/skill01_burst"
  },
  [616] = {
    NumLimit = 5,
    SoundId = 616,
    SoundPath = "event:/sfx/pet/Mianmian/skill01_burst"
  },
  [617] = {
    NumLimit = 5,
    SoundId = 617,
    SoundPath = "event:/sfx/pet/Qiuqiu/skill01_burst"
  },
  [618] = {
    NumLimit = 5,
    SoundId = 618,
    SoundPath = "event:/sfx/pet/Heiyao/burst"
  },
  [619] = {
    NumLimit = 5,
    SoundId = 619,
    SoundPath = "event:/sfx/pet/Jingqing/skill01_burst"
  },
  [620] = {
    NumLimit = 5,
    SoundId = 620,
    SoundPath = "event:/sfx/pet/Manao/skill01_burst"
  },
  [621] = {
    NumLimit = 5,
    SoundId = 621,
    SoundPath = "event:/sfx/pet/Zijing/skill01_burst"
  },
  [622] = {
    NumLimit = 5,
    SoundId = 622,
    SoundPath = "event:/sfx/pet/Bixi/skill01_burst"
  },
  [623] = {
    NumLimit = 5,
    SoundId = 623,
    SoundPath = "event:/sfx/pet/Oubo/skill01_burst"
  },
  [1001] = {
    NumLimit = 5,
    SoundId = 1001,
    SoundPath = "event:/sfx/common/enemy/hit/bullet_hit",
    SubSoundId = 101
  },
  [1002] = {
    NumLimit = 5,
    SoundId = 1002,
    SoundPath = "event:/sfx/common/player/hit/weapon/weaponHit_comp_drop"
  },
  [1003] = {
    NumLimit = 5,
    SoundId = 1003,
    SoundPath = "event:/sfx/common/enemy/hit/weapon_hit"
  },
  [1004] = {
    NumLimit = 5,
    SoundId = 1004,
    SoundPath = "event:/sfx/common/player/hit/weapon/weaponHit_comp_hit_ground"
  },
  [2001] = {
    NumLimit = 5,
    SoundId = 2001,
    SoundPath = "event:/sfx/common/scene/gear/foliage_jump"
  },
  [2002] = {
    NumLimit = 5,
    SoundId = 2002,
    SoundPath = "event:/sfx/common/scene/baoxiang/show"
  },
  [2003] = {
    NumLimit = 5,
    SoundId = 2003,
    SoundPath = "event:/sfx/common/scene/baoxiang/unlock"
  },
  [2004] = {
    NumLimit = 5,
    SoundId = 2004,
    SoundPath = "event:/sfx/common/scene/baoxiang/dark_burst"
  },
  [2005] = {
    NumLimit = 5,
    SoundId = 2005,
    SoundPath = "event:/sfx/common/scene/baoxiang/dark_dismiss"
  },
  [2006] = {
    NumLimit = 5,
    SoundId = 2006,
    SoundPath = "event:/sfx/common/scene/baoxiang/foliage_burst"
  },
  [2007] = {
    NumLimit = 5,
    SoundId = 2007,
    SoundPath = "event:/sfx/common/scene/baoxiang/foliage_burn"
  },
  [2008] = {
    NumLimit = 5,
    SoundId = 2008,
    SoundPath = "event:/sfx/common/scene/baoxiang/ice_burst"
  },
  [2009] = {
    NumLimit = 5,
    SoundId = 2009,
    SoundPath = "event:/sfx/common/scene/baoxiang/ice_dismiss"
  },
  [2010] = {
    NumLimit = 5,
    SoundId = 2010,
    SoundPath = "event:/sfx/common/scene/baoxiang/shimmer_burst"
  },
  [2011] = {
    NumLimit = 5,
    SoundId = 2011,
    SoundPath = "event:/sfx/common/scene/baoxiang/shimmer_dismiss"
  },
  [2012] = {
    NumLimit = 5,
    SoundId = 2012,
    SoundPath = "event:/sfx/boss/Shijingzhe/fx_crystal_little_appear"
  },
  [2013] = {
    NumLimit = 5,
    SoundId = 2013,
    SoundPath = "event:/sfx/common/scene/gear/daba_hit"
  },
  [2014] = {
    NumLimit = 5,
    SoundId = 2014,
    SoundPath = "event:/sfx/common/scene/paotai/on"
  },
  [2015] = {
    NumLimit = 5,
    SoundId = 2015,
    SoundPath = "event:/sfx/common/scene/paotai/off"
  },
  [2016] = {
    NumLimit = 5,
    SoundId = 2016,
    SoundPath = "event:/sfx/common/scene/paotai/shoot_single"
  },
  [2017] = {
    NumLimit = 5,
    SoundId = 2017,
    SoundPath = "event:/sfx/common/scene/paotai/exp_single"
  },
  [2018] = {
    NumLimit = 5,
    SoundId = 2018,
    SoundPath = "event:/sfx/common/scene/paotai/shoot_auto"
  },
  [2019] = {
    NumLimit = 5,
    SoundId = 2019,
    SoundPath = "event:/sfx/common/scene/paotai/exp_auto"
  },
  [2020] = {
    NumLimit = 5,
    SoundId = 2020,
    SoundPath = "event:/sfx/common/scene/paotai/exhasut"
  },
  [2021] = {
    NumLimit = 5,
    SoundId = 2021,
    SoundPath = "event:/sfx/common/scene/interact/firemach_hit"
  },
  [2022] = {
    NumLimit = 5,
    SoundId = 2022,
    SoundPath = "event:/sfx/common/scene/baoxiang/vanish"
  },
  [2023] = {
    SoundId = 2023,
    SoundPath = "event:/sfx/common/scene/week/gold_shot"
  },
  [2024] = {
    SoundId = 2024,
    SoundPath = "event:/sfx/common/scene/week/gold_hit"
  },
  [2026] = {
    SoundId = 2026,
    SoundPath = "event:/sfx/common/scene/week/baoxiang_open"
  },
  [2027] = {
    SoundId = 2027,
    SoundPath = "event:/sfx/common/scene/baoxiang/common_low"
  },
  [2028] = {
    SoundId = 2028,
    SoundPath = "event:/sfx/common/scene/baoxiang/common_mid"
  },
  [2029] = {
    SoundId = 2029,
    SoundPath = "event:/sfx/common/scene/baoxiang/common_high"
  },
  [2030] = {
    SoundId = 2030,
    SoundPath = "event:/sfx/common/scene/baoxiang/juntuan_low"
  },
  [2031] = {
    SoundId = 2031,
    SoundPath = "event:/sfx/common/scene/baoxiang/juntuan_mid"
  },
  [2032] = {
    SoundId = 2032,
    SoundPath = "event:/sfx/common/scene/baoxiang/juntuan_high"
  },
  [2033] = {
    SoundId = 2033,
    SoundPath = "event:/sfx/common/scene/magic_box"
  },
  [2101] = {
    NumLimit = 5,
    SoundId = 2101,
    SoundPath = "event:/sfx/common/scene/ice/berg_start"
  },
  [2102] = {
    NumLimit = 5,
    SoundId = 2102,
    SoundPath = "event:/sfx/common/scene/ice/berg_exp"
  },
  [2111] = {
    SoundId = 2111,
    SoundPath = "event:/sfx/common/scene/powder/exp"
  },
  [2170] = {
    SoundId = 2170,
    SoundPath = "event:/sfx/common/scene/magic/show_01"
  },
  [2190] = {
    SoundId = 2190,
    SoundPath = "event:/sfx/common/scene/magic/poof_01"
  },
  [2201] = {
    SoundId = 2201,
    SoundPath = "event:/sfx/common/scene/panshen/magic_shimmer"
  },
  [2202] = {
    SoundId = 2202,
    SoundPath = "event:/sfx/common/scene/panshen/magic_wind"
  },
  [2205] = {
    SoundId = 2205,
    SoundPath = "event:/sfx/common/scene/panshen/magic_step"
  },
  [3001] = {
    SoundId = 3001,
    SoundPath = "event:/sfx/common/player/action/footstep_costume_hudie"
  },
  [3101] = {
    SoundId = 3101,
    SoundPath = "event:/sfx/common/player/action/huanwen_costume_hudie"
  },
  [3201] = {
    SoundId = 3201,
    SoundPath = "event:/sfx/common/player/action/death01"
  },
  [10001] = {
    SoundId = 10001,
    SoundPath = "event:/sfx/boss/Nanzhu/passive"
  },
  [10002] = {
    SoundId = 10002,
    SoundPath = "event:/sfx/common/player/hit/weapon/heavySwordHit_heavy"
  },
  [18010] = {
    SoundId = 18010,
    SoundPath = "event:/sfx/common/scene/ac/feina_shoot"
  },
  [18011] = {
    SoundId = 18011,
    SoundPath = "event:/sfx/common/scene/ac/feina_fall"
  },
  [18012] = {
    SoundId = 18012,
    SoundPath = "event:/sfx/common/scene/ac/feina_idle_loop"
  },
  [110101] = {
    SoundId = 110101,
    SoundPath = "event:/sfx/player/Heitao/skill01_hit"
  },
  [110301] = {
    SoundId = 110301,
    SoundPath = "event:/sfx/player/Tuosi/change_shooting_loop"
  },
  [110302] = {
    SoundId = 110302,
    SoundPath = "event:/sfx/player/Tuosi/fury_shooting_loop"
  },
  [110303] = {
    SoundId = 110303,
    SoundPath = "event:/sfx/player/Tuosi/change_loop"
  },
  [110304] = {
    SoundId = 110304,
    SoundPath = "event:/sfx/player/Tuosi/fury_start"
  },
  [110305] = {
    SoundId = 110305,
    SoundPath = "event:/sfx/common/player/hit/weapon/clawHit_normal"
  },
  [110306] = {
    SoundId = 110306,
    SoundPath = "event:/sfx/common/player/hit/weapon/clawHit_normal"
  },
  [110307] = {
    SoundId = 110307,
    SoundPath = "event:/sfx/common/player/hit/weapon/clawHit_heavy"
  },
  [110308] = {
    SoundId = 110308,
    SoundPath = "event:/sfx/common/player/hit/weapon/spearHit_heavy"
  },
  [110309] = {
    SoundId = 110309,
    SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_02"
  },
  [110310] = {
    SoundId = 110310,
    SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_none"
  },
  [110311] = {
    SoundId = 110311,
    SoundPath = "event:/sfx/common/player/hit/magic/lightingHit"
  },
  [110312] = {
    SoundId = 110312,
    SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_03"
  },
  [150101] = {
    SoundId = 150101,
    SoundPath = "event:/sfx/player/Baonu/passive_01"
  },
  [150102] = {
    SoundId = 150102,
    SoundPath = "event:/sfx/player/Baonu/passive_02"
  },
  [150103] = {
    SoundId = 150103,
    SoundPath = "event:/sfx/player/Baonu/passive_03"
  },
  [150104] = {
    SoundId = 150104,
    SoundPath = "event:/sfx/player/Baonu/passive_04"
  },
  [150105] = {
    SoundId = 150105,
    SoundPath = "event:/sfx/player/Baonu/passive_explode"
  },
  [150106] = {
    SoundId = 150106,
    SoundPath = "event:/sfx/common/player/hit/weapon/heavySwordHit_normal",
    SubSoundId = 2
  },
  [150107] = {
    SoundId = 150107,
    SoundPath = "event:/sfx/common/player/hit/weapon/heavySwordHit_heavy",
    SubSoundId = 2
  },
  [150201] = {
    SoundId = 150201,
    SoundPath = "event:/sfx/player/Nifu/skill01"
  },
  [150202] = {
    SoundId = 150202,
    SoundPath = "event:/sfx/player/Nifu/skill01_strengthen"
  },
  [150203] = {
    SoundId = 150203,
    SoundPath = "event:/sfx/player/Nifu/skill01_explode"
  },
  [150204] = {
    SoundId = 150204,
    SoundPath = "event:/sfx/player/Nifu/skill01_explode_strengthen"
  },
  [150205] = {
    SoundId = 150205,
    SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage1_hit"
  },
  [150301] = {
    SoundId = 150301,
    SoundPath = "event:/sfx/player/Kezhou/passive_weapon_loop"
  },
  [150303] = {
    SoundId = 150303,
    SoundPath = "event:/sfx/player/Kezhou/polearm_runattack_02_cast_loop"
  },
  [150304] = {
    SoundId = 150304,
    SoundPath = "event:/sfx/player/Kezhou/sword_runattack_04_loop"
  },
  [150305] = {
    SoundId = 150305,
    SoundPath = "event:/sfx/player/Kezhou/skill02_fall"
  },
  [150306] = {
    SoundId = 150306,
    SoundPath = "event:/sfx/player/Kezhou/skill02_weapon_loop"
  },
  [150307] = {
    SoundId = 150307,
    SoundPath = "event:/sfx/player/Kezhou/skill01"
  },
  [150308] = {
    SoundId = 150308,
    SoundPath = "event:/sfx/player/Kezhou/passive_weapon_hit"
  },
  [150309] = {
    SoundId = 150309,
    SoundPath = "event:/sfx/weapon/Polearm/Kezhou/mod01_fly"
  },
  [160101] = {
    SoundId = 160101,
    SoundPath = "event:/sfx/common/player/hit/weapon/mod_light"
  },
  [160102] = {
    SoundId = 160102,
    SoundPath = "event:/sfx/player/NanzhuLight/skill01_fx_loop"
  },
  [160103] = {
    SoundId = 160103,
    SoundPath = "event:/sfx/common/player/hit/magic/NanzhuLight_hit"
  },
  [160104] = {
    SoundId = 160104,
    SoundPath = "event:/sfx/common/player/hit/magic/NanzhuLight_hit"
  },
  [180101] = {
    SoundId = 180101,
    SoundPath = "event:/sfx/player/Feina/magic_water_loop"
  },
  [180102] = {
    SoundId = 180102,
    SoundPath = "event:/sfx/player/Feina/magic_fire_loop"
  },
  [180103] = {
    SoundId = 180103,
    SoundPath = "event:/sfx/player/Feina/magic_electric_loop"
  },
  [180104] = {
    SoundId = 180104,
    SoundPath = "event:/sfx/player/Feina/magic_wind_loop"
  },
  [180105] = {
    SoundId = 180105,
    SoundPath = "event:/sfx/player/Feina/passive_start"
  },
  [180106] = {
    SoundId = 180106,
    SoundPath = "event:/sfx/player/Feina/passive_loop"
  },
  [180107] = {
    SoundId = 180107,
    SoundPath = "event:/sfx/common/player/hit/magic/waterHit_normal_feina"
  },
  [180108] = {
    SoundId = 180108,
    SoundPath = "event:/sfx/common/player/hit/magic/fireHit_normal_feina"
  },
  [180109] = {
    SoundId = 180109,
    SoundPath = "event:/sfx/common/player/hit/magic/electricHit_normal_feina"
  },
  [180110] = {
    SoundId = 180110,
    SoundPath = "event:/sfx/common/player/hit/magic/windHit_normal_feina"
  },
  [201101] = {
    SoundId = 201101,
    SoundPath = "event:/sfx/player/Awaer/skill01"
  },
  [201102] = {
    SoundId = 201102,
    SoundPath = "event:/sfx/player/Awaer/skill02_exp_01"
  },
  [201103] = {
    SoundId = 201103,
    SoundPath = "event:/sfx/player/Awaer/skill02_exp_02"
  },
  [201104] = {
    SoundId = 201104,
    SoundPath = "event:/sfx/player/Awaer/skill02_exp_03"
  },
  [202101] = {
    SoundId = 202101,
    SoundPath = "event:/sfx/player/Dafu/skill01_loop"
  },
  [202102] = {
    SoundId = 202102,
    SoundPath = "event:/sfx/common/player/hit/magic/recover_hp"
  },
  [210101] = {
    SoundId = 210101,
    SoundPath = "event:/sfx/player/Shuimu/skill_hit",
    SubSoundId = 53
  },
  [210102] = {
    SoundId = 210102,
    SoundPath = "event:/sfx/player/Shuimu/poison_hit"
  },
  [210103] = {
    SoundId = 210103,
    SoundPath = "event:/sfx/player/Shuimu/poison_stack_warning"
  },
  [210104] = {
    SoundId = 210104,
    SoundPath = "event:/sfx/player/Shuimu/poison_spread"
  },
  [210105] = {
    SoundId = 210105,
    SoundPath = "event:/sfx/common/player/hit/magic/waterSuck_normal",
    SubSoundId = 53
  },
  [230101] = {
    SoundId = 230101,
    SoundPath = "event:/sfx/player/Zhangyu/tentacle_hit_ground",
    SubSoundId = 53
  },
  [230102] = {
    SoundId = 230102,
    SoundPath = "event:/sfx/player/Zhangyu/skill01_tentacle"
  },
  [230103] = {
    SoundId = 230103,
    SoundPath = "event:/sfx/player/Zhangyu/tentacle_whoosh_carray",
    SubSoundId = 53
  },
  [240101] = {
    SoundId = 240101,
    SoundPath = "event:/sfx/player/Baiheng/skill01_link"
  },
  [240102] = {
    SoundId = 240102,
    SoundPath = "event:/sfx/player/Baiheng/skill01_recover_wave"
  },
  [240103] = {
    SoundId = 240103,
    SoundPath = "event:/sfx/common/player/hit/magic/waterSuck_normal",
    SubSoundId = 53
  },
  [310101] = {
    SoundId = 310101,
    SoundPath = "event:/sfx/player/Linen/skill01_buff_start"
  },
  [310102] = {
    SoundId = 310102,
    SoundPath = "event:/sfx/player/Linen/skill_buff_be_hit",
    SubSoundId = 52
  },
  [310103] = {
    SoundId = 310103,
    SoundPath = "event:/sfx/player/Linen/skill01_buff_explode"
  },
  [310104] = {
    SoundId = 310104,
    SoundPath = "event:/sfx/player/Linen/skill02_ui_show"
  },
  [310105] = {
    SoundId = 310105,
    SoundPath = "event:/sfx/common/player/hit/magic/fireBall_hit"
  },
  [310201] = {
    SoundId = 310201,
    SoundPath = "event:/sfx/common/player/hit/weapon/spearHit_light",
    SubSoundId = 52
  },
  [310202] = {
    SoundId = 310202,
    SoundPath = "event:/sfx/player/Xier/passive_weapon_shoot"
  },
  [310203] = {
    SoundId = 310203,
    SoundPath = "event:/sfx/player/Xier/passive_weapon_shoot_add"
  },
  [310204] = {
    SoundId = 310204,
    SoundPath = "event:/sfx/player/Xier/skill01_add_weapon_rotate"
  },
  [310205] = {
    SoundId = 310205,
    SoundPath = "event:/sfx/common/player/hit/magic/explode_small_hit",
    SubSoundId = 52
  },
  [310301] = {
    SoundId = 310301,
    SoundPath = "event:/sfx/player/Yeer/landing"
  },
  [310302] = {
    SoundId = 310302,
    SoundPath = "event:/sfx/player/Yeer/land_explode"
  },
  [320101] = {
    SoundId = 320101,
    SoundPath = "event:/sfx/player/Haier/spike_appear"
  },
  [320102] = {
    SoundId = 320102,
    SoundPath = "event:/sfx/common/player/hit/common/weapon/single/weaponHit_metal",
    SubSoundId = 53
  },
  [320103] = {
    SoundId = 320103,
    SoundPath = "event:/sfx/player/Haier/skill02_cast"
  },
  [320104] = {
    SoundId = 320104,
    SoundPath = "event:/sfx/common/player/hit/weapon/heavySwordHit_normal"
  },
  [320105] = {
    SoundId = 320105,
    SoundPath = "event:/sfx/common/player/hit/weapon/heavySwordHit_heavy"
  },
  [330101] = {
    SoundId = 330101,
    SoundPath = "event:/sfx/player/Maerjie/skill01_hit"
  },
  [330102] = {
    SoundId = 330102,
    SoundPath = "event:/sfx/player/Maerjie/passive"
  },
  [330103] = {
    SoundId = 330103,
    SoundPath = "event:/sfx/player/Maerjie/skill02_exp"
  },
  [330104] = {
    SoundId = 330104,
    SoundPath = "event:/sfx/player/Maerjie/skill02_exp_add"
  },
  [410101] = {
    SoundId = 410101,
    SoundPath = "event:/sfx/player/Lise/skill01_elec_nor"
  },
  [410102] = {
    SoundId = 410102,
    SoundPath = "event:/sfx/player/Lise/skill01_elec_str"
  },
  [410104] = {
    SoundId = 410104,
    SoundPath = "event:/sfx/common/player/hit/magic/electricHit_normal_feina"
  },
  [410105] = {
    SoundId = 410105,
    SoundPath = "event:/sfx/player/Lise/skill01_hit_str"
  },
  [410106] = {
    SoundId = 410106,
    SoundPath = "event:/sfx/player/Lise/skill02_elec_arc"
  },
  [410107] = {
    SoundId = 410107,
    SoundPath = "event:/sfx/player/Lise/skill02_elec_conncet"
  },
  [410108] = {
    SoundId = 410108,
    SoundPath = "event:/sfx/player/Lise/skill02_elec_burst"
  },
  [410109] = {
    SoundId = 410109,
    SoundPath = "event:/sfx/player/Lise/skill02_state_low"
  },
  [410201] = {
    SoundId = 410201,
    SoundPath = "event:/sfx/player/Zhiliu/skill01_01_cast"
  },
  [410202] = {
    SoundId = 410202,
    SoundPath = "event:/sfx/player/Zhiliu/passive_loop"
  },
  [410204] = {
    SoundId = 410204,
    SoundPath = "event:/sfx/player/Zhiliu/skill02_tt_cast"
  },
  [410205] = {
    SoundId = 410205,
    SoundPath = "event:/sfx/player/Zhiliu/skill02_td_explode"
  },
  [410206] = {
    SoundId = 410206,
    SoundPath = "event:/sfx/player/Zhiliu/skill02_td_loop"
  },
  [410207] = {
    SoundId = 410207,
    SoundPath = "event:/sfx/common/player/hit/magic/electricHit_normal_feina"
  },
  [410208] = {
    SoundId = 410208,
    SoundPath = "event:/sfx/common/player/hit/weapon/heavySwordHit_heavy"
  },
  [410209] = {
    SoundId = 410209,
    SoundPath = "event:/sfx/common/player/hit/magic/lightingHit"
  },
  [410210] = {
    SoundId = 410210,
    SoundPath = "event:/sfx/common/player/hit/magic/lightingHit"
  },
  [410211] = {
    SoundId = 410211,
    SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_03"
  },
  [410212] = {
    SoundId = 410212,
    SoundPath = "event:/sfx/common/player/hit/magic/lightingHit"
  },
  [420101] = {
    SoundId = 420101,
    SoundPath = "event:/sfx/player/Yuming/summon_hit"
  },
  [420102] = {
    SoundId = 420102,
    SoundPath = "event:/sfx/player/Yuming/summon_hit",
    SubSoundId = 53
  },
  [420103] = {
    SoundId = 420103,
    SoundPath = "event:/sfx/player/Yuming/skill01_fx_hit"
  },
  [420201] = {
    SoundId = 420201,
    SoundPath = "event:/sfx/player/Landi/skill02_cast_column"
  },
  [420202] = {
    SoundId = 420202,
    SoundPath = "event:/sfx/player/Landi/crack_01"
  },
  [420203] = {
    SoundId = 420203,
    SoundPath = "event:/sfx/player/Landi/crack_02"
  },
  [420204] = {
    SoundId = 420204,
    SoundPath = "event:/sfx/player/Landi/crack_03"
  },
  [420206] = {
    SoundId = 420206,
    SoundPath = "event:/sfx/player/Landi/shield_loop"
  },
  [420207] = {
    SoundId = 420207,
    SoundPath = "event:/sfx/player/Landi/shield_recover"
  },
  [420208] = {
    SoundId = 420208,
    SoundPath = "event:/sfx/player/Landi/column_loop"
  },
  [420209] = {
    SoundId = 420209,
    SoundPath = "event:/sfx/player/Landi/column_cast"
  },
  [430101] = {
    SoundId = 430101,
    SoundPath = "event:/sfx/player/Xibi/thunderHit"
  },
  [430102] = {
    SoundId = 430102,
    SoundPath = "event:/sfx/player/Xibi/electric_hit",
    SubSoundId = 53
  },
  [430103] = {
    SoundId = 430103,
    SoundPath = "event:/sfx/player/Xibi/skill02_ball_appear_normal"
  },
  [430104] = {
    SoundId = 430104,
    SoundPath = "event:/sfx/player/Xibi/skill02_ball_appear_special"
  },
  [430105] = {
    SoundId = 430105,
    SoundPath = "event:/sfx/player/Xibi/skill02_ball_loop"
  },
  [430106] = {
    SoundId = 430106,
    SoundPath = "event:/sfx/player/Xibi/skill02_ball_burst"
  },
  [430107] = {
    SoundId = 430107,
    SoundPath = "event:/sfx/player/Xibi/electric_link"
  },
  [430108] = {
    SoundId = 430108,
    SoundPath = "event:/sfx/player/Xibi/skill01_sword"
  },
  [430109] = {
    SoundId = 430109,
    SoundPath = "event:/sfx/player/Xibi/skill01_cloud"
  },
  [510101] = {
    SoundId = 510101,
    SoundPath = "event:/sfx/player/Songlu/skill01_ride_run_scatter"
  },
  [510102] = {
    SoundId = 510102,
    SoundPath = "event:/sfx/player/Songlu/summon_hit",
    SubSoundId = 53
  },
  [510103] = {
    SoundId = 510103,
    SoundPath = "event:/sfx/player/Songlu/summon_hit_wall"
  },
  [510104] = {
    SoundId = 510104,
    SoundPath = "event:/sfx/player/Songlu/passive_start"
  },
  [510105] = {
    SoundId = 510105,
    SoundPath = "event:/sfx/player/Songlu/passive_loop"
  },
  [510201] = {
    SoundId = 510201,
    SoundPath = "event:/sfx/player/Aote/skill01_background"
  },
  [510202] = {
    SoundId = 510202,
    SoundPath = "event:/sfx/player/Aote/skill01_hint"
  },
  [510203] = {
    SoundId = 510203,
    SoundPath = "event:/sfx/player/Aote/skill01_end"
  },
  [510204] = {
    SoundId = 510204,
    SoundPath = "event:/sfx/player/Aote/skill02_state"
  },
  [510205] = {
    SoundId = 510205,
    SoundPath = "event:/sfx/player/Aote/passive_show"
  },
  [510206] = {
    SoundId = 510206,
    SoundPath = "event:/sfx/player/Aote/passive_mark"
  },
  [510207] = {
    SoundId = 510207,
    SoundPath = "event:/sfx/player/Aote/passive_hit"
  },
  [530101] = {
    ReplaceSoundID = {
      [530199] = "event:/sfx/player/Saiqi01/passive_skill_attack"
    },
    SoundId = 530101,
    SoundPath = "event:/sfx/player/Saiqi/passive_skill_attack"
  },
  [530102] = {
    ReplaceSoundID = {
      [530199] = "event:/sfx/player/Saiqi01/passive_skill_hit"
    },
    SoundId = 530102,
    SoundPath = "event:/sfx/player/Saiqi/passive_skill_hit",
    SubSoundId = 54
  },
  [530103] = {
    ReplaceSoundID = {
      [530199] = "event:/sfx/player/Saiqi01/skill01_shadow_appear"
    },
    SoundId = 530103,
    SoundPath = "event:/sfx/player/Saiqi/skill01_shadow_appear"
  },
  [530104] = {
    ReplaceSoundID = {
      [530199] = "event:/sfx/player/Saiqi01/skill01_shadow_explode"
    },
    SoundId = 530104,
    SoundPath = "event:/sfx/player/Saiqi/skill01_shadow_explode"
  },
  [530105] = {
    ParamFuncId = 530101,
    ReplaceSoundID = {
      [530199] = "event:/sfx/player/Saiqi01/skill02_shoot"
    },
    SoundId = 530105,
    SoundPath = "event:/sfx/player/Saiqi/skill02_shoot"
  },
  [530106] = {
    ReplaceSoundID = {
      [530199] = "event:/sfx/player/Saiqi01/skill02_shoot_hit"
    },
    SoundId = 530106,
    SoundPath = "event:/sfx/player/Saiqi/skill02_shoot_hit",
    SubSoundId = 201
  },
  [530107] = {
    ReplaceSoundID = {
      [530199] = "event:/sfx/player/Saiqi01/skill02_shoot_hit_ground"
    },
    SoundId = 530107,
    SoundPath = "event:/sfx/player/Saiqi/skill02_shoot_hit_ground"
  },
  [530108] = {
    ReplaceSoundID = {
      [530199] = "event:/sfx/player/Saiqi01/dodge"
    },
    SoundId = 530108,
    SoundPath = "event:/sfx/player/Saiqi/dodge"
  },
  [530109] = {
    ReplaceSoundID = {
      [530199] = "event:/sfx/player/Saiqi01/skill01"
    },
    SoundId = 530109,
    SoundPath = "event:/sfx/player/Saiqi/skill01"
  },
  [540101] = {
    SoundId = 540101,
    SoundPath = "event:/sfx/common/enemy/hit/debuff"
  },
  [600201] = {
    NumLimit = 5,
    SoundId = 600201,
    SoundPath = "event:/sfx/enemy/Gr/Youji/bullet_hit",
    SubSoundId = 101
  },
  [600202] = {
    NumLimit = 5,
    SoundId = 600202,
    SoundPath = "event:/sfx/enemy/Gr/Piaofu/C01_skill01_bullet_hit",
    SubSoundId = 101
  },
  [600203] = {
    NumLimit = 5,
    SoundId = 600203,
    SoundPath = "event:/sfx/common/enemy/hit/fireBall_hit"
  },
  [600301] = {
    NumLimit = 5,
    SoundId = 600301,
    SoundPath = "event:/sfx/enemy/Gr/Piaofu/C01_bubble_appear"
  },
  [600302] = {
    NumLimit = 5,
    SoundId = 600302,
    SoundPath = "event:/sfx/enemy/Gr/Piaofu/C01_bubble_boom"
  },
  [600303] = {
    NumLimit = 5,
    SoundId = 600303,
    SoundPath = "event:/sfx/common/enemy/hit/bubble_hit"
  },
  [600401] = {
    SoundId = 600401,
    SoundPath = "event:/sfx/common/enemy/hit/explode_small_hit"
  },
  [600501] = {
    NumLimit = 5,
    SoundId = 600501,
    SoundPath = "event:/sfx/enemy/Gr/Longcao/poison_bullet"
  },
  [600502] = {
    NumLimit = 5,
    SoundId = 600502,
    SoundPath = "event:/sfx/enemy/Gr/Longcao/poison_hit"
  },
  [600503] = {
    NumLimit = 5,
    SoundId = 600503,
    SoundPath = "event:/sfx/enemy/Gr/Longcao/poision_hit_ground"
  },
  [600504] = {
    NumLimit = 5,
    SoundId = 600504,
    SoundPath = "event:/sfx/enemy/Gr/Longcao/dummy_poision"
  },
  [600505] = {
    NumLimit = 5,
    SoundId = 600505,
    SoundPath = "event:/sfx/enemy/Gr/Longcao/underground_loop"
  },
  [600601] = {
    NumLimit = 5,
    SoundId = 600601,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_light_02"
  },
  [600602] = {
    NumLimit = 5,
    SoundId = 600602,
    SoundPath = "event:/sfx/common/enemy/buff/darkhit"
  },
  [600701] = {
    NumLimit = 5,
    SoundId = 600701,
    SoundPath = "event:/sfx/common/enemy/hit/fireSmall_hit"
  },
  [601501] = {
    SoundId = 601501,
    SoundPath = "event:/sfx/enemy/Gr/Fangjin/shotboom"
  },
  [601502] = {
    SoundId = 601502,
    SoundPath = "event:/sfx/common/enemy/hit/fireSmall_hit"
  },
  [601503] = {
    SoundId = 601503,
    SoundPath = "event:/sfx/common/enemy/hit/explode_small_hit"
  },
  [601601] = {
    SoundId = 601601,
    SoundPath = "event:/sfx/enemy/Gr/Eshi/bullet_hit"
  },
  [601602] = {
    SoundId = 601602,
    SoundPath = "event:/sfx/common/enemy/hit/sickleHit_normal"
  },
  [601603] = {
    SoundId = 601603,
    SoundPath = "event:/sfx/enemy/Gr/Eshi/bullet_hitground"
  },
  [601701] = {
    SoundId = 601701,
    SoundPath = "event:/sfx/common/enemy/hit/clawHit_normal"
  },
  [601702] = {
    SoundId = 601702,
    SoundPath = "event:/sfx/enemy/Gr/Kuirui/skill03_boom"
  },
  [601703] = {
    SoundId = 601703,
    SoundPath = "event:/sfx/common/enemy/hit/electric_ball"
  },
  [700101] = {
    NumLimit = 5,
    SoundId = 700101,
    SoundPath = "event:/sfx/enemy/Jt/Juji/invisible"
  },
  [700102] = {
    NumLimit = 5,
    SoundId = 700102,
    SoundPath = "event:/sfx/enemy/Jt/Juji/division_self"
  },
  [700103] = {
    NumLimit = 5,
    SoundId = 700103,
    SoundPath = "event:/sfx/common/enemy/buff/wind"
  },
  [700111] = {
    NumLimit = 5,
    SoundId = 700111,
    SoundPath = "event:/sfx/common/player/hit/magic/ice_hit",
    SubSoundId = 101
  },
  [700112] = {
    NumLimit = 5,
    SoundId = 700112,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_frozen_reflect"
  },
  [700113] = {
    NumLimit = 5,
    SoundId = 700113,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_frozen_fly"
  },
  [700121] = {
    NumLimit = 5,
    SoundId = 700121,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_blood_loop"
  },
  [700122] = {
    NumLimit = 5,
    SoundId = 700122,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_blood_ hit_ground"
  },
  [700123] = {
    NumLimit = 5,
    SoundId = 700123,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_blood_cast"
  },
  [700131] = {
    NumLimit = 5,
    SoundId = 700131,
    SoundPath = "event:/sfx/common/player/hit/magic/energy_hit",
    SubSoundId = 101
  },
  [700132] = {
    NumLimit = 5,
    SoundId = 700132,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_fade_charge"
  },
  [700133] = {
    NumLimit = 5,
    SoundId = 700133,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_fade_loop"
  },
  [700141] = {
    NumLimit = 5,
    SoundId = 700141,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_shield_bullet_enter"
  },
  [700142] = {
    NumLimit = 5,
    SoundId = 700142,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_shield_loop"
  },
  [700151] = {
    NumLimit = 5,
    SoundId = 700151,
    SoundPath = "event:/sfx/common/player/hit/magic/explode_small_hit",
    SubSoundId = 101
  },
  [700152] = {
    NumLimit = 5,
    SoundId = 700152,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_burst_charge"
  },
  [700153] = {
    NumLimit = 5,
    SoundId = 700153,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_burst_explode"
  },
  [700161] = {
    NumLimit = 5,
    SoundId = 700161,
    SoundPath = "event:/sfx/common/player/hit/magic/electric_small_hit",
    SubSoundId = 101
  },
  [700162] = {
    NumLimit = 5,
    SoundId = 700162,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_thunder_electric_ball_distory"
  },
  [700163] = {
    NumLimit = 5,
    SoundId = 700163,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_thunder_charge"
  },
  [700164] = {
    NumLimit = 5,
    SoundId = 700164,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_thunder_electric_ball_loop"
  },
  [700171] = {
    NumLimit = 5,
    SoundId = 700171,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_poison_loop"
  },
  [700172] = {
    NumLimit = 5,
    SoundId = 700172,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_poison_charge"
  },
  [700181] = {
    NumLimit = 5,
    SoundId = 700181,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_revenge_cast"
  },
  [700182] = {
    NumLimit = 5,
    SoundId = 700182,
    SoundPath = "event:/sfx/common/enemy/buff/buff_strong_revenge_loop"
  },
  [700201] = {
    NumLimit = 5,
    SoundId = 700201,
    SoundPath = "event:/sfx/enemy/Jt/Pizhuo/skill03_robot"
  },
  [700202] = {
    NumLimit = 5,
    SoundId = 700202,
    SoundPath = "event:/sfx/enemy/Jt/HealRobot/skill01_lp"
  },
  [700203] = {
    NumLimit = 5,
    SoundId = 700203,
    SoundPath = "event:/sfx/enemy/Jt/HealRobot/skill01_end"
  },
  [700204] = {
    NumLimit = 5,
    SoundId = 700204,
    SoundPath = "event:/sfx/enemy/Jt/Pizhuo/skill02_robot"
  },
  [700205] = {
    NumLimit = 5,
    SoundId = 700205,
    SoundPath = "event:/sfx/common/enemy/buff/stunparalysis"
  },
  [700311] = {
    NumLimit = 5,
    SoundId = 700311,
    SoundPath = "event:/sfx/enemy/Jt/Ranger/bomb_explosion"
  },
  [700312] = {
    NumLimit = 5,
    SoundId = 700312,
    SoundPath = "event:/sfx/enemy/Jt/Ranger/bomb_set_and_alarm"
  },
  [700313] = {
    NumLimit = 5,
    SoundId = 700313,
    SoundPath = "event:/sfx/enemy/Jt/Ranger/bomb_explode"
  },
  [700314] = {
    NumLimit = 5,
    SoundId = 700314,
    SoundPath = "event:/sfx/common/player/hit/magic/energy_hit"
  },
  [700315] = {
    NumLimit = 5,
    SoundId = 700315,
    SoundPath = "event:/sfx/common/enemy/hit/energy_hit"
  },
  [700321] = {
    NumLimit = 5,
    SoundId = 700321,
    SoundPath = "event:/sfx/enemy/Jt/Ranger/C01_bullet_loop"
  },
  [700322] = {
    NumLimit = 5,
    SoundId = 700322,
    SoundPath = "event:/sfx/common/enemy/hit/electric_ball"
  },
  [700323] = {
    NumLimit = 5,
    SoundId = 700323,
    SoundPath = "event:/sfx/enemy/Jt/Ranger/C01_bomb_explode"
  },
  [700324] = {
    NumLimit = 5,
    SoundId = 700324,
    SoundPath = "event:/sfx/common/enemy/hit/electricHit_heavy_feina"
  },
  [700325] = {
    NumLimit = 5,
    SoundId = 700325,
    SoundPath = "event:/sfx/common/enemy/hit/electric_ball"
  },
  [700401] = {
    NumLimit = 5,
    SoundId = 700401,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_heavy"
  },
  [700402] = {
    NumLimit = 5,
    SoundId = 700402,
    SoundPath = "event:/sfx/common/enemy/hit/shield_hit"
  },
  [700801] = {
    SoundId = 700801,
    SoundPath = "event:/sfx/enemy/Jt/Zhihui/common_explosion"
  },
  [700802] = {
    SoundId = 700802,
    SoundPath = "event:/sfx/enemy/Jt/Zhihui/skill04_explosion"
  },
  [700803] = {
    SoundId = 700803,
    SoundPath = "event:/sfx/common/enemy/hit/fireHit_normal_feina"
  },
  [700804] = {
    SoundId = 700804,
    SoundPath = "event:/sfx/common/enemy/hit/heavySwordHit_normal"
  },
  [700901] = {
    NumLimit = 5,
    SoundId = 700901,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_light"
  },
  [700902] = {
    NumLimit = 5,
    SoundId = 700902,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_light_02"
  },
  [700903] = {
    NumLimit = 5,
    SoundId = 700903,
    SoundPath = "event:/sfx/common/enemy/hit/heavySwordHit_normal"
  },
  [701001] = {
    NumLimit = 5,
    SoundId = 701001,
    SoundPath = "event:/sfx/common/enemy/hit/lightingHit"
  },
  [701601] = {
    SoundId = 701601,
    SoundPath = "event:/sfx/common/enemy/hit/electric_ball"
  },
  [701602] = {
    SoundId = 701602,
    SoundPath = "event:/sfx/common/enemy/hit/fireHit_normal_feina"
  },
  [701603] = {
    SoundId = 701603,
    SoundPath = "event:/sfx/enemy/Jt/Zhiyan/death"
  },
  [701604] = {
    SoundId = 701604,
    SoundPath = "event:/sfx/enemy/Jt/Zhiyan/skill01"
  },
  [701605] = {
    SoundId = 701605,
    SoundPath = "event:/sfx/enemy/Jt/Zhiyan/callback"
  },
  [800101] = {
    NumLimit = 5,
    SoundId = 800101,
    SoundPath = "event:/sfx/common/enemy/hit/bullet_hit_material"
  },
  [800102] = {
    NumLimit = 5,
    SoundId = 800102,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_light_02"
  },
  [800301] = {
    NumLimit = 5,
    SoundId = 800301,
    SoundPath = "event:/sfx/common/enemy/hit/lightingHit"
  },
  [800302] = {
    NumLimit = 5,
    SoundId = 800302,
    SoundPath = "event:/sfx/common/enemy/hit/fireBall_hit"
  },
  [800303] = {
    NumLimit = 5,
    SoundId = 800303,
    SoundPath = "event:/sfx/enemy/JH/Shenfu/buff"
  },
  [850001] = {
    NumLimit = 5,
    SoundId = 850001,
    SoundPath = "event:/sfx/boss/Xibi/electricWhip_hit"
  },
  [850002] = {
    NumLimit = 5,
    SoundId = 850002,
    SoundPath = "event:/sfx/boss/Xibi/electricBall_hit"
  },
  [850041] = {
    NumLimit = 5,
    SoundId = 850041,
    SoundPath = "event:/sfx/boss/Xibi/skill03_electricity"
  },
  [850051] = {
    NumLimit = 5,
    SoundId = 850051,
    SoundPath = "event:/sfx/boss/Xibi/dummy_move"
  },
  [850052] = {
    NumLimit = 5,
    SoundId = 850052,
    SoundPath = "event:/sfx/boss/Xibi/electricBall_hit"
  },
  [850071] = {
    NumLimit = 5,
    SoundId = 850071,
    SoundPath = "event:/sfx/boss/Xibi/drag_player"
  },
  [850101] = {
    NumLimit = 5,
    SoundId = 850101,
    SoundPath = "event:/sfx/boss/Lizhanzhe/skill03_shot"
  },
  [850102] = {
    NumLimit = 5,
    SoundId = 850102,
    SoundPath = "event:/sfx/boss/Lizhanzhe/skill03_whoosh"
  },
  [850103] = {
    NumLimit = 5,
    SoundId = 850103,
    SoundPath = "event:/sfx/boss/Lizhanzhe/skill03_exp"
  },
  [850104] = {
    NumLimit = 5,
    SoundId = 850104,
    SoundPath = "event:/sfx/boss/Lizhanzhe/skill05_exp"
  },
  [850105] = {
    NumLimit = 5,
    SoundId = 850105,
    SoundPath = "event:/sfx/boss/Lizhanzhe/skill10_whoosh"
  },
  [850106] = {
    NumLimit = 5,
    SoundId = 850106,
    SoundPath = "event:/sfx/boss/Lizhanzhe/skill10_exp"
  },
  [850107] = {
    NumLimit = 5,
    SoundId = 850107,
    SoundPath = "event:/sfx/boss/Lizhanzhe/hit"
  },
  [850108] = {
    NumLimit = 5,
    SoundId = 850108,
    SoundPath = "event:/sfx/common/enemy/hit/clawHit_heavy"
  },
  [850211] = {
    NumLimit = 5,
    SoundId = 850211,
    SoundPath = "event:/sfx/common/player/hit/weapon/sickleHit_heavy"
  },
  [850219] = {
    NumLimit = 5,
    SoundId = 850219,
    SoundPath = "event:/sfx/common/enemy/hit/electricBall_hit"
  },
  [850221] = {
    NumLimit = 5,
    SoundId = 850221,
    SoundPath = "event:/sfx/boss/Saiqi/skill02_fx_sickle"
  },
  [850231] = {
    NumLimit = 5,
    SoundId = 850231,
    SoundPath = "event:/sfx/boss/Saiqi/skill03_fx_attack"
  },
  [850232] = {
    NumLimit = 5,
    SoundId = 850232,
    SoundPath = "event:/sfx/common/enemy/action/lightingHit"
  },
  [850261] = {
    NumLimit = 5,
    SoundId = 850261,
    SoundPath = "event:/sfx/boss/Saiqi/skil06_fx_cast"
  },
  [850262] = {
    NumLimit = 5,
    SoundId = 850262,
    SoundPath = "event:/sfx/common/enemy/hit/windHit"
  },
  [850271] = {
    NumLimit = 5,
    SoundId = 850271,
    SoundPath = "event:/sfx/boss/Saiqi/skill07_fx"
  },
  [850272] = {
    NumLimit = 5,
    SoundId = 850272,
    SoundPath = "event:/sfx/common/enemy/hit/windHit"
  },
  [850281] = {
    NumLimit = 5,
    SoundId = 850281,
    SoundPath = "event:/sfx/boss/Saiqi/skill08_fx"
  },
  [850282] = {
    NumLimit = 5,
    SoundId = 850282,
    SoundPath = "event:/sfx/common/player/hit/magic/explode_small_hit"
  },
  [850291] = {
    NumLimit = 5,
    SoundId = 850291,
    SoundPath = "event:/sfx/boss/Saiqi/skill10_fx_wingfall"
  },
  [850292] = {
    NumLimit = 5,
    SoundId = 850292,
    SoundPath = "event:/sfx/common/player/hit/weapon/sickleHit_heavy"
  },
  [850293] = {
    NumLimit = 5,
    SoundId = 850293,
    SoundPath = "event:/sfx/boss/Saiqi/skill10_fx_expand_loop"
  },
  [850294] = {
    NumLimit = 5,
    SoundId = 850294,
    SoundPath = "event:/sfx/common/player/hit/magic/fireHit_normal"
  },
  [850301] = {
    NumLimit = 5,
    SoundId = 850301,
    SoundPath = "event:/sfx/boss/Shijingzhe/fx_crystal_little_appear"
  },
  [850302] = {
    NumLimit = 5,
    SoundId = 850302,
    SoundPath = "event:/sfx/boss/Shijingzhe/fx_crystal_little_boom"
  },
  [850303] = {
    NumLimit = 5,
    SoundId = 850303,
    SoundPath = "event:/sfx/boss/Shijingzhe/skill10_fx_rock"
  },
  [850304] = {
    NumLimit = 5,
    SoundId = 850304,
    SoundPath = "event:/sfx/boss/Shijingzhe/danmaku"
  },
  [850305] = {
    NumLimit = 5,
    SoundId = 850305,
    SoundPath = "event:/sfx/boss/Shijingzhe/danmaku_fly"
  },
  [850306] = {
    NumLimit = 5,
    SoundId = 850306,
    SoundPath = "event:/sfx/boss/Shijingzhe/danmaku_hit"
  },
  [850307] = {
    NumLimit = 5,
    SoundId = 850307,
    SoundPath = "event:/sfx/boss/Shijingzhe/skill09_fx_cast_01"
  },
  [850308] = {
    NumLimit = 5,
    SoundId = 850308,
    SoundPath = "event:/sfx/boss/Shijingzhe/skill09_fx_cast_02"
  },
  [850309] = {
    NumLimit = 5,
    SoundId = 850309,
    SoundPath = "event:/sfx/boss/Shijingzhe/skill09_fx_cast_03"
  },
  [850310] = {
    NumLimit = 5,
    SoundId = 850310,
    SoundPath = "event:/sfx/boss/Shijingzhe/fx_crystal_large_appear"
  },
  [850311] = {
    NumLimit = 5,
    SoundId = 850311,
    SoundPath = "event:/sfx/boss/Shijingzhe/fx_crystal_large_boom"
  },
  [850312] = {
    NumLimit = 5,
    SoundId = 850312,
    SoundPath = "event:/sfx/boss/Shijingzhe/fx_column_appear"
  },
  [850313] = {
    NumLimit = 5,
    SoundId = 850313,
    SoundPath = "event:/sfx/boss/Shijingzhe/fx_column"
  },
  [850314] = {
    NumLimit = 5,
    SoundId = 850314,
    SoundPath = "event:/sfx/boss/Shijingzhe/skill14_fx_appear"
  },
  [850315] = {
    NumLimit = 5,
    SoundId = 850315,
    SoundPath = "event:/sfx/boss/Shijingzhe/skill14_follow_fx"
  },
  [850316] = {
    NumLimit = 5,
    SoundId = 850316,
    SoundPath = "event:/sfx/boss/Shijingzhe/skill14_loop"
  },
  [850317] = {
    NumLimit = 5,
    SoundId = 850317,
    SoundPath = "event:/sfx/boss/Shijingzhe/skill14_fx_disappear"
  },
  [850318] = {
    NumLimit = 5,
    SoundId = 850318,
    SoundPath = "event:/sfx/boss/Shijingzhe/skill14_fx_rock"
  },
  [850319] = {
    NumLimit = 5,
    SoundId = 850319,
    SoundPath = "event:/sfx/boss/Shijingzhe/skill10_fx_rock"
  },
  [850320] = {
    NumLimit = 5,
    SoundId = 850320,
    SoundPath = "event:/sfx/common/enemy/hit/heavySwordHit_normal"
  },
  [850321] = {
    NumLimit = 5,
    SoundId = 850321,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_heavy"
  },
  [850322] = {
    NumLimit = 5,
    SoundId = 850322,
    SoundPath = "event:/sfx/common/enemy/hit/spearHit_heavy"
  },
  [850323] = {
    NumLimit = 5,
    SoundId = 850323,
    SoundPath = "event:/sfx/common/enemy/hit/windHit"
  },
  [850324] = {
    NumLimit = 5,
    SoundId = 850324,
    SoundPath = "event:/ui/common/boss_shield_bar_lose"
  },
  [850401] = {
    NumLimit = 5,
    SoundId = 850401,
    SoundPath = "event:/sfx/boss/Saiqi02/danmu_big"
  },
  [850402] = {
    NumLimit = 5,
    SoundId = 850402,
    SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot02_hit02"
  },
  [850403] = {
    NumLimit = 5,
    SoundId = 850403,
    SoundPath = "event:/sfx/boss/Saiqi02/skill05_fx"
  },
  [850404] = {
    NumLimit = 5,
    SoundId = 850404,
    SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot02_hit03"
  },
  [850405] = {
    NumLimit = 5,
    SoundId = 850405,
    SoundPath = "event:/sfx/boss/Saiqi02/skill08_01"
  },
  [850406] = {
    NumLimit = 5,
    SoundId = 850406,
    SoundPath = "event:/sfx/boss/Saiqi02/skill08_02"
  },
  [850407] = {
    NumLimit = 5,
    SoundId = 850407,
    SoundPath = "event:/sfx/boss/Saiqi02/skill08_03"
  },
  [850408] = {
    NumLimit = 5,
    SoundId = 850408,
    SoundPath = "event:/sfx/boss/Saiqi02/skill08_hit"
  },
  [850409] = {
    NumLimit = 5,
    SoundId = 850409,
    SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot02_hit03"
  },
  [850410] = {
    NumLimit = 5,
    SoundId = 850410,
    SoundPath = "event:/sfx/boss/Saiqi02/skill10_fx"
  },
  [850411] = {
    NumLimit = 5,
    SoundId = 850411,
    SoundPath = "event:/sfx/boss/Saiqi02/skill10_fx_01"
  },
  [850412] = {
    NumLimit = 5,
    SoundId = 850412,
    SoundPath = "event:/sfx/boss/Saiqi02/skill10_fx_02"
  },
  [850413] = {
    NumLimit = 5,
    SoundId = 850413,
    SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot02_hit03"
  },
  [850414] = {
    NumLimit = 5,
    SoundId = 850414,
    SoundPath = "event:/sfx/boss/Saiqi02/skill11_fx_loop"
  },
  [850415] = {
    NumLimit = 5,
    SoundId = 850415,
    SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot02_hit02"
  },
  [850416] = {
    NumLimit = 5,
    SoundId = 850416,
    SoundPath = "event:/sfx/boss/Saiqi02/skill13_fx"
  },
  [850417] = {
    NumLimit = 5,
    SoundId = 850417,
    SoundPath = "event:/sfx/boss/Saiqi02/danmu_small"
  },
  [850418] = {
    NumLimit = 5,
    SoundId = 850418,
    SoundPath = "event:/sfx/boss/Saiqi02/skill17_fx_01"
  },
  [850419] = {
    NumLimit = 5,
    SoundId = 850419,
    SoundPath = "event:/sfx/boss/Saiqi02/skill17_fx_02"
  },
  [850420] = {
    NumLimit = 5,
    SoundId = 850420,
    SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot01_hit"
  },
  [850421] = {
    NumLimit = 5,
    SoundId = 850421,
    SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot02"
  },
  [850422] = {
    NumLimit = 5,
    SoundId = 850422,
    SoundPath = "event:/sfx/boss/Saiqi02/skill21_shot01"
  },
  [850423] = {
    NumLimit = 5,
    SoundId = 850423,
    SoundPath = "event:/sfx/boss/Saiqi02/skill21_02"
  },
  [850501] = {
    NumLimit = 5,
    SoundId = 850501,
    SoundPath = "event:/sfx/boss/Lianhuo/skill04_explode"
  },
  [850502] = {
    NumLimit = 5,
    SoundId = 850502,
    SoundPath = "event:/sfx/boss/Lianhuo/skill05_explode"
  },
  [850503] = {
    NumLimit = 5,
    SoundId = 850503,
    SoundPath = "event:/sfx/boss/Lianhuo/skill06_blast"
  },
  [850504] = {
    NumLimit = 5,
    SoundId = 850504,
    SoundPath = "event:/sfx/common/player/hit/magic/fireHit_normal_feina"
  },
  [850505] = {
    NumLimit = 5,
    SoundId = 850505,
    SoundPath = "event:/sfx/common/player/hit/magic/fireHit_heavy_feina"
  },
  [850506] = {
    NumLimit = 5,
    SoundId = 850506,
    SoundPath = "event:/sfx/boss/Lianhuo/skill10_ball_disappear"
  },
  [850507] = {
    NumLimit = 5,
    SoundId = 850507,
    SoundPath = "event:/sfx/boss/Lianhuo/skill10_cast_ball"
  },
  [850508] = {
    NumLimit = 5,
    SoundId = 850508,
    SoundPath = "event:/sfx/common/player/hit/weapon/spearHit_heavy"
  },
  [850509] = {
    NumLimit = 5,
    SoundId = 850509,
    SoundPath = "event:/sfx/boss/Saiqi/skil06_fx_cast"
  },
  [850510] = {
    NumLimit = 5,
    SoundId = 850510,
    SoundPath = "event:/sfx/common/player/hit/magic/fireHit_normal_feina"
  },
  [850511] = {
    NumLimit = 5,
    SoundId = 850511,
    SoundPath = "event:/sfx/boss/Lianhuo/skill08_explode"
  },
  [850513] = {
    NumLimit = 5,
    SoundId = 850513,
    SoundPath = "event:/sfx/boss/Lianhuo/skill03_hard_fx_danmu_loop"
  },
  [850514] = {
    NumLimit = 5,
    SoundId = 850514,
    SoundPath = "event:/sfx/boss/Lianhuo/skill03_hard_fx_danmu_land"
  },
  [850516] = {
    NumLimit = 5,
    SoundId = 850516,
    SoundPath = "event:/sfx/boss/Lianhuo/skill03_hard_fx_fire_loop"
  },
  [850517] = {
    NumLimit = 5,
    SoundId = 850517,
    SoundPath = "event:/sfx/boss/Lianhuo/skill07_fx_cast"
  },
  [850518] = {
    NumLimit = 5,
    SoundId = 850518,
    SoundPath = "event:/sfx/boss/Lianhuo/skill07_fx_lock"
  },
  [850601] = {
    NumLimit = 5,
    SoundId = 850601,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_normal"
  },
  [850901] = {
    SoundId = 850901,
    SoundPath = "event:/sfx/boss/Tuosi/skill_04_fx_flame"
  },
  [850903] = {
    SoundId = 850903,
    SoundPath = "event:/sfx/boss/Tuosi/skill_05_fx_attack"
  },
  [850904] = {
    SoundId = 850904,
    SoundPath = "event:/sfx/boss/Tuosi/skill_07_fx_boom"
  },
  [850905] = {
    SoundId = 850905,
    SoundPath = "event:/sfx/boss/Tuosi/skill_07_fx_loop"
  },
  [850906] = {
    SoundId = 850906,
    SoundPath = "event:/sfx/boss/Tuosi/skill_08_fx_laser"
  },
  [850907] = {
    SoundId = 850907,
    SoundPath = "event:/sfx/boss/Tuosi/skill_08_fx_charge"
  },
  [850908] = {
    SoundId = 850908,
    SoundPath = "event:/sfx/boss/Tuosi/skill_08_fx_hitGround"
  },
  [850909] = {
    SoundId = 850909,
    SoundPath = "event:/sfx/boss/Tuosi/skill_08_fx_boom"
  },
  [850910] = {
    SoundId = 850910,
    SoundPath = "event:/sfx/boss/Tuosi/skill_08_fx_ballBoom"
  },
  [850911] = {
    SoundId = 850911,
    SoundPath = "event:/sfx/boss/Tuosi/skill_08_fx_ball_loop"
  },
  [850912] = {
    SoundId = 850912,
    SoundPath = "event:/sfx/common/enemy/hit/clawHit_normal"
  },
  [850913] = {
    SoundId = 850913,
    SoundPath = "event:/sfx/common/enemy/hit/clawHit_heavy"
  },
  [850914] = {
    SoundId = 850914,
    SoundPath = "event:/sfx/common/enemy/hit/clawHit_normal"
  },
  [850915] = {
    SoundId = 850915,
    SoundPath = "event:/sfx/common/enemy/hit/clawHit_heavy"
  },
  [850916] = {
    SoundId = 850916,
    SoundPath = "event:/sfx/common/enemy/hit/clawHit_heavy"
  },
  [850917] = {
    SoundId = 850917,
    SoundPath = "event:/sfx/common/enemy/hit/electricBall_hit"
  },
  [850918] = {
    SoundId = 850918,
    SoundPath = "event:/sfx/common/enemy/hit/energy_hit"
  },
  [850919] = {
    SoundId = 850919,
    SoundPath = "event:/sfx/common/enemy/hit/electricHit_heavy_feina"
  },
  [850920] = {
    SoundId = 850920,
    SoundPath = "event:/sfx/common/enemy/hit/clawHit_normal"
  },
  [851001] = {
    SoundId = 851001,
    SoundPath = " event:/sfx/boss/Zhuyin/skill_behit_hevay"
  },
  [851002] = {
    SoundId = 851002,
    SoundPath = "event:/sfx/common/enemy/hit/clawHit_heavy"
  },
  [851003] = {
    SoundId = 851003,
    SoundPath = "event:/sfx/common/enemy/hit/clawHit_heavy"
  },
  [851004] = {
    SoundId = 851004,
    SoundPath = "event:/sfx/common/enemy/hit/clawHit_heavy"
  },
  [851005] = {
    SoundId = 851005,
    SoundPath = "event:/sfx/boss/Zhuyin/skill04_fx_boom"
  },
  [851006] = {
    SoundId = 851006,
    SoundPath = "event:/sfx/boss/Zhuyin/skill05_fx_appear"
  },
  [851007] = {
    SoundId = 851007,
    SoundPath = "event:/sfx/boss/Zhuyin/skill05_fx_stonebehit"
  },
  [851008] = {
    SoundId = 851008,
    SoundPath = "event:/sfx/boss/Zhuyin/skill05_fx_finalexplosion"
  },
  [851009] = {
    SoundId = 851009,
    SoundPath = "event:/sfx/boss/Zhuyin/skill_behit_hevay"
  },
  [851010] = {
    SoundId = 851010,
    SoundPath = "event:/sfx/boss/Zhuyin/skill_behit_hevay"
  },
  [851011] = {
    SoundId = 851011,
    SoundPath = "event:/sfx/boss/Zhuyin/skill07_fx_groundbrk"
  },
  [851012] = {
    SoundId = 851012,
    SoundPath = "event:/sfx/common/enemy/hit/fireHit_normal_feina"
  },
  [851013] = {
    SoundId = 851013,
    SoundPath = "event:/sfx/boss/Zhuyin/skill07_fx_tornado_loop"
  },
  [851014] = {
    SoundId = 851014,
    SoundPath = "event:/sfx/boss/Zhuyin/skill_behit_light"
  },
  [851015] = {
    SoundId = 851015,
    SoundPath = "event:/sfx/boss/Zhuyin/skill07_fx_xlaser_loop"
  },
  [851016] = {
    SoundId = 851016,
    SoundPath = "event:/sfx/boss/Zhuyin/skill_behit_hevay"
  },
  [851017] = {
    SoundId = 851017,
    SoundPath = "event:/sfx/boss/Zhuyin/skill05_fx_stoneatk"
  },
  [851018] = {
    SoundId = 851018,
    SoundPath = "event:/sfx/boss/Zhuyin/skill05_fx_loop"
  },
  [851201] = {
    NumLimit = 5,
    SoundId = 851201,
    SoundPath = "event:/sfx/boss/Linen/common_laser_be_hit"
  },
  [851202] = {
    NumLimit = 5,
    SoundId = 851202,
    SoundPath = "event:/sfx/boss/Linen/skill01_be_hit"
  },
  [851203] = {
    NumLimit = 5,
    SoundId = 851203,
    SoundPath = "event:/sfx/boss/Linen/skill02_fx_down"
  },
  [851204] = {
    NumLimit = 5,
    SoundId = 851204,
    SoundPath = "event:/sfx/boss/Linen/skill03_bullet_loop"
  },
  [851205] = {
    NumLimit = 5,
    SoundId = 851205,
    SoundPath = "event:/sfx/boss/Linen/skill03_fx_boom"
  },
  [851206] = {
    NumLimit = 5,
    SoundId = 851206,
    SoundPath = "event:/sfx/boss/Linen/skill05_fx_break"
  },
  [851207] = {
    NumLimit = 5,
    SoundId = 851207,
    SoundPath = "event:/sfx/boss/Linen/skill05_fx_laser"
  },
  [851208] = {
    NumLimit = 5,
    SoundId = 851208,
    SoundPath = "event:/sfx/boss/Linen/skill05_fx_dash"
  },
  [851209] = {
    NumLimit = 5,
    SoundId = 851209,
    SoundPath = "event:/sfx/boss/Linen/skill05_fx_shot"
  },
  [851210] = {
    NumLimit = 5,
    SoundId = 851210,
    SoundPath = "event:/sfx/boss/Linen/skill05_shot_behit"
  },
  [851211] = {
    NumLimit = 5,
    SoundId = 851211,
    SoundPath = "event:/sfx/boss/Linen/skill06_fx_shoot"
  },
  [851213] = {
    NumLimit = 5,
    SoundId = 851213,
    SoundPath = "event:/sfx/boss/Linen/skill06_2_fx_shoot "
  },
  [851218] = {
    NumLimit = 5,
    SoundId = 851218,
    SoundPath = "event:/sfx/boss/Linen/skill07_fx_lock"
  },
  [851219] = {
    NumLimit = 5,
    SoundId = 851219,
    SoundPath = "event:/sfx/boss/Linen/skill07_fx_stop"
  },
  [851220] = {
    NumLimit = 5,
    SoundId = 851220,
    SoundPath = "event:/sfx/boss/Linen/skill07_fx_attack"
  },
  [851221] = {
    NumLimit = 5,
    SoundId = 851221,
    SoundPath = "event:/sfx/boss/Linen/skill08_fx_little_charge"
  },
  [851222] = {
    NumLimit = 5,
    SoundId = 851222,
    SoundPath = "event:/sfx/boss/Linen/skill08_fx_little_shot"
  },
  [851223] = {
    NumLimit = 5,
    SoundId = 851223,
    SoundPath = "event:/sfx/boss/Linen/skill08_fx_big_charge"
  },
  [851224] = {
    NumLimit = 5,
    SoundId = 851224,
    SoundPath = "event:/sfx/boss/Linen/skill08_big_shot"
  },
  [851225] = {
    NumLimit = 5,
    SoundId = 851225,
    SoundPath = "event:/sfx/boss/Linen/skill08_fx_little_shunyi"
  },
  [851226] = {
    NumLimit = 5,
    SoundId = 851226,
    SoundPath = "event:/sfx/boss/Linen/skill08_fx_shield_loop"
  },
  [851227] = {
    NumLimit = 5,
    SoundId = 851227,
    SoundPath = "event:/sfx/boss/Linen/skill09_fx_energyStorm_charge"
  },
  [851228] = {
    NumLimit = 5,
    SoundId = 851228,
    SoundPath = "event:/sfx/boss/Linen/skill09_fx_energyStorm_boom"
  },
  [851229] = {
    NumLimit = 5,
    SoundId = 851229,
    SoundPath = "event:/sfx/boss/Linen/skill09_fx_aimLaser"
  },
  [851230] = {
    NumLimit = 5,
    SoundId = 851230,
    SoundPath = "event:/sfx/boss/Linen/skill09_fx_shotLaser"
  },
  [851232] = {
    NumLimit = 5,
    SoundId = 851232,
    SoundPath = "event:/sfx/boss/Linen/skill11_fx_shot"
  },
  [851233] = {
    NumLimit = 5,
    SoundId = 851233,
    SoundPath = "event:/sfx/boss/Linen/move_loop"
  },
  [851234] = {
    NumLimit = 5,
    SoundId = 851234,
    SoundPath = "event:/sfx/boss/Linen/common_fx_appear"
  },
  [851235] = {
    NumLimit = 5,
    SoundId = 851235,
    SoundPath = "event:/sfx/boss/Linen/skill09_light"
  },
  [851236] = {
    NumLimit = 5,
    SoundId = 851236,
    SoundPath = "event:/sfx/boss/Linen/skill09_impact"
  },
  [851301] = {
    NumLimit = 5,
    SoundId = 851301,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_heavy"
  },
  [851302] = {
    NumLimit = 5,
    SoundId = 851302,
    SoundPath = "event:/sfx/boss/Kuxiu/skill_aperture_common"
  },
  [851303] = {
    NumLimit = 5,
    SoundId = 851303,
    SoundPath = "event:/sfx/boss/Kuxiu/skill_aperture_hit"
  },
  [851304] = {
    NumLimit = 5,
    SoundId = 851304,
    SoundPath = "event:/sfx/boss/Kuxiu/skill03_shot"
  },
  [851305] = {
    NumLimit = 5,
    SoundId = 851305,
    SoundPath = "event:/sfx/boss/Kuxiu/skill03_bom"
  },
  [851306] = {
    NumLimit = 5,
    SoundId = 851306,
    SoundPath = "event:/sfx/boss/Kuxiu/skill03_hit"
  },
  [851307] = {
    NumLimit = 5,
    SoundId = 851307,
    SoundPath = "event:/sfx/boss/Kuxiu/skill05_shot"
  },
  [851308] = {
    NumLimit = 5,
    SoundId = 851308,
    SoundPath = "event:/sfx/boss/Kuxiu/skill05_boom"
  },
  [851309] = {
    NumLimit = 5,
    SoundId = 851309,
    SoundPath = "event:/sfx/common/enemy/hit/fireBall_hit"
  },
  [851310] = {
    NumLimit = 5,
    SoundId = 851310,
    SoundPath = "event:/sfx/boss/Kuxiu/skill06_shot"
  },
  [851311] = {
    NumLimit = 5,
    SoundId = 851311,
    SoundPath = "event:/sfx/boss/Kuxiu/laser_hit"
  },
  [851312] = {
    NumLimit = 5,
    SoundId = 851312,
    SoundPath = " event:/sfx/boss/Kuxiu/skill07_ping"
  },
  [851314] = {
    NumLimit = 5,
    SoundId = 851314,
    SoundPath = "event:/sfx/boss/Kuxiu/skill07_aim"
  },
  [851316] = {
    NumLimit = 5,
    SoundId = 851316,
    SoundPath = "event:/sfx/common/enemy/hit/shield_hit"
  },
  [851317] = {
    NumLimit = 5,
    SoundId = 851317,
    SoundPath = "event:/sfx/boss/Kuxiu/laser_hit"
  },
  [851318] = {
    NumLimit = 5,
    SoundId = 851318,
    SoundPath = "event:/sfx/boss/Kuxiu/skill03_bullet"
  },
  [851319] = {
    NumLimit = 5,
    SoundId = 851319,
    SoundPath = "event:/sfx/boss/Kuxiu/skill05_bullet"
  },
  [851401] = {
    NumLimit = 5,
    SoundId = 851401,
    SoundPath = "event:/sfx/common/enemy/hit/bullet_hit_material"
  },
  [851402] = {
    NumLimit = 5,
    SoundId = 851402,
    SoundPath = "event:/sfx/boss/Shenpan/skill02_fx_laser"
  },
  [851403] = {
    NumLimit = 5,
    SoundId = 851403,
    SoundPath = "event:/sfx/boss/Shenpan/skill02_fx_burst"
  },
  [851404] = {
    NumLimit = 5,
    SoundId = 851404,
    SoundPath = "event:/sfx/boss/Shenpan/skill03_fx_fire_whoosh"
  },
  [851405] = {
    NumLimit = 5,
    SoundId = 851405,
    SoundPath = "event:/sfx/boss/Shenpan/skill03_explode"
  },
  [851406] = {
    NumLimit = 5,
    SoundId = 851406,
    SoundPath = "event:/sfx/boss/Shenpan/skill04_boom"
  },
  [851407] = {
    NumLimit = 5,
    SoundId = 851407,
    SoundPath = "event:/sfx/common/enemy/hit/bullet_hit"
  },
  [851408] = {
    NumLimit = 5,
    SoundId = 851408,
    SoundPath = "event:/sfx/common/enemy/hit/shield_hit"
  },
  [851501] = {
    SoundId = 851501,
    SoundPath = "event:/sfx/boss/Jushi/common_fx_loop"
  },
  [851502] = {
    SoundId = 851502,
    SoundPath = "event:/sfx/common/enemy/hit/electric_ball"
  },
  [851505] = {
    SoundId = 851505,
    SoundPath = "event:/sfx/boss/Jushi/skill04_fx_shot_loop"
  },
  [851506] = {
    SoundId = 851506,
    SoundPath = "event:/sfx/boss/Jushi/skill04_fx_shot02_loop"
  },
  [851507] = {
    SoundId = 851507,
    SoundPath = "event:/sfx/common/enemy/hit/fireSmall_hit"
  },
  [851508] = {
    SoundId = 851508,
    SoundPath = "event:/sfx/boss/Jushi/skill05_fx_boom"
  },
  [851509] = {
    SoundId = 851509,
    SoundPath = "event:/sfx/boss/Jushi/skill05_fx_shot03_boom"
  },
  [851510] = {
    SoundId = 851510,
    SoundPath = "event:/sfx/boss/Jushi/skill05_fx_shot03_loop"
  },
  [851511] = {
    SoundId = 851511,
    SoundPath = "event:/sfx/common/enemy/hit/fireSmall_hit"
  },
  [851512] = {
    SoundId = 851512,
    SoundPath = "event:/sfx/boss/Jushi/common_beHit"
  },
  [851513] = {
    SoundId = 851513,
    SoundPath = "event:/sfx/boss/Jushi/skill06_fx_laser"
  },
  [851514] = {
    SoundId = 851514,
    SoundPath = "event:/sfx/boss/Kuxiu/skill_aperture_hit"
  },
  [851515] = {
    SoundId = 851515,
    SoundPath = "event:/sfx/boss/Jushi/skill07_fx_boom_pre"
  },
  [851516] = {
    SoundId = 851516,
    SoundPath = "event:/sfx/boss/Jushi/common_beHit"
  },
  [851517] = {
    SoundId = 851517,
    SoundPath = "event:/sfx/boss/Jushi/skill08_fx_laser_shot"
  },
  [851518] = {
    SoundId = 851518,
    SoundPath = "event:/sfx/boss/Kuxiu/skill_aperture_hit"
  },
  [851519] = {
    SoundId = 851519,
    SoundPath = "event:/sfx/boss/Jushi/common_beHit"
  },
  [851701] = {
    SoundId = 851701,
    SoundPath = "event:/sfx/common/enemy/hit/spearHit_heavy"
  },
  [851702] = {
    SoundId = 851702,
    SoundPath = "event:/sfx/common/enemy/hit/electricBall_hit"
  },
  [851703] = {
    SoundId = 851703,
    SoundPath = "event:/sfx/boss/Yuming/fx_electric_hit"
  },
  [851704] = {
    SoundId = 851704,
    SoundPath = "event:/sfx/boss/Yuming/fx_electric_spinning"
  },
  [900001] = {
    NumLimit = 5,
    SoundId = 900001,
    SoundPath = "event:/sfx/common/scene/cannon_shoot_hit_ground"
  },
  [900101] = {
    NumLimit = 5,
    SoundId = 900101,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_normal"
  },
  [900201] = {
    NumLimit = 5,
    SoundId = 900201,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_light"
  },
  [900401] = {
    NumLimit = 5,
    SoundId = 900401,
    SoundPath = "event:/sfx/enemy/SQ/Wanju/mech_bomb_whistle"
  },
  [900402] = {
    NumLimit = 5,
    SoundId = 900402,
    SoundPath = "event:/sfx/enemy/SQ/Wanju/mech_bomb_exp"
  },
  [900501] = {
    NumLimit = 5,
    SoundId = 900501,
    SoundPath = "event:/sfx/enemy/SQ/Zhadan/skill01_whistle"
  },
  [900502] = {
    NumLimit = 5,
    SoundId = 900502,
    SoundPath = "event:/sfx/enemy/SQ/Zhadan/skill01_exp"
  },
  [900601] = {
    NumLimit = 5,
    SoundId = 900601,
    SoundPath = "event:/sfx/common/player/hit/weapon/swordHit_light"
  },
  [900602] = {
    NumLimit = 5,
    SoundId = 900602,
    SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_cast_1"
  },
  [900603] = {
    NumLimit = 5,
    SoundId = 900603,
    SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_cast_2"
  },
  [900604] = {
    NumLimit = 5,
    SoundId = 900604,
    SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_cast_3"
  },
  [900605] = {
    NumLimit = 5,
    SoundId = 900605,
    SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_cast_4"
  },
  [900606] = {
    NumLimit = 5,
    SoundId = 900606,
    SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_cast_5"
  },
  [900607] = {
    NumLimit = 5,
    SoundId = 900607,
    SoundPath = "event:/sfx/enemy/SQ/Qizha/skill04_cast"
  },
  [900608] = {
    NumLimit = 5,
    SoundId = 900608,
    SoundPath = "event:/sfx/enemy/SQ/Qizha/light"
  },
  [900609] = {
    NumLimit = 5,
    SoundId = 900609,
    SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_light_1"
  },
  [900610] = {
    NumLimit = 5,
    SoundId = 900610,
    SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_light_2"
  },
  [900611] = {
    NumLimit = 5,
    SoundId = 900611,
    SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_light_3"
  },
  [900612] = {
    NumLimit = 5,
    SoundId = 900612,
    SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_light_4"
  },
  [900613] = {
    NumLimit = 5,
    SoundId = 900613,
    SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_light_5"
  },
  [900614] = {
    NumLimit = 5,
    SoundId = 900614,
    SoundPath = "event:/sfx/common/player/hit/magic/windHit"
  },
  [900615] = {
    NumLimit = 5,
    SoundId = 900615,
    SoundPath = "event:/sfx/enemy/SQ/Qizha/skill05_appear"
  },
  [900616] = {
    NumLimit = 5,
    SoundId = 900616,
    SoundPath = "event:/sfx/enemy/SQ/Qizha/light"
  },
  [900701] = {
    NumLimit = 5,
    SoundId = 900701,
    SoundPath = "event:/sfx/common/enemy/hit/lightingHit"
  },
  [900702] = {
    NumLimit = 5,
    SoundId = 900702,
    SoundPath = "event:/sfx/enemy/SQ/Niaopao/bullet_fly"
  },
  [900703] = {
    NumLimit = 5,
    SoundId = 900703,
    SoundPath = "event:/sfx/enemy/SQ/Niaopao/exp"
  },
  [900704] = {
    NumLimit = 5,
    SoundId = 900704,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_heavy"
  },
  [950001] = {
    NumLimit = 5,
    SoundId = 950001,
    SoundPath = "event:/sfx/enemy/NE/Dajie/fast_loop_fx"
  },
  [950002] = {
    NumLimit = 5,
    SoundId = 950002,
    SoundPath = "event:/sfx/enemy/NE/Dajie/skill03_hit"
  },
  [950101] = {
    NumLimit = 5,
    SoundId = 950101,
    SoundPath = "event:/sfx/enemy/Mn/Haer/skil02_hit"
  },
  [950102] = {
    NumLimit = 5,
    SoundId = 950102,
    SoundPath = "event:/sfx/common/enemy/hit/swordHit_normal"
  },
  [950401] = {
    SoundId = 950401,
    SoundPath = "event:/sfx/enemy/NE/Wuyou/skill01_loop"
  },
  [950402] = {
    SoundId = 950402,
    SoundPath = "event:/sfx/enemy/NE/Wuyou/skill01_hit"
  },
  [980101] = {
    NumLimit = 5,
    SoundId = 980101,
    SoundPath = "event:/sfx/common/enemy/hit/bite"
  },
  [980201] = {
    NumLimit = 5,
    SoundId = 980201,
    SoundPath = "event:/sfx/common/enemy/hit/spearHit_normal"
  },
  [980301] = {
    NumLimit = 5,
    SoundId = 980301,
    SoundPath = "event:/sfx/common/enemy/hit/spearHit_normal"
  },
  [1020101] = {
    NumLimit = 5,
    SoundId = 1020101,
    SoundPath = "event:/sfx/weapon/Polearm/Liandu/mod01_fly"
  },
  [1020102] = {
    NumLimit = 5,
    SoundId = 1020102,
    SoundPath = "event:/sfx/weapon/Polearm/Liandu/mod01_runattack_03_fx"
  },
  [1020103] = {
    NumLimit = 5,
    SoundId = 1020103,
    SoundPath = "event:/sfx/weapon/Polearm/Liandu/mod01_runattack_03_fx03"
  },
  [1030201] = {
    NumLimit = 5,
    SoundId = 1030201,
    SoundPath = "event:/sfx/weapon/Claymore/Common/mod01_attack03_fx"
  },
  [1040101] = {
    NumLimit = 5,
    SoundId = 1040101,
    SoundPath = "event:/sfx/weapon/$MeleeWeapon$/heavy_attack_fly"
  },
  [2010101] = {
    NumLimit = 5,
    SoundId = 2010101,
    SoundPath = "event:/sfx/weapon/Pistol/Wuxu/explode"
  },
  [2010102] = {
    NumLimit = 5,
    SoundId = 2010102,
    SoundPath = "event:/sfx/weapon/Pistol/Wuxu/fx_loop"
  },
  [2010103] = {
    NumLimit = 5,
    SoundId = 2010103,
    SoundPath = "event:/sfx/weapon/Pistol/Wuxu/shoot_fx"
  },
  [2010104] = {
    NumLimit = 5,
    SoundId = 2010104,
    SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage1_hit"
  },
  [2010105] = {
    NumLimit = 5,
    SoundId = 2010105,
    SoundPath = "event:/sfx/weapon/Pistol/Wuxu/hit_earth"
  },
  [2010106] = {
    NumLimit = 5,
    SoundId = 2010106,
    SoundPath = "event:/sfx/weapon/Pistol/Wuxu/hit_earth"
  },
  [2020301] = {
    NumLimit = 5,
    SoundId = 2020301,
    SoundPath = "event:/sfx/weapon/Crossbow/Lanse/bullet_flyby"
  },
  [2020302] = {
    NumLimit = 5,
    SoundId = 2020302,
    SoundPath = "event:/sfx/weapon/Crossbow/Lanse/bullet_bounce"
  },
  [2020303] = {
    NumLimit = 5,
    SoundId = 2020303,
    SoundPath = "event:/sfx/weapon/Crossbow/Lanse/bullet_hit"
  },
  [2020304] = {
    NumLimit = 5,
    SoundId = 2020304,
    SoundPath = "event:/sfx/weapon/Crossbow/Lanse/bullet_bounce"
  },
  [2030101] = {
    NumLimit = 5,
    SoundId = 2030101,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/shoot_hit_ground"
  },
  [2030201] = {
    NumLimit = 5,
    SoundId = 2030201,
    SoundPath = "event:/sfx/weapon/Cannon/Qunxing/shoot_hit_ground"
  },
  [2030202] = {
    NumLimit = 5,
    SoundId = 2030202,
    SoundPath = "event:/sfx/weapon/Cannon/Qunxing/sub_bullet_fly"
  },
  [2030203] = {
    NumLimit = 5,
    SoundId = 2030203,
    SoundPath = "event:/sfx/weapon/Cannon/Qunxing/sub_bullet_explode"
  },
  [2030204] = {
    NumLimit = 5,
    SoundId = 2030204,
    SoundPath = "event:/sfx/common/player/hit/magic/explode_small_hit"
  },
  [2030301] = {
    NumLimit = 5,
    SoundId = 2030301,
    SoundPath = "event:/sfx/weapon/Cannon/Chiqiang/shoot_hit_ground"
  },
  [2030302] = {
    NumLimit = 5,
    SoundId = 2030302,
    SoundPath = "event:/sfx/weapon/Cannon/Chiqiang/sub_bullet_explode"
  },
  [2030303] = {
    NumLimit = 5,
    SoundId = 2030303,
    SoundPath = "event:/sfx/weapon/Cannon/Chiqiang/main_bullet_fly"
  },
  [2030304] = {
    NumLimit = 5,
    SoundId = 2030304,
    SoundPath = "event:/sfx/common/player/hit/magic/explode_small_hit"
  },
  [2030401] = {
    SoundId = 2030401,
    SoundPath = "event:/sfx/weapon/Cannon/Qingtong/break"
  },
  [2030402] = {
    SoundId = 2030402,
    SoundPath = "event:/sfx/weapon/Cannon/Qingtong/hit_ground"
  },
  [2030403] = {
    SoundId = 2030403,
    SoundPath = "event:/sfx/weapon/Cannon/Qingtong/loop"
  },
  [2030404] = {
    SoundId = 2030404,
    SoundPath = "event:/sfx/weapon/Cannon/Qingtong/loop_ground"
  },
  [2030405] = {
    SoundId = 2030405,
    SoundPath = "event:/sfx/weapon/Cannon/Qingtong/explode"
  },
  [2030406] = {
    SoundId = 2030406,
    SoundPath = "event:/sfx/weapon/Cannon/Qingtong/hit"
  },
  [2030501] = {
    SoundId = 2030501,
    SoundPath = "event:/sfx/weapon/Cannon/Yinbai/shoot_fx01"
  },
  [2030502] = {
    SoundId = 2030502,
    SoundPath = "event:/sfx/weapon/Cannon/Yinbai/shoot_fx02"
  },
  [2030503] = {
    SoundId = 2030503,
    SoundPath = "event:/sfx/weapon/Cannon/Yinbai/hit",
    SubSoundId = 1
  },
  [2040201] = {
    NumLimit = 5,
    SoundId = 2040201,
    SoundPath = "event:/sfx/weapon/Shotgun/Banzi/bullet_attach"
  },
  [2040202] = {
    NumLimit = 5,
    SoundId = 2040202,
    SoundPath = "event:/sfx/weapon/Shotgun/Banzi/bullet_hit"
  },
  [2040203] = {
    NumLimit = 5,
    SoundId = 2040203,
    SoundPath = "event:/sfx/weapon/Shotgun/Banzi/bullet_loop"
  },
  [2040301] = {
    NumLimit = 5,
    SoundId = 2040301,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/bullet_loop"
  },
  [2040302] = {
    NumLimit = 5,
    SoundId = 2040302,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/bullet_explode"
  },
  [2040501] = {
    NumLimit = 5,
    SoundId = 2040501,
    SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage1_shot"
  },
  [2040502] = {
    NumLimit = 5,
    SoundId = 2040502,
    SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage2_shot"
  },
  [2040503] = {
    NumLimit = 5,
    SoundId = 2040503,
    SoundPath = "event:/sfx/weapon/Shotgun/Baopo/sword_loop"
  },
  [2040504] = {
    NumLimit = 5,
    SoundId = 2040504,
    SoundPath = "event:/sfx/weapon/Shotgun/Baopo/ball_loop"
  },
  [2040505] = {
    NumLimit = 5,
    SoundId = 2040505,
    SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage1_hit"
  },
  [2040506] = {
    NumLimit = 5,
    SoundId = 2040506,
    SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage2_hit"
  },
  [2040507] = {
    NumLimit = 5,
    SoundId = 2040507,
    SoundPath = "event:/sfx/weapon/Shotgun/Baopo/exp"
  },
  [2040508] = {
    NumLimit = 5,
    SoundId = 2040508,
    SoundPath = "event:/sfx/weapon/Shotgun/Baopo/exp_hit"
  },
  [2040509] = {
    NumLimit = 5,
    SoundId = 2040509,
    SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage1_start"
  },
  [2040510] = {
    NumLimit = 5,
    SoundId = 2040510,
    SoundPath = "event:/sfx/weapon/Shotgun/Baopo/stage2_start"
  },
  [2050201] = {
    NumLimit = 5,
    SoundId = 2050201,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/hit"
  },
  [2050202] = {
    EmptyFXDontPlay = true,
    NumLimit = 5,
    SoundId = 2050202,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/electric_link"
  },
  [2050203] = {
    NumLimit = 5,
    SoundId = 2050203,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/hit_ground"
  },
  [2050401] = {
    NumLimit = 5,
    SoundId = 2050401,
    SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_01",
    SubSoundId = 5
  },
  [2050402] = {
    NumLimit = 5,
    SoundId = 2050402,
    SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_02",
    SubSoundId = 5
  },
  [2050403] = {
    NumLimit = 5,
    SoundId = 2050403,
    SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_03",
    SubSoundId = 5
  },
  [2050404] = {
    NumLimit = 5,
    SoundId = 2050404,
    SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_none",
    SubSoundId = 6
  },
  [2050701] = {
    NumLimit = 5,
    SoundId = 2050701,
    SoundPath = "event:/sfx/weapon/Machinegun/Yinlang/fly"
  },
  [2050702] = {
    NumLimit = 5,
    SoundId = 2050702,
    SoundPath = "event:/sfx/weapon/Machinegun/Yinlang/hit",
    SubSoundId = 1
  },
  [2050703] = {
    NumLimit = 5,
    SoundId = 2050703,
    SoundPath = "event:/sfx/weapon/Machinegun/Yinlang/hit_ground"
  },
  [2050704] = {
    NumLimit = 5,
    SoundId = 2050704,
    SoundPath = "event:/sfx/weapon/Machinegun/Yinlang/fly_start"
  },
  [2050705] = {
    NumLimit = 5,
    SoundId = 2050705,
    SoundPath = "event:/sfx/weapon/Machinegun/Yinlang/fly_back"
  },
  [2051001] = {
    NumLimit = 5,
    SoundId = 2051001,
    SoundPath = "event:/sfx/weapon/Machinegun/Ruohua/disappear"
  },
  [2051002] = {
    NumLimit = 5,
    SoundId = 2051002,
    SoundPath = "event:/sfx/weapon/Machinegun/Ruohua/fly_back"
  },
  [2051003] = {
    NumLimit = 5,
    SoundId = 2051003,
    SoundPath = "event:/sfx/weapon/Machinegun/Ruohua/fly_start"
  },
  [2051004] = {
    NumLimit = 5,
    SoundId = 2051004,
    SoundPath = "event:/sfx/weapon/Machinegun/Ruohua/fly"
  },
  [2060101] = {
    NumLimit = 5,
    SoundId = 2060101,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase01_bullet_loop"
  },
  [2060102] = {
    NumLimit = 5,
    SoundId = 2060102,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase02_bullet_loop"
  },
  [2060103] = {
    NumLimit = 5,
    SoundId = 2060103,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase03_bullet_loop"
  },
  [2060104] = {
    NumLimit = 5,
    SoundId = 2060104,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase01_light"
  },
  [2060105] = {
    NumLimit = 5,
    SoundId = 2060105,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase02_light"
  },
  [2060106] = {
    NumLimit = 5,
    SoundId = 2060106,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase03_light"
  },
  [2060107] = {
    NumLimit = 5,
    SoundId = 2060107,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase01_charge_loop"
  },
  [2060108] = {
    NumLimit = 5,
    SoundId = 2060108,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase02_charge_loop"
  },
  [2060109] = {
    NumLimit = 5,
    SoundId = 2060109,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase03_charge_loop"
  },
  [2060110] = {
    NumLimit = 5,
    SoundId = 2060110,
    SoundPath = "event:/sfx/weapon/$RangedWeapon$/phase04_charge_loop"
  },
  [2060201] = {
    NumLimit = 5,
    SoundId = 2060201,
    SoundPath = "event:/sfx/weapon/Bow/Huguang/whistle"
  },
  [2060301] = {
    NumLimit = 5,
    SoundId = 2060301,
    SoundPath = "event:/sfx/weapon/Bow/Inbu/whistle_shot"
  },
  [2060302] = {
    NumLimit = 5,
    SoundId = 2060302,
    SoundPath = "event:/sfx/common/player/hit/bullet/hit_normal_bow",
    SubSoundId = 1
  },
  [2060303] = {
    NumLimit = 5,
    SoundId = 2060303,
    SoundPath = "event:/sfx/weapon/Bow/Inbu/hit"
  },
  [2060304] = {
    NumLimit = 5,
    SoundId = 2060304,
    SoundPath = "event:/sfx/weapon/Bow/Inbu/lock"
  },
  [2060305] = {
    NumLimit = 5,
    SoundId = 2060305,
    SoundPath = "event:/sfx/weapon/Bow/Inbu/start"
  },
  [2060306] = {
    NumLimit = 5,
    SoundId = 2060306,
    SoundPath = "event:/sfx/weapon/Bow/Inbu/xuli"
  },
  [2060307] = {
    NumLimit = 5,
    SoundId = 2060307,
    SoundPath = "event:/sfx/weapon/Bow/Inbu/shot_heavy"
  },
  [2060308] = {
    NumLimit = 5,
    SoundId = 2060308,
    SoundPath = "event:/sfx/weapon/Bow/Inbu/shoot"
  },
  [3150201] = {
    NumLimit = 5,
    SoundId = 3150201,
    SoundPath = "event:/sfx/common/player/mod/helixJump_wind"
  },
  [3151301] = {
    NumLimit = 5,
    SoundId = 3151301,
    SoundPath = "event:/sfx/common/player/mod/landing_default"
  },
  [3331101] = {
    NumLimit = 5,
    SoundId = 3331101,
    SoundPath = "event:/sfx/common/player/mod/mod_deathExplosion"
  },
  [3331102] = {
    NumLimit = 5,
    SoundId = 3331102,
    SoundPath = "event:/sfx/common/enemy/hit/fireBall_hit"
  },
  [9000401] = {
    SoundId = 9000401,
    SoundPath = "event:/sfx/common/scene/shenmiao/ball_nor_exp"
  },
  [9000402] = {
    SoundId = 9000402,
    SoundPath = "event:/sfx/common/scene/shenmiao/ball_ice_exp"
  },
  [9000403] = {
    SoundId = 9000403,
    SoundPath = "event:/sfx/common/scene/shenmiao/ball_ice_field"
  },
  [9000404] = {
    SoundId = 9000404,
    SoundPath = "event:/sfx/common/scene/shenmiao/ball_gold_exp"
  },
  [9000405] = {
    SoundId = 9000405,
    SoundPath = "event:/sfx/common/scene/shenmiao/ball_gold_hit"
  },
  [9000601] = {
    SoundId = 9000601,
    SoundPath = "event:/sfx/common/scene/monster/eyegun_shot"
  },
  [9000602] = {
    SoundId = 9000602,
    SoundPath = "event:/sfx/common/enemy/hit/bullet_hit_material"
  },
  [10101101] = {
    NumLimit = 5,
    SoundId = 10101101,
    SoundPath = "event:/ui/roguelike/door_appear"
  },
  [10101102] = {
    NumLimit = 5,
    SoundId = 10101102,
    SoundPath = "event:/ui/roguelike/door_loop"
  },
  [10101103] = {
    NumLimit = 5,
    SoundId = 10101103,
    SoundPath = "event:/sfx/rougue/luxin_slash_multi"
  },
  [10101104] = {
    NumLimit = 5,
    SoundId = 10101104,
    SoundPath = "event:/sfx/rougue/luxin_slash_single"
  },
  [10103101] = {
    NumLimit = 5,
    SoundId = 10103101,
    SoundPath = "event:/sfx/rougue/huiying_shinning_start"
  },
  [10103102] = {
    NumLimit = 5,
    SoundId = 10103102,
    SoundPath = "event:/sfx/rougue/huiying_radiate_electric_burst"
  },
  [10104301] = {
    SoundId = 10104301,
    SoundPath = "event:/sfx/rougue/liuming_tree_heal"
  },
  [10104302] = {
    SoundId = 10104302,
    SoundPath = "event:/sfx/rougue/liuming_tree_attack"
  },
  [10105202] = {
    NumLimit = 5,
    SoundId = 10105202,
    SoundPath = "event:/sfx/rougue/shiyingdie_bullet"
  },
  [10105203] = {
    NumLimit = 5,
    SoundId = 10105203,
    SoundPath = "event:/sfx/rougue/shiyingdie_wind_hole"
  },
  [10106101] = {
    NumLimit = 5,
    SoundId = 10106101,
    SoundPath = "event:/sfx/rougue/yeguangchong_fx_gun_appear"
  },
  [10106102] = {
    NumLimit = 5,
    SoundId = 10106102,
    SoundPath = "event:/sfx/rougue/yeguangchong_bullet_fly"
  },
  [10106103] = {
    NumLimit = 5,
    SoundId = 10106103,
    SoundPath = "event:/sfx/rougue/yeguangchong_bullet_burst"
  },
  [10108101] = {
    NumLimit = 5,
    SoundId = 10108101,
    SoundPath = "event:/sfx/rougue/fuhaiyue_bullet_fly"
  },
  [10108102] = {
    NumLimit = 5,
    SoundId = 10108102,
    SoundPath = "event:/sfx/rougue/fuhaiyue_bullet_burst"
  },
  [10108103] = {
    NumLimit = 5,
    SoundId = 10108103,
    SoundPath = "event:/sfx/rougue/fuhai_appear"
  },
  [10108104] = {
    NumLimit = 5,
    SoundId = 10108104,
    SoundPath = "event:/sfx/rougue/fuhai_explode"
  },
  [10109102] = {
    NumLimit = 5,
    SoundId = 10109102,
    SoundPath = "event:/sfx/rougue/jixuehua_buff_start"
  },
  [10109103] = {
    NumLimit = 5,
    SoundId = 10109103,
    SoundPath = "event:/sfx/rougue/jixue_cast"
  },
  [40101001] = {
    SoundId = 40101001,
    SoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_01"
  },
  [600000901] = {
    NumLimit = 5,
    SoundId = 600000901,
    SoundPath = "event:/sfx/common/enemy/buff/strong_iceOrb_01"
  },
  [600000902] = {
    NumLimit = 5,
    SoundId = 600000902,
    SoundPath = "event:/sfx/common/enemy/buff/strong_iceOrb_02"
  },
  [600000903] = {
    NumLimit = 5,
    SoundId = 600000903,
    SoundPath = "event:/sfx/common/enemy/hit/ice_hit"
  },
  [600001001] = {
    NumLimit = 5,
    SoundId = 600001001,
    SoundPath = "event:/sfx/common/enemy/buff/strong_reflect_01"
  },
  [600001002] = {
    NumLimit = 5,
    SoundId = 600001002,
    SoundPath = "event:/sfx/common/enemy/buff/strong_reflect_02"
  },
  [600001003] = {
    NumLimit = 5,
    SoundId = 600001003,
    SoundPath = "event:/sfx/common/enemy/buff/strong_reflect_loop"
  },
  [600001004] = {
    NumLimit = 5,
    SoundId = 600001004,
    SoundPath = "event:/sfx/common/enemy/hit/fireSmall_hit"
  },
  [600001101] = {
    NumLimit = 5,
    SoundId = 600001101,
    SoundPath = "event:/sfx/common/enemy/buff/strong_kamiKaze_01"
  },
  [600001102] = {
    NumLimit = 5,
    SoundId = 600001102,
    SoundPath = "event:/sfx/common/enemy/buff/strong_kamiKaze_02"
  },
  [600001103] = {
    NumLimit = 5,
    SoundId = 600001103,
    SoundPath = "event:/sfx/common/enemy/hit/explode_small_hit"
  },
  [600001201] = {
    NumLimit = 5,
    SoundId = 600001201,
    SoundPath = "event:/sfx/common/enemy/buff/strong_thunderLaser_01"
  },
  [600001202] = {
    NumLimit = 5,
    SoundId = 600001202,
    SoundPath = "event:/sfx/common/enemy/buff/strong_thunderLaser_loop"
  },
  [600001203] = {
    NumLimit = 5,
    SoundId = 600001203,
    SoundPath = "event:/sfx/common/enemy/hit/energy_hit"
  },
  [600001301] = {
    NumLimit = 5,
    SoundId = 600001301,
    SoundPath = "event:/sfx/common/enemy/buff/strong_vampire"
  },
  [600001401] = {
    NumLimit = 5,
    SoundId = 600001401,
    SoundPath = "event:/sfx/common/enemy/buff/strong_threeFold"
  },
  [900000001] = {
    SoundId = 900000001,
    SoundPath = "event:/sfx/weapon/Cannon/Qunxing/shoot_hit_ground"
  }
})
