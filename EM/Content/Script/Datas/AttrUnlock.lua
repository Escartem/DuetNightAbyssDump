local T = {}
T.RT_1 = {
  [1] = 500
}
T.RT_2 = {
  [1] = 101
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("AttrUnlock", {
  [110101] = {
    Amount = T.RT_1,
    AttrId = 110101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [110102] = {
    Amount = T.RT_1,
    AttrId = 110102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [110103] = {
    Amount = T.RT_1,
    AttrId = 110103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [110104] = {
    Amount = T.RT_1,
    AttrId = 110104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [110301] = {
    Amount = T.RT_1,
    AttrId = 110301,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [110302] = {
    Amount = T.RT_1,
    AttrId = 110302,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [110303] = {
    Amount = T.RT_1,
    AttrId = 110303,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [110304] = {
    Amount = T.RT_1,
    AttrId = 110304,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [150101] = {
    Amount = T.RT_1,
    AttrId = 150101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [150102] = {
    Amount = T.RT_1,
    AttrId = 150102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [150103] = {
    Amount = T.RT_1,
    AttrId = 150103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [150104] = {
    Amount = T.RT_1,
    AttrId = 150104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [150201] = {
    Amount = T.RT_1,
    AttrId = 150201,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [150202] = {
    Amount = T.RT_1,
    AttrId = 150202,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [150203] = {
    Amount = T.RT_1,
    AttrId = 150203,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [150204] = {
    Amount = T.RT_1,
    AttrId = 150204,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [150301] = {
    Amount = T.RT_1,
    AttrId = 150301,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [150302] = {
    Amount = T.RT_1,
    AttrId = 150302,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [150303] = {
    Amount = T.RT_1,
    AttrId = 150303,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [150304] = {
    Amount = T.RT_1,
    AttrId = 150304,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [180101] = {
    Amount = T.RT_1,
    AttrId = 180101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [180102] = {
    Amount = T.RT_1,
    AttrId = 180102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [180103] = {
    Amount = T.RT_1,
    AttrId = 180103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [180104] = {
    Amount = T.RT_1,
    AttrId = 180104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [210101] = {
    Amount = T.RT_1,
    AttrId = 210101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [210102] = {
    Amount = T.RT_1,
    AttrId = 210102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [210103] = {
    Amount = T.RT_1,
    AttrId = 210103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [210104] = {
    Amount = T.RT_1,
    AttrId = 210104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [230101] = {
    Amount = T.RT_1,
    AttrId = 230101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [230102] = {
    Amount = T.RT_1,
    AttrId = 230102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [230103] = {
    Amount = T.RT_1,
    AttrId = 230103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [230104] = {
    Amount = T.RT_1,
    AttrId = 230104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [240101] = {
    Amount = T.RT_1,
    AttrId = 240101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [240102] = {
    Amount = T.RT_1,
    AttrId = 240102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [240103] = {
    Amount = T.RT_1,
    AttrId = 240103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [240104] = {
    Amount = T.RT_1,
    AttrId = 240104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [310101] = {
    Amount = T.RT_1,
    AttrId = 310101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [310102] = {
    Amount = T.RT_1,
    AttrId = 310102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [310103] = {
    Amount = T.RT_1,
    AttrId = 310103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [310104] = {
    Amount = T.RT_1,
    AttrId = 310104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [310201] = {
    Amount = T.RT_1,
    AttrId = 310201,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [310202] = {
    Amount = T.RT_1,
    AttrId = 310202,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [310203] = {
    Amount = T.RT_1,
    AttrId = 310203,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [310204] = {
    Amount = T.RT_1,
    AttrId = 310204,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [310301] = {
    Amount = T.RT_1,
    AttrId = 310301,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [310302] = {
    Amount = T.RT_1,
    AttrId = 310302,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [310303] = {
    Amount = T.RT_1,
    AttrId = 310303,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [310304] = {
    Amount = T.RT_1,
    AttrId = 310304,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [320101] = {
    Amount = T.RT_1,
    AttrId = 320101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [320102] = {
    Amount = T.RT_1,
    AttrId = 320102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [320103] = {
    Amount = T.RT_1,
    AttrId = 320103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [320104] = {
    Amount = T.RT_1,
    AttrId = 320104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [330101] = {
    Amount = T.RT_1,
    AttrId = 330101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [330102] = {
    Amount = T.RT_1,
    AttrId = 330102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [330103] = {
    Amount = T.RT_1,
    AttrId = 330103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [330104] = {
    Amount = T.RT_1,
    AttrId = 330104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [410101] = {
    Amount = T.RT_1,
    AttrId = 410101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [410102] = {
    Amount = T.RT_1,
    AttrId = 410102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [410103] = {
    Amount = T.RT_1,
    AttrId = 410103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [410104] = {
    Amount = T.RT_1,
    AttrId = 410104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [410201] = {
    Amount = T.RT_1,
    AttrId = 410201,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [410202] = {
    Amount = T.RT_1,
    AttrId = 410202,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [410203] = {
    Amount = T.RT_1,
    AttrId = 410203,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [410204] = {
    Amount = T.RT_1,
    AttrId = 410204,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [420101] = {
    Amount = T.RT_1,
    AttrId = 420101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [420102] = {
    Amount = T.RT_1,
    AttrId = 420102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [420103] = {
    Amount = T.RT_1,
    AttrId = 420103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [420104] = {
    Amount = T.RT_1,
    AttrId = 420104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [420201] = {
    Amount = T.RT_1,
    AttrId = 420201,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [420202] = {
    Amount = T.RT_1,
    AttrId = 420202,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [420203] = {
    Amount = T.RT_1,
    AttrId = 420203,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [420204] = {
    Amount = T.RT_1,
    AttrId = 420204,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [430101] = {
    Amount = T.RT_1,
    AttrId = 430101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [430102] = {
    Amount = T.RT_1,
    AttrId = 430102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [430103] = {
    Amount = T.RT_1,
    AttrId = 430103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [430104] = {
    Amount = T.RT_1,
    AttrId = 430104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [510101] = {
    Amount = T.RT_1,
    AttrId = 510101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [510102] = {
    Amount = T.RT_1,
    AttrId = 510102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [510103] = {
    Amount = T.RT_1,
    AttrId = 510103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [510104] = {
    Amount = T.RT_1,
    AttrId = 510104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [510201] = {
    Amount = T.RT_1,
    AttrId = 510201,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [510202] = {
    Amount = T.RT_1,
    AttrId = 510202,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [510203] = {
    Amount = T.RT_1,
    AttrId = 510203,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [510204] = {
    Amount = T.RT_1,
    AttrId = 510204,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [530101] = {
    Amount = T.RT_1,
    AttrId = 530101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [530102] = {
    Amount = T.RT_1,
    AttrId = 530102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [530103] = {
    Amount = T.RT_1,
    AttrId = 530103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [530104] = {
    Amount = T.RT_1,
    AttrId = 530104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  },
  [540101] = {
    Amount = T.RT_1,
    AttrId = 540101,
    NeedBreak = 1,
    ResourceID = T.RT_2
  },
  [540102] = {
    Amount = T.RT_1,
    AttrId = 540102,
    NeedBreak = 2,
    ResourceID = T.RT_2
  },
  [540103] = {
    Amount = T.RT_1,
    AttrId = 540103,
    NeedBreak = 3,
    ResourceID = T.RT_2
  },
  [540104] = {
    Amount = T.RT_1,
    AttrId = 540104,
    NeedBreak = 4,
    ResourceID = T.RT_2
  }
})
