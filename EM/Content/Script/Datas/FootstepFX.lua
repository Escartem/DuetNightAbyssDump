local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FootstepFX", {
  Common_SongluSummon = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    PhysicalSurface = "Common_SongluSummon"
  },
  Concrete = {
    EffectPath = "/Game/Asset/Effect/Niagara/Common/NS_Kong.NS_Kong",
    PhysicalSurface = "Concrete"
  },
  DeepWater = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/A_Common/NS_EastNai_FootSteps01.NS_EastNai_FootSteps01",
    PhysicalSurface = "DeepWater"
  },
  DeepWater_SongluSummon = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/A_Common/NS_ZZSteps_Water.NS_ZZSteps_Water",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/A_Common/NS_ZZSteps_Water.NS_ZZSteps_Water",
    PhysicalSurface = "DeepWater_SongluSummon"
  },
  Dirt = {
    EffectPath = "/Game/Asset/Effect/Niagara/Common/NS_Kong.NS_Kong",
    PhysicalSurface = "Dirt"
  },
  Glass = {
    EffectPath = "/Game/Asset/Effect/Niagara/Common/NS_Kong.NS_Kong",
    PhysicalSurface = "Glass"
  },
  Grass = {
    EffectPath = "NiagaraDataChannelAsset'/Game/Asset/Effect/Niagara/Player/A_Common/NDC/NDC_FootSteps_Dust.NDC_FootSteps_Dust'",
    PhysicalSurface = "Grass"
  },
  Grass_Bai = {
    EffectPath = "/Game/Asset/Effect/Niagara/NPC/Bai/NS_Bai_FootSteps_Dust.NS_Bai_FootSteps_Dust",
    PhysicalSurface = "Grass_Bai"
  },
  Grass_SongluSummon = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    PhysicalSurface = "Grass_SongluSummon"
  },
  Ice = {
    EffectPath = "/Game/Asset/Effect/Niagara/Common/NS_Kong.NS_Kong",
    PhysicalSurface = "Ice"
  },
  Ice_SongluSummon = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    PhysicalSurface = "Ice_SongluSummon"
  },
  Metal = {
    EffectPath = "/Game/Asset/Effect/Niagara/Common/NS_Kong.NS_Kong",
    PhysicalSurface = "Metal"
  },
  Metal_SongluSummon = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    PhysicalSurface = "Metal_SongluSummon"
  },
  Mud = {
    EffectPath = "NiagaraDataChannelAsset'/Game/Asset/Effect/Niagara/Player/A_Common/NDC/NDC_FootSteps_Mud.NDC_FootSteps_Mud'",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/A_Common/NS_FootSteps_MudWalk.NS_FootSteps_MudWalk",
    PhysicalSurface = "Mud"
  },
  Mud_L = {
    EffectPath = "/Game/Asset/Effect/Blueprint/Child/EF_BP_Decal_Footstep_Mud_L.EF_BP_Decal_Footstep_Mud_L",
    PhysicalSurface = "Mud_L"
  },
  Mud_R = {
    EffectPath = "/Game/Asset/Effect/Blueprint/Child/EF_BP_Decal_Footstep_Mud_R.EF_BP_Decal_Footstep_Mud_R",
    PhysicalSurface = "Mud_R"
  },
  Mud_SongluSummon = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    PhysicalSurface = "Mud_SongluSummon"
  },
  None = {
    EffectPath = "/Game/Asset/Effect/Niagara/Common/NS_Kong.NS_Kong",
    PhysicalSurface = "None"
  },
  None_Bai = {
    EffectPath = "/Game/Asset/Effect/Niagara/NPC/Bai/NS_Bai_FootSteps_Dust.NS_Bai_FootSteps_Dust",
    PhysicalSurface = "None_Bai"
  },
  None_SongluSummon = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    PhysicalSurface = "None_SongluSummon"
  },
  Sand = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/A_Common/NDC/NDC_FootSteps_Sand.NDC_FootSteps_Sand",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/A_Common/NS_FootSteps_SandWalk.NS_FootSteps_SandWalk",
    PhysicalSurface = "Sand"
  },
  SandSea = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/A_Common/NS_FootSteps_SandSeaWalk.NS_FootSteps_SandSeaWalk",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/A_Common/NS_FootSteps_SandSeaWalk.NS_FootSteps_SandSeaWalk",
    PhysicalSurface = "SandSea"
  },
  Sand_SongluSummon = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    PhysicalSurface = "Sand_SongluSummon"
  },
  Snow = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/A_Common/NDC/NDC_FootSteps_Snow.NDC_FootSteps_Snow",
    PhysicalSurface = "Snow"
  },
  Snow_Bai = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/A_Common/NDC/NDC_FootSteps_Snow.NDC_FootSteps_Snow",
    PhysicalSurface = "Snow_Bai"
  },
  Snow_SongluSummon = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    PhysicalSurface = "Snow_SongluSummon"
  },
  Water = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/A_Common/NDC/NDC_FootSteps_Water.NDC_FootSteps_Water",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/A_Common/NS_FootSteps_WaterWalk.NS_FootSteps_WaterWalk",
    PhysicalSurface = "Water"
  },
  Water_SongluSummon = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/A_Common/NS_ZZSteps_Water.NS_ZZSteps_Water",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/A_Common/NS_ZZSteps_Water.NS_ZZSteps_Water",
    PhysicalSurface = "Water_SongluSummon"
  },
  Wood = {
    EffectPath = "/Game/Asset/Effect/Niagara/Common/NS_Kong.NS_Kong",
    PhysicalSurface = "Wood"
  },
  Wood_SongluSummon = {
    EffectPath = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    EffectPathForSlowState = "/Game/Asset/Effect/Niagara/Player/Songlu/NS_Songlu_Skill02_Foot.NS_Songlu_Skill02_Foot",
    PhysicalSurface = "Wood_SongluSummon"
  }
})
