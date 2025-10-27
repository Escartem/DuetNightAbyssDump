local TalkActionData_C = {}

function TalkActionData_C.New(TalkActionId)
  local Obj = setmetatable({}, {})
  local Data = DataMgr.TalkAction[TalkActionId]
  if nil == Data then
    local Message = string.format("TalkActionData_C.New \230\137\167\232\161\140\229\164\177\232\180\165, \229\175\185\232\175\157\229\138\168\228\189\156\231\188\150\229\143\183 %s \229\156\168 DataMgr.TalkAction \228\184\173\228\184\141\229\173\152\229\156\168\227\128\130", TalkActionId)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return nil
  end
  Obj.TalkActionId = TalkActionId
  Obj.IsSpecialAction = Data.IsSpecialAnim
  Obj.ActionMontage = Data.ActionMontage
  Obj.MontageSection = Data.MontageSection
  Obj.BlendInTime = Data.BlendInTime
  Obj.BlendOutTime = Data.BlendOutTime
  Obj.EndLoopMontage = Data.EndLoopMontage
  Obj.EndLoopMontageSection = Data.EndLoopMontageSection
  Obj.IsOnceAction = Data.IsOnceAction
  return Obj
end

local function CreateTalkActionData(TalkActorId, TalkActionId)
  DebugPrint("Play action", TalkActorId, TalkActionId)
  return TalkActionData_C.New(TalkActionId)
end

return {CreateTalkActionData = CreateTalkActionData, TalkActionData_C = TalkActionData_C}
