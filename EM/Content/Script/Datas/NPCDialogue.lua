local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("NPCDialogue", {
  [21000101] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiBB/Animation/Montage/Interactive/NPC_BaiBB_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    Content = "UI_Bai_Beibao_Start",
    DialogueID = 21000101,
    MontageSection = "Start"
  },
  [21000102] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiBB/Animation/Montage/Interactive/NPC_BaiBB_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0,
    Content = "UI_Bai_Beibao_Finish",
    DialogueID = 21000102,
    MontageSection = "Finish"
  },
  [21000201] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiDZ/Animation/Montage/Interactive/NPC_BaiDZ_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    DialogueID = 21000201,
    MontageSection = "Start"
  },
  [21000202] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiDZ/Animation/Montage/Interactive/Npc_BaiDZ_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0,
    DialogueID = 21000202,
    MontageSection = "Task"
  },
  [21000203] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiDZ/Animation/Montage/Interactive/Npc_BaiDZ_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0,
    DialogueID = 21000203,
    MontageSection = "End"
  },
  [21000301] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiSD/Animation/Montage/Interactive/NPC_BaiSD_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    DialogueID = 21000301,
    MontageSection = "Write"
  },
  [21000302] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiSD/Animation/Montage/Interactive/NPC_BaiSD_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0,
    DialogueID = 21000302,
    MontageSection = "Idle02"
  },
  [21000303] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiSD/Animation/Montage/Interactive/NPC_BaiSD_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    DialogueID = 21000303,
    MontageSection = "Idle02"
  },
  [21000304] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiSD/Animation/Montage/Interactive/NPC_BaiSD_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0,
    DialogueID = 21000304,
    MontageSection = "Idle02"
  },
  [21000401] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiTX/Animation/Montage/Interactive/NPC_BaiTX_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    DialogueID = 21000401,
    MontageSection = "Start02"
  },
  [21000402] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiTX/Animation/Montage/Interactive/NPC_BaiTX_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0,
    DialogueID = 21000402,
    MontageSection = "End"
  },
  [21000501] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiTX/Animation/Montage/Interactive/NPC_BaiTX_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    DialogueID = 21000501,
    MontageSection = "Start03"
  },
  [21000502] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiTX/Animation/Montage/Interactive/NPC_BaiTX_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0,
    DialogueID = 21000502,
    MontageSection = "End02"
  },
  [21000503] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiTX/Animation/Montage/Interactive/NPC_BaiTX_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0.2,
    DialogueID = 21000503,
    MontageSection = "Start02"
  },
  [21000504] = {
    ActionMontage = "/Game/Asset/Char/Npc/NPC_BaiTX/Animation/Montage/Interactive/NPC_BaiTX_Performance_Montage",
    BlendInTime = 0.2,
    BlendOutTime = 0,
    DialogueID = 21000504,
    MontageSection = "End"
  }
})
