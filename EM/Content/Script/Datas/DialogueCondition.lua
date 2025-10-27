local T = {}
T.RT_1 = {QuestChainId = 100306}
T.RT_2 = {
  QuestChainFinish = T.RT_1
}
T.RT_3 = {
  QuestChainUnFinish = T.RT_1
}
T.RT_4 = {}
T.RT_5 = {TalkTriggerId = 500080}
T.RT_6 = {
  ImprComp = T.RT_5
}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DialogueCondition", {
  [51007572] = T.RT_6,
  [51007574] = T.RT_6,
  [800305081] = {
    IsBoy = T.RT_4
  },
  [800305082] = {
    IsGirl = T.RT_4
  },
  [901900015] = {
    QuestChainFinish = {QuestChainId = 110109}
  },
  [902000011] = T.RT_2,
  [902000012] = T.RT_2,
  [902100011] = T.RT_3,
  [902100012] = T.RT_3,
  [902100013] = T.RT_3,
  [902100015] = T.RT_2,
  [902100016] = T.RT_2,
  [902100017] = T.RT_2
})
