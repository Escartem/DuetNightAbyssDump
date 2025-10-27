local T = {}
T.RT_1 = {
  [19001] = 2,
  [19007] = 2
}
T.RT_2 = {
  [19004] = 5,
  [19005] = 5,
  [19008] = 5
}
T.RT_3 = {
  [19003] = 8,
  [19007] = 8
}
T.RT_4 = {
  [19002] = 10,
  [19006] = 10,
  [19007] = 10,
  [19008] = 10
}
T.RT_5 = {
  [19002] = 5,
  [19003] = 5,
  [19008] = 5
}
T.RT_6 = {
  [19002] = 8,
  [19003] = 8,
  [19004] = 8
}
T.RT_7 = {
  [19001] = 5,
  [19002] = 5,
  [19006] = 5,
  [19007] = 5
}
T.RT_8 = {
  [19001] = 2,
  [19008] = 2
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("PartyTopic", {
  [110101] = {
    MemoryDescription = "PartyReward_Description_110101",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Heitao_1.T_Entertainment_Heitao_1'",
    MemoryName = "PartyReward_Name_110101",
    PartyTopicConsume = T.RT_1,
    PartyTopicDescription = "PartyTopic_Description_110101",
    PartyTopicId = 110101,
    PartyTopicName = "PartyTopic_Name_110101",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Heitao_110101.story"
  },
  [110102] = {
    MemoryDescription = "PartyReward_Description_110102",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Heitao_2.T_Entertainment_Heitao_2'",
    MemoryName = "PartyReward_Name_110102",
    PartyTopicConsume = T.RT_2,
    PartyTopicDescription = "PartyTopic_Description_110102",
    PartyTopicId = 110102,
    PartyTopicName = "PartyTopic_Name_110102",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Heitao_110102.story"
  },
  [110103] = {
    MemoryDescription = "PartyReward_Description_110103",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Heitao_3.T_Entertainment_Heitao_3'",
    MemoryName = "PartyReward_Name_110103",
    PartyTopicConsume = T.RT_3,
    PartyTopicDescription = "PartyTopic_Description_110103",
    PartyTopicId = 110103,
    PartyTopicName = "PartyTopic_Name_110103",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Heitao_110103.story"
  },
  [110104] = {
    MemoryDescription = "PartyReward_Description_110104",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Heitao_4.T_Entertainment_Heitao_4'",
    MemoryName = "PartyReward_Name_110104",
    PartyTopicConsume = T.RT_4,
    PartyTopicDescription = "PartyTopic_Description_110104",
    PartyTopicId = 110104,
    PartyTopicName = "PartyTopic_Name_110104",
    PartyTopicReward = 7053,
    PartyTopicTalkId = "Invite/Heitao_110104.story"
  },
  [110301] = {
    MemoryDescription = "PartyReward_Description_110301",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Tuosi_1.T_Entertainment_Tuosi_1'",
    MemoryName = "PartyReward_Name_110301",
    PartyTopicConsume = T.RT_1,
    PartyTopicDescription = "PartyTopic_Description_110301",
    PartyTopicId = 110301,
    PartyTopicName = "PartyTopic_Name_110301",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Tuosi_110301.story"
  },
  [110302] = {
    MemoryDescription = "PartyReward_Description_110302",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Tuosi_2.T_Entertainment_Tuosi_2'",
    MemoryName = "PartyReward_Name_110302",
    PartyTopicConsume = T.RT_2,
    PartyTopicDescription = "PartyTopic_Description_110302",
    PartyTopicId = 110302,
    PartyTopicName = "PartyTopic_Name_110302",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Tuosi_110302.story"
  },
  [110303] = {
    ConditionId = 100307,
    MemoryDescription = "PartyReward_Description_110303",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Tuosi_3.T_Entertainment_Tuosi_3'",
    MemoryName = "PartyReward_Name_110303",
    PartyTopicConsume = T.RT_3,
    PartyTopicDescription = "PartyTopic_Description_110303",
    PartyTopicId = 110303,
    PartyTopicName = "PartyTopic_Name_110303",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Tuosi_110303.story"
  },
  [110304] = {
    MemoryDescription = "PartyReward_Description_110304",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Tuosi_4.T_Entertainment_Tuosi_4'",
    MemoryName = "PartyReward_Name_110304",
    PartyTopicConsume = T.RT_4,
    PartyTopicDescription = "PartyTopic_Description_110304",
    PartyTopicId = 110304,
    PartyTopicName = "PartyTopic_Name_110304",
    PartyTopicReward = 7053,
    PartyTopicTalkId = "Invite/Tuosi_110304.story"
  },
  [150201] = {
    MemoryDescription = "PartyReward_Description_150201",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Nifu_1.T_Entertainment_Nifu_1'",
    MemoryName = "PartyReward_Name_150201",
    PartyTopicConsume = {
      [19006] = 2
    },
    PartyTopicDescription = "PartyTopic_Description_150201",
    PartyTopicId = 150201,
    PartyTopicName = "PartyTopic_Name_150201",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Nifu_150201.story"
  },
  [150202] = {
    MemoryDescription = "PartyReward_Description_150202",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Nifu_2.T_Entertainment_Nifu_2'",
    MemoryName = "PartyReward_Name_150202",
    PartyTopicConsume = {
      [19006] = 5
    },
    PartyTopicDescription = "PartyTopic_Description_150202",
    PartyTopicId = 150202,
    PartyTopicName = "PartyTopic_Name_150202",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Nifu_150202.story"
  },
  [150203] = {
    MemoryDescription = "PartyReward_Description_150203",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Nifu_3.T_Entertainment_Nifu_3'",
    MemoryName = "PartyReward_Name_150203",
    PartyTopicConsume = {
      [19006] = 8
    },
    PartyTopicDescription = "PartyTopic_Description_150203",
    PartyTopicId = 150203,
    PartyTopicName = "PartyTopic_Name_150203",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Nifu_150203.story"
  },
  [150204] = {
    MemoryDescription = "PartyReward_Description_150204",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Nifu_4.T_Entertainment_Nifu_4'",
    MemoryName = "PartyReward_Name_150204",
    PartyTopicConsume = {
      [19005] = 10,
      [19006] = 10
    },
    PartyTopicDescription = "PartyTopic_Description_150204",
    PartyTopicId = 150204,
    PartyTopicName = "PartyTopic_Name_150204",
    PartyTopicReward = 7053,
    PartyTopicTalkId = "Invite/Nifu_150204.story"
  },
  [180101] = {
    ConditionId = 100204,
    MemoryDescription = "PartyReward_Description_180101",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Fina_1.T_Entertainment_Fina_1'",
    MemoryName = "PartyReward_Name_180101",
    PartyTopicConsume = {
      [19001] = 2,
      [19005] = 2,
      [19008] = 2
    },
    PartyTopicDescription = "PartyTopic_Description_180101",
    PartyTopicId = 180101,
    PartyTopicName = "PartyTopic_Name_180101",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Feina_180101.story"
  },
  [180102] = {
    MemoryDescription = "PartyReward_Description_180102",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Fina_2.T_Entertainment_Fina_2'",
    MemoryName = "PartyReward_Name_180102",
    PartyTopicConsume = {
      [19002] = 5,
      [19007] = 5,
      [19008] = 5
    },
    PartyTopicDescription = "PartyTopic_Description_180102",
    PartyTopicId = 180102,
    PartyTopicName = "PartyTopic_Name_180102",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Feina_180102.story"
  },
  [180103] = {
    MemoryDescription = "PartyReward_Description_180103",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Fina_3.T_Entertainment_Fina_3'",
    MemoryName = "PartyReward_Name_180103",
    PartyTopicConsume = {
      [19002] = 8,
      [19003] = 8,
      [19005] = 8
    },
    PartyTopicDescription = "PartyTopic_Description_180103",
    PartyTopicId = 180103,
    PartyTopicName = "PartyTopic_Name_180103",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Feina_180103.story"
  },
  [180104] = {
    MemoryDescription = "PartyReward_Description_180104",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Fina_4.T_Entertainment_Fina_4'",
    MemoryName = "PartyReward_Name_180104",
    PartyTopicConsume = {
      [19005] = 10,
      [19007] = 10,
      [19008] = 10
    },
    PartyTopicDescription = "PartyTopic_Description_180104",
    PartyTopicId = 180104,
    PartyTopicName = "PartyTopic_Name_180104",
    PartyTopicReward = 7053,
    PartyTopicTalkId = "Invite/Feina_180104.story"
  },
  [210101] = {
    MemoryDescription = "PartyReward_Description_210101",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Shuimu_1.T_Entertainment_Shuimu_1'",
    MemoryName = "PartyReward_Name_210101",
    PartyTopicConsume = {
      [19001] = 2,
      [19005] = 2
    },
    PartyTopicDescription = "PartyTopic_Description_210101",
    PartyTopicId = 210101,
    PartyTopicName = "PartyTopic_Name_210101",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Shuimu_210101.story"
  },
  [210102] = {
    MemoryDescription = "PartyReward_Description_210102",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Shuimu_2.T_Entertainment_Shuimu_2'",
    MemoryName = "PartyReward_Name_210102",
    PartyTopicConsume = {
      [19002] = 5,
      [19004] = 5,
      [19006] = 5
    },
    PartyTopicDescription = "PartyTopic_Description_210102",
    PartyTopicId = 210102,
    PartyTopicName = "PartyTopic_Name_210102",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Shuimu_210102.story"
  },
  [210103] = {
    MemoryDescription = "PartyReward_Description_210103",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Shuimu_3.T_Entertainment_Shuimu_3'",
    MemoryName = "PartyReward_Name_210103",
    PartyTopicConsume = {
      [19001] = 8,
      [19006] = 8
    },
    PartyTopicDescription = "PartyTopic_Description_210103",
    PartyTopicId = 210103,
    PartyTopicName = "PartyTopic_Name_210103",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Shuimu_210103.story"
  },
  [210104] = {
    MemoryDescription = "PartyReward_Description_210104",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Shuimu_4.T_Entertainment_Shuimu_4'",
    MemoryName = "PartyReward_Name_210104",
    PartyTopicConsume = {
      [19003] = 10,
      [19005] = 10,
      [19007] = 10,
      [19008] = 10
    },
    PartyTopicDescription = "PartyTopic_Description_210104",
    PartyTopicId = 210104,
    PartyTopicName = "PartyTopic_Name_210104",
    PartyTopicReward = 7053,
    PartyTopicTalkId = "Invite/Shuimu_210104.story"
  },
  [230101] = {
    MemoryDescription = "PartyReward_Description_230101",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Zhangyu_1.T_Entertainment_Zhangyu_1'",
    MemoryName = "PartyReward_Name_230101",
    PartyTopicConsume = {
      [19001] = 2,
      [19003] = 2,
      [19006] = 2,
      [19008] = 2
    },
    PartyTopicDescription = "PartyTopic_Description_230101",
    PartyTopicId = 230101,
    PartyTopicName = "PartyTopic_Name_230101",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Zhangyu_230101.story"
  },
  [230102] = {
    MemoryDescription = "PartyReward_Description_230102",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Zhangyu_2.T_Entertainment_Zhangyu_2'",
    MemoryName = "PartyReward_Name_230102",
    PartyTopicConsume = T.RT_5,
    PartyTopicDescription = "PartyTopic_Description_230102",
    PartyTopicId = 230102,
    PartyTopicName = "PartyTopic_Name_230102",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Zhangyu_230102.story"
  },
  [230103] = {
    MemoryDescription = "PartyReward_Description_230103",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Zhangyu_3.T_Entertainment_Zhangyu_3'",
    MemoryName = "PartyReward_Name_230103",
    PartyTopicConsume = {
      [19002] = 8,
      [19005] = 8,
      [19007] = 8
    },
    PartyTopicDescription = "PartyTopic_Description_230103",
    PartyTopicId = 230103,
    PartyTopicName = "PartyTopic_Name_230103",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Zhangyu_230103.story"
  },
  [230104] = {
    MemoryDescription = "PartyReward_Description_230104",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Zhangyu_4.T_Entertainment_Zhangyu_4'",
    MemoryName = "PartyReward_Name_230104",
    PartyTopicConsume = {
      [19001] = 10,
      [19002] = 10,
      [19003] = 10,
      [19004] = 10,
      [19005] = 10,
      [19006] = 10,
      [19007] = 10,
      [19008] = 10
    },
    PartyTopicDescription = "PartyTopic_Description_230104",
    PartyTopicId = 230104,
    PartyTopicName = "PartyTopic_Name_230104",
    PartyTopicReward = 7053,
    PartyTopicTalkId = "Invite/Zhangyu_230104.story"
  },
  [240101] = {
    MemoryDescription = "PartyReward_Description_240101",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Baiheng_1.T_Entertainment_Baiheng_1'",
    MemoryName = "PartyReward_Name_240101",
    PartyTopicConsume = {
      [19006] = 2,
      [19008] = 2
    },
    PartyTopicDescription = "PartyTopic_Description_240101",
    PartyTopicId = 240101,
    PartyTopicName = "PartyTopic_Name_240101",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Baiheng_240101.story"
  },
  [240102] = {
    MemoryDescription = "PartyReward_Description_240102",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Baiheng_2.T_Entertainment_Baiheng_2'",
    MemoryName = "PartyReward_Name_240102",
    PartyTopicConsume = {
      [19004] = 5,
      [19007] = 5
    },
    PartyTopicDescription = "PartyTopic_Description_240102",
    PartyTopicId = 240102,
    PartyTopicName = "PartyTopic_Name_240102",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Baiheng_240102.story"
  },
  [240103] = {
    MemoryDescription = "PartyReward_Description_240103",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Baiheng_3.T_Entertainment_Baiheng_3'",
    MemoryName = "PartyReward_Name_240103",
    PartyTopicConsume = {
      [19001] = 8,
      [19005] = 8
    },
    PartyTopicDescription = "PartyTopic_Description_240103",
    PartyTopicId = 240103,
    PartyTopicName = "PartyTopic_Name_240103",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Baiheng_240103.story"
  },
  [240104] = {
    MemoryDescription = "PartyReward_Description_240104",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Baiheng_2.T_Entertainment_Baiheng_2'",
    MemoryName = "PartyReward_Name_240104",
    PartyTopicConsume = {
      [19002] = 10,
      [19006] = 10
    },
    PartyTopicDescription = "PartyTopic_Description_240104",
    PartyTopicId = 240104,
    PartyTopicName = "PartyTopic_Name_240104",
    PartyTopicReward = 7053,
    PartyTopicTalkId = "Invite/Baiheng_240104.story"
  },
  [310101] = {
    MemoryDescription = "PartyReward_Description_310101",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Linen_1.T_Entertainment_Linen_1'",
    MemoryName = "PartyReward_Name_310101",
    PartyTopicConsume = {
      [19003] = 3,
      [19006] = 3
    },
    PartyTopicDescription = "PartyTopic_Description_310101",
    PartyTopicId = 310101,
    PartyTopicName = "PartyTopic_Name_310101",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Linen_310101.story"
  },
  [310102] = {
    MemoryDescription = "PartyReward_Description_310102",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Linen_2.T_Entertainment_Linen_2'",
    MemoryName = "PartyReward_Name_310102",
    PartyTopicConsume = {
      [19002] = 6,
      [19004] = 6,
      [19006] = 6
    },
    PartyTopicDescription = "PartyTopic_Description_310102",
    PartyTopicId = 310102,
    PartyTopicName = "PartyTopic_Name_310102",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Linen_310102.story"
  },
  [310103] = {
    MemoryDescription = "PartyReward_Description_310103",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Linen_3.T_Entertainment_Linen_3'",
    MemoryName = "PartyReward_Name_310103",
    PartyTopicConsume = {
      [19002] = 9,
      [19005] = 9,
      [19008] = 9
    },
    PartyTopicDescription = "PartyTopic_Description_310103",
    PartyTopicId = 310103,
    PartyTopicName = "PartyTopic_Name_310103",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Linen_310103.story"
  },
  [310201] = {
    MemoryDescription = "PartyReward_Description_310201",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Xier_1.T_Entertainment_Xier_1'",
    MemoryName = "PartyReward_Name_310201",
    PartyTopicConsume = {
      [19004] = 2,
      [19008] = 2
    },
    PartyTopicDescription = "PartyTopic_Description_310201",
    PartyTopicId = 310201,
    PartyTopicName = "PartyTopic_Name_310201",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Xier_310201.story"
  },
  [310202] = {
    MemoryDescription = "PartyReward_Description_310202",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Xier_2.T_Entertainment_Xier_2'",
    MemoryName = "PartyReward_Name_310202",
    PartyTopicConsume = {
      [19001] = 5,
      [19008] = 5
    },
    PartyTopicDescription = "PartyTopic_Description_310202",
    PartyTopicId = 310202,
    PartyTopicName = "PartyTopic_Name_310202",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Xier_310202.story"
  },
  [310203] = {
    MemoryDescription = "PartyReward_Description_310203",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Xier_3.T_Entertainment_Xier_3'",
    MemoryName = "PartyReward_Name_310203",
    PartyTopicConsume = {
      [19002] = 8
    },
    PartyTopicDescription = "PartyTopic_Description_310203",
    PartyTopicId = 310203,
    PartyTopicName = "PartyTopic_Name_310203",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Xier_310203.story"
  },
  [310204] = {
    MemoryDescription = "PartyReward_Description_310204",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Xier_4.T_Entertainment_Xier_4'",
    MemoryName = "PartyReward_Name_310204",
    PartyTopicConsume = {
      [19003] = 10,
      [19004] = 10,
      [19005] = 10,
      [19006] = 10
    },
    PartyTopicDescription = "PartyTopic_Description_310204",
    PartyTopicId = 310204,
    PartyTopicName = "PartyTopic_Name_310204",
    PartyTopicReward = 7053,
    PartyTopicTalkId = "Invite/Xier_310204.story"
  },
  [310301] = {
    MemoryDescription = "PartyReward_Description_310301",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Yeer_1.T_Entertainment_Yeer_1'",
    MemoryName = "PartyReward_Name_310301",
    PartyTopicConsume = {
      [19001] = 2,
      [19007] = 2,
      [19008] = 2
    },
    PartyTopicDescription = "PartyTopic_Description_310301",
    PartyTopicId = 310301,
    PartyTopicName = "PartyTopic_Name_310301",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Yeer_301301.story"
  },
  [310302] = {
    MemoryDescription = "PartyReward_Description_310302",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Yeer_2.T_Entertainment_Yeer_2'",
    MemoryName = "PartyReward_Name_310302",
    PartyTopicConsume = {
      [19002] = 5,
      [19005] = 5,
      [19007] = 5
    },
    PartyTopicDescription = "PartyTopic_Description_310302",
    PartyTopicId = 310302,
    PartyTopicName = "PartyTopic_Name_310302",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Yeer_301302.story"
  },
  [310303] = {
    MemoryDescription = "PartyReward_Description_310303",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Yeer_3.T_Entertainment_Yeer_3'",
    MemoryName = "PartyReward_Name_310303",
    PartyTopicConsume = T.RT_6,
    PartyTopicDescription = "PartyTopic_Description_310303",
    PartyTopicId = 310303,
    PartyTopicName = "PartyTopic_Name_310303",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Yeer_301303.story"
  },
  [310304] = {
    MemoryDescription = "PartyReward_Description_310304",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Yeer_4.T_Entertainment_Yeer_4'",
    MemoryName = "PartyReward_Name_310304",
    PartyTopicConsume = {
      [19005] = 10,
      [19006] = 10,
      [19008] = 10
    },
    PartyTopicDescription = "PartyTopic_Description_310304",
    PartyTopicId = 310304,
    PartyTopicName = "PartyTopic_Name_310304",
    PartyTopicReward = 7053,
    PartyTopicTalkId = "Invite/Yeer_301304.story"
  },
  [320101] = {
    MemoryDescription = "PartyReward_Description_320101",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Haier_1.T_Entertainment_Haier_1'",
    MemoryName = "PartyReward_Name_320101",
    PartyTopicConsume = {
      [19005] = 2,
      [19006] = 2
    },
    PartyTopicDescription = "PartyTopic_Description_320101",
    PartyTopicId = 320101,
    PartyTopicName = "PartyTopic_Name_320101",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Haier_320101.story"
  },
  [320102] = {
    MemoryDescription = "PartyReward_Description_320102",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Haier_2.T_Entertainment_Haier_2'",
    MemoryName = "PartyReward_Name_320102",
    PartyTopicConsume = {
      [19002] = 5,
      [19004] = 5
    },
    PartyTopicDescription = "PartyTopic_Description_320102",
    PartyTopicId = 320102,
    PartyTopicName = "PartyTopic_Name_320102",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Haier_320102.story"
  },
  [320103] = {
    MemoryDescription = "PartyReward_Description_320103",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Haier_3.T_Entertainment_Haier_3'",
    MemoryName = "PartyReward_Name_320103",
    PartyTopicConsume = {
      [19007] = 8,
      [19008] = 8
    },
    PartyTopicDescription = "PartyTopic_Description_320103",
    PartyTopicId = 320103,
    PartyTopicName = "PartyTopic_Name_320103",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Haier_320103.story"
  },
  [320104] = {
    MemoryDescription = "PartyReward_Description_320104",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Haier_4.T_Entertainment_Haier_4'",
    MemoryName = "PartyReward_Name_320104",
    PartyTopicConsume = {
      [19001] = 10,
      [19002] = 10
    },
    PartyTopicDescription = "PartyTopic_Description_320104",
    PartyTopicId = 320104,
    PartyTopicName = "PartyTopic_Name_320104",
    PartyTopicReward = 7053,
    PartyTopicTalkId = "Invite/Haier_320104.story"
  },
  [330101] = {
    ConditionId = 100203,
    MemoryDescription = "PartyReward_Description_330101",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Maer_1.T_Entertainment_Maer_1'",
    MemoryName = "PartyReward_Name_330101",
    PartyTopicConsume = {
      [19001] = 2,
      [19004] = 2,
      [19006] = 2
    },
    PartyTopicDescription = "PartyTopic_Description_330101",
    PartyTopicId = 330101,
    PartyTopicName = "PartyTopic_Name_330101",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Maer_330101.story"
  },
  [330102] = {
    MemoryDescription = "PartyReward_Description_330102",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Maer_2.T_Entertainment_Maer_2'",
    MemoryName = "PartyReward_Name_330102",
    PartyTopicConsume = T.RT_7,
    PartyTopicDescription = "PartyTopic_Description_330102",
    PartyTopicId = 330102,
    PartyTopicName = "PartyTopic_Name_330102",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Maer_330102.story"
  },
  [330103] = {
    MemoryDescription = "PartyReward_Description_330103",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Maer_3.T_Entertainment_Maer_3'",
    MemoryName = "PartyReward_Name_330103",
    PartyTopicConsume = {
      [19004] = 8,
      [19006] = 8
    },
    PartyTopicDescription = "PartyTopic_Description_330103",
    PartyTopicId = 330103,
    PartyTopicName = "PartyTopic_Name_330103",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Maer_330103.story"
  },
  [330104] = {
    MemoryDescription = "PartyReward_Description_330104",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Maer_4.T_Entertainment_Maer_4'",
    MemoryName = "PartyReward_Name_330104",
    PartyTopicConsume = {
      [19001] = 10,
      [19002] = 10,
      [19005] = 10,
      [19008] = 10
    },
    PartyTopicDescription = "PartyTopic_Description_330104",
    PartyTopicId = 330104,
    PartyTopicName = "PartyTopic_Name_330104",
    PartyTopicReward = 7053,
    PartyTopicTalkId = "Invite/Maer_330104.story"
  },
  [410101] = {
    ConditionId = 100307,
    MemoryDescription = "PartyReward_Description_410101",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Lise_1.T_Entertainment_Lise_1'",
    MemoryName = "PartyReward_Name_410101",
    PartyTopicConsume = {
      [19002] = 3,
      [19006] = 3
    },
    PartyTopicDescription = "PartyTopic_Description_410101",
    PartyTopicId = 410101,
    PartyTopicName = "PartyTopic_Name_410101",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Lise_410101.story"
  },
  [410102] = {
    MemoryDescription = "PartyReward_Description_410102",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Lise_2.T_Entertainment_Lise_2'",
    MemoryName = "PartyReward_Name_410102",
    PartyTopicConsume = {
      [19005] = 6,
      [19007] = 6
    },
    PartyTopicDescription = "PartyTopic_Description_410102",
    PartyTopicId = 410102,
    PartyTopicName = "PartyTopic_Name_410102",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Lise_410102.story"
  },
  [410103] = {
    MemoryDescription = "PartyReward_Description_410103",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Lise_3.T_Entertainment_Lise_3'",
    MemoryName = "PartyReward_Name_410103",
    PartyTopicConsume = {
      [19005] = 9,
      [19008] = 9
    },
    PartyTopicDescription = "PartyTopic_Description_410103",
    PartyTopicId = 410103,
    PartyTopicName = "PartyTopic_Name_410103",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Lise_410103.story"
  },
  [410201] = {
    PartyTopicConsume = T.RT_5,
    PartyTopicId = 410201,
    PartyTopicReward = 7051
  },
  [420101] = {
    PartyTopicConsume = T.RT_7,
    PartyTopicId = 420101,
    PartyTopicReward = 7051
  },
  [420201] = {
    MemoryDescription = "PartyReward_Description_420201",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Landi_1.T_Entertainment_Landi_1'",
    MemoryName = "PartyReward_Name_420201",
    PartyTopicConsume = T.RT_8,
    PartyTopicDescription = "PartyTopic_Description_420201",
    PartyTopicId = 420201,
    PartyTopicName = "PartyTopic_Name_420201",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Landi_420201.story"
  },
  [420202] = {
    MemoryDescription = "PartyReward_Description_420202",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Landi_2.T_Entertainment_Landi_2'",
    MemoryName = "PartyReward_Name_420202",
    PartyTopicConsume = {
      [19004] = 5,
      [19005] = 5,
      [19006] = 5,
      [19007] = 5
    },
    PartyTopicDescription = "PartyTopic_Description_420202",
    PartyTopicId = 420202,
    PartyTopicName = "PartyTopic_Name_420202",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Landi_420202.story"
  },
  [420203] = {
    MemoryDescription = "PartyReward_Description_420203",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Landi_3.T_Entertainment_Landi_3'",
    MemoryName = "PartyReward_Name_420203",
    PartyTopicConsume = T.RT_6,
    PartyTopicDescription = "PartyTopic_Description_420203",
    PartyTopicId = 420203,
    PartyTopicName = "PartyTopic_Name_420203",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Landi_420203.story"
  },
  [420204] = {
    MemoryDescription = "PartyReward_Description_420204",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Landi_4.T_Entertainment_Landi_4'",
    MemoryName = "PartyReward_Name_420204",
    PartyTopicConsume = {
      [19001] = 10,
      [19003] = 10,
      [19005] = 10,
      [19008] = 10
    },
    PartyTopicDescription = "PartyTopic_Description_420204",
    PartyTopicId = 420204,
    PartyTopicName = "PartyTopic_Name_420204",
    PartyTopicReward = 7053,
    PartyTopicTalkId = "Invite/Landi_420204.story"
  },
  [430101] = {
    ConditionId = 110109,
    MemoryDescription = "PartyReward_Description_430101",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Xibi_1.T_Entertainment_Xibi_1'",
    MemoryName = "PartyReward_Name_430101",
    PartyTopicConsume = {
      [19005] = 3,
      [19006] = 3
    },
    PartyTopicDescription = "PartyTopic_Description_430101",
    PartyTopicId = 430101,
    PartyTopicName = "PartyTopic_Name_430101",
    PartyTopicReward = 7054,
    PartyTopicTalkId = "Invite/Xibi_430101.story"
  },
  [430102] = {
    MemoryDescription = "PartyReward_Description_430102",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Xibi_2.T_Entertainment_Xibi_2'",
    MemoryName = "PartyReward_Name_430102",
    PartyTopicConsume = {
      [19002] = 6,
      [19004] = 6
    },
    PartyTopicDescription = "PartyTopic_Description_430102",
    PartyTopicId = 430102,
    PartyTopicName = "PartyTopic_Name_430102",
    PartyTopicReward = 7055,
    PartyTopicTalkId = "Invite/Xibi_430102.story"
  },
  [430103] = {
    MemoryDescription = "PartyReward_Description_430103",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Xibi_3.T_Entertainment_Xibi_3'",
    MemoryName = "PartyReward_Name_430103",
    PartyTopicConsume = {
      [19002] = 9,
      [19004] = 9,
      [19006] = 9,
      [19008] = 9
    },
    PartyTopicDescription = "PartyTopic_Description_430103",
    PartyTopicId = 430103,
    PartyTopicName = "PartyTopic_Name_430103",
    PartyTopicReward = 7056,
    PartyTopicTalkId = "Invite/Xibi_430103.story"
  },
  [510101] = {
    MemoryDescription = "PartyReward_Description_510101",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Songlu_1.T_Entertainment_Songlu_1'",
    MemoryName = "PartyReward_Name_510101",
    PartyTopicConsume = {
      [19001] = 2,
      [19006] = 2
    },
    PartyTopicDescription = "PartyTopic_Description_510101",
    PartyTopicId = 510101,
    PartyTopicName = "PartyTopic_Name_510101",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Songlu_510101.story"
  },
  [510102] = {
    MemoryDescription = "PartyReward_Description_510102",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Songlu_2.T_Entertainment_Songlu_2'",
    MemoryName = "PartyReward_Name_510102",
    PartyTopicConsume = {
      [19002] = 5,
      [19004] = 5,
      [19007] = 5,
      [19008] = 5
    },
    PartyTopicDescription = "PartyTopic_Description_510102",
    PartyTopicId = 510102,
    PartyTopicName = "PartyTopic_Name_510102",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Songlu_510102.story"
  },
  [510103] = {
    MemoryDescription = "PartyReward_Description_510103",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Songlu_3.T_Entertainment_Songlu_3'",
    MemoryName = "PartyReward_Name_510103",
    PartyTopicConsume = {
      [19001] = 8,
      [19005] = 8,
      [19006] = 8
    },
    PartyTopicDescription = "PartyTopic_Description_510103",
    PartyTopicId = 510103,
    PartyTopicName = "PartyTopic_Name_510103",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Songlu_510103.story"
  },
  [510104] = {
    MemoryDescription = "PartyReward_Description_510104",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Songlu_4.T_Entertainment_Songlu_4'",
    MemoryName = "PartyReward_Name_510104",
    PartyTopicConsume = {
      [19005] = 8,
      [19007] = 8,
      [19008] = 8
    },
    PartyTopicDescription = "PartyTopic_Description_510104",
    PartyTopicId = 510104,
    PartyTopicName = "PartyTopic_Name_510104",
    PartyTopicReward = 7053,
    PartyTopicTalkId = "Invite/Songlu_510104.story"
  },
  [510201] = {
    MemoryDescription = "PartyReward_Description_510201",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Aote_1.T_Entertainment_Aote_1'",
    MemoryName = "PartyReward_Name_510201",
    PartyTopicConsume = T.RT_8,
    PartyTopicDescription = "PartyTopic_Description_510201",
    PartyTopicId = 510201,
    PartyTopicName = "PartyTopic_Name_510201",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Aote_510201.story"
  },
  [510202] = {
    MemoryDescription = "PartyReward_Description_510202",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Aote_2.T_Entertainment_Aote_2'",
    MemoryName = "PartyReward_Name_510202",
    PartyTopicConsume = {
      [19004] = 5,
      [19006] = 5
    },
    PartyTopicDescription = "PartyTopic_Description_510202",
    PartyTopicId = 510202,
    PartyTopicName = "PartyTopic_Name_510202",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Aote_510202.story"
  },
  [510203] = {
    MemoryDescription = "PartyReward_Description_510203",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Aote_3.T_Entertainment_Aote_3'",
    MemoryName = "PartyReward_Name_510203",
    PartyTopicConsume = {
      [19002] = 8,
      [19007] = 8
    },
    PartyTopicDescription = "PartyTopic_Description_510203",
    PartyTopicId = 510203,
    PartyTopicName = "PartyTopic_Name_510203",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Aote_510203.story"
  },
  [510204] = {
    MemoryDescription = "PartyReward_Description_510204",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Aote_4.T_Entertainment_Aote_4'",
    MemoryName = "PartyReward_Name_510204",
    PartyTopicConsume = {
      [19002] = 10,
      [19003] = 10,
      [19005] = 10
    },
    PartyTopicDescription = "PartyTopic_Description_510204",
    PartyTopicId = 510204,
    PartyTopicName = "PartyTopic_Name_510204",
    PartyTopicReward = 7053,
    PartyTopicTalkId = "Invite/Aote_510204.story"
  },
  [530101] = {
    ConditionId = 100208,
    MemoryDescription = "PartyReward_Description_530101",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Saiqi_1.T_Entertainment_Saiqi_1'",
    MemoryName = "PartyReward_Name_530101",
    PartyTopicConsume = {
      [19002] = 3,
      [19005] = 3,
      [19006] = 3
    },
    PartyTopicDescription = "PartyTopic_Description_530101",
    PartyTopicId = 530101,
    PartyTopicName = "PartyTopic_Name_530101",
    PartyTopicReward = 7054,
    PartyTopicTalkId = "Invite/Saiqi_530101.story"
  },
  [530102] = {
    MemoryDescription = "PartyReward_Description_530102",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Saiqi_2.T_Entertainment_Saiqi_2'",
    MemoryName = "PartyReward_Name_530102",
    PartyTopicConsume = {
      [19001] = 6,
      [19003] = 6,
      [19006] = 6,
      [19007] = 6
    },
    PartyTopicDescription = "PartyTopic_Description_530102",
    PartyTopicId = 530102,
    PartyTopicName = "PartyTopic_Name_530102",
    PartyTopicReward = 7055,
    PartyTopicTalkId = "Invite/Saiqi_530102.story"
  },
  [530103] = {
    MemoryDescription = "PartyReward_Description_530103",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Saiqi_3.T_Entertainment_Saiqi_3'",
    MemoryName = "PartyReward_Name_530103",
    PartyTopicConsume = {
      [19002] = 9,
      [19003] = 9,
      [19005] = 9,
      [19008] = 9
    },
    PartyTopicDescription = "PartyTopic_Description_530103",
    PartyTopicId = 530103,
    PartyTopicName = "PartyTopic_Name_530103",
    PartyTopicReward = 7056,
    PartyTopicTalkId = "Invite/Saiqi_530103.story"
  },
  [540101] = {
    MemoryDescription = "PartyReward_Description_540101",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Dafu_1.T_Entertainment_Dafu_1'",
    MemoryName = "PartyReward_Name_540101",
    PartyTopicConsume = {
      [19002] = 2,
      [19008] = 2
    },
    PartyTopicDescription = "PartyTopic_Description_540101",
    PartyTopicId = 540101,
    PartyTopicName = "PartyTopic_Name_540101",
    PartyTopicReward = 7050,
    PartyTopicTalkId = "Invite/Dafu_540101.story"
  },
  [540102] = {
    MemoryDescription = "PartyReward_Description_540102",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Dafu_2.T_Entertainment_Dafu_2'",
    MemoryName = "PartyReward_Name_540102",
    PartyTopicConsume = {
      [19002] = 5,
      [19003] = 5,
      [19004] = 5
    },
    PartyTopicDescription = "PartyTopic_Description_540102",
    PartyTopicId = 540102,
    PartyTopicName = "PartyTopic_Name_540102",
    PartyTopicReward = 7051,
    PartyTopicTalkId = "Invite/Dafu_540102.story"
  },
  [540103] = {
    MemoryDescription = "PartyReward_Description_540103",
    MemoryIconPath = "Texture2D'/Game/UI/Texture/Dynamic/Atlas/Prop/Entertainment/T_Entertainment_Dafu_3.T_Entertainment_Dafu_3'",
    MemoryName = "PartyReward_Name_540103",
    PartyTopicConsume = {
      [19005] = 8,
      [19008] = 8
    },
    PartyTopicDescription = "PartyTopic_Description_540103",
    PartyTopicId = 540103,
    PartyTopicName = "PartyTopic_Name_540103",
    PartyTopicReward = 7052,
    PartyTopicTalkId = "Invite/Dafu_540103.story"
  }
})
