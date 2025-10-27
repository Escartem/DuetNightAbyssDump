local T = {}
T.RT_1 = {}
local ReadOnly = (DataMgr or {}).ReadOnly or function(n, x)
  return x
end
return ReadOnly("FlowExport", {
  ["032D57A84AC9692F53E1FB85E499AE07"] = {
    Connect = T.RT_1,
    GUID = "032D57A84AC9692F53E1FB85E499AE07",
    NodeType = "FlowNode_TalkFinish",
    TalkId = 120303
  },
  ["170C317D4D6CA6B2B9A3C4845CB27AD5"] = {
    Connect = {
      Out = "7B436A6540C96F33EF4B9987622987B2"
    },
    GUID = "170C317D4D6CA6B2B9A3C4845CB27AD5",
    NodeType = "FlowNode_Start",
    TalkId = 510122
  },
  ["185964F945009410E3995FBF80FA1F25"] = {
    Connect = T.RT_1,
    GUID = "185964F945009410E3995FBF80FA1F25",
    NodeType = "FlowNode_TalkFinish",
    TalkId = 510122
  },
  ["2148E13249A44E4DBE7002B8BE5D6BAF"] = {
    Connect = {
      End = "032D57A84AC9692F53E1FB85E499AE07"
    },
    GUID = "2148E13249A44E4DBE7002B8BE5D6BAF",
    NodeParams = {
      DialogueIds = {
        12030301,
        12030302,
        12030303,
        12030304,
        12030305,
        12030306,
        12030307,
        12030308,
        12030309
      }
    },
    NodeType = "FlowNode_Dialogue",
    TalkId = 120303
  },
  ["23A916F341748B24E74E2EA2886D0F83"] = {
    Connect = {
      Out = "2148E13249A44E4DBE7002B8BE5D6BAF"
    },
    GUID = "23A916F341748B24E74E2EA2886D0F83",
    NodeType = "FlowNode_Start",
    TalkId = 120303
  },
  ["23FE2C0042187640F26D7B8F4056E8F0"] = {
    Connect = {
      Accept = "85EFB52A4465B37880EA6DB7EAED0337",
      Cancel = "185964F945009410E3995FBF80FA1F25"
    },
    GUID = "23FE2C0042187640F26D7B8F4056E8F0",
    NodeType = "FlowNode_CatName",
    TalkId = 510122
  },
  ["7B436A6540C96F33EF4B9987622987B2"] = {
    Connect = {
      End = "23FE2C0042187640F26D7B8F4056E8F0"
    },
    GUID = "7B436A6540C96F33EF4B9987622987B2",
    NodeParams = {
      DialogueIds = {51012201}
    },
    NodeType = "FlowNode_Dialogue",
    TalkId = 510122
  },
  ["85EFB52A4465B37880EA6DB7EAED0337"] = {
    Connect = {
      End = "185964F945009410E3995FBF80FA1F25"
    },
    GUID = "85EFB52A4465B37880EA6DB7EAED0337",
    NodeParams = {
      DialogueIds = {
        51012202,
        51012203,
        51012204
      }
    },
    NodeType = "FlowNode_Dialogue",
    TalkId = 510122
  }
})
