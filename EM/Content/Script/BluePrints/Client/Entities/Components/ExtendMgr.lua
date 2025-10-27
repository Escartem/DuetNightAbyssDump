local Component = {}

function Component:SetRefreshRobberMonster(NewValue)
  self:CallServerMethod("SetRefreshRobberMonster", NewValue)
end

function Component:SetTalkTag(TargetTag, TagValueType, ClientCallback)
  local function Callback(Ret)
    if ErrorCode:Check(Ret) and ClientCallback then
      ClientCallback()
    end
  end
  
  local Results = Utils.Split(TagValueType, "_")
  local ResultValue = tonumber(Results[2])
  if not (DataMgr.TalkTag[TargetTag] and DataMgr.TalkTag[TargetTag].TalkTagId == TargetTag and DataMgr.TalkTag[TargetTag].Value and ResultValue) or not DataMgr.TalkTag[TargetTag].Value[ResultValue] then
    local Message = string.format("SetTalkTag \229\164\177\232\180\165: Tag: %s, Value: %s", TargetTag, TagValueType)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  local TagValue = DataMgr.TalkTag[TargetTag].Value[ResultValue]
  self.TalkTags[TargetTag] = TagValue
  self:CallServer("SetTalkTag", Callback, TargetTag, TagValueType)
end

function Component:UnSetTalkTag(TargetTag, ClientCallback)
  local function Callback(Ret)
    if ErrorCode:Check(Ret) and ClientCallback then
      ClientCallback()
    end
  end
  
  if not DataMgr.TalkTag[TargetTag] or DataMgr.TalkTag[TargetTag].TalkTagId ~= TargetTag then
    local Message = string.format("UnSetTalkTag \229\164\177\232\180\165: Tag: %s", TargetTag)
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "\229\175\185\232\175\157\232\191\144\232\161\140\230\151\182\229\135\186\233\148\153", Message)
    return
  end
  self.TalkTags[TargetTag] = nil
  self:CallServer("UnSetTalkTag", Callback, TargetTag)
end

function Component:GetTalkTag(TargetTag)
  return self.TalkTags[TargetTag]
end

return Component
