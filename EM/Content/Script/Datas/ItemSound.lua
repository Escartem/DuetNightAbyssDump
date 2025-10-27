local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("ItemSound", {
  SOUND_ITEM_BOOK = {
    ClickSound = "event:/ui/common/combat_bag_cell_place_common",
    DragSound = "event:/ui/common/combat_bag_cell_drag_common",
    EquipSound = "event:/ui/common/combat_bag_cell_place_common",
    PickSound = "event:/ui/common/pick_up_item",
    SoundKey = "SOUND_ITEM_BOOK"
  },
  SOUND_ITEM_CLOTH = {
    ClickSound = "event:/ui/common/combat_bag_cell_place_common",
    EquipSound = "event:/ui/common/equip_cloth",
    PickSound = "event:/ui/common/pick_up_item",
    SoundKey = "SOUND_ITEM_CLOTH"
  },
  SOUND_ITEM_CUTE = {
    ClickSound = "event:/ui/common/combat_bag_cell_place_common",
    EquipSound = "event:/ui/common/equip_cute",
    PickSound = "event:/ui/common/pick_up_item",
    SoundKey = "SOUND_ITEM_CUTE"
  },
  SOUND_ITEM_JEWELRY = {
    ClickSound = "event:/ui/common/combat_bag_cell_place_common",
    EquipSound = "event:/ui/common/equip_jewelry",
    PickSound = "event:/ui/common/pick_up_item",
    SoundKey = "SOUND_ITEM_JEWELRY"
  },
  SOUND_ITEM_LIQUID = {
    ClickSound = "event:/ui/common/combat_bag_cell_place_common",
    DragSound = "event:/ui/common/combat_bag_cell_drag_common",
    EquipSound = "event:/ui/common/combat_bag_cell_place_common",
    PickSound = "event:/ui/common/pick_up_item",
    SoundKey = "SOUND_ITEM_LIQUID"
  },
  SOUND_ITEM_METAL = {
    ClickSound = "event:/ui/common/combat_bag_cell_place_common",
    DragSound = "event:/ui/common/combat_bag_cell_drag_common",
    EquipSound = "event:/ui/common/combat_bag_cell_place_common",
    PickSound = "event:/ui/common/pick_up_item",
    SoundKey = "SOUND_ITEM_METAL"
  },
  SOUND_ITEM_MIHAN = {
    ClickSound = "event:/ui/common/item_click_mihan",
    SoundKey = "SOUND_ITEM_MIHAN"
  },
  SOUND_ITEM_MOD = {
    ClickSound = "event:/ui/armory/click_select_mod",
    DragSound = "event:/ui/common/combat_bag_cell_drag_common",
    EquipSound = "event:/ui/armory/click_select_mod_equip",
    PickSound = "event:/ui/common/pick_up_item",
    SoundKey = "SOUND_ITEM_MOD",
    UnequipSound = "event:/ui/armory/click_select_mod_unequip"
  },
  SOUND_ITEM_NORMAL = {
    ClickSound = "event:/ui/common/combat_bag_cell_place_common",
    DragSound = "event:/ui/common/combat_bag_cell_drag_common",
    EquipSound = "event:/ui/common/combat_bag_cell_place_common",
    PickSound = "event:/ui/common/pick_up_item",
    SoundKey = "SOUND_ITEM_NORMAL"
  },
  SOUND_ITEM_PAPER = {
    ClickSound = "event:/ui/common/combat_bag_cell_place_common",
    DragSound = "event:/ui/common/combat_bag_cell_drag_common",
    EquipSound = "event:/ui/common/combat_bag_cell_place_common",
    PickSound = "event:/ui/common/pick_up_item",
    SoundKey = "SOUND_ITEM_PAPER"
  },
  SOUND_ITEM_PET = {
    ClickSound = "event:/ui/common/click_select_pet",
    DragSound = "event:/ui/common/combat_bag_cell_drag_common",
    EquipSound = "event:/ui/common/equip_cute",
    SoundKey = "SOUND_ITEM_PET"
  },
  SOUND_ITEM_WEAPON = {
    ClickSound = "event:/ui/armory/click_select_weapon",
    DragSound = "event:/ui/common/combat_bag_cell_drag_common",
    EquipSound = "event:/ui/common/combat_bag_cell_place_common",
    PickSound = "event:/ui/common/pick_up_item",
    SoundKey = "SOUND_ITEM_WEAPON"
  },
  SOUND_RESOURCE_BULLET = {
    PickSound = "event:/ui/common/pick_up_magic_ball",
    SoundKey = "SOUND_RESOURCE_BULLET"
  },
  SOUND_RESOURCE_GOLD = {
    PickSound = "event:/ui/common/pick_up_gold",
    SoundKey = "SOUND_RESOURCE_GOLD"
  },
  SOUND_RESOURCE_GOLD_PAY = {
    ClickSound = "event:/ui/common/combat_bag_cell_place_common",
    PickSound = "event:/ui/common/pick_up_item",
    SoundKey = "SOUND_RESOURCE_GOLD_PAY"
  },
  SOUND_RESOURCE_HP = {
    PickSound = "event:/ui/common/pick_up_magic_ball",
    SoundKey = "SOUND_RESOURCE_HP"
  },
  SOUND_RESOURCE_MP = {
    SoundKey = "SOUND_RESOURCE_MP"
  }
})
