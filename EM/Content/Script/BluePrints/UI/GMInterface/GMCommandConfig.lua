local CommonUtils = require("Utils.CommonUtils")
local TipsPaths = {
  Common = "/Game/UI/UI_PC/GM/GM_Tips_Common_PC.GM_Tips_Common_PC_C",
  MultiInput = "/Game/UI/UI_PC/GM/GM_Tips_MultiInput_PC.GM_Tips_MultiInput_PC_C"
}
local GMCommandConfig = {
  text = "GM\230\140\135\228\187\164",
  mode = "menu",
  commands = {}
}
GMCommandConfig.commands = {
  {
    text = "\229\184\184\231\148\168",
    mode = "menu",
    commands = {}
  },
  {
    text = "\230\136\152\230\150\151",
    mode = "menu",
    commands = {}
  },
  {
    text = "UI",
    mode = "menu",
    commands = {}
  },
  {
    text = "\231\179\187\231\187\159",
    mode = "menu",
    commands = {}
  },
  {
    text = "\228\187\187\229\138\161",
    mode = "menu",
    commands = {}
  },
  {
    text = "\229\133\179\229\141\161",
    mode = "menu",
    commands = {}
  },
  {
    text = "\233\159\179\233\162\145",
    mode = "menu",
    commands = {}
  },
  {
    text = "\229\133\182\228\187\150",
    mode = "menu",
    commands = {}
  },
  {
    text = "\232\135\170\229\174\154\228\185\137",
    mode = "menu",
    commands = {}
  },
  {
    text = "ShowFlags",
    mode = "menu",
    commands = {}
  },
  {
    text = "\229\156\186\230\153\175",
    mode = "menu",
    commands = {}
  }
}
for i, v in ipairs(GMCommandConfig.commands) do
  GMCommandConfig.commands[v.text] = v
end
GMCommandConfig.commands["\229\184\184\231\148\168"].commands = {
  {
    text = "\230\159\165\231\156\139\229\191\171\230\141\183\233\148\174",
    mode = "menu",
    data_func = "GetHotKeyCmdObjs",
    widget_path = "/Game/UI/UI_PC/GM/GM_Tips_Hotkey_PC.GM_Tips_Hotkey_PC_C",
    parameters = {
      UIConst.GMTIPSHOTKEY,
      "GMTipsHotkey"
    }
  },
  {
    text = "\232\131\182\229\155\138\228\189\147\231\187\152\229\136\182",
    mode = "switch",
    var_name = "EnableDrawDebugSphere",
    callback = "SetDrawDebugSphere"
  },
  {
    text = "\232\174\190\231\189\174\232\167\146\232\137\178\228\189\141\231\189\174",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\228\191\157\229\173\152\229\189\147\229\137\141\228\189\141\231\189\174",
        mode = "button",
        callback = "SavePlayerWorldPos"
      },
      {
        text = "\229\161\171\229\133\165\228\191\157\229\173\152\231\154\132\228\189\141\231\189\174",
        mode = "button",
        callback = "FillInPlayerWorldPos",
        parameters = {
          "\232\174\190\231\189\174\232\167\146\232\137\178\228\189\141\231\189\174"
        }
      },
      {text = "X", mode = "edit"},
      {text = "Y", mode = "edit"},
      {text = "Z", mode = "edit"},
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "ModifyPlayerWorldPos"
      }
    }
  },
  {
    text = "\230\137\147\229\141\176\229\189\147\229\137\141\231\142\175\229\162\131",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\230\137\147\229\141\176\230\137\128\230\156\137\228\191\161\230\129\175",
        mode = "button",
        callback = "PrintEnvironment"
      },
      {
        text = "\230\137\147\229\141\176\231\142\169\229\174\182\228\191\161\230\129\175",
        mode = "button",
        callback = "PrintPlayerInfo"
      },
      {
        text = "\230\137\147\229\141\176\229\133\179\229\141\161\228\191\161\230\129\175",
        mode = "button",
        callback = "PrintLevelInfo"
      },
      {
        text = "\230\137\147\229\141\176\229\138\168\230\128\129\228\186\139\228\187\182\228\191\161\230\129\175",
        mode = "edit",
        callback = "PrintDynamicEventInfo"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "PrintDynamicEventInfo"
      }
    }
  },
  {
    text = "\229\188\128\229\144\175\229\138\168\230\128\129\228\186\139\228\187\182\229\185\182\228\188\160\233\128\129",
    mode = "menu",
    data_func = "GetDynCmdObjs",
    widget_path = TipsPaths.Common,
    commands = {
      {
        text = "\229\138\168\230\128\129\228\186\139\228\187\182ID",
        mode = "edit",
        callback = "ForceStartDynQuest"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "ForceStartDynQuest"
      }
    }
  },
  {
    text = "\229\138\168\231\148\187\230\160\185\232\191\144\229\138\168",
    mode = "switch",
    callback = "ModifyRootAnimation"
  },
  {
    text = "DrawCall\230\152\190\231\164\186",
    mode = "switch",
    callback = "SetDrawCallInfo"
  },
  {
    text = "\229\133\141\228\188\164",
    mode = "switch",
    callback = "SetPlayerInvincible"
  },
  {
    text = "\232\174\190\231\189\174LogMask",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\228\184\141\229\177\143\232\148\189\228\187\187\228\189\149Log",
        mode = "switch",
        var_name = "EnableOpenLogMask",
        callback = "SetLogMaskIsOpen"
      },
      {
        text = "LogMask Name",
        mode = "edit",
        callback = "UpdateLogMaskInfo"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "UpdateLogMaskInfo"
      }
    }
  },
  {
    text = "\230\137\147\229\141\176\231\142\169\229\174\182\229\189\147\229\137\141buff",
    mode = "button",
    callback = "PrintPlayerBuff"
  },
  {
    text = "\229\136\135\230\141\162\232\167\146\232\137\178",
    mode = "menu",
    data_func = "GetCharCmdObjs",
    widget_path = TipsPaths.Common,
    commands = {
      {
        text = "\232\167\146\232\137\178Id",
        mode = "edit",
        callback = "ChangeRole"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "ChangeRole"
      }
    }
  },
  {
    text = "\231\148\159\230\136\144\230\128\170\231\137\169",
    mode = "menu",
    data_func = "GetMonsterCmdObjs",
    widget_path = "/Game/UI/UI_PC/GM/GM_Tips_Monster_PC.GM_Tips_Monster_PC_C",
    parameters = {
      UIConst.GMTIPSMONSTER,
      "GMTipsMonster"
    }
  },
  {
    text = "\229\136\135\230\141\162\230\173\166\229\153\168",
    mode = "menu",
    data_func = "GetWeaponCmdObjs",
    widget_path = TipsPaths.Common,
    commands = {
      {
        text = "\230\173\166\229\153\168Id",
        mode = "edit",
        callback = "ChangeWeapon"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "ChangeWeapon"
      }
    }
  },
  {
    text = "\232\186\171\228\189\147\229\139\190\232\190\185",
    mode = "switch",
    var_name = "EnableDrawOutline",
    callback = "SetOutlineEnabled"
  },
  {
    text = "\229\164\180\229\143\145\229\139\190\232\190\185",
    mode = "switch",
    var_name = "EnableDrawHairOutline",
    callback = "SetHairOutlineEnabled"
  },
  {
    text = "\230\157\144\232\180\168\232\190\185\231\188\152\229\133\137",
    mode = "switch",
    var_name = "EnableDrawMaterialCharacterRim",
    callback = "SetMaterialCharacterRimEnabled"
  },
  {
    text = "\229\144\142\229\164\132\231\144\134\232\190\185\231\188\152\229\133\137",
    mode = "switch",
    var_name = "EnableDrawPostProcessCharacterRim",
    callback = "SetPostProcessCharacterRimEnabled"
  },
  {
    text = "\232\167\146\232\137\178\231\155\184\230\156\186Dither",
    mode = "switch",
    var_name = "EnableCharacterDither",
    callback = "SetCharacterDitherEnabled"
  },
  {
    text = "\230\184\133\233\153\164\228\187\187\229\138\161",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm CleanAllQuest"
    }
  },
  {
    text = "\232\135\170\229\138\168\229\164\141\228\189\141\231\155\184\230\156\186Pitch",
    mode = "switch",
    var_name = "AutoResetCameraPitch",
    callback = "SetAutoResetCameraPitch"
  },
  {
    text = "\232\135\170\229\138\168\229\164\141\228\189\141\229\188\185\231\176\167\232\135\130",
    mode = "switch",
    var_name = "AutoResetSpringArm",
    callback = "SetAutoResetSpringArm"
  },
  {
    text = "\228\191\174\230\148\185\232\167\166\230\142\167\233\128\159\229\186\166",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "Pitch\233\128\159\231\142\135",
        mode = "edit",
        callback = "ChangeTouchPitchSpeed"
      },
      {
        text = "Yaw\233\128\159\231\142\135",
        mode = "edit",
        callback = "ChangeTouchYawSpeed"
      },
      {
        text = "Pitch\230\175\143\229\184\167\232\167\146\229\186\166\228\184\138\233\153\144",
        mode = "edit",
        callback = "ChangeTouchPitchLimit"
      },
      {
        text = "Yaw\230\175\143\229\184\167\232\167\146\229\186\166\228\184\138\233\153\144",
        mode = "edit",
        callback = "ChangeTouchYawLimit"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "ChangeTouchConfig"
      }
    }
  },
  {
    text = "\229\133\179\233\151\173\229\164\167\230\139\155\233\149\156\229\164\180CD",
    mode = "switch",
    var_name = "DisableSkillFeatureCD",
    callback = "SwitchSkillFeatureCD"
  },
  {
    text = "\232\167\163\233\148\129\229\140\186\229\159\159\228\188\160\233\128\129\231\130\185",
    mode = "switch",
    var_name = "UnlockRegionTeleport",
    callback = "UnlockRegionTeleport"
  },
  {
    text = "\231\186\166\230\157\159\231\155\184\230\156\186\229\174\189\233\171\152\230\175\148",
    mode = "switch",
    var_name = "EnableConstrainAspect",
    callback = "SetConstrainAspect"
  },
  {
    text = "\229\156\186\230\153\175\231\137\185\230\149\136\230\152\175\229\144\166\230\154\130\229\129\156",
    mode = "switch",
    var_name = "EnableFXPaused",
    callback = "SwitchFXPaused"
  }
}
GMCommandConfig.commands["\230\136\152\230\150\151"].commands = {
  {
    text = "\231\165\158",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"GM God"}
  },
  {
    text = "\229\185\189\231\129\181",
    mode = "switch",
    var_name = "EnableGhost",
    callback = "SetPlayerGhost"
  },
  {
    text = "\233\151\170\231\142\176",
    mode = "button",
    callback = "Teleport"
  },
  {
    text = "\229\133\141\228\188\164",
    mode = "switch",
    callback = "SetPlayerInvincible"
  },
  {
    text = "\229\133\141\230\142\167",
    mode = "switch",
    callback = "SetPlayerSuperArmor"
  },
  {
    text = "\230\151\160\233\153\144\229\173\144\229\188\185",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "GM MaxBullet"
    }
  },
  {
    text = "\230\151\160\233\153\144\230\148\187\229\135\187",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "GM MaxAttack"
    }
  },
  {
    text = "\230\151\160\233\153\144\233\152\178\229\190\161",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "GM MaxDefence"
    }
  },
  {
    text = "\230\151\160\233\153\144\232\131\189\233\135\143",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"GM MaxSp"}
  },
  {
    text = "\230\151\160\233\153\144\231\148\159\229\145\189",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"GM MaxHp"}
  },
  {
    text = "\233\135\141\231\189\174\230\138\128\232\131\189CD",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"GM RSCd"},
    close_gm = true
  },
  {
    text = "\229\133\179\233\151\173\228\188\164\229\174\179/\230\178\187\231\150\151",
    mode = "switch",
    callback = "ForbidDamage"
  },
  {
    text = "\229\133\179\233\151\173\232\161\168\231\142\176",
    mode = "switch",
    callback = "ForbidPlay"
  },
  {
    text = "\230\187\161\232\167\166\229\143\145\230\166\130\231\142\135",
    mode = "switch",
    callback = "MaxTriggerProbability"
  },
  {
    text = "\228\184\128\229\136\128\230\184\133\233\159\167",
    mode = "switch",
    callback = "ClearToughness"
  },
  {
    text = "\233\135\141\231\189\174\230\128\170\231\137\169\230\138\128\232\131\189CD",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "GM UpdateMonCd"
    }
  },
  {
    text = "\230\154\180\229\135\187\231\142\135\230\181\139\232\175\149",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\230\154\180\229\135\187\231\142\135",
        mode = "edit",
        callback = "SetCritRate"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "SetCritRate"
      }
    }
  },
  {
    text = "\230\137\147\229\141\176\228\188\164\229\174\179\232\175\166\231\187\134\228\191\161\230\129\175",
    mode = "switch",
    callback = "ShowDamageDetails"
  },
  {
    text = "\232\190\147\229\135\186\232\167\146\232\137\178\230\136\152\230\150\151\229\177\158\230\128\167\228\191\161\230\129\175",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "GM ShowRealAttr"
    }
  },
  {
    text = "\230\137\147\229\141\176\231\142\169\229\174\182\229\189\147\229\137\141buff",
    mode = "button",
    callback = "PrintPlayerBuff"
  },
  {
    text = "\230\137\147\229\141\176\231\142\169\229\174\182\229\177\158\230\128\167",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\229\177\158\230\128\167\229\144\141",
        mode = "edit",
        callback = "PrintPlayerAttr"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "PrintPlayerAttr"
      }
    }
  },
  {
    text = "\229\136\135\230\141\162\232\167\146\232\137\178",
    mode = "menu",
    data_func = "GetCharCmdObjs",
    widget_path = TipsPaths.Common,
    commands = {
      {
        text = "\232\167\146\232\137\178Id",
        mode = "edit",
        callback = "ChangeRole"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "ChangeRole"
      }
    }
  },
  {
    text = "\230\136\152\230\150\151\229\142\134\229\143\178\230\137\147\229\141\176",
    mode = "menu",
    widget_path = "/Game/UI/UI_PC/GM/WBP_GM_BattleHistory.WBP_GM_BattleHistory_C",
    parameters = {
      UIConst.GMBATTLEHISTORY,
      "GMTipsMonster"
    }
  },
  {
    text = "\231\148\159\230\136\144\230\128\170\231\137\169",
    mode = "menu",
    data_func = "GetMonsterCmdObjs",
    widget_path = "/Game/UI/UI_PC/GM/GM_Tips_Monster_PC.GM_Tips_Monster_PC_C",
    parameters = {
      UIConst.GMTIPSMONSTER,
      "GMTipsMonster"
    }
  },
  {
    text = "\230\157\128\230\137\128\230\156\137\230\149\140\230\150\185\230\128\170\231\137\169",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"GM KM"},
    close_gm = true
  },
  {
    text = "\232\135\170\230\157\128",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"GM KM self"},
    close_gm = true
  },
  {
    text = "\229\164\141\230\180\187",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "GM Recovery"
    },
    close_gm = true
  },
  {
    text = "Billboard\230\152\190\233\154\144",
    mode = "switch",
    var_name = "EnableShowBillboard",
    callback = "ShowOrHideBillboard"
  },
  {
    text = "\229\137\175\230\156\172\232\131\156\229\136\169",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm ExitBattle 1"
    },
    close_gm = true
  },
  {
    text = "\229\137\175\230\156\172\229\164\177\232\180\165",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm ExitBattle 0"
    },
    close_gm = true
  },
  {
    text = "\231\142\169\229\174\182\232\131\156\229\136\169",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm PlayerEnd 1"
    },
    close_gm = true
  },
  {
    text = "\231\142\169\229\174\182\229\164\177\232\180\165",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm PlayerEnd 0"
    },
    close_gm = true
  },
  {
    text = "\230\137\147\229\141\176\229\189\147\229\137\141\230\140\137\233\148\174\230\138\128\232\131\189",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm PrintSkill"
    }
  },
  {
    text = "\230\128\170\231\137\169\228\189\191\231\148\168\230\138\128\232\131\189",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {text = "\230\128\170\231\137\169ID", mode = "edit"},
      {
        text = "\230\138\128\232\131\189\229\186\143\229\143\183",
        mode = "edit"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "ReuseSkill"
      }
    }
  },
  {
    text = "\229\156\186\228\184\138\230\137\128\230\156\137\233\163\158\232\161\140\233\173\133\229\189\177\228\189\191\231\148\168\229\140\186\229\159\159\229\175\187\232\183\175\232\167\132\229\136\153",
    mode = "switch",
    var_name = "ForcePhantomUseRegionRule",
    callback = "SetPhantomForceUseRegionRule"
  },
  {
    text = "\229\136\155\229\187\186\233\173\133\229\189\177",
    mode = "menu",
    data_func = "GetCPCmdObjs",
    widget_path = TipsPaths.Common,
    commands = {
      {
        text = "Id \230\149\176\233\135\143 \232\161\140\228\184\186\230\160\145Id",
        mode = "edit",
        callback = "CreatePhantom"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "CreatePhantom"
      }
    }
  },
  {
    text = "\230\184\133\233\153\164\233\173\133\229\189\177",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm ClearPhantoms"
    }
  },
  {
    text = "\229\135\187\230\157\128\233\173\133\229\189\177",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm KillAllPhantoms"
    },
    close_gm = true
  },
  {
    text = "\229\136\155\229\187\186\229\143\172\229\148\164\231\137\169",
    mode = "menu",
    data_func = "GetCMSCmdObjs",
    widget_path = TipsPaths.Common,
    commands = {
      {
        text = "\229\143\172\229\148\164\231\137\169Id \230\149\176\233\135\143",
        mode = "edit",
        callback = "CreateMechanismSummon"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "CreateMechanismSummon"
      }
    }
  },
  {
    text = "\232\132\177\231\166\187\229\141\161\230\173\187",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"gm RL"}
  },
  {
    text = "\228\191\174\230\148\185\231\142\169\229\174\182\231\167\187\229\138\168\233\128\159\231\142\135",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\233\128\159\231\142\135",
        mode = "edit",
        callback = "SpeedUp"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "SpeedUp"
      }
    }
  },
  {
    text = "\231\167\187\229\138\168\229\136\176\233\152\178\229\174\136\229\135\186\229\143\145\231\130\185",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm StartBattle"
    }
  },
  {
    text = "\231\189\145\231\187\156|\230\168\161\230\139\159\229\187\182\232\191\159",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\229\187\182\232\191\159",
        mode = "edit",
        callback = "NetDelay"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "NetDelay"
      }
    }
  },
  {
    text = "\231\189\145\231\187\156|\230\168\161\230\139\159\229\187\182\232\191\159\230\179\162\229\138\168",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\230\179\162\229\138\168",
        mode = "edit",
        callback = "NetPktLagVariance"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "NetPktLagVariance"
      }
    }
  },
  {
    text = "\231\189\145\231\187\156|\228\184\162\229\140\133",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\230\166\130\231\142\135",
        mode = "edit",
        callback = "NetPktLoss"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "NetPktLoss"
      }
    }
  },
  {
    text = "\231\189\145\231\187\156|\228\185\177\229\186\143\229\143\145\229\140\133",
    mode = "button",
    widget_path = "/Game/UI/UI_PC/GM/GM_Tips_Common_PC.GM_Tips_Common_PC_C",
    callback = "NetPktOrder"
  },
  {
    text = "\231\189\145\231\187\156|\233\135\141\229\164\141\229\143\145\229\140\133",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\230\166\130\231\142\135",
        mode = "edit",
        callback = "NetPktDup"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "NetPktDup"
      }
    }
  }
}
GMCommandConfig.commands.UI.commands = {
  {
    text = "\229\136\135\230\141\162\231\149\140\233\157\162\230\168\161\229\188\143",
    mode = "menu",
    widget_path = "/Game/UI/UI_PC/GM/GM_Tips_Common_PC.GM_Tips_Common_PC_C",
    commands = {
      {
        text = "\231\171\175\230\184\184\230\168\161\229\188\143",
        mode = "button",
        callback = "SetUIShowModePC"
      },
      {
        text = "\230\137\139\230\184\184\230\168\161\229\188\143",
        mode = "button",
        callback = "SetUIShowModeMobile"
      }
    }
  },
  {
    text = "\229\177\143\229\185\149Message",
    mode = "switch",
    var_name = "EnableScreenMessages",
    callback = "SetShowScreenMessage"
  },
  {
    text = "\229\136\135\230\141\162\231\179\187\231\187\159\232\175\173\232\168\128",
    mode = "menu",
    widget_path = "/Game/UI/UI_PC/GM/GM_Tips_Common_PC.GM_Tips_Common_PC_C",
    commands = {
      {
        text = "\228\184\173\230\150\135",
        mode = "button",
        callback = "ChangeSysLanguage",
        parameters = {
          CommonConst.SystemLanguages.CN
        }
      },
      {
        text = "English",
        mode = "button",
        callback = "ChangeSysLanguage",
        parameters = {
          CommonConst.SystemLanguages.EN
        }
      }
    }
  },
  {
    text = "\232\174\190\231\189\174\231\149\140\233\157\162DPI\231\188\169\230\148\190",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "Scale",
        mode = "edit",
        callback = "SetDPIScale"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "SetDPIScale"
      }
    }
  },
  {
    text = "\233\154\144\232\151\143\231\137\185\229\174\154UI",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\231\149\140\233\157\162\229\144\141\231\167\176",
        mode = "edit",
        callback = "DoHideUI"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "DoHideUI"
      }
    }
  },
  {
    text = "\230\152\190\231\164\186\231\137\185\229\174\154UI",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\231\149\140\233\157\162\229\144\141\231\167\176",
        mode = "edit",
        callback = "DoShowUI"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "DoShowUI"
      }
    }
  },
  {
    text = "\229\143\170\230\152\190\231\164\186\231\137\185\229\174\154UI",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\231\149\140\233\157\162\229\144\141\231\167\176",
        mode = "edit",
        callback = "DoShowUIOnly",
        close_gm = true
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "DoShowUIOnly"
      }
    }
  },
  {
    text = "\230\152\190\231\164\186\230\128\170\231\137\169\230\140\135\229\188\149\231\130\185",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"gm smgi 1"}
  },
  {
    text = "\233\154\144\232\151\143\230\128\170\231\137\169\230\140\135\229\188\149\231\130\185",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"gm smgi 0"}
  },
  {
    text = "\233\154\144\232\151\143/\230\152\190\231\164\186\229\176\143\229\156\176\229\155\190",
    mode = "button",
    callback = "HideOrShowMiniMap"
  },
  {
    text = "\230\149\180\229\164\135\233\162\132\232\167\136\230\168\161\229\188\143",
    mode = "button",
    callback = "OpenPreviewArmory"
  },
  {
    text = "\230\136\144\229\176\177\231\179\187\231\187\159",
    mode = "switch",
    var_name = "EnableShowAchievement",
    callback = "ShowAchievement"
  },
  {
    text = "\232\183\179\229\173\151\230\152\190\233\154\144",
    mode = "switch",
    callback = "HideJumpWord"
  },
  {
    text = "\233\154\144\232\151\143GM\229\133\165\229\143\163(\231\167\187\229\138\168\231\171\175)",
    mode = "button",
    callback = "HideGMBtnInHUD"
  }
}
GMCommandConfig.commands["\231\179\187\231\187\159"].commands = {
  {
    text = "\232\142\183\229\190\151\230\137\128\230\156\137\232\167\146\232\137\178",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm aac"}
  },
  {
    text = "\232\142\183\229\190\151\230\137\128\230\156\137\232\167\146\232\137\178\229\140\133\229\144\171\230\156\170\229\164\150\230\148\190\231\154\132",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm aacf"}
  },
  {
    text = "\232\142\183\229\190\151\230\140\135\229\174\154\232\167\146\232\137\178",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\232\167\146\232\137\178id",
        mode = "edit",
        callback = "AddOneChar"
      },
      {
        text = "\231\173\137\231\186\167(\233\128\137\229\161\171)",
        mode = "edit"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "AddOneChar"
      }
    }
  },
  {
    text = "\229\136\160\233\153\164\230\140\135\229\174\154\232\167\146\232\137\178",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\232\167\146\232\137\178id",
        mode = "edit",
        callback = "DeleteOneChar"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "DeleteOneChar"
      }
    }
  },
  {
    text = "\232\174\190\231\189\174\229\189\147\229\137\141\232\167\146\232\137\178\231\154\132\231\173\137\231\186\167",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\231\173\137\231\186\167",
        mode = "edit",
        callback = "SetCharLevel"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "SetCharLevel"
      }
    }
  },
  {
    text = "\230\143\144\229\141\135\232\167\146\232\137\178\233\152\182\231\186\167",
    mode = "menu",
    widget_path = "/Game/UI/UI_PC/GM/GM_Tips_Common_PC.GM_Tips_Common_PC_C",
    commands = {
      {
        text = "\230\143\144\229\141\135\232\167\146\232\137\178\233\152\182\231\186\1671\231\186\167",
        mode = "button",
        callback = "SetCurrentCharGrade",
        parameters = {1}
      },
      {
        text = "\230\143\144\229\141\135\232\167\146\232\137\178\233\152\182\231\186\1672\231\186\167",
        mode = "button",
        callback = "SetCurrentCharGrade",
        parameters = {2}
      },
      {
        text = "\230\143\144\229\141\135\232\167\146\232\137\178\233\152\182\231\186\1673\231\186\167",
        mode = "button",
        callback = "SetCurrentCharGrade",
        parameters = {3}
      },
      {
        text = "\230\143\144\229\141\135\232\167\146\232\137\178\233\152\182\231\186\1674\231\186\167",
        mode = "button",
        callback = "SetCurrentCharGrade",
        parameters = {4}
      },
      {
        text = "\230\143\144\229\141\135\232\167\146\232\137\178\233\152\182\231\186\1675\231\186\167",
        mode = "button",
        callback = "SetCurrentCharGrade",
        parameters = {5}
      },
      {
        text = "\230\143\144\229\141\135\232\167\146\232\137\178\233\152\182\231\186\1676\231\186\167",
        mode = "button",
        callback = "SetCurrentCharGrade",
        parameters = {6}
      }
    }
  },
  {
    text = "\230\137\128\230\156\137\232\167\146\232\137\178\230\187\161\231\186\167",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm macml"}
  },
  {
    text = "\232\142\183\229\190\151\230\137\128\230\156\137\231\154\174\232\130\164",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm aas"}
  },
  {
    text = "\232\142\183\229\190\151\230\137\128\230\156\137\233\133\141\233\165\176",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm aad"}
  },
  {
    text = "\232\142\183\229\190\151\230\137\128\230\156\137\230\173\166\229\153\168",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm aaw"}
  },
  {
    text = "\232\142\183\229\190\151\230\137\128\230\156\137\230\173\166\229\153\168\229\140\133\229\144\171\230\156\170\229\164\150\230\148\190\231\154\132",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm aawf"}
  },
  {
    text = "\232\174\190\231\189\174\229\189\147\229\137\141\230\173\166\229\153\168\233\152\182\231\186\167",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\233\152\182\231\186\167",
        mode = "edit",
        callback = "scwg"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "scwg"
      }
    }
  },
  {
    text = "\229\136\160\233\153\164\230\137\128\230\156\137\230\173\166\229\153\168",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm daw"}
  },
  {
    text = "\230\137\128\230\156\137\230\173\166\229\153\168\230\187\161\231\186\167",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm mawml"}
  },
  {
    text = "\232\174\190\231\189\174\230\137\128\230\156\137\230\173\166\229\153\168\231\154\132\231\173\137\231\186\167",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\231\173\137\231\186\167",
        mode = "edit",
        callback = "sawl"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "sawl"
      }
    }
  },
  {
    text = "\232\174\190\231\189\174\230\137\128\230\156\137\230\173\166\229\153\168\233\152\182\231\186\167",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\233\152\182\231\186\167",
        mode = "edit",
        callback = "sawg"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "sawg"
      }
    }
  },
  {
    text = "\232\142\183\229\190\151\230\137\128\230\156\137\233\173\148\228\185\139\230\165\148",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm aam"}
  },
  {
    text = "\232\142\183\229\190\151\230\137\128\230\156\137\233\173\148\228\185\139\230\165\148\229\140\133\229\144\171\230\156\170\229\164\150\230\148\190\231\154\132",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm aamf"}
  },
  {
    text = "\232\142\183\229\190\151\229\164\167\233\135\143\233\147\156\229\184\129",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "sgm ar 101 100000000"
    }
  },
  {
    text = "\232\142\183\229\190\151\229\164\167\233\135\143\229\141\135\231\186\167\227\128\129\231\170\129\231\160\180\230\157\144\230\150\153",
    mode = "button",
    callback = "GetLevelUpResources",
    parameters = {1000}
  },
  {
    text = "\232\142\183\229\190\151\229\164\167\233\135\143\233\173\148\228\185\139\230\165\148\229\141\135\231\186\167\230\157\144\230\150\153",
    mode = "button",
    callback = "GetModLevelUpResources",
    parameters = {10000000}
  },
  {
    text = "\229\162\158\229\138\160\230\137\128\230\156\137\232\181\132\230\186\144",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm aar"}
  },
  {
    text = "\229\162\158\229\138\160\230\159\144\231\167\141\232\181\132\230\186\144",
    mode = "menu",
    data_func = "GetResourceCmdObjs",
    widget_path = TipsPaths.Common,
    commands = {
      {
        text = "\232\181\132\230\186\144Id \230\149\176\233\135\143",
        mode = "edit",
        callback = "AddResource"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "AddResource"
      }
    }
  },
  {
    text = "\231\148\159\230\136\144\230\142\137\232\144\189\231\137\169",
    mode = "menu",
    data_func = "GetDropCmdObjs",
    widget_path = TipsPaths.Common,
    commands = {
      {
        text = "\230\142\137\232\144\189\231\137\169Id \230\149\176\233\135\143",
        mode = "edit",
        callback = "GetDrop"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "GetDrop"
      }
    }
  },
  {
    text = "\232\142\183\229\190\151\230\137\128\230\156\137\229\174\160\231\137\169",
    mode = "button",
    callback = "GetAllPet"
  },
  {
    text = "\232\167\163\233\148\129\230\157\161\228\187\182",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\230\157\161\228\187\182Id",
        mode = "edit",
        callback = "CompleteCondition"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "CompleteCondition"
      }
    }
  },
  {
    text = "\232\167\163\233\148\129\231\179\187\231\187\159",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\231\179\187\231\187\159\229\144\141\231\167\176",
        mode = "edit",
        callback = "MockSystemCondition"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "MockSystemCondition"
      }
    }
  },
  {
    text = "\232\167\163\233\148\129\230\137\128\230\156\137\231\179\187\231\187\159",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm MockAllSystemCondition"
    }
  },
  {
    text = "\232\167\163\233\148\129\230\137\128\230\156\137\231\179\187\231\187\159(\230\156\141\229\138\161\231\171\175)",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm CompleteSystemCondition"
    }
  },
  {
    text = "\232\183\179\232\191\135\230\137\128\230\156\137\229\188\149\229\175\188",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm SuccessAllSystemGuide"
    }
  },
  {
    text = "\232\167\163\233\148\129\229\133\168\233\131\168\229\167\148\230\137\152\229\133\165\229\143\163",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm UnLockAllDungeonSelectLevels"
    }
  },
  {
    text = "\232\167\163\233\148\129\229\133\168\233\131\168\229\167\148\230\137\152\229\137\175\230\156\172",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm UnLockAllDungeonLevels"
    }
  },
  {
    text = "\230\137\147\229\141\176\230\149\153\229\173\166\230\137\139\229\134\140",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm PrintGuideBook"
    }
  },
  {
    text = "\233\162\134\229\143\150\230\140\135\229\174\154\230\149\153\229\173\166\229\165\150\229\138\177",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\230\149\153\229\173\166id",
        mode = "edit",
        callback = "GuideBookGetReward"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "GuideBookGetReward"
      }
    }
  },
  {
    text = "\229\174\140\230\136\144\230\137\128\230\156\137\228\187\187\229\138\161",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm saq"}
  },
  {
    text = "\232\174\190\231\189\174\231\142\169\229\174\182\231\173\137\231\186\167",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\231\173\137\231\186\167",
        mode = "edit",
        callback = "sl"
      },
      {
        text = "\230\137\167\232\161\140",
        mode = "button",
        callback = "sl"
      }
    }
  },
  {
    text = "\230\136\144\228\184\186\233\171\152\231\142\169",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm bhp"}
  },
  {
    text = "\232\167\163\233\148\129\230\128\170\231\137\169\229\155\190\233\137\180",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm UnlockMonsterGallery"
    }
  },
  {
    text = "\232\142\183\229\190\151\230\137\128\230\156\137\231\167\176\229\143\183",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm A:GmGetAllTitle()"
    }
  },
  {
    text = "\232\142\183\229\190\151\230\137\128\230\156\137\231\167\176\229\143\183\230\161\134",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm A:GmGetAllTitleFrame()"
    }
  },
  {
    text = "\232\142\183\229\190\151\230\137\128\230\156\137\229\164\180\229\131\143",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm aah"}
  },
  {
    text = "\232\142\183\229\190\151\230\137\128\230\156\137\229\164\180\229\131\143\230\161\134",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"sgm aahf"}
  }
}
GMCommandConfig.commands["\228\187\187\229\138\161"].commands = {}
GMCommandConfig.commands["\229\133\179\229\141\161"].commands = {
  {
    text = "\232\161\128\230\184\133/\231\187\180\231\148\159\229\128\188\228\184\128\231\155\180\230\187\161",
    mode = "switch",
    callback = "SwitchSurvivalValueChange"
  },
  {
    text = "\230\152\190\231\164\186\231\142\169\229\174\182\232\161\140\229\138\168\232\183\175\231\186\191",
    mode = "switch",
    callback = "RecordePlayerRoute"
  },
  {
    text = "\229\136\135\230\141\162\229\136\176\231\137\185\230\174\138\228\187\187\229\138\161\230\181\139\232\175\149\231\142\175\229\162\131",
    mode = "button",
    callback = "ChangeToSpecialQuestScene"
  },
  {
    text = "\229\188\128\229\167\13910000\229\143\183\231\137\185\230\174\138\228\187\187\229\138\161",
    mode = "button",
    callback = "StartSpecialQuest_10000"
  },
  {
    text = "\230\159\165\231\156\139\229\189\147\229\137\141\229\133\179\229\141\161\228\191\161\230\129\175",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm ScanLevel"
    }
  },
  {
    text = "\230\150\176\229\143\183\229\188\128\229\144\175\229\186\143\231\171\160\232\165\191\230\175\148\229\176\148BOSS\230\136\152",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm StartXibiBoss"
    }
  },
  {
    text = "\232\167\163\233\148\129\230\162\166\233\173\135\230\174\139\229\163\176\229\133\168\233\131\168\233\154\190\229\186\166",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm UnlockHardBoss true"
    }
  },
  {
    text = "\229\136\135\230\141\162\230\136\144\229\165\179\228\184\187",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm ChangeToMaster"
    }
  },
  {
    text = "\229\136\135\230\141\162\230\136\144\229\134\155\230\162\176\229\186\147\232\167\146\232\137\178",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm ChangeBackToHero"
    }
  },
  {
    text = "\233\152\178\229\190\161\230\160\184\229\191\131\230\151\160\230\149\140",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm DefCoreGod"
    }
  },
  {
    text = "\229\138\168\230\128\129\229\136\183\230\128\170\230\151\160\232\167\134\231\130\185\228\189\141\232\167\132\229\136\153",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"gm DMS"}
  },
  {
    text = "\230\152\190\231\164\186\229\138\168\230\128\129\229\136\183\230\128\170\230\151\165\229\191\151",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"gm DPMS"}
  },
  {
    text = "\230\137\147\229\141\176\230\137\128\230\156\137\229\186\143\229\136\151\229\140\150\230\149\176\230\141\174",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"gm RSS"}
  },
  {
    text = "\230\137\147\229\141\176\230\137\128\230\156\137\230\128\170\231\137\169\231\188\147\229\173\152\230\149\176\230\141\174",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"gm RMC"}
  },
  {
    text = "\230\137\147\229\141\176\230\137\128\230\156\137\233\157\153\230\128\129\229\136\183\230\150\176\231\130\185\230\149\176\230\141\174",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"gm RSC"}
  },
  {
    text = "\231\155\180\230\142\165\229\188\128\229\167\139\230\138\149\231\165\168",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm StartVote"
    },
    close_gm = true
  },
  {
    text = "\229\137\175\230\156\172\231\161\174\229\174\154\231\148\159\230\136\144\229\174\160\231\137\169\228\186\139\228\187\182\230\151\182\231\155\180\230\142\165\232\167\166\229\143\145\229\174\160\231\137\169\228\186\139\228\187\182",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm SpawnPet"
    },
    close_gm = true
  },
  {
    text = "\228\184\128\233\148\174\230\137\147\229\141\176\229\133\179\229\141\161\229\133\179\233\148\174\228\191\161\230\129\175",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm PrintLevelDebugInfo"
    }
  },
  {
    text = "\229\140\186\229\159\159\232\191\183\233\155\190\229\136\134\229\157\151",
    mode = "switch",
    var_name = "ShowRegionmapPane",
    callback = "ShowRegionmapPane"
  },
  {
    text = "\231\188\150\232\190\145\229\153\168\228\184\139\228\189\191\231\148\168\230\137\139\230\156\186\229\143\130\230\149\176",
    mode = "switch",
    var_name = "UseMapPhoneInPC",
    callback = "SetUseMapPhoneInPC"
  }
}
GMCommandConfig.commands["\233\159\179\233\162\145"].commands = {
  {
    text = "ListenerDebug\229\188\128\229\133\179",
    mode = "switch",
    var_name = "EnableAudioListenerDebug",
    callback = "SetAudioListenerDebugEnabled"
  },
  {
    text = "BGM\229\188\128\229\133\179",
    mode = "switch",
    var_name = "EnableBGM",
    callback = "SetBGMEnabled"
  },
  {
    text = "BGMDebug\229\188\128\229\133\179",
    mode = "switch",
    var_name = "BGMEnableDebug",
    callback = "SetBGMDebugEnabled"
  },
  {
    text = "\233\162\132\233\133\141\233\159\179\230\149\136\229\188\128\229\133\179",
    mode = "switch",
    var_name = "EnableEMPreviewSound",
    callback = "SetEMPreviewSoundEnabled"
  },
  {
    text = "\230\137\147\229\141\176BGM\228\191\161\230\129\175",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "GM PrintBGMInfo"
    }
  },
  {
    text = "\230\137\147\229\141\176Bus\233\159\179\233\135\143",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "GM GetAllBusVolume"
    }
  },
  {
    text = "\230\137\147\229\141\176Bus\230\154\130\229\129\156\231\138\182\230\128\129",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "GM GetAllBusPauseState"
    }
  },
  {
    text = "\233\135\141\230\150\176\229\138\160\232\189\189\230\137\128\230\156\137Bank",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "GM ReloadAllBank"
    }
  },
  {
    text = "DrawDebug\229\188\128\229\133\179",
    mode = "switch",
    var_name = "EnableDrawDebug",
    callback = "SetDrawDebugEnabled"
  },
  {
    text = "\233\159\179\230\186\144\231\130\185Debug\229\188\128\229\133\179",
    mode = "switch",
    var_name = "SoundPointCompDebugEnabled",
    callback = "SetSoundPointCompDebugEnabled"
  },
  {
    text = "Spline\230\176\180\229\159\159Debug\229\188\128\229\133\179",
    mode = "switch",
    var_name = "SoundSplineDrawDebug",
    callback = "SetSoundSplineDrawDebug"
  },
  {
    text = "\230\137\147\229\141\176\229\189\147\229\137\141Cache\231\154\132\229\163\176\233\159\179",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "GM ShowCacheSe"
    }
  },
  {
    text = "\230\137\147\229\188\128ReverbDebug",
    mode = "switch",
    var_name = "ReverbLogicDebug",
    callback = "SetReverbLogicDebug"
  },
  {
    text = "\229\189\147\229\137\141\230\152\175\229\144\166\230\143\146\229\133\165\232\128\179\230\156\186",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "GM PrintHeadPhonePlugIn"
    }
  },
  {
    text = "\230\137\147\229\188\128LineSoundDebug",
    mode = "switch",
    var_name = "LineSoundDebug",
    callback = "SetLineSoundDebug"
  },
  {
    text = "\230\137\147\229\188\128SectorSoundDebug",
    mode = "switch",
    var_name = "SectorSoundDebug",
    callback = "SetSectorSoundDebug"
  },
  {
    text = "\230\137\147\229\188\128CircularSoundDebug",
    mode = "switch",
    var_name = "CircularSoundDebug",
    callback = "SetCircularSoundDebug"
  }
}
GMCommandConfig.commands["\229\133\182\228\187\150"].commands = {
  {
    text = "TakeRecorder\229\189\149\229\136\182\232\174\190\231\189\174",
    mode = "switch",
    callback = "SetTakeRecorderCapture"
  },
  {
    text = "\230\136\170\229\155\190",
    mode = "menu",
    widget_path = "/Game/UI/UI_PC/GM/GM_Tips_Common_PC.GM_Tips_Common_PC_C",
    commands = {
      {
        text = "1280x720",
        mode = "button",
        callback = "ExecConsoleCommand",
        close_gm = true,
        parameters = {
          "HighResShot 1280x720"
        }
      },
      {
        text = "1920x1080",
        mode = "button",
        callback = "ExecConsoleCommand",
        close_gm = true,
        parameters = {
          "HighResShot 1920x1080"
        }
      },
      {
        text = "2560x1440",
        mode = "button",
        callback = "ExecConsoleCommand",
        close_gm = true,
        parameters = {
          "HighResShot 2560x1440"
        }
      },
      {
        text = "3840x2160",
        mode = "button",
        callback = "ExecConsoleCommand",
        close_gm = true,
        parameters = {
          "HighResShot 3840x2160"
        }
      }
    }
  },
  {
    text = "\230\137\147\229\141\176\229\134\133\229\173\152\230\138\165\229\145\138",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "memreport -full"
    }
  },
  {
    text = "\231\166\129\231\148\168PakCache",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "pakcache.enable 0"
    }
  },
  {
    text = "TAA",
    mode = "menu",
    widget_path = "/Game/UI/UI_PC/GM/GM_Tips_Common_PC.GM_Tips_Common_PC_C",
    commands = {
      {
        text = "\228\189\142",
        mode = "button",
        callback = "ChangeTAAQuality",
        parameters = {99}
      },
      {
        text = "\228\184\173",
        mode = "button",
        callback = "ChangeTAAQuality",
        parameters = {140}
      },
      {
        text = "\233\171\152",
        mode = "button",
        callback = "ChangeTAAQuality",
        parameters = {160}
      }
    }
  },
  {
    text = "DLSS",
    mode = "menu",
    widget_path = "/Game/UI/UI_PC/GM/GM_Tips_Common_PC.GM_Tips_Common_PC_C",
    commands = {
      {
        text = "\229\133\179\233\151\173",
        mode = "button",
        callback = "ChangeDLSSQuality",
        parameters = {0}
      },
      {
        text = "\232\135\170\229\138\168",
        mode = "button",
        callback = "ChangeDLSSQuality",
        parameters = {1}
      },
      {
        text = "\232\180\168\233\135\143",
        mode = "button",
        callback = "ChangeDLSSQuality",
        parameters = {2}
      },
      {
        text = "\229\185\179\232\161\161",
        mode = "button",
        callback = "ChangeDLSSQuality",
        parameters = {3}
      },
      {
        text = "\230\128\167\232\131\189",
        mode = "button",
        callback = "ChangeDLSSQuality",
        parameters = {4}
      },
      {
        text = "\232\182\133\231\186\167\230\128\167\232\131\189",
        mode = "button",
        callback = "ChangeDLSSQuality",
        parameters = {5}
      },
      {
        text = "DLAA",
        mode = "button",
        callback = "ChangeDLSSQuality",
        parameters = {6}
      }
    }
  },
  {
    text = "DLSS\229\184\167\231\148\159\230\136\144",
    mode = "menu",
    widget_path = "/Game/UI/UI_PC/GM/GM_Tips_Common_PC.GM_Tips_Common_PC_C",
    commands = {
      {
        text = "\229\133\179\233\151\173",
        mode = "button",
        callback = "ChangeDLSSFGQuality",
        parameters = {0}
      },
      {
        text = "\232\135\170\229\138\168",
        mode = "button",
        callback = "ChangeDLSSFGQuality",
        parameters = {1}
      },
      {
        text = "2X",
        mode = "button",
        callback = "ChangeDLSSFGQuality",
        parameters = {2}
      },
      {
        text = "3X",
        mode = "button",
        callback = "ChangeDLSSFGQuality",
        parameters = {3}
      },
      {
        text = "4X",
        mode = "button",
        callback = "ChangeDLSSFGQuality",
        parameters = {4}
      }
    }
  },
  {
    text = "\230\152\190\231\164\186\229\134\133\229\173\152\228\191\161\230\129\175",
    mode = "button",
    callback = "SetShowMemoryInfo"
  },
  {
    text = "SimpleRVT",
    mode = "switch",
    callback = "SwitchSimpleRuntimeTexture"
  },
  {
    text = "\230\137\139\230\156\186\231\171\175\232\189\175\228\187\182\229\137\148\233\153\164",
    mode = "switch",
    callback = "SwitchMobileSoftwareOcclusion"
  },
  {
    text = "\232\189\175\228\187\182\229\137\148\233\153\164\231\148\168\228\186\142Mask",
    mode = "switch",
    callback = "SwitchAllowSoftwareOcclusionForMask"
  },
  {
    text = "\232\189\175\228\187\182\229\137\148\233\153\164\229\143\175\232\167\129\230\128\167\232\176\131\232\175\149\232\167\134\229\155\190",
    mode = "switch",
    callback = "SwitchSoftwareOcclusionVisualizeBuffer"
  },
  {
    text = "\231\161\172\228\187\182\229\137\148\233\153\164",
    mode = "switch",
    var_name = "EnableHardwareOcclusion",
    callback = "SwitchHardwareOcclusion"
  },
  {
    text = "HZBOcclusion",
    mode = "switch",
    var_name = "EnableHZBOcclusion",
    callback = "SwitchHZBOcclusion"
  },
  {
    text = "stat unit",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"stat unit"}
  },
  {
    text = "stat memory",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "stat memory"
    }
  },
  {
    text = "stat levels",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "stat levels"
    }
  },
  {
    text = "StatLevelsColumnWidth",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "stats.StatLevelsColumnWidth 200"
    }
  },
  {
    text = "stat rhi",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"stat rhi"}
  },
  {
    text = "stat SceneRendering",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "stat SceneRendering"
    }
  },
  {
    text = "stat gpu",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {"stat gpu"}
  },
  {
    text = "\229\140\133\228\189\147\228\184\138\228\188\160PSO",
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "r.ShaderPipelineCache.Upload"
    }
  },
  {
    text = "DynamicShadows",
    mode = "switch",
    var_name = "EnableDynamicShadows",
    callback = "ShowFlags",
    parameters = {
      "DynamicShadows"
    }
  },
  {
    text = "GlobalIllumination",
    mode = "switch",
    var_name = "EnableGlobalIllumination",
    callback = "ShowFlags",
    parameters = {
      "GlobalIllumination"
    }
  },
  {
    text = "InstancedFoliage",
    mode = "switch",
    var_name = "EnableInstancedFoliage",
    callback = "ShowFlags",
    parameters = {
      "InstancedFoliage"
    }
  },
  {
    text = "InstancedGrass",
    mode = "switch",
    var_name = "EnableInstancedGrass",
    callback = "ShowFlags",
    parameters = {
      "InstancedGrass"
    }
  },
  {
    text = "PointLights",
    mode = "switch",
    var_name = "EnablePointLights",
    callback = "ShowFlags",
    parameters = {
      "PointLights"
    }
  },
  {
    text = "ReflectionEnvironment",
    mode = "switch",
    var_name = "EnableReflectionEnvironment",
    callback = "ShowFlags",
    parameters = {
      "ReflectionEnvironment"
    }
  },
  {
    text = "SkyLighting",
    mode = "switch",
    var_name = "EnableSkyLighting",
    callback = "ShowFlags",
    parameters = {
      "SkyLighting"
    }
  },
  {
    text = "VolumetricFog",
    mode = "switch",
    var_name = "EnableVolumetricFog",
    callback = "ShowFlags",
    parameters = {
      "VolumetricFog"
    }
  },
  {
    text = "DirectLighting",
    mode = "switch",
    var_name = "EnableDirectLighting",
    callback = "ShowFlags",
    parameters = {
      "DirectLighting"
    }
  },
  {
    text = "PostProcessing",
    mode = "switch",
    var_name = "EnablePostProcessing",
    callback = "ShowFlags",
    parameters = {
      "PostProcessing"
    }
  },
  {
    text = "Bloom",
    mode = "switch",
    var_name = "EnableBloom",
    callback = "ShowFlags",
    parameters = {"Bloom"}
  },
  {
    text = "Rendering",
    mode = "switch",
    var_name = "EnableRendering",
    callback = "ShowFlags",
    parameters = {"Rendering"}
  },
  {
    text = "Translucency",
    mode = "switch",
    var_name = "EnableTranslucency",
    callback = "ShowFlags",
    parameters = {
      "Translucency"
    }
  },
  {
    text = "\232\174\190\231\189\174\231\153\189\229\164\169",
    mode = "button",
    callback = "SetTimeOfDay",
    parameters = {"day"}
  },
  {
    text = "\232\174\190\231\189\174\230\153\154\228\184\138",
    mode = "button",
    callback = "SetTimeOfDay",
    parameters = {"night"}
  },
  {
    text = "\230\152\190\231\164\186\229\143\175\230\139\190\229\143\150\230\142\137\232\144\189\231\137\169",
    mode = "switch",
    var_name = "PrintPickupTriggerTick",
    callback = "PrintPickupTriggerTick"
  }
}
GMCommandConfig.commands["\232\135\170\229\174\154\228\185\137"].commands = {}
GMCommandConfig.commands.ShowFlags.commands = {}
GMCommandConfig.commands["\229\156\186\230\153\175"].commands = {
  {
    text = "\230\160\185\230\141\174\230\139\188\230\142\165\229\133\179\232\191\155\229\133\165\229\137\175\230\156\172",
    mode = "menu",
    widget_path = TipsPaths.MultiInput,
    commands = {
      {
        text = "\230\139\188\230\142\165\229\133\179\229\144\141\231\167\176",
        mode = "edit",
        callback = "FindDungeonForArtMap"
      },
      {
        text = "\232\191\155\229\133\165\229\137\175\230\156\172",
        mode = "button",
        callback = "FindDungeonForArtMap"
      }
    }
  }
}
local Keys = CommonUtils.Keys(DataMgr.GMIntegration)
table.sort(Keys)
for _, FunctionName in pairs(Keys) do
  local GMIntegrationData = DataMgr.GMIntegration[FunctionName]
  local GMTab = GMIntegrationData.GMTab or "\232\135\170\229\174\154\228\185\137"
  if not GMCommandConfig.commands[GMTab] then
    GMTab = "\232\135\170\229\174\154\228\185\137"
  end
  table.insert(GMCommandConfig.commands[GMTab].commands, {
    text = GMIntegrationData.GMDisplayName or FunctionName,
    mode = "button",
    callback = "ExecConsoleCommand",
    parameters = {
      "gm " .. FunctionName
    }
  })
end
for i, v in ipairs(GMCommandConfig.commands) do
  GMCommandConfig.commands[v.text] = nil
end
return GMCommandConfig
