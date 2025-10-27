local TalkState2EventId = {
  [Const.TalkState_IsInTalk] = {nil, nil},
  [Const.TalkState_DisableMonsterSpawn] = {
    nil,
    EventID.TalkEnableMonsterSpawn
  },
  [Const.TalkState_HiddenGameUI] = {
    nil,
    EventID.TalkHiddenGameUI
  }
}
local TalkStateManager_C = {}

function TalkStateManager_C.New()
  local Obj = setmetatable({}, {__index = TalkStateManager_C})
  Obj.TalkStateListTagMap = {
    [Const.TalkState_IsInTalk] = TArray(""),
    [Const.TalkState_DisableMonsterSpawn] = TArray(""),
    [Const.TalkState_HiddenGameUI] = TArray("")
  }
  Obj.TalkStateVarMap = {
    [Const.TalkState_IsInTalk] = false,
    [Const.TalkState_DisableMonsterSpawn] = false,
    [Const.TalkState_HiddenGameUI] = false
  }
  return Obj
end

function TalkStateManager_C:SetTalkStateByTag(StateName, bPush, Tag)
  local TagList = self.TalkStateListTagMap[StateName]
  if not TagList then
    error("SetTalkState TagList is nil " .. StateName)
    return
  end
  if bPush then
    if 0 == TagList:Length() then
      self.TalkStateVarMap[StateName] = true
      if TalkState2EventId[StateName][1] then
        DebugPrint("TalkFireEvent", TalkState2EventId[StateName][1])
        EventManager:FireEvent(TalkState2EventId[StateName][1])
      end
    end
    TagList:AddUnique(Tag)
  else
    if 0 == TagList:Length() then
      return
    end
    if TagList:Find(Tag) then
      TagList:RemoveItem(Tag)
    end
    if TagList:Length() <= 0 then
      self.TalkStateVarMap[StateName] = false
      if TalkState2EventId[StateName][2] then
        DebugPrint("TalkFireEvent", TalkState2EventId[StateName][2])
        EventManager:FireEvent(TalkState2EventId[StateName][2])
      end
    end
  end
end

function TalkStateManager_C:GetTalkState(StateName)
  return self.TalkStateVarMap[StateName]
end

return TalkStateManager_C
