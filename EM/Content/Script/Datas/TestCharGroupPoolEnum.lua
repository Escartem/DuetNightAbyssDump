local T = {}
T.RT_1 = {
  [102401] = 1020502,
  [104201] = 1010203
}
T.RT_2 = {
  [101101] = 1010101
}
T.RT_3 = {
  [102401] = 1020502,
  [103101] = 1020203
}
T.RT_4 = {
  [102301] = 1010101,
  [104201] = 1010203
}
T.RT_5 = {
  [104201] = 1010203
}
T.RT_6 = {
  [102301] = 1010101,
  [103101] = 1020203
}
T.RT_7 = {
  [102301] = 1010101,
  [102401] = 1020502
}
T.RT_8 = {
  [102101] = 1010201,
  [103101] = 1020203
}
T.RT_9 = {
  [102101] = 1010201,
  [102401] = 1020502
}
T.RT_10 = {
  [102101] = 1010201,
  [102301] = 1010101
}
T.RT_11 = {
  [101101] = 1010101,
  [103101] = 1020203
}
T.RT_12 = {
  [101101] = 1010101,
  [102401] = 1020502
}
T.RT_13 = {
  [101101] = 1010101,
  [102301] = 1010101
}
T.RT_14 = {
  [101101] = 1010101,
  [102101] = 1010201
}
T.RT_15 = {
  [103101] = 1020203
}
T.RT_16 = {
  [102101] = 1010201,
  [104201] = 1010203
}
T.RT_17 = {
  [101101] = 1010101,
  [104201] = 1010203
}
T.RT_18 = {
  [103101] = 1020203,
  [104201] = 1010203
}
T.RT_19 = {
  [102401] = 1020502
}
T.RT_20 = {
  [102301] = 1010101
}
T.RT_21 = {
  [102101] = 1010201
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("TestCharGroupPoolEnum", {
  [1] = {
    [1] = {
      CharInfo = T.RT_2,
      PhantomInfo = T.RT_10
    },
    [2] = {
      CharInfo = T.RT_2,
      PhantomInfo = T.RT_9
    },
    [3] = {
      CharInfo = T.RT_2,
      PhantomInfo = T.RT_8
    },
    [4] = {
      CharInfo = T.RT_2,
      PhantomInfo = T.RT_16
    },
    [5] = {
      CharInfo = T.RT_2,
      PhantomInfo = T.RT_7
    },
    [6] = {
      CharInfo = T.RT_2,
      PhantomInfo = T.RT_6
    },
    [7] = {
      CharInfo = T.RT_2,
      PhantomInfo = T.RT_4
    },
    [8] = {
      CharInfo = T.RT_2,
      PhantomInfo = T.RT_3
    },
    [9] = {
      CharInfo = T.RT_2,
      PhantomInfo = T.RT_1
    },
    [10] = {
      CharInfo = T.RT_2,
      PhantomInfo = T.RT_18
    },
    [11] = {
      CharInfo = T.RT_21,
      PhantomInfo = T.RT_13
    },
    [12] = {
      CharInfo = T.RT_21,
      PhantomInfo = T.RT_12
    },
    [13] = {
      CharInfo = T.RT_21,
      PhantomInfo = T.RT_11
    },
    [14] = {
      CharInfo = T.RT_21,
      PhantomInfo = T.RT_17
    },
    [15] = {
      CharInfo = T.RT_21,
      PhantomInfo = T.RT_7
    },
    [16] = {
      CharInfo = T.RT_21,
      PhantomInfo = T.RT_6
    },
    [17] = {
      CharInfo = T.RT_21,
      PhantomInfo = T.RT_4
    },
    [18] = {
      CharInfo = T.RT_21,
      PhantomInfo = T.RT_3
    },
    [19] = {
      CharInfo = T.RT_21,
      PhantomInfo = T.RT_1
    },
    [20] = {
      CharInfo = T.RT_21,
      PhantomInfo = T.RT_18
    },
    [21] = {
      CharInfo = T.RT_20,
      PhantomInfo = T.RT_14
    },
    [22] = {
      CharInfo = T.RT_20,
      PhantomInfo = T.RT_12
    },
    [23] = {
      CharInfo = T.RT_20,
      PhantomInfo = T.RT_11
    },
    [24] = {
      CharInfo = T.RT_20,
      PhantomInfo = T.RT_17
    },
    [25] = {
      CharInfo = T.RT_20,
      PhantomInfo = T.RT_9
    },
    [26] = {
      CharInfo = T.RT_20,
      PhantomInfo = T.RT_8
    },
    [27] = {
      CharInfo = T.RT_20,
      PhantomInfo = T.RT_16
    },
    [28] = {
      CharInfo = T.RT_20,
      PhantomInfo = T.RT_3
    },
    [29] = {
      CharInfo = T.RT_20,
      PhantomInfo = T.RT_1
    },
    [30] = {
      CharInfo = T.RT_20,
      PhantomInfo = T.RT_18
    },
    [31] = {
      CharInfo = T.RT_19,
      PhantomInfo = T.RT_14
    },
    [32] = {
      CharInfo = T.RT_19,
      PhantomInfo = T.RT_13
    },
    [33] = {
      CharInfo = T.RT_19,
      PhantomInfo = T.RT_11
    },
    [34] = {
      CharInfo = T.RT_19,
      PhantomInfo = T.RT_17
    },
    [35] = {
      CharInfo = T.RT_19,
      PhantomInfo = T.RT_10
    },
    [36] = {
      CharInfo = T.RT_19,
      PhantomInfo = T.RT_8
    },
    [37] = {
      CharInfo = T.RT_19,
      PhantomInfo = T.RT_16
    },
    [38] = {
      CharInfo = T.RT_19,
      PhantomInfo = T.RT_6
    },
    [39] = {
      CharInfo = T.RT_19,
      PhantomInfo = T.RT_4
    },
    [40] = {
      CharInfo = T.RT_19,
      PhantomInfo = T.RT_18
    },
    [41] = {
      CharInfo = T.RT_15,
      PhantomInfo = T.RT_14
    },
    [42] = {
      CharInfo = T.RT_15,
      PhantomInfo = T.RT_13
    },
    [43] = {
      CharInfo = T.RT_15,
      PhantomInfo = T.RT_12
    },
    [44] = {
      CharInfo = T.RT_15,
      PhantomInfo = T.RT_17
    },
    [45] = {
      CharInfo = T.RT_15,
      PhantomInfo = T.RT_10
    },
    [46] = {
      CharInfo = T.RT_15,
      PhantomInfo = T.RT_9
    },
    [47] = {
      CharInfo = T.RT_15,
      PhantomInfo = T.RT_16
    },
    [48] = {
      CharInfo = T.RT_15,
      PhantomInfo = T.RT_7
    },
    [49] = {
      CharInfo = T.RT_15,
      PhantomInfo = T.RT_4
    },
    [50] = {
      CharInfo = T.RT_15,
      PhantomInfo = T.RT_1
    },
    [51] = {
      CharInfo = T.RT_5,
      PhantomInfo = T.RT_14
    },
    [52] = {
      CharInfo = T.RT_5,
      PhantomInfo = T.RT_13
    },
    [53] = {
      CharInfo = T.RT_5,
      PhantomInfo = T.RT_12
    },
    [54] = {
      CharInfo = T.RT_5,
      PhantomInfo = T.RT_11
    },
    [55] = {
      CharInfo = T.RT_5,
      PhantomInfo = T.RT_10
    },
    [56] = {
      CharInfo = T.RT_5,
      PhantomInfo = T.RT_9
    },
    [57] = {
      CharInfo = T.RT_5,
      PhantomInfo = T.RT_8
    },
    [58] = {
      CharInfo = T.RT_5,
      PhantomInfo = T.RT_7
    },
    [59] = {
      CharInfo = T.RT_5,
      PhantomInfo = T.RT_6
    },
    [60] = {
      CharInfo = T.RT_5,
      PhantomInfo = T.RT_3
    }
  }
})
