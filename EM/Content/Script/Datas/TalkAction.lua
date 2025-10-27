local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("TalkAction", {
  Afraid_End = {
    ActionMontage = "Emo_Afraid",
    AnimationId = "Afraid_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Afraid_Loop = {
    ActionMontage = "Emo_Afraid",
    AnimationId = "Afraid_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Afraid_Start = {
    ActionMontage = "Emo_Afraid",
    AnimationId = "Afraid_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Agree = {
    ActionMontage = "Emo_Agree",
    AnimationId = "Agree",
    BlendInTime = 0.4,
    BlendOutTime = 0.4,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  AgreeHead = {
    ActionMontage = "Emo_AgreeHead",
    AnimationId = "AgreeHead",
    BlendInTime = 0.4,
    BlendOutTime = 0.4,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Aim_Loop = {
    ActionMontage = "Aim_Idle",
    AnimationId = "Aim_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Alright_End = {
    ActionMontage = "Emo_Alright",
    AnimationId = "Alright_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = true
  },
  Alright_Loop = {
    ActionMontage = "Emo_Alright",
    AnimationId = "Alright_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = true
  },
  Alright_Start = {
    ActionMontage = "Emo_Alright",
    AnimationId = "Alright_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = true
  },
  Angry01_End = {
    ActionMontage = "Emo_Angry01",
    AnimationId = "Angry01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Angry01_Loop = {
    ActionMontage = "Emo_Angry01",
    AnimationId = "Angry01_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Angry01_Start = {
    ActionMontage = "Emo_Angry01",
    AnimationId = "Angry01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Angry02_End = {
    ActionMontage = "Emo_Angry02",
    AnimationId = "Angry02_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Angry02_Start = {
    ActionMontage = "Emo_Angry02",
    AnimationId = "Angry02_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Aote_Story_Drink = {
    ActionMontage = "Story_Drink",
    AnimationId = "Aote_Story_Drink",
    BlendInTime = 0,
    BlendOutTime = 0,
    EndLoopMontage = "Emo_Sit_Idle",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Aote_Story_Hug02_Loop = {
    ActionMontage = "Story_Hug02",
    AnimationId = "Aote_Story_Hug02_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Aote_Story_Hug_End = {
    ActionMontage = "Story_Hug",
    AnimationId = "Aote_Story_Hug_End",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Aote_Story_Hug_Loop = {
    ActionMontage = "Story_Hug",
    AnimationId = "Aote_Story_Hug_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Aote_Story_Hug_Start = {
    ActionMontage = "Story_Hug",
    AnimationId = "Aote_Story_Hug_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Avoid = {
    ActionMontage = "Emo_Avoid",
    AnimationId = "Avoid",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Awa_Idle = {
    ActionMontage = "Emo_Idle",
    AnimationId = "Awa_Idle",
    BlendInTime = 0.8,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Awa_Story_Operate01_End = {
    ActionMontage = "Story_Operate01",
    AnimationId = "Awa_Story_Operate01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Awa_Story_Operate01_Loop = {
    ActionMontage = "Story_Operate01",
    AnimationId = "Awa_Story_Operate01_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Awa_Story_Operate01_Start = {
    ActionMontage = "Story_Operate01",
    AnimationId = "Awa_Story_Operate01_Start",
    BlendInTime = 2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Awa_Story_Operate_End = {
    ActionMontage = "Story_Operate",
    AnimationId = "Awa_Story_Operate_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Awa_Story_Operate_Loop = {
    ActionMontage = "Story_Operate",
    AnimationId = "Awa_Story_Operate_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Awa_Story_Operate_Start = {
    ActionMontage = "Story_Operate",
    AnimationId = "Awa_Story_Operate_Start",
    BlendInTime = 2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  BaiTX_Story_Cry_Start = {
    ActionMontage = "Story_Cry",
    AnimationId = "BaiTX_Story_Cry_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  BaiTX_Story_Pride_End_End = {
    ActionMontage = "Story_Pride",
    AnimationId = "BaiTX_Story_Pride_End_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  BaiTX_Story_Pride_Loop_Loop = {
    ActionMontage = "Story_Pride",
    AnimationId = "BaiTX_Story_Pride_Loop_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  BaiTX_Story_Pride_Start_Start = {
    ActionMontage = "Story_Pride",
    AnimationId = "BaiTX_Story_Pride_Start_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  BaiTX_Story_RubForehead_End = {
    ActionMontage = "Story_RubForehead",
    AnimationId = "BaiTX_Story_RubForehead_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  BaiTX_Story_RubForehead_Loop = {
    ActionMontage = "Story_RubForehead",
    AnimationId = "BaiTX_Story_RubForehead_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  BaiTX_Story_RubForehead_Start = {
    ActionMontage = "Story_RubForehead",
    AnimationId = "BaiTX_Story_RubForehead_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  BaiTX_Story_Shout_End = {
    ActionMontage = "Story_Shout",
    AnimationId = "BaiTX_Story_Shout_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  BaiTX_Story_Shout_Loop = {
    ActionMontage = "Story_Shout",
    AnimationId = "BaiTX_Story_Shout_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  BaiTX_Story_Shout_Start = {
    ActionMontage = "Story_Shout",
    AnimationId = "BaiTX_Story_Shout_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  BaiTX_Story_Sleep_End = {
    ActionMontage = "Story_Sleep",
    AnimationId = "BaiTX_Story_Sleep_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  BaiTX_Story_Sleep_Loop = {
    ActionMontage = "Story_Sleep",
    AnimationId = "BaiTX_Story_Sleep_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  BaiTX_Story_Sleep_Start = {
    ActionMontage = "Story_Sleep",
    AnimationId = "BaiTX_Story_Sleep_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  BaiTX_Story_Tired_End = {
    ActionMontage = "Story_Tired",
    AnimationId = "BaiTX_Story_Tired_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  BaiTX_Story_Tired_Loop = {
    ActionMontage = "Story_Tired",
    AnimationId = "BaiTX_Story_Tired_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  BaiTX_Story_Tired_Start = {
    ActionMontage = "Story_Tired",
    AnimationId = "BaiTX_Story_Tired_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Bai_Bin_Idle = {
    ActionMontage = "Emo_Idle",
    AnimationId = "Bai_Bin_Idle",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Special_Start",
    bUseIK = false
  },
  Bai_Circle_End = {
    ActionMontage = "Emo_Circle",
    AnimationId = "Bai_Circle_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Bai_Circle_Loop = {
    ActionMontage = "Emo_Circle",
    AnimationId = "Bai_Circle_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Bai_Circle_Start = {
    ActionMontage = "Emo_Circle",
    AnimationId = "Bai_Circle_Start",
    BlendInTime = 0.4,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Bai_Idle = {
    ActionMontage = "Emo_Idle",
    AnimationId = "Bai_Idle",
    BlendInTime = 0.8,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Bai_Shock2Think2Confident = {
    ActionMontage = "Emo_ShockTo",
    AnimationId = "Bai_Shock2Think2Confident",
    BlendInTime = 0.2,
    BlendOutTime = 1,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Bai_SlowIdle = {
    ActionMontage = "Emo_Idle",
    AnimationId = "Bai_SlowIdle",
    BlendInTime = 1.5,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Bai_SpecialConfident_Start = {
    ActionMontage = "Emo_SpecialConfident",
    AnimationId = "Bai_SpecialConfident_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Bai_Talk03Quick = {
    ActionMontage = "Emo_Talk03",
    AnimationId = "Bai_Talk03Quick",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "StartQuick",
    bUseIK = false
  },
  Bai_Think2Confident = {
    ActionMontage = "Emo_ThinkTo",
    AnimationId = "Bai_Think2Confident",
    BlendInTime = 0.2,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Baiheng_Story_Special01_End = {
    ActionMontage = "Story_Special01",
    AnimationId = "Baiheng_Story_Special01_End",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Baiheng_Story_Special01_Loop = {
    ActionMontage = "Story_Special01",
    AnimationId = "Baiheng_Story_Special01_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Baiheng_Story_Special01_Start = {
    ActionMontage = "Story_Special01",
    AnimationId = "Baiheng_Story_Special01_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Baiheng_Story_Special02_End = {
    ActionMontage = "Story_Special02",
    AnimationId = "Baiheng_Story_Special02_End",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Baiheng_Story_Special02_Loop = {
    ActionMontage = "Story_Special02",
    AnimationId = "Baiheng_Story_Special02_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Baiheng_Story_Special02_Start = {
    ActionMontage = "Story_Special02",
    AnimationId = "Baiheng_Story_Special02_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Baiheng_Story_Special03_End = {
    ActionMontage = "Story_Special03",
    AnimationId = "Baiheng_Story_Special03_End",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Baiheng_Story_Special03_Loop = {
    ActionMontage = "Story_Special03",
    AnimationId = "Baiheng_Story_Special03_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Baiheng_Story_Special03_Start = {
    ActionMontage = "Story_Special03",
    AnimationId = "Baiheng_Story_Special03_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Baiheng_Story_Wakeup_Start = {
    ActionMontage = "Story_Wakeup",
    AnimationId = "Baiheng_Story_Wakeup_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Beg_Loop = {
    ActionMontage = "Emo_Beg",
    AnimationId = "Beg_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Beibao_Dyn_Find1 = {
    ActionMontage = "Find1",
    AnimationId = "Beibao_Dyn_Find1",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = true,
    MontageSection = "Default",
    bUseIK = true
  },
  Beibao_Dyn_Find2 = {
    ActionMontage = "Find2",
    AnimationId = "Beibao_Dyn_Find2",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = true,
    MontageSection = "Default",
    bUseIK = true
  },
  Beibao_Dyn_Find3 = {
    ActionMontage = "Find3",
    AnimationId = "Beibao_Dyn_Find3",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = true,
    MontageSection = "Default",
    bUseIK = true
  },
  Beibao_Finish = {
    ActionMontage = "Performance",
    AnimationId = "Beibao_Finish",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Finish",
    bUseIK = false
  },
  Beibao_Start = {
    ActionMontage = "Performance",
    AnimationId = "Beibao_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Performance",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  BossSaiqi_Story_Die = {
    ActionMontage = "Story_Die",
    AnimationId = "BossSaiqi_Story_Die",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  BossSaiqi_Story_HurtCrouch = {
    ActionMontage = "Story_HurtCrouch",
    AnimationId = "BossSaiqi_Story_HurtCrouch",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Buluchild_Story_Find = {
    ActionMontage = "Story_Find",
    AnimationId = "Buluchild_Story_Find",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  BulusiY_Story_Find02_Start = {
    ActionMontage = "Story_Find02",
    AnimationId = "BulusiY_Story_Find02_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Call_End = {
    ActionMontage = "Emo_Call",
    AnimationId = "Call_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Call_Loop = {
    ActionMontage = "Emo_Call",
    AnimationId = "Call_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Call_Start = {
    ActionMontage = "Emo_Call",
    AnimationId = "Call_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Cat_Interactive01 = {
    ActionMontage = "Emo_Cat_Interactive01",
    AnimationId = "Cat_Interactive01",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  ChenSi_End = {
    ActionMontage = "Chensi",
    AnimationId = "ChenSi_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ChenSi_Start = {
    ActionMontage = "Chensi",
    AnimationId = "ChenSi_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentLRToExplainL_End = {
    ActionMontage = "Emo_ConfidentLRToExplainL",
    AnimationId = "ConfidentLRToExplainL_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentLR",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentLRToExplainL_Loop = {
    ActionMontage = "Emo_ConfidentLRToExplainL",
    AnimationId = "ConfidentLRToExplainL_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentLRToExplainL_Start = {
    ActionMontage = "Emo_ConfidentLRToExplainL",
    AnimationId = "ConfidentLRToExplainL_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentLRToExplainR_End = {
    ActionMontage = "Emo_ConfidentLRToExplainR",
    AnimationId = "ConfidentLRToExplainR_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentLR",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentLRToExplainR_Loop = {
    ActionMontage = "Emo_ConfidentLRToExplainR",
    AnimationId = "ConfidentLRToExplainR_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentLRToExplainR_Start = {
    ActionMontage = "Emo_ConfidentLRToExplainR",
    AnimationId = "ConfidentLRToExplainR_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentLRToSighL_End = {
    ActionMontage = "Emo_ConfidentLRToSighL",
    AnimationId = "ConfidentLRToSighL_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentLR",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentLRToSighL_Loop = {
    ActionMontage = "Emo_ConfidentLRToSighL",
    AnimationId = "ConfidentLRToSighL_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentLRToSighL_Start = {
    ActionMontage = "Emo_ConfidentLRToSighL",
    AnimationId = "ConfidentLRToSighL_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentLRToSighR_End = {
    ActionMontage = "Emo_ConfidentLRToSighR",
    AnimationId = "ConfidentLRToSighR_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentLR",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentLRToSighR_Loop = {
    ActionMontage = "Emo_ConfidentLRToSighR",
    AnimationId = "ConfidentLRToSighR_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentLRToSighR_Start = {
    ActionMontage = "Emo_ConfidentLRToSighR",
    AnimationId = "ConfidentLRToSighR_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentLRToTalk01_End = {
    ActionMontage = "Emo_ConfidentLRToTalk01",
    AnimationId = "ConfidentLRToTalk01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentLR",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentLRToTalk01_Loop = {
    ActionMontage = "Emo_ConfidentLRToTalk01",
    AnimationId = "ConfidentLRToTalk01_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentLRToTalk01_Start = {
    ActionMontage = "Emo_ConfidentLRToTalk01",
    AnimationId = "ConfidentLRToTalk01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentLRToTalkL_End = {
    ActionMontage = "Emo_ConfidentLRToTalkL",
    AnimationId = "ConfidentLRToTalkL_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentLR",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentLRToTalkL_Loop = {
    ActionMontage = "Emo_ConfidentLRToTalkL",
    AnimationId = "ConfidentLRToTalkL_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentLRToTalkL_Start = {
    ActionMontage = "Emo_ConfidentLRToTalkL",
    AnimationId = "ConfidentLRToTalkL_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentLRToTalkR_End = {
    ActionMontage = "Emo_ConfidentLRToTalkR",
    AnimationId = "ConfidentLRToTalkR_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentLR",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentLRToTalkR_Loop = {
    ActionMontage = "Emo_ConfidentLRToTalkR",
    AnimationId = "ConfidentLRToTalkR_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentLRToTalkR_Start = {
    ActionMontage = "Emo_ConfidentLRToTalkR",
    AnimationId = "ConfidentLRToTalkR_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentLR_End = {
    ActionMontage = "Emo_ConfidentLR",
    AnimationId = "ConfidentLR_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentLR_Loop = {
    ActionMontage = "Emo_ConfidentLR",
    AnimationId = "ConfidentLR_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentLR_Start = {
    ActionMontage = "Emo_ConfidentLR",
    AnimationId = "ConfidentLR_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentLToExplain_End = {
    ActionMontage = "Emo_ConfidentLToExplain_",
    AnimationId = "ConfidentLToExplain_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentL",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentLToExplain_Loop = {
    ActionMontage = "Emo_ConfidentLToExplain_",
    AnimationId = "ConfidentLToExplain_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentLToExplain_Start = {
    ActionMontage = "Emo_ConfidentLToExplain_",
    AnimationId = "ConfidentLToExplain_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentLToSigh_End = {
    ActionMontage = "Emo_ConfidentLToSigh",
    AnimationId = "ConfidentLToSigh_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentL",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentLToSigh_Loop = {
    ActionMontage = "Emo_ConfidentLToSigh",
    AnimationId = "ConfidentLToSigh_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentLToSigh_Start = {
    ActionMontage = "Emo_ConfidentLToSigh",
    AnimationId = "ConfidentLToSigh_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentLToTalk01_End = {
    ActionMontage = "Emo_ConfidentLToTalk01",
    AnimationId = "ConfidentLToTalk01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentL",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentLToTalk01_Loop = {
    ActionMontage = "Emo_ConfidentLToTalk01",
    AnimationId = "ConfidentLToTalk01_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentLToTalk01_Start = {
    ActionMontage = "Emo_ConfidentLToTalk01",
    AnimationId = "ConfidentLToTalk01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentLToTalk_End = {
    ActionMontage = "Emo_ConfidentLToTalk",
    AnimationId = "ConfidentLToTalk_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentL",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentLToTalk_Loop = {
    ActionMontage = "Emo_ConfidentLToTalk",
    AnimationId = "ConfidentLToTalk_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentLToTalk_Start = {
    ActionMontage = "Emo_ConfidentLToTalk",
    AnimationId = "ConfidentLToTalk_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentRToExplain_End = {
    ActionMontage = "Emo_ConfidentRToExplain",
    AnimationId = "ConfidentRToExplain_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentR",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentRToExplain_Loop = {
    ActionMontage = "Emo_ConfidentRToExplain",
    AnimationId = "ConfidentRToExplain_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentRToExplain_Start = {
    ActionMontage = "Emo_ConfidentRToExplain",
    AnimationId = "ConfidentRToExplain_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentRToSigh_End = {
    ActionMontage = "Emo_ConfidentRToSigh",
    AnimationId = "ConfidentRToSigh_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentR",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentRToSigh_Loop = {
    ActionMontage = "Emo_ConfidentRToSigh",
    AnimationId = "ConfidentRToSigh_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentRToSigh_Start = {
    ActionMontage = "Emo_ConfidentRToSigh",
    AnimationId = "ConfidentRToSigh_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentRToTalk01_End = {
    ActionMontage = "Emo_ConfidentRToTalk01",
    AnimationId = "ConfidentRToTalk01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentR",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentRToTalk01_Loop = {
    ActionMontage = "Emo_ConfidentRToTalk01",
    AnimationId = "ConfidentRToTalk01_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentRToTalk01_Start = {
    ActionMontage = "Emo_ConfidentRToTalk01",
    AnimationId = "ConfidentRToTalk01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentRToTalk_End = {
    ActionMontage = "Emo_ConfidentRToTalk",
    AnimationId = "ConfidentRToTalk_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_ConfidentR",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentRToTalk_Loop = {
    ActionMontage = "Emo_ConfidentRToTalk",
    AnimationId = "ConfidentRToTalk_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentRToTalk_Start = {
    ActionMontage = "Emo_ConfidentRToTalk",
    AnimationId = "ConfidentRToTalk_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ConfidentR_End = {
    ActionMontage = "Emo_ConfidentR",
    AnimationId = "ConfidentR_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ConfidentR_Loop = {
    ActionMontage = "Emo_ConfidentR",
    AnimationId = "ConfidentR_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ConfidentR_Start = {
    ActionMontage = "Emo_ConfidentR",
    AnimationId = "ConfidentR_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Confident_End = {
    ActionMontage = "Emo_Confident",
    AnimationId = "Confident_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Confident_Loop = {
    ActionMontage = "Emo_Confident",
    AnimationId = "Confident_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Confident_Start = {
    ActionMontage = "Emo_Confident",
    AnimationId = "Confident_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Crouch = {
    ActionMontage = "Story_Crouch",
    AnimationId = "Crouch",
    BlendInTime = 0.3,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Crouch_End = {
    ActionMontage = "Story_Crouch",
    AnimationId = "Crouch_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Crouch_Loop = {
    ActionMontage = "Story_Crouch",
    AnimationId = "Crouch_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Crouch_Start = {
    ActionMontage = "Story_Crouch",
    AnimationId = "Crouch_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Dafu_Emo_Bandge_End = {
    ActionMontage = "Emo_Bandge",
    AnimationId = "Dafu_Emo_Bandge_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = true
  },
  Dafu_Emo_Bandge_Loop = {
    ActionMontage = "Emo_Bandge",
    AnimationId = "Dafu_Emo_Bandge_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = true
  },
  Dafu_Emo_Bandge_Start = {
    ActionMontage = "Emo_Bandge",
    AnimationId = "Dafu_Emo_Bandge_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = true
  },
  Dafu_Story_BeHugged_End = {
    ActionMontage = "Story_BeHugged",
    AnimationId = "Dafu_Story_BeHugged_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Dafu_Story_BeHugged_Loop = {
    ActionMontage = "Story_BeHugged",
    AnimationId = "Dafu_Story_BeHugged_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Dafu_Story_BeHugged_Start = {
    ActionMontage = "Story_BeHugged",
    AnimationId = "Dafu_Story_BeHugged_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Dafu_Story_Cure_End = {
    ActionMontage = "Story_Cure",
    AnimationId = "Dafu_Story_Cure_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Dafu_Story_Cure_Loop = {
    ActionMontage = "Story_Cure",
    AnimationId = "Dafu_Story_Cure_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Dafu_Story_Cure_Start = {
    ActionMontage = "Story_Cure",
    AnimationId = "Dafu_Story_Cure_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Dead = {
    ActionMontage = "Emo_Dead",
    AnimationId = "Dead",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Deny01 = {
    ActionMontage = "Emo_Deny01",
    AnimationId = "Deny01",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Deny01_End = {
    ActionMontage = "Emo_Deny01",
    AnimationId = "Deny01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Deny01_Loop = {
    ActionMontage = "Emo_Deny01",
    AnimationId = "Deny01_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Deny01_Start = {
    ActionMontage = "Emo_Deny01",
    AnimationId = "Deny01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Die = {
    ActionMontage = "Emo_Die",
    AnimationId = "Die",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Disagree = {
    ActionMontage = "Emo_Disagree",
    AnimationId = "Disagree",
    BlendInTime = 0.4,
    BlendOutTime = 0.4,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  DisagreeHead = {
    ActionMontage = "Emo_DisagreeHead",
    AnimationId = "DisagreeHead",
    BlendInTime = 0.4,
    BlendOutTime = 0.4,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Emo_Daydream_End = {
    ActionMontage = "Emo_Daydream",
    AnimationId = "Emo_Daydream_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Emo_Daydream_Loop = {
    ActionMontage = "Emo_Daydream",
    AnimationId = "Emo_Daydream_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Emo_Daydream_Start = {
    ActionMontage = "Emo_Daydream",
    AnimationId = "Emo_Daydream_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Excited01_End = {
    ActionMontage = "Emo_Excited01",
    AnimationId = "Excited01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Excited01_Loop = {
    ActionMontage = "Emo_Excited01",
    AnimationId = "Excited01_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Excited01_Start = {
    ActionMontage = "Emo_Excited01",
    AnimationId = "Excited01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Excited02_End = {
    ActionMontage = "Emo_Excited02",
    AnimationId = "Excited02_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Excited02_Loop = {
    ActionMontage = "Emo_Excited02",
    AnimationId = "Excited02_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Excited02_Start = {
    ActionMontage = "Emo_Excited02",
    AnimationId = "Excited02_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Excited03_End = {
    ActionMontage = "Emo_Excited03",
    AnimationId = "Excited03_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Excited03_Loop = {
    ActionMontage = "Emo_Excited03",
    AnimationId = "Excited03_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Excited03_Start = {
    ActionMontage = "Emo_Excited03",
    AnimationId = "Excited03_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Explain01L_End = {
    ActionMontage = "Emo_Explain01L",
    AnimationId = "Explain01L_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Explain01L_Start = {
    ActionMontage = "Emo_Explain01L",
    AnimationId = "Explain01L_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Explain01_End = {
    ActionMontage = "Emo_Explain01",
    AnimationId = "Explain01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Explain01_Start = {
    ActionMontage = "Emo_Explain01",
    AnimationId = "Explain01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Explain02_End = {
    ActionMontage = "Emo_Explain02",
    AnimationId = "Explain02_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Explain02_Loop = {
    ActionMontage = "Emo_Explain02",
    AnimationId = "Explain02_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Explain02_Start = {
    ActionMontage = "Emo_Explain02",
    AnimationId = "Explain02_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  ExplainTwo_End = {
    ActionMontage = "Emo_ExplainTwo",
    AnimationId = "ExplainTwo_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  ExplainTwo_Start = {
    ActionMontage = "Emo_ExplainTwo",
    AnimationId = "ExplainTwo_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Feina_Story_CuteHairAction_End = {
    ActionMontage = "Story_CuteHairAction",
    AnimationId = "Feina_Story_CuteHairAction_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Feina_Story_CuteHairAction_Loop = {
    ActionMontage = "Story_CuteHairAction",
    AnimationId = "Feina_Story_CuteHairAction_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Feina_Story_Lieidle = {
    ActionMontage = "Story_Lieidle",
    AnimationId = "Feina_Story_Lieidle",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Feina_Story_Look01_Start = {
    ActionMontage = "Story_Look01",
    AnimationId = "Feina_Story_Look01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Feina_Story_Squat_End = {
    ActionMontage = "Story_Squat",
    AnimationId = "Feina_Story_Squat_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Feina_Story_Squat_Loop = {
    ActionMontage = "Story_Squat",
    AnimationId = "Feina_Story_Squat_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Feina_Story_Squat_Start = {
    ActionMontage = "Story_Squat",
    AnimationId = "Feina_Story_Squat_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Feina_Story_TouchPet_End = {
    ActionMontage = "Story_TouchPet",
    AnimationId = "Feina_Story_TouchPet_End",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Feina_Story_TouchPet_Loop = {
    ActionMontage = "Story_TouchPet",
    AnimationId = "Feina_Story_TouchPet_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Feina_Story_TouchPet_Start = {
    ActionMontage = "Story_TouchPet",
    AnimationId = "Feina_Story_TouchPet_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Feina_Story_WipeSweat_Start = {
    ActionMontage = "Story_WipeSweat",
    AnimationId = "Feina_Story_WipeSweat_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Feina_Story_Wish_End = {
    ActionMontage = "Story_Wish",
    AnimationId = "Feina_Story_Wish_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Feina_Story_Wish_Loop = {
    ActionMontage = "Story_Wish",
    AnimationId = "Feina_Story_Wish_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Feina_Story_Wish_Start = {
    ActionMontage = "Story_Wish",
    AnimationId = "Feina_Story_Wish_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Fist02_End = {
    ActionMontage = "Emo_Fist02",
    AnimationId = "Fist02_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Fist02_Loop = {
    ActionMontage = "Emo_Fist02",
    AnimationId = "Fist02_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Fist02_Start = {
    ActionMontage = "Emo_Fist02",
    AnimationId = "Fist02_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  FuXiong_End = {
    ActionMontage = "FuXiong",
    AnimationId = "FuXiong_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  FuXiong_Start = {
    ActionMontage = "FuXiong",
    AnimationId = "FuXiong_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Give = {
    ActionMontage = "Emo_Give",
    AnimationId = "Give",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Gun_Loop = {
    ActionMontage = "Gun_Idle",
    AnimationId = "Gun_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Helpless01_End = {
    ActionMontage = "Emo_Helpless01",
    AnimationId = "Helpless01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Helpless01_Start = {
    ActionMontage = "Emo_Helpless01",
    AnimationId = "Helpless01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Huanhu_Nan_Start = {
    ActionMontage = "Emo_Huanhu_Nan",
    AnimationId = "Huanhu_Nan_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Huanhu_Nv_Start = {
    ActionMontage = "Emo_Huanhu_Nv",
    AnimationId = "Huanhu_Nv_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Hurt01 = {
    ActionMontage = "Emo_Hurt01",
    AnimationId = "Hurt01",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Idle_Listen01 = {
    ActionMontage = "Emo_Idle_Listen01",
    AnimationId = "Idle_Listen01",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsOnceAction = true,
    IsSpecialAnim = false,
    bUseIK = false
  },
  Idle_Speak01 = {
    ActionMontage = "Emo_Idle_Speak01",
    AnimationId = "Idle_Speak01",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsOnceAction = true,
    IsSpecialAnim = false,
    bUseIK = false
  },
  Interactive_End = {
    ActionMontage = "Interactive",
    AnimationId = "Interactive_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Interactive_Sit02_End = {
    ActionMontage = "Interactive_Sit02_Story",
    AnimationId = "Interactive_Sit02_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    IsSpecialAnim = false,
    MontagePrePath = "Interactive/MechInteractive",
    MontageSection = "End"
  },
  Interactive_Sit02_EndIdle = {
    ActionMontage = "Interactive_Sit02_Story",
    AnimationId = "Interactive_Sit02_EndIdle",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    IsSpecialAnim = false,
    MontagePrePath = "Interactive/MechInteractive",
    MontageSection = "End"
  },
  Interactive_Sit02_Loop = {
    ActionMontage = "Interactive_Sit02_Story",
    AnimationId = "Interactive_Sit02_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    IsSpecialAnim = false,
    MontagePrePath = "Interactive/MechInteractive",
    MontageSection = "Loop"
  },
  Interactive_Sit02_Start = {
    ActionMontage = "Interactive_Sit02_Story",
    AnimationId = "Interactive_Sit02_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    IsSpecialAnim = false,
    MontagePrePath = "Interactive/MechInteractive",
    MontageSection = "Start",
    bUseIK = false
  },
  Interactive_Sit03_Idle = {
    ActionMontage = "Interactive_Sit03",
    AnimationId = "Interactive_Sit03_Idle",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    IsSpecialAnim = false,
    MontagePrePath = "Interactive/MechInteractive",
    MontageSection = "Idle",
    bUseIK = false
  },
  Interactive_Start = {
    ActionMontage = "Interactive",
    AnimationId = "Interactive_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Interactived01 = {
    ActionMontage = "Interactived01",
    AnimationId = "Interactived01",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = true,
    MontageSection = "Start",
    bUseIK = false
  },
  Invite_Agree = {
    ActionMontage = "Emo_Agree",
    AnimationId = "Invite_Agree",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Invite_AgreeHead = {
    ActionMontage = "Emo_AgreeHead",
    AnimationId = "Invite_AgreeHead",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Invite_Angry01_End = {
    ActionMontage = "Emo_Angry01",
    AnimationId = "Invite_Angry01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Invite_Confident_End = {
    ActionMontage = "Emo_Confident",
    AnimationId = "Invite_Confident_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Invite_Disagree = {
    ActionMontage = "Emo_Disagree",
    AnimationId = "Invite_Disagree",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Invite_DisagreeHead = {
    ActionMontage = "Emo_DisagreeHead",
    AnimationId = "Invite_DisagreeHead",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Invite_Explain01_End = {
    ActionMontage = "Emo_Explain01",
    AnimationId = "Invite_Explain01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Invite_Explain02_End = {
    ActionMontage = "Emo_Explain02",
    AnimationId = "Invite_Explain02_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Invite_Give = {
    ActionMontage = "Emo_Give",
    AnimationId = "Invite_Give",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Invite_Shock_End = {
    ActionMontage = "Emo_Shock",
    AnimationId = "Invite_Shock_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Invite_Sigh_End = {
    ActionMontage = "Emo_Sigh",
    AnimationId = "Invite_Sigh_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Invite_Talk01_End = {
    ActionMontage = "Emo_Talk01",
    AnimationId = "Invite_Talk01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Invite_Talk02_End = {
    ActionMontage = "Emo_Talk02",
    AnimationId = "Invite_Talk02_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Invite_Talk03_End = {
    ActionMontage = "Emo_Talk03",
    AnimationId = "Invite_Talk03_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Invite_Think_End = {
    ActionMontage = "Emo_Think",
    AnimationId = "Invite_Think_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.05,
    EndLoopMontage = "Emo_Idle",
    EndLoopMontageSection = "Start",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  JT_Mid_F_Story_Operate_End = {
    ActionMontage = "Story_Operate",
    AnimationId = "JT_Mid_F_Story_Operate_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = true
  },
  JT_Mid_F_Story_Operate_Loop = {
    ActionMontage = "Story_Operate",
    AnimationId = "JT_Mid_F_Story_Operate_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = true
  },
  JT_Mid_F_Story_Operate_Start = {
    ActionMontage = "Story_Operate",
    AnimationId = "JT_Mid_F_Story_Operate_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = true
  },
  JiaYou_End = {
    ActionMontage = "JiaYou",
    AnimationId = "JiaYou_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  JiaYou_Start = {
    ActionMontage = "JiaYou",
    AnimationId = "JiaYou_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  LNM_Idle = {
    ActionMontage = "Emo_Idle",
    AnimationId = "LNM_Idle",
    BlendInTime = 0.8,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Laugh01_End = {
    ActionMontage = "Emo_Laugh01",
    AnimationId = "Laugh01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Laugh01_Loop = {
    ActionMontage = "Emo_Laugh01",
    AnimationId = "Laugh01_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Laugh01_Start = {
    ActionMontage = "Emo_Laugh01",
    AnimationId = "Laugh01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Lilikou_Story_Playlyre_End = {
    ActionMontage = "Story_Playlyre",
    AnimationId = "Lilikou_Story_Playlyre_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Lilikou_Story_Playlyre_Idle = {
    ActionMontage = "Story_Playlyre",
    AnimationId = "Lilikou_Story_Playlyre_Idle",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Idle"
  },
  Lilikou_Story_Playlyre_Loop = {
    ActionMontage = "Story_Playlyre",
    AnimationId = "Lilikou_Story_Playlyre_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Lilikou_Story_Playlyre_Start = {
    ActionMontage = "Story_Playlyre",
    AnimationId = "Lilikou_Story_Playlyre_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Linen_Inves_End = {
    ActionMontage = "Story_Inves",
    AnimationId = "Linen_Inves_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Linen_Inves_Start = {
    ActionMontage = "Story_Inves",
    AnimationId = "Linen_Inves_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Linen_Salut_End = {
    ActionMontage = "Story_Salut",
    AnimationId = "Linen_Salut_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Linen_Salut_Start = {
    ActionMontage = "Story_Salut",
    AnimationId = "Linen_Salut_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Linen_Shot = {
    ActionMontage = "Story_Shot",
    AnimationId = "Linen_Shot",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Linen_Shotpre_End = {
    ActionMontage = "Story_Shotpre",
    AnimationId = "Linen_Shotpre_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Linen_Shotpre_Start = {
    ActionMontage = "Story_Shotpre",
    AnimationId = "Linen_Shotpre_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Lise_Emo_Clean_End = {
    ActionMontage = "Emo_Clean",
    AnimationId = "Lise_Emo_Clean_End",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Lise_Emo_Clean_Loop = {
    ActionMontage = "Emo_Clean",
    AnimationId = "Lise_Emo_Clean_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Lise_Emo_Clean_Start = {
    ActionMontage = "Emo_Clean",
    AnimationId = "Lise_Emo_Clean_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Lise_Lieidle = {
    ActionMontage = "Story_Lieidle",
    AnimationId = "Lise_Lieidle",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Lise_Liewake_End = {
    ActionMontage = "Story_Liewake",
    AnimationId = "Lise_Liewake_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Story_Sitidle",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Lise_Liewake_Start = {
    ActionMontage = "Story_Liewake",
    AnimationId = "Lise_Liewake_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Lise_Sing_End = {
    ActionMontage = "Story_Sing",
    AnimationId = "Lise_Sing_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Lise_Sing_Loop = {
    ActionMontage = "Story_Sing",
    AnimationId = "Lise_Sing_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Lise_Sing_Start = {
    ActionMontage = "Story_Sing",
    AnimationId = "Lise_Sing_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Lise_Sitgive_End = {
    ActionMontage = "Story_Sitgive",
    AnimationId = "Lise_Sitgive_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Story_Sitidle",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Lise_Sitgive_Start = {
    ActionMontage = "Story_Sitgive",
    AnimationId = "Lise_Sitgive_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Lise_Sitidle_End = {
    ActionMontage = "Story_Sitidle",
    AnimationId = "Lise_Sitidle_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Lise_Sitidle_Start = {
    ActionMontage = "Story_Sitidle",
    AnimationId = "Lise_Sitidle_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Lise_Story_Aim_End = {
    ActionMontage = "Story_Aim",
    AnimationId = "Lise_Story_Aim_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Lise_Story_Aim_Loop = {
    ActionMontage = "Story_Aim",
    AnimationId = "Lise_Story_Aim_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Lise_Story_Aim_Start = {
    ActionMontage = "Story_Aim",
    AnimationId = "Lise_Story_Aim_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Lise_Story_Denny_End = {
    ActionMontage = "Story_Denny",
    AnimationId = "Lise_Story_Denny_End",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Lise_Story_Denny_Loop = {
    ActionMontage = "Story_Denny",
    AnimationId = "Lise_Story_Denny_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Lise_Story_Denny_Start = {
    ActionMontage = "Story_Denny",
    AnimationId = "Lise_Story_Denny_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Lise_Story_Hug = {
    ActionMontage = "Story_Hug",
    AnimationId = "Lise_Story_Hug",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Lise_Story_Hug02_Loop = {
    ActionMontage = "Story_Hug02",
    AnimationId = "Lise_Story_Hug02_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Lise_Story_Hug03_Loop = {
    ActionMontage = "Story_Hug03",
    AnimationId = "Lise_Story_Hug03_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Lise_Story_HurtCrouch = {
    ActionMontage = "Story_HurtCrouch",
    AnimationId = "Lise_Story_HurtCrouch",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Lise_Story_Protect_End = {
    ActionMontage = "Story_Protect",
    AnimationId = "Lise_Story_Protect_End",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Lise_Story_Protect_Loop = {
    ActionMontage = "Story_Protect",
    AnimationId = "Lise_Story_Protect_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Lise_Story_Protect_Start = {
    ActionMontage = "Story_Protect",
    AnimationId = "Lise_Story_Protect_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Lise_Touch_End = {
    ActionMontage = "Story_Touch",
    AnimationId = "Lise_Touch_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Lise_Touch_Start = {
    ActionMontage = "Story_Touch",
    AnimationId = "Lise_Touch_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Lise_hurt_Loop = {
    ActionMontage = "Emo_hurt",
    AnimationId = "Lise_hurt_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = true
  },
  Npc_Qingnian_M_Story_HideHand_End = {
    ActionMontage = "Story_HideHand",
    AnimationId = "Npc_Qingnian_M_Story_HideHand_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Npc_Qingnian_M_Story_HideHand_Loop = {
    ActionMontage = "Story_HideHand",
    AnimationId = "Npc_Qingnian_M_Story_HideHand_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    EndLoopMontageSection = "Story_+J101",
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Npc_Qingnian_M_Story_HideHand_Start = {
    ActionMontage = "Story_HideHand",
    AnimationId = "Npc_Qingnian_M_Story_HideHand_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Nvzhu_Story_Alert_Start = {
    ActionMontage = "Story_Alert",
    AnimationId = "Nvzhu_Story_Alert_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Nvzhu_Story_Angry02_End = {
    ActionMontage = "Story_Angry02",
    AnimationId = "Nvzhu_Story_Angry02_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Nvzhu_Story_Angry02_Loop = {
    ActionMontage = "Story_Angry02",
    AnimationId = "Nvzhu_Story_Angry02_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Nvzhu_Story_Angry02_Start = {
    ActionMontage = "Story_Angry02",
    AnimationId = "Nvzhu_Story_Angry02_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Nvzhu_Story_Awake_Start = {
    ActionMontage = "Story_Awake",
    AnimationId = "Nvzhu_Story_Awake_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Nvzhu_Story_CrouchWithFlower = {
    ActionMontage = "Story_CrouchWithFlower",
    AnimationId = "Nvzhu_Story_CrouchWithFlower",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Nvzhu_Story_LieDown = {
    ActionMontage = "LieDown_Loop",
    AnimationId = "Nvzhu_Story_LieDown",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Nvzhu_Story_StretchHand_End = {
    ActionMontage = "Story_StretchHand",
    AnimationId = "Nvzhu_Story_StretchHand_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Nvzhu_Story_StretchHand_Start = {
    ActionMontage = "Story_StretchHand",
    AnimationId = "Nvzhu_Story_StretchHand_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Nvzhu_Story_Tired_Start = {
    ActionMontage = "Story_Tired",
    AnimationId = "Nvzhu_Story_Tired_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Nvzhu_Story_WangXi_Start = {
    ActionMontage = "Story_WangXi",
    AnimationId = "Nvzhu_Story_WangXi_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  OldMan100155 = {
    ActionMontage = "Story_10015503",
    AnimationId = "OldMan100155",
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Onground01_End = {
    ActionMontage = "Emo_OnGround01",
    AnimationId = "Onground01_End",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = true
  },
  Onground01_Loop = {
    ActionMontage = "Emo_OnGround01",
    AnimationId = "Onground01_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = true
  },
  Onground02 = {
    ActionMontage = "Emo_OnGround02",
    AnimationId = "Onground02",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Onground03_Start = {
    ActionMontage = "Emo_OnGround03",
    AnimationId = "Onground03_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Please01_End = {
    ActionMontage = "Emo_Please01",
    AnimationId = "Please01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Please01_Loop = {
    ActionMontage = "Emo_Please01",
    AnimationId = "Please01_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Please01_Start = {
    ActionMontage = "Emo_Please01",
    AnimationId = "Please01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Pose = {
    ActionMontage = "IdleShow_01",
    AnimationId = "Pose",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = true,
    MontageSection = "Start",
    bUseIK = false
  },
  RaiseHand_End = {
    ActionMontage = "Emo_RaiseHand",
    AnimationId = "RaiseHand_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  RaiseHand_Start = {
    ActionMontage = "Emo_RaiseHand",
    AnimationId = "RaiseHand_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Sad02_End = {
    ActionMontage = "Emo_Sad02",
    AnimationId = "Sad02_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Sad02_Start = {
    ActionMontage = "Emo_Sad02",
    AnimationId = "Sad02_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Saiqi_Story_CrySit = {
    ActionMontage = "Story_CrySit",
    AnimationId = "Saiqi_Story_CrySit",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Saiqi_Story_HoldScythe = {
    ActionMontage = "Story_HoldScythe",
    AnimationId = "Saiqi_Story_HoldScythe",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Saiqi_Story_TiredStand = {
    ActionMontage = "Story_TiredStand",
    AnimationId = "Saiqi_Story_TiredStand",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  ScratchHead_End = {
    ActionMontage = "Emo_ScratchHead",
    AnimationId = "ScratchHead_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = true
  },
  ScratchHead_Loop = {
    ActionMontage = "Emo_ScratchHead",
    AnimationId = "ScratchHead_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = true
  },
  ScratchHead_Start = {
    ActionMontage = "Emo_ScratchHead",
    AnimationId = "ScratchHead_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = true
  },
  Shangdian_Write_Start = {
    ActionMontage = "Write",
    AnimationId = "Shangdian_Write_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = true
  },
  Shh01_End = {
    ActionMontage = "Emo_Shh01",
    AnimationId = "Shh01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Shh01_Start = {
    ActionMontage = "Emo_Shh01",
    AnimationId = "Shh01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Shock02_End = {
    ActionMontage = "Emo_Shock02",
    AnimationId = "Shock02_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Shock02_Loop = {
    ActionMontage = "Emo_Shock02",
    AnimationId = "Shock02_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Shock02_Start = {
    ActionMontage = "Emo_Shock02",
    AnimationId = "Shock02_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Shock03_End = {
    ActionMontage = "Emo_Shock03",
    AnimationId = "Shock03_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Shock03_Loop = {
    ActionMontage = "Emo_Shock03",
    AnimationId = "Shock03_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Shock03_Start = {
    ActionMontage = "Emo_Shock03",
    AnimationId = "Shock03_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Shock04_End = {
    ActionMontage = "Emo_Shock04",
    AnimationId = "Shock04_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Shock04_Loop = {
    ActionMontage = "Emo_Shock04",
    AnimationId = "Shock04_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Shock04_Start = {
    ActionMontage = "Emo_Shock04",
    AnimationId = "Shock04_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Shock_End = {
    ActionMontage = "Emo_Shock",
    AnimationId = "Shock_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Shock_Loop = {
    ActionMontage = "Emo_Shock",
    AnimationId = "Shock_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Shock_Start = {
    ActionMontage = "Emo_Shock",
    AnimationId = "Shock_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Shy01_End = {
    ActionMontage = "Emo_Shy01",
    AnimationId = "Shy01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Shy01_Start = {
    ActionMontage = "Emo_Shy01",
    AnimationId = "Shy01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Shy02_End = {
    ActionMontage = "Emo_Shy02",
    AnimationId = "Shy02_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Shy02_Start = {
    ActionMontage = "Emo_Shy02",
    AnimationId = "Shy02_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Shy03_End = {
    ActionMontage = "Emo_Shy03",
    AnimationId = "Shy03_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Shy03_Start = {
    ActionMontage = "Emo_Shy03",
    AnimationId = "Shy03_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Sigh_End = {
    ActionMontage = "Emo_Sigh",
    AnimationId = "Sigh_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Sigh_Loop = {
    ActionMontage = "Emo_Sigh",
    AnimationId = "Sigh_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Sigh_Start = {
    ActionMontage = "Emo_Sigh",
    AnimationId = "Sigh_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Sit = {
    ActionMontage = "Interactive_Sit_F",
    AnimationId = "Sit",
    BlendInTime = 0.2,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "SitStart",
    bUseIK = false
  },
  Sit01_Loop = {
    ActionMontage = "Interactive_Sit01",
    AnimationId = "Sit01_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = true
  },
  Sit02 = {
    ActionMontage = "Interactive_Sit02",
    AnimationId = "Sit02",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontagePrePath = "Interactive/MechInteractive",
    MontageSection = "Start",
    bUseIK = true
  },
  Sit02_Loop = {
    ActionMontage = "Interactive_Sit02",
    AnimationId = "Sit02_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontagePrePath = "Interactive/MechInteractive",
    MontageSection = "Loop",
    bUseIK = true
  },
  Sit03_End = {
    ActionMontage = "Interactive_Sit03",
    AnimationId = "Sit03_End",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontagePrePath = "Interactive/MechInteractive",
    MontageSection = "End",
    bUseIK = true
  },
  Sit03_Idle = {
    ActionMontage = "Interactive_Sit03",
    AnimationId = "Sit03_Idle",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontagePrePath = "Interactive/MechInteractive",
    MontageSection = "Idle",
    bUseIK = true
  },
  Sit03_Start = {
    ActionMontage = "Interactive_Sit03",
    AnimationId = "Sit03_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontagePrePath = "Interactive/MechInteractive",
    MontageSection = "Start",
    bUseIK = true
  },
  Sit_AgreeHead = {
    ActionMontage = "Emo_AgreeHead",
    AnimationId = "Sit_AgreeHead",
    BlendInTime = 0.4,
    BlendOutTime = 0.4,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Sit_DisagreeHead = {
    ActionMontage = "Emo_DisagreeHead",
    AnimationId = "Sit_DisagreeHead",
    BlendInTime = 0.4,
    BlendOutTime = 0.4,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Sit_End = {
    ActionMontage = "Interactive_Sit_F",
    AnimationId = "Sit_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.1,
    IsSpecialAnim = false,
    MontagePrePath = "Interactive/MechInteractive",
    MontageSection = "SitEnd",
    bUseIK = false
  },
  Sit_End_Interim = {
    ActionMontage = "Interactive_SitEnd",
    AnimationId = "Sit_End_Interim",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_Sit_Idle",
    EndLoopMontageSection = "Start",
    IsSpecialAnim = false,
    MontageSection = "SitEnd",
    bUseIK = false
  },
  Sit_Idle_End = {
    ActionMontage = "Emo_Sit_Idle",
    AnimationId = "Sit_Idle_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Sit_Idle_Loop = {
    ActionMontage = "Emo_Sit_Idle",
    AnimationId = "Sit_Idle_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Sit_Idle_Start = {
    ActionMontage = "Emo_Sit_Idle",
    AnimationId = "Sit_Idle_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Sit_Loop = {
    ActionMontage = "Interactive_Sit_F",
    AnimationId = "Sit_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.1,
    IsSpecialAnim = false,
    MontagePrePath = "Interactive/MechInteractive",
    MontageSection = "SitLoop",
    bUseIK = false
  },
  Sit_Start = {
    ActionMontage = "Interactive_Sit_F",
    AnimationId = "Sit_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontagePrePath = "Interactive/MechInteractive",
    MontageSection = "SitStart",
    bUseIK = false
  },
  Sit_Talk01_End = {
    ActionMontage = "Emo_Sit_Talk01",
    AnimationId = "Sit_Talk01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_Sit_Idle",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Sit_Talk01_Loop = {
    ActionMontage = "Emo_Sit_Talk01",
    AnimationId = "Sit_Talk01_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Sit_Talk01_SitEnd = {
    ActionMontage = "Emo_Sit_Talk01",
    AnimationId = "Sit_Talk01_SitEnd",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Sit_End_Interim",
    EndLoopMontageSection = "SitEnd",
    IsSpecialAnim = false,
    MontageSection = "SitEnd",
    bUseIK = false
  },
  Sit_Talk01_Start = {
    ActionMontage = "Emo_Sit_Talk01",
    AnimationId = "Sit_Talk01_Start",
    BlendInTime = 0.4,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Sit_Talk02R_End = {
    ActionMontage = "Emo_Sit_Talk02R",
    AnimationId = "Sit_Talk02R_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_Sit_Idle",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Sit_Talk02R_Loop = {
    ActionMontage = "Emo_Sit_Talk02R",
    AnimationId = "Sit_Talk02R_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Sit_Talk02R_SitEnd = {
    ActionMontage = "Emo_Sit_Talk02R",
    AnimationId = "Sit_Talk02R_SitEnd",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Sit_End_Interim",
    EndLoopMontageSection = "SitEnd",
    IsSpecialAnim = false,
    MontageSection = "SitEnd",
    bUseIK = false
  },
  Sit_Talk02R_Start = {
    ActionMontage = "Emo_Sit_Talk02R",
    AnimationId = "Sit_Talk02R_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Sit_Talk02_End = {
    ActionMontage = "Emo_Sit_Talk02",
    AnimationId = "Sit_Talk02_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_Sit_Idle",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Sit_Talk02_Loop = {
    ActionMontage = "Emo_Sit_Talk02",
    AnimationId = "Sit_Talk02_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Sit_Talk02_SitEnd = {
    ActionMontage = "Emo_Sit_Talk02",
    AnimationId = "Sit_Talk02_SitEnd",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Sit_End_Interim",
    EndLoopMontageSection = "SitEnd",
    IsSpecialAnim = false,
    MontageSection = "SitEnd",
    bUseIK = false
  },
  Sit_Talk02_Start = {
    ActionMontage = "Emo_Sit_Talk02",
    AnimationId = "Sit_Talk02_Start",
    BlendInTime = 0.4,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Sit_Talk03ToTalkL_End = {
    ActionMontage = "Emo_Sit_Talk03ToTalkL",
    AnimationId = "Sit_Talk03ToTalkL_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_Sit_Talk03",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Sit_Talk03ToTalkL_SitEnd = {
    ActionMontage = "Emo_Sit_Talk03ToTalkL",
    AnimationId = "Sit_Talk03ToTalkL_SitEnd",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Sit_End_Interim",
    EndLoopMontageSection = "SitEnd",
    IsSpecialAnim = false,
    MontageSection = "SitEnd",
    bUseIK = false
  },
  Sit_Talk03ToTalkL_Start = {
    ActionMontage = "Emo_Sit_Talk03ToTalkL",
    AnimationId = "Sit_Talk03ToTalkL_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Sit_Talk03ToTalkR_End = {
    ActionMontage = "Emo_Sit_Talk03ToTalkR",
    AnimationId = "Sit_Talk03ToTalkR_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_Sit_Talk03",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Sit_Talk03ToTalkR_SitEnd = {
    ActionMontage = "Emo_Sit_Talk03ToTalkR",
    AnimationId = "Sit_Talk03ToTalkR_SitEnd",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Sit_End_Interim",
    EndLoopMontageSection = "SitEnd",
    IsSpecialAnim = false,
    MontageSection = "SitEnd",
    bUseIK = false
  },
  Sit_Talk03ToTalkR_Start = {
    ActionMontage = "Emo_Sit_Talk03ToTalkR",
    AnimationId = "Sit_Talk03ToTalkR_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Sit_Talk03ToThink_End = {
    ActionMontage = "Emo_Sit_Talk03ToThink",
    AnimationId = "Sit_Talk03ToThink_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_Sit_Talk03",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Sit_Talk03ToThink_SitEnd = {
    ActionMontage = "Emo_Sit_Talk03ToThink",
    AnimationId = "Sit_Talk03ToThink_SitEnd",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Sit_End_Interim",
    EndLoopMontageSection = "SitEnd",
    IsSpecialAnim = false,
    MontageSection = "SitEnd",
    bUseIK = false
  },
  Sit_Talk03ToThink_Start = {
    ActionMontage = "Emo_Sit_Talk03ToThink",
    AnimationId = "Sit_Talk03ToThink_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Sit_Talk03_End = {
    ActionMontage = "Emo_Sit_Talk03",
    AnimationId = "Sit_Talk03_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_Sit_Idle",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Sit_Talk03_Loop = {
    ActionMontage = "Emo_Sit_Talk03",
    AnimationId = "Sit_Talk03_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Sit_Talk03_SitEnd = {
    ActionMontage = "Emo_Sit_Talk03",
    AnimationId = "Sit_Talk03_SitEnd",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Sit_End_Interim",
    EndLoopMontageSection = "SitEnd",
    IsSpecialAnim = false,
    MontageSection = "SitEnd",
    bUseIK = false
  },
  Sit_Talk03_Start = {
    ActionMontage = "Emo_Sit_Talk03",
    AnimationId = "Sit_Talk03_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Sit_Think_End = {
    ActionMontage = "Emo_Sit_Think",
    AnimationId = "Sit_Think_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_Sit_Idle",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Sit_Think_Loop = {
    ActionMontage = "Emo_Sit_Think",
    AnimationId = "Sit_Think_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Sit_Think_SitEnd = {
    ActionMontage = "Emo_Sit_Think",
    AnimationId = "Sit_Think_SitEnd",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Sit_End_Interim",
    EndLoopMontageSection = "SitEnd",
    IsSpecialAnim = false,
    MontageSection = "SitEnd",
    bUseIK = false
  },
  Sit_Think_Start = {
    ActionMontage = "Emo_Sit_Think",
    AnimationId = "Sit_Think_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  SpecialConfident_End = {
    ActionMontage = "Emo_SpecialConfident",
    AnimationId = "SpecialConfident_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  SpecialConfident_Start = {
    ActionMontage = "Emo_SpecialConfident",
    AnimationId = "SpecialConfident_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  SpecialHappy_End = {
    ActionMontage = "Emo_SpecialHappy",
    AnimationId = "SpecialHappy_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  SpecialHappy_Start = {
    ActionMontage = "Emo_SpecialHappy",
    AnimationId = "SpecialHappy_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  SpecialHoldHelmet_End = {
    ActionMontage = "Emo_SpecialHoldHelmet",
    AnimationId = "SpecialHoldHelmet_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = true
  },
  SpecialHoldHelmet_Start = {
    ActionMontage = "Emo_SpecialHoldHelmet",
    AnimationId = "SpecialHoldHelmet_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = true
  },
  SpecialIdle01 = {
    ActionMontage = "SpecialIdle01",
    AnimationId = "SpecialIdle01",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = true,
    MontageSection = "Default",
    bUseIK = true
  },
  SpecialIdle02 = {
    ActionMontage = "SpecialIdle02",
    AnimationId = "SpecialIdle02",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = true,
    MontageSection = "Default",
    bUseIK = true
  },
  SpecialIdle03 = {
    ActionMontage = "Idle_Sit",
    AnimationId = "SpecialIdle03",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = true,
    MontageSection = "Default",
    bUseIK = true
  },
  SpecialLook01_Start = {
    ActionMontage = "Emo_SpecialLook01",
    AnimationId = "SpecialLook01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = true
  },
  SpecialLook02_Start = {
    ActionMontage = "Emo_SpecialLook02",
    AnimationId = "SpecialLook02_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = true
  },
  SpecialSnapFingers = {
    ActionMontage = "Emo_SpecialSnapFingers",
    AnimationId = "SpecialSnapFingers",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  SpecialThink_End = {
    ActionMontage = "Emo_SpecialThink",
    AnimationId = "SpecialThink_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  SpecialThink_Start = {
    ActionMontage = "Emo_SpecialThink",
    AnimationId = "SpecialThink_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  SpecialUnInterested_End = {
    ActionMontage = "Emo_SpecialUnInterested",
    AnimationId = "SpecialUnInterested_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = true
  },
  SpecialUnInterested_Start = {
    ActionMontage = "Emo_SpecialUnInterested",
    AnimationId = "SpecialUnInterested_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = true
  },
  Special_End = {
    ActionMontage = "Emo_Special",
    AnimationId = "Special_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Special_Start = {
    ActionMontage = "Emo_Special",
    AnimationId = "Special_Start",
    BlendInTime = 0.3,
    BlendOutTime = 0.4,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Special_Start1 = {
    ActionMontage = "Emo_Special",
    AnimationId = "Special_Start1",
    BlendInTime = 0.3,
    BlendOutTime = 0.4,
    IsSpecialAnim = false,
    MontageSection = "Start1",
    bUseIK = false
  },
  Special_Start2 = {
    ActionMontage = "Emo_Special",
    AnimationId = "Special_Start2",
    BlendInTime = 0.3,
    BlendOutTime = 0.4,
    IsSpecialAnim = false,
    MontageSection = "Start2",
    bUseIK = false
  },
  SquatTalk_End = {
    ActionMontage = "Emo_SquatTalk",
    AnimationId = "SquatTalk_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  SquatTalk_Loop = {
    ActionMontage = "Emo_SquatTalk",
    AnimationId = "SquatTalk_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  SquatTalk_Start = {
    ActionMontage = "Emo_SquatTalk",
    AnimationId = "SquatTalk_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Squat_End = {
    ActionMontage = "Emo_Squat",
    AnimationId = "Squat_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = true
  },
  Squat_Start = {
    ActionMontage = "Emo_Squat",
    AnimationId = "Squat_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Stop01_End = {
    ActionMontage = "Emo_Stop01",
    AnimationId = "Stop01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Stop01_Start = {
    ActionMontage = "Emo_Stop01",
    AnimationId = "Stop01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Stop_End = {
    ActionMontage = "Emo_Stop",
    AnimationId = "Stop_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Stop_Loop = {
    ActionMontage = "Emo_Stop",
    AnimationId = "Stop_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Stop_Start = {
    ActionMontage = "Emo_Stop",
    AnimationId = "Stop_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Story_HandToHand_End = {
    ActionMontage = "Story_HandToHand",
    AnimationId = "Story_HandToHand_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Story_HandToHand_Loop = {
    ActionMontage = "Story_HandToHand",
    AnimationId = "Story_HandToHand_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Story_HandToHand_Start = {
    ActionMontage = "Story_HandToHand",
    AnimationId = "Story_HandToHand_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Story_Headache_End = {
    ActionMontage = "Story_Headache",
    AnimationId = "Story_Headache_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Story_Headache_Loop = {
    ActionMontage = "Story_Headache",
    AnimationId = "Story_Headache_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Story_Headache_Start = {
    ActionMontage = "Story_Headache",
    AnimationId = "Story_Headache_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Story_Hug = {
    ActionMontage = "Story_Hug",
    AnimationId = "Story_Hug",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Talk01_End = {
    ActionMontage = "Emo_Talk01",
    AnimationId = "Talk01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Talk01_Loop = {
    ActionMontage = "Emo_Talk01",
    AnimationId = "Talk01_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Talk01_Start = {
    ActionMontage = "Emo_Talk01",
    AnimationId = "Talk01_Start",
    BlendInTime = 0.4,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Talk02R_End = {
    ActionMontage = "Emo_Talk02R",
    AnimationId = "Talk02R_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Talk02R_Loop = {
    ActionMontage = "Emo_Talk02R",
    AnimationId = "Talk02R_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Talk02R_Start = {
    ActionMontage = "Emo_Talk02R",
    AnimationId = "Talk02R_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Talk02_End = {
    ActionMontage = "Emo_Talk02",
    AnimationId = "Talk02_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Talk02_Loop = {
    ActionMontage = "Emo_Talk02",
    AnimationId = "Talk02_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Talk02_Start = {
    ActionMontage = "Emo_Talk02",
    AnimationId = "Talk02_Start",
    BlendInTime = 0.4,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Talk03ToTalkL_End = {
    ActionMontage = "Emo_Talk03ToTalkL",
    AnimationId = "Talk03ToTalkL_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_Talk03",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Talk03ToTalkL_Loop = {
    ActionMontage = "Emo_Talk03ToTalkL",
    AnimationId = "Talk03ToTalkL_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Talk03ToTalkL_Start = {
    ActionMontage = "Emo_Talk03ToTalkL",
    AnimationId = "Talk03ToTalkL_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Talk03ToTalkR_End = {
    ActionMontage = "Emo_Talk03ToTalkR",
    AnimationId = "Talk03ToTalkR_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_Talk03",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Talk03ToTalkR_Loop = {
    ActionMontage = "Emo_Talk03ToTalkR",
    AnimationId = "Talk03ToTalkR_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Talk03ToTalkR_Start = {
    ActionMontage = "Emo_Talk03ToTalkR",
    AnimationId = "Talk03ToTalkR_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Talk03ToThink_End = {
    ActionMontage = "Emo_Talk03ToThink",
    AnimationId = "Talk03ToThink_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    EndLoopMontage = "Emo_Talk03",
    EndLoopMontageSection = "Loop",
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Talk03ToThink_Loop = {
    ActionMontage = "Emo_Talk03ToThink",
    AnimationId = "Talk03ToThink_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Talk03ToThink_Start = {
    ActionMontage = "Emo_Talk03ToThink",
    AnimationId = "Talk03ToThink_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Talk03_End = {
    ActionMontage = "Emo_Talk03",
    AnimationId = "Talk03_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Talk03_Loop = {
    ActionMontage = "Emo_Talk03",
    AnimationId = "Talk03_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Talk03_Start = {
    ActionMontage = "Emo_Talk03",
    AnimationId = "Talk03_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Tanshou_End = {
    ActionMontage = "TanShou",
    AnimationId = "Tanshou_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Tanshou_Start = {
    ActionMontage = "TanShou",
    AnimationId = "Tanshou_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Tentacle_Idle01 = {
    ActionMontage = "Interactive_Idle",
    AnimationId = "Tentacle_Idle01",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Idle01"
  },
  Tentacle_Idle02 = {
    ActionMontage = "Interactive_Idle",
    AnimationId = "Tentacle_Idle02",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Idle02"
  },
  Tentacle_Idle03 = {
    ActionMontage = "Interactive_Idle",
    AnimationId = "Tentacle_Idle03",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Idle03"
  },
  Tentacle_Idle04 = {
    ActionMontage = "Interactive_Idle",
    AnimationId = "Tentacle_Idle04",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Idle04"
  },
  Think_End = {
    ActionMontage = "Emo_Think",
    AnimationId = "Think_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Think_Loop = {
    ActionMontage = "Emo_Think",
    AnimationId = "Think_Loop",
    BlendInTime = 0,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Think_Start = {
    ActionMontage = "Emo_Think",
    AnimationId = "Think_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  TieJiang_Idle = {
    ActionMontage = "Emo_Idle",
    AnimationId = "TieJiang_Idle",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  TilteHead_End = {
    ActionMontage = "Emo_TilteHead",
    AnimationId = "TilteHead_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  TilteHead_Loop = {
    ActionMontage = "Emo_TilteHead",
    AnimationId = "TilteHead_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  TilteHead_Start = {
    ActionMontage = "Emo_TilteHead",
    AnimationId = "TilteHead_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Tuosi02_Dodge_End = {
    ActionMontage = "Story_Dodge",
    AnimationId = "Tuosi02_Dodge_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Tuosi02_Dodge_Start = {
    ActionMontage = "Story_Dodge",
    AnimationId = "Tuosi02_Dodge_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Tuosi02_Drop = {
    ActionMontage = "Story_Drop",
    AnimationId = "Tuosi02_Drop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Tuosi02_Emo_Idle_Pose = {
    ActionMontage = "Emo_Idle_Pose",
    AnimationId = "Tuosi02_Emo_Idle_Pose",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Tuosi02_Sitidle = {
    ActionMontage = "Story_Sitidle",
    AnimationId = "Tuosi02_Sitidle",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Tuosi02_Story_Find02_Start = {
    ActionMontage = "Story_Find02",
    AnimationId = "Tuosi02_Story_Find02_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Tuosi02_Story_Hug02_Loop = {
    ActionMontage = "Story_Hug02",
    AnimationId = "Tuosi02_Story_Hug02_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Tuosi02_Threat_End = {
    ActionMontage = "Story_Threat",
    AnimationId = "Tuosi02_Threat_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End",
    bUseIK = false
  },
  Tuosi02_Threat_Start = {
    ActionMontage = "Story_Threat",
    AnimationId = "Tuosi02_Threat_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Tuosi02_Touch = {
    ActionMontage = "Story_Touch",
    AnimationId = "Tuosi02_Touch",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Tuosi_Story_Rise01_Start = {
    ActionMontage = "Story_Rise01",
    AnimationId = "Tuosi_Story_Rise01_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Wave01_End = {
    ActionMontage = "Emo_Wave01",
    AnimationId = "Wave01_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Wave01_Loop = {
    ActionMontage = "Emo_Wave01",
    AnimationId = "Wave01_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Wave01_Start = {
    ActionMontage = "Emo_Wave01",
    AnimationId = "Wave01_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Wave02_End = {
    ActionMontage = "Emo_Wave02",
    AnimationId = "Wave02_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Wave02_Loop = {
    ActionMontage = "Emo_Wave02",
    AnimationId = "Wave02_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Wave02_Start = {
    ActionMontage = "Emo_Wave02",
    AnimationId = "Wave02_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Weiji_Story_Sit = {
    ActionMontage = "Story_Sit",
    AnimationId = "Weiji_Story_Sit",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Weita_Idle = {
    ActionMontage = "Emo_Idle",
    AnimationId = "Weita_Idle",
    BlendInTime = 0.8,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start",
    bUseIK = false
  },
  Weita_Story_Alert_Start = {
    ActionMontage = "Story_Alert",
    AnimationId = "Weita_Story_Alert_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Weita_Story_Awake_End = {
    ActionMontage = "Story_Awake",
    AnimationId = "Weita_Story_Awake_End",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Weita_Story_Awake_Loop = {
    ActionMontage = "Story_Awake",
    AnimationId = "Weita_Story_Awake_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Weita_Story_Awake_Start = {
    ActionMontage = "Story_Awake",
    AnimationId = "Weita_Story_Awake_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Weita_Story_Crouch_Loop = {
    ActionMontage = "Story_Crouch",
    AnimationId = "Weita_Story_Crouch_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop",
    bUseIK = false
  },
  Weita_Story_Hug_End = {
    ActionMontage = "Story_Hug",
    AnimationId = "Weita_Story_Hug_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Weita_Story_Hug_Loop = {
    ActionMontage = "Story_Hug",
    AnimationId = "Weita_Story_Hug_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Weita_Story_Hug_Start = {
    ActionMontage = "Story_Hug",
    AnimationId = "Weita_Story_Hug_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Weita_Story_Hurt_End = {
    ActionMontage = "Story_Hurt",
    AnimationId = "Weita_Story_Hurt_End",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Weita_Story_Hurt_Loop = {
    ActionMontage = "Story_Hurt",
    AnimationId = "Weita_Story_Hurt_Loop",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Weita_Story_Hurt_Start = {
    ActionMontage = "Story_Hurt",
    AnimationId = "Weita_Story_Hurt_Start",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Weita_Story_Tired_Start = {
    ActionMontage = "Story_Tired",
    AnimationId = "Weita_Story_Tired_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Wuyou_Agree = {
    ActionMontage = "Idle_random1",
    AnimationId = "Wuyou_Agree",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Default",
    bUseIK = true
  },
  Wuyou_Born = {
    ActionMontage = "Born",
    AnimationId = "Wuyou_Born",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Default",
    bUseIK = true
  },
  Wuyou_Disagree = {
    ActionMontage = "Idle_random2",
    AnimationId = "Wuyou_Disagree",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Default",
    bUseIK = true
  },
  Wuyou_Disappear = {
    ActionMontage = "Disappear",
    AnimationId = "Wuyou_Disappear",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    IsOnceAction = true,
    IsSpecialAnim = false,
    MontageSection = "Default",
    bUseIK = true
  },
  Zhangyu_Story_Tentacle = {
    ActionMontage = "Story_Tentacle",
    AnimationId = "Zhangyu_Story_Tentacle",
    BlendInTime = 0,
    BlendOutTime = 0,
    EndLoopMontageSection = "Story_Tentacle",
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Zhiliu_Story_Special01_End = {
    ActionMontage = "Story_Special01",
    AnimationId = "Zhiliu_Story_Special01_End",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Zhiliu_Story_Special01_Loop = {
    ActionMontage = "Story_Special01",
    AnimationId = "Zhiliu_Story_Special01_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Zhiliu_Story_Special01_Start = {
    ActionMontage = "Story_Special01",
    AnimationId = "Zhiliu_Story_Special01_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Zhiliu_Story_Special02_End = {
    ActionMontage = "Story_Special02",
    AnimationId = "Zhiliu_Story_Special02_End",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Zhiliu_Story_Special02_Loop = {
    ActionMontage = "Story_Special02",
    AnimationId = "Zhiliu_Story_Special02_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Zhiliu_Story_Special02_Start = {
    ActionMontage = "Story_Special02",
    AnimationId = "Zhiliu_Story_Special02_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  },
  Zhiliu_Story_Special03_End = {
    ActionMontage = "Story_Special03",
    AnimationId = "Zhiliu_Story_Special03_End",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "End"
  },
  Zhiliu_Story_Special03_Loop = {
    ActionMontage = "Story_Special03",
    AnimationId = "Zhiliu_Story_Special03_Loop",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Loop"
  },
  Zhiliu_Story_Special03_Start = {
    ActionMontage = "Story_Special03",
    AnimationId = "Zhiliu_Story_Special03_Start",
    BlendInTime = 0,
    BlendOutTime = 0,
    IsSpecialAnim = false,
    MontageSection = "Start"
  }
})
