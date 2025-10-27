local ExecuteBlueprintFunctionSetVarNode = Class("StoryCreator.StoryLogic.StorylineNodes.BaseQuestNode")

function ExecuteBlueprintFunctionSetVarNode:Init()
  self.FunctionName = nil
  self.VarName = nil
  self.VarInfos = {}
end

function ExecuteBlueprintFunctionSetVarNode:Execute()
  if not self.VarName or self.VarName == "" then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "ExecuteBlueprintFunctionSetVarNode\232\138\130\231\130\185\229\135\186\233\148\153", "\230\178\161\230\156\137\229\161\171\229\134\153VarName, FileName:" .. tostring(self.Context.FileName) .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165.")
    return
  end
  local VarInfo = DataMgr.StoryVariable[self.VarName]
  if not VarInfo then
    local _Str = "\229\143\152\233\135\143:[" .. tostring(self.VarName) .. "]\233\156\128\232\166\129\231\142\176\229\156\168StoryVariable.xlsx\228\184\173\229\133\136\229\163\176\230\152\142"
    if self.QuestChainId and 0 ~= self.QuestChainId then
      _Str = _Str .. ",QuestChainId:[" .. tostring(self.QuestChainId) .. "]"
    end
    _Str = _Str .. ",FileName:" .. tostring(self.Context.FileName) .. ",\232\175\183\231\173\150\229\136\146\230\142\146\230\159\165."
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "ExecuteBlueprintFunctionSetVarNode\232\138\130\231\130\185\229\135\186\233\148\153", _Str)
    return
  end
  local NewVarInfos = {}
  for k, v in pairs(self.VarInfos) do
    local _VarName = v.VarName
    local _VarValue = v.VarValue
    if tonumber(_VarValue) then
      NewVarInfos[_VarName] = tonumber(_VarValue)
    else
      NewVarInfos[_VarName] = _VarValue
    end
  end
  local StorySubsystem = UE4.USubsystemBlueprintLibrary.GetGameInstanceSubsystem(GWorld.GameInstance, UStorySubsystem:StaticClass())
  local Ret = StorySubsystem:ExecuteBlueprintVarFunction(self.FunctionName, self.VarName, NewVarInfos, self.QuestChainId, false)
  if type(Ret) ~= "number" or 0 ~= Ret % 1 then
    UStoryLogUtils.PrintToFeiShu(GWorld.GameInstance, "ExecuteBlueprintFunctionSetVarNode\232\138\130\231\130\185\229\135\186\233\148\153", "\229\135\189\230\149\176[" .. tostring(self.FunctionName) .. "]\231\154\132\232\191\148\229\155\158\229\128\188\228\184\141\230\152\175int\231\177\187\229\158\139")
    return nil
  end
  StorySubsystem:SetInt(self.VarName, Ret)
  return nil
end

function ExecuteBlueprintFunctionSetVarNode:Clear()
end

function ExecuteBlueprintFunctionSetVarNode:OnQuestlineFinish()
end

function ExecuteBlueprintFunctionSetVarNode:OnQuestlineSuccess()
end

function ExecuteBlueprintFunctionSetVarNode:OnQuestlineFail()
end

return ExecuteBlueprintFunctionSetVarNode
