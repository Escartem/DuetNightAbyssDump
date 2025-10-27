local T = {}
T.RT_1 = {
  [102401] = 1010201,
  [105101] = 1020301
}
T.RT_2 = {
  [101101] = 1010101
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("TestCharGroup", {
  [1101] = {
    CharGroupId = 1101,
    PhantomRuleIdList = T.RT_1,
    TemplateRuleId = T.RT_2
  },
  [2101] = {
    CharGroupId = 2101,
    PhantomRuleIdList = T.RT_1,
    TemplateRuleId = {
      [102101] = 1010101
    }
  },
  [2301] = {
    CharGroupId = 2301,
    PhantomRuleIdList = T.RT_1,
    TemplateRuleId = {
      [102301] = 1010101
    }
  },
  [2401] = {
    CharGroupId = 2401,
    PhantomRuleIdList = {
      [103102] = 1010201,
      [105101] = 1020301
    },
    TemplateRuleId = {
      [102401] = 1010101
    }
  },
  [3101] = {
    CharGroupId = 3101,
    PhantomRuleIdList = T.RT_1,
    TemplateRuleId = {
      [103101] = 1010101
    }
  },
  [3102] = {
    CharGroupId = 3102,
    PhantomRuleIdList = T.RT_1,
    TemplateRuleId = {
      [103102] = 1010101
    }
  },
  [4201] = {
    CharGroupId = 4201,
    PhantomRuleIdList = T.RT_1,
    TemplateRuleId = {
      [104201] = 1010101
    }
  },
  [5101] = {
    CharGroupId = 5101,
    PhantomRuleIdList = {
      [102401] = 1010201,
      [103102] = 1020301
    },
    TemplateRuleId = {
      [105101] = 1010101
    }
  },
  [5301] = {
    CharGroupId = 5301,
    PhantomRuleIdList = T.RT_1,
    TemplateRuleId = {
      [105301] = 1010101
    }
  },
  [9999] = {
    CharGroupId = 9999,
    PhantomRuleIdList = {
      [102101] = 1010202,
      [105301] = 1010103
    },
    TemplateRuleId = T.RT_2
  }
})
