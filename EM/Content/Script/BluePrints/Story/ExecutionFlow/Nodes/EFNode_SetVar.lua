local M = {}

function M:CreateNode(Flow, TalkTask, Params)
  local DialogueId = Flow.DialogueId
  local TalkTaskData = TalkTask.TalkTaskData
  local QuestChainId = TalkTaskData.QuestChainId
  local VarName = Params.Name
  local VarValue = Params.Value
  if not VarName or "" == VarName then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "SetVar\232\132\154\230\156\172\229\135\186\233\148\153", "\230\178\161\230\156\137\229\161\171\229\134\153VarName, DialogueId:" .. tostring(DialogueId) .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165.")
    return
  end
  local VarInfo = DataMgr.StoryVariable[VarName]
  if not VarInfo then
    local _Str = "\229\143\152\233\135\143:[" .. tostring(VarName) .. "]\233\156\128\232\166\129\231\142\176\229\156\168StoryVariable.xlsx\228\184\173\229\133\136\229\163\176\230\152\142"
    if QuestChainId and 0 ~= QuestChainId then
      _Str = _Str .. ",QuestChainId:[" .. tostring(QuestChainId) .. "]"
    end
    _Str = _Str .. ",DialogueId:" .. tostring(DialogueId) .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165."
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "SetVar\232\132\154\230\156\172\229\135\186\233\148\153", _Str)
    return
  end
  if VarInfo.QuestChainId and VarInfo.QuestChainId ~= QuestChainId then
    local _Str = "\229\143\152\233\135\143:[" .. tostring(VarName) .. "]\228\184\141\232\131\189\229\156\168QuestChain:[" .. tostring(QuestChainId) .. "]\228\184\173\228\189\191\231\148\168\239\188\129\232\161\168\233\135\140\229\161\171\233\135\140\229\174\131\229\143\170\230\148\175\230\140\129\229\156\168QuestChain:[" .. tostring(VarInfo.QuestChainId) .. "]\228\184\173\228\189\191\231\148\168\239\188\129"
    _Str = _Str .. ",DialogueId:" .. tostring(DialogueId) .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165."
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "SetVar\232\132\154\230\156\172\233\148\153\232\175\175", _Str)
    return
  end
  local SetVarNode = Flow:CreateNode(UEFNode_Delegate)
  SetVarNode.DebugLog = string.format("SetVar Name: %s, Value: %s", VarName, VarValue)
  SetVarNode.OnStart:Add(SetVarNode, function(Node)
    local StorySubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UStorySubsystem:StaticClass())
    StorySubsystem:SetInt(VarName, VarValue)
    Node:Finish({
      Node.FinishPin
    })
  end)
  SetVarNode.OnSkip:Add(SetVarNode, function(Node)
    Node:Finish({
      Node.FinishPin
    })
  end)
  return SetVarNode
end

return M
