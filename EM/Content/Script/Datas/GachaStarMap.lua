local T = {}
T.RT_1 = {}
T.RT_2 = {Count = 1, Weight = -1}
T.RT_3 = {
  [1] = T.RT_2
}
T.RT_4 = {
  [10005] = T.RT_3,
  [10006] = T.RT_3,
  [10007] = T.RT_3,
  [10008] = T.RT_3,
  [30004] = T.RT_3
}
T.RT_5 = {Count = 1, Weight = 3000}
T.RT_6 = {
  [1] = T.RT_5
}
T.RT_7 = {Count = 1, Weight = 2000}
T.RT_8 = {
  [1] = T.RT_7
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("GachaStarMap", {
  Gacha = T.RT_1,
  SkinGacha = {
    [9001] = {
      [2] = {
        Star3 = T.RT_1,
        Star4 = T.RT_1,
        Star5 = {
          [210102] = T.RT_8,
          [510101] = T.RT_8
        },
        Up4 = T.RT_1,
        Up5 = T.RT_1,
        UpSum4 = 0,
        UpSum5 = 0
      },
      [3] = {
        Star3 = T.RT_1,
        Star4 = T.RT_1,
        Star5 = {
          [3010301] = T.RT_6,
          [3010402] = T.RT_6
        },
        Up4 = T.RT_1,
        Up5 = T.RT_1,
        UpSum4 = 0,
        UpSum5 = 0
      },
      [4] = {
        Star3 = T.RT_4,
        Star4 = {
          [10001] = T.RT_3,
          [10002] = T.RT_3,
          [10003] = T.RT_3,
          [10004] = T.RT_3,
          [10021] = T.RT_3,
          [10022] = T.RT_3,
          [10023] = T.RT_3,
          [10032] = T.RT_3,
          [20002] = T.RT_3,
          [20003] = T.RT_3,
          [20004] = T.RT_3,
          [20008] = T.RT_3,
          [20009] = T.RT_3,
          [20010] = T.RT_3,
          [20011] = T.RT_3,
          [20012] = T.RT_3,
          [20013] = T.RT_3,
          [20014] = T.RT_3,
          [20015] = T.RT_3,
          [20021] = T.RT_3,
          [20022] = T.RT_3,
          [20023] = T.RT_3,
          [20024] = T.RT_3,
          [20035] = T.RT_3
        },
        Star5 = T.RT_1,
        Up4 = T.RT_1,
        Up5 = T.RT_1,
        UpSum4 = 0,
        UpSum5 = 0
      }
    },
    [9002] = {
      [2] = {
        Star3 = T.RT_1,
        Star4 = T.RT_1,
        Star5 = {
          [530101] = {
            [1] = {Count = 1, Weight = 4500}
          }
        },
        Up4 = T.RT_1,
        Up5 = T.RT_1,
        UpSum4 = 0,
        UpSum5 = 0
      },
      [4] = {
        Star3 = T.RT_4,
        Star4 = {
          [10001] = T.RT_3,
          [10002] = T.RT_3,
          [10003] = T.RT_3,
          [10004] = T.RT_3,
          [10021] = T.RT_3,
          [10022] = T.RT_3,
          [10023] = T.RT_3,
          [10032] = T.RT_3,
          [20002] = T.RT_3,
          [20003] = T.RT_3,
          [20004] = T.RT_3,
          [20008] = T.RT_3,
          [20009] = T.RT_3,
          [20010] = T.RT_3,
          [20011] = T.RT_3,
          [20012] = T.RT_3,
          [20013] = T.RT_3,
          [20014] = T.RT_3,
          [20015] = T.RT_3,
          [20021] = T.RT_3,
          [20022] = T.RT_3,
          [20023] = T.RT_3,
          [20024] = T.RT_3,
          [20035] = T.RT_3,
          [50002] = T.RT_3
        },
        Star5 = T.RT_1,
        Up4 = T.RT_1,
        Up5 = T.RT_1,
        UpSum4 = 0,
        UpSum5 = 0
      },
      [6] = {
        Star3 = T.RT_1,
        Star4 = T.RT_1,
        Star5 = {
          [111] = {
            [1] = {Count = 25, Weight = 4500},
            [2] = {Count = 50, Weight = 1000}
          }
        },
        Up4 = T.RT_1,
        Up5 = T.RT_1,
        UpSum4 = 0,
        UpSum5 = 0
      }
    }
  }
})
