local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SubSound", {
  [1] = {
    CritSoundPath = "event:/sfx/common/player/hit/bullet/hit_cri",
    DeadSoundPath = "event:/sfx/common/player/hit/bullet/hit_death",
    MaterialSoundPath = "event:/sfx/common/player/hit/bullet/hit_material",
    SubSoundId = 1,
    TriggerSoundPath = "event:/sfx/common/player/hit/bullet/special_shield"
  },
  [2] = {
    CritSoundPath = "event:/sfx/common/player/hit/weapon/hit_cri",
    DeadSoundPath = "event:/sfx/common/player/hit/weapon/hit_death",
    MaterialSoundPath = "event:/sfx/common/player/hit/weapon/hit_material",
    SubSoundId = 2,
    TriggerSoundPath = "event:/sfx/common/player/hit/weapon/special_shield"
  },
  [3] = {
    MaterialSoundPath = "event:/sfx/common/player/hit/weapon/hit_material",
    SubSoundId = 3
  },
  [4] = {
    CritSoundPath = "event:/sfx/common/player/hit/bullet/hit_cri",
    DeadSoundPath = "event:/sfx/common/player/hit/bullet/hit_death",
    MaterialSoundPath = "event:/sfx/common/player/hit/bullet/hit_material_bow",
    SubSoundId = 4,
    TriggerSoundPath = "event:/sfx/common/player/hit/bullet/special_shield"
  },
  [5] = {
    CritSoundPath = "event:/sfx/common/player/hit/bullet/hit_cri",
    DeadSoundPath = "event:/sfx/common/player/hit/bullet/hit_death",
    SubSoundId = 5,
    TriggerSoundPath = "event:/sfx/common/player/hit/bullet/special_shield"
  },
  [6] = {
    MaterialSoundPath = "event:/sfx/weapon/Machinegun/Poxiao/hit_none",
    SubSoundId = 6
  },
  [7] = {
    CritSoundPath = "event:/sfx/common/player/hit/weapon/hit_cri",
    DeadSoundPath = "event:/sfx/common/player/hit/weapon/hit_death",
    SubSoundId = 7,
    TriggerSoundPath = "event:/sfx/common/player/hit/weapon/special_shield"
  },
  [11] = {
    DeadSoundPath = "event:/sfx/common/player/hit/weapon/hit_death",
    SubSoundId = 11
  },
  [51] = {
    CritSoundPath = "event:/sfx/common/player/hit/magic/fireairHit_Crihit",
    DeadSoundPath = "event:/sfx/common/player/hit/weapon/fireHit_death",
    SubSoundId = 51,
    TriggerSoundPath = "event:/sfx/common/player/hit/bullet/special_shield"
  },
  [52] = {
    DeadSoundPath = "event:/sfx/common/player/hit/bullet/hit_death",
    MaterialSoundPath = "event:/sfx/common/player/hit/bullet/hit_material",
    SubSoundId = 52
  },
  [53] = {
    DeadSoundPath = "event:/sfx/common/player/hit/weapon/hit_death",
    MaterialSoundPath = "event:/sfx/common/player/hit/weapon/hit_material",
    SubSoundId = 53
  },
  [54] = {
    DeadSoundPath = "event:/sfx/common/player/hit/bullet/hit_death",
    SubSoundId = 54
  },
  [101] = {
    MaterialSoundPath = "event:/sfx/common/enemy/hit/bullet_hit_material",
    SubSoundId = 101
  },
  [201] = {
    DeadSoundPath = "event:/sfx/common/player/hit/bullet/saiqi_hit_death",
    SubSoundId = 201
  }
})
