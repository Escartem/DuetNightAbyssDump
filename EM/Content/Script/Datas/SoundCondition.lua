local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("SoundCondition", {
  [310101] = {
    ConditionId = 310101,
    FuncName = "LinenSkill02"
  },
  [530101] = {
    ConditionId = 530101,
    FuncName = "SaiqiSkill02"
  }
})
