local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("DetectiveQuestion", {
  [1000] = {
    ProbablyNeededAnswers = {
      100003,
      100004,
      100005
    },
    QuestName = "Episode_02",
    QuestionID = 1000,
    Tips = "TextMap_Inference_1000"
  },
  [1001] = {
    AutoClose = true,
    ParentQuestionID = 1000,
    ProbablyNeededAnswers = {100101},
    QuestionID = 1001,
    Tips = "TextMap_Inference_1001"
  },
  [1002] = {
    AutoClose = true,
    ParentQuestionID = 1000,
    ProbablyNeededAnswers = {
      100201,
      100202,
      100203
    },
    QuestionID = 1002,
    Tips = "TextMap_Inference_1002"
  },
  [1003] = {
    AutoClose = true,
    ParentQuestionID = 1000,
    ProbablyNeededAnswers = {
      100301,
      100302,
      100303
    },
    QuestionID = 1003,
    Tips = "TextMap_Inference_1003"
  },
  [1004] = {
    AutoClose = true,
    ParentQuestionID = 1000,
    ProbablyNeededAnswers = {
      100401,
      100402,
      100403,
      100404
    },
    QuestionID = 1004,
    Tips = "TextMap_Inference_1004"
  },
  [1005] = {
    AutoClose = true,
    ParentQuestionID = 1000,
    ProbablyNeededAnswers = {
      100501,
      100502,
      100503
    },
    QuestionID = 1005,
    Tips = "TextMap_Inference_1005"
  },
  [2001] = {
    ProbablyNeededAnswers = {
      200101,
      200102,
      200103,
      200104,
      200105,
      200106,
      200107,
      200108
    },
    QuestName = "Name_200206",
    QuestionID = 2001,
    Tips = "TextMap_Inference_2001"
  },
  [2002] = {
    ProbablyNeededAnswers = {
      200201,
      200202,
      200203,
      200204,
      200205,
      200206,
      200207,
      200208,
      200209,
      200210,
      200211
    },
    QuestName = "Name_200233",
    QuestionID = 2002,
    Tips = "TextMap_Inference_2002"
  },
  [2003] = {
    ProbablyNeededAnswers = {
      200301,
      200302,
      200303,
      200304,
      200305,
      200306,
      200307
    },
    QuestName = "Name_200305",
    QuestionID = 2003,
    Tips = "TextMap_Inference_2003"
  }
})
