local T = {}
T.RT_1 = {
  [1] = "vo_gain"
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("CharVoice2Gacha", {
  [1101] = {
    [1] = {
      [1] = {
        VoiceId = 10001,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Heitao_vo_gain"
        }
      }
    }
  },
  [1103] = {
    [1] = {
      [1] = {
        VoiceId = 10644,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Tuosi_vo_gain"
        }
      }
    }
  },
  [1501] = {
    [1] = {
      [1] = {
        VoiceId = 10866,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Baonu_vo_gain"
        }
      }
    }
  },
  [1502] = {
    [1] = {
      [1] = {
        VoiceId = 10550,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Nifu_vo_gain"
        }
      }
    }
  },
  [1503] = {
    [1] = {
      [1] = {
        VoiceId = 10749,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Kezhou_vo_gain"
        }
      }
    }
  },
  [1801] = {
    [1] = {
      [1] = {
        VoiceId = 10437,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Feina_vo_gain"
        }
      }
    }
  },
  [2101] = {
    [1] = {
      [1] = {
        VoiceId = 10037,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Shuimu_vo_gain"
        }
      }
    }
  },
  [2301] = {
    [1] = {
      [1] = {
        VoiceId = 10074,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Zhangyu_vo_gain"
        }
      }
    }
  },
  [3101] = {
    [1] = {
      [1] = {
        VoiceId = 10109,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Linen_vo_gain"
        }
      }
    }
  },
  [3102] = {
    [1] = {
      [1] = {
        VoiceId = 10141,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Xier_vo_gain"
        }
      }
    }
  },
  [3103] = {
    [1] = {
      [1] = {
        VoiceId = 10475,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Yeer_vo_gain"
        }
      }
    }
  },
  [3201] = {
    [1] = {
      [1] = {
        VoiceId = 10512,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Haier_vo_gain"
        }
      }
    }
  },
  [3301] = {
    [1] = {
      [1] = {
        VoiceId = 10394,
        VoiceRes = {
          [1] = "vo_gain_1"
        },
        VoiceText = {
          [1] = "voice_ch_char_Maer_vo_gain_1"
        }
      }
    },
    [2] = {
      [1] = {
        GachaVoiceCondition = {
          [1] = 6007
        },
        VoiceId = 10395,
        VoiceRes = {
          [1] = "vo_gain_2"
        },
        VoiceText = {
          [1] = "voice_ch_char_Maer_vo_gain_2"
        }
      }
    }
  },
  [4101] = {
    [1] = {
      [1] = {
        VoiceId = 10599,
        VoiceRes = {
          [1] = "vo_gain_01"
        },
        VoiceText = {
          [1] = "voice_ch_char_Lise_vo_gain_01"
        }
      }
    },
    [2] = {
      [1] = {
        GachaVoiceCondition = {
          [1] = 100307
        },
        VoiceId = 10600,
        VoiceRes = {
          [1] = "vo_gain_02"
        },
        VoiceText = {
          [1] = "voice_ch_char_Lise_vo_gain_02"
        }
      }
    }
  },
  [4102] = {
    [1] = {
      [1] = {
        VoiceId = 10826,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Zhiliu_vo_gain"
        }
      }
    }
  },
  [4201] = {
    [1] = {
      [1] = {
        VoiceId = 10182,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Yuming_vo_gain"
        }
      }
    }
  },
  [4202] = {
    [1] = {
      [1] = {
        VoiceId = 10326,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Landi_vo_gain"
        }
      }
    }
  },
  [4301] = {
    [1] = {
      [1] = {
        VoiceId = 10358,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Xibi_vo_gain"
        }
      }
    }
  },
  [5101] = {
    [1] = {
      [1] = {
        VoiceId = 10287,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Songlu_vo_gain"
        }
      }
    }
  },
  [5102] = {
    [1] = {
      [1] = {
        VoiceId = 10789,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Aote_vo_gain"
        }
      }
    }
  },
  [5301] = {
    [1] = {
      [1] = {
        VoiceId = 10212,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Saiqi_vo_gain"
        }
      }
    }
  },
  [5401] = {
    [1] = {
      [1] = {
        VoiceId = 10700,
        VoiceRes = T.RT_1,
        VoiceText = {
          [1] = "voice_ch_char_Dafu_vo_gain"
        }
      }
    }
  }
})
