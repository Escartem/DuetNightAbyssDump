local M = {}
local ETalkNodeFinishType = require("StoryCreator.StoryLogic.StorylineUtils").ETalkNodeFinishType
local Int2Str = {
  [1] = "Out",
  [2] = "Option",
  [3] = "Fail"
}

function M:CreateNode(Flow, TalkTask, Params)
  local FinishType = Params.FinishType
  local OptionIdx = Params.OptionIdx
  local OutportName
  local SetOutportNode = Flow:CreateNode(UEFNode_Delegate)
  SetOutportNode.DebugLog = string.format("SetOutport PortName: %s", OutportName)
  SetOutportNode.OnStart:Add(SetOutportNode, function(Node)
    if not FinishType then
      DebugPrint("Error: TalkDSL SetOutport Func FinishType is Empty!")
      Node:Finish({
        Node.FinishPin
      })
      return
    end
    if "Out" == FinishType or "Out" == Int2Str[FinishType] then
      OutportName = ETalkNodeFinishType.Out
    elseif "Fail" == FinishType or "Fail" == Int2Str[FinishType] then
      OutportName = ETalkNodeFinishType.Fail
    elseif "Option" == FinishType or "Option" == Int2Str[FinishType] then
      OutportName = ETalkNodeFinishType.Option
      if not OptionIdx then
        DebugPrint("Error: TalkDSL SetOutport \233\135\141\232\189\189\229\135\186\229\143\163\231\177\187\229\158\139\228\184\186\233\128\137\233\161\185\239\188\140\228\189\134\230\156\170\229\161\171\229\134\153OptionIdx")
        Node:Finish({
          Node.FinishPin
        })
        return
      end
    end
    if not OutportName then
      DebugPrint("Error: TalkDSL SetOutport Func OutportName is Empty!")
      Node:Finish({
        Node.FinishPin
      })
      return
    end
    TalkTask:SetOutport(OutportName, OptionIdx)
    Node:Finish({
      Node.FinishPin
    })
  end)
  return SetOutportNode
end

return M
