local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DanmakuTemplate", {
  [1] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/Test/BP_DanmakuTemplate_1.BP_DanmakuTemplate_1",
    Type = 1,
    UseSkillCreature = true
  },
  [2] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_XY.BP_Danmaku_XY",
    Type = 2,
    UseSkillCreature = true
  },
  [3] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_RandomDown.BP_Danmaku_RandomDown",
    Type = 3,
    UseSkillCreature = true
  },
  [10] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/Test/BP_DanmakuTemplate_2.BP_DanmakuTemplate_2",
    Type = 10
  },
  [11] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/Test/BP_DanmakuTemplate_3.BP_DanmakuTemplate_3",
    Type = 11,
    Vars = {IsTest = true}
  },
  [30401] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossOnline_Skill0901.BP_Danmaku_BossOnline_Skill0901",
    Type = 30401
  },
  [850041] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossXibi_Skill04_Bullet.BP_Danmaku_BossXibi_Skill04_Bullet",
    Type = 850041
  },
  [850051] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossXibi_Skill05.BP_Danmaku_BossXibi_Skill05",
    Type = 850051
  },
  [850101] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLizhan_Skill10_Danmaku.BP_Danmaku_BossLizhan_Skill10_Danmaku",
    Type = 850101,
    UseSkillCreature = true
  },
  [850102] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLizhan_Skill04_Danmaku.BP_Danmaku_BossLizhan_Skill04_Danmaku",
    Type = 850102
  },
  [850201] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi_Skill19_Bullet.BP_Danmaku_BossSaiqi_Skill19_Bullet",
    Type = 850201
  },
  [850301] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossShijingzhe.BP_Danmaku_BossShijingzhe",
    Type = 850301,
    UseSkillCreature = true
  },
  [850302] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossShijingzhe_2.BP_Danmaku_BossShijingzhe_2",
    Type = 850302,
    UseSkillCreature = true
  },
  [850303] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossShijingzhe_3.BP_Danmaku_BossShijingzhe_3",
    Type = 850303,
    UseSkillCreature = true
  },
  [850304] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossShijingzhe_4.BP_Danmaku_BossShijingzhe_4",
    Type = 850304
  },
  [850305] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossShijingzhe_Skill15.BP_Danmaku_BossShijingzhe_Skill15",
    Type = 850305,
    UseSkillCreature = true
  },
  [850401] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill01_Bullet.BP_Danmaku_BossSaiqi02_Skill01_Bullet",
    Type = 850401
  },
  [850402] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill02_Bullet.BP_Danmaku_BossSaiqi02_Skill02_Bullet",
    Type = 850402
  },
  [850403] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill03_Bullet.BP_Danmaku_BossSaiqi02_Skill03_Bullet",
    Type = 850403
  },
  [850404] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill04_Bullet.BP_Danmaku_BossSaiqi02_Skill04_Bullet",
    Type = 850404
  },
  [850405] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill05_Bullet.BP_Danmaku_BossSaiqi02_Skill05_Bullet",
    Type = 850405
  },
  [850406] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill06_Bullet.BP_Danmaku_BossSaiqi02_Skill06_Bullet",
    Type = 850406
  },
  [850407] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill18_Bullet.BP_Danmaku_BossSaiqi02_Skill18_Bullet",
    Type = 850407
  },
  [850408] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill19_Bullet.BP_Danmaku_BossSaiqi02_Skill19_Bullet",
    Type = 850408
  },
  [850409] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill20_Left_Bullet.BP_Danmaku_BossSaiqi02_Skill20_Left_Bullet",
    Type = 850409
  },
  [850410] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill20_Right_Bullet.BP_Danmaku_BossSaiqi02_Skill20_Right_Bullet",
    Type = 850410
  },
  [850411] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill21_Down_Bullet.BP_Danmaku_BossSaiqi02_Skill21_Down_Bullet",
    Type = 850411,
    UseSkillCreature = true
  },
  [850412] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill21_Up_Bullet.BP_Danmaku_BossSaiqi02_Skill21_Up_Bullet",
    Type = 850412,
    UseSkillCreature = true
  },
  [850413] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill22_Bullet.BP_Danmaku_BossSaiqi02_Skill22_Bullet",
    Type = 850413
  },
  [850414] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill23_Bullet.BP_Danmaku_BossSaiqi02_Skill23_Bullet",
    Type = 850414
  },
  [850415] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill19_02_Bullet.BP_Danmaku_BossSaiqi02_Skill19_02_Bullet",
    Type = 850415
  },
  [850416] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill04_02_Bullet.BP_Danmaku_BossSaiqi02_Skill04_02_Bullet",
    Type = 850416
  },
  [850417] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill05_02_Bullet.BP_Danmaku_BossSaiqi02_Skill05_02_Bullet",
    Type = 850417
  },
  [850418] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossSaiqi02_Skill29_Bullet.BP_Danmaku_BossSaiqi02_Skill29_Bullet",
    Type = 850418
  },
  [850419] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_Picture_Bullet.BP_Danmaku_Picture_Bullet",
    Type = 850419
  },
  [850901] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossTuosi_Skill0701.BP_Danmaku_BossTuosi_Skill0701",
    Type = 850901
  },
  [850902] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossTuosi_Skill0702.BP_Danmaku_BossTuosi_Skill0702",
    Type = 850902
  },
  [850903] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossTuosi_Skill0801.BP_Danmaku_BossTuosi_Skill0801",
    Type = 850903
  },
  [850904] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossTuosi_Skill0802.BP_Danmaku_BossTuosi_Skill0802",
    Type = 850904
  },
  [851001] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossHeilong_Laser.BP_Danmaku_BossHeilong_Laser",
    Type = 851001
  },
  [851002] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossHeilong_Games.BP_Danmaku_BossHeilong_Games",
    Type = 851002
  },
  [851003] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossHeilong_Skill07_Bullet.BP_Danmaku_BossHeilong_Skill07_Bullet",
    Type = 851003,
    UseSkillCreature = true
  },
  [851004] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossHeilong_Skill08_Laser.BP_Danmaku_BossHeilong_Skill08_Laser",
    Type = 851004
  },
  [851101] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossBailong_Laser.BP_Danmaku_BossBailong_Laser",
    Type = 851101
  },
  [851201] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLinen_Summon1_Laser.BP_Danmaku_BossLinen_Summon1_Laser",
    Type = 851201,
    UseSkillCreature = true
  },
  [851202] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLinen_Summon3_Laser.BP_Danmaku_BossLinen_Summon3_Laser",
    Type = 851202,
    UseSkillCreature = true
  },
  [851203] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLinen_Skill06_Laser.BP_Danmaku_BossLinen_Skill06_Laser",
    Type = 851203,
    UseSkillCreature = true
  },
  [851204] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLinen_Skill06Air_Laser.BP_Danmaku_BossLinen_Skill06Air_Laser",
    Type = 851204,
    UseSkillCreature = true
  },
  [851205] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLinen_Skill09_Laser.BP_Danmaku_BossLinen_Skill09_Laser",
    Type = 851205,
    UseSkillCreature = true
  },
  [851206] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLinen_Skill09Air_Laser.BP_Danmaku_BossLinen_Skill09Air_Laser",
    Type = 851206,
    UseSkillCreature = true
  },
  [851207] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLinen_Skill09Ground_Laser.BP_Danmaku_BossLinen_Skill09Ground_Laser",
    Type = 851207,
    UseSkillCreature = true
  },
  [851301] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossKuxiu_Skill07.BP_Danmaku_BossKuxiu_Skill07",
    Type = 851301
  },
  [851501] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossJushi_Skill0401.BP_Danmaku_BossJushi_Skill0401",
    Type = 851501
  },
  [851502] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossJushi_Skill0402.BP_Danmaku_BossJushi_Skill0402",
    Type = 851502
  },
  [851503] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossJushi_Skill0403.BP_Danmaku_BossJushi_Skill0403",
    Type = 851503
  },
  [851504] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossJushi_Skill0701.BP_Danmaku_BossJushi_Skill0701",
    Type = 851504
  },
  [851505] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossJushi_Skill0501.BP_Danmaku_BossJushi_Skill0501",
    Type = 851505
  },
  [851506] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossJushi_Skill0601.BP_Danmaku_BossJushi_Skill0601",
    Type = 851506
  },
  [851901] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLiecheCannon_Skill0201.BP_Danmaku_BossLiecheCannon_Skill0201",
    Type = 851901
  },
  [851902] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossLiecheCannon_Skill0202.BP_Danmaku_BossLiecheCannon_Skill0202",
    Type = 851902
  },
  [852001] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_BossAida_Skill1301.BP_Danmaku_BossAida_Skill1301",
    Type = 852001
  },
  [600000401] = {
    AttachToOwner = true,
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_RandomAround.BP_Danmaku_RandomAround",
    Type = 600000401
  },
  [600000406] = {
    BPPath = "/Game/BluePrints/Combat/Danmaku/BP_Danmakus/BP_Danmaku_RotateLaser.BP_Danmaku_RotateLaser",
    Type = 600000406,
    UseSkillCreature = true
  }
})
