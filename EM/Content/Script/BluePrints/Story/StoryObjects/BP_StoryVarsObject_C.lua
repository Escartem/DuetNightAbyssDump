local BP_StoryVarsObject_C = Class()

function BP_StoryVarsObject_C:TryInitVars()
  self:ClearVars()
  self:InitVars()
end

function BP_StoryVarsObject_C:InitVars()
  local Avatar = GWorld:GetAvatar()
  if not Avatar then
    return false
  end
  self.InitFlag = true
  for VarName, Value in pairs(Avatar.StoryVariable) do
    local VarInfo = DataMgr.StoryVariable[VarName]
    if VarInfo then
      self:RawSetInt(VarName, Value)
    end
  end
end

function BP_StoryVarsObject_C:UpdateGlobalVariable(VarName, Value)
  local VarInfo = DataMgr.StoryVariable[VarName]
  if VarInfo and VarInfo.IsGlobal then
    local Avatar = GWorld:GetAvatar()
    if Avatar then
      if nil == Value then
        Avatar:RemoveStoryVariable(VarName, Value)
      else
        Avatar:UpdateStoryVariable(VarName, Value)
      end
    end
  end
end

return BP_StoryVarsObject_C
