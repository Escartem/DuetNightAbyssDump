local Const = {HOT_RELOAD = true}
Const.BattleHistoryTags = {
  "Skill",
  "Buff",
  "SkillEffect",
  "SkillCreature",
  "Summon",
  "Phantom",
  "MechanismSummon",
  "Mechanism",
  "Monster"
}
Const.VectorSizeZero = 1.0E-5
Const.NearZero = 1.0E-4
Const.LittleOffset = 0.1
Const.TestInt = 4
Const.SlideSpeed = 5000
Const.BulletJumpSpeed = 800
Const.MaxJumpCount = 2
Const.MaxBulletJumpCount = 1
Const.SpeedLowGravity = 150
Const.LowGravityScale = 1.5
Const.HighGravityScale = 2.8
Const.SlideBlendTime = 0.2
Const.AvoidDeccelerTime = 0.03
Const.DoSlideDelayTime = 0.1
Const.DefaultCD = 0
Const.BoneHitTime = 0.4
Const.Shoulder = 1
Const.Hand = 2
Const.Blend = 3
Const.NormalState = 0
Const.FirstJump = 1
Const.SecondJump = 2
Const.BulletJump = 3
Const.WallJump = 4
Const.JumpFall = 5
Const.Climb = 6
Const.FlipEaves = 7
Const.Flying = 8
Const.JumpFunctionIndex = {
  "FirstJump",
  "SecondJump",
  "BulletJump",
  "WallJump"
}
Const.BulletJumpDebug = false
Const.DebugDruration = 3
Const.ClimbHeight = 176.682999
Const.RunStopStartTime = 0.13
Const.TransplantSize = 500
Const.NormalWallJump = "NormalWallJump"
Const.LeftSideWallJump = "LeftSideWallJump"
Const.RightSideWallJump = "RightSideWallJump"
Const.NormalWallJumpHeight = 300
Const.SideWallJumpHeight = 400
Const.SideWallJumpMultiply = 3
Const.GapDistance = 30
Const.GuidePointName = "GuideManBornLoc"
Const.FallAttackPointName = "BP_FallAttackPoint"
Const.Walking = 1
Const.Falling = 3
Const.Custom = 6
Const.Slide = 2
Const.InvincibleBuffId = 301
Const.Forward = 0
Const.Right = 1
Const.Left = 2
Const.Backward = 3
Const.VelocityBlendInterpSpeed = 12.0
Const.AimRotLerpSpeed = 30.0
Const.FwdThresholdR = 22.5
Const.FwdThresholdL = -22.5
Const.FRThresholdR = 67.5
Const.FLThresholdL = -67.5
Const.RThresholdRB = 112.5
Const.LThresholdLB = -112.5
Const.BckThresholdR = 157.5
Const.BckThresholdL = -157.5
Const.FRThreshold = 60
Const.FLThreshold = -60
Const.BRThreshold = 120
Const.BLThreshold = -120
Const.Buffer = 5
Const.AllQuestChainType = -1
Const.MainQuestChainType = 1
Const.DailyQuestChainType = 2
Const.SideQuestChainType = 3
Const.MainActivityQuestChainType = 6
Const.LimTimeQuestChainType = 5
Const.SpecialSideQuestChainType = 4
Const.MontageBlendOutTime = 0.1
Const.CrouchWalkSpeed = 160
Const.NormalWalkSpeed = 500
Const.MaxClimbHeight = 100
Const.MinClimbHeight = 20
Const.RST_World = 0
Const.RST_Component = 2
Const.UpVector = FVector(0, 0, 1)
Const.ZeroVector = FVector(0, 0, 0)
Const.OneVector = FVector(1, 1, 1)
Const.UpFootHeight = FVector(0.0, 0.0, 50)
Const.DownFootHeight = FVector(0.0, 0.0, 45)
Const.XAxisVector = FVector(1, 0, 0)
Const.FootCheckRadius = 15
Const.FootHeight = 10
Const.FootHeight2 = 9.5
Const.IkFootBoneHeight = 13
Const.ClampFootRot = 10
Const.StandSlopeThreshold = 0.75
Const.InterSpeedLevel0 = 5
Const.InterSpeedLevel1 = 10
Const.InterSpeedLevel2 = 15
Const.InterSpeedLevel3 = 30
Const.InterSpeedLevel4 = 40
Const.EnterIKDelay = 1
Const.DefaultAimRot = FRotator(0.5, 0.5, 0)
Const.RightAngle = 90
Const.HalfRightAngle = 45
Const.FlatAngle = 180
Const.Angle270 = 270
Const.FullAngle = 360
Const.LowerPlayRate = 1.15
Const.HigherPlayRate = 3
Const.PushFactorSlide = 1
Const.PushFactorBulletJump = 1
Const.BulletClimbAngle = 45
Const.Enemy = 0
Const.Friend = 1
Const.Neutral = 2
Const.NormalAttack = "Attack"
Const.FallAttack = "FallAttack"
Const.HeavyAttack = "HeavyAttack"
Const.NormalSkill = "Skill1"
Const.UltraSkill = "Skill2"
Const.SummonRoleSupportSkill = "Skill3"
Const.SupportSkill = "Support"
Const.SlideSkill = "SlideAttack"
Const.FireSkill = "Shooting"
Const.HeavyShooting = "HeavyShooting"
Const.OverHeatSkill = "ShootingOverheat"
Const.ReloadSkill = "Reload"
Const.CondemnSkill = "Condemn"
Const.PassiveSkill = "Passive"
Const.ExtraPassiveSkill = "ExtraPassive"
Const.HomeBaseSubRegionId = 210101
Const.IceCitySubRegionId = 101101
Const.StopUnknown = 0
Const.StopNormal = 1
Const.StopBySkillCancel = 2
Const.StopByWalkCancel = 3
Const.StopBySlideCancel = 4
Const.StateNormal = 0
Const.StateHitFly = 2
Const.StateHitFlyDown = 3
Const.StateHeavyHit_1 = 4
Const.StateHeavyHit_2 = 5
Const.StateLightHit = 6
Const.StateLightHitRanged = 7
Const.Player = "Player"
Const.Monster = "Monster"
Const.First = 1
Const.Second = 2
Const.SimulatedProxy = 1
Const.AutonomousProxy = 2
Const.Authority = 3
Const.AutoPickupDistance = 500
Const.ManualPickupDistance = 100
Const.LandHeavySpeed = -2000
Const.SummonInheritAttrs = {
  MaxHp = 1,
  Hp = 1,
  MaxES = 1,
  ES = 1,
  DEF = 1,
  SkillRange = 1,
  SkillSustain = 1,
  SkillEfficiency = 1,
  SkillIntensity = 1
}
Const.HpAttrNames = {MaxHp = 1}
Const.ATKAttrNames = {ATK = 1, WeaponATKModifierRate = 1}
Const.WeaponAttrTable = {}
local AttrATKList = {}
for _AttrName, _ in pairs(DataMgr.Attribute) do
  local AttrName = "ATK_" .. _AttrName
  Const.ATKAttrNames[AttrName] = 1
  Const.WeaponAttrTable[AttrName] = 1
  table.insert(AttrATKList, AttrName)
end
Const.WeaponModifierAttrs = {
  WeaponATKModifierRate = {
    AttrNames = AttrATKList,
    RateAttr = "WeaponATKModifierRate",
    ValueAttr = "WeaponATKModifierValue",
    CalcATK = 1,
    RateIndex = CommonConst.RateIndex.GlobalATK
  },
  AttackSpeedModifierRate_Normal = {
    AttrNames = {
      "AttackSpeed_Normal"
    },
    RateAttr = "AttackSpeedModifierRate_Normal",
    ValueAttr = "AttackSpeedModifierValue_Normal"
  },
  AttackSpeedModifierValue_Normal = {
    AttrNames = {
      "AttackSpeed_Normal"
    },
    RateAttr = "AttackSpeedModifierRate_Normal",
    ValueAttr = "AttackSpeedModifierValue_Normal"
  },
  AttackRangeModifierRate_Normal = {
    AttrNames = {
      "AttackRange_Normal"
    },
    RateAttr = "AttackRangeModifierRate_Normal",
    ValueAttr = "AttackRangeModifierValue_Normal"
  },
  AttackRangeModifierValue_Normal = {
    AttrNames = {
      "AttackRange_Normal"
    },
    RateAttr = "AttackRangeModifierRate_Normal",
    ValueAttr = "AttackRangeModifierValue_Normal"
  },
  AttackRangeModifierRate_Bullet = {
    AttrNames = {
      "AttackRange_Bullet"
    },
    RateAttr = "AttackRangeModifierRate_Bullet",
    ValueAttr = "AttackRangeModifierValue_Bullet"
  },
  AttackRangeModifierValue_Bullet = {
    AttrNames = {
      "AttackRange_Bullet"
    },
    RateAttr = "AttackRangeModifierRate_Bullet",
    ValueAttr = "AttackRangeModifierValue_Bullet"
  },
  WeaponCRIModifierRate = {
    AttrNames = {"CRI"},
    RateAttr = "WeaponCRIModifierRate",
    ValueAttr = "WeaponCRIModifierValue"
  },
  WeaponCRIModifierValue = {
    AttrNames = {"CRI"},
    RateAttr = "WeaponCRIModifierRate",
    ValueAttr = "WeaponCRIModifierValue"
  },
  WeaponCRDModifierRate = {
    AttrNames = {"CRD"},
    RateAttr = "WeaponCRDModifierRate",
    ValueAttr = "WeaponCRDModifierValue"
  },
  WeaponCRDModifierValue = {
    AttrNames = {"CRD"},
    RateAttr = "WeaponCRDModifierRate",
    ValueAttr = "WeaponCRDModifierValue"
  },
  TriggerProbModifierRate = {
    AttrNames = {
      "TriggerProbability"
    },
    RateAttr = "TriggerProbModifierRate",
    ValueAttr = "TriggerProbModifierValue"
  },
  TriggerProbModifierValue = {
    AttrNames = {
      "TriggerProbability"
    },
    RateAttr = "TriggerProbModifierRate",
    ValueAttr = "TriggerProbModifierValue"
  },
  MultiShootModifierRate = {
    AttrNames = {"MultiShoot"},
    RateAttr = "MultiShootModifierRate",
    ValueAttr = "MultiShootModifierValue"
  },
  MultiShootModifierValue = {
    AttrNames = {"MultiShoot"},
    RateAttr = "MultiShootModifierRate",
    ValueAttr = "MultiShootModifierValue"
  }
}
Const.WeaponModifierAttrChangers = {
  AttackSpeed_Normal = {
    BattleEvent = "AttackSpeedNormalChanged"
  }
}
Const.ROLE_None = 0
Const.ROLE_SimulatedProxy = 1
Const.ROLE_AutonomousProxy = 2
Const.ROLE_Authority = 3
Const.ROLE_MAX = 4
Const.NM_Standalone = 0
Const.NM_DedicatedServer = 1
Const.NM_ListenServer = 2
Const.NM_Client = 3
Const.NM_MAX = 4
Const.StatePrepare = 0
Const.StateGameModeReady = 1
Const.StateRunning = 2
Const.StateAlert = 3
Const.StateBattle = 4
Const.StatePause = 5
Const.StateEnd = 6
Const.ExitStateAlert = 7
Const.StateBattleProgress = 99
Const.ProgressRecoverDungeonType = {
  Survival = true,
  SurvivalPro = true,
  SurvivalMini = true,
  Defence = true,
  Excavation = true,
  Rouge = true
}
Const.DungeonEnd_NoReason = 0
Const.DungeonEnd_PlayerDead = 1
Const.DungeonEnd_DefenceCoreDead = 2
Const.GameModeEventServer = 0
Const.GameModeEventServerClient = 1
Const.AimProtectYaw = 175
Const.MaXRotPercent = 0.12
Const.ShootAimLengthLR = 1
Const.ShootAimLengthDU = 1
Const.CrouchHalfHeight = 67.5
Const.CrouchShrinkSpeed = 160
Const.SlideHalfHeight = 45
Const.SlideShrinkSpeed = 200
Const.BulletJumpHalfHeight = 44
Const.BulletJumpShrinkSpeed = 160
Const.SecondJumpHalfHeight = 44
Const.SecondJumpShrinkSpeed = 160
Const.WallJumpHalfHeight = 44
Const.WallJumpShrinkSpeed = 160
Const.CreateType = {
  Monster = 1,
  Npc = 1,
  CombatProp = 1,
  BattleChar = 1,
  Mechanism = 2,
  Phantom = 1
}
Const.ScreenFadeMat = "Material'/Game/Asset/Char/Player/Common/Material/PP/MI_PP_ScreenFade.MI_PP_ScreenFade'"
Const.HitToLevel = {
  BoneHit = 1,
  LightHit = 2,
  LightHitRanged = 2,
  HeavyHit = 3,
  HitRepel = 4,
  HitFly = 5,
  GrabHit = 6
}
Const.LevelToHit = {
  "BoneHit",
  "LightHit",
  "HeavyHit",
  "HitRepel",
  "HitFly",
  "GrabHit"
}
Const.CauseHitTypeNormal = 0
Const.CauseHitTypeFirst = 1
Const.CauseHitTypeDie = 2
Const.NormalStateInAlert = 0
Const.AlertState = 1
Const.FightState = 2
Const.EndBattleState = 3
Const.YXDNewState = 99
Const.PresetNone = 0
Const.PresetPlayer = 1
Const.PresetMechanism = 2
Const.SurvivalResourceItemId = 1006
Const.DefaultRoleId = 1101
Const.DeafaultMeleeWeapon = nil
Const.DeafaultRangedWeapon = nil
Const.DefaultBattlePet = 101
Const.DefaultPetLocation = FVector(0, 50, 0)
Const.RandomLimitedPetRarity = 4
Const.NvZhuRoleId = 101
Const.NanZhuRoleId = 104
Const.DefaultKawaiiLinkLayer = "AnimBlueprint'/Game/AssetDesign/Char/Player/Heitao/ABP_Heitao_Kawaii.ABP_Heitao_Kawaii'"
Const.MouthSlotName = "FacialMouth"
Const.EyeSlotName = "FacialMouth"
Const.RougeLikeBuff = 10101101
Const.BuffDotDuration = 10
Const.BuffDotDamage = "Dot"
Const.BuffDotHot = "Hot"
Const.BuffDotAddShield = "AddShield"
Const.BuffDotSkillEffect = "SkillEffect"
Const.BuffDotSpChange = "SpChange"
Const.BuffDefaultFresnelParams = {
  FresnelColor = {
    0.953125,
    0.677123,
    0.541725,
    0
  },
  FresnelColorRange = {Default = 0},
  FresnelColorStrength = {Default = 0}
}
Const.BuffDefaultNextPassParams = {
  NextPassShowyColor = {
    0,
    0,
    0,
    0
  },
  NextPassShowy = {Default = 0},
  NextPassShowyWidth = {Default = 0.3}
}
Const.PathTypeNoNav = 0
Const.PathTypeNoPath = 1
Const.PathTypeHasPath = 2
Const.EmojiIdleDelay = 5
Const.EmoIdleVoiceCoolDown = 60
Const.WholeShootHoldTime = 10
Const.StopShootHoldDelay = 2
Const.ExtraFixVitamin = {
  "Mon.Strong.Poison"
}
Const.BossMonster = {"Mon.Boss"}
Const.StrongMonster = {"Mon.Strong"}
Const.EliteMonster = {"Mon.Elite"}
Const.SummonLightMonster = {
  "Mon.Summon.Light"
}
Const.CaptureMonster = {
  "Mon.Capture"
}
Const.InvisibleMonster = {
  "Mon.Invisible"
}
Const.SurvivalPoisonMonster = {
  "Mon.SurvivalPoison"
}
Const.StrongBloodMonster = {
  "Mon.Strong.Blood"
}
Const.StrongBurstMonster = {
  "Mon.Strong.Burst"
}
Const.StrongFadeMonster = {
  "Mon.Strong.Fade"
}
Const.StrongFrozenMonster = {
  "Mon.Strong.Frozen"
}
Const.StrongPoisonMonster = {
  "Mon.Strong.Poison"
}
Const.StrongShieldMonster = {
  "Mon.Strong.Shield"
}
Const.StrongThunderMonster = {
  "Mon.Strong.Thunder"
}
Const.MinusFindPathDist = 2000
Const.InitialCollisionProfileName = "meshcollision"
Const.HittedCollisionProfileName = "Ragdoll"
Const.DefaultBuffCollisionProfileName = "Ragdoll"
Const.ECreatorInit = 0
Const.ECreateSuccess = 1
Const.ELevelUnloaded = 2
Const.AllSKillNames = {
  ESkillName.Skill1,
  ESkillName.Skill2,
  ESkillName.Skill3,
  ESkillName.Passive,
  ESkillName.Attack,
  ESkillName.FallAttack,
  ESkillName.HeavyAttack,
  ESkillName.SlideAttack,
  ESkillName.Fire,
  ESkillName.ChargeBullet,
  ESkillName.HeavyShooting
}
Const.ArmoryIdleTags = {
  None = "None",
  Armory = "Armory",
  Armory_Mod = "Armory_Mod",
  Armory_Grade = "Armory_Grade",
  Armory_Pet = "Armory_Pet"
}
Const.ArmoryActionIdToArmoryTag = {
  [1] = "Melee",
  [2] = "Ranged",
  [3] = "Armory",
  [4] = "Ultra",
  [5] = "Armory_Grade"
}
Const.MaxBatteryOneChar = 4
Const.MaxCrackKeyOneChar = 1
Const.MainCityID = 2101
Const.DefaultMainCityFile = "/Game/Maps/Chapter01_HomeBase"
Const.DefaultLoginSceneFile = "/Game/Maps/Login"
Const.DefaultMainCityRegionId = 210101
Const.DefaultPrologueRegionId = 100103
Const.BigIceLakeRegionId = 1011
Const.BaseSummonOffset = 100
local L = Const.BaseSummonOffset
Const.SummonOffset = {}
Const.HitFlyHeightMinValue = 50
for i = 0, 2 do
  for j = 0, i do
    local k = i - j
    if 0 == k and 0 == j then
      table.insert(Const.SummonOffset, {
        k * L,
        j * L
      })
    elseif 0 == k then
      table.insert(Const.SummonOffset, {
        k * L,
        j * L
      })
      table.insert(Const.SummonOffset, {
        k * L,
        -j * L
      })
    elseif 0 == j then
      table.insert(Const.SummonOffset, {
        k * L,
        j * L
      })
      table.insert(Const.SummonOffset, {
        -k * L,
        j * L
      })
    else
      table.insert(Const.SummonOffset, {
        k * L,
        j * L
      })
      table.insert(Const.SummonOffset, {
        -k * L,
        j * L
      })
      table.insert(Const.SummonOffset, {
        k * L,
        -j * L
      })
      table.insert(Const.SummonOffset, {
        -k * L,
        -j * L
      })
    end
  end
end
Const.AttrLimit = {}
for AttrName, Data in pairs(DataMgr.AttrLimit) do
  if Data.AttachAttrName then
    Const.AttrLimit[Data.AttachAttrName] = Data.LimitValue
  end
end
Const.PlayerRecoverySkill = 20
Const.PlayerCondemnSkill = 30
Const.EmptyTNHpPercent = 0.3
Const.DefaultWeaponArmSocket = "root_point"
Const.UseLocation = {
  Weapon = "Weapon",
  ChildWeapon = "ChildWeapon",
  Target = "Target",
  Char = "Char"
}
Const.DefaultSkillLevel = 1
Const.DefaultSkillGrade = 0
Const.DefaultCharGrade = 0
Const.DefaultWeaponGrade = 0
Const.DefaultPhantomSkillLevel = 1
Const.DefaultPhantomSkillGrade = 0
Const.MontageSuffix = "_Montage"
Const.GravityAcceleration = -980
Const.BodyAccessoryDropFrameCount = 3
Const.ShortPressThreshold = 0.3
Const.LongPressThreshold = 1.5
Const.TalkUIDeactiveTimeThreshold = 3
Const.TalkState_IsInTalk = "IsInTalk"
Const.TalkState_DisableMonsterSpawn = "DisableMonsterSpawn"
Const.TalkState_HiddenGameUI = "HiddenGameUI"
Const.Tag_GamePausedByTalk = "PausedByTalk"
Const.Talk_LevelSequenceActorPath = "/Game/BluePrints/Story/Talk/Base/BP_TalkSequenceActor.BP_TalkSequenceActor_C"
Const.MaxFloorDetection = 2000
Const.BuffEffectInterval = 2
Const.SkillCreatureSpeed = 1
Const.TalkSoundKey = "Talk_VO"
Const.ReviewSoundKey = "Review_VO"
Const.DialogueEffectSoundKey = "DialogueEffectSoundKey"
Const.TalkActionMontageGroupName = "TalkGroup"
Const.CharacterFacialMouthMontageGroupName = "TalkFacialMouth"
Const.CharacterFacialEyeMontageGroupName = "TalkFacialEye"
Const.ForceEndInteractive = 1
Const.NormalEndInteractive = 0
Const.NoInteractive = 0
Const.InteractiveStart = 1
Const.InteractiveWaitToEnd = 2
Const.ClickInteractive = 1
Const.PressInteractive = 2
Const.EndByTargetInteractive = 3
Const.EnableTaskPrintError = true
Const.OpenFramingCreateUnit = {
  Npc = true,
  Monster = true,
  Drop = true,
  Mechanism = true
}
Const.RegionSerializeUnitType = {
  Npc = 1,
  Monster = 1,
  Drop = 1,
  Mechanism = 1,
  Pet = 1,
  Phantom = 1
}
Const.FrameCreateUnitCount = {
  Npc = 1,
  Monster = 1,
  Drop = 1,
  Mechanism = 1
}
Const.MonsterCullDistance = 7000
Const.EnableTickLod = true
Const.EnableDungeonAssetsPreload = true
Const.DataMgrGCUseCount = 20
Const.DataMgrGCTablePercent = 0.5
Const.SkillCreaturePoolRefreshTime = 20
Const.SkillCreaturePoolCleanTime = 60
Const.SkillCreaturePoolDefaultPreloadNum = 100
Const.EnableMonsterPreloadPackage = true
Const.EnableNpcPreloadPackage = true
Const.OptimizationRegionRPC = true
Const.bSkipEQSTestWhilePlatformWarning = false
Const.NumOfEQSItemWhilePlatformWarning = 5
Const.EnablePlayerPreload = true
Const.EnableDungeonPhantomPreload = true
Const.EnableMonLevelChecker = true
Const.AndroidPlayDeathEffectDist = 1500
Const.EnableClientRpcDelay = true
Const.PushMonsterOptimizationLevel = 2
Const.BeginRagdollExecutePreFrame_PC = 3
Const.BeginRagdollExecutePreFrame_IOS = 3
Const.BeginRagdollExecutePreFrame_Android = 1
Const.bEnablePlayerRootMotionOptimizations = true
Const.CharResourcePaths = {
  DistructableBodyBp = "/Game/BluePrints/Item/AccessoryItems/BP_DestructablePart.BP_DestructablePart_C",
  AccessoryBP = "/Game/BluePrints/Item/AccessoryItems/BP_BodyAccessoryItem.BP_BodyAccessoryItem_C",
  StaticAccessoryBP = "/Game/BluePrints/Item/AccessoryItems/BP_BodyAccessoryStaticItem.BP_BodyAccessoryStaticItem_C"
}
Const.FixTraceChannel = {
  TraceCreatureHit = ETraceTypeQuery.TraceCreatureHit,
  TraceScene = ETraceTypeQuery.TraceScene
}
Const.BlockTickLodTag = {
  SceneGuide = "SceneGuide",
  CharBillboard = "CharBillboard"
}
Const.EDungeonUIState = {
  None = 0,
  BeforeTarget = 1,
  OnTarget = 2,
  AfterTarget = 3
}
Const.BrushStaticMesh = {
  "SM_Zhanshijia_01",
  "\229\156\176\229\155\190B",
  "\229\156\176\229\155\190\232\180\180\231\186\184"
}
Const.CharWaitInitTag = {
  AssetsLoading = "AssetsLoading",
  OverlapCheck = "OverlapCheck",
  HideInTalk = "HideInTalk"
}
Const.EnableDynamicAIController = true
Const.FlyAIControllerPath = "/Game/BluePrints/AI/BP_EMMonFlyAIController.BP_EMMonFlyAIController_C"
Const.DefaultAIControllerPath = "/Game/BluePrints/AI/BP_EMAIController.BP_EMAIController_C"
Const.EnableBornOverlapCheck = true
Const.MonsterPushFactor = 1.5
Const.MonsterMinPushVelocity = 200
Const.MonsterOverlapPushVelocity = 1000
Const.Patrol = 3
Const.Command = 4
Const.MaxLoadingPercentage = 100
Const.LoadingTipsInterval = 15
Const.MaxRecoverValue = 100
Const.BossTNToZeroRecoverTickInterival = 0.1
Const.MonsterTNRecoverTickInterival = 1
Const.BossTNRecoverTickFrequency = 30
Const.DefaultHUDScale = 100
Const.MinHUDScale = 50
Const.MaxHUDScale = 150
Const.ROLE_None = 0
Const.ROLE_SimulatedProxy = 1
Const.ROLE_AutonomousProxy = 2
Const.ROLE_Authority = 3
Const.ROLE_MAX = 4
Const.SkillFeatureHideTag = "SkillFeature"
Const.ImmersionModelHideTag = "ImmersionModel"
Const.MiniGameHideTag = "MiniGame"
Const.TalkHideTag = "Talk"
Const.ShowUIOnlyTag = "DoShowUIOnly"
Const.BattleResurgenceHidTag = "BattleResurgence"
Const.BlackScreenHideTag = "BlackScreen"
Const.DungeonSettlementHideTag = "DungeonSettlement"
Const.GuideMainHideTag = "GuideMain"
Const.BossBattleOpenHideTag = "BossBattleOpen"
Const.LevelSequenceStateRecorderTag = "LevelSequenceStateRecorder"
Const.Common = 0
Const.Hijack = 1
Const.RougeLike = 2
Const.GatherMaxTime = 5
Const.MinTimeDilation = 0.001
Const.Skill = "Skill"
Const.Melee = "Melee"
Const.Ranged = "Ranged"
Const.SequenceNpcMeshBoundScale = 5
Const.BreakableJsonPath = "Script/Datas/Houdini_data/Prologue/PrologueBreakableFile/"
Const.ScalabilityUpdateTime = 0
Const.ScalabilityLevelVeryLow = 0
Const.ScalabilityLevelLow = 1
Const.ScalabilityLevelMiddle = 2
Const.ScalabilityLevelHigh = 3
Const.ScalabilityLevelVeryHigh = 4
Const.BanSmallLevelScalabilityLevel = {}
Const.CutTNLevelThreshold = 10
Const.CutTNLevelModifer = 1.0
Const.AccessEnterDefeated = 0
Const.CantEnterDefeated = 1
Const.DefeatedStopNotify = 2
Const.DefeatedEndToIdle = 3
Const.ClearCombo_Timelimit = 0
Const.ClearCombo_Dead = 1
Const.ClearCombo_SkillEffect = 2
Const.ClearCombo_DisableUltraWeapon = 3
Const.ClearCombo_ChangeWeapon = 4
Const.MaxPhantomNum = 2
Const.MaxPhantomNum2Player = 1
Const.MaxPhantomNumOver2Player = 0
Const.SavePickupType = {
  GetWeapon = 1,
  GetMod = 1,
  GetResource = 1
}
Const.Popup_GetProduceItem = 100017
Const.Popup_StartProduce = 100014
Const.Popup_CancelProduce = 100154
Const.Popup_BatchStartProduce = 100153
Const.Popup_AccerateProduce = 100018
Const.Popup_ConfirmLockedMod = 100098
Const.Popup_ConfirmUpgradedMod = 100099
Const.StunTag = "Stun"
Const.DS_Default_GroupId = 102
Const.DSVersion = 0
Const.NetWorkFailure_Tag = "NetWorkFailure"
Const.NET_CLIENT_SEND_HEARTBEAT_TIME = 60
Const.NET_CLIENT_HEARTBEAT_WARNING = 5
Const.NET_CLIENT_HEARTBEAT_TIMEOUT = 13
Const.DefaultResetPressSkillId = 0
Const.UseOriginSkillId = -1
Const.Popup_SecondConfirm = 100027
Const.Popup_CombatData = 100052
Const.RoleBarLength = 202.5
Const.BattleCharTagVXScaleTable = {
  Loli = {
    0.8,
    0.8,
    0.8
  },
  Girl = {
    1,
    1,
    1
  },
  Man = {
    1.2,
    1.2,
    1.2
  },
  Woman = {
    1.1,
    1.1,
    1.1
  },
  Boy = {
    1,
    1,
    1
  }
}
Const.Popup_ModUpgrade = 100045
Const.Popup_ModPolarity = 100050
Const.Popup_ModAutoPutOn = 100066
Const.BarriyBuffId = 50
Const.CrackKeyBuffId = 51
Const.SkillFeatureCD = 30
Const.bEnableSkillFeatureCD = true
Const.bHideSkillCD = 1
Const.DungeonBgBluePrint = "/Game/UI/UI_PC/LevelSelect/LevelSelect_Bg/LevelSelect_Bg_Training.LevelSelect_Bg_Training"
Const.BloodBarAnimTime = 0.3
Const.BloodBarDelayTime = 0.1
Const.SignalStrength = {
  30,
  90,
  150
}
Const.PlayerSignatureIllegal = 26005
Const.PlayerNicknameIllegal = 26006
Const.BattleTip_CommonTop_CD = 0.5
Const.BehaviorId = {
  Stroll = 0,
  LoopMontage = 1,
  MontageList = 2,
  Patrol = 3,
  Command = 4
}
Const.TestGMRegionType = {
  NoneTest = 0,
  OnlyServer = 1,
  CompareServer = 2
}
Const.RegionDataTypeDebugText = {
  "\233\157\158\229\173\152\229\130\168\230\149\176\230\141\174",
  "\229\133\179\229\141\161\230\149\176\230\141\174, \230\176\184\228\184\141\229\141\184\232\189\189",
  "\228\187\187\229\138\161\230\149\176\230\141\174",
  "\230\142\162\231\180\162\231\187\132\230\149\176\230\141\174",
  "Boss\230\149\176\230\141\174",
  "\229\133\179\229\141\161\230\149\176\230\141\174, \230\175\143\228\184\128\229\164\169\230\184\133\233\153\164",
  "\229\133\179\229\141\161\230\149\176\230\141\174, \230\175\143\228\184\137\229\164\169\230\184\133\233\153\164",
  "\229\133\179\229\141\161\230\149\176\230\141\174, \230\175\143\228\184\128\229\145\168\230\184\133\233\153\164",
  "\232\183\168\228\187\187\229\138\161\230\149\176\230\141\174"
}
Const.RegionDataStorageType = {
  ERegionDataType.RDT_CommonData,
  ERegionDataType.RDT_RarelyData,
  ERegionDataType.RDT_CommonDailyData,
  ERegionDataType.RDT_CommonTriduumData,
  ERegionDataType.RDT_CommonWeeklyData,
  ERegionDataType.RDT_CommonQuestData
}
Const.RougeSliceInfoType = {
  None = 0,
  RecoverCount = 1,
  TreasureMonCount = 2,
  BlueprintValue = 3
}
Const.DUNGEON_MATCH_BAR_STATE = {
  SPONSOR_WAITING_CONFIRM = 1,
  TEAMMATE_CONFIRMING = 2,
  TEAMMATE_WAITING_CONFIRMING = 3,
  WAITING_MATCHING = 4,
  WAITING_MATCHING_WITH_CANCEL = 5,
  WAITING_ENTER_DUNGEON = 6
}
Const.CampType = {
  Monster = ECampName.Monster,
  Player = ECampName.Player,
  DefenceCore = ECampName.DefenceCore,
  NPC = ECampName.NPC,
  Neutral = ECampName.Neutral,
  Hostile = ECampName.Hostile
}
Const.EnableCreateUnitLog = false
Const.IsOpenNpcInitOpt = true
Const.EnableFXOptimization = true
Const.ToughnessTimeDilation = 0.33
Const.ToughnessShowBloodTip = 0.4
Const.ToughnessClose = 0.76
Const.PlayerHandAimSpeedRate = 0.9
Const.InVaildModUnlockLevel = 99
Const.PlaySoundAsync = true
Const.EveryAttackLimitSeNum = 3
Const.RomanNum = {
  "\226\133\160",
  "\226\133\161",
  "\226\133\162",
  "\226\133\163",
  "\226\133\164",
  "\226\133\165",
  "\226\133\166",
  "\226\133\167",
  "\226\133\168",
  "\226\133\169",
  "\226\133\170",
  "\226\133\171"
}
Const.IndexNum = {
  "\226\145\160",
  "\226\145\161",
  "\226\145\162",
  "\226\145\163",
  "\226\145\164",
  "\226\145\165",
  "\226\145\166",
  "\226\145\167",
  "\226\145\168",
  "\226\145\169"
}
Const.bShowDamageDetails = false
Const.bEditorOpenFXBudget = true
Const.DialogueSnapShot = {
  HEART = 1,
  MEMORY = 2,
  MYSTERIOUS = 3,
  MONSTER = 4,
  TELEPHONE = 5,
  OUTDOOR = 6,
  ELECTRIC = 7,
  BROADCAST = 8,
  ECHO = 9
}
Const.DungeonFrameLoadBreakableItemMaxNum = 2
Const.MaxDungeonMonNum = 60
Const.bOverrideHLODDistance = false
Const.HLODDistanceDefault = {
  [0] = 12000,
  [1] = 13000,
  [2] = 15000,
  [3] = 16000,
  [4] = 18000
}
Const.HLODDistanceAndroid = {
  [0] = 3000,
  [1] = 3000,
  [2] = 3000,
  [3] = 4000,
  [4] = 4000
}
Const.PCRealStreamingDistanceRatio = {
  [0] = 1,
  [1] = 1.1,
  [2] = 1.2,
  [3] = 1.3,
  [4] = 1.5
}
Const.AndroidRealStreamingDistanceRatio = {
  [0] = 0.9,
  [1] = 0.95,
  [2] = 1,
  [3] = 1.2,
  [4] = 1.3
}
Const.IOSRealStreamingDistanceRatio = {
  [0] = 0.9,
  [1] = 0.95,
  [2] = 1,
  [3] = 1.2,
  [4] = 1.3
}
Const.IOSSerializeDistanceRatio = {
  [0] = 0.8,
  [1] = 0.9,
  [2] = 1.0,
  [3] = 1.0,
  [4] = 1.0
}
Const.CanUnloadNavMeshLevel = true
Const.SimulateMovementDebugPlatform = ""
Const.CheckDungeonMonId = false
Const.PreFrameRealInitNum = 1
Const.MonDeathTaskNumPreFrame = 1
Const.bEnableMonDeathOptimization = true
Const.bCloseWeaponMovementSync = true
Const.bCloseBodyAccessoryItemMovementSync = true
Const.bSpawnAIUnitAddToEventQueue = true
Const.bWeaponAndAccessoryItemHcc = true
Const.bMonsterInitByPropertySync = true
Const.OpenLookAtProtect = true
Const.StandAloneMonsterCanCache = true
Const.OnlineMonsterCanCache = true
Const.DungeonPreloadMonster = true
Const.MonsterNeedCache = true
Const.MonsterCanSpawnFromCache = true
Const.SummonDeadCache_Windows = false
Const.SummonDeadCache_Android = false
Const.SummonDeadCache_IOS = false
Const.PlayerPreloadSummon_Windows = false
Const.PlayerPreloadSummon_Android = false
Const.PlayerPreloadSummon_IOS = false
Const.NPCDeadCache_Win = true
Const.NPCDeadCache_IOS = false
Const.NPCDeadCache_Andriod = true
Const.LowMemoryDeviceNPCOptimize = true
Const.OnlineNPCCreateOptimize = true
Const.NeedStoreSTLBGM = true
Const.FootstepFXSlowSpeed = 230
Const.GamepadSpecialLeft = "Gamepad_Special_Left"
Const.GamepadSpecialRight = "Gamepad_Special_Right"
Const.GamepadDPadLeft = "Gamepad_DPad_Left"
Const.GamepadDPadRight = "Gamepad_DPad_Right"
Const.GamepadDPadUp = "Gamepad_DPad_Up"
Const.GamepadDPadDown = "Gamepad_DPad_Down"
Const.GamepadFaceButtonLeft = "Gamepad_FaceButton_Left"
Const.GamepadFaceButtonRight = "Gamepad_FaceButton_Right"
Const.GamepadFaceButtonUp = "Gamepad_FaceButton_Top"
Const.GamepadFaceButtonDown = "Gamepad_FaceButton_Bottom"
Const.GamepadLeftShoulder = "Gamepad_LeftShoulder"
Const.GamepadLeftTrigger = "Gamepad_LeftTrigger"
Const.GamepadRightShoulder = "Gamepad_RightShoulder"
Const.GamepadRightTrigger = "Gamepad_RightTrigger"
Const.GamepadRightThumbstick = "Gamepad_RightThumbstick"
Const.GamepadLeftThumbstick = "Gamepad_LeftThumbstick"
Const.LeftStickUp = "Gamepad_LeftStick_Up"
Const.LeftStickDown = "Gamepad_LeftStick_Down"
Const.LeftStickRight = "Gamepad_LeftStick_Right"
Const.LeftStickLeft = "Gamepad_LeftStick_Left"
Const.RightStickUp = "Gamepad_RightStick_Up"
Const.RightStickDown = "Gamepad_RightStick_Down"
Const.RightStickRight = "Gamepad_RightStick_Right"
Const.RightStickLeft = "Gamepad_RightStick_Left"
Const.ShortKeyToGamePadKey = {
  Menu = Const.GamepadSpecialRight,
  View = Const.GamepadSpecialLeft,
  A = Const.GamepadFaceButtonDown,
  B = Const.GamepadFaceButtonRight,
  X = Const.GamepadFaceButtonLeft,
  Y = Const.GamepadFaceButtonUp,
  LB = Const.GamepadLeftShoulder,
  RB = Const.GamepadRightShoulder,
  LT = Const.GamepadLeftTrigger,
  RT = Const.GamepadRightTrigger,
  LS = Const.GamepadLeftThumbstick,
  RS = Const.GamepadRightThumbstick,
  Up = Const.GamepadDPadUp,
  Down = Const.GamepadDPadDown,
  Left = Const.GamepadDPadLeft,
  Right = Const.GamepadDPadRight
}
Const.ForceFeedbackScale = {
  1.0,
  0.6,
  0.2
}
Const.StandAloneNoWalnutTipsTime = 2
Const.WalnutNumberIconPath = {
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num0.T_Walnut_Num0",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num1.T_Walnut_Num1",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num2.T_Walnut_Num2",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num3.T_Walnut_Num3",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num4.T_Walnut_Num4",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num5.T_Walnut_Num5",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num6.T_Walnut_Num6",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num7.T_Walnut_Num7",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num8.T_Walnut_Num8",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num9.T_Walnut_Num9",
  "/Game/UI/Texture/Dynamic/Atlas/Walnut/T_Walnut_Num10.T_Walnut_Num10"
}
Const.DeputeType = {
  RegularDepute = 1,
  NightFlightManualDepute = 2,
  WalnutDepute = 3,
  DeputeWeekly = 4
}
Const.UnBorn = -1
Const.Borning = 0
Const.Bonred = 1
Const.ShouldDetory = 2
Const.IsOpenNewDepute = false
Const.BubbleTimePerLine = 2
Const.HeroUsdkSharePlatform = {
  All = 20000,
  QQ = 20001,
  QQZone = 20002,
  Wechat = 20003,
  WechatMoments = 20004,
  Weibo = 20005,
  DouyinContact = 20007,
  XHS = 20008,
  KS = 20009,
  BiliBili = 20010,
  TapTap = 20012,
  Twitter = 30001,
  Facebook = 30002,
  TwitterFriends = 30003,
  Tweets = 30004,
  Discord = 30011
}
Const.HeroUsdkShareType = {
  None = 0,
  Link = 1,
  Image = 2,
  Text = 3
}
Const.CustomNpcCreateOpt = true
Const.CustomNpcCanCache = true
Const.PickupNiagaraPaths = {
  "/Game/Asset/Effect/Niagara/Item/NS_Item_Base.NS_Item_Base",
  "/Game/Asset/Effect/Niagara/Item/NS_Item_Pick_Base.NS_Item_Pick_Base",
  "/Game/Asset/Effect/Niagara/Item/NS_Item_Base_Pro.NS_Item_Base_Pro",
  "/Game/Asset/Effect/Niagara/Item/NS_Item_Pick_Base_Pro.NS_Item_Pick_Base_Pro",
  "/Game/Asset/Effect/Niagara/Item/NS_Item_Base_Ultra.NS_Item_Base_Ultra",
  "/Game/Asset/Effect/Niagara/Item/NS_Item_Pick_Base_Ultra.NS_Item_Pick_Base_Ultra",
  "/Game/Asset/Effect/Niagara/Item/NS_Item_Base_Fly.NS_Item_Base_Fly"
}
Const.bForceOpenPay = false
Const.IsOpenNetMultiClientOnly = true
Const.ReddotCacheType = {
  UserCache = 1,
  CommonCache = 0,
  NoneCache = -1
}
Const.ShopCacheReason = {
  Temporary = 1,
  Persistent = 2,
  Read = 0
}
Const.bOpenAntiCheat = true
Const.AntiCheatInterval = 60
Const.IsShowRayCreature = false
Const.IsOpenBulletCreature = true
Const.IsOpenSkillCreature = true
Const.IsOpenCreatureECS = true
Const.UnlockRegionTeleport = false
Const.DefaultAttributeMaster = {
  [0] = 160101,
  [1] = 1601
}
Const.SkipShadowBudgetConfig = {3102}
Const.OpenVerifyArray = true
return Const
