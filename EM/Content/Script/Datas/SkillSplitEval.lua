local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SkillSplitEval", {
  SkillEffects = {
    [32] = true,
    [33] = true,
    [150213] = true,
    [150214] = true,
    [150224] = true,
    [150225] = true,
    [210263] = true,
    [310111] = true,
    [310131] = true,
    [430113] = true,
    [430115] = true,
    [430119] = true,
    [2050515] = true
  }
})
