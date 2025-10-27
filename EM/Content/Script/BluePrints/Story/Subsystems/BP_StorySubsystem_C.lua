local BP_StorySubsystem_C = Class()

function BP_StorySubsystem_C:TryInitVars()
  local StoryVarsObject = self:GetStoryVarsObject()
  if not StoryVarsObject then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "StorySubsystem\233\148\153\232\175\175", "\230\137\190\228\184\141\229\136\176StoryVarsObject\239\188\140\232\129\148\231\179\187\231\168\139\229\186\143\230\142\146\230\159\165")
    return
  end
  StoryVarsObject:TryInitVars()
end

function BP_StorySubsystem_C:ExecuteBlueprintVarFunction(FunctionName, VarName, Vars, QuestChainId, NeedReturnBoolean)
  local VarValue = self:GetInt(VarName)
  local StoryVarsObject = self:GetStoryVarsObject()
  if not StoryVarsObject then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "StorySubsystem\233\148\153\232\175\175", "\230\137\190\228\184\141\229\136\176StoryVarsObject\239\188\140\232\129\148\231\179\187\231\168\139\229\186\143\230\142\146\230\159\165")
    return
  end
  local VarInfo = DataMgr.StoryVariable[VarName]
  if not VarInfo then
    local _Str = "\229\143\152\233\135\143:[" .. tostring(VarName) .. "]\233\156\128\232\166\129\231\142\176\229\156\168StoryVariable.xlsx\228\184\173\229\133\136\229\163\176\230\152\142"
    if QuestChainId and 0 ~= QuestChainId then
      _Str = _Str .. ",QuestChainId:[" .. tostring(QuestChainId) .. "]"
    end
    _Str = _Str .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165."
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "StorySubsystem\233\148\153\232\175\175", _Str)
    return
  end
  if VarInfo.QuestChainId and VarInfo.QuestChainId ~= QuestChainId then
    local _Str = "\229\143\152\233\135\143:[" .. tostring(VarName) .. "]\228\184\141\232\131\189\229\156\168QuestChain:[" .. tostring(QuestChainId) .. "]\228\184\173\228\189\191\231\148\168\239\188\129\232\161\168\233\135\140\229\161\171\233\135\140\229\174\131\229\143\170\230\148\175\230\140\129\229\156\168QuestChain:[" .. tostring(VarInfo.QuestChainId) .. "]\228\184\173\228\189\191\231\148\168\239\188\129"
    _Str = _Str .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165."
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "StorySubsystem\233\148\153\232\175\175", _Str)
    return
  end
  local ExtraVars = {
    VarName = VarName,
    VarValue = VarValue,
    QuestChainId = QuestChainId or 0
  }
  return StoryVarsObject:ExecuteBlueprintFunction(FunctionName, Vars, ExtraVars, NeedReturnBoolean)
end

function BP_StorySubsystem_C:ExecuteBlueprintFunction(FunctionName, Vars)
  local StoryVarsObject = self:GetStoryVarsObject()
  if not StoryVarsObject then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "StorySubsystem\233\148\153\232\175\175", "\230\137\190\228\184\141\229\136\176StoryVarsObject\239\188\140\232\129\148\231\179\187\231\168\139\229\186\143\230\142\146\230\159\165")
    return
  end
  return StoryVarsObject:ExecuteBlueprintFunction(FunctionName, Vars)
end

return BP_StorySubsystem_C
