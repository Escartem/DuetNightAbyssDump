local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DetectiveResult", {
  [10000101] = {
    Answers = {
      100003,
      100004,
      100005
    },
    InferenceResultID = 10000101,
    QuestionID = 1000,
    ResultDetail = "{\"QuestionSucc\"}",
    ResultTips = "TextMap_ResultTips_10010101"
  },
  [10010101] = {
    Answers = {100101},
    InferenceResultID = 10010101,
    QuestionID = 1001,
    ResultDetail = "{\"QuestionSucc\"}",
    ResultTips = "TextMap_ResultTips_10010101"
  },
  [10020101] = {
    Answers = {100203},
    InferenceResultID = 10020101,
    QuestionID = 1002,
    ResultDetail = "{\"QuestionSucc\"}",
    ResultTips = "TextMap_ResultTips_10020101"
  },
  [10030101] = {
    Answers = {100303},
    InferenceResultID = 10030101,
    MainClueUnlock = {100003},
    QuestionID = 1003,
    ResultDetail = "{\"QuestionSucc\"}",
    ResultTips = "TextMap_ResultTips_10030101"
  },
  [10040101] = {
    Answers = {100404},
    InferenceResultID = 10040101,
    MainClueUnlock = {100004},
    QuestionID = 1004,
    ResultDetail = "{\"QuestionSucc\"}",
    ResultTips = "TextMap_ResultTips_10040101"
  },
  [10050101] = {
    Answers = {100503},
    InferenceResultID = 10050101,
    MainClueUnlock = {100005},
    QuestionID = 1005,
    ResultDetail = "{\"QuestionSucc\"}",
    ResultTips = "TextMap_ResultTips_10050101"
  },
  [20010101] = {
    Answers = {
      200104,
      200105,
      200106
    },
    InferenceResultID = 20010101,
    QuestionID = 2001,
    ResultDetail = "{\"QuestionSucc\"}",
    ResultTips = "TextMap_ResultTips_20010101"
  },
  [20020101] = {
    Answers = {200211},
    InferenceResultID = 20020101,
    QuestionID = 2002,
    ResultDetail = "{\"QuestionSucc\"}",
    ResultTips = "TextMap_ResultTips_20020101"
  },
  [20030101] = {
    Answers = {200307},
    InferenceResultID = 20030101,
    QuestionID = 2003,
    ResultDetail = "{\"QuestionSucc\"}",
    ResultTips = "TextMap_ResultTips_20030101"
  }
})
